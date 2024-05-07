resource_wait_by_planname() {
        plan=$1
        cat $TMP_DIR/resource_queue.dat | awk -v planname="$plan" 'BEGIN{RS="\n\n"; FS="\n";}
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

plan=$1
resource_wait_by_planname $plan
