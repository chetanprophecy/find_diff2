#!/bin/bash

########################################################################################################
# Usage : waiting_on_resource \$planname $DEBUG_MODE"                                                  #
#         Do not include path in planname"                                                             #
#         DEBUG_MODE is either Y or N"                                                                 #
########################################################################################################

resource_wait_by_planname() {
        plan=$1
        resource_queue_file=$2
        if [ -z "$plan" ] ; then
                echo "resource_wait_by_planname : Plan parameter is blank." >&2
                exit 1
        fi
        if [ -z "$resource_queue_file" ] ; then
                echo "resource_wait_by_planname : Resource_queue_file parameter is blank." >&2
                exit 1
        fi
        cat $resource_queue_file | awk -v planname="$plan" 'BEGIN{RS="\n\n"; FS="\n"; ORS="\n\n"}
        {
                 split($1,a,"Plan: ");
                 split(a[2],b);
                 match(b[1],planname);
                 if( RSTART > 0 && RLENGTH == length(planname) )
                 print $0;
         }' | awk 'function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
        function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
        function trim(s)  { return rtrim(ltrim(s)); }
        BEGIN{RS="\n\n"; FS="\n";}
        {
                 task=$2;
                 for(i=3;i<=NF;i++) {
                 match($i,/[^\(]*\(([^)]*)\)[^=]*=([^,]*)[^=]*=([^,]*)[^=]*=([0-9]*)/,b);
                 poolname = trim(b[1]);
                 resource=trim(b[2]);
                 instance = trim(b[3]);
                 quantity = trim(b[4]);
                 print task "|" poolname "|" resource "|" instance "|" quantity ;
        }
        }'
}

resources_occupied_by_plan(){
        plan=$1
        cat $TMP_DIR/resource_hold.dat | awk -v planname="$plan" 'BEGIN{ ORS="\n\n"; OFS="\n"; }
        {
                record = $0;
                while( getline tmp < "-" ) {
                        if( index(tmp, "CLIENT ID ") == 1){
                                split(record,fields,"\n");
                                split(fields[1], arr,"Plan: ");
                                split(arr[2],b," ");
                                match(b[1],planname)
                                if(RSTART > 0 && RLENGTH != -1 )
                                        print record;
                                record=tmp;
                        } else {
                                record = record "\n" tmp ;
                        }
                }
        }'
}

plan_task_resource() {
        awk 'function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
        function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
        function trim(s)  { return rtrim(ltrim(s)); }
        function print_record(record){
                split(record,fields,"\n");
                split(fields[1], arr,"Plan: ");
                split(arr[2],b," ");
                planname=b[1];
                if(planname=="constraint_server"){
                   record=tmp;
                   len=1;
                   return;
                }
                task_flag=0;
                for(i=2;i<=len; i++){
                        if( index(fields[i],"HANDLE: ") == 1){
                                task_flag=1;
                        }else if( task_flag==1){
                                task_flag=0;
                                taskname=fields[i];
                        }else {
                                match(fields[i],/[^\(]*\(([^)]*)\)[^=]*=([^,]*)[^=]*=([^,]*)[^=]*=([0-9]*)/,res);
                                poolname = trim(res[1]);
                                resource=trim(res[2]);
                                instance = trim(res[3]);
                                quantity = trim(res[4]);
                                print planname "|" taskname "|" poolname "|" resource "|" instance "|" quantity;
                        }
                }
        }
        {
                record=$0;
                len=1;
                #print "DEBUG: $0 = " $0;
                while( getline tmp ) {
                        #print "DEBUG: READ LINE : " tmp;
                        if( index(tmp, "CLIENT ID ") == 1){
                                #print "DEBUG: len = " len;
                                print_record(record);
                                record=tmp;
                                len=1;
                        }else{
                                record = record "\n" tmp ;
                                len++;
                        }
                }
        }END{print_record(record);}' $TMP_DIR/resource_hold.dat
}

who_is_holding_up_my_resource(){
        waiting_plan=$1
        pid=$$
        mkdir -p /tmp/$USER/$pid/
        export TMP_DIR=/tmp/$USER/$pid/
        resource-admin queue > $TMP_DIR/pre_resource_queue.dat # pre is taken before resource_hold
        resource-admin holdings > $TMP_DIR/resource_hold.dat
        resource-admin queue > $TMP_DIR/post_resource_queue.dat # post is talen after resoure hold
        resource_wait_by_planname $waiting_plan $TMP_DIR/pre_resource_queue.dat > $TMP_DIR/waiting_for_resource_pre.dat
        resource_wait_by_planname $waiting_plan $TMP_DIR/post_resource_queue.dat > $TMP_DIR/waiting_for_resource_post.dat
        sort $TMP_DIR/waiting_for_resource_pre.dat > $TMP_DIR/waiting_for_resource_pre_sorted.dat
        sort $TMP_DIR/waiting_for_resource_post.dat > $TMP_DIR/waiting_for_resource_post_sorted.dat
        comm -12 $TMP_DIR/waiting_for_resource_pre_sorted.dat $TMP_DIR/waiting_for_resource_post_sorted.dat > $TMP_DIR/waiting_for_resource.dat
        plan_task_resource > $TMP_DIR/plan_task_resource_relation.dat
        unique_task_list=`cut -d "|" -f 1 $TMP_DIR/waiting_for_resource.dat | sort -u `
        echo "Planname : " $waiting_plan
        echo "Waiting Tasks : "
        echo "$unique_task_list" | while read -r task
        do
                echo -e "\t- $task"
        done

        awk -F "|" '{print $2 "," $3 "|" $0 ; }' $TMP_DIR/waiting_for_resource.dat | sort -u -t "|" -k 1,1 > $TMP_DIR/waiting_for_resource_join_ready.dat
        awk -F "|" '{ print $3 "," $4 "|" $0 ; }' $TMP_DIR/plan_task_resource_relation.dat > $TMP_DIR/plan_task_resource_relation_join_ready.dat
        #The format for join output is
        #waiting_task|resource_pool|resource_name|required_qty|resource_holding_plan|resource_holding_task|quantity_held
        join -t "|" -1 1 -2 1 -o 1.2,1.3,1.4,1.6,2.2,2.3,2.7 <( sort -t "|" -k 1,1 $TMP_DIR/waiting_for_resource_join_ready.dat ) <( sort -t "|" -k 1,1 $TMP_DIR/plan_task_resource_relation_join_ready.dat ) > $TMP_DIR/joined_file.dat
        echo "$unique_task_list" | while read -r task
        do
                echo "$task is waiting for resources :"
                awk -F "|" 'BEGIN{prev_resource="";prev_pool="";}{
                        resource=$3;
                        pool=$2;
                        if( prev_resource != resource || prev_pool != pool ) {
                                print "\t- \033[1;34m" $4 "\033[0m quantities required of \033[1;31m" $3 "\033[0m resource from pool \033[1;32m" $2 "\033[0m";
                                print "\t\tThis resource is currently allocated to :"
                                prev_resource=resource;
                                prev_pool=pool;
                        }
                        print "\t\t- \033[1;34m" $7 "\033[0m qty to task \033[1;31m" $6 "\033[0m of plan \033[1;32m" $5 "\033[0m";
                }' <( grep -F "$task" $TMP_DIR/joined_file.dat | sort -t "|" -k 2,3 )
        done
        if [ $DEBUG != 'Y' ]
        then
                #clean up /tmp directory
                rm -rf $TMP_DIR
                #rmdir $TMP_DIR
        fi
}

if [ $# -ne 2 ]
then
        echo "Usage : waiting_on_resource \$planname $DEBUG_MODE"
        echo "        Do not include path in planname"
        echo "        DEBUG_MODE is either Y or N"
        exit 1
fi

if [ -z "$AB_HOME" ] ; then
	echo " AB_HOME is not set. "
	echo "exiting ... "
	exit 1
fi

plan=$1
typeset -u DEBUG=$2
who_is_holding_up_my_resource $plan

