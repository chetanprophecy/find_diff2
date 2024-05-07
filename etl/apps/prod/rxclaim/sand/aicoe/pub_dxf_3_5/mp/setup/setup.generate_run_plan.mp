@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|5|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|710|rel_count|1259|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|AB_GRAPH_RUN_MODE|batch|3|1|REKl|The graph run mode.|{0|}}
{30001002|XXparameter|___Intermediate_PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|PRIVATE_DML|$AI_DML // Must be set in the intermediate pset.|3|9|REFK|Path to the private project's DML directory.  Used to derive other private project directories.|{0|}}
{30001002|XXparameter|PRIVATE_META|$PRIVATE_DML/../meta|3|9|RK|Path to the private project's meta directory.|{0|}}
{30001002|XXparameter|PRIVATE_PSET|$PRIVATE_DML/../pset|3|9|RK|Path to the private project's parameter set directory.|{0|}}
{30001002|XXparameter|PROJECT_NM|$[begin
let string("") v_project_dml_path=PRIVATE_DML;
let int length_of_project_paths=length_of(string_split(PRIVATE_DML,"/"));
let string("") project_nm=string_split(PRIVATE_DML,"/")[length_of_project_paths -2 ];

result :: project_nm;
end ]|3|9|K|Name of project |{0|}}
{30001002|XXparameter|PRIVATE_RUN|$PRIVATE_DML/../run|3|9|RK|Path to the private project's run directory.|{0|}}
{30001002|XXparameter|___Runtime_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|PARTIAL_PSET||3|9|FK|The pset for partial plan generation.  The partial plan will include that step and all of its predecessor and successor tasks, stopping at the loads to the DB.  Use the ENTIRE EME path as a parameter - eg:  /Projects/edw/rxtrack_dm/pset/get.rxtctrfil/get.rxtctrfil.rt200p.pset|{0|}}
{30001002|XXparameter|DATALAKE_GET_PSET_IDENTIFIER_LIST|rxclaim_ctrx\|rxclaim_orx|3|9|FK|@{0|}}
{30001002|XXparameter|GENERATE_PARTIAL_PLAN|$[ PARTIAL_PSET != "" ]|1|9|RK|Whether to generate a partial plan instead of a complete plan: (Binary: 0=false 1=true)|{0|}}
{30001002|XXparameter|INSTANCE_NAME|$[ if ( PARTIAL_PSET == "" ) "all" else "partial" + (string("")) next_in_sequence() ]|3|9|RFK|A unique name for this run of the plan generator.  Used to make sure data files do not collide if run in parallel.|{0|}}
{30001002|XXparameter|FINAL_INSTANCE_NM|$[ INSTANCE_NAME +".generated"]|3|9|K|@{0|}}
{30001002|XXparameter|ALL_KEYING_PSET_VEC|AB_PARAMETER_ENV|3|10|Kd|@{0|}}
{30001002|XXparameter|KEYING_PSET_NM|$[begin
let int len=length_of(ALL_KEYING_PSET_VEC);
let int i=0;
let string("") v_keying_pset_nm="";
for (i, i< len ) 
   begin block search_keying
         if(string_index(ALL_KEYING_PSET_VEC[i],"orx_f_mpd_claim_trx_hist"))
                begin
                  v_keying_pset_nm=ALL_KEYING_PSET_VEC[i];
                  exit search_keying ;
                end
   end block search_keying 

result :: v_keying_pset_nm ;

end ]|3|9|FK|@{0|}}
{30001002|XXparameter|PARTIAL_PSET_VEC|$[string_split_no_empty(PARTIAL_PSET,"\\r\\n")]|3|9|K|@{0|}}
{30001002|XXparameter|NOT_NEEDED_PSET_FILTER_EXPR|not string_index(pset_file_name, "placeholders.pset")
and 
not string_index(pset_file_name, "get.clmprdfil")
and 
not string_index(pset_file_name, "get.rxaprdfil")
and 
not string_index(pset_file_name, "get.comprdfil")
and 
not string_like(pset_file_name,"%interim.%")
and
 not string_like(pset_file_name,"%rxtcombo%")|3|9|FK|@{0|}}
{30001002|XXparameter|LOOKUP_EXCLUDE_PATTERN||3|9|FK|Use this to break loops on gets that are only used as lookups.  It prevents a loop back from a table write back to the get.  Just put in the string - no quotes necessary- like lookup_hist or something like that, and make sure the DA/appconf developers use that naming convention for that class of gets.  This parm uses naming convention, so it must be exactly the same.|{0|}}
{30001002|XXparameter|!ab_compatibility|3.5.1.0|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|5|1|1|Hnl|@{0|}}
{30001002|XXparameter|PRIVATE_SUBJECT_AREA_NM|$["ids_" + string_split(AI_DML,"/")[length_of(string_split(AI_DML,"/")) -2 ] ]|3|9|FK|Subject area name to filter dimension only for application|{0|}}
{30001002|XXparameter|CONF_DIM_RESOURCE_FILE|$AI_SERIAL_TEMP/conf_dimension.txt|3|9|RFK|Confomred dimension pool file to control dim load concurrency|{0|}}
{30001002|XXparameter|PRIV_DIM_POOL_FILE|$[AI_SERIAL_TEMP + "/orca_"+ PROJECT_NM + "_priv_dimension_resource_pool.txt" ]|3|9|REK|Private Dimension resource file|{0|}}
{30001002|XXparameter|APP_ETL_LIMIT_POOL_FILE|$[AI_SERIAL_TEMP + "/orca_"+ PROJECT_NM + "_limit_pool.txt" ]|3|9|K|@{0|}}
{30001002|XXparameter|CHECK_INACTIVE_PSET_LIST_FILE|$[file_information(AI_META + "/inactive_pset_list.dat").found]|3|9|RK|If this file is not present touch a zero byte file in lookup creation task|{0|}}
{30001002|XXparameter|CHECK_DB_RESOURCE_POOL_FILE|$[file_information(AI_META + "/lookup.db_resource_pool.txt").found]|3|9|REK|@{0|}}
{30001002|XXparameter|CONFORMED_DIM_POOL_LOC|$[PUB_RESOURCE_RESOURCE  +  "/conf_dimension.pool"]|3|9|EK|Actual pool location |{0|}}
{30001002|XXparameter|CONFORMED_DIM_POOL_LOC_EME|$["/Projects/aicoe/pub_resource/resource" +  "/conf_dimension.pool"]|3|9|EK|Actual pool location |{0|}}
{30001002|XXparameter|PRIV_DIM_POOL_LOC|$[PUB_RESOURCE_RESOURCE + "/orca_"+ PROJECT_NM + "_priv_dimension.pool"]|3|9|EK|Actual pool location |{0|}}
{30001002|XXparameter|PRIV_DIM_POOL_LOC_EME|$["/Projects/aicoe/pub_resource/resource"+ "/orca_"+ PROJECT_NM + "_priv_dimension.pool"]|3|9|EK|Actual pool location |{0|}}
{30001002|XXparameter|APP_LIMIT_POOL_LOC|$[PUB_RESOURCE_RESOURCE + "/orca_"+ PROJECT_NM + "_limit.pool"]|3|9|EK|Actual pool location |{0|}}
{30001002|XXparameter|APP_LIMIT_POOL_LOC_EME|$["/Projects/aicoe/pub_resource/resource" + "/orca_"+ PROJECT_NM + "_limit.pool"]|3|9|EK|Actual pool location |{0|}}
{30001002|XXparameter|IS_APP_LIMIT_POOL_LOC_EME_EXIST|$(eme_present=`air object ls  "$\{APP_LIMIT_POOL_LOC_EME\}" `
if [ -z "$\{eme_present\}"] ;then
  echo "N"
  else 
   echo "Y"
fi 
)|3|9|EK|@{0|}}
{30001002|XXparameter|IS_CONFORMED_DIM_POOL_LOC_EME_EXIST|$(eme_present=`air object ls  "$\{CONFORMED_DIM_POOL_LOC_EME\}" `
if [ -z "$\{eme_present\}"] ;then
  echo "N"
  else 
   echo "Y"
fi 
)|3|9|EK|@{0|}}
{30001002|XXparameter|IS_PRIV_DIM_POOL_LOC_EME_EXIST|$(eme_present=`air object ls  "$\{PRIV_DIM_POOL_LOC_EME\}" `
if [ -z "$\{eme_present\}"] ;then
  echo "N"
  else 
   echo "Y"
fi 
)|3|9|EK|@{0|}}
{30001002|XXparameter|AR_ROOT|$AB_AIR_ROOT|3|9|RFK|@{0|}}
{30001002|XXparameter|ALL_KEYING_PSET_VEC:eme|""|3|9||@{0|}}
{30001002|XXparameter|ALL_KEYING_PSET_VEC:sandbox|$[directory_listing(string_concat(AI_PSET ,"/keying/"), "*.pset")]|3|9||@{0|}}
{30001002|XXparameter|AR_BRANCH|idw_direct|3|9|RFK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|1458000|776000|0|setup.generate_run_plan_123|Christopher.Reppin|Created 8/13/2013 4:47:45 PM|1|100|0||9||34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|2085000|1123000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{5|1|1|1|1|1|}Job 'setup.generate_run_plan' Execution Status Report


Job "setup.generate_run_plan" Execution started at Tuesday, August 28, 2018 04:08:12
Job completed successfully at Tuesday, August 28, 2018 04:08:43

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:00:30
Run performed by user abansa28
Total data moved through all flows: 10 records (2418 bytes)
Total CPU time (all processes): 5 seconds
Average CPU utilization across all nodes: 0.00 percent
||
echo "$AI_META/inactive_pset_list.dat"
echo " Checking Inactive pset list in AI_META path "

if [[ ! -f "$AI_META/inactive_pset_list.dat" ]] ; then
   touch "$AI_META/inactive_pset_list.dat" 
fi

if [[ ! -f "$AI_META/daily_load_static_dim.dat" ]] ; then
   touch "$AI_META/daily_load_static_dim.dat" 
fi

|#!/bin/ksh -ex
export PLANFILE=$\{AI_PLAN\}/run.$FINAL_INSTANCE_NM.plan
if [ $mpjret -eq 0 ]; then
###  #### Conformed dim resource

##Run Resource creation process 
cd $PUB_RESOURCE_RESOURCE/
                if [[ ( "$\{IS_CONFORMED_DIM_POOL_LOC_EME_EXIST\}" == "Y" ) && ( -f "conf_dimension.pool" ) ]] ; then
                     echo " Locking conformed dimension pool :" "$CONFORMED_DIM_POOL_LOC_EME"  
                     air sandbox lock ./conf_dimension.pool
                      m_pool batch conf_dimension.pool "$\{CONF_DIM_RESOURCE_FILE\}" -create
                     echo " conf_dimension pool Modified , Please check in this resource  conf_dimension.pool in $\{PUB_RESOURCE_RESOURCE\} "
                else 
                    cd $PUB_RESOURCE_RESOURCE/
                    m_pool batch conf_dimension.pool "$\{CONF_DIM_RESOURCE_FILE\}" -create
                    echo " conf_dimension pool created for first time ,Please check in this resource batch conf_dimension.pool in $\{PUB_RESOURCE_RESOURCE\}"
                fi


#######Private ids dim Resource
           cd $PUB_RESOURCE_RESOURCE/
                if [[ ( "$\{IS_PRIV_DIM_POOL_LOC_EME_EXIST\}" == "Y" ) && ( -f "$\{PRIV_DIM_POOL_LOC\}" ) ]] ; then
                           echo " Locking priv dim resource : $\{PRIV_DIM_POOL_LOC_EME\}"
                           air sandbox lock "$\{PRIV_DIM_POOL_LOC\}" 
                           m_pool batch "$\{PRIV_DIM_POOL_LOC\}" "$\{PRIV_DIM_POOL_FILE\}" -create
                           echo " Private dimension  pool Modified ,Please check in this resource batch $\{PRIV_DIM_POOL_LOC\}"
                else 
                 cd $PUB_RESOURCE_RESOURCE/   
                        m_pool batch "$\{PRIV_DIM_POOL_LOC\}" "$\{PRIV_DIM_POOL_FILE\}" -create
                        echo " private dimension  pool created for first time , Please check in this resource batch $\{PRIV_DIM_POOL_LOC\}"
                fi

## Don't Check -In yet 
###############Application ETL limits pool 
              cd $PUB_RESOURCE_RESOURCE/
                if [[ ( "$\{IS_APP_LIMIT_POOL_LOC_EME_EXIST\}" == "Y")  && ( -f "$\{APP_LIMIT_POOL_LOC\}" ) ]] ; then
                        echo " Locking this pool for creating new modified pool: $\{APP_LIMIT_POOL_LOC_EME\}"     
                         air sandbox lock "$\{APP_LIMIT_POOL_LOC\}" 
                         m_pool batch "$APP_LIMIT_POOL_LOC" "$APP_ETL_LIMIT_POOL_FILE" -create
                         echo " Private ETL Parellel task pool modified , Please Check in $\{APP_LIMIT_POOL_LOC\}"
               else 
                         cd $PUB_RESOURCE_RESOURCE/
                         echo " No need to lock App limit pool as this pool $\{APP_LIMIT_POOL_LOC_EME\} does not exist in EME"    
                         m_pool batch "$APP_LIMIT_POOL_LOC" "$APP_ETL_LIMIT_POOL_FILE" -create
                         echo " Private ETL Parellel task pool created for first time, Please Check in $\{APP_LIMIT_POOL_LOC\}" 
                fi               

#### Run actual Plan creation process 

                if [[ -e $PLANFILE && ! -w $PLANFILE ]]; then
                  air sandbox lock $PLANFILE \|\| exit 1
                  echo "*** Locked $PLANFILE for writing"
                fi
                m_plan batch -create < $\{AI_SERIAL_TEMP\}/plan_contents.$INSTANCE_NAME.txt \|\| exit 1
                echo "*** Wrote $PLANFILE"

fi
|@|33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@apsrd02143 - RHEL 7||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|8388608|90|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Only for Partial Plans|612000|903000|427000|758000|123000|16000|9614|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@Only for Full Plans|837000|643000|837000|528000|107000|16000|9534|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@Only for Partial Plans|822000|533000|822000|418000|123000|16000|9535|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|11|0|21|0|{@{}@Setup: Generate Run Plan|445103|15494|465000|35000|592000|56000|8076|}}
{2010242002|XXGface|12|0|23|0|{@{}@Arial|32768|360|1|}}
{2010240003|XXGlegend|13|0|25|0|{@{}@Get Pset list|410000|1092000|0|0|0|0|9611|}}
{2010242002|XXGface|14|0|27|0|{@{}@Arial|8421504|90|0|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{8|146000|354000|166000|354000|185000|354000|206000|354000|}9646|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{12|750000|509000|770000|509000|770000|509000|770000|629000|771000|629000|792000|629000|}9606|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}9689|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{8|925000|714000|945000|714000|1004000|714000|1025000|714000|}9618|17|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.5|{0|}9687|17|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|1.0|{12|1181000|504000|1201000|504000|1218000|504000|1218000|359000|1218000|359000|1239000|359000|}9682|17|}}
{2010210004|XXGflow|21|0|41|0|{@{}@384|.5|.5|{8|750000|499000|780000|499000|828000|499000|849000|499000|}9587|17|}}
{2010210004|XXGflow|22|0|43|0|{@{}@384|.5|.5|{8|347000|504000|367000|504000|402000|504000|423000|504000|}9699|17|}}
{2010210004|XXGflow|23|0|45|0|{@{}@384|.5|.5|{0|}9564|529|}}
{2010210004|XXGflow|24|0|47|0|{@{}@384|.5|.5|{8|965000|349000|985000|349000|1006000|349000|1027000|349000|}9603|17|}}
{2010243001|XXGwatcher|25|0|49|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|26|0|51|0|{@{}@384|.5|.5|{0|}9547|17|}}
{2010210004|XXGflow|27|0|53|0|{@{}@384|.5|.5|{8|170000|504000|190000|504000|205000|504000|226000|504000|}9698|17|}}
{2010210004|XXGflow|28|0|55|0|{@{}@384|.5|.5|{0|}9669|17|}}
{2010210004|XXGflow|29|0|57|0|{@{}@384|.5|.8647540807723999|{12|925000|704000|945000|704000|996000|704000|996000|509000|1005000|509000|1026000|509000|}9612|17|}}
{2010210004|XXGflow|30|0|59|0|{@{}@384|.5|1.0|{12|1167000|219000|1187000|219000|1218000|219000|1218000|339000|1218000|339000|1239000|339000|}9510|17|}}
{2010243001|XXGwatcher|31|0|61|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|32|0|63|0|{@{}@384|.5|.5|{8|372000|354000|392000|354000|408000|354000|429000|354000|}9541|17|}}
{2010210004|XXGflow|33|0|65|0|{@{}@384|.5|.5|{0|}9670|17|}}
{2010210004|XXGflow|34|0|67|0|{@{}@384|.5|.5|{0|}9567|17|}}
{2010243001|XXGwatcher|35|0|69|0|{@{}@1|100|0||0|}}
{2010210004|XXGflow|36|0|71|0|{@{}@384|.5|.5|{0|}9690|17|}}
{2010210004|XXGflow|37|0|73|0|{@{}@384|.5|.5|{0|}9702|17|}}
{2010243001|XXGwatcher|38|0|75|0|{@{}@1|100|0||0|}}
{2010210004|XXGflow|39|0|77|0|{@{}@384|.5|.5|{0|}9681|17|}}
{2010243001|XXGwatcher|40|0|79|0|{@{}@1|100|0||0|}}
{2010210004|XXGflow|41|0|81|0|{@{}@384|.5|.5643564462661743|{0|}9679|17|}}
{2010210004|XXGflow|42|0|83|0|{@{}@384|.5|.7857142686843872|{8|1182000|349000|1202000|349000|1208000|349000|1239000|349000|}9703|17|}}
{2010243001|XXGwatcher|43|0|85|0|{@{}@1|100|0||0|}}
{2010210004|XXGflow|44|0|87|0|{@{}@384|.5|.5|{0|}9561|17|}}
{2010210004|XXGflow|45|0|89|0|{@{}@384|.5|.5|{0|}9692|17|}}
{2010210004|XXGflow|46|0|91|0|{@{}@384|.5|.5|{0|}9693|17|}}
{2010210004|XXGflow|47|0|93|0|{@{}@384|.5|.5|{0|}9648|17|}}
{2010210004|XXGflow|48|0|95|0|{@{}@384|.5|.5|{8|588000|354000|608000|354000|624000|354000|645000|354000|}9668|17|}}
{2010210004|XXGflow|49|0|97|0|{@{}@384|.47999998927116394|.5|{12|716000|359000|736000|359000|736000|427000|11000|427000|11000|504000|32000|504000|}9536|17|}}
{2010210004|XXGflow|50|0|99|0|{@{}@384|.5|.5|{8|1310000|349000|1330000|349000|1359000|349000|1380000|349000|}9675|17|}}
{2010210004|XXGflow|51|0|101|0|{@{}@384|.5|.5|{8|626000|504000|646000|504000|658000|504000|679000|504000|}9586|17|}}
{2010210004|XXGflow|52|0|103|0|{@{}@384|.5|.5|{8|920000|219000|940000|219000|1006000|219000|1027000|219000|}9677|17|}}
{2010501005|XXGpvertex|53|0|105|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@4|@1867000|465000|1250000|324000|50000|51000|9511|Concatenate|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|54|0|107|0|{@{}@1299000|344000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|55|0|110|0|{@{}@1240000|334000|11000|31000|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|56|0|115|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1364510557|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|57|0|117|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|58|0|120|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010503005|XXGfvertex|59|0|123|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:$AI_SERIAL_TEMP/plan_contents.$INSTANCE_NAME.txt|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_TEMP/plan_contents.$INSTANCE_NAME.txt", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|record 
  string('\\n') plan_contents;
end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@4|@2004000|452500|1391000|323000|56000|50000|9676|Plan Contents|Ab Initio Software||1|100000|0||6||164097|-1|-1|}}
{2010202004|XXGiport|60|0|125|0|{@{}@1381000|344000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|61|0|128|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url|@28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|param block_compressed True mode lookup version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 85 subkind 0 parts [vector]]]|28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|mpcmodtime|1364510553|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|62|0|130|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|63|0|133|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|let string(int) [long]  _global_rollup_accumulation_step_pset = allocate();

type temporary_type =
record
end;

temp :: initialize(in) =
begin
  _global_rollup_accumulation_step_pset = [vector];
end;

out :: rollup(temp, in) =
begin

  let pred=re_replace(re_replace(in.writing_graph_path, "^.*/", ""),".pset","");
  let succ=re_replace(re_replace(in.reading_graph_path, "^.*/", ""),".pset","");
      _global_rollup_accumulation_step_pset = vector_append(
        _global_rollup_accumulation_step_pset,
       "link / -from=/"+ pred + " -to=/"+ succ
     );        
end;

out :: finalize(temp, in) =
begin
  out.plan_contents :: string_join(vector_append(_global_rollup_accumulation_step_pset,'arrange'), "\\n");
end;|3|3|c|@{0|}}
{30001002|XXparameter|out_metadata|record 
  string('\\n') plan_contents;
end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|@1632000|600000|1037000|440000|134000|127000|9683|Rollup m_plan Commands for Links|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|64|0|135|0|{@{}@1170000|499000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|65|0|138|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|66|0|140|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|67|0|142|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|68|0|144|0|{@{}@1027000|494000|11000|21000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|69|0|147|0|{Generates data records that summarize groups of data records.  Rollup in memory maximizes performance by keeping intermediate results in main memory.  Rollup sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Ordering of input data|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input_display_values|In-memory:Inputneednotbesorted Inputmustbesortedorgrouped|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input_display_values.display_name|sorted-input-display-values|3|9|P|@{0|}}
{30001002|XXparameter|key_method|value sorted-input False True default constant True|13|13|Fv|How groups are specified|{0|}}
{30001002|XXparameter|key_method.display_name|key-method|3|9|P|@{0|}}
{30001002|XXparameter|key_method.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|key_method_display_values|Usekey_changefunction Usekeyspecifier|3|2|H$||{0|}}
{30001002|XXparameter|key_method_display_values.display_name|key-method-display-values|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key to define rollup groups|{0|}}
{30001002|XXparameter|key.condition|param key-method True|3|15|P?|@{0|}}
{30001002|XXparameter|positional_key|value key-method False "" sameas key|19|13|Ov|Key to define rollup groups|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
{30001002|XXparameter|max_core|67108864|1|2|FK$|Maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|check_sort|True|13|1|FKl|Abort on first record that is out of sorted order|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|param key-method True param sorted-input True version 2.11.1:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|grouped_input|False|13|1|Fl|Input data should be processed in groups|{0|}}
{30001002|XXparameter|grouped_input.display_name|grouped-input|3|9|P|@{0|}}
{30001002|XXparameter|grouped_input.condition|param sorted-input False version 2.14.102:|3|15|P?|@{0|}}
{30001002|XXparameter|grouped_input_display_values|Dataisnotgroupedbyamajorkey Dataisgroupedbyamajorkey|3|2|H$||{0|}}
{30001002|XXparameter|grouped_input_display_values.display_name|grouped-input-display-values|3|9|P|@{0|}}
{30001002|XXparameter|major_key||19|2|FK$|Major key into which data is grouped|{0|}}
{30001002|XXparameter|major_key.display_name|major-key|3|9|P|@{0|}}
{30001002|XXparameter|major_key.keyword|major-key|3|9|P|@{0|}}
{30001002|XXparameter|major_key.condition|param grouped-input True|3|15|P?|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_intermediate||15|1|Fl|Frequency of intermediate records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_intermediate.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|10|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of public variables in rollup|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|operation1|optional int out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|temp ? temp::rollup(temp, in) : out::rollup(in)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation4|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation5|optional int out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6|optional integer(8) out::key_change(in in1, in in2)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|operation1_analysis|int input_select_out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation5_analysis|int output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6_analysis|integer(8) key_change_out::key_change(in in, in in)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|_simple_transform_operation|rollup|3|2|H$|What operation should transform editor open with|{0|}}
{30001002|XXparameter|_simple_transform_operation.condition|version 2.11.7.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|sorted_mpname|rollup|3|2|H$||{0|}}
{30001002|XXparameter|sorted_mpname.display_name|sorted-mpname|3|9|P|@{0|}}
{30001002|XXparameter|memory_mpname|hash-rollup|3|2|H$||{0|}}
{30001002|XXparameter|memory_mpname.display_name|memory-mpname|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select); out=aggregate(key)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation7|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation8|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation9|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655976|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|70|0|149|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|71|0|152|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|72|0|155|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|73|0|158|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|74|0|161|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|75|0|165|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|string_like(writing_graph_path,"%map.%") and string_like(reading_graph_path,"%keying.%")|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|type lookup_link_t =
record
  string(big endian integer(4),  charset="x-ab-internal") writing_graph_path /*path*/;
  string(big endian integer(4),  charset="x-ab-internal") reading_graph_path /*path*/;
  string(big endian integer(4),  charset="x-ab-internal") dataset;
  string("\\n") preceeding_mp_pset_for_placholder="";
end;

metadata type = lookup_link_t;|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Filter by Expression|25000|251500|0|0|0|0|8797|FBE:Map & Keying pset Filter|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|76|0|167|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|77|0|169|0|{@{}@384|.5|.5|{0|}8834|17|}}
{2010243001|XXGwatcher|78|0|171|0|{@{}@1|100|0||0|}}
{2010203004|XXGoport|79|0|173|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010210004|XXGflow|80|0|175|0|{@{}@384|.5|.499009907245636|{0|}8812|17|}}
{2010203004|XXGoport|81|0|177|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|82|0|179|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|83|0|181|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|84|0|183|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|85|0|185|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|select_expr||20|2|RFO$|Filter expression|{0|}}
{30001002|XXparameter|select_expr.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_select_expr|-use_package|3|2|RO$|Replaces select_expr as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_select_expr.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the select() function defined in the package|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) select_out::select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; deselect=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select_out); deselect=filter_xfr(package.select_out);|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|Filter by Expression|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|86|0|187|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|87|0|190|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|88|0|193|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|89|0|196|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|90|0|199|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|91|0|202|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|92|0|207|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0262|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|key|\{reading_graph_path\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOOKUP/partial_link.$INSTANCE_NAME.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOOKUP/partial_link.$INSTANCE_NAME.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/lookup.link.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@3|@1218000|982500|1036000|688000|56000|50000|9619|Partial Plan Links by Reader|Ab Initio Software||1|10000|0||6||33025|-1|-1|}}
{2010202004|XXGiport|93|0|209|0|{@{}@1026000|709000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|94|0|212|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url|@28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|param block_compressed True mode lookup version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 85 subkind 0 parts [vector]]]|28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|mpcmodtime|1364510553|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|95|0|214|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|96|0|220|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
  out.plan_contents :: in.plan_contents;
end;|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|@1658000|206500|1038000|177000|119000|89000|9262|Convert to Lines|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|97|0|222|0|{@{}@1156000|214000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|98|0|225|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|99|0|227|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|100|0|229|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|101|0|231|0|{@{}@1028000|214000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|102|0|235|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1364510557|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|103|0|237|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|104|0|241|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|105|0|244|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|106|0|247|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|107|0|250|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|108|0|254|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|transform|out::create(index)=
begin
  out.plan_contents :: '
decl / RUN_ID -description="The Run or Batch ID for this set of jobs."
set  / RUN_ID -expr="0"

decl / EFF_DATE -description="YYYY-MM-DD: The source system\\'s effective date.  In other words, the date when the data we are processing now was entered in the source."
set / EFF_DATE -expr=\\'$[ (string(\\"\\"))(date(\\"YYYY-MM-DD\\"))(today()-1) ]\\'

decl / IS_SUPPRESS_UPDATE_FOR_HIST -description="This parameter will be overwridden as Y ,if history load process is running in backward fashion"
set / IS_SUPPRESS_UPDATE_FOR_HIST -expr="N"

decl / USE_GET_BYPASS_CTL -description="This parameter will be N , but can be set as Y when main plan has to run partially for few gets"
set / USE_GET_BYPASS_CTL -expr="N"

decl / START_CHANGES_TIME -description="Optional: YYYY-MM-DD HH24:MI:SS: The time to use to start selecting new or updated records or records changing effectiveness.  Defaults to yesterday, midnight."
set / START_CHANGES_TIME -expr=\\'\\'

decl / END_CHANGES_TIME -description="YYYY-MM-DD HH24:MI:SS: The time to use to stop selecting new or updated records or records changing effectiveness.  Defaults to now."
set / END_CHANGES_TIME -expr=\\'$[ (string(\\"\\"))(datetime(\\"YYYY-MM-DD HH24:MI:SS\\"))now() ]\\'

decl / RUN_GROUP -description="Plan Group identifier"
set / RUN_GROUP -expr=\\'$[ RUN_GROUP ]\\'

decl / LOCAL_TRIGGER_FILE_DIRECTORY -description="LOCAL directory where ctl file will be present"
set / LOCAL_TRIGGER_FILE_DIRECTORY -expr=\\'$LOCAL_TRIGGER_FILE_DIRECTORY\\'

decl / USE_LOCAL_CTL -description="LOCAL directory where ctl file will be present"
set / USE_LOCAL_CTL -expr="Y"

decl / HIST_PREFIX -description="HIST_PREFIX should be set false for incremental "
set / HIST_PREFIX -expr=0

decl / DATA_FILE_COMPRESS_FLAG -description="LOCAL directory where ctl file will be present"
set / DATA_FILE_COMPRESS_FLAG -expr=1


decl / CONF_DIM_UNITS -description="contains resources available in conformed dimensions pool"
set / CONF_DIM_UNITS -expr=\\'$(resource-admin show-pool $PUB_RESOURCE_RESOURCE/conf_dimension.pool)\\'

decl / PRIV_DIM_UNITS -description="contains resources available in conformed dimensions pool"
set / PRIV_DIM_UNITS -expr=\\'$(resource-admin show-pool $PUB_RESOURCE_RESOURCE/orca_' +  "$\{PROJECT_NM\}" + '_priv_dimension.pool)\\'

#End of Section
';
 
end;|3|3|c|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record 
  string(int) plan_contents;
end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[PROJECT_NM=="rxclaim"]|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|@1435000|130000|850000|190000|60000|60000|9680|Create Run Plan Parameters- For process using datalake read|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|109|0|256|0|{@{}@909000|214000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|110|0|259|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|111|0|261|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|112|0|263|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|num_records.display_name|num-records|3|9|P|@{0|}}
{30001002|XXparameter|transform|out::create(index)=begin out :: random_value(); end;|8|1|FOl|DML function|{0|}}
{30001002|XXparameter|identical_records|False|13|1|FKl|Whether to evaluate the transform once only, or once for each record|{0|}}
{30001002|XXparameter|identical_records.display_name|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records.keyword|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records_display_values|Evaluatetransformanewforeachrecord Evaluatetransformonceandusethatvalueforallrecords|3|2|H$||{0|}}
{30001002|XXparameter|identical_records_display_values.display_name|identical-records-display-values|3|9|P|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|1|1|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|continuous|False|13|1|RFOl|Whether to produce checkpoints or computepoints.|{0|}}
{30001002|XXparameter|checkpoint_interval|1|1|2|FO$|Number of records between checkpoints, or 0 to indicate that no checkpoints are to be generated.|{0|}}
{30001002|XXparameter|checkpoint_interval.display_name|checkpoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|checkpoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|computepoint_interval|0|1|2|FO$|Number of records between computepoints, or 0 to indicate that no computepoints are to be generated.|{0|}}
{30001002|XXparameter|computepoint_interval.display_name|computepoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|computepoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|do_timed_checkpoints|False|13|1|FKl|Generate checkpoints at timed intervals|{0|}}
{30001002|XXparameter|do_timed_checkpoints.display_name|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.keyword|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::create(unsigned long index)|3|2|H$|Function taking integer index counting 1,2,3,4... to produce records on the output.|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? subscriber :|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1364510557|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|113|0|265|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|114|0|268|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|115|0|271|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|116|0|276|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|include "/~$PUB_DXF_DML/lookup.link.dml";

let string(long)[long] visited_pset_vec = [vector];
let string(long)[long] visited_load_pset_vec = [vector];
let lookup_link_t[long] visited_link_vec = [vector];


/* Returns 1 (True) iff the name of given pset is not a load pset, else 0 (False). */
out :: is_not_load_pset(pset) =
begin
  out :: not string_index(pset, "/load.");
end;


/* Returns a dedup'd vector of links to successors. */
out :: lookup_succ_links(pset) =
begin
  let len = lookup_count("Links by Writer", pset);

  out :: vector_sort_dedup_first(
    for ( let i, i < len ) :
      lookup_next("Links by Writer"));
end;

/* Returns a dedup'd vector of links to predecessors.  Links to loads are only included if the load pset was already found downstream. */
out :: lookup_pred_links(pset) =
begin
  let len = lookup_count("Links by Reader", pset);
  let pred_vec = vector_sort_dedup_first(
    for ( let i, i < len ) :
      lookup_next("Links by Reader"));

  // Only include loads if we have visited them already.
  out :: for ( let link in pred_vec ) :
    if ( is_not_load_pset(link.writing_graph_path) or link.writing_graph_path member visited_load_pset_vec )
      link;
end;


/* Visit the psets that are directly related to the given pset and add them to the global lists. */
out :: visit_related_psets(string(long) pset, do_downstream) =
begin
  let related_link_vec = if ( do_downstream )
    lookup_succ_links(pset)
  else
    lookup_pred_links(pset);
  let string(long)[long] related_pset_vec =
    for ( let link in related_link_vec ) :
      if ( do_downstream )
        link.reading_graph_path
      else
        link.writing_graph_path;

  // Add ourselves to the global visited list.
  visited_pset_vec = vector_append(visited_pset_vec, pset);
  // Add all our links to the global visited list.
  visited_link_vec = vector_concat(visited_link_vec, related_link_vec);
  // Recurse on the related psets, but not the loads.
  related_pset_vec = vector_difference(related_pset_vec, visited_pset_vec);  // Only keep new (unvisited) psets.  This also removes dups.
  for ( let p in related_pset_vec )
    if ( is_not_load_pset(p) )
      visit_related_psets(p, do_downstream);
    else
      visited_load_pset_vec = vector_merge(visited_load_pset_vec, [vector p]);  // Do not visit loads, but remember that we saw them.

  out :: pset;
end;

/* Find all the related links, and return the count of them. */
out :: length(in)=
begin
  if ( is_not_load_pset(in.pset_nm) ) begin
    // Add all our downstream links first.
    visit_related_psets(in.pset_nm, 1);
    // Then add the upstream links for every downstream pset.
    for ( let p in vector_sort_dedup_first(visited_pset_vec) )
      visit_related_psets(p, 0);
  end
  else begin
    // For Loads, just visit the upstream links.
    visited_load_pset_vec = [vector in.pset_nm];
    visit_related_psets(in.pset_nm, 0);
  end
  visited_link_vec = vector_sort_dedup_first(visited_link_vec);

  out :: length_of(visited_link_vec);
end;

/* Output each related link, one per record. */
out::normalize(in, index)=
begin
  out.* :: visited_link_vec[index].*;
end;|3|9||@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|record
  string(big endian integer(4),  charset="x-ab-internal") writing_graph_path /*path*/;
  string(big endian integer(4),  charset="x-ab-internal") reading_graph_path /*path*/;
  string(big endian integer(4),  charset="x-ab-internal") dataset;
end;|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|@599000|932500|634000|648000|125000|127000|9688|Create Links for Partial Plans|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|117|0|278|0|{@{}@758000|704000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|118|0|281|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|119|0|283|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|120|0|285|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|121|0|287|0|{@{}@624000|704000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|122|0|290|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_intermediate||15|1|Fl|Frequency of intermediate records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_intermediate.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate types in transform package|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|num_operations|11|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|optional integer(8) out::length(in)|3|2|H$|Number of records to output.  Either this function or finished() must be defined.|{0|}}
{30001002|XXparameter|operation4|temp ? temp::normalize(temp, in, integer(8) index) : out::normalize(in, integer(8) index)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation5|optional temp ? integer(8) finished_out::finished(temp, in, integer(8) index) : integer(8) finished_out::finished(in, integer(8) index)|3|2|H$|Are we done with this input record?  Either this function or length() must be defined.|{0|}}
{30001002|XXparameter|operation6|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation7|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation3_analysis|integer(8) length_out::length(in)|3|2|H$|Number of records to output|{0|}}
{30001002|XXparameter|operation7_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1364510557|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|123|0|292|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|124|0|295|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|125|0|298|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|126|0|301|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|127|0|304|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|128|0|308|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|num_records|$[length_of(PARTIAL_PSET_VEC)]|3|9||@{0|}}
{30001002|XXparameter|transform|let string("")[int] v_partial_pset_vec = $[ string_representation(PARTIAL_PSET_VEC) ];
out::create(index)=
begin
; 
  out.pset_nm :: v_partial_pset_vec[next_in_sequence() -1 ];
end;|3|9||@{0|}}
{30001002|XXparameter|condition|$GENERATE_PARTIAL_PLAN|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record
  string('') pset_nm;
end;|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|@425000|970000|455000|680000|60000|60000|9667|Optional: Stimulate Normalize|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|129|0|310|0|{@{}@514000|704000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|130|0|313|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|131|0|315|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|132|0|317|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|num_records.display_name|num-records|3|9|P|@{0|}}
{30001002|XXparameter|transform|out::create(index)=begin out :: random_value(); end;|8|1|FOl|DML function|{0|}}
{30001002|XXparameter|identical_records|False|13|1|FKl|Whether to evaluate the transform once only, or once for each record|{0|}}
{30001002|XXparameter|identical_records.display_name|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records.keyword|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records_display_values|Evaluatetransformanewforeachrecord Evaluatetransformonceandusethatvalueforallrecords|3|2|H$||{0|}}
{30001002|XXparameter|identical_records_display_values.display_name|identical-records-display-values|3|9|P|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|1|1|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|continuous|False|13|1|RFOl|Whether to produce checkpoints or computepoints.|{0|}}
{30001002|XXparameter|checkpoint_interval|1|1|2|FO$|Number of records between checkpoints, or 0 to indicate that no checkpoints are to be generated.|{0|}}
{30001002|XXparameter|checkpoint_interval.display_name|checkpoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|checkpoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|computepoint_interval|0|1|2|FO$|Number of records between computepoints, or 0 to indicate that no computepoints are to be generated.|{0|}}
{30001002|XXparameter|computepoint_interval.display_name|computepoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|computepoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|do_timed_checkpoints|False|13|1|FKl|Generate checkpoints at timed intervals|{0|}}
{30001002|XXparameter|do_timed_checkpoints.display_name|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.keyword|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::create(unsigned long index)|3|2|H$|Function taking integer index counting 1,2,3,4... to produce records on the output.|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? subscriber :|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1364510557|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|133|0|319|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|134|0|322|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|135|0|325|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010600005|XXGgraph|136|0|329|0|{|{}@0|@188000|41500|0|0|0|0|9701|Create Resource Pool Files|Christopher.Reppin|Created 7/20/2017 12:15:58 PM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1348000|778000|3|}}
{2010240003|XXGlegend|137|0|331|0|{@{}@Create First time Inactive pset file lookup|65000|428000|0|0|0|0|8904|}}
{2010242002|XXGface|138|0|333|0|{@{}@Arial|8421504|90|0|}}
{2010240003|XXGlegend|139|0|335|0|{@{}@Create First time db resource lookup file lookup|425000|708000|0|0|0|0|8952|}}
{2010242002|XXGface|140|0|337|0|{@{}@Arial|8421504|90|0|}}
{2010240003|XXGlegend|141|0|339|0|{@{}@This flow creates resource pool in :

1.PUB_DXF_RESOURCE for common confomed dimension
2.Private resorce pool for private load IDS dimension|101000|201000|0|0|0|0|8885|}}
{2010242002|XXGface|142|0|341|0|{@{}@Arial|8421504|90|0|}}
{2010210004|XXGflow|143|0|343|0|{@{}@384|.5|.5|{0|}8982|17|}}
{2010210004|XXGflow|144|0|345|0|{@{}@384|.5|.5|{0|}8995|17|}}
{2010210004|XXGflow|145|0|347|0|{@{}@384|.5|.5|{0|}8955|17|}}
{2010210004|XXGflow|146|0|349|0|{@{}@384|.5|.5|{0|}8950|17|}}
{2010210004|XXGflow|147|0|351|0|{@{}@384|.5|.5|{0|}8983|529|}}
{2010210004|XXGflow|148|0|353|0|{@{}@384|.5|.5|{0|}8989|529|}}
{2010600005|XXGgraph|149|0|355|0|{Subgraph created from graph "Create Conformed Dim Lookup"|{}@0|@767500|398750|0|0|0|0|8992|App Limit Pool|Christopher.Reppin|Created 7/25/2017 9:32:56 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|643000|208000|3|}}
{2010210004|XXGflow|150|0|357|0|{@{}@384|.5|.5|{0|}8916|17|}}
{2010503005|XXGfvertex|151|0|359|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$APP_ETL_LIMIT_POOL_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$APP_ETL_LIMIT_POOL_FILE|3|2|$|@{0|}}
}}@0|@464000|80000|0|0|0|0|8917|Private Dim Resource File|Ab Initio Software|@1|10000|0||6||33025|-1|-1|}}
{2010202004|XXGiport|152|0|361|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|153|0|364|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|154|0|366|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|155|0|369|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|record
string("\\t\\r\\n") resource_command;
end|3|1|l|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/


out::reformat(in)=
begin

let string("") v_resorce_nm='parallel_tasks' ;
out.resource_command :: string_concat('resource /',v_resorce_nm,' ','\\n',
                                      'set /', v_resorce_nm, ' ab_resource_group -expr="limit"' ,'\\n',
                                      'set /',v_resorce_nm, ' ab_units_configured -expr="10" ','\\n');
                                                                                     
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|164000|40000|0|0|0|0|8915|RFMT: Resource Pool Commands|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|156|0|371|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|157|0|374|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|158|0|376|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|159|0|378|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|160|0|380|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|161|0|382|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|162|0|384|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|163|0|388|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|164|0|391|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|165|0|394|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|166|0|397|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|167|0|401|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record
string("") kicker;
end|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Create Data|483000|422500|0|0|0|0|8996|Create Placeholder Pool Text-1|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|168|0|403|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|169|0|406|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|170|0|408|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|171|0|410|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|num_records.display_name|num-records|3|9|P|@{0|}}
{30001002|XXparameter|transform|out::create(index) = begin
  out :: random_value();
end;|8|1|FOl|DML function|{0|}}
{30001002|XXparameter|identical_records|False|13|1|FKl|Whether to evaluate the transform once only, or once for each record|{0|}}
{30001002|XXparameter|identical_records.display_name|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records.keyword|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records_display_values|Evaluatetransformanewforeachrecord Evaluatetransformonceandusethatvalueforallrecords|3|2|H$||{0|}}
{30001002|XXparameter|identical_records_display_values.display_name|identical-records-display-values|3|9|P|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|1|1|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|continuous|False|13|1|RFOl|Whether to produce checkpoints or computepoints.|{0|}}
{30001002|XXparameter|checkpoint_interval|1|1|2|FO$|Number of records between checkpoints, or 0 to indicate that no checkpoints are to be generated.|{0|}}
{30001002|XXparameter|checkpoint_interval.display_name|checkpoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|checkpoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|computepoint_interval|0|1|2|FO$|Number of records between computepoints, or 0 to indicate that no computepoints are to be generated.|{0|}}
{30001002|XXparameter|computepoint_interval.display_name|computepoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|computepoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|do_timed_checkpoints|False|13|1|FKl|Generate checkpoints at timed intervals|{0|}}
{30001002|XXparameter|do_timed_checkpoints.display_name|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.keyword|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::create(unsigned long index)|3|2|H$|Function taking integer index counting 1,2,3,4... to produce records on the output.|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? subscriber :|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|Create Data|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|172|0|412|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|173|0|415|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|174|0|418|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|175|0|424|0|{@{}@0|0|0|0|in0|.6923076923076923|@@@13840|0|}}
{2010600005|XXGgraph|176|0|428|0|{Subgraph created from graph "Create Conformed Dim Lookup"|{}@0|@730500|10000|0|0|0|0|8972|Conf Dimension||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|682000|400000|7|}}
{2010210004|XXGflow|177|0|430|0|{@{}@384|.5|.5|{0|}8883|17|}}
{2010210004|XXGflow|178|0|432|0|{@{}@384|.5|.5|{0|}8905|17|}}
{2010210004|XXGflow|179|0|434|0|{@{}@384|.5|.5|{0|}8907|17|}}
{2010210004|XXGflow|180|0|436|0|{@{}@384|.5|.5|{0|}8908|17|}}
{2010503005|XXGfvertex|181|0|438|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOOKUP/lookup.conformed_dimensions_list.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOOKUP/lookup.conformed_dimensions_list.dat|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|record
 string("\\n") ids_dimesnion_nm;
end|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0262|3|2|$|@{0|}}
{30001002|XXparameter|key|\{ids_dimesnion_nm\}|3|2|$|@{0|}}
}}@0|@550000|104000|0|0|0|0|8906|Conformed Dimension List|Ab Initio Software|@1|10000|0||6||33025|-1|-1|}}
{2010202004|XXGiport|182|0|440|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|183|0|443|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|184|0|445|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|185|0|448|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$CONF_DIM_RESOURCE_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$CONF_DIM_RESOURCE_FILE|3|2|$|@{0|}}
}}@0|@552000|275000|0|0|0|0|8900|Output File|Ab Initio Software|@1|10000|0||6||257|-1|-1|}}
{2010202004|XXGiport|186|0|450|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|187|0|453|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|188|0|455|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|189|0|458|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|record
string("\\t\\r\\n") resource_command;
end|3|1|l|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/


out::reformat(in)=
begin
let string("") v_conformed_dim_nm=in.ids_dimesnion_nm;
let string("") v_resorce_nm= v_conformed_dim_nm ;
out.resource_command :: string_concat('resource /',v_resorce_nm,' ','\\n',
                                      'set /', v_resorce_nm, ' ab_resource_group -expr="conf_dim_group"' ,'\\n',
                                      'set /',v_resorce_nm, ' ab_units_configured -expr="4" ','\\n');
                                                                                     
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|237000|235000|0|0|0|0|8909|RFMT: Resource Pool Commands|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|190|0|460|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|191|0|463|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|192|0|465|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|193|0|467|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|194|0|469|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|195|0|472|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|196|0|474|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|197|0|478|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|198|0|481|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|199|0|484|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|200|0|487|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|201|0|493|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.ids_dimesnion_nm :: in.table_name;
end;|3|1|l|@{0|}}
{30001002|XXparameter|select|string_split(table_name,".")[0]=="ids_common" && ! starts_with(table_name,'#')|3|2|$|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|40000|30000|0|0|0|0|8884|RFMT: Filter Conformed Dims|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|202|0|495|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|203|0|498|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|204|0|500|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|205|0|502|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|206|0|504|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|207|0|506|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|208|0|508|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|209|0|512|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|210|0|515|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|211|0|518|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|212|0|521|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|213|0|525|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|include "~$PUB_DXF_DML/generic_data_types.dml";

metadata type = table_properties_type;|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PUB_DXF_META/ids_table_properties.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$PUB_DXF_META/ids_table_properties.dat|3|2|$|@{0|}}
}}@0|@38000|121500|0|0|0|0|8981|IDS Meta Properties File|Ab Initio Software|@1|700|0||6||33025|-1|-1|}}
{2010203004|XXGoport|214|0|527|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|215|0|530|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|216|0|532|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|217|0|538|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|314000|77500|0|0|0|0|8880|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|218|0|540|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|219|0|544|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|220|0|547|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|221|0|549|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|222|0|552|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010202004|XXGiport|223|0|558|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|224|0|562|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Create Data|68000|637500|0|0|0|0|8954|Create Data|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|225|0|564|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|226|0|567|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|227|0|569|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|228|0|571|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|num_records.display_name|num-records|3|9|P|@{0|}}
{30001002|XXparameter|transform|out::create(index) = begin
  out :: random_value();
end;|8|1|FOl|DML function|{0|}}
{30001002|XXparameter|identical_records|False|13|1|FKl|Whether to evaluate the transform once only, or once for each record|{0|}}
{30001002|XXparameter|identical_records.display_name|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records.keyword|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records_display_values|Evaluatetransformanewforeachrecord Evaluatetransformonceandusethatvalueforallrecords|3|2|H$||{0|}}
{30001002|XXparameter|identical_records_display_values.display_name|identical-records-display-values|3|9|P|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|1|1|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|continuous|False|13|1|RFOl|Whether to produce checkpoints or computepoints.|{0|}}
{30001002|XXparameter|checkpoint_interval|1|1|2|FO$|Number of records between checkpoints, or 0 to indicate that no checkpoints are to be generated.|{0|}}
{30001002|XXparameter|checkpoint_interval.display_name|checkpoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|checkpoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|computepoint_interval|0|1|2|FO$|Number of records between computepoints, or 0 to indicate that no computepoints are to be generated.|{0|}}
{30001002|XXparameter|computepoint_interval.display_name|computepoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|computepoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|do_timed_checkpoints|False|13|1|FKl|Generate checkpoints at timed intervals|{0|}}
{30001002|XXparameter|do_timed_checkpoints.display_name|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.keyword|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::create(unsigned long index)|3|2|H$|Function taking integer index counting 1,2,3,4... to produce records on the output.|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? subscriber :|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|Create Data|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|229|0|573|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|230|0|576|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|231|0|579|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|232|0|582|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_META/inactive_pset_list.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_META/inactive_pset_list.dat|3|2|$|@{0|}}
{30001002|XXparameter|key|\{pset_nm\}|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not CHECK_INACTIVE_PSET_LIST_FILE]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|record
  string("\\n") pset_nm;
end|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0262|3|2|$|@{0|}}
}}@0|@212000|643500|0|0|0|0|8956|InActivePset|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010202004|XXGiport|233|0|584|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|234|0|587|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|235|0|589|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|236|0|593|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ not CHECK_DB_RESOURCE_POOL_FILE ]|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Create Data|408000|622500|0|0|0|0|8949|Create Data-1|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|237|0|595|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|238|0|598|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|239|0|600|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|240|0|602|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|num_records.display_name|num-records|3|9|P|@{0|}}
{30001002|XXparameter|transform|out::create(index) = begin
  out :: random_value();
end;|8|1|FOl|DML function|{0|}}
{30001002|XXparameter|identical_records|False|13|1|FKl|Whether to evaluate the transform once only, or once for each record|{0|}}
{30001002|XXparameter|identical_records.display_name|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records.keyword|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records_display_values|Evaluatetransformanewforeachrecord Evaluatetransformonceandusethatvalueforallrecords|3|2|H$||{0|}}
{30001002|XXparameter|identical_records_display_values.display_name|identical-records-display-values|3|9|P|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|1|1|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|continuous|False|13|1|RFOl|Whether to produce checkpoints or computepoints.|{0|}}
{30001002|XXparameter|checkpoint_interval|1|1|2|FO$|Number of records between checkpoints, or 0 to indicate that no checkpoints are to be generated.|{0|}}
{30001002|XXparameter|checkpoint_interval.display_name|checkpoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|checkpoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|computepoint_interval|0|1|2|FO$|Number of records between computepoints, or 0 to indicate that no computepoints are to be generated.|{0|}}
{30001002|XXparameter|computepoint_interval.display_name|computepoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|computepoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|do_timed_checkpoints|False|13|1|FKl|Generate checkpoints at timed intervals|{0|}}
{30001002|XXparameter|do_timed_checkpoints.display_name|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.keyword|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::create(unsigned long index)|3|2|H$|Function taking integer index counting 1,2,3,4... to produce records on the output.|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? subscriber :|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|Create Data|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|241|0|604|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|242|0|607|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|243|0|610|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|244|0|613|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|\{db_system\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$PRIVATE_META/lookup.db_resource_pool.txt|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOOKUP/lookup.db_resource_pool.txt", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/lookup.db_resource_pool.dml|3|2|f$|@{0|}}
{30001002|XXparameter|mode|0x0262|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ not CHECK_DB_RESOURCE_POOL_FILE ]|3|9||@{0|}}
}}@0|@583000|629500|215000|200000|56000|50000|8951|DB Resource Pool Lookup|Ab Initio Software||1|2000|0||6||33025|-1|-1|}}
{2010202004|XXGiport|245|0|615|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|246|0|618|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url|@28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|param block_compressed True mode lookup version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 85 subkind 0 parts [vector]]]|28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1367640594|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|247|0|620|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|248|0|628|0|{Subgraph created from graph "Create Conformed Dim Lookup"|{}@0|@759000|138750|0|0|0|0|8990|Private Dims||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|639000|213000|7|}}
{2010210004|XXGflow|249|0|630|0|{@{}@384|.5|.5|{0|}8902|17|}}
{2010210004|XXGflow|250|0|632|0|{@{}@384|.5|.5|{0|}8903|17|}}
{2010503005|XXGfvertex|251|0|634|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PRIV_DIM_POOL_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$PRIV_DIM_POOL_FILE|3|2|$|@{0|}}
}}@0|@519000|85000|0|0|0|0|8901|Private Dim Resource File|Ab Initio Software|@1|10000|0||6||164097|-1|-1|}}
{2010202004|XXGiport|252|0|636|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|253|0|639|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|254|0|641|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|255|0|644|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|record
string("\\t\\r\\n") resource_command;
end|3|1|l|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/


out::reformat(in)=
begin
let string("") v_priv_dim_nm=in.ids_dimesnion_nm;
let string("") v_resorce_nm= v_priv_dim_nm ;
out.resource_command :: string_concat('resource /',v_resorce_nm,' ','\\n',
                                      'set /', v_resorce_nm, ' ab_resource_group -expr="priv_dim_group"' ,'\\n',
                                      'set /',v_resorce_nm, ' ab_units_configured -expr="4" ','\\n');
                                                                                     
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|249000|45000|0|0|0|0|8904|RFMT: Resource Pool Commands|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|256|0|646|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|257|0|649|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|258|0|651|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|259|0|653|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|260|0|655|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|261|0|658|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|262|0|660|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|263|0|664|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|264|0|667|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|265|0|670|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|266|0|673|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|267|0|677|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.ids_dimesnion_nm :: in.table_name;
end;|3|1|l|@{0|}}
{30001002|XXparameter|select|string_split(table_name,".")[0]=="$PRIVATE_SUBJECT_AREA_NM" && ! starts_with(table_name,'#')|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|record
 string("\\n") ids_dimesnion_nm;
end|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|40000|47500|0|0|0|0|8893|RFMT: Filter Private dimension|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|268|0|679|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|269|0|682|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|270|0|684|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|271|0|686|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|272|0|688|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|273|0|690|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|274|0|692|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|275|0|696|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|276|0|699|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|277|0|702|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|278|0|705|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|279|0|714|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|280|0|718|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|227000|135000|0|0|0|0|8985|Replicate-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|281|0|720|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|282|0|724|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|283|0|727|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|284|0|729|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|285|0|732|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|286|0|738|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|transform|out::create(index)=
begin
  out.plan_contents :: '
decl / RUN_ID -description="The Run or Batch ID for this set of jobs."
set  / RUN_ID -expr="0"

decl / EFF_DATE -description="YYYY-MM-DD: The source system\\'s effective date.  In other words, the date when the data we are processing now was entered in the source."
set / EFF_DATE -expr=\\'$[ (string(\\"\\"))(date(\\"YYYY-MM-DD\\"))(today()-1) ]\\'

decl / IS_SUPPRESS_UPDATE_FOR_HIST -description="This parameter will be overwridden as Y ,if history load process is running in backward fashion"
set / IS_SUPPRESS_UPDATE_FOR_HIST -expr="N"

decl / USE_GET_BYPASS_CTL -description="This parameter will be N , but can be set as Y when main plan has to run partially for few gets"
set / USE_GET_BYPASS_CTL -expr="N"

decl / START_CHANGES_TIME -description="Optional: YYYY-MM-DD HH24:MI:SS: The time to use to start selecting new or updated records or records changing effectiveness.  Defaults to yesterday, midnight."
set / START_CHANGES_TIME -expr=\\'\\'

decl / END_CHANGES_TIME -description="YYYY-MM-DD HH24:MI:SS: The time to use to stop selecting new or updated records or records changing effectiveness.  Defaults to now."
set / END_CHANGES_TIME -expr=\\'$[ (string(\\"\\"))(datetime(\\"YYYY-MM-DD HH24:MI:SS\\"))now() ]\\'

decl / CONF_DIM_UNITS -description="contains resources available in conformed dimensions pool"
set / CONF_DIM_UNITS -expr=\\'$(resource-admin show-pool $PUB_RESOURCE_RESOURCE/conf_dimension.pool)\\'

decl / PRIV_DIM_UNITS -description="contains resources available in conformed dimensions pool"
set / PRIV_DIM_UNITS -expr=\\'$(resource-admin show-pool $PUB_RESOURCE_RESOURCE/orca_' +  "$\{PROJECT_NM\}" + '_priv_dimension.pool)\\'


#End of Section
';
 
end;|3|3|c|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record 
  string(int) plan_contents;
end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[PROJECT_NM !="rxclaim"]|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|@1450000|275000|850000|190000|60000|60000|9678|Create Run Plan Parameters|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|287|0|740|0|{@{}@909000|214000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|288|0|743|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|289|0|745|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|290|0|747|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|num_records.display_name|num-records|3|9|P|@{0|}}
{30001002|XXparameter|transform|out::create(index)=begin out :: random_value(); end;|8|1|FOl|DML function|{0|}}
{30001002|XXparameter|identical_records|False|13|1|FKl|Whether to evaluate the transform once only, or once for each record|{0|}}
{30001002|XXparameter|identical_records.display_name|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records.keyword|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records_display_values|Evaluatetransformanewforeachrecord Evaluatetransformonceandusethatvalueforallrecords|3|2|H$||{0|}}
{30001002|XXparameter|identical_records_display_values.display_name|identical-records-display-values|3|9|P|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|1|1|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|continuous|False|13|1|RFOl|Whether to produce checkpoints or computepoints.|{0|}}
{30001002|XXparameter|checkpoint_interval|1|1|2|FO$|Number of records between checkpoints, or 0 to indicate that no checkpoints are to be generated.|{0|}}
{30001002|XXparameter|checkpoint_interval.display_name|checkpoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|checkpoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|computepoint_interval|0|1|2|FO$|Number of records between computepoints, or 0 to indicate that no computepoints are to be generated.|{0|}}
{30001002|XXparameter|computepoint_interval.display_name|computepoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|computepoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|do_timed_checkpoints|False|13|1|FKl|Generate checkpoints at timed intervals|{0|}}
{30001002|XXparameter|do_timed_checkpoints.display_name|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.keyword|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::create(unsigned long index)|3|2|H$|Function taking integer index counting 1,2,3,4... to produce records on the output.|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? subscriber :|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1364510557|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|291|0|749|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|292|0|752|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|293|0|755|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|294|0|759|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|RecordFormat|$PUB_DXF_DML/lookup.db_resource_pool.dml|3|2|f$|@{0|}}
{30001002|XXparameter|key|\{db_system\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$PRIVATE_META/lookup.db_resource_pool.txt|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("lookup", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOOKUP/lookup.db_resource_pool.txt", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[ CHECK_DB_RESOURCE_POOL_FILE ]|3|9||@{0|}}
}}@0|@418000|194500|215000|200000|56000|50000|9697|DB Resource Pool Lookup|Ab Initio Software||1|20500|0||6||33025|-1|-1|}}
{2010503005|XXGfvertex|295|0|761|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url|@28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|param block_compressed True mode lookup version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 85 subkind 0 parts [vector]]]|28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1367640594|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010503005|XXGfvertex|296|0|763|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("lookup", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_META/daily_load_static_dim.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_META/daily_load_static_dim.dat|3|2|$|@{0|}}
{30001002|XXparameter|RecordFormat|record
  string("\\n") pset_nm;
end|3|2|$|@{0|}}
{30001002|XXparameter|key|\{pset_nm\}|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[CHECK_INACTIVE_PSET_LIST_FILE]|3|9||@{0|}}
}}@0|@667000|193500|0|0|0|0|9695|Daily Load Static Dims|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010503005|XXGfvertex|297|0|765|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010600005|XXGgraph|298|0|767|0|{|{}@0|@799000|933500|0|0|0|0|9691|De-Dup Links for Same Datasets|Christopher.Reppin|Created 11/16/2016 6:20:55 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1037000|424000|3|}}
{2010210004|XXGflow|299|0|769|0|{@{}@384|.5|.5|{0|}8920|17|}}
{2010210004|XXGflow|300|0|771|0|{@{}@384|.5|.5|{0|}8902|17|}}
{2010210004|XXGflow|301|0|773|0|{@{}@384|.5|.5|{0|}8908|17|}}
{2010501005|XXGpvertex|302|0|775|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{reading_graph_path; writing_graph_path; dataset\}|3|2|$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Dedup Sorted|242000|95000|0|0|0|0|8905|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|303|0|777|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|304|0|780|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|305|0|783|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|306|0|785|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|307|0|787|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|308|0|789|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|309|0|792|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Key on which to remove duplicates|{0|}}
{30001002|XXparameter|select||20|2|FK$|Optional select expression|{0|}}
{30001002|XXparameter|keep|first|15|1|FKl|Output record for a group of duplicates|{3|first|last|unique-only|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|check_sort|True|13|1|FKl|Abort on first record that is out of sorted order|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 2.11.1:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|NoHidePorts|out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; dup=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select); dup=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_operations|4|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|dup_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,dup,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|310|0|794|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|311|0|797|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|312|0|800|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|313|0|803|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|314|0|806|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|315|0|809|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|316|0|817|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|select_expr|writing_graph_path != reading_graph_path  // Remove read/write cycles.
and
(not string_index(writing_graph_path, "/load.") or
 not string_index(reading_graph_path, "/map.") or
 not string_index(dataset, ".max_sk.") or
  not string_index(dataset, "./produce.") or 
   not string_index(dataset, "keying.")
 )// Remove Max SK links.
and
 (not (first_defined(length_of(re_get_match(reading_graph_path,"$LOOKUP_EXCLUDE_PATTERN" )),0) and string_index(writing_graph_path, "/load.") and string_index(reading_graph_path, "/get.") ) )|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|@488000|65500|893000|211000|130000|107000|8921|Remove Cycles and Max SKs|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|317|0|819|0|{@{}@1022000|259000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|318|0|821|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|319|0|823|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|320|0|825|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|321|0|827|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|322|0|829|0|{@{}@883000|259000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|323|0|832|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
{30001002|XXparameter|select_expr||20|2|RFO$|Filter expression|{0|}}
{30001002|XXparameter|select_expr.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_select_expr|-use_package|3|2|RO$|Replaces select_expr as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_select_expr.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the select() function defined in the package|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) select_out::select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; deselect=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select_out); deselect=filter_xfr(package.select_out);|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record utf8 string('') event_type; utf8 string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1330988555|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|324|0|834|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|325|0|837|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|326|0|840|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|327|0|843|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|328|0|846|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|329|0|849|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|330|0|857|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{reading_graph_path; writing_graph_path; dataset\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@3|Sort|25000|85000|0|0|0|0|8900|Sort- Write graph and Dataset|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|331|0|859|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|332|0|862|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|333|0|864|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|334|0|866|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|335|0|869|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|336|0|875|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@3|Trash|413000|230000|0|0|0|0|8909|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010202004|XXGiport|337|0|877|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|338|0|880|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher, fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Trash|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|339|0|882|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|340|0|887|0|{@{}@0|0|0|0|out0|.41745283018867924|@@@14352|0|}}
{2010202004|XXGiport|341|0|891|0|{@{}@0|0|0|0|in0|.3915094339622642|@@@13840|0|}}
{2010501005|XXGpvertex|342|0|895|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
  let pset_rel_path = string_replace(in.pset_file_name, "./", "");
  let filename = "$"+"\{AI_PSET\}/" + pset_rel_path; 
  let pset_name = re_replace(filename, "^.*/", "");
  let pset_class = re_replace(pset_name, "[._].*", "");
  out.pset_base :: string_replace(pset_name,".pset","");
  out.pset_name :: pset_name;
  out.pset_class :: pset_class;
  out.pset_system :: switch ( pset_class )
      case "aggr", "clean", "get", "load", "map", "unload","keying","placeholder","produce": string_split(pset_name, ".")[1];
      case "shred": string_split(pset_name, ".")[2];
      default: force_error("Unknow PSet Class: " + pset_class);
    end;
  out.object_name :: re_replace(re_replace(pset_name, "^[a-z_]*[.]", ""), "[.]pset$", "");
  out.pset_eme_path :: "/Projects/$\{AI_REL_LOC\}/pset/"+pset_rel_path;
  out.pset_file_name :: filename;
  out.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|out0_metadata|record
  string("\\n") pset_class;
  string("\\n") pset_system;
  string("\\n") pset_base;
  string("\\n") pset_name;
  string("\\n") pset_eme_path;
  string("\\n") pset_file_name;
  string("\\n") object_name;
end;|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|@455000|372500|440000|303000|138000|107000|9542|Decompose File Names|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|343|0|897|0|{@{}@577000|349000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|344|0|900|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|345|0|902|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|346|0|904|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|347|0|906|0|{@{}@430000|349000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|348|0|909|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1364510557|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|349|0|911|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|350|0|915|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|351|0|918|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|352|0|921|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|353|0|924|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|354|0|927|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|category|graph|3|2|$|@{0|}}
{30001002|XXparameter|oid_as_path|True|3|1|l|@{0|}}
{30001002|XXparameter|path|-|3|1|l|@{0|}}
{30001002|XXparameter|read_metadata|record
  
string(big endian integer(4), charset="x-ab-internal") oid /*oid*/;
  record  
  big endian integer(4) count = 0;
  string(big endian integer(4),  charset="x-ab-internal")[count] list;
end AdhocGroupOID /*AdhocGroupOID*/;
  record  
  big endian integer(4) count = 0;
  string(big endian integer(4),  charset="x-ab-internal")[count] list;
end DocOID /*DocOID*/;
  
string(big endian integer(4),  charset="x-ab-internal") MetadataSource /*MetadataSource*/;
  
string(big endian integer(4),  charset="x-ab-internal") SourceUniqueID /*SourceUniqueID*/;
  
string(big endian integer(4),  charset="x-ab-internal") abbreviation /*abbreviation*/;
  
string(big endian integer(4),  charset="x-ab-internal") author /*author*/;
  
string(big endian integer(4),  charset="x-ab-internal") categoryOID /*categoryOID*/;
  
string(big endian integer(4),  charset="x-ab-internal") comment /*comment*/;
  
string(big endian integer(4),  charset="x-ab-internal") created_by /*created_by*/;
  
ascii datetime('YYYY-MM-DD hh24:mi:ss') creation_date /*creation_date*/;
  record  
  big endian integer(4) count = 0;
  string(big endian integer(4),  charset="x-ab-internal")[count] list;
end datasetsReadOID /*datasetsReadOID*/;
  record  
  big endian integer(4) count = 0;
  string(big endian integer(4),  charset="x-ab-internal")[count] list;
end datasetsWrittenOID /*datasetsWrittenOID*/;
  
string(big endian integer(4),  charset="x-ab-internal") description /*description*/;
  
string(big endian integer(4),  charset="x-ab-internal") display_name /*display_name*/;
  
string(big endian integer(4),  charset="x-ab-internal") generatedByOID /*generatedByOID*/;
  
ascii datetime('YYYY-MM-DD hh24:mi:ss') modification_date /*modification_date*/;
  
string(big endian integer(4),  charset="x-ab-internal") modified_by /*modified_by*/;
  
string(big endian integer(4),  charset="x-ab-internal") name /*name*/;
  
string(big endian integer(4),  charset="x-ab-internal") path /*path*/;
  
string(big endian integer(4),  charset="x-ab-internal") projectOID /*projectOID*/;
  
string(big endian integer(4),  charset="x-ab-internal") usedAsComponentByOID /*usedAsComponentByOID*/;
  
string(big endian integer(4),  charset="x-ab-internal") version /*version*/;
end|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Metadata/EME/Unload/Unload_Category.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|root|$[ AR_ROOT + "\@\@" + AR_BRANCH ]|3|9||@{0|}}
{30001002|XXparameter|in_metadata|string('\\n')|3|1|l|@{0|}}
}}@1|@242000|652000|237000|472000|100000|60000|9700|Unload Graph Category|Ab Initio Software|Built-in 2.11:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|355|0|929|0|{@{}@336000|499000|11000|11000|read|0.0|@@@2512|0|}}
{2010202004|XXGiport|356|0|932|0|{@{}@227000|499000|11000|11000|in|0.0|@@@1728|0|}}
{2010501005|XXGpvertex|357|0|935|0|{Unloads all objects that are members of a given category|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname||3|1|Hl||{0|}}
{30001002|XXparameter|image__|air|3|2|H$||{0|}}
{30001002|XXparameter|root|$AB_AIR_ROOT|3|2|RFO$|source eme datastore|{0|}}
{30001002|XXparameter|version||3|2|FO$|eme datastore version or tag|{0|}}
{30001002|XXparameter|category||3|2|RFO$|category to unload|{0|}}
{30001002|XXparameter|oid_as_path|False|13|1|FKl|unload oid-based rules as paths, rather than in \@-syntax|{0|}}
{30001002|XXparameter|no_inherit|False|13|1|FKl|do not unload annotation rules of the parent category.|{0|}}
{30001002|XXparameter|all_record_rules|False|13|1|FKl|unload all annotation rules including common builtins.|{0|}}
{30001002|XXparameter|path|/|3|2|FK$|specifies a starting point for the unload.|{0|}}
{30001002|XXparameter|arule||16|2|FK$|specifies a list of the annotation rules to unload.|{0|}}
{30001002|XXparameter|root_word|-root|16|2|$|just part of the command line|{0|}}
{30001002|XXparameter|version_word|-version|16|2|$|just part of the command line|{0|}}
{30001002|XXparameter|cat_word|category|16|2|$|just part of the command line|{0|}}
{30001002|XXparameter|unload_word|unload|16|2|$|just part of the command line|{0|}}
{30001002|XXparameter|dml_word|-dml|16|2|$|just part of the command line|{0|}}
{30001002|XXparameter|_generate_dml_command|air|3|2|$|Command to generate category unload metadata|{0|}}
{30001002|XXparameter|_generate_dml_command_params|root_word positional root positional version_word positional version positional cat_word positional unload_word positional category positional dml_word positional no_inherit keyword all_record_rules keyword arule keyword|3|2|$|Parameters for category unload metadata generation|{0|}}
{30001002|XXparameter|read_metadata|generated _generate_dml_command apply|7|13|RFv|Record format|{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|read::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1330988555|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: in = "string('\\\\n')"|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|358|0|937|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=|Record format|{0|}}
}}@0|0|0|0|read|0.0|@@@2512|0|}}
{2010202004|XXGiport|359|0|940|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1728|0|}}
{2010501005|XXGpvertex|360|0|943|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|commandline|ksh -e -c '
cd "$\{PRIVATE_PSET\}"
find . -maxdepth 2 \\
  -name "get*.pset" -o \\
  -name "map*.pset" -o \\
  -name "keying*.pset" -o \\
  -name "load*.pset" -o \\
  -name "placeholder.*pset" -o \\
  -name "produce.*pset"
'|3|3|c|@{0|}}
{30001002|XXparameter|Layout|file:$PRIVATE_RUN|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record
  string("\\n") pset_file_name;
end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Run_Program.mpc|3|2|Pf$|@{0|}}
}}@1|@45000|413000|45000|308000|91000|89000|9647|Find PSets|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|361|0|945|0|{@{}@135000|349000|11000|11000|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|362|0|948|0|{@{}@35000|349000|11000|11000|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|363|0|950|0|{Executes a standard UNIX or Windows program.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|filter|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
{30001002|XXparameter|commandline||16|2|RFO$|Command line of UNIX or Windows program to execute|{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|in_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655971|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|364|0|952|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|365|0|955|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|366|0|959|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|$NOT_NEEDED_PSET_FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|@197000|395500|217000|311000|145000|89000|9532|Drop not needed psets On Pset Mask|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|367|0|961|0|{@{}@361000|349000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|368|0|964|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|369|0|967|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|370|0|969|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|371|0|971|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|372|0|973|0|{@{}@207000|349000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|373|0|976|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|select_expr||20|2|RFO$|Filter expression|{0|}}
{30001002|XXparameter|select_expr.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_select_expr|-use_package|3|2|RO$|Replaces select_expr as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_select_expr.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the select() function defined in the package|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) select_out::select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; deselect=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select_out); deselect=filter_xfr(package.select_out);|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1364525640|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|374|0|978|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|375|0|981|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|376|0|984|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|377|0|987|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|378|0|990|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|379|0|993|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|380|0|1001|0|{Subgraph created from graph "setup.generate_run_plan"|{}@0|@1139500|583000|0|0|0|0|9568|Dummy Link For Placeholder|Mukesh.Singh|Created 11/14/2016 2:02:59 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1051000|537000|3|}}
{2010240003|XXGlegend|381|0|1003|0|{@{}@Generate  additional task 
for placeholder psets|871000|23000|0|0|0|0|8727|}}
{2010242002|XXGface|382|0|1005|0|{@{}@Arial|8421504|90|0|}}
{2010240003|XXGlegend|383|0|1007|0|{@{}@Generate Dummy link between 
Placholder and Keying datasets

1. Placeholder will write dummy datasets
2.Keying will read those dummy Datasets|717000|217000|0|0|0|0|8741|}}
{2010242002|XXGface|384|0|1009|0|{@{}@Arial|8421504|90|0|}}
{2010240003|XXGlegend|385|0|1011|0|{@{}@Generate Dummy links between 
Map and Placeholder

1. Map will be writing graph
2.Placholder will be reading graph|297000|192000|0|0|0|0|8827|}}
{2010242002|XXGface|386|0|1013|0|{@{}@Arial|8421504|90|0|}}
{2010240003|XXGlegend|387|0|1015|0|{@{}@Till here a link like :
map -> keying existed|31000|381000|0|0|0|0|8759|}}
{2010242002|XXGface|388|0|1017|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|389|0|1019|0|{@{}@After this, a link like :

map -> Placeholder -> keying is created 
by inserting dummy eme datasets in between
map and keying datasets|701000|441000|0|0|0|0|8760|}}
{2010242002|XXGface|390|0|1021|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|391|0|1023|0|{@{}@All psets except map & keying|290000|335000|0|0|0|0|8750|}}
{2010242002|XXGface|392|0|1025|0|{@{}@Arial|8421504|90|0|}}
{2010210004|XXGflow|393|0|1028|0|{@{}@384|.5|.5|{0|}8835|17|}}
{2010243001|XXGwatcher|394|0|1030|0|{@{}@1|100|0||0|}}
{2010210004|XXGflow|395|0|1032|0|{@{}@384|.5|.5|{0|}8839|17|}}
{2010243001|XXGwatcher|396|0|1034|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|397|0|1036|0|{@{}@384|.5|.5|{0|}8815|17|}}
{2010210004|XXGflow|398|0|1039|0|{@{}@384|.5|.5|{0|}8836|17|}}
{2010243001|XXGwatcher|399|0|1041|0|{@{}@1|100|0||0|}}
{2010501005|XXGpvertex|400|0|1044|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@3|Gather|774000|380000|0|0|0|0|8814|Gather addional psets created|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|401|0|1046|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|402|0|1048|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|403|0|1053|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Gather|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|404|0|1055|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|405|0|1058|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|406|0|1064|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
let string("") v_map_target_name = string_split(in.preceeding_mp_pset_for_placholder,".")[length_of(string_split(in.preceeding_mp_pset_for_placholder,".")) - 2];
let decimal("") v_uniq_placeholder_task_num=next_in_sequence();
  out.pset_class :: "placeholder";
  out.pset_system :: "ids_all";
  out.pset_base :: "placeholder_of_" + v_map_target_name  + "_" + (string("")) v_uniq_placeholder_task_num;
  out.pset_name :: "run.all.placeholder.pset";
  out.pset_eme_path :: "/Projects/orca/rxclaim/pset/framework/run.all.placeholder.pset";
  out.object_name :: "run.all.placeholder";
  out.pset_file_name :: "$\{AI_PSET\}/framework/run.all.placeholder.pset"; 
  out.preceeding_mp_pset_for_placholder :: in.preceeding_mp_pset_for_placholder;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|record
  string("\\n") pset_class;
  string("\\n") pset_system;
  string("\\n") pset_base;
  string("\\n") pset_name;
  string("\\n") pset_eme_path;
  string("\\n") pset_file_name;
  string("\\n") object_name;
  string("\\n") preceeding_mp_pset_for_placholder="";
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Reformat|702000|10000|0|0|0|0|8840|Generate –sequential task for placeholder|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|407|0|1066|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|408|0|1068|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|409|0|1070|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|410|0|1072|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|411|0|1074|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|412|0|1077|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|413|0|1079|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|414|0|1083|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|415|0|1086|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|416|0|1089|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|417|0|1092|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|418|0|1098|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@3|Replicate|565000|65000|0|0|0|0|8795|Replicate-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|419|0|1100|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|420|0|1104|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|421|0|1107|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|422|0|1109|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|423|0|1112|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|424|0|1118|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|let decimal("") i=0;
let string("") v_dummy_dataset_id="";
out :: reformat(in) =
begin


  let string("") v_map_graph_name =string_split(in.writing_graph_path,"/")[length_of(string_split(in.writing_graph_path,"/")) - 1];
  let string("") v_map_target_name = string_split(v_map_graph_name,".")[length_of(string_split(v_map_graph_name,".")) - 2];
  v_dummy_dataset_id="dummy" +  (string("")) i ; 
   i = i + 1;
   
  out.writing_graph_path :: "$\{AI_PSET\}" + "/framework/placeholder_of_" + v_map_target_name  + "_" + (string("")) i +" .pset";
  out.dataset :: string_replace(in.dataset,"\{RUN_ID\}",v_dummy_dataset_id);
  out.preceeding_mp_pset_for_placholder :: v_map_graph_name ;

  out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out1_metadata|record
  string(big endian integer(4),  charset="x-ab-internal") writing_graph_path /*path*/;
  string(big endian integer(4),  charset="x-ab-internal") reading_graph_path /*path*/;
  string(big endian integer(4),  charset="x-ab-internal") dataset;
  string("\\n") preceeding_mp_pset_for_placholder="";
end;|3|1|l|@{0|}}
{30001002|XXparameter|transform1|let decimal("") j=0;
let string("") v_dummy_dataset_id="";
out :: reformat(in) =
begin
    let string("") v_map_graph_name =string_split(in.writing_graph_path,"/")[length_of(string_split(in.writing_graph_path,"/")) - 1];
     let string("") v_map_target_name = string_split(v_map_graph_name,".")[length_of(string_split(v_map_graph_name,".")) - 2];
     j = j + 1;
     v_dummy_dataset_id="dummy" +  (string("")) j ; 


  
  out.reading_graph_path :: "$\{AI_PSET\}" + "/framework/placeholder_of_" + v_map_target_name  + "_" +  (string("")) j +" .pset";
  out.dataset :: string_replace(in.dataset,"\{RUN_ID\}",v_dummy_dataset_id);

  out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Reformat|255000|45000|0|0|0|0|8837|Write Dummy  Datasets  for placeholders|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|425|0|1120|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|426|0|1123|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|427|0|1126|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|428|0|1128|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|429|0|1130|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|430|0|1132|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|431|0|1134|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|432|0|1136|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|433|0|1139|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform1||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|434|0|1141|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|435|0|1145|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|436|0|1149|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|437|0|1152|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|438|0|1155|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|439|0|1158|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|440|0|1161|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|441|0|1164|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|442|0|1172|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010203004|XXGoport|443|0|1176|0|{@{}@0|0|0|0|out1|.11475409836065574|@@@14352|0|}}
{2010202004|XXGiport|444|0|1180|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|445|0|1185|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|not lookup_match("InActivePset",string_filter_out(pset_name,".pset"))
and not lookup_match("InActivePset",pset_name)
and not starts_with(pset_name,"placeholder.")|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Filter by Expression|672000|363500|0|0|0|0|9671|FBE: Drop Inactive psets|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|446|0|1187|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|447|0|1190|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|448|0|1193|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|449|0|1195|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|450|0|1197|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|451|0|1199|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|452|0|1202|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|select_expr||20|2|RFO$|Filter expression|{0|}}
{30001002|XXparameter|select_expr.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_select_expr|-use_package|3|2|RO$|Replaces select_expr as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_select_expr.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the select() function defined in the package|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) select_out::select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; deselect=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select_out); deselect=filter_xfr(package.select_out);|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|Filter by Expression|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|453|0|1204|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|454|0|1207|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|455|0|1210|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|456|0|1213|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|457|0|1216|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|458|0|1219|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|459|0|1227|0|{|{}@0|@544000|737500|0|0|0|0|9694|Find Fsk List||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|894000|400000|7|}}
{2010240003|XXGlegend|460|0|1229|0|{@{}@More Components have been used to maintain 
code understandability|60000|262000|0|0|0|0|9202|}}
{2010242002|XXGface|461|0|1231|0|{@{}@Arial|8388608|90|0|}}
{2010210004|XXGflow|462|0|1233|0|{@{}@384|.5|.5079365372657776|{0|}9238|17|}}
{2010210004|XXGflow|463|0|1235|0|{@{}@384|.5|.5|{0|}9239|17|}}
{2010501005|XXGpvertex|464|0|1237|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|string_index(oid,"map.")  and
( string_index(oid,"_f_") or string_index(oid,"_d_") or string_index(oid,".f_") or string_index(oid,".d_") )|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Filter by Expression|106000|122500|0|0|0|0|9235|Filter- Fact & Dim Map & Keying|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|465|0|1239|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|466|0|1242|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|467|0|1244|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|468|0|1246|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|469|0|1248|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|470|0|1250|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|471|0|1252|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|select_expr||20|2|RFO$|Filter expression|{0|}}
{30001002|XXparameter|select_expr.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_select_expr|-use_package|3|2|RO$|Replaces select_expr as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_select_expr.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the select() function defined in the package|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) select_out::select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; deselect=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select_out); deselect=filter_xfr(package.select_out);|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|Filter by Expression|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|472|0|1254|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|473|0|1257|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|474|0|1260|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|475|0|1263|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|476|0|1266|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|477|0|1269|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|478|0|1272|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0262|3|2|$|@{0|}}
{30001002|XXparameter|key|\{map_pset\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOOKUP/link.$INSTANCE_NAME.fsk_list.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOOKUP/link.$INSTANCE_NAME.fsk_list.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|record
string("\|") ilm_pset="";
string("\|") map_pset="";
string("\|") keying_pset="";
string("\\n") v_final_list="";
end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@2|@891000|842500|803000|603000|56000|50000|9610|Link For Fsk For Map|Ab Initio Software||1|10000|0||6||33025|-1|-1|}}
{2010202004|XXGiport|479|0|1274|0|{@{}@793000|624000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|480|0|1277|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url|@28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|param block_compressed True mode lookup version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 85 subkind 0 parts [vector]]]|28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|mpcmodtime|1364510553|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|481|0|1279|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|482|0|1286|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|not is_blank(v_final_list)|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Filter by Expression|536000|112500|0|0|0|0|9226|Filter: Pass Only Matching Fsk|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|483|0|1288|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|484|0|1290|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|485|0|1292|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|486|0|1294|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|487|0|1296|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|488|0|1298|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|489|0|1301|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|select_expr||20|2|RFO$|Filter expression|{0|}}
{30001002|XXparameter|select_expr.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_select_expr|-use_package|3|2|RO$|Replaces select_expr as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_select_expr.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the select() function defined in the package|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) select_out::select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; deselect=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select_out); deselect=filter_xfr(package.select_out);|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|Filter by Expression|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|490|0|1303|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|491|0|1306|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|492|0|1309|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|493|0|1312|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|494|0|1315|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|495|0|1318|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|496|0|1323|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|record
string("\|") ilm_pset="";
string("\|") map_pset="";
string("\|") keying_pset="";
string("\\n") v_final_list="";
end|3|1|l|@{0|}}
{30001002|XXparameter|transform0|let string("") v_ilm_nm="";
let string("") v_ilm_pset_nm="";
let string("") v_map_pset_nm="";
let string("") v_fsk_list="";
let string("") v_final_fsk_list="";
let string("") v_all_dim = "";
let string("") v_all_dim_dep = "";
let string("")[int] v_fsk_list_vec=allocate_with_defaults();
let string("")[int] v_uniq_fsk_list_vec=allocate_with_defaults();
let string("") v_keying_pset_nm="";
let int len=0;
let int i=0;
let int j=0;

let string("")[int] v_all_keying_pset_vec=$[string_representation(ALL_KEYING_PSET_VEC)];
let v_len_key_vec=length_of(v_all_keying_pset_vec);
out :: reformat(in) =
begin
  let int k=0 ;
  i=0;
  v_map_pset_nm=string_split(in.oid,"/")[length_of(string_split(in.oid,"/")) - 1 ];
  v_ilm_nm=string_split(v_map_pset_nm,".")[3];
  v_ilm_pset_nm=$"AI_PSET" + "/setup.ilm/setup.ilm." + string_split(v_map_pset_nm,".")[3] + ".pset" ;
  v_fsk_list=if(file_information(v_ilm_pset_nm).found) vector_select(pset_info(read_file(v_ilm_pset_nm)).parameters,
       [record name "FSK_TABLE_LIST" value "" interpretation "pdl" value_in_file "0" interpret_file_contents "0" overridable "1"],\{name\})[0].value  else "";
   v_fsk_list_vec=string_split_no_empty(v_fsk_list,"\\n");
   v_all_dim_dep="";
   len=length_of(v_fsk_list_vec);
             if (  ( len > 1 ) )
             
                 begin
                          for (i, i < len ) 
                            begin
                               if( ( not starts_with(v_fsk_list_vec[i],"#")  and ( not string_index(v_fsk_list_vec[i],"l_") ) ) or lookup_match("Daily Load Static Dims",v_fsk_list_vec[i]) )
                                v_all_dim_dep= string_concat(v_all_dim_dep,"\|",string_substring(v_fsk_list_vec[i],string_index(v_fsk_list_vec[i],"ids"),999));
                             end ;
                 end 
  // Find Keying pset from ILM  

 for (k, k< v_len_key_vec ) 
   begin block search_keying
         if(v_ilm_nm==string_split(v_all_keying_pset_vec[k],".")[1])
                begin
                  v_keying_pset_nm=v_all_keying_pset_vec[k];
                  exit search_keying ;
                end
   end block search_keying 
   
 v_uniq_fsk_list_vec=vector_sort_dedup_first(string_split_no_empty(v_all_dim_dep,"\|") );        
  out.ilm_pset::  v_ilm_pset_nm ;
  out.map_pset :: v_map_pset_nm ;
  out.keying_pset :: v_keying_pset_nm ;
  out.v_final_list :: string_join(v_uniq_fsk_list_vec,"\|") ;
  
  end|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|307000|120000|0|0|0|0|9240|Rfmt:Find Fsk From Ilm|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|497|0|1325|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|498|0|1328|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|499|0|1330|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|500|0|1332|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|501|0|1334|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|502|0|1337|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|503|0|1339|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|504|0|1343|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|505|0|1346|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|506|0|1349|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|507|0|1352|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|508|0|1361|0|{@{}@0|0|0|0|out0|.5025|@@@14352|0|}}
{2010202004|XXGiport|509|0|1365|0|{@{}@0|0|0|0|in0|.6425|@@@13840|0|}}
{2010501005|XXGpvertex|510|0|1370|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@4|Gather|1222000|440000|0|0|0|0|9560|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|511|0|1372|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|512|0|1375|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|513|0|1379|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Gather|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|514|0|1381|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|515|0|1384|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|516|0|1388|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|select_expr|lookup_match("Partial Plan Links by Reader", pset_eme_path)
or lookup_match("Partial Plan Links by Writer", pset_eme_path)|3|3|c|@{0|}}
{30001002|XXparameter|condition|$GENERATE_PARTIAL_PLAN|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|=|@{0|}}
{30001002|XXparameter|out_metadata|record
  string("\\n") pset_class;
  string("\\n") pset_system;
  string("\\n") pset_base;
  string("\\n") pset_name;
  string("\\n") pset_eme_path;
  string("\\n") pset_file_name;
  string("\\n") object_name;
  string("\\n") preceeding_mp_pset_for_placholder="";
end;|3|1|l|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@4|@1068000|205500|818000|286000|137000|127000|9604|Optional: Keep Partial Plan Tasks|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|517|0|1390|0|{@{}@954000|344000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|518|0|1393|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|519|0|1395|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|520|0|1397|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|521|0|1399|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|522|0|1401|0|{@{}@808000|344000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|523|0|1404|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|select_expr||20|2|RFO$|Filter expression|{0|}}
{30001002|XXparameter|select_expr.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_select_expr|-use_package|3|2|RO$|Replaces select_expr as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_select_expr.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the select() function defined in the package|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) select_out::select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; deselect=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select_out); deselect=filter_xfr(package.select_out);|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1364510557|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|524|0|1406|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|525|0|1409|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|526|0|1412|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|527|0|1415|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|528|0|1418|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|529|0|1421|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|530|0|1429|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("lookup", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_META/inactive_pset_list.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_META/inactive_pset_list.dat|3|2|$|@{0|}}
{30001002|XXparameter|RecordFormat|record
  string("\\n") pset_nm;
end|3|2|$|@{0|}}
{30001002|XXparameter|key|\{pset_nm\}|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[CHECK_INACTIVE_PSET_LIST_FILE]|3|9||@{0|}}
}}@0|@547000|193500|0|0|0|0|9696|InActivePset|Ab Initio Software|@1|20500|0||6||33025|-1|-1|}}
{2010503005|XXGfvertex|531|0|1431|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010503005|XXGfvertex|532|0|1433|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_TEMP/eme_unloads.txt", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_TEMP/eme_unloads.txt|3|2|$|@{0|}}
}}@1|@385000|657500|0|0|0|0|9533|Intermediate File|Ab Initio Software|@1|10000|0||6||257|-1|-1|}}
{2010203004|XXGoport|533|0|1435|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|534|0|1439|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|535|0|1442|0|{Represents one file, many files, or a multifile of intermediate results that your graph writes and saves for review.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0063|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|write|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|read|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|536|0|1444|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|537|0|1447|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|538|0|1452|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
  out :: in.pset_eme_path;
end;|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|@68000|632500|43000|453000|117000|107000|9531|Keep EME Path|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|539|0|1454|0|{@{}@159000|499000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|540|0|1457|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|541|0|1459|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|542|0|1461|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|543|0|1463|0|{@{}@33000|499000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|544|0|1466|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1364510557|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|545|0|1468|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|546|0|1472|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|547|0|1475|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|548|0|1478|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|549|0|1481|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|550|0|1488|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0200|3|2|$|@{0|}}
{30001002|XXparameter|key|\{keying_pset\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOOKUP/link.$INSTANCE_NAME.fsk_list.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("lookup", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOOKUP/link.$INSTANCE_NAME.fsk_list.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|record
string("\|") ilm_pset="";
string("\|") map_pset="";
string("\|") keying_pset="";
string("\\n") v_final_list="";
end|3|1|l|@{0|}}
}}@0|@1006000|847500|803000|603000|56000|50000|9608|Link For Fsk For Keying|Ab Initio Software||1|10000|0||6||33025|-1|-1|}}
{2010503005|XXGfvertex|551|0|1490|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|RecordFormat||7|1|RFl||{0|}}
{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url|@28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|param block_compressed True mode lookup version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 85 subkind 0 parts [vector]]]|28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1364510553|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010600005|XXGgraph|552|0|1493|0|{Subgraph created from graph "plan-from-lineage"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|DATASETS_READ_PATH_CLEANSE_XFR||8|1|FOsl|Reformat transform|{0|}}
{30001002|XXparameter|DATASETS_WRITTEN_PATH_CLEANSE_XFR||8|1|FOsl|Reformat transform|{0|}}
}}@0|@535000|585000|434000|461000|1088000|520000|9563|Link PSets via Datasets|spresley|Created 4/30/2013 2:44:32 PM|1|100|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}.16743330657482147|1087000|520000|3|}}
{2010240003|XXGlegend|553|0|1495|0|{@{}@Join graphs that write to a dataset to graphs that
read the same dataset thereby implying a dependency

standalone graphs will fall out of the join + filter|541000|115000|561000|135000|314000|64000|869|}}
{2010242002|XXGface|554|0|1497|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|555|0|1499|0|{@{}@384|.5|.5|{8|709000|264000|729000|264000|861000|264000|882000|264000|}901|17|}}
{2010210004|XXGflow|556|0|1501|0|{@{}@384|.5|.5|{12|201000|244000|221000|244000|251000|244000|251000|194000|282000|194000|303000|194000|}896|17|}}
{2010210004|XXGflow|557|0|1503|0|{@{}@384|.5|.5|{12|201000|284000|221000|284000|251000|284000|251000|339000|282000|339000|303000|339000|}882|17|}}
{2010210004|XXGflow|558|0|1505|0|{@{}@384|.5|.5362318754196167|{12|442000|194000|462000|194000|498000|194000|498000|239000|531000|239000|552000|239000|}897|1041|}}
{2010210004|XXGflow|559|0|1507|0|{@{}@384|.5|.5384615659713745|{12|446000|339000|466000|339000|501000|339000|501000|289000|531000|289000|552000|289000|}888|1041|}}
{2010210004|XXGflow|560|0|1509|0|{@{}@384|.5|.5|{0|}889|17|}}
{2010210004|XXGflow|561|0|1511|0|{@{}@384|.5|.5|{0|}890|17|}}
{2010501005|XXGpvertex|562|0|1513|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|key|\{dataset\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|out :: join(read, write) =
begin
  out.writing_graph_path :: write.path;
  out.reading_graph_path :: read.path;
  out.dataset :: read.dataset;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|record
  string(big endian integer(4),  charset="x-ab-internal") writing_graph_path /*path*/;
  string(big endian integer(4),  charset="x-ab-internal") reading_graph_path /*path*/;
  string(big endian integer(4),  charset="x-ab-internal") dataset;
end;|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Join.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|@543000|190000|563000|210000|136000|107000|891|Inner Join by Dataset|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|563|0|1515|0|{@{}@698000|259000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|564|0|1518|0|{@{}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|565|0|1521|0|{@{}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|566|0|1524|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|567|0|1526|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|568|0|1528|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|569|0|1530|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|570|0|1532|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|571|0|1534|0|{@{}@553000|234000|11000|11000|read|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|572|0|1537|0|{@{}@553000|284000|11000|11000|write|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|573|0|1540|0|{Performs inner, outer, and semi-joins with multiple flows of data records. It maximizes performance by loading input data records into main memory.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?join|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of inputs to join function|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Ordering of input data|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|_min_count|2|1|2|FH$|Minimum number of inputs to join|{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field(s) on which to join|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required DML function|{0|}}
{30001002|XXparameter|join_type|Inner Join (matching records required on all inputs)|15|1|Fl|Handling for duplicate and missing key values|{3|Inner Join (matching records required on all inputs)|Full Outer Join (use null for missing records)|Explicit|}}
{30001002|XXparameter|join_type.display_name|join-type|3|9|P|@{0|}}
{30001002|XXparameter|record_required0|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|dedup1|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select0||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|select1||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input_display_values|In-memory;Inputsneednotbesorted Inputsmustbesorted|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input_display_values.display_name|sorted-input-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_required_display_values|True(recordrequiredonthisinput) False(usenullformissingrecord)|3|2|H$||{0|}}
{30001002|XXparameter|record_required_display_values.display_name|record-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|dedup_display_values|Donotdedupthisinput Dedupthisinputbeforejoining|3|2|H$||{0|}}
{30001002|XXparameter|dedup_display_values.display_name|dedup-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_positional1|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0|sameas select|20|13|Ov|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1|sameas select|20|13|Ov|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0|sameas select|20|13|Kv|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1|sameas select|20|13|Kv|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|2|FK$|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|2|FK$|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|driving|0|1|2|FK$|The largest input; all other inputs will be read into memory|{0|}}
{30001002|XXparameter|driving.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|maintain_order|False|13|1|FKl|Exit rather than spill to disk|{0|}}
{30001002|XXparameter|maintain_order.display_name|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.keyword|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.condition|version 2.2.2: param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_core|67108864|1|2|FK$|Maximum memory usage (for non-driving inputs before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_memory|8388608|1|2|FK$|Maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_memory.display_name|max-memory|3|9|P|@{0|}}
{30001002|XXparameter|max_memory.keyword|max-memory|3|9|P|@{0|}}
{30001002|XXparameter|max_memory.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort|False|13|1|FKl|Always check sort order on inputs|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 3.0.1.r9: param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_intermediate||15|1|Fl|Frequency of intermediate records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_intermediate.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::join(in[*])|3|2|H$|Join transform|{0|}}
{30001002|XXparameter|sorted_mpname|merge-join|3|2|H$||{0|}}
{30001002|XXparameter|sorted_mpname.display_name|sorted-mpname|3|9|P|@{0|}}
{30001002|XXparameter|memory_mpname|hash-join|3|2|H$||{0|}}
{30001002|XXparameter|memory_mpname.display_name|memory-mpname|3|9|P|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp max-memory max-core dedup singlematch dedup-keyword singlematch record-required matchoptional record-required-keyword matchoptional select-keyword select record-required-positional matchoptional dedup-positional singlematch|3|2|H$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|unused_port_version|2.4.18:|3|2|H$|Version that unused ports became available|{0|}}
{30001002|XXparameter|unused_port_version.display_name|unused-port-version|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in*; unused*=in*; error*=^error|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record utf8 string('') event_type; utf8 string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|error_port_type error <parameter error0_metadata>|3|2|H$|Type for make_error output|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in[*])|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in[*])|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in[*])|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|unused0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|unused1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,unused[*],reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1330988555|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: unused = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|574|0|1542|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|575|0|1545|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|576|0|1548|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|577|0|1551|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|578|0|1554|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|579|0|1557|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|580|0|1560|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|581|0|1563|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|582|0|1566|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|record_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select0||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
}}@0|0|0|0|read|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|583|0|1579|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|record_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup1||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select1||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
}}@0|0|0|0|write|0.0|count|in|1|1808|0|}}
{2010503005|XXGfvertex|584|0|1592|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0262|3|2|$|@{0|}}
{30001002|XXparameter|key|\{reading_graph_path\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOOKUP/link.$INSTANCE_NAME.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOOKUP/link.$INSTANCE_NAME.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/lookup.link.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@2|@903000|717500|803000|603000|56000|50000|9607|Links by Reader|Ab Initio Software||1|20500|0||6||33025|-1|-1|}}
{2010202004|XXGiport|585|0|1594|0|{@{}@793000|624000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|586|0|1597|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url|@28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|param block_compressed True mode lookup version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 85 subkind 0 parts [vector]]]|28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|mpcmodtime|1364510553|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|587|0|1599|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|588|0|1602|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|out :: length(in) =
begin
  out :: in.datasetsReadOID.count;
end;

out :: normalize(in, index) =
begin
  out.path :: in.path;
  out.dataset :: in.datasetsReadOID.list[index];
  out.usage :: 'R';
end;|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|record
  string(big endian integer(4),  charset="x-ab-internal") path;
  string(big endian integer(4),  charset="x-ab-internal") dataset;
  string(1) usage;
end;|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|@294000|120000|314000|140000|118000|107000|898|Normalize Datasets Read|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|589|0|1604|0|{@{}@431000|189000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|590|0|1607|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|591|0|1609|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|592|0|1611|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|593|0|1613|0|{@{}@304000|189000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|594|0|1616|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_intermediate||15|1|Fl|Frequency of intermediate records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_intermediate.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate types in transform package|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|num_operations|11|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|optional integer(8) out::length(in)|3|2|H$|Number of records to output.  Either this function or finished() must be defined.|{0|}}
{30001002|XXparameter|operation4|temp ? temp::normalize(temp, in, integer(8) index) : out::normalize(in, integer(8) index)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation5|optional temp ? integer(8) finished_out::finished(temp, in, integer(8) index) : integer(8) finished_out::finished(in, integer(8) index)|3|2|H$|Are we done with this input record?  Either this function or length() must be defined.|{0|}}
{30001002|XXparameter|operation6|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation7|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation3_analysis|integer(8) length_out::length(in)|3|2|H$|Number of records to output|{0|}}
{30001002|XXparameter|operation7_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record utf8 string('') event_type; utf8 string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1330988555|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|595|0|1618|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|596|0|1621|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|597|0|1624|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|598|0|1627|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|599|0|1630|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|600|0|1634|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out0_metadata|record
  string(big endian integer(4),  charset="x-ab-internal") path;
  record  
    big endian integer(4) count = 0;
    string(big endian integer(4),  charset="x-ab-internal")[count] list;
  end datasetsReadOID;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out1_metadata|record
  string(big endian integer(4),  charset="x-ab-internal") path;
  record  
    big endian integer(4) count = 0;
    string(big endian integer(4),  charset="x-ab-internal")[count] list;
  end datasetsWrittenOID;
end;|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|@55000|198500|75000|219000|116000|89000|878|Separate Vectors|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|601|0|1636|0|{@{}@190000|239000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|602|0|1639|0|{@{}@190000|279000|11000|11000|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|603|0|1642|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|604|0|1644|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|605|0|1646|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|606|0|1648|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|607|0|1650|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|608|0|1652|0|{@{}@65000|259000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|609|0|1654|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|transform1||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record utf8 string('') event_type; utf8 string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1330988555|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|610|0|1656|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|611|0|1660|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|612|0|1664|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|613|0|1667|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|614|0|1670|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|615|0|1673|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|616|0|1676|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|617|0|1679|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|618|0|1693|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|out :: length(in) =
begin
  out :: in.datasetsWrittenOID.count;
end;

out :: normalize(in, index) =
begin
  out.path :: in.path;
  out.dataset :: in.datasetsWrittenOID.list[index];
  out.usage :: 'W';
end;|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|@294000|265000|314000|285000|122000|107000|884|Normalize Datasets Written|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|619|0|1695|0|{@{}@435000|334000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|620|0|1698|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|621|0|1700|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|622|0|1702|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|623|0|1704|0|{@{}@304000|334000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|624|0|1707|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_intermediate||15|1|Fl|Frequency of intermediate records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_intermediate.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate types in transform package|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|num_operations|11|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|optional integer(8) out::length(in)|3|2|H$|Number of records to output.  Either this function or finished() must be defined.|{0|}}
{30001002|XXparameter|operation4|temp ? temp::normalize(temp, in, integer(8) index) : out::normalize(in, integer(8) index)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation5|optional temp ? integer(8) finished_out::finished(temp, in, integer(8) index) : integer(8) finished_out::finished(in, integer(8) index)|3|2|H$|Are we done with this input record?  Either this function or length() must be defined.|{0|}}
{30001002|XXparameter|operation6|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation7|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation3_analysis|integer(8) length_out::length(in)|3|2|H$|Number of records to output|{0|}}
{30001002|XXparameter|operation7_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record utf8 string('') event_type; utf8 string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1330988555|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|625|0|1709|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|626|0|1712|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|627|0|1715|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|628|0|1718|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|629|0|1721|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|630|0|1728|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|select_expr|writing_graph_path != reading_graph_path  // Remove read/write cycles.
and
(not string_index(writing_graph_path, "/load.") or
 not string_index(reading_graph_path, "/shred.") or
 not string_index(dataset, ".max_sk.") )// Remove Max SK links.
and
 (not (first_defined(length_of(re_get_match(reading_graph_path,"$LOOKUP_EXCLUDE_PATTERN" )),0) and string_index(writing_graph_path, "/load.") and string_index(reading_graph_path, "/get.") ) )|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|@873000|190500|893000|211000|130000|107000|902|Remove Cycles and Max SKs|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|631|0|1730|0|{@{}@1022000|259000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|632|0|1732|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|633|0|1734|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|634|0|1736|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|635|0|1738|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|636|0|1740|0|{@{}@883000|259000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|637|0|1743|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
{30001002|XXparameter|select_expr||20|2|RFO$|Filter expression|{0|}}
{30001002|XXparameter|select_expr.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_select_expr|-use_package|3|2|RO$|Replaces select_expr as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_select_expr.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the select() function defined in the package|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) select_out::select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; deselect=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select_out); deselect=filter_xfr(package.select_out);|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record utf8 string('') event_type; utf8 string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1330988555|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|638|0|1745|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|639|0|1748|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|640|0|1751|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|641|0|1754|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|642|0|1757|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|643|0|1760|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|644|0|1769|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Trash|532000|383500|0|0|0|0|858|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010202004|XXGiport|645|0|1771|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|646|0|1774|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher, fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Trash|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|647|0|1776|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|648|0|1781|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Trash|692000|343500|0|0|0|0|856|Trash-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|649|0|1783|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|650|0|1786|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher, fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Trash|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|651|0|1788|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|652|0|1793|0|{@{}@615000|499000|11000|11000|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|653|0|1797|0|{@{}@424000|499000|11000|11000|in|.5|@@@14096|0|}}
{2010503005|XXGfvertex|654|0|1802|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0200|3|2|$|@{0|}}
{30001002|XXparameter|key|\{writing_graph_path\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOOKUP/link.$INSTANCE_NAME.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("lookup", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOOKUP/link.$INSTANCE_NAME.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|RecordFormat|$PUB_DXF_DML/lookup.link.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_File.mdc|3|2|Pf$|@{0|}}
}}@0|@1006000|717500|903000|603000|56000|50000|9605|Links by Writer|Ab Initio Software||1|20500|0||6||33025|-1|-1|}}
{2010503005|XXGfvertex|655|0|1804|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url|@28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|param block_compressed True mode lookup version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 85 subkind 0 parts [vector]]]|28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1364510553|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|RecordFormat||7|1|RFl||{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010503005|XXGfvertex|656|0|1809|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0200|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|key|\{writing_graph_path\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOOKUP/partial_link.$INSTANCE_NAME.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("lookup", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOOKUP/partial_link.$INSTANCE_NAME.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|RecordFormat|$PUB_DXF_DML/lookup.link.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_File.mdc|3|2|Pf$|@{0|}}
}}@0|@1364000|987500|1141000|688000|56000|50000|9649|Partial Plan Links by Writer|Ab Initio Software||1|10000|0||6||33025|-1|-1|}}
{2010503005|XXGfvertex|657|0|1811|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url|@28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|param block_compressed True mode lookup version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 85 subkind 0 parts [vector]]]|28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1364510553|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|RecordFormat||7|1|RFl||{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010501005|XXGpvertex|658|0|1814|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|@780000|610000|690000|484000|50000|41000|9589|Replicate|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|659|0|1816|0|{@{}@739000|494000|11000|21000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|660|0|1820|0|{@{}@680000|499000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|661|0|1823|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1364510556|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|662|0|1825|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|663|0|1828|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|664|0|1834|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ not GENERATE_PARTIAL_PLAN ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@3|@1035000|605000|860000|479000|50000|41000|9539|Replicate.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|665|0|1836|0|{@{}@909000|494000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|666|0|1839|0|{@{}@850000|494000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|667|0|1842|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1364510556|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|668|0|1844|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|669|0|1847|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|670|0|1853|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@3|@1035000|990000|865000|689000|50000|41000|9613|Replicate,|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|671|0|1855|0|{@{}@914000|699000|11000|21000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|672|0|1859|0|{@{}@855000|704000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|673|0|1862|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1364510556|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|674|0|1864|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|675|0|1867|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|676|0|1873|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@926000|382500|656000|332000|50000|41000|9537|Replicate PSets|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|677|0|1875|0|{@{}@705000|344000|11000|21000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|678|0|1879|0|{@{}@646000|349000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|679|0|1882|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1364510556|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|680|0|1884|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|681|0|1887|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|682|0|1894|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|let string(int) [long]  _global_rollup_accumulation_step_pset = allocate();
//let string(int) [long]  _global_pred_links = allocate();
 let string("") v_limit_pool_nm='$' +'\{'+'PUB_RESOURCE_RESOURCE\}' + '/orca_' + "$\{PROJECT_NM\}" + '_limit.pool';
 let string("") v_priv_dim_pool_nm='$' +'\{'+'PUB_RESOURCE_RESOURCE\}' + '/orca_' + "$\{PROJECT_NM\}" + '_priv_dimension.pool';
 let string("") find_fsk_matches="";
 let string("")[int] map_fsk_vec=allocate_with_defaults();
 let string("")[int] map_fsk_resource_command_vec=allocate_with_defaults();
 let int fsk_len=0;
 let int i=0;
 let string("") placeholder_fsk_nm="";
 
 //Add Global Parameter for keying FSK
 let string("") find_keying_fsk_matches="";
  let string("")[int] keying_fsk_vec=allocate_with_defaults();
 let string("")[int] keying_fsk_resource_command_vec=allocate_with_defaults();
 let int keying_fsk_len=0;
 let int k=0;
type temporary_type =
record
end;

out :: error_msg(msg) =
begin
  out :: write_to_log_file("/~stderr", msg + "\\n");
end;

out :: get_fk_count(succ) =
begin
  let int dataset_count = lookup_count("Links by Reader",succ);
  let int i=0;
  let fk_count=0;
  
  for (i, i < dataset_count)
  begin
      if(re_index(lookup_next("Links by Reader").dataset,'.sk.dat$'))
      fk_count=fk_count+1;
  end

  out :: fk_count; 
end;


temp :: initialize(in) =
begin
  _global_rollup_accumulation_step_pset = [vector];
end;

out :: rollup(temp, in) =
begin
  let db_resource_pool = lookup("DB Resource Pool Lookup", in.pset_system).db_resource_pool;
  let resource_quantity = lookup("DB Resource Pool Lookup", in.pset_system).resource_quantity;
  let v_get_dl_identifier_pset_nm=string_split(in.pset_name,".")[1];
  
  // This section finds match for fsk resource in map graph task 
  
  find_fsk_matches=first_defined(lookup("Link For Fsk For Map",in.pset_name).v_final_list,"\|");
  map_fsk_vec=string_split_no_empty(find_fsk_matches,"\|");
  map_fsk_resource_command_vec=allocate_with_defaults();  //Set to initialize empty for each record .
  fsk_len=length_of(map_fsk_vec);
  i=0;
  if(fsk_len > 0 ) 
  for(i,i<fsk_len) 
      begin
      let string("") sub_area=string_split(map_fsk_vec[i],".")[0];
      let string("") request_command= if(sub_area =="ids_common") 'request "/' + in.pset_base + '" -pool="$' + '\{' + 'PUB_RESOURCE_RESOURCE' + '\}' + '/conf_dimension.pool" -resource="' + map_fsk_vec[i] + '" -quantity=1'
                                    else 'request "/' + in.pset_base + '" -pool="' + v_priv_dim_pool_nm +'" -resource="' + map_fsk_vec[i] + '" -quantity=1' ;
                                   map_fsk_resource_command_vec=vector_append(map_fsk_resource_command_vec, request_command );
       end
       
       
//This task find match for fsk resource in keying pset 
  
  find_keying_fsk_matches=first_defined(lookup("Link For Fsk For Keying",in.pset_name).v_final_list,"\|");
  keying_fsk_vec=string_split_no_empty(find_keying_fsk_matches,"\|");
  keying_fsk_resource_command_vec=allocate_with_defaults();  //Set to initialize empty for each record .
  keying_fsk_len=length_of(keying_fsk_vec);
  k=0;
  if(keying_fsk_len > 0 ) 
  for(k,k < keying_fsk_len) 
      begin
      let string("") keying_sub_area=string_split(keying_fsk_vec[k],".")[0];
      let string("") keying_request_command= if(keying_sub_area =="ids_common") 'request "/' + in.pset_base + '" -pool="$' + '\{' + 'PUB_RESOURCE_RESOURCE' + '\}' + '/conf_dimension.pool" -resource="' + keying_fsk_vec[k] + '" -quantity=1'
                                    else 'request "/' + in.pset_base + '" -pool="' + v_priv_dim_pool_nm +'" -resource="' + keying_fsk_vec[k] + '" -quantity=1' ;
                                   keying_fsk_resource_command_vec=vector_append(keying_fsk_resource_command_vec, keying_request_command );
       end                                
 
 // End of finding FSK resources .
 
    if ( ( in.pset_class != "get" )  &&
        !is_defined(lookup("Links by Reader",in.pset_eme_path).writing_graph_path))
      error_msg(in.pset_base + " has no predecessors!");
//This creates get parameters specific to get datalake graph 
 if ( in.pset_class == "get" && v_get_dl_identifier_pset_nm member string_split("$\{DATALAKE_GET_PSET_IDENTIFIER_LIST\}","\|") )
        _global_rollup_accumulation_step_pset = vector_concat(
        _global_rollup_accumulation_step_pset,
        if ( is_null(db_resource_pool) )
        [vector
          'task    "/' + in.pset_base + '" -kind=graph',
          'set     "/' + in.pset_base + '" ab_task_graph -expr="' + in.pset_file_name + '"',
          'set     "/' + in.pset_base + '" AB_INHERIT_SHARED_INPUTS -expr=True',
          'request "/' + in.pset_base + '" -pool="' + v_limit_pool_nm + '" -resource="parallel_tasks" -quantity=1',
          'input   "/' + in.pset_base + '" RUN_ID -expr="$RUN_ID"',
          'input   "/' + in.pset_base + '" EFF_DATE -expr="$EFF_DATE"',
          'input   "/' + in.pset_base + '" START_CHANGES_TIME -expr="$START_CHANGES_TIME"',          
          'input   "/' + in.pset_base + '" END_CHANGES_TIME -expr="$END_CHANGES_TIME"', 
          'input   "/' + in.pset_base + '" RUN_GROUP -expr="$RUN_GROUP"' ,
           'input   "/' + in.pset_base + '" USE_LOCAL_CTL -expr="$USE_LOCAL_CTL"',
           'input   "/' + in.pset_base + '" USE_GET_BYPASS_CTL -expr="$USE_GET_BYPASS_CTL"' ,
           'input   "/' + in.pset_base + '" LOCAL_TRIGGER_FILE_DIRECTORY -expr="$LOCAL_TRIGGER_FILE_DIRECTORY"',
           'input   "/' + in.pset_base + '" DATA_FILE_COMPRESS_FLAG -expr="$DATA_FILE_COMPRESS_FLAG"',
           'input   "/' + in.pset_base + '" HIST_PREFIX -expr="$HIST_PREFIX"',
                       
          ''
        ]);
          
    /*input   "/' + in.pset_base + '" CTL_FILE_MASK -expr="$CTL_FILE_MASK"',  */
    //Above get class was added on 12/23/2016 by misng114 to support additional parameters in get datalake graph
          
          else if ( in.pset_class == "get" )
        _global_rollup_accumulation_step_pset = vector_concat(
        _global_rollup_accumulation_step_pset,
        if ( is_null(db_resource_pool) )
        [vector
          'task    "/' + in.pset_base + '" -kind=graph',
          'set     "/' + in.pset_base + '" ab_task_graph -expr="' + in.pset_file_name + '"',
          'set     "/' + in.pset_base + '" AB_INHERIT_SHARED_INPUTS -expr=True',
          'request "/' + in.pset_base + '" -pool="' + v_limit_pool_nm + '" -resource="parallel_tasks" -quantity=1',
          'input   "/' + in.pset_base + '" RUN_ID -expr="$RUN_ID"',
          'input   "/' + in.pset_base + '" EFF_DATE -expr="$EFF_DATE"',
          'input   "/' + in.pset_base + '" START_CHANGES_TIME -expr="$START_CHANGES_TIME"', 
          'input   "/' + in.pset_base + '" END_CHANGES_TIME -expr="$END_CHANGES_TIME"',
          'input   "/' + in.pset_base + '" USE_GET_BYPASS_CTL -expr="$USE_GET_BYPASS_CTL"' ,
          ''
        ] );
//Assign FSK resources for Map 
        else if ( (in.pset_class == "map")  )
      _global_rollup_accumulation_step_pset = vector_concat(
      _global_rollup_accumulation_step_pset,
      if ( is_null(db_resource_pool) )
      
      vector_concat([vector
        'task    "/' + in.pset_base + '" -kind=graph',
        'set     "/' + in.pset_base + '" ab_task_graph -expr="' + in.pset_file_name + '"',
        'set     "/' + in.pset_base + '" AB_INHERIT_SHARED_INPUTS -expr=True',
        'request "/' + in.pset_base + '" -pool="' + v_limit_pool_nm + '" -resource="parallel_tasks" -quantity=1',
        'input   "/' + in.pset_base + '" IS_SUPPRESS_UPDATE_FOR_HIST -expr="$IS_SUPPRESS_UPDATE_FOR_HIST"',
        'input   "/' + in.pset_base + '" RUN_ID -expr="$RUN_ID"',
        'input   "/' + in.pset_base + '" EFF_DATE -expr="$EFF_DATE"',
         ''
      ], map_fsk_resource_command_vec ) ); 
      
      //Assign FSK resources for Map 
        else if ( (in.pset_class == "keying")  )
      _global_rollup_accumulation_step_pset = vector_concat(
      _global_rollup_accumulation_step_pset,
      if ( is_null(db_resource_pool) )
      
      vector_concat([vector
        'task    "/' + in.pset_base + '" -kind=graph',
        'set     "/' + in.pset_base + '" ab_task_graph -expr="' + in.pset_file_name + '"',
        'set     "/' + in.pset_base + '" AB_INHERIT_SHARED_INPUTS -expr=True',
        'request "/' + in.pset_base + '" -pool="' + v_limit_pool_nm + '" -resource="parallel_tasks" -quantity=1',
        'input   "/' + in.pset_base + '" IS_SUPPRESS_UPDATE_FOR_HIST -expr="$IS_SUPPRESS_UPDATE_FOR_HIST"',
        'input   "/' + in.pset_base + '" RUN_ID -expr="$RUN_ID"',
        'input   "/' + in.pset_base + '" EFF_DATE -expr="$EFF_DATE"',
         ''
      ], keying_fsk_resource_command_vec ) ); 
      
    else if ( in.pset_class == "load" && lookup_match("Conformed Dimension List",in.object_name) )
      _global_rollup_accumulation_step_pset = vector_concat(
      _global_rollup_accumulation_step_pset,
      if ( is_null(db_resource_pool) )
      [vector
        'task    "/' + in.pset_base + '" -kind=graph',
        'set     "/' + in.pset_base + '" ab_task_graph -expr="' + in.pset_file_name + '"',
        'set     "/' + in.pset_base + '" AB_INHERIT_SHARED_INPUTS -expr=True',
        'request "/' + in.pset_base + '" -pool="' + v_limit_pool_nm + '" -resource="parallel_tasks" -quantity=1',
        'request "/' + in.pset_base + '" -pool="$' + '\{' + 'PUB_RESOURCE_RESOURCE' + '\}' + '/conf_dimension.pool" -resource="' + in.object_name + '" -quantity=\\'$[begin let record string("") resource_name; decimal("") units; end[int] CONF_DIM_UNITS_VEC=for ( let string("") line in re_split_no_empty(re_replace(CONF_DIM_UNITS," ","="), "[\\\\\\\\n]+") ) :if(starts_with(line,"name=")) [record resource_name string_split(line, "=")[1] units string_split(line, "=")[5]]; result :: vector_select(CONF_DIM_UNITS_VEC,[record  resource_name "'+in.object_name+'" units "0"],\{resource_name\})[0].units; end]\\'',
                
        'input   "/' + in.pset_base + '" IS_SUPPRESS_UPDATE_FOR_HIST -expr="$IS_SUPPRESS_UPDATE_FOR_HIST"',
        'input   "/' + in.pset_base + '" RUN_ID -expr="$RUN_ID"',
        'input   "/' + in.pset_base + '" EFF_DATE -expr="$EFF_DATE"',
         ''
      ] );
   
     else if ( (in.pset_class == "load") && ! lookup_match("Conformed Dimension List",in.object_name)  )
      _global_rollup_accumulation_step_pset = vector_concat(
      _global_rollup_accumulation_step_pset,
      if ( is_null(db_resource_pool) )
      [vector
        'task    "/' + in.pset_base + '" -kind=graph',
        'set     "/' + in.pset_base + '" ab_task_graph -expr="' + in.pset_file_name + '"',
        'set     "/' + in.pset_base + '" AB_INHERIT_SHARED_INPUTS -expr=True',
        'request "/' + in.pset_base + '" -pool="' + v_limit_pool_nm + '" -resource="parallel_tasks" -quantity=1',
        'request "/' + in.pset_base + '" -pool="' + v_priv_dim_pool_nm +'" -resource="' + in.object_name + '" -quantity=\\'$[begin let record string("") resource_name; decimal("") units; end[int] PRIV_DIM_UNITS_VEC=for ( let string("") line in re_split_no_empty(re_replace(PRIV_DIM_UNITS," ","="), "[\\\\\\\\n]+") ) :if(starts_with(line,"name=")) [record resource_name string_split(line, "=")[1] units string_split(line, "=")[5]]; result :: vector_select(PRIV_DIM_UNITS_VEC,[record  resource_name "'+in.object_name+'" units "0"],\{resource_name\})[0].units; end]\\'',
        'input   "/' + in.pset_base + '" IS_SUPPRESS_UPDATE_FOR_HIST -expr="$IS_SUPPRESS_UPDATE_FOR_HIST"',
        'input   "/' + in.pset_base + '" RUN_ID -expr="$RUN_ID"',
        'input   "/' + in.pset_base + '" EFF_DATE -expr="$EFF_DATE"',
         ''
      ] ); 
      
       else if ( in.pset_class == "placeholder"  )
      _global_rollup_accumulation_step_pset = vector_concat(
      _global_rollup_accumulation_step_pset,
      if ( is_null(db_resource_pool) )
      [vector
        'task    "/' + in.pset_base + '" -kind=plantask',
        'set     "/' + in.pset_base + '" ab_task_plan -expr="' + in.pset_file_name + '"',
        'set     "/' + in.pset_base + '" AB_INHERIT_SHARED_INPUTS -expr=True',        
        'input   "/' + in.pset_base + '" RUN_ID -expr="$RUN_ID"',
        'input   "/' + in.pset_base + '" MAP_PSET_NM -expr="'+ in.preceeding_mp_pset_for_placholder +'"',
        'input   "/' + in.pset_base + '" FSK_DIMENSIONS -expr="'+ first_defined(lookup("Link For Fsk For Map",in.preceeding_mp_pset_for_placholder).v_final_list,"\|") +'"',
        /*'input   "/' + in.pset_base + '" FILE_MASK -expr=\\'' + '$["*placeholder.*'+string_split(in.preceeding_mp_pset_for_placholder,".")[length_of(string_split(in.preceeding_mp_pset_for_placholder,".")) - 2] + '*" + RUN_ID +"' + '*.dat.gz"]\\'',
        'input   "/' + in.pset_base + '" ACTIVE_FILE_WRITE_MASK -expr=\\'' + '$["*placeholder.*'+string_split(in.preceeding_mp_pset_for_placholder,".")[length_of(string_split(in.preceeding_mp_pset_for_placholder,".")) - 2] + '*" + RUN_ID +"' + '*.dat.gz.lock"]\\'',
        'input   "/' + in.pset_base + '" PRIV_DIM_POOL_PATH -expr="$' + '\{' + 'PUB_RESOURCE_RESOURCE' + '\}' + "/orca_" + "$\{PROJECT_NM\}" + '_priv_dimension.pool"',
        'input   "/' + in.pset_base + '" CONF_DIM_POOL_PATH -expr="$' + '\{' + 'PUB_RESOURCE_RESOURCE' + '\}' + '/conf_dimension.pool"',
        'input   "/' + in.pset_base + '" LIMITS_POOL_PATH -expr="$' + '\{' + 'PUB_RESOURCE_RESOURCE' + '\}' + "/orca_" + "$\{PROJECT_NM\}" + '_limit.pool"',*/
        ''
      ] );
    else
      _global_rollup_accumulation_step_pset = vector_concat(
      _global_rollup_accumulation_step_pset,
      //if ( is_null(db_resource_pool) )
      [vector
          'task    "/' + in.pset_base + '" -kind=graph',
          'set     "/' + in.pset_base + '" ab_task_graph -expr="' + in.pset_file_name + '"',
          'set     "/' + in.pset_base + '" AB_INHERIT_SHARED_INPUTS -expr=True',
          'request "/' + in.pset_base + '" -pool="' + v_limit_pool_nm + '" -resource="parallel_tasks" -quantity=1',
          'input   "/' + in.pset_base + '" RUN_ID -expr="$RUN_ID"',
          'input   "/' + in.pset_base + '" EFF_DATE -expr="$EFF_DATE"',
          'input   "/' + in.pset_base + '" START_CHANGES_TIME -expr="$START_CHANGES_TIME"',          
          'input   "/' + in.pset_base + '" END_CHANGES_TIME -expr="$END_CHANGES_TIME"',          
          ''
        ]);        
end;

out :: finalize(temp, in) =
begin
  out.plan_contents :: string_join(_global_rollup_accumulation_step_pset, "\\n");
end;|3|3|c|@{0|}}
{30001002|XXparameter|out_metadata|record 
  string('\\n') plan_contents;
end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@4|@1523000|387000|1038000|287000|134000|127000|9704|Rollup m_plan Commands for Tasks|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|683|0|1896|0|{@{}@1171000|344000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|684|0|1899|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|685|0|1901|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|686|0|1903|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|687|0|1905|0|{@{}@1028000|344000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|688|0|1908|0|{Generates data records that summarize groups of data records.  Rollup in memory maximizes performance by keeping intermediate results in main memory.  Rollup sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Ordering of input data|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input_display_values|In-memory:Inputneednotbesorted Inputmustbesortedorgrouped|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input_display_values.display_name|sorted-input-display-values|3|9|P|@{0|}}
{30001002|XXparameter|key_method|value sorted-input False True default constant True|13|13|Fv|How groups are specified|{0|}}
{30001002|XXparameter|key_method.display_name|key-method|3|9|P|@{0|}}
{30001002|XXparameter|key_method.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|key_method_display_values|Usekey_changefunction Usekeyspecifier|3|2|H$||{0|}}
{30001002|XXparameter|key_method_display_values.display_name|key-method-display-values|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key to define rollup groups|{0|}}
{30001002|XXparameter|key.condition|param key-method True|3|15|P?|@{0|}}
{30001002|XXparameter|positional_key|value key-method False "" sameas key|19|13|Ov|Key to define rollup groups|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
{30001002|XXparameter|max_core|67108864|1|2|FK$|Maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|check_sort|True|13|1|FKl|Abort on first record that is out of sorted order|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|param key-method True param sorted-input True version 2.11.1:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|grouped_input|False|13|1|Fl|Input data should be processed in groups|{0|}}
{30001002|XXparameter|grouped_input.display_name|grouped-input|3|9|P|@{0|}}
{30001002|XXparameter|grouped_input.condition|param sorted-input False version 2.14.102:|3|15|P?|@{0|}}
{30001002|XXparameter|grouped_input_display_values|Dataisnotgroupedbyamajorkey Dataisgroupedbyamajorkey|3|2|H$||{0|}}
{30001002|XXparameter|grouped_input_display_values.display_name|grouped-input-display-values|3|9|P|@{0|}}
{30001002|XXparameter|major_key||19|2|FK$|Major key into which data is grouped|{0|}}
{30001002|XXparameter|major_key.display_name|major-key|3|9|P|@{0|}}
{30001002|XXparameter|major_key.keyword|major-key|3|9|P|@{0|}}
{30001002|XXparameter|major_key.condition|param grouped-input True|3|15|P?|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_intermediate||15|1|Fl|Frequency of intermediate records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_intermediate.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|10|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of public variables in rollup|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|operation1|optional int out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|temp ? temp::rollup(temp, in) : out::rollup(in)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation4|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation5|optional int out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6|optional integer(8) out::key_change(in in1, in in2)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|operation1_analysis|int input_select_out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation5_analysis|int output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6_analysis|integer(8) key_change_out::key_change(in in, in in)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|_simple_transform_operation|rollup|3|2|H$|What operation should transform editor open with|{0|}}
{30001002|XXparameter|_simple_transform_operation.condition|version 2.11.7.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|sorted_mpname|rollup|3|2|H$||{0|}}
{30001002|XXparameter|sorted_mpname.display_name|sorted-mpname|3|9|P|@{0|}}
{30001002|XXparameter|memory_mpname|hash-rollup|3|2|H$||{0|}}
{30001002|XXparameter|memory_mpname.display_name|memory-mpname|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select); out=aggregate(key)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation7|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation8|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation9|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655976|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|689|0|1910|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|690|0|1913|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|691|0|1916|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|692|0|1919|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|693|0|1922|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|694|0|1928|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Trash|437000|520000|0|0|0|0|9548|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010202004|XXGiport|695|0|1930|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|696|0|1933|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher, fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Trash|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|697|0|1935|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|698|0|1940|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Trash|1019000|455000|0|0|0|0|9538|Trash-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|699|0|1942|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|700|0|1945|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher, fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Trash|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|701|0|1947|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|702|0|1953|0|{|{}@0|@27000|43500|0|0|0|0|9057|Version Log||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1153000|400000|7|}}
{2010240003|XXGlegend|703|0|1955|0|{@{}@Author                                         Date                                                                                     Description and Background details|36000|62000|0|0|0|0|5|}}
{2010242002|XXGface|704|0|1957|0|{@{}@Arial|128|90|0|}}
{2010240003|XXGlegend|705|0|1959|0|{@{}@Mukesh Singh(Exusia)                  07/21/2016|17000|94000|0|0|0|0|2|}}
{2010242002|XXGface|706|0|1961|0|{@{}@Arial|8388608|90|0|}}
{2010240003|XXGlegend|707|0|1963|0|{@{}@This Graph is designed & Developed 
by taking inspiration from DMF plan generator
process created by AbIntio Corp Devloper 
(Kimbo Mundy) . However several enhancement , dependency , resource assignment , 
flow generation process have been added as per DXF framework.|510000|86000|0|0|0|0|6|}}
{2010242002|XXGface|708|0|1965|0|{@{}@Arial|8388608|90|0|}}
{2010110002|XXGconstant|709|0|1967|0|{@{}@{1|4823074|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010605001|XXGgraph_legend_legend|6|0|12|0|{1|}1|7|}
{2010241001|XXGlegend_face_face|7|0|14|0|{}7|8|}
{2010605001|XXGgraph_legend_legend|8|0|16|0|{2|}1|9|}
{2010241001|XXGlegend_face_face|9|0|18|0|{}9|10|}
{2010605001|XXGgraph_legend_legend|10|0|20|0|{3|}1|11|}
{2010241001|XXGlegend_face_face|11|0|22|0|{}11|12|}
{2010605001|XXGgraph_legend_legend|12|0|24|0|{4|}1|13|}
{2010241001|XXGlegend_face_face|13|0|26|0|{}13|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_1|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_10|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_11|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_12|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_13|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_14|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_15|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_16|}1|22|}
{2010604001|XXGgraph_flow_flow|22|0|44|0|{Flow_17|}1|23|}
{2010604001|XXGgraph_flow_flow|23|0|46|0|{Flow_18|}1|24|}
{2010244001|XXGflow_watcher_watcher|24|0|48|0|{}24|25|}
{2010604001|XXGgraph_flow_flow|25|0|50|0|{Flow_19|}1|26|}
{2010604001|XXGgraph_flow_flow|26|0|52|0|{Flow_2|}1|27|}
{2010604001|XXGgraph_flow_flow|27|0|54|0|{Flow_20|}1|28|}
{2010604001|XXGgraph_flow_flow|28|0|56|0|{Flow_21|}1|29|}
{2010604001|XXGgraph_flow_flow|29|0|58|0|{Flow_22|}1|30|}
{2010244001|XXGflow_watcher_watcher|30|0|60|0|{}30|31|}
{2010604001|XXGgraph_flow_flow|31|0|62|0|{Flow_23|}1|32|}
{2010604001|XXGgraph_flow_flow|32|0|64|0|{Flow_24|}1|33|}
{2010604001|XXGgraph_flow_flow|33|0|66|0|{Flow_25|}1|34|}
{2010244001|XXGflow_watcher_watcher|34|0|68|0|{}34|35|}
{2010604001|XXGgraph_flow_flow|35|0|70|0|{Flow_26|}1|36|}
{2010604001|XXGgraph_flow_flow|36|0|72|0|{Flow_27|}1|37|}
{2010244001|XXGflow_watcher_watcher|37|0|74|0|{}37|38|}
{2010604001|XXGgraph_flow_flow|38|0|76|0|{Flow_28|}1|39|}
{2010244001|XXGflow_watcher_watcher|39|0|78|0|{}39|40|}
{2010604001|XXGgraph_flow_flow|40|0|80|0|{Flow_29|}1|41|}
{2010604001|XXGgraph_flow_flow|41|0|82|0|{Flow_3|}1|42|}
{2010244001|XXGflow_watcher_watcher|42|0|84|0|{}42|43|}
{2010604001|XXGgraph_flow_flow|43|0|86|0|{Flow_30|}1|44|}
{2010604001|XXGgraph_flow_flow|44|0|88|0|{Flow_31|}1|45|}
{2010604001|XXGgraph_flow_flow|45|0|90|0|{Flow_32|}1|46|}
{2010604001|XXGgraph_flow_flow|46|0|92|0|{Flow_4|}1|47|}
{2010604001|XXGgraph_flow_flow|47|0|94|0|{Flow_5|}1|48|}
{2010604001|XXGgraph_flow_flow|48|0|96|0|{Flow_6|}1|49|}
{2010604001|XXGgraph_flow_flow|49|0|98|0|{Flow_7|}1|50|}
{2010604001|XXGgraph_flow_flow|50|0|100|0|{Flow_8|}1|51|}
{2010604001|XXGgraph_flow_flow|51|0|102|0|{Flow_9|}1|52|}
{2010601001|XXGgraph_vertex_vertex|52|0|104|0|{Concatenate|}1|53|}
{2010212001|XXGvertex_oport_oport|53|0|106|0|{0|out|}53|54|}
{2010213001|XXGoport_dst_flow|54|0|108|0|{0|}54|50|}
{2010211001|XXGvertex_iport_iport|55|0|109|0|{0|in|}53|55|}
{2010214001|XXGiport_src_flow|56|0|111|0|{0|}55|30|}
{2010214001|XXGiport_src_flow|57|0|112|0|{1|}55|42|}
{2010214001|XXGiport_src_flow|58|0|113|0|{2|}55|20|}
{2010007001|XXGobject_proto_object|59|0|114|0|{}53|56|}
{2010212001|XXGvertex_oport_oport|60|0|116|0|{0|out|}56|57|}
{2010006001|XXGobject_psameas_object|61|0|118|0|{metadata|out_metadata|1|0|}57|56|}
{2010211001|XXGvertex_iport_iport|62|0|119|0|{0|in|}56|58|}
{2010006001|XXGobject_psameas_object|63|0|121|0|{metadata|in_metadata|1|0|}58|56|}
{2010006001|XXGobject_psameas_object|64|0|122|0|{Layout|Layout|0|0|}53|59|}
{2010211001|XXGvertex_iport_iport|65|0|124|0|{0|write|}59|60|}
{2010214001|XXGiport_src_flow|66|0|126|0|{0|}60|50|}
{2010007001|XXGobject_proto_object|67|0|127|0|{}59|61|}
{2010211001|XXGvertex_iport_iport|68|0|129|0|{0|write|}61|62|}
{2010006001|XXGobject_psameas_object|69|0|131|0|{metadata|write_metadata|1|0|}62|61|}
{2010006001|XXGobject_psameas_object|70|0|132|0|{in_metadata|out_metadata|0|0|}53|63|}
{2010212001|XXGvertex_oport_oport|71|0|134|0|{0|out|}63|64|}
{2010213001|XXGoport_dst_flow|72|0|136|0|{0|}64|20|}
{2010212001|XXGvertex_oport_oport|73|0|137|0|{1|reject|}63|65|}
{2010212001|XXGvertex_oport_oport|74|0|139|0|{2|error|}63|66|}
{2010212001|XXGvertex_oport_oport|75|0|141|0|{3|log|}63|67|}
{2010211001|XXGvertex_iport_iport|76|0|143|0|{0|in|}63|68|}
{2010214001|XXGiport_src_flow|77|0|145|0|{0|}68|39|}
{2010007001|XXGobject_proto_object|78|0|146|0|{}63|69|}
{2010212001|XXGvertex_oport_oport|79|0|148|0|{0|out|}69|70|}
{2010006001|XXGobject_psameas_object|80|0|150|0|{metadata|out_metadata|1|0|}70|69|}
{2010212001|XXGvertex_oport_oport|81|0|151|0|{1|reject|}69|71|}
{2010006001|XXGobject_psameas_object|82|0|153|0|{metadata|reject_metadata|1|0|}71|69|}
{2010212001|XXGvertex_oport_oport|83|0|154|0|{2|error|}69|72|}
{2010006001|XXGobject_psameas_object|84|0|156|0|{metadata|error_metadata|1|0|}72|69|}
{2010212001|XXGvertex_oport_oport|85|0|157|0|{3|log|}69|73|}
{2010006001|XXGobject_psameas_object|86|0|159|0|{metadata|log_metadata|1|0|}73|69|}
{2010211001|XXGvertex_iport_iport|87|0|160|0|{0|in|}69|74|}
{2010006001|XXGobject_psameas_object|88|0|162|0|{metadata|in_metadata|1|0|}74|69|}
{2010006001|XXGobject_psameas_object|89|0|163|0|{Layout|Layout|0|0|}63|59|}
{2010006001|XXGobject_psameas_object|90|0|164|0|{in_metadata|out_metadata|0|0|}63|75|}
{2010212001|XXGvertex_oport_oport|91|0|166|0|{0|out|}75|76|}
{2010213001|XXGoport_dst_flow|92|0|168|0|{0|}76|77|}
{2010244001|XXGflow_watcher_watcher|93|0|170|0|{}77|78|}
{2010212001|XXGvertex_oport_oport|94|0|172|0|{1|deselect|}75|79|}
{2010213001|XXGoport_dst_flow|95|0|174|0|{0|}79|80|}
{2010212001|XXGvertex_oport_oport|96|0|176|0|{2|reject|}75|81|}
{2010212001|XXGvertex_oport_oport|97|0|178|0|{3|error|}75|82|}
{2010212001|XXGvertex_oport_oport|98|0|180|0|{4|log|}75|83|}
{2010211001|XXGvertex_iport_iport|99|0|182|0|{0|in|}75|84|}
{2010007001|XXGobject_proto_object|100|0|184|0|{}75|85|}
{2010212001|XXGvertex_oport_oport|101|0|186|0|{0|out|}85|86|}
{2010006001|XXGobject_psameas_object|102|0|188|0|{metadata|out_metadata|1|0|}86|85|}
{2010212001|XXGvertex_oport_oport|103|0|189|0|{1|deselect|}85|87|}
{2010006001|XXGobject_psameas_object|104|0|191|0|{metadata|deselect_metadata|1|0|}87|85|}
{2010212001|XXGvertex_oport_oport|105|0|192|0|{2|reject|}85|88|}
{2010006001|XXGobject_psameas_object|106|0|194|0|{metadata|reject_metadata|1|0|}88|85|}
{2010212001|XXGvertex_oport_oport|107|0|195|0|{3|error|}85|89|}
{2010006001|XXGobject_psameas_object|108|0|197|0|{metadata|error_metadata|1|0|}89|85|}
{2010212001|XXGvertex_oport_oport|109|0|198|0|{4|log|}85|90|}
{2010006001|XXGobject_psameas_object|110|0|200|0|{metadata|log_metadata|1|0|}90|85|}
{2010211001|XXGvertex_iport_iport|111|0|201|0|{0|in|}85|91|}
{2010006001|XXGobject_psameas_object|112|0|203|0|{metadata|in_metadata|1|0|}91|85|}
{2010006001|XXGobject_psameas_object|113|0|204|0|{Layout|Layout|0|0|}75|59|}
{2010006001|XXGobject_psameas_object|114|0|205|0|{deselect_metadata|out_metadata|0|0|}75|75|}
{2010006001|XXGobject_psameas_object|115|0|206|0|{in_metadata|write_metadata|0|0|}75|92|}
{2010211001|XXGvertex_iport_iport|116|0|208|0|{0|write|}92|93|}
{2010214001|XXGiport_src_flow|117|0|210|0|{0|}93|18|}
{2010007001|XXGobject_proto_object|118|0|211|0|{}92|94|}
{2010211001|XXGvertex_iport_iport|119|0|213|0|{0|write|}94|95|}
{2010006001|XXGobject_psameas_object|120|0|215|0|{metadata|write_metadata|1|0|}95|94|}
{2010006001|XXGobject_psameas_object|121|0|216|0|{reject_metadata|write_metadata|0|0|}75|92|}
{2010006001|XXGobject_psameas_object|122|0|217|0|{reject_metadata|out_metadata|0|0|}63|75|}
{2010006001|XXGobject_psameas_object|123|0|218|0|{out_metadata|out_metadata|0|0|}53|63|}
{2010601001|XXGgraph_vertex_vertex|124|0|219|0|{Convert_to_Lines|}1|96|}
{2010212001|XXGvertex_oport_oport|125|0|221|0|{0|out0|}96|97|}
{2010213001|XXGoport_dst_flow|126|0|223|0|{0|}97|30|}
{2010212001|XXGvertex_oport_oport|127|0|224|0|{1|reject0|}96|98|}
{2010212001|XXGvertex_oport_oport|128|0|226|0|{2|error0|}96|99|}
{2010212001|XXGvertex_oport_oport|129|0|228|0|{3|log|}96|100|}
{2010211001|XXGvertex_iport_iport|130|0|230|0|{0|in|}96|101|}
{2010214001|XXGiport_src_flow|131|0|232|0|{0|}101|41|}
{2010214001|XXGiport_src_flow|132|0|233|0|{1|}101|52|}
{2010007001|XXGobject_proto_object|133|0|234|0|{}96|102|}
{2010212001|XXGvertex_oport_oport|134|0|236|0|{0|out0|}102|103|}
{2010006001|XXGobject_psameas_object|135|0|238|0|{metadata|out0_metadata|1|0|}103|102|}
{2010006001|XXGobject_psameas_object|136|0|239|0|{transform0|transform0|1|0|}103|102|}
{2010212001|XXGvertex_oport_oport|137|0|240|0|{1|reject0|}102|104|}
{2010006001|XXGobject_psameas_object|138|0|242|0|{metadata|reject0_metadata|1|0|}104|102|}
{2010212001|XXGvertex_oport_oport|139|0|243|0|{2|error0|}102|105|}
{2010006001|XXGobject_psameas_object|140|0|245|0|{metadata|error0_metadata|1|0|}105|102|}
{2010212001|XXGvertex_oport_oport|141|0|246|0|{3|log|}102|106|}
{2010006001|XXGobject_psameas_object|142|0|248|0|{metadata|log_metadata|1|0|}106|102|}
{2010211001|XXGvertex_iport_iport|143|0|249|0|{0|in|}102|107|}
{2010006001|XXGobject_psameas_object|144|0|251|0|{metadata|in_metadata|1|0|}107|102|}
{2010006001|XXGobject_psameas_object|145|0|252|0|{Layout|Layout|0|0|}96|59|}
{2010006001|XXGobject_psameas_object|146|0|253|0|{in_metadata|out_metadata|0|0|}96|108|}
{2010212001|XXGvertex_oport_oport|147|0|255|0|{0|out|}108|109|}
{2010213001|XXGoport_dst_flow|148|0|257|0|{0|}109|41|}
{2010212001|XXGvertex_oport_oport|149|0|258|0|{1|error|}108|110|}
{2010212001|XXGvertex_oport_oport|150|0|260|0|{2|log|}108|111|}
{2010007001|XXGobject_proto_object|151|0|262|0|{}108|112|}
{2010212001|XXGvertex_oport_oport|152|0|264|0|{0|out|}112|113|}
{2010006001|XXGobject_psameas_object|153|0|266|0|{metadata|out_metadata|1|0|}113|112|}
{2010212001|XXGvertex_oport_oport|154|0|267|0|{1|error|}112|114|}
{2010006001|XXGobject_psameas_object|155|0|269|0|{metadata|error_metadata|1|0|}114|112|}
{2010212001|XXGvertex_oport_oport|156|0|270|0|{2|log|}112|115|}
{2010006001|XXGobject_psameas_object|157|0|272|0|{metadata|log_metadata|1|0|}115|112|}
{2010006001|XXGobject_psameas_object|158|0|273|0|{out0_metadata|out_metadata|0|0|}96|63|}
{2010006001|XXGobject_psameas_object|159|0|274|0|{reject0_metadata|out_metadata|0|0|}96|108|}
{2010601001|XXGgraph_vertex_vertex|160|0|275|0|{Create_Links_for_Partial_Plans|}1|116|}
{2010212001|XXGvertex_oport_oport|161|0|277|0|{0|out|}116|117|}
{2010213001|XXGoport_dst_flow|162|0|279|0|{0|}117|17|}
{2010212001|XXGvertex_oport_oport|163|0|280|0|{1|reject|}116|118|}
{2010212001|XXGvertex_oport_oport|164|0|282|0|{2|error|}116|119|}
{2010212001|XXGvertex_oport_oport|165|0|284|0|{3|log|}116|120|}
{2010211001|XXGvertex_iport_iport|166|0|286|0|{0|in|}116|121|}
{2010214001|XXGiport_src_flow|167|0|288|0|{0|}121|19|}
{2010007001|XXGobject_proto_object|168|0|289|0|{}116|122|}
{2010212001|XXGvertex_oport_oport|169|0|291|0|{0|out|}122|123|}
{2010006001|XXGobject_psameas_object|170|0|293|0|{metadata|out_metadata|1|0|}123|122|}
{2010212001|XXGvertex_oport_oport|171|0|294|0|{1|reject|}122|124|}
{2010006001|XXGobject_psameas_object|172|0|296|0|{metadata|reject_metadata|1|0|}124|122|}
{2010212001|XXGvertex_oport_oport|173|0|297|0|{2|error|}122|125|}
{2010006001|XXGobject_psameas_object|174|0|299|0|{metadata|error_metadata|1|0|}125|122|}
{2010212001|XXGvertex_oport_oport|175|0|300|0|{3|log|}122|126|}
{2010006001|XXGobject_psameas_object|176|0|302|0|{metadata|log_metadata|1|0|}126|122|}
{2010211001|XXGvertex_iport_iport|177|0|303|0|{0|in|}122|127|}
{2010006001|XXGobject_psameas_object|178|0|305|0|{metadata|in_metadata|1|0|}127|122|}
{2010006001|XXGobject_psameas_object|179|0|306|0|{Layout|Layout|0|0|}116|92|}
{2010006001|XXGobject_psameas_object|180|0|307|0|{in_metadata|out_metadata|0|0|}116|128|}
{2010212001|XXGvertex_oport_oport|181|0|309|0|{0|out|}128|129|}
{2010213001|XXGoport_dst_flow|182|0|311|0|{0|}129|19|}
{2010212001|XXGvertex_oport_oport|183|0|312|0|{1|error|}128|130|}
{2010212001|XXGvertex_oport_oport|184|0|314|0|{2|log|}128|131|}
{2010007001|XXGobject_proto_object|185|0|316|0|{}128|132|}
{2010212001|XXGvertex_oport_oport|186|0|318|0|{0|out|}132|133|}
{2010006001|XXGobject_psameas_object|187|0|320|0|{metadata|out_metadata|1|0|}133|132|}
{2010212001|XXGvertex_oport_oport|188|0|321|0|{1|error|}132|134|}
{2010006001|XXGobject_psameas_object|189|0|323|0|{metadata|error_metadata|1|0|}134|132|}
{2010212001|XXGvertex_oport_oport|190|0|324|0|{2|log|}132|135|}
{2010006001|XXGobject_psameas_object|191|0|326|0|{metadata|log_metadata|1|0|}135|132|}
{2010006001|XXGobject_psameas_object|192|0|327|0|{reject_metadata|out_metadata|0|0|}116|128|}
{2010601001|XXGgraph_vertex_vertex|193|0|328|0|{Create_Resource_Pool_Files|}1|136|}
{2010605001|XXGgraph_legend_legend|194|0|330|0|{0|}136|137|}
{2010241001|XXGlegend_face_face|195|0|332|0|{}137|138|}
{2010605001|XXGgraph_legend_legend|196|0|334|0|{1|}136|139|}
{2010241001|XXGlegend_face_face|197|0|336|0|{}139|140|}
{2010605001|XXGgraph_legend_legend|198|0|338|0|{2|}136|141|}
{2010241001|XXGlegend_face_face|199|0|340|0|{}141|142|}
{2010604001|XXGgraph_flow_flow|200|0|342|0|{Flow_1|}136|143|}
{2010604001|XXGgraph_flow_flow|201|0|344|0|{Flow_3|}136|144|}
{2010604001|XXGgraph_flow_flow|202|0|346|0|{Flow_6|}136|145|}
{2010604001|XXGgraph_flow_flow|203|0|348|0|{Flow_7|}136|146|}
{2010604001|XXGgraph_flow_flow|204|0|350|0|{Flow_8|}136|147|}
{2010604001|XXGgraph_flow_flow|205|0|352|0|{Flow_9|}136|148|}
{2010601001|XXGgraph_vertex_vertex|206|0|354|0|{App_Limit_Pool|}136|149|}
{2010604001|XXGgraph_flow_flow|207|0|356|0|{Flow_5|}149|150|}
{2010601001|XXGgraph_vertex_vertex|208|0|358|0|{Private_Dim_Resource_File|}149|151|}
{2010211001|XXGvertex_iport_iport|209|0|360|0|{0|write|}151|152|}
{2010214001|XXGiport_src_flow|210|0|362|0|{0|}152|150|}
{2010007001|XXGobject_proto_object|211|0|363|0|{}151|153|}
{2010211001|XXGvertex_iport_iport|212|0|365|0|{0|write|}153|154|}
{2010006001|XXGobject_psameas_object|213|0|367|0|{metadata|write_metadata|1|0|}154|153|}
{2010006001|XXGobject_psameas_object|214|0|368|0|{write_metadata|out0_metadata|0|0|}151|155|}
{2010212001|XXGvertex_oport_oport|215|0|370|0|{0|out0|}155|156|}
{2010213001|XXGoport_dst_flow|216|0|372|0|{0|}156|150|}
{2010212001|XXGvertex_oport_oport|217|0|373|0|{1|reject0|}155|157|}
{2010212001|XXGvertex_oport_oport|218|0|375|0|{2|error0|}155|158|}
{2010212001|XXGvertex_oport_oport|219|0|377|0|{3|log|}155|159|}
{2010211001|XXGvertex_iport_iport|220|0|379|0|{0|in|}155|160|}
{2010007001|XXGobject_proto_object|221|0|381|0|{}155|161|}
{2010212001|XXGvertex_oport_oport|222|0|383|0|{0|out0|}161|162|}
{2010006001|XXGobject_psameas_object|223|0|385|0|{metadata|out0_metadata|1|0|}162|161|}
{2010006001|XXGobject_psameas_object|224|0|386|0|{transform0|transform0|1|0|}162|161|}
{2010212001|XXGvertex_oport_oport|225|0|387|0|{1|reject0|}161|163|}
{2010006001|XXGobject_psameas_object|226|0|389|0|{metadata|reject0_metadata|1|0|}163|161|}
{2010212001|XXGvertex_oport_oport|227|0|390|0|{2|error0|}161|164|}
{2010006001|XXGobject_psameas_object|228|0|392|0|{metadata|error0_metadata|1|0|}164|161|}
{2010212001|XXGvertex_oport_oport|229|0|393|0|{3|log|}161|165|}
{2010006001|XXGobject_psameas_object|230|0|395|0|{metadata|log_metadata|1|0|}165|161|}
{2010211001|XXGvertex_iport_iport|231|0|396|0|{0|in|}161|166|}
{2010006001|XXGobject_psameas_object|232|0|398|0|{metadata|in_metadata|1|0|}166|161|}
{2010006001|XXGobject_psameas_object|233|0|399|0|{Layout|Layout|0|0|}155|151|}
{2010006001|XXGobject_psameas_object|234|0|400|0|{in_metadata|out_metadata|0|0|}155|167|}
{2010212001|XXGvertex_oport_oport|235|0|402|0|{0|out|}167|168|}
{2010213001|XXGoport_dst_flow|236|0|404|0|{0|}168|144|}
{2010212001|XXGvertex_oport_oport|237|0|405|0|{1|error|}167|169|}
{2010212001|XXGvertex_oport_oport|238|0|407|0|{2|log|}167|170|}
{2010007001|XXGobject_proto_object|239|0|409|0|{}167|171|}
{2010212001|XXGvertex_oport_oport|240|0|411|0|{0|out|}171|172|}
{2010006001|XXGobject_psameas_object|241|0|413|0|{metadata|out_metadata|1|0|}172|171|}
{2010212001|XXGvertex_oport_oport|242|0|414|0|{1|error|}171|173|}
{2010006001|XXGobject_psameas_object|243|0|416|0|{metadata|error_metadata|1|0|}173|171|}
{2010212001|XXGvertex_oport_oport|244|0|417|0|{2|log|}171|174|}
{2010006001|XXGobject_psameas_object|245|0|419|0|{metadata|log_metadata|1|0|}174|171|}
{2010006001|XXGobject_psameas_object|246|0|420|0|{Layout|Layout|0|0|}167|151|}
{2010006001|XXGobject_psameas_object|247|0|421|0|{reject0_metadata|out_metadata|0|0|}155|167|}
{2010601001|XXGgraph_vertex_vertex|248|0|422|0|{RFMT_Resource_Pool_Commands|}149|155|}
{2010211001|XXGvertex_iport_iport|249|0|423|0|{0|in0|}149|175|}
{2010215002|XXGiport_binding_iport|250|0|425|0|{.5|.5|{0|}8918|}175|160|}
{2010214001|XXGiport_src_flow|251|0|426|0|{0|}175|144|}
{2010601001|XXGgraph_vertex_vertex|252|0|427|0|{Conf_Dimension|}136|176|}
{2010604001|XXGgraph_flow_flow|253|0|429|0|{Flow_2|}176|177|}
{2010604001|XXGgraph_flow_flow|254|0|431|0|{Flow_3|}176|178|}
{2010604001|XXGgraph_flow_flow|255|0|433|0|{Flow_4|}176|179|}
{2010604001|XXGgraph_flow_flow|256|0|435|0|{Flow_5|}176|180|}
{2010601001|XXGgraph_vertex_vertex|257|0|437|0|{Conformed_Dimension_List|}176|181|}
{2010211001|XXGvertex_iport_iport|258|0|439|0|{0|write|}181|182|}
{2010214001|XXGiport_src_flow|259|0|441|0|{0|}182|178|}
{2010007001|XXGobject_proto_object|260|0|442|0|{}181|183|}
{2010211001|XXGvertex_iport_iport|261|0|444|0|{0|write|}183|184|}
{2010006001|XXGobject_psameas_object|262|0|446|0|{metadata|write_metadata|1|0|}184|183|}
{2010601001|XXGgraph_vertex_vertex|263|0|447|0|{Output_File|}176|185|}
{2010211001|XXGvertex_iport_iport|264|0|449|0|{0|write|}185|186|}
{2010214001|XXGiport_src_flow|265|0|451|0|{0|}186|180|}
{2010007001|XXGobject_proto_object|266|0|452|0|{}185|187|}
{2010211001|XXGvertex_iport_iport|267|0|454|0|{0|write|}187|188|}
{2010006001|XXGobject_psameas_object|268|0|456|0|{metadata|write_metadata|1|0|}188|187|}
{2010006001|XXGobject_psameas_object|269|0|457|0|{write_metadata|out0_metadata|0|0|}185|189|}
{2010212001|XXGvertex_oport_oport|270|0|459|0|{0|out0|}189|190|}
{2010213001|XXGoport_dst_flow|271|0|461|0|{0|}190|180|}
{2010212001|XXGvertex_oport_oport|272|0|462|0|{1|reject0|}189|191|}
{2010212001|XXGvertex_oport_oport|273|0|464|0|{2|error0|}189|192|}
{2010212001|XXGvertex_oport_oport|274|0|466|0|{3|log|}189|193|}
{2010211001|XXGvertex_iport_iport|275|0|468|0|{0|in|}189|194|}
{2010214001|XXGiport_src_flow|276|0|470|0|{0|}194|179|}
{2010007001|XXGobject_proto_object|277|0|471|0|{}189|195|}
{2010212001|XXGvertex_oport_oport|278|0|473|0|{0|out0|}195|196|}
{2010006001|XXGobject_psameas_object|279|0|475|0|{metadata|out0_metadata|1|0|}196|195|}
{2010006001|XXGobject_psameas_object|280|0|476|0|{transform0|transform0|1|0|}196|195|}
{2010212001|XXGvertex_oport_oport|281|0|477|0|{1|reject0|}195|197|}
{2010006001|XXGobject_psameas_object|282|0|479|0|{metadata|reject0_metadata|1|0|}197|195|}
{2010212001|XXGvertex_oport_oport|283|0|480|0|{2|error0|}195|198|}
{2010006001|XXGobject_psameas_object|284|0|482|0|{metadata|error0_metadata|1|0|}198|195|}
{2010212001|XXGvertex_oport_oport|285|0|483|0|{3|log|}195|199|}
{2010006001|XXGobject_psameas_object|286|0|485|0|{metadata|log_metadata|1|0|}199|195|}
{2010211001|XXGvertex_iport_iport|287|0|486|0|{0|in|}195|200|}
{2010006001|XXGobject_psameas_object|288|0|488|0|{metadata|in_metadata|1|0|}200|195|}
{2010006001|XXGobject_psameas_object|289|0|489|0|{Layout|Layout|0|0|}189|185|}
{2010006001|XXGobject_psameas_object|290|0|490|0|{in_metadata|write_metadata|0|0|}189|181|}
{2010006001|XXGobject_psameas_object|291|0|491|0|{reject0_metadata|write_metadata|0|0|}189|181|}
{2010601001|XXGgraph_vertex_vertex|292|0|492|0|{RFMT_Filter_Conformed_Dims|}176|201|}
{2010212001|XXGvertex_oport_oport|293|0|494|0|{0|out0|}201|202|}
{2010213001|XXGoport_dst_flow|294|0|496|0|{0|}202|177|}
{2010212001|XXGvertex_oport_oport|295|0|497|0|{1|reject0|}201|203|}
{2010212001|XXGvertex_oport_oport|296|0|499|0|{2|error0|}201|204|}
{2010212001|XXGvertex_oport_oport|297|0|501|0|{3|log|}201|205|}
{2010211001|XXGvertex_iport_iport|298|0|503|0|{0|in|}201|206|}
{2010007001|XXGobject_proto_object|299|0|505|0|{}201|207|}
{2010212001|XXGvertex_oport_oport|300|0|507|0|{0|out0|}207|208|}
{2010006001|XXGobject_psameas_object|301|0|509|0|{metadata|out0_metadata|1|0|}208|207|}
{2010006001|XXGobject_psameas_object|302|0|510|0|{transform0|transform0|1|0|}208|207|}
{2010212001|XXGvertex_oport_oport|303|0|511|0|{1|reject0|}207|209|}
{2010006001|XXGobject_psameas_object|304|0|513|0|{metadata|reject0_metadata|1|0|}209|207|}
{2010212001|XXGvertex_oport_oport|305|0|514|0|{2|error0|}207|210|}
{2010006001|XXGobject_psameas_object|306|0|516|0|{metadata|error0_metadata|1|0|}210|207|}
{2010212001|XXGvertex_oport_oport|307|0|517|0|{3|log|}207|211|}
{2010006001|XXGobject_psameas_object|308|0|519|0|{metadata|log_metadata|1|0|}211|207|}
{2010211001|XXGvertex_iport_iport|309|0|520|0|{0|in|}207|212|}
{2010006001|XXGobject_psameas_object|310|0|522|0|{metadata|in_metadata|1|0|}212|207|}
{2010006001|XXGobject_psameas_object|311|0|523|0|{Layout|Layout|0|0|}201|181|}
{2010006001|XXGobject_psameas_object|312|0|524|0|{in_metadata|read_metadata|0|0|}201|213|}
{2010212001|XXGvertex_oport_oport|313|0|526|0|{0|read|}213|214|}
{2010213001|XXGoport_dst_flow|314|0|528|0|{0|}214|143|}
{2010007001|XXGobject_proto_object|315|0|529|0|{}213|215|}
{2010212001|XXGvertex_oport_oport|316|0|531|0|{0|read|}215|216|}
{2010006001|XXGobject_psameas_object|317|0|533|0|{metadata|read_metadata|1|0|}216|215|}
{2010006001|XXGobject_psameas_object|318|0|534|0|{out0_metadata|write_metadata|0|0|}201|181|}
{2010006001|XXGobject_psameas_object|319|0|535|0|{reject0_metadata|read_metadata|0|0|}201|213|}
{2010601001|XXGgraph_vertex_vertex|320|0|536|0|{RFMT_Resource_Pool_Commands|}176|189|}
{2010601001|XXGgraph_vertex_vertex|321|0|537|0|{Replicate|}176|217|}
{2010212001|XXGvertex_oport_oport|322|0|539|0|{0|out|}217|218|}
{2010213001|XXGoport_dst_flow|323|0|541|0|{0|}218|178|}
{2010213001|XXGoport_dst_flow|324|0|542|0|{1|}218|179|}
{2010211001|XXGvertex_iport_iport|325|0|543|0|{0|in|}217|219|}
{2010214001|XXGiport_src_flow|326|0|545|0|{0|}219|177|}
{2010007001|XXGobject_proto_object|327|0|546|0|{}217|220|}
{2010212001|XXGvertex_oport_oport|328|0|548|0|{0|out|}220|221|}
{2010006001|XXGobject_psameas_object|329|0|550|0|{metadata|out_metadata|1|0|}221|220|}
{2010211001|XXGvertex_iport_iport|330|0|551|0|{0|in|}220|222|}
{2010006001|XXGobject_psameas_object|331|0|553|0|{metadata|in_metadata|1|0|}222|220|}
{2010006001|XXGobject_psameas_object|332|0|554|0|{Layout|Layout|0|0|}217|181|}
{2010006001|XXGobject_psameas_object|333|0|555|0|{in_metadata|write_metadata|0|0|}217|181|}
{2010006001|XXGobject_psameas_object|334|0|556|0|{out_metadata|write_metadata|0|0|}217|181|}
{2010211001|XXGvertex_iport_iport|335|0|557|0|{0|in0|}176|223|}
{2010215002|XXGiport_binding_iport|336|0|559|0|{.5|.5|{0|}8910|}223|206|}
{2010214001|XXGiport_src_flow|337|0|560|0|{0|}223|147|}
{2010601001|XXGgraph_vertex_vertex|338|0|561|0|{Create_Data|}136|224|}
{2010212001|XXGvertex_oport_oport|339|0|563|0|{0|out|}224|225|}
{2010213001|XXGoport_dst_flow|340|0|565|0|{0|}225|145|}
{2010212001|XXGvertex_oport_oport|341|0|566|0|{1|error|}224|226|}
{2010212001|XXGvertex_oport_oport|342|0|568|0|{2|log|}224|227|}
{2010007001|XXGobject_proto_object|343|0|570|0|{}224|228|}
{2010212001|XXGvertex_oport_oport|344|0|572|0|{0|out|}228|229|}
{2010006001|XXGobject_psameas_object|345|0|574|0|{metadata|out_metadata|1|0|}229|228|}
{2010212001|XXGvertex_oport_oport|346|0|575|0|{1|error|}228|230|}
{2010006001|XXGobject_psameas_object|347|0|577|0|{metadata|error_metadata|1|0|}230|228|}
{2010212001|XXGvertex_oport_oport|348|0|578|0|{2|log|}228|231|}
{2010006001|XXGobject_psameas_object|349|0|580|0|{metadata|log_metadata|1|0|}231|228|}
{2010006001|XXGobject_psameas_object|350|0|581|0|{Layout|Layout|0|0|}224|232|}
{2010211001|XXGvertex_iport_iport|351|0|583|0|{0|write|}232|233|}
{2010214001|XXGiport_src_flow|352|0|585|0|{0|}233|145|}
{2010007001|XXGobject_proto_object|353|0|586|0|{}232|234|}
{2010211001|XXGvertex_iport_iport|354|0|588|0|{0|write|}234|235|}
{2010006001|XXGobject_psameas_object|355|0|590|0|{metadata|write_metadata|1|0|}235|234|}
{2010006001|XXGobject_psameas_object|356|0|591|0|{out_metadata|write_metadata|0|0|}224|232|}
{2010601001|XXGgraph_vertex_vertex|357|0|592|0|{Create_Data_1|}136|236|}
{2010212001|XXGvertex_oport_oport|358|0|594|0|{0|out|}236|237|}
{2010213001|XXGoport_dst_flow|359|0|596|0|{0|}237|146|}
{2010212001|XXGvertex_oport_oport|360|0|597|0|{1|error|}236|238|}
{2010212001|XXGvertex_oport_oport|361|0|599|0|{2|log|}236|239|}
{2010007001|XXGobject_proto_object|362|0|601|0|{}236|240|}
{2010212001|XXGvertex_oport_oport|363|0|603|0|{0|out|}240|241|}
{2010006001|XXGobject_psameas_object|364|0|605|0|{metadata|out_metadata|1|0|}241|240|}
{2010212001|XXGvertex_oport_oport|365|0|606|0|{1|error|}240|242|}
{2010006001|XXGobject_psameas_object|366|0|608|0|{metadata|error_metadata|1|0|}242|240|}
{2010212001|XXGvertex_oport_oport|367|0|609|0|{2|log|}240|243|}
{2010006001|XXGobject_psameas_object|368|0|611|0|{metadata|log_metadata|1|0|}243|240|}
{2010006001|XXGobject_psameas_object|369|0|612|0|{Layout|Layout|0|0|}236|244|}
{2010211001|XXGvertex_iport_iport|370|0|614|0|{0|write|}244|245|}
{2010214001|XXGiport_src_flow|371|0|616|0|{0|}245|146|}
{2010007001|XXGobject_proto_object|372|0|617|0|{}244|246|}
{2010211001|XXGvertex_iport_iport|373|0|619|0|{0|write|}246|247|}
{2010006001|XXGobject_psameas_object|374|0|621|0|{metadata|write_metadata|1|0|}247|246|}
{2010006001|XXGobject_psameas_object|375|0|622|0|{out_metadata|write_metadata|0|0|}236|244|}
{2010601001|XXGgraph_vertex_vertex|376|0|623|0|{Create_Placeholder_Pool_Text_1|}136|167|}
{2010601001|XXGgraph_vertex_vertex|377|0|624|0|{DB_Resource_Pool_Lookup|}136|244|}
{2010601001|XXGgraph_vertex_vertex|378|0|625|0|{IDS_Meta_Properties_File|}136|213|}
{2010601001|XXGgraph_vertex_vertex|379|0|626|0|{InActivePset|}136|232|}
{2010601001|XXGgraph_vertex_vertex|380|0|627|0|{Private_Dims|}136|248|}
{2010604001|XXGgraph_flow_flow|381|0|629|0|{Flow_2|}248|249|}
{2010604001|XXGgraph_flow_flow|382|0|631|0|{Flow_5|}248|250|}
{2010601001|XXGgraph_vertex_vertex|383|0|633|0|{Private_Dim_Resource_File|}248|251|}
{2010211001|XXGvertex_iport_iport|384|0|635|0|{0|write|}251|252|}
{2010214001|XXGiport_src_flow|385|0|637|0|{0|}252|250|}
{2010007001|XXGobject_proto_object|386|0|638|0|{}251|253|}
{2010211001|XXGvertex_iport_iport|387|0|640|0|{0|write|}253|254|}
{2010006001|XXGobject_psameas_object|388|0|642|0|{metadata|write_metadata|1|0|}254|253|}
{2010006001|XXGobject_psameas_object|389|0|643|0|{write_metadata|out0_metadata|0|0|}251|255|}
{2010212001|XXGvertex_oport_oport|390|0|645|0|{0|out0|}255|256|}
{2010213001|XXGoport_dst_flow|391|0|647|0|{0|}256|250|}
{2010212001|XXGvertex_oport_oport|392|0|648|0|{1|reject0|}255|257|}
{2010212001|XXGvertex_oport_oport|393|0|650|0|{2|error0|}255|258|}
{2010212001|XXGvertex_oport_oport|394|0|652|0|{3|log|}255|259|}
{2010211001|XXGvertex_iport_iport|395|0|654|0|{0|in|}255|260|}
{2010214001|XXGiport_src_flow|396|0|656|0|{0|}260|249|}
{2010007001|XXGobject_proto_object|397|0|657|0|{}255|261|}
{2010212001|XXGvertex_oport_oport|398|0|659|0|{0|out0|}261|262|}
{2010006001|XXGobject_psameas_object|399|0|661|0|{metadata|out0_metadata|1|0|}262|261|}
{2010006001|XXGobject_psameas_object|400|0|662|0|{transform0|transform0|1|0|}262|261|}
{2010212001|XXGvertex_oport_oport|401|0|663|0|{1|reject0|}261|263|}
{2010006001|XXGobject_psameas_object|402|0|665|0|{metadata|reject0_metadata|1|0|}263|261|}
{2010212001|XXGvertex_oport_oport|403|0|666|0|{2|error0|}261|264|}
{2010006001|XXGobject_psameas_object|404|0|668|0|{metadata|error0_metadata|1|0|}264|261|}
{2010212001|XXGvertex_oport_oport|405|0|669|0|{3|log|}261|265|}
{2010006001|XXGobject_psameas_object|406|0|671|0|{metadata|log_metadata|1|0|}265|261|}
{2010211001|XXGvertex_iport_iport|407|0|672|0|{0|in|}261|266|}
{2010006001|XXGobject_psameas_object|408|0|674|0|{metadata|in_metadata|1|0|}266|261|}
{2010006001|XXGobject_psameas_object|409|0|675|0|{Layout|Layout|0|0|}255|251|}
{2010006001|XXGobject_psameas_object|410|0|676|0|{in_metadata|out0_metadata|0|0|}255|267|}
{2010212001|XXGvertex_oport_oport|411|0|678|0|{0|out0|}267|268|}
{2010213001|XXGoport_dst_flow|412|0|680|0|{0|}268|249|}
{2010212001|XXGvertex_oport_oport|413|0|681|0|{1|reject0|}267|269|}
{2010212001|XXGvertex_oport_oport|414|0|683|0|{2|error0|}267|270|}
{2010212001|XXGvertex_oport_oport|415|0|685|0|{3|log|}267|271|}
{2010211001|XXGvertex_iport_iport|416|0|687|0|{0|in|}267|272|}
{2010007001|XXGobject_proto_object|417|0|689|0|{}267|273|}
{2010212001|XXGvertex_oport_oport|418|0|691|0|{0|out0|}273|274|}
{2010006001|XXGobject_psameas_object|419|0|693|0|{metadata|out0_metadata|1|0|}274|273|}
{2010006001|XXGobject_psameas_object|420|0|694|0|{transform0|transform0|1|0|}274|273|}
{2010212001|XXGvertex_oport_oport|421|0|695|0|{1|reject0|}273|275|}
{2010006001|XXGobject_psameas_object|422|0|697|0|{metadata|reject0_metadata|1|0|}275|273|}
{2010212001|XXGvertex_oport_oport|423|0|698|0|{2|error0|}273|276|}
{2010006001|XXGobject_psameas_object|424|0|700|0|{metadata|error0_metadata|1|0|}276|273|}
{2010212001|XXGvertex_oport_oport|425|0|701|0|{3|log|}273|277|}
{2010006001|XXGobject_psameas_object|426|0|703|0|{metadata|log_metadata|1|0|}277|273|}
{2010211001|XXGvertex_iport_iport|427|0|704|0|{0|in|}273|278|}
{2010006001|XXGobject_psameas_object|428|0|706|0|{metadata|in_metadata|1|0|}278|273|}
{2010006001|XXGobject_psameas_object|429|0|707|0|{Layout|Layout|0|0|}267|251|}
{2010006001|XXGobject_psameas_object|430|0|708|0|{in_metadata|read_metadata|0|0|}267|213|}
{2010006001|XXGobject_psameas_object|431|0|709|0|{reject0_metadata|read_metadata|0|0|}267|213|}
{2010006001|XXGobject_psameas_object|432|0|710|0|{reject0_metadata|out0_metadata|0|0|}255|267|}
{2010601001|XXGgraph_vertex_vertex|433|0|711|0|{RFMT_Filter_Private_dimension|}248|267|}
{2010601001|XXGgraph_vertex_vertex|434|0|712|0|{RFMT_Resource_Pool_Commands|}248|255|}
{2010211001|XXGvertex_iport_iport|435|0|713|0|{0|in0|}248|279|}
{2010215002|XXGiport_binding_iport|436|0|715|0|{.5|.5|{0|}8905|}279|272|}
{2010214001|XXGiport_src_flow|437|0|716|0|{0|}279|148|}
{2010601001|XXGgraph_vertex_vertex|438|0|717|0|{Replicate_1|}136|280|}
{2010212001|XXGvertex_oport_oport|439|0|719|0|{0|out|}280|281|}
{2010213001|XXGoport_dst_flow|440|0|721|0|{0|}281|147|}
{2010213001|XXGoport_dst_flow|441|0|722|0|{1|}281|148|}
{2010211001|XXGvertex_iport_iport|442|0|723|0|{0|in|}280|282|}
{2010214001|XXGiport_src_flow|443|0|725|0|{0|}282|143|}
{2010007001|XXGobject_proto_object|444|0|726|0|{}280|283|}
{2010212001|XXGvertex_oport_oport|445|0|728|0|{0|out|}283|284|}
{2010006001|XXGobject_psameas_object|446|0|730|0|{metadata|out_metadata|1|0|}284|283|}
{2010211001|XXGvertex_iport_iport|447|0|731|0|{0|in|}283|285|}
{2010006001|XXGobject_psameas_object|448|0|733|0|{metadata|in_metadata|1|0|}285|283|}
{2010006001|XXGobject_psameas_object|449|0|734|0|{Layout|Layout|0|0|}280|181|}
{2010006001|XXGobject_psameas_object|450|0|735|0|{in_metadata|read_metadata|0|0|}280|213|}
{2010006001|XXGobject_psameas_object|451|0|736|0|{out_metadata|read_metadata|0|0|}280|213|}
{2010601001|XXGgraph_vertex_vertex|452|0|737|0|{Create_Run_Plan_Parameters|}1|286|}
{2010212001|XXGvertex_oport_oport|453|0|739|0|{0|out|}286|287|}
{2010213001|XXGoport_dst_flow|454|0|741|0|{0|}287|52|}
{2010212001|XXGvertex_oport_oport|455|0|742|0|{1|error|}286|288|}
{2010212001|XXGvertex_oport_oport|456|0|744|0|{2|log|}286|289|}
{2010007001|XXGobject_proto_object|457|0|746|0|{}286|290|}
{2010212001|XXGvertex_oport_oport|458|0|748|0|{0|out|}290|291|}
{2010006001|XXGobject_psameas_object|459|0|750|0|{metadata|out_metadata|1|0|}291|290|}
{2010212001|XXGvertex_oport_oport|460|0|751|0|{1|error|}290|292|}
{2010006001|XXGobject_psameas_object|461|0|753|0|{metadata|error_metadata|1|0|}292|290|}
{2010212001|XXGvertex_oport_oport|462|0|754|0|{2|log|}290|293|}
{2010006001|XXGobject_psameas_object|463|0|756|0|{metadata|log_metadata|1|0|}293|290|}
{2010601001|XXGgraph_vertex_vertex|464|0|757|0|{Create_Run_Plan_Parameters_For_process_using_datalake_read|}1|108|}
{2010601001|XXGgraph_vertex_vertex|465|0|758|0|{DB_Resource_Pool_Lookup|}1|294|}
{2010007001|XXGobject_proto_object|466|0|760|0|{}294|295|}
{2010601001|XXGgraph_vertex_vertex|467|0|762|0|{Daily_Load_Static_Dims|}1|296|}
{2010007001|XXGobject_proto_object|468|0|764|0|{}296|297|}
{2010601001|XXGgraph_vertex_vertex|469|0|766|0|{De_Dup_Links_for_Same_Datasets|}1|298|}
{2010604001|XXGgraph_flow_flow|470|0|768|0|{Flow_2|}298|299|}
{2010604001|XXGgraph_flow_flow|471|0|770|0|{Flow_3|}298|300|}
{2010604001|XXGgraph_flow_flow|472|0|772|0|{Flow_4|}298|301|}
{2010601001|XXGgraph_vertex_vertex|473|0|774|0|{Dedup_Sorted|}298|302|}
{2010212001|XXGvertex_oport_oport|474|0|776|0|{0|out|}302|303|}
{2010213001|XXGoport_dst_flow|475|0|778|0|{0|}303|299|}
{2010212001|XXGvertex_oport_oport|476|0|779|0|{1|dup|}302|304|}
{2010213001|XXGoport_dst_flow|477|0|781|0|{0|}304|301|}
{2010212001|XXGvertex_oport_oport|478|0|782|0|{2|reject|}302|305|}
{2010212001|XXGvertex_oport_oport|479|0|784|0|{3|error|}302|306|}
{2010212001|XXGvertex_oport_oport|480|0|786|0|{4|log|}302|307|}
{2010211001|XXGvertex_iport_iport|481|0|788|0|{0|in|}302|308|}
{2010214001|XXGiport_src_flow|482|0|790|0|{0|}308|300|}
{2010007001|XXGobject_proto_object|483|0|791|0|{}302|309|}
{2010212001|XXGvertex_oport_oport|484|0|793|0|{0|out|}309|310|}
{2010006001|XXGobject_psameas_object|485|0|795|0|{metadata|out_metadata|1|0|}310|309|}
{2010212001|XXGvertex_oport_oport|486|0|796|0|{1|dup|}309|311|}
{2010006001|XXGobject_psameas_object|487|0|798|0|{metadata|dup_metadata|1|0|}311|309|}
{2010212001|XXGvertex_oport_oport|488|0|799|0|{2|reject|}309|312|}
{2010006001|XXGobject_psameas_object|489|0|801|0|{metadata|reject_metadata|1|0|}312|309|}
{2010212001|XXGvertex_oport_oport|490|0|802|0|{3|error|}309|313|}
{2010006001|XXGobject_psameas_object|491|0|804|0|{metadata|error_metadata|1|0|}313|309|}
{2010212001|XXGvertex_oport_oport|492|0|805|0|{4|log|}309|314|}
{2010006001|XXGobject_psameas_object|493|0|807|0|{metadata|log_metadata|1|0|}314|309|}
{2010211001|XXGvertex_iport_iport|494|0|808|0|{0|in|}309|315|}
{2010006001|XXGobject_psameas_object|495|0|810|0|{metadata|in_metadata|1|0|}315|309|}
{2010006001|XXGobject_psameas_object|496|0|811|0|{Layout|Layout|0|0|}302|92|}
{2010006001|XXGobject_psameas_object|497|0|812|0|{dup_metadata|out_metadata|0|0|}302|116|}
{2010006001|XXGobject_psameas_object|498|0|813|0|{in_metadata|out_metadata|0|0|}302|116|}
{2010006001|XXGobject_psameas_object|499|0|814|0|{out_metadata|out_metadata|0|0|}302|116|}
{2010006001|XXGobject_psameas_object|500|0|815|0|{reject_metadata|out_metadata|0|0|}302|116|}
{2010601001|XXGgraph_vertex_vertex|501|0|816|0|{Remove_Cycles_and_Max_SKs|}298|316|}
{2010212001|XXGvertex_oport_oport|502|0|818|0|{0|out|}316|317|}
{2010212001|XXGvertex_oport_oport|503|0|820|0|{1|deselect|}316|318|}
{2010212001|XXGvertex_oport_oport|504|0|822|0|{2|reject|}316|319|}
{2010212001|XXGvertex_oport_oport|505|0|824|0|{3|error|}316|320|}
{2010212001|XXGvertex_oport_oport|506|0|826|0|{4|log|}316|321|}
{2010211001|XXGvertex_iport_iport|507|0|828|0|{0|in|}316|322|}
{2010214001|XXGiport_src_flow|508|0|830|0|{0|}322|299|}
{2010007001|XXGobject_proto_object|509|0|831|0|{}316|323|}
{2010212001|XXGvertex_oport_oport|510|0|833|0|{0|out|}323|324|}
{2010006001|XXGobject_psameas_object|511|0|835|0|{metadata|out_metadata|1|0|}324|323|}
{2010212001|XXGvertex_oport_oport|512|0|836|0|{1|deselect|}323|325|}
{2010006001|XXGobject_psameas_object|513|0|838|0|{metadata|deselect_metadata|1|0|}325|323|}
{2010212001|XXGvertex_oport_oport|514|0|839|0|{2|reject|}323|326|}
{2010006001|XXGobject_psameas_object|515|0|841|0|{metadata|reject_metadata|1|0|}326|323|}
{2010212001|XXGvertex_oport_oport|516|0|842|0|{3|error|}323|327|}
{2010006001|XXGobject_psameas_object|517|0|844|0|{metadata|error_metadata|1|0|}327|323|}
{2010212001|XXGvertex_oport_oport|518|0|845|0|{4|log|}323|328|}
{2010006001|XXGobject_psameas_object|519|0|847|0|{metadata|log_metadata|1|0|}328|323|}
{2010211001|XXGvertex_iport_iport|520|0|848|0|{0|in|}323|329|}
{2010006001|XXGobject_psameas_object|521|0|850|0|{metadata|in_metadata|1|0|}329|323|}
{2010006001|XXGobject_psameas_object|522|0|851|0|{Layout|Layout|0|0|}316|92|}
{2010006001|XXGobject_psameas_object|523|0|852|0|{deselect_metadata|out_metadata|0|0|}316|116|}
{2010006001|XXGobject_psameas_object|524|0|853|0|{in_metadata|out_metadata|0|0|}316|116|}
{2010006001|XXGobject_psameas_object|525|0|854|0|{out_metadata|out_metadata|0|0|}316|116|}
{2010006001|XXGobject_psameas_object|526|0|855|0|{reject_metadata|out_metadata|0|0|}316|116|}
{2010601001|XXGgraph_vertex_vertex|527|0|856|0|{Sort_Write_graph_and_Dataset|}298|330|}
{2010212001|XXGvertex_oport_oport|528|0|858|0|{0|out|}330|331|}
{2010213001|XXGoport_dst_flow|529|0|860|0|{0|}331|300|}
{2010211001|XXGvertex_iport_iport|530|0|861|0|{0|in|}330|332|}
{2010007001|XXGobject_proto_object|531|0|863|0|{}330|333|}
{2010212001|XXGvertex_oport_oport|532|0|865|0|{0|out|}333|334|}
{2010006001|XXGobject_psameas_object|533|0|867|0|{metadata|out_metadata|1|0|}334|333|}
{2010211001|XXGvertex_iport_iport|534|0|868|0|{0|in|}333|335|}
{2010006001|XXGobject_psameas_object|535|0|870|0|{metadata|in_metadata|1|0|}335|333|}
{2010006001|XXGobject_psameas_object|536|0|871|0|{Layout|Layout|0|0|}330|92|}
{2010006001|XXGobject_psameas_object|537|0|872|0|{in_metadata|out_metadata|0|0|}330|116|}
{2010006001|XXGobject_psameas_object|538|0|873|0|{out_metadata|out_metadata|0|0|}330|116|}
{2010601001|XXGgraph_vertex_vertex|539|0|874|0|{Trash|}298|336|}
{2010211001|XXGvertex_iport_iport|540|0|876|0|{0|in|}336|337|}
{2010214001|XXGiport_src_flow|541|0|878|0|{0|}337|301|}
{2010007001|XXGobject_proto_object|542|0|879|0|{}336|338|}
{2010211001|XXGvertex_iport_iport|543|0|881|0|{0|in|}338|339|}
{2010006001|XXGobject_psameas_object|544|0|883|0|{metadata|in_metadata|1|0|}339|338|}
{2010006001|XXGobject_psameas_object|545|0|884|0|{Layout|Layout|0|0|}336|92|}
{2010006001|XXGobject_psameas_object|546|0|885|0|{in_metadata|out_metadata|0|0|}336|116|}
{2010212001|XXGvertex_oport_oport|547|0|886|0|{0|out0|}298|340|}
{2010216002|XXGoport_binding_oport|548|0|888|0|{.5|.5|{0|}8923|}340|317|}
{2010213001|XXGoport_dst_flow|549|0|889|0|{0|}340|36|}
{2010211001|XXGvertex_iport_iport|550|0|890|0|{0|in0|}298|341|}
{2010215002|XXGiport_binding_iport|551|0|892|0|{.5|.5|{0|}8922|}341|332|}
{2010214001|XXGiport_src_flow|552|0|893|0|{0|}341|17|}
{2010601001|XXGgraph_vertex_vertex|553|0|894|0|{Decompose_File_Names|}1|342|}
{2010212001|XXGvertex_oport_oport|554|0|896|0|{0|out0|}342|343|}
{2010213001|XXGoport_dst_flow|555|0|898|0|{0|}343|48|}
{2010212001|XXGvertex_oport_oport|556|0|899|0|{1|reject0|}342|344|}
{2010212001|XXGvertex_oport_oport|557|0|901|0|{2|error0|}342|345|}
{2010212001|XXGvertex_oport_oport|558|0|903|0|{3|log|}342|346|}
{2010211001|XXGvertex_iport_iport|559|0|905|0|{0|in|}342|347|}
{2010214001|XXGiport_src_flow|560|0|907|0|{0|}347|32|}
{2010007001|XXGobject_proto_object|561|0|908|0|{}342|348|}
{2010212001|XXGvertex_oport_oport|562|0|910|0|{0|out0|}348|349|}
{2010006001|XXGobject_psameas_object|563|0|912|0|{metadata|out0_metadata|1|0|}349|348|}
{2010006001|XXGobject_psameas_object|564|0|913|0|{transform0|transform0|1|0|}349|348|}
{2010212001|XXGvertex_oport_oport|565|0|914|0|{1|reject0|}348|350|}
{2010006001|XXGobject_psameas_object|566|0|916|0|{metadata|reject0_metadata|1|0|}350|348|}
{2010212001|XXGvertex_oport_oport|567|0|917|0|{2|error0|}348|351|}
{2010006001|XXGobject_psameas_object|568|0|919|0|{metadata|error0_metadata|1|0|}351|348|}
{2010212001|XXGvertex_oport_oport|569|0|920|0|{3|log|}348|352|}
{2010006001|XXGobject_psameas_object|570|0|922|0|{metadata|log_metadata|1|0|}352|348|}
{2010211001|XXGvertex_iport_iport|571|0|923|0|{0|in|}348|353|}
{2010006001|XXGobject_psameas_object|572|0|925|0|{metadata|in_metadata|1|0|}353|348|}
{2010006001|XXGobject_psameas_object|573|0|926|0|{Layout|Layout|0|0|}342|354|}
{2010212001|XXGvertex_oport_oport|574|0|928|0|{0|read|}354|355|}
{2010213001|XXGoport_dst_flow|575|0|930|0|{0|}355|22|}
{2010211001|XXGvertex_iport_iport|576|0|931|0|{0|in|}354|356|}
{2010214001|XXGiport_src_flow|577|0|933|0|{0|}356|27|}
{2010007001|XXGobject_proto_object|578|0|934|0|{}354|357|}
{2010212001|XXGvertex_oport_oport|579|0|936|0|{0|read|}357|358|}
{2010006001|XXGobject_psameas_object|580|0|938|0|{metadata|read_metadata|1|0|}358|357|}
{2010211001|XXGvertex_iport_iport|581|0|939|0|{0|in|}357|359|}
{2010006001|XXGobject_psameas_object|582|0|941|0|{metadata|in_metadata|1|0|}359|357|}
{2010006001|XXGobject_psameas_object|583|0|942|0|{in_metadata|out_metadata|0|0|}342|360|}
{2010212001|XXGvertex_oport_oport|584|0|944|0|{0|out|}360|361|}
{2010213001|XXGoport_dst_flow|585|0|946|0|{0|}361|15|}
{2010211001|XXGvertex_iport_iport|586|0|947|0|{0|in|}360|362|}
{2010007001|XXGobject_proto_object|587|0|949|0|{}360|363|}
{2010212001|XXGvertex_oport_oport|588|0|951|0|{0|out|}363|364|}
{2010006001|XXGobject_psameas_object|589|0|953|0|{metadata|out_metadata|1|0|}364|363|}
{2010211001|XXGvertex_iport_iport|590|0|954|0|{0|in|}363|365|}
{2010006001|XXGobject_psameas_object|591|0|956|0|{metadata|in_metadata|1|0|}365|363|}
{2010006001|XXGobject_psameas_object|592|0|957|0|{reject0_metadata|out_metadata|0|0|}342|360|}
{2010601001|XXGgraph_vertex_vertex|593|0|958|0|{Drop_not_needed_psets_On_Pset_Mask|}1|366|}
{2010212001|XXGvertex_oport_oport|594|0|960|0|{0|out|}366|367|}
{2010213001|XXGoport_dst_flow|595|0|962|0|{0|}367|32|}
{2010212001|XXGvertex_oport_oport|596|0|963|0|{1|deselect|}366|368|}
{2010213001|XXGoport_dst_flow|597|0|965|0|{0|}368|26|}
{2010212001|XXGvertex_oport_oport|598|0|966|0|{2|reject|}366|369|}
{2010212001|XXGvertex_oport_oport|599|0|968|0|{3|error|}366|370|}
{2010212001|XXGvertex_oport_oport|600|0|970|0|{4|log|}366|371|}
{2010211001|XXGvertex_iport_iport|601|0|972|0|{0|in|}366|372|}
{2010214001|XXGiport_src_flow|602|0|974|0|{0|}372|15|}
{2010007001|XXGobject_proto_object|603|0|975|0|{}366|373|}
{2010212001|XXGvertex_oport_oport|604|0|977|0|{0|out|}373|374|}
{2010006001|XXGobject_psameas_object|605|0|979|0|{metadata|out_metadata|1|0|}374|373|}
{2010212001|XXGvertex_oport_oport|606|0|980|0|{1|deselect|}373|375|}
{2010006001|XXGobject_psameas_object|607|0|982|0|{metadata|deselect_metadata|1|0|}375|373|}
{2010212001|XXGvertex_oport_oport|608|0|983|0|{2|reject|}373|376|}
{2010006001|XXGobject_psameas_object|609|0|985|0|{metadata|reject_metadata|1|0|}376|373|}
{2010212001|XXGvertex_oport_oport|610|0|986|0|{3|error|}373|377|}
{2010006001|XXGobject_psameas_object|611|0|988|0|{metadata|error_metadata|1|0|}377|373|}
{2010212001|XXGvertex_oport_oport|612|0|989|0|{4|log|}373|378|}
{2010006001|XXGobject_psameas_object|613|0|991|0|{metadata|log_metadata|1|0|}378|373|}
{2010211001|XXGvertex_iport_iport|614|0|992|0|{0|in|}373|379|}
{2010006001|XXGobject_psameas_object|615|0|994|0|{metadata|in_metadata|1|0|}379|373|}
{2010006001|XXGobject_psameas_object|616|0|995|0|{Layout|Layout|0|0|}366|354|}
{2010006001|XXGobject_psameas_object|617|0|996|0|{deselect_metadata|out_metadata|0|0|}366|360|}
{2010006001|XXGobject_psameas_object|618|0|997|0|{in_metadata|out_metadata|0|0|}366|360|}
{2010006001|XXGobject_psameas_object|619|0|998|0|{out_metadata|out_metadata|0|0|}366|360|}
{2010006001|XXGobject_psameas_object|620|0|999|0|{reject_metadata|out_metadata|0|0|}366|360|}
{2010601001|XXGgraph_vertex_vertex|621|0|1000|0|{Dummy_Link_For_Placeholder|}1|380|}
{2010605001|XXGgraph_legend_legend|622|0|1002|0|{0|}380|381|}
{2010241001|XXGlegend_face_face|623|0|1004|0|{}381|382|}
{2010605001|XXGgraph_legend_legend|624|0|1006|0|{1|}380|383|}
{2010241001|XXGlegend_face_face|625|0|1008|0|{}383|384|}
{2010605001|XXGgraph_legend_legend|626|0|1010|0|{2|}380|385|}
{2010241001|XXGlegend_face_face|627|0|1012|0|{}385|386|}
{2010605001|XXGgraph_legend_legend|628|0|1014|0|{3|}380|387|}
{2010241001|XXGlegend_face_face|629|0|1016|0|{}387|388|}
{2010605001|XXGgraph_legend_legend|630|0|1018|0|{4|}380|389|}
{2010241001|XXGlegend_face_face|631|0|1020|0|{}389|390|}
{2010605001|XXGgraph_legend_legend|632|0|1022|0|{5|}380|391|}
{2010241001|XXGlegend_face_face|633|0|1024|0|{}391|392|}
{2010604001|XXGgraph_flow_flow|634|0|1026|0|{Flow_1|}380|77|}
{2010604001|XXGgraph_flow_flow|635|0|1027|0|{Flow_26|}380|393|}
{2010244001|XXGflow_watcher_watcher|636|0|1029|0|{}393|394|}
{2010604001|XXGgraph_flow_flow|637|0|1031|0|{Flow_27|}380|395|}
{2010244001|XXGflow_watcher_watcher|638|0|1033|0|{}395|396|}
{2010604001|XXGgraph_flow_flow|639|0|1035|0|{Flow_29|}380|397|}
{2010604001|XXGgraph_flow_flow|640|0|1037|0|{Flow_31|}380|80|}
{2010604001|XXGgraph_flow_flow|641|0|1038|0|{Flow_33|}380|398|}
{2010244001|XXGflow_watcher_watcher|642|0|1040|0|{}398|399|}
{2010601001|XXGgraph_vertex_vertex|643|0|1042|0|{FBE_Map_Keying_pset_Filter|}380|75|}
{2010601001|XXGgraph_vertex_vertex|644|0|1043|0|{Gather_addional_psets_created|}380|400|}
{2010212001|XXGvertex_oport_oport|645|0|1045|0|{0|out|}400|401|}
{2010211001|XXGvertex_iport_iport|646|0|1047|0|{0|in|}400|402|}
{2010214001|XXGiport_src_flow|647|0|1049|0|{0|}402|397|}
{2010214001|XXGiport_src_flow|648|0|1050|0|{1|}402|80|}
{2010214001|XXGiport_src_flow|649|0|1051|0|{2|}402|398|}
{2010007001|XXGobject_proto_object|650|0|1052|0|{}400|403|}
{2010212001|XXGvertex_oport_oport|651|0|1054|0|{0|out|}403|404|}
{2010006001|XXGobject_psameas_object|652|0|1056|0|{metadata|out_metadata|1|0|}404|403|}
{2010211001|XXGvertex_iport_iport|653|0|1057|0|{0|in|}403|405|}
{2010006001|XXGobject_psameas_object|654|0|1059|0|{metadata|in_metadata|1|0|}405|403|}
{2010006001|XXGobject_psameas_object|655|0|1060|0|{Layout|Layout|0|0|}400|59|}
{2010006001|XXGobject_psameas_object|656|0|1061|0|{in_metadata|out_metadata|0|0|}400|75|}
{2010006001|XXGobject_psameas_object|657|0|1062|0|{out_metadata|out_metadata|0|0|}400|75|}
{2010601001|XXGgraph_vertex_vertex|658|0|1063|0|{Generate_sequential_task_for_placeholder|}380|406|}
{2010212001|XXGvertex_oport_oport|659|0|1065|0|{0|out0|}406|407|}
{2010212001|XXGvertex_oport_oport|660|0|1067|0|{1|reject0|}406|408|}
{2010212001|XXGvertex_oport_oport|661|0|1069|0|{2|error0|}406|409|}
{2010212001|XXGvertex_oport_oport|662|0|1071|0|{3|log|}406|410|}
{2010211001|XXGvertex_iport_iport|663|0|1073|0|{0|in|}406|411|}
{2010214001|XXGiport_src_flow|664|0|1075|0|{0|}411|395|}
{2010007001|XXGobject_proto_object|665|0|1076|0|{}406|412|}
{2010212001|XXGvertex_oport_oport|666|0|1078|0|{0|out0|}412|413|}
{2010006001|XXGobject_psameas_object|667|0|1080|0|{metadata|out0_metadata|1|0|}413|412|}
{2010006001|XXGobject_psameas_object|668|0|1081|0|{transform0|transform0|1|0|}413|412|}
{2010212001|XXGvertex_oport_oport|669|0|1082|0|{1|reject0|}412|414|}
{2010006001|XXGobject_psameas_object|670|0|1084|0|{metadata|reject0_metadata|1|0|}414|412|}
{2010212001|XXGvertex_oport_oport|671|0|1085|0|{2|error0|}412|415|}
{2010006001|XXGobject_psameas_object|672|0|1087|0|{metadata|error0_metadata|1|0|}415|412|}
{2010212001|XXGvertex_oport_oport|673|0|1088|0|{3|log|}412|416|}
{2010006001|XXGobject_psameas_object|674|0|1090|0|{metadata|log_metadata|1|0|}416|412|}
{2010211001|XXGvertex_iport_iport|675|0|1091|0|{0|in|}412|417|}
{2010006001|XXGobject_psameas_object|676|0|1093|0|{metadata|in_metadata|1|0|}417|412|}
{2010006001|XXGobject_psameas_object|677|0|1094|0|{Layout|Layout|0|0|}406|59|}
{2010006001|XXGobject_psameas_object|678|0|1095|0|{in_metadata|out_metadata|0|0|}406|75|}
{2010006001|XXGobject_psameas_object|679|0|1096|0|{reject0_metadata|out_metadata|0|0|}406|75|}
{2010601001|XXGgraph_vertex_vertex|680|0|1097|0|{Replicate_1|}380|418|}
{2010212001|XXGvertex_oport_oport|681|0|1099|0|{0|out|}418|419|}
{2010213001|XXGoport_dst_flow|682|0|1101|0|{0|}419|395|}
{2010213001|XXGoport_dst_flow|683|0|1102|0|{1|}419|397|}
{2010211001|XXGvertex_iport_iport|684|0|1103|0|{0|in|}418|420|}
{2010214001|XXGiport_src_flow|685|0|1105|0|{0|}420|393|}
{2010007001|XXGobject_proto_object|686|0|1106|0|{}418|421|}
{2010212001|XXGvertex_oport_oport|687|0|1108|0|{0|out|}421|422|}
{2010006001|XXGobject_psameas_object|688|0|1110|0|{metadata|out_metadata|1|0|}422|421|}
{2010211001|XXGvertex_iport_iport|689|0|1111|0|{0|in|}421|423|}
{2010006001|XXGobject_psameas_object|690|0|1113|0|{metadata|in_metadata|1|0|}423|421|}
{2010006001|XXGobject_psameas_object|691|0|1114|0|{Layout|Layout|0|0|}418|59|}
{2010006001|XXGobject_psameas_object|692|0|1115|0|{in_metadata|out_metadata|0|0|}418|75|}
{2010006001|XXGobject_psameas_object|693|0|1116|0|{out_metadata|out_metadata|0|0|}418|75|}
{2010601001|XXGgraph_vertex_vertex|694|0|1117|0|{Write_Dummy_Datasets_for_placeholders|}380|424|}
{2010212001|XXGvertex_oport_oport|695|0|1119|0|{0|out0|}424|425|}
{2010213001|XXGoport_dst_flow|696|0|1121|0|{0|}425|393|}
{2010212001|XXGvertex_oport_oport|697|0|1122|0|{1|out1|}424|426|}
{2010213001|XXGoport_dst_flow|698|0|1124|0|{0|}426|398|}
{2010212001|XXGvertex_oport_oport|699|0|1125|0|{2|reject0|}424|427|}
{2010212001|XXGvertex_oport_oport|700|0|1127|0|{3|reject1|}424|428|}
{2010212001|XXGvertex_oport_oport|701|0|1129|0|{4|error0|}424|429|}
{2010212001|XXGvertex_oport_oport|702|0|1131|0|{5|error1|}424|430|}
{2010212001|XXGvertex_oport_oport|703|0|1133|0|{6|log|}424|431|}
{2010211001|XXGvertex_iport_iport|704|0|1135|0|{0|in|}424|432|}
{2010214001|XXGiport_src_flow|705|0|1137|0|{0|}432|77|}
{2010007001|XXGobject_proto_object|706|0|1138|0|{}424|433|}
{2010212001|XXGvertex_oport_oport|707|0|1140|0|{0|out0|}433|434|}
{2010006001|XXGobject_psameas_object|708|0|1142|0|{metadata|out0_metadata|1|0|}434|433|}
{2010006001|XXGobject_psameas_object|709|0|1143|0|{transform0|transform0|1|0|}434|433|}
{2010212001|XXGvertex_oport_oport|710|0|1144|0|{1|out1|}433|435|}
{2010006001|XXGobject_psameas_object|711|0|1146|0|{metadata|out1_metadata|1|0|}435|433|}
{2010006001|XXGobject_psameas_object|712|0|1147|0|{transform1|transform1|1|0|}435|433|}
{2010212001|XXGvertex_oport_oport|713|0|1148|0|{2|reject0|}433|436|}
{2010006001|XXGobject_psameas_object|714|0|1150|0|{metadata|reject0_metadata|1|0|}436|433|}
{2010212001|XXGvertex_oport_oport|715|0|1151|0|{3|reject1|}433|437|}
{2010006001|XXGobject_psameas_object|716|0|1153|0|{metadata|reject1_metadata|1|0|}437|433|}
{2010212001|XXGvertex_oport_oport|717|0|1154|0|{4|error0|}433|438|}
{2010006001|XXGobject_psameas_object|718|0|1156|0|{metadata|error0_metadata|1|0|}438|433|}
{2010212001|XXGvertex_oport_oport|719|0|1157|0|{5|error1|}433|439|}
{2010006001|XXGobject_psameas_object|720|0|1159|0|{metadata|error1_metadata|1|0|}439|433|}
{2010212001|XXGvertex_oport_oport|721|0|1160|0|{6|log|}433|440|}
{2010006001|XXGobject_psameas_object|722|0|1162|0|{metadata|log_metadata|1|0|}440|433|}
{2010211001|XXGvertex_iport_iport|723|0|1163|0|{0|in|}433|441|}
{2010006001|XXGobject_psameas_object|724|0|1165|0|{metadata|in_metadata|1|0|}441|433|}
{2010006001|XXGobject_psameas_object|725|0|1166|0|{Layout|Layout|0|0|}424|59|}
{2010006001|XXGobject_psameas_object|726|0|1167|0|{in_metadata|out_metadata|0|0|}424|75|}
{2010006001|XXGobject_psameas_object|727|0|1168|0|{out0_metadata|out_metadata|0|0|}424|75|}
{2010006001|XXGobject_psameas_object|728|0|1169|0|{reject0_metadata|out_metadata|0|0|}424|75|}
{2010006001|XXGobject_psameas_object|729|0|1170|0|{reject1_metadata|out_metadata|0|0|}424|75|}
{2010212001|XXGvertex_oport_oport|730|0|1171|0|{0|out0|}380|442|}
{2010216002|XXGoport_binding_oport|731|0|1173|0|{.5|.5|{0|}8842|}442|401|}
{2010213001|XXGoport_dst_flow|732|0|1174|0|{0|}442|39|}
{2010212001|XXGvertex_oport_oport|733|0|1175|0|{1|out1|}380|443|}
{2010216002|XXGoport_binding_oport|734|0|1177|0|{.5|.5|{0|}8843|}443|407|}
{2010213001|XXGoport_dst_flow|735|0|1178|0|{0|}443|34|}
{2010211001|XXGvertex_iport_iport|736|0|1179|0|{0|in0|}380|444|}
{2010215002|XXGiport_binding_iport|737|0|1181|0|{.5|.5|{0|}8841|}444|84|}
{2010214001|XXGiport_src_flow|738|0|1182|0|{0|}444|23|}
{2010214001|XXGiport_src_flow|739|0|1183|0|{1|}444|29|}
{2010601001|XXGgraph_vertex_vertex|740|0|1184|0|{FBE_Drop_Inactive_psets|}1|445|}
{2010212001|XXGvertex_oport_oport|741|0|1186|0|{0|out|}445|446|}
{2010213001|XXGoport_dst_flow|742|0|1188|0|{0|}446|28|}
{2010212001|XXGvertex_oport_oport|743|0|1189|0|{1|deselect|}445|447|}
{2010213001|XXGoport_dst_flow|744|0|1191|0|{0|}447|33|}
{2010212001|XXGvertex_oport_oport|745|0|1192|0|{2|reject|}445|448|}
{2010212001|XXGvertex_oport_oport|746|0|1194|0|{3|error|}445|449|}
{2010212001|XXGvertex_oport_oport|747|0|1196|0|{4|log|}445|450|}
{2010211001|XXGvertex_iport_iport|748|0|1198|0|{0|in|}445|451|}
{2010214001|XXGiport_src_flow|749|0|1200|0|{0|}451|48|}
{2010007001|XXGobject_proto_object|750|0|1201|0|{}445|452|}
{2010212001|XXGvertex_oport_oport|751|0|1203|0|{0|out|}452|453|}
{2010006001|XXGobject_psameas_object|752|0|1205|0|{metadata|out_metadata|1|0|}453|452|}
{2010212001|XXGvertex_oport_oport|753|0|1206|0|{1|deselect|}452|454|}
{2010006001|XXGobject_psameas_object|754|0|1208|0|{metadata|deselect_metadata|1|0|}454|452|}
{2010212001|XXGvertex_oport_oport|755|0|1209|0|{2|reject|}452|455|}
{2010006001|XXGobject_psameas_object|756|0|1211|0|{metadata|reject_metadata|1|0|}455|452|}
{2010212001|XXGvertex_oport_oport|757|0|1212|0|{3|error|}452|456|}
{2010006001|XXGobject_psameas_object|758|0|1214|0|{metadata|error_metadata|1|0|}456|452|}
{2010212001|XXGvertex_oport_oport|759|0|1215|0|{4|log|}452|457|}
{2010006001|XXGobject_psameas_object|760|0|1217|0|{metadata|log_metadata|1|0|}457|452|}
{2010211001|XXGvertex_iport_iport|761|0|1218|0|{0|in|}452|458|}
{2010006001|XXGobject_psameas_object|762|0|1220|0|{metadata|in_metadata|1|0|}458|452|}
{2010006001|XXGobject_psameas_object|763|0|1221|0|{Layout|Layout|0|0|}445|354|}
{2010006001|XXGobject_psameas_object|764|0|1222|0|{deselect_metadata|out0_metadata|0|0|}445|342|}
{2010006001|XXGobject_psameas_object|765|0|1223|0|{in_metadata|out0_metadata|0|0|}445|342|}
{2010006001|XXGobject_psameas_object|766|0|1224|0|{out_metadata|out0_metadata|0|0|}445|342|}
{2010006001|XXGobject_psameas_object|767|0|1225|0|{reject_metadata|out0_metadata|0|0|}445|342|}
{2010601001|XXGgraph_vertex_vertex|768|0|1226|0|{Find_Fsk_List|}1|459|}
{2010605001|XXGgraph_legend_legend|769|0|1228|0|{0|}459|460|}
{2010241001|XXGlegend_face_face|770|0|1230|0|{}460|461|}
{2010604001|XXGgraph_flow_flow|771|0|1232|0|{Flow_2|}459|462|}
{2010604001|XXGgraph_flow_flow|772|0|1234|0|{Flow_3|}459|463|}
{2010601001|XXGgraph_vertex_vertex|773|0|1236|0|{Filter_Fact_Dim_Map_Keying|}459|464|}
{2010212001|XXGvertex_oport_oport|774|0|1238|0|{0|out|}464|465|}
{2010213001|XXGoport_dst_flow|775|0|1240|0|{0|}465|462|}
{2010212001|XXGvertex_oport_oport|776|0|1241|0|{1|deselect|}464|466|}
{2010212001|XXGvertex_oport_oport|777|0|1243|0|{2|reject|}464|467|}
{2010212001|XXGvertex_oport_oport|778|0|1245|0|{3|error|}464|468|}
{2010212001|XXGvertex_oport_oport|779|0|1247|0|{4|log|}464|469|}
{2010211001|XXGvertex_iport_iport|780|0|1249|0|{0|in|}464|470|}
{2010007001|XXGobject_proto_object|781|0|1251|0|{}464|471|}
{2010212001|XXGvertex_oport_oport|782|0|1253|0|{0|out|}471|472|}
{2010006001|XXGobject_psameas_object|783|0|1255|0|{metadata|out_metadata|1|0|}472|471|}
{2010212001|XXGvertex_oport_oport|784|0|1256|0|{1|deselect|}471|473|}
{2010006001|XXGobject_psameas_object|785|0|1258|0|{metadata|deselect_metadata|1|0|}473|471|}
{2010212001|XXGvertex_oport_oport|786|0|1259|0|{2|reject|}471|474|}
{2010006001|XXGobject_psameas_object|787|0|1261|0|{metadata|reject_metadata|1|0|}474|471|}
{2010212001|XXGvertex_oport_oport|788|0|1262|0|{3|error|}471|475|}
{2010006001|XXGobject_psameas_object|789|0|1264|0|{metadata|error_metadata|1|0|}475|471|}
{2010212001|XXGvertex_oport_oport|790|0|1265|0|{4|log|}471|476|}
{2010006001|XXGobject_psameas_object|791|0|1267|0|{metadata|log_metadata|1|0|}476|471|}
{2010211001|XXGvertex_iport_iport|792|0|1268|0|{0|in|}471|477|}
{2010006001|XXGobject_psameas_object|793|0|1270|0|{metadata|in_metadata|1|0|}477|471|}
{2010006001|XXGobject_psameas_object|794|0|1271|0|{Layout|Layout|0|0|}464|478|}
{2010211001|XXGvertex_iport_iport|795|0|1273|0|{0|write|}478|479|}
{2010214001|XXGiport_src_flow|796|0|1275|0|{0|}479|46|}
{2010007001|XXGobject_proto_object|797|0|1276|0|{}478|480|}
{2010211001|XXGvertex_iport_iport|798|0|1278|0|{0|write|}480|481|}
{2010006001|XXGobject_psameas_object|799|0|1280|0|{metadata|write_metadata|1|0|}481|480|}
{2010006001|XXGobject_psameas_object|800|0|1281|0|{deselect_metadata|read_metadata|0|0|}464|354|}
{2010006001|XXGobject_psameas_object|801|0|1282|0|{in_metadata|read_metadata|0|0|}464|354|}
{2010006001|XXGobject_psameas_object|802|0|1283|0|{out_metadata|read_metadata|0|0|}464|354|}
{2010006001|XXGobject_psameas_object|803|0|1284|0|{reject_metadata|read_metadata|0|0|}464|354|}
{2010601001|XXGgraph_vertex_vertex|804|0|1285|0|{Filter_Pass_Only_Matching_Fsk|}459|482|}
{2010212001|XXGvertex_oport_oport|805|0|1287|0|{0|out|}482|483|}
{2010212001|XXGvertex_oport_oport|806|0|1289|0|{1|deselect|}482|484|}
{2010212001|XXGvertex_oport_oport|807|0|1291|0|{2|reject|}482|485|}
{2010212001|XXGvertex_oport_oport|808|0|1293|0|{3|error|}482|486|}
{2010212001|XXGvertex_oport_oport|809|0|1295|0|{4|log|}482|487|}
{2010211001|XXGvertex_iport_iport|810|0|1297|0|{0|in|}482|488|}
{2010214001|XXGiport_src_flow|811|0|1299|0|{0|}488|463|}
{2010007001|XXGobject_proto_object|812|0|1300|0|{}482|489|}
{2010212001|XXGvertex_oport_oport|813|0|1302|0|{0|out|}489|490|}
{2010006001|XXGobject_psameas_object|814|0|1304|0|{metadata|out_metadata|1|0|}490|489|}
{2010212001|XXGvertex_oport_oport|815|0|1305|0|{1|deselect|}489|491|}
{2010006001|XXGobject_psameas_object|816|0|1307|0|{metadata|deselect_metadata|1|0|}491|489|}
{2010212001|XXGvertex_oport_oport|817|0|1308|0|{2|reject|}489|492|}
{2010006001|XXGobject_psameas_object|818|0|1310|0|{metadata|reject_metadata|1|0|}492|489|}
{2010212001|XXGvertex_oport_oport|819|0|1311|0|{3|error|}489|493|}
{2010006001|XXGobject_psameas_object|820|0|1313|0|{metadata|error_metadata|1|0|}493|489|}
{2010212001|XXGvertex_oport_oport|821|0|1314|0|{4|log|}489|494|}
{2010006001|XXGobject_psameas_object|822|0|1316|0|{metadata|log_metadata|1|0|}494|489|}
{2010211001|XXGvertex_iport_iport|823|0|1317|0|{0|in|}489|495|}
{2010006001|XXGobject_psameas_object|824|0|1319|0|{metadata|in_metadata|1|0|}495|489|}
{2010006001|XXGobject_psameas_object|825|0|1320|0|{Layout|Layout|0|0|}482|478|}
{2010006001|XXGobject_psameas_object|826|0|1321|0|{deselect_metadata|write_metadata|0|0|}482|478|}
{2010006001|XXGobject_psameas_object|827|0|1322|0|{in_metadata|out0_metadata|0|0|}482|496|}
{2010212001|XXGvertex_oport_oport|828|0|1324|0|{0|out0|}496|497|}
{2010213001|XXGoport_dst_flow|829|0|1326|0|{0|}497|463|}
{2010212001|XXGvertex_oport_oport|830|0|1327|0|{1|reject0|}496|498|}
{2010212001|XXGvertex_oport_oport|831|0|1329|0|{2|error0|}496|499|}
{2010212001|XXGvertex_oport_oport|832|0|1331|0|{3|log|}496|500|}
{2010211001|XXGvertex_iport_iport|833|0|1333|0|{0|in|}496|501|}
{2010214001|XXGiport_src_flow|834|0|1335|0|{0|}501|462|}
{2010007001|XXGobject_proto_object|835|0|1336|0|{}496|502|}
{2010212001|XXGvertex_oport_oport|836|0|1338|0|{0|out0|}502|503|}
{2010006001|XXGobject_psameas_object|837|0|1340|0|{metadata|out0_metadata|1|0|}503|502|}
{2010006001|XXGobject_psameas_object|838|0|1341|0|{transform0|transform0|1|0|}503|502|}
{2010212001|XXGvertex_oport_oport|839|0|1342|0|{1|reject0|}502|504|}
{2010006001|XXGobject_psameas_object|840|0|1344|0|{metadata|reject0_metadata|1|0|}504|502|}
{2010212001|XXGvertex_oport_oport|841|0|1345|0|{2|error0|}502|505|}
{2010006001|XXGobject_psameas_object|842|0|1347|0|{metadata|error0_metadata|1|0|}505|502|}
{2010212001|XXGvertex_oport_oport|843|0|1348|0|{3|log|}502|506|}
{2010006001|XXGobject_psameas_object|844|0|1350|0|{metadata|log_metadata|1|0|}506|502|}
{2010211001|XXGvertex_iport_iport|845|0|1351|0|{0|in|}502|507|}
{2010006001|XXGobject_psameas_object|846|0|1353|0|{metadata|in_metadata|1|0|}507|502|}
{2010006001|XXGobject_psameas_object|847|0|1354|0|{Layout|Layout|0|0|}496|478|}
{2010006001|XXGobject_psameas_object|848|0|1355|0|{in_metadata|read_metadata|0|0|}496|354|}
{2010006001|XXGobject_psameas_object|849|0|1356|0|{reject0_metadata|read_metadata|0|0|}496|354|}
{2010006001|XXGobject_psameas_object|850|0|1357|0|{out_metadata|write_metadata|0|0|}482|478|}
{2010006001|XXGobject_psameas_object|851|0|1358|0|{reject_metadata|out0_metadata|0|0|}482|496|}
{2010601001|XXGgraph_vertex_vertex|852|0|1359|0|{Rfmt_Find_Fsk_From_Ilm|}459|496|}
{2010212001|XXGvertex_oport_oport|853|0|1360|0|{0|out0|}459|508|}
{2010216002|XXGoport_binding_oport|854|0|1362|0|{.5|.5|{0|}9242|}508|483|}
{2010213001|XXGoport_dst_flow|855|0|1363|0|{0|}508|46|}
{2010211001|XXGvertex_iport_iport|856|0|1364|0|{0|in0|}459|509|}
{2010215002|XXGiport_binding_iport|857|0|1366|0|{.5|.5|{0|}9241|}509|470|}
{2010214001|XXGiport_src_flow|858|0|1367|0|{0|}509|45|}
{2010601001|XXGgraph_vertex_vertex|859|0|1368|0|{Find_PSets|}1|360|}
{2010601001|XXGgraph_vertex_vertex|860|0|1369|0|{Gather|}1|510|}
{2010212001|XXGvertex_oport_oport|861|0|1371|0|{0|out|}510|511|}
{2010213001|XXGoport_dst_flow|862|0|1373|0|{0|}511|37|}
{2010211001|XXGvertex_iport_iport|863|0|1374|0|{0|in|}510|512|}
{2010214001|XXGiport_src_flow|864|0|1376|0|{0|}512|24|}
{2010214001|XXGiport_src_flow|865|0|1377|0|{1|}512|34|}
{2010007001|XXGobject_proto_object|866|0|1378|0|{}510|513|}
{2010212001|XXGvertex_oport_oport|867|0|1380|0|{0|out|}513|514|}
{2010006001|XXGobject_psameas_object|868|0|1382|0|{metadata|out_metadata|1|0|}514|513|}
{2010211001|XXGvertex_iport_iport|869|0|1383|0|{0|in|}513|515|}
{2010006001|XXGobject_psameas_object|870|0|1385|0|{metadata|in_metadata|1|0|}515|513|}
{2010006001|XXGobject_psameas_object|871|0|1386|0|{Layout|Layout|0|0|}510|59|}
{2010006001|XXGobject_psameas_object|872|0|1387|0|{in_metadata|out_metadata|0|0|}510|516|}
{2010212001|XXGvertex_oport_oport|873|0|1389|0|{0|out|}516|517|}
{2010213001|XXGoport_dst_flow|874|0|1391|0|{0|}517|24|}
{2010212001|XXGvertex_oport_oport|875|0|1392|0|{1|deselect|}516|518|}
{2010212001|XXGvertex_oport_oport|876|0|1394|0|{2|reject|}516|519|}
{2010212001|XXGvertex_oport_oport|877|0|1396|0|{3|error|}516|520|}
{2010212001|XXGvertex_oport_oport|878|0|1398|0|{4|log|}516|521|}
{2010211001|XXGvertex_iport_iport|879|0|1400|0|{0|in|}516|522|}
{2010214001|XXGiport_src_flow|880|0|1402|0|{0|}522|47|}
{2010007001|XXGobject_proto_object|881|0|1403|0|{}516|523|}
{2010212001|XXGvertex_oport_oport|882|0|1405|0|{0|out|}523|524|}
{2010006001|XXGobject_psameas_object|883|0|1407|0|{metadata|out_metadata|1|0|}524|523|}
{2010212001|XXGvertex_oport_oport|884|0|1408|0|{1|deselect|}523|525|}
{2010006001|XXGobject_psameas_object|885|0|1410|0|{metadata|deselect_metadata|1|0|}525|523|}
{2010212001|XXGvertex_oport_oport|886|0|1411|0|{2|reject|}523|526|}
{2010006001|XXGobject_psameas_object|887|0|1413|0|{metadata|reject_metadata|1|0|}526|523|}
{2010212001|XXGvertex_oport_oport|888|0|1414|0|{3|error|}523|527|}
{2010006001|XXGobject_psameas_object|889|0|1416|0|{metadata|error_metadata|1|0|}527|523|}
{2010212001|XXGvertex_oport_oport|890|0|1417|0|{4|log|}523|528|}
{2010006001|XXGobject_psameas_object|891|0|1419|0|{metadata|log_metadata|1|0|}528|523|}
{2010211001|XXGvertex_iport_iport|892|0|1420|0|{0|in|}523|529|}
{2010006001|XXGobject_psameas_object|893|0|1422|0|{metadata|in_metadata|1|0|}529|523|}
{2010006001|XXGobject_psameas_object|894|0|1423|0|{Layout|Layout|0|0|}516|59|}
{2010006001|XXGobject_psameas_object|895|0|1424|0|{deselect_metadata|out_metadata|0|0|}516|516|}
{2010006001|XXGobject_psameas_object|896|0|1425|0|{in_metadata|out0_metadata|0|0|}516|342|}
{2010006001|XXGobject_psameas_object|897|0|1426|0|{reject_metadata|out_metadata|0|0|}516|516|}
{2010006001|XXGobject_psameas_object|898|0|1427|0|{out_metadata|out_metadata|0|0|}510|516|}
{2010601001|XXGgraph_vertex_vertex|899|0|1428|0|{InActivePset|}1|530|}
{2010007001|XXGobject_proto_object|900|0|1430|0|{}530|531|}
{2010601001|XXGgraph_vertex_vertex|901|0|1432|0|{Intermediate_File|}1|532|}
{2010212001|XXGvertex_oport_oport|902|0|1434|0|{0|read|}532|533|}
{2010213001|XXGoport_dst_flow|903|0|1436|0|{0|}533|44|}
{2010213001|XXGoport_dst_flow|904|0|1437|0|{1|}533|45|}
{2010211001|XXGvertex_iport_iport|905|0|1438|0|{0|write|}532|534|}
{2010214001|XXGiport_src_flow|906|0|1440|0|{0|}534|22|}
{2010007001|XXGobject_proto_object|907|0|1441|0|{}532|535|}
{2010212001|XXGvertex_oport_oport|908|0|1443|0|{0|read|}535|536|}
{2010006001|XXGobject_psameas_object|909|0|1445|0|{metadata|read_metadata|1|0|}536|535|}
{2010211001|XXGvertex_iport_iport|910|0|1446|0|{0|write|}535|537|}
{2010006001|XXGobject_psameas_object|911|0|1448|0|{metadata|write_metadata|1|0|}537|535|}
{2010006001|XXGobject_psameas_object|912|0|1449|0|{read_metadata|read_metadata|0|0|}532|354|}
{2010006001|XXGobject_psameas_object|913|0|1450|0|{write_metadata|read_metadata|0|0|}532|354|}
{2010601001|XXGgraph_vertex_vertex|914|0|1451|0|{Keep_EME_Path|}1|538|}
{2010212001|XXGvertex_oport_oport|915|0|1453|0|{0|out0|}538|539|}
{2010213001|XXGoport_dst_flow|916|0|1455|0|{0|}539|27|}
{2010212001|XXGvertex_oport_oport|917|0|1456|0|{1|reject0|}538|540|}
{2010212001|XXGvertex_oport_oport|918|0|1458|0|{2|error0|}538|541|}
{2010212001|XXGvertex_oport_oport|919|0|1460|0|{3|log|}538|542|}
{2010211001|XXGvertex_iport_iport|920|0|1462|0|{0|in|}538|543|}
{2010214001|XXGiport_src_flow|921|0|1464|0|{0|}543|49|}
{2010007001|XXGobject_proto_object|922|0|1465|0|{}538|544|}
{2010212001|XXGvertex_oport_oport|923|0|1467|0|{0|out0|}544|545|}
{2010006001|XXGobject_psameas_object|924|0|1469|0|{metadata|out0_metadata|1|0|}545|544|}
{2010006001|XXGobject_psameas_object|925|0|1470|0|{transform0|transform0|1|0|}545|544|}
{2010212001|XXGvertex_oport_oport|926|0|1471|0|{1|reject0|}544|546|}
{2010006001|XXGobject_psameas_object|927|0|1473|0|{metadata|reject0_metadata|1|0|}546|544|}
{2010212001|XXGvertex_oport_oport|928|0|1474|0|{2|error0|}544|547|}
{2010006001|XXGobject_psameas_object|929|0|1476|0|{metadata|error0_metadata|1|0|}547|544|}
{2010212001|XXGvertex_oport_oport|930|0|1477|0|{3|log|}544|548|}
{2010006001|XXGobject_psameas_object|931|0|1479|0|{metadata|log_metadata|1|0|}548|544|}
{2010211001|XXGvertex_iport_iport|932|0|1480|0|{0|in|}544|549|}
{2010006001|XXGobject_psameas_object|933|0|1482|0|{metadata|in_metadata|1|0|}549|544|}
{2010006001|XXGobject_psameas_object|934|0|1483|0|{Layout|Layout|0|0|}538|354|}
{2010006001|XXGobject_psameas_object|935|0|1484|0|{in_metadata|out0_metadata|0|0|}538|342|}
{2010006001|XXGobject_psameas_object|936|0|1485|0|{out0_metadata|in_metadata|0|0|}538|354|}
{2010006001|XXGobject_psameas_object|937|0|1486|0|{reject0_metadata|out0_metadata|0|0|}538|342|}
{2010601001|XXGgraph_vertex_vertex|938|0|1487|0|{Link_For_Fsk_For_Keying|}1|550|}
{2010007001|XXGobject_proto_object|939|0|1489|0|{}550|551|}
{2010601001|XXGgraph_vertex_vertex|940|0|1491|0|{Link_For_Fsk_For_Map|}1|478|}
{2010601001|XXGgraph_vertex_vertex|941|0|1492|0|{Link_PSets_via_Datasets|}1|552|}
{2010605001|XXGgraph_legend_legend|942|0|1494|0|{0|}552|553|}
{2010241001|XXGlegend_face_face|943|0|1496|0|{}553|554|}
{2010604001|XXGgraph_flow_flow|944|0|1498|0|{Flow_1|}552|555|}
{2010604001|XXGgraph_flow_flow|945|0|1500|0|{Flow_2|}552|556|}
{2010604001|XXGgraph_flow_flow|946|0|1502|0|{Flow_3|}552|557|}
{2010604001|XXGgraph_flow_flow|947|0|1504|0|{Flow_4|}552|558|}
{2010604001|XXGgraph_flow_flow|948|0|1506|0|{Flow_5|}552|559|}
{2010604001|XXGgraph_flow_flow|949|0|1508|0|{Flow_6|}552|560|}
{2010604001|XXGgraph_flow_flow|950|0|1510|0|{Flow_7|}552|561|}
{2010601001|XXGgraph_vertex_vertex|951|0|1512|0|{Inner_Join_by_Dataset|}552|562|}
{2010212001|XXGvertex_oport_oport|952|0|1514|0|{0|out|}562|563|}
{2010213001|XXGoport_dst_flow|953|0|1516|0|{0|}563|555|}
{2010212001|XXGvertex_oport_oport|954|0|1517|0|{1|unused0|}562|564|}
{2010213001|XXGoport_dst_flow|955|0|1519|0|{0|}564|560|}
{2010212001|XXGvertex_oport_oport|956|0|1520|0|{2|unused1|}562|565|}
{2010213001|XXGoport_dst_flow|957|0|1522|0|{0|}565|561|}
{2010212001|XXGvertex_oport_oport|958|0|1523|0|{3|reject0|}562|566|}
{2010212001|XXGvertex_oport_oport|959|0|1525|0|{4|reject1|}562|567|}
{2010212001|XXGvertex_oport_oport|960|0|1527|0|{5|error0|}562|568|}
{2010212001|XXGvertex_oport_oport|961|0|1529|0|{6|error1|}562|569|}
{2010212001|XXGvertex_oport_oport|962|0|1531|0|{7|log|}562|570|}
{2010211001|XXGvertex_iport_iport|963|0|1533|0|{0|read|}562|571|}
{2010214001|XXGiport_src_flow|964|0|1535|0|{0|}571|558|}
{2010211001|XXGvertex_iport_iport|965|0|1536|0|{1|write|}562|572|}
{2010214001|XXGiport_src_flow|966|0|1538|0|{0|}572|559|}
{2010007001|XXGobject_proto_object|967|0|1539|0|{}562|573|}
{2010212001|XXGvertex_oport_oport|968|0|1541|0|{0|out|}573|574|}
{2010006001|XXGobject_psameas_object|969|0|1543|0|{metadata|out_metadata|1|0|}574|573|}
{2010212001|XXGvertex_oport_oport|970|0|1544|0|{1|unused0|}573|575|}
{2010006001|XXGobject_psameas_object|971|0|1546|0|{metadata|unused0_metadata|1|0|}575|573|}
{2010212001|XXGvertex_oport_oport|972|0|1547|0|{2|unused1|}573|576|}
{2010006001|XXGobject_psameas_object|973|0|1549|0|{metadata|unused1_metadata|1|0|}576|573|}
{2010212001|XXGvertex_oport_oport|974|0|1550|0|{3|reject0|}573|577|}
{2010006001|XXGobject_psameas_object|975|0|1552|0|{metadata|reject0_metadata|1|0|}577|573|}
{2010212001|XXGvertex_oport_oport|976|0|1553|0|{4|reject1|}573|578|}
{2010006001|XXGobject_psameas_object|977|0|1555|0|{metadata|reject1_metadata|1|0|}578|573|}
{2010212001|XXGvertex_oport_oport|978|0|1556|0|{5|error0|}573|579|}
{2010006001|XXGobject_psameas_object|979|0|1558|0|{metadata|error0_metadata|1|0|}579|573|}
{2010212001|XXGvertex_oport_oport|980|0|1559|0|{6|error1|}573|580|}
{2010006001|XXGobject_psameas_object|981|0|1561|0|{metadata|error1_metadata|1|0|}580|573|}
{2010212001|XXGvertex_oport_oport|982|0|1562|0|{7|log|}573|581|}
{2010006001|XXGobject_psameas_object|983|0|1564|0|{metadata|log_metadata|1|0|}581|573|}
{2010211001|XXGvertex_iport_iport|984|0|1565|0|{0|read|}573|582|}
{2010006001|XXGobject_psameas_object|985|0|1567|0|{dedup0|dedup0|1|0|}582|573|}
{2010006001|XXGobject_psameas_object|986|0|1568|0|{dedup_keyword0|dedup_keyword0|1|0|}582|573|}
{2010006001|XXGobject_psameas_object|987|0|1569|0|{dedup_positional0|dedup_positional0|1|0|}582|573|}
{2010006001|XXGobject_psameas_object|988|0|1570|0|{metadata|in0_metadata|1|0|}582|573|}
{2010006001|XXGobject_psameas_object|989|0|1571|0|{override_key0|override_key0|1|0|}582|573|}
{2010006001|XXGobject_psameas_object|990|0|1572|0|{record_required0|record_required0|1|0|}582|573|}
{2010006001|XXGobject_psameas_object|991|0|1573|0|{record_required_keyword0|record_required_keyword0|1|0|}582|573|}
{2010006001|XXGobject_psameas_object|992|0|1574|0|{record_required_positional0|record_required_positional0|1|0|}582|573|}
{2010006001|XXGobject_psameas_object|993|0|1575|0|{select0|select0|1|0|}582|573|}
{2010006001|XXGobject_psameas_object|994|0|1576|0|{select_keyword0|select_keyword0|1|0|}582|573|}
{2010006001|XXGobject_psameas_object|995|0|1577|0|{select_positional0|select_positional0|1|0|}582|573|}
{2010211001|XXGvertex_iport_iport|996|0|1578|0|{1|write|}573|583|}
{2010006001|XXGobject_psameas_object|997|0|1580|0|{dedup1|dedup1|1|0|}583|573|}
{2010006001|XXGobject_psameas_object|998|0|1581|0|{dedup_keyword1|dedup_keyword1|1|0|}583|573|}
{2010006001|XXGobject_psameas_object|999|0|1582|0|{dedup_positional1|dedup_positional1|1|0|}583|573|}
{2010006001|XXGobject_psameas_object|1000|0|1583|0|{metadata|in1_metadata|1|0|}583|573|}
{2010006001|XXGobject_psameas_object|1001|0|1584|0|{override_key1|override_key1|1|0|}583|573|}
{2010006001|XXGobject_psameas_object|1002|0|1585|0|{record_required1|record_required1|1|0|}583|573|}
{2010006001|XXGobject_psameas_object|1003|0|1586|0|{record_required_keyword1|record_required_keyword1|1|0|}583|573|}
{2010006001|XXGobject_psameas_object|1004|0|1587|0|{record_required_positional1|record_required_positional1|1|0|}583|573|}
{2010006001|XXGobject_psameas_object|1005|0|1588|0|{select1|select1|1|0|}583|573|}
{2010006001|XXGobject_psameas_object|1006|0|1589|0|{select_keyword1|select_keyword1|1|0|}583|573|}
{2010006001|XXGobject_psameas_object|1007|0|1590|0|{select_positional1|select_positional1|1|0|}583|573|}
{2010006001|XXGobject_psameas_object|1008|0|1591|0|{Layout|Layout|0|0|}562|584|}
{2010211001|XXGvertex_iport_iport|1009|0|1593|0|{0|write|}584|585|}
{2010214001|XXGiport_src_flow|1010|0|1595|0|{0|}585|16|}
{2010007001|XXGobject_proto_object|1011|0|1596|0|{}584|586|}
{2010211001|XXGvertex_iport_iport|1012|0|1598|0|{0|write|}586|587|}
{2010006001|XXGobject_psameas_object|1013|0|1600|0|{metadata|write_metadata|1|0|}587|586|}
{2010006001|XXGobject_psameas_object|1014|0|1601|0|{in0_metadata|out_metadata|0|0|}562|588|}
{2010212001|XXGvertex_oport_oport|1015|0|1603|0|{0|out|}588|589|}
{2010213001|XXGoport_dst_flow|1016|0|1605|0|{0|}589|558|}
{2010212001|XXGvertex_oport_oport|1017|0|1606|0|{1|reject|}588|590|}
{2010212001|XXGvertex_oport_oport|1018|0|1608|0|{2|error|}588|591|}
{2010212001|XXGvertex_oport_oport|1019|0|1610|0|{3|log|}588|592|}
{2010211001|XXGvertex_iport_iport|1020|0|1612|0|{0|in|}588|593|}
{2010214001|XXGiport_src_flow|1021|0|1614|0|{0|}593|556|}
{2010007001|XXGobject_proto_object|1022|0|1615|0|{}588|594|}
{2010212001|XXGvertex_oport_oport|1023|0|1617|0|{0|out|}594|595|}
{2010006001|XXGobject_psameas_object|1024|0|1619|0|{metadata|out_metadata|1|0|}595|594|}
{2010212001|XXGvertex_oport_oport|1025|0|1620|0|{1|reject|}594|596|}
{2010006001|XXGobject_psameas_object|1026|0|1622|0|{metadata|reject_metadata|1|0|}596|594|}
{2010212001|XXGvertex_oport_oport|1027|0|1623|0|{2|error|}594|597|}
{2010006001|XXGobject_psameas_object|1028|0|1625|0|{metadata|error_metadata|1|0|}597|594|}
{2010212001|XXGvertex_oport_oport|1029|0|1626|0|{3|log|}594|598|}
{2010006001|XXGobject_psameas_object|1030|0|1628|0|{metadata|log_metadata|1|0|}598|594|}
{2010211001|XXGvertex_iport_iport|1031|0|1629|0|{0|in|}594|599|}
{2010006001|XXGobject_psameas_object|1032|0|1631|0|{metadata|in_metadata|1|0|}599|594|}
{2010006001|XXGobject_psameas_object|1033|0|1632|0|{Layout|Layout|0|0|}588|584|}
{2010006001|XXGobject_psameas_object|1034|0|1633|0|{in_metadata|out0_metadata|0|0|}588|600|}
{2010212001|XXGvertex_oport_oport|1035|0|1635|0|{0|out0|}600|601|}
{2010213001|XXGoport_dst_flow|1036|0|1637|0|{0|}601|556|}
{2010212001|XXGvertex_oport_oport|1037|0|1638|0|{1|out1|}600|602|}
{2010213001|XXGoport_dst_flow|1038|0|1640|0|{0|}602|557|}
{2010212001|XXGvertex_oport_oport|1039|0|1641|0|{2|reject0|}600|603|}
{2010212001|XXGvertex_oport_oport|1040|0|1643|0|{3|reject1|}600|604|}
{2010212001|XXGvertex_oport_oport|1041|0|1645|0|{4|error0|}600|605|}
{2010212001|XXGvertex_oport_oport|1042|0|1647|0|{5|error1|}600|606|}
{2010212001|XXGvertex_oport_oport|1043|0|1649|0|{6|log|}600|607|}
{2010211001|XXGvertex_iport_iport|1044|0|1651|0|{0|in|}600|608|}
{2010007001|XXGobject_proto_object|1045|0|1653|0|{}600|609|}
{2010212001|XXGvertex_oport_oport|1046|0|1655|0|{0|out0|}609|610|}
{2010006001|XXGobject_psameas_object|1047|0|1657|0|{metadata|out0_metadata|1|0|}610|609|}
{2010006001|XXGobject_psameas_object|1048|0|1658|0|{transform0|transform0|1|0|}610|609|}
{2010212001|XXGvertex_oport_oport|1049|0|1659|0|{1|out1|}609|611|}
{2010006001|XXGobject_psameas_object|1050|0|1661|0|{metadata|out1_metadata|1|0|}611|609|}
{2010006001|XXGobject_psameas_object|1051|0|1662|0|{transform1|transform1|1|0|}611|609|}
{2010212001|XXGvertex_oport_oport|1052|0|1663|0|{2|reject0|}609|612|}
{2010006001|XXGobject_psameas_object|1053|0|1665|0|{metadata|reject0_metadata|1|0|}612|609|}
{2010212001|XXGvertex_oport_oport|1054|0|1666|0|{3|reject1|}609|613|}
{2010006001|XXGobject_psameas_object|1055|0|1668|0|{metadata|reject1_metadata|1|0|}613|609|}
{2010212001|XXGvertex_oport_oport|1056|0|1669|0|{4|error0|}609|614|}
{2010006001|XXGobject_psameas_object|1057|0|1671|0|{metadata|error0_metadata|1|0|}614|609|}
{2010212001|XXGvertex_oport_oport|1058|0|1672|0|{5|error1|}609|615|}
{2010006001|XXGobject_psameas_object|1059|0|1674|0|{metadata|error1_metadata|1|0|}615|609|}
{2010212001|XXGvertex_oport_oport|1060|0|1675|0|{6|log|}609|616|}
{2010006001|XXGobject_psameas_object|1061|0|1677|0|{metadata|log_metadata|1|0|}616|609|}
{2010211001|XXGvertex_iport_iport|1062|0|1678|0|{0|in|}609|617|}
{2010006001|XXGobject_psameas_object|1063|0|1680|0|{metadata|in_metadata|1|0|}617|609|}
{2010006001|XXGobject_psameas_object|1064|0|1681|0|{Layout|Layout|0|0|}600|584|}
{2010006001|XXGobject_psameas_object|1065|0|1682|0|{in_metadata|read_metadata|0|0|}600|354|}
{2010006001|XXGobject_psameas_object|1066|0|1683|0|{reject0_metadata|read_metadata|0|0|}600|354|}
{2010006001|XXGobject_psameas_object|1067|0|1684|0|{reject1_metadata|read_metadata|0|0|}600|354|}
{2010006001|XXGobject_psameas_object|1068|0|1685|0|{reject_metadata|out0_metadata|0|0|}588|600|}
{2010006001|XXGobject_psameas_object|1069|0|1686|0|{in1_metadata|out_metadata|0|0|}562|588|}
{2010006001|XXGobject_psameas_object|1070|0|1687|0|{reject0_metadata|out_metadata|0|0|}562|588|}
{2010006001|XXGobject_psameas_object|1071|0|1688|0|{reject1_metadata|out_metadata|0|0|}562|588|}
{2010006001|XXGobject_psameas_object|1072|0|1689|0|{unused0_metadata|out_metadata|0|0|}562|588|}
{2010006001|XXGobject_psameas_object|1073|0|1690|0|{unused1_metadata|out_metadata|0|0|}562|588|}
{2010601001|XXGgraph_vertex_vertex|1074|0|1691|0|{Normalize_Datasets_Read|}552|588|}
{2010601001|XXGgraph_vertex_vertex|1075|0|1692|0|{Normalize_Datasets_Written|}552|618|}
{2010212001|XXGvertex_oport_oport|1076|0|1694|0|{0|out|}618|619|}
{2010213001|XXGoport_dst_flow|1077|0|1696|0|{0|}619|559|}
{2010212001|XXGvertex_oport_oport|1078|0|1697|0|{1|reject|}618|620|}
{2010212001|XXGvertex_oport_oport|1079|0|1699|0|{2|error|}618|621|}
{2010212001|XXGvertex_oport_oport|1080|0|1701|0|{3|log|}618|622|}
{2010211001|XXGvertex_iport_iport|1081|0|1703|0|{0|in|}618|623|}
{2010214001|XXGiport_src_flow|1082|0|1705|0|{0|}623|557|}
{2010007001|XXGobject_proto_object|1083|0|1706|0|{}618|624|}
{2010212001|XXGvertex_oport_oport|1084|0|1708|0|{0|out|}624|625|}
{2010006001|XXGobject_psameas_object|1085|0|1710|0|{metadata|out_metadata|1|0|}625|624|}
{2010212001|XXGvertex_oport_oport|1086|0|1711|0|{1|reject|}624|626|}
{2010006001|XXGobject_psameas_object|1087|0|1713|0|{metadata|reject_metadata|1|0|}626|624|}
{2010212001|XXGvertex_oport_oport|1088|0|1714|0|{2|error|}624|627|}
{2010006001|XXGobject_psameas_object|1089|0|1716|0|{metadata|error_metadata|1|0|}627|624|}
{2010212001|XXGvertex_oport_oport|1090|0|1717|0|{3|log|}624|628|}
{2010006001|XXGobject_psameas_object|1091|0|1719|0|{metadata|log_metadata|1|0|}628|624|}
{2010211001|XXGvertex_iport_iport|1092|0|1720|0|{0|in|}624|629|}
{2010006001|XXGobject_psameas_object|1093|0|1722|0|{metadata|in_metadata|1|0|}629|624|}
{2010006001|XXGobject_psameas_object|1094|0|1723|0|{Layout|Layout|0|0|}618|584|}
{2010006001|XXGobject_psameas_object|1095|0|1724|0|{in_metadata|out1_metadata|0|0|}618|600|}
{2010006001|XXGobject_psameas_object|1096|0|1725|0|{out_metadata|out_metadata|0|0|}618|588|}
{2010006001|XXGobject_psameas_object|1097|0|1726|0|{reject_metadata|out1_metadata|0|0|}618|600|}
{2010601001|XXGgraph_vertex_vertex|1098|0|1727|0|{Remove_Cycles_and_Max_SKs|}552|630|}
{2010212001|XXGvertex_oport_oport|1099|0|1729|0|{0|out|}630|631|}
{2010212001|XXGvertex_oport_oport|1100|0|1731|0|{1|deselect|}630|632|}
{2010212001|XXGvertex_oport_oport|1101|0|1733|0|{2|reject|}630|633|}
{2010212001|XXGvertex_oport_oport|1102|0|1735|0|{3|error|}630|634|}
{2010212001|XXGvertex_oport_oport|1103|0|1737|0|{4|log|}630|635|}
{2010211001|XXGvertex_iport_iport|1104|0|1739|0|{0|in|}630|636|}
{2010214001|XXGiport_src_flow|1105|0|1741|0|{0|}636|555|}
{2010007001|XXGobject_proto_object|1106|0|1742|0|{}630|637|}
{2010212001|XXGvertex_oport_oport|1107|0|1744|0|{0|out|}637|638|}
{2010006001|XXGobject_psameas_object|1108|0|1746|0|{metadata|out_metadata|1|0|}638|637|}
{2010212001|XXGvertex_oport_oport|1109|0|1747|0|{1|deselect|}637|639|}
{2010006001|XXGobject_psameas_object|1110|0|1749|0|{metadata|deselect_metadata|1|0|}639|637|}
{2010212001|XXGvertex_oport_oport|1111|0|1750|0|{2|reject|}637|640|}
{2010006001|XXGobject_psameas_object|1112|0|1752|0|{metadata|reject_metadata|1|0|}640|637|}
{2010212001|XXGvertex_oport_oport|1113|0|1753|0|{3|error|}637|641|}
{2010006001|XXGobject_psameas_object|1114|0|1755|0|{metadata|error_metadata|1|0|}641|637|}
{2010212001|XXGvertex_oport_oport|1115|0|1756|0|{4|log|}637|642|}
{2010006001|XXGobject_psameas_object|1116|0|1758|0|{metadata|log_metadata|1|0|}642|637|}
{2010211001|XXGvertex_iport_iport|1117|0|1759|0|{0|in|}637|643|}
{2010006001|XXGobject_psameas_object|1118|0|1761|0|{metadata|in_metadata|1|0|}643|637|}
{2010006001|XXGobject_psameas_object|1119|0|1762|0|{Layout|Layout|0|0|}630|584|}
{2010006001|XXGobject_psameas_object|1120|0|1763|0|{deselect_metadata|out_metadata|0|0|}630|562|}
{2010006001|XXGobject_psameas_object|1121|0|1764|0|{in_metadata|out_metadata|0|0|}630|562|}
{2010006001|XXGobject_psameas_object|1122|0|1765|0|{out_metadata|out_metadata|0|0|}630|562|}
{2010006001|XXGobject_psameas_object|1123|0|1766|0|{reject_metadata|out_metadata|0|0|}630|562|}
{2010601001|XXGgraph_vertex_vertex|1124|0|1767|0|{Separate_Vectors|}552|600|}
{2010601001|XXGgraph_vertex_vertex|1125|0|1768|0|{Trash|}552|644|}
{2010211001|XXGvertex_iport_iport|1126|0|1770|0|{0|in|}644|645|}
{2010214001|XXGiport_src_flow|1127|0|1772|0|{0|}645|560|}
{2010007001|XXGobject_proto_object|1128|0|1773|0|{}644|646|}
{2010211001|XXGvertex_iport_iport|1129|0|1775|0|{0|in|}646|647|}
{2010006001|XXGobject_psameas_object|1130|0|1777|0|{metadata|in_metadata|1|0|}647|646|}
{2010006001|XXGobject_psameas_object|1131|0|1778|0|{Layout|Layout|0|0|}644|584|}
{2010006001|XXGobject_psameas_object|1132|0|1779|0|{in_metadata|out_metadata|0|0|}644|588|}
{2010601001|XXGgraph_vertex_vertex|1133|0|1780|0|{Trash_1|}552|648|}
{2010211001|XXGvertex_iport_iport|1134|0|1782|0|{0|in|}648|649|}
{2010214001|XXGiport_src_flow|1135|0|1784|0|{0|}649|561|}
{2010007001|XXGobject_proto_object|1136|0|1785|0|{}648|650|}
{2010211001|XXGvertex_iport_iport|1137|0|1787|0|{0|in|}650|651|}
{2010006001|XXGobject_psameas_object|1138|0|1789|0|{metadata|in_metadata|1|0|}651|650|}
{2010006001|XXGobject_psameas_object|1139|0|1790|0|{Layout|Layout|0|0|}648|584|}
{2010006001|XXGobject_psameas_object|1140|0|1791|0|{in_metadata|out_metadata|0|0|}648|588|}
{2010212001|XXGvertex_oport_oport|1141|0|1792|0|{0|out0|}552|652|}
{2010216002|XXGoport_binding_oport|1142|0|1794|0|{.5|.5|{12|1032000|264000|1052000|264000|1070000|264000|1070000|279000|1088000|279000|1108000|279000|}904|}652|631|}
{2010213001|XXGoport_dst_flow|1143|0|1795|0|{0|}652|51|}
{2010211001|XXGvertex_iport_iport|1144|0|1796|0|{0|in|}552|653|}
{2010215002|XXGiport_binding_iport|1145|0|1798|0|{.5|.5|{12|65000|264000|45000|264000|43000|264000|43000|279000|41000|279000|21000|279000|}903|}653|608|}
{2010214001|XXGiport_src_flow|1146|0|1799|0|{0|}653|44|}
{2010601001|XXGgraph_vertex_vertex|1147|0|1800|0|{Links_by_Reader|}1|584|}
{2010601001|XXGgraph_vertex_vertex|1148|0|1801|0|{Links_by_Writer|}1|654|}
{2010007001|XXGobject_proto_object|1149|0|1803|0|{}654|655|}
{2010601001|XXGgraph_vertex_vertex|1150|0|1805|0|{Optional_Keep_Partial_Plan_Tasks|}1|516|}
{2010601001|XXGgraph_vertex_vertex|1151|0|1806|0|{Optional_Stimulate_Normalize|}1|128|}
{2010601001|XXGgraph_vertex_vertex|1152|0|1807|0|{Partial_Plan_Links_by_Reader|}1|92|}
{2010601001|XXGgraph_vertex_vertex|1153|0|1808|0|{Partial_Plan_Links_by_Writer|}1|656|}
{2010007001|XXGobject_proto_object|1154|0|1810|0|{}656|657|}
{2010601001|XXGgraph_vertex_vertex|1155|0|1812|0|{Plan_Contents|}1|59|}
{2010601001|XXGgraph_vertex_vertex|1156|0|1813|0|{Replicate|}1|658|}
{2010212001|XXGvertex_oport_oport|1157|0|1815|0|{0|out|}658|659|}
{2010213001|XXGoport_dst_flow|1158|0|1817|0|{0|}659|21|}
{2010213001|XXGoport_dst_flow|1159|0|1818|0|{1|}659|16|}
{2010211001|XXGvertex_iport_iport|1160|0|1819|0|{0|in|}658|660|}
{2010214001|XXGiport_src_flow|1161|0|1821|0|{0|}660|51|}
{2010007001|XXGobject_proto_object|1162|0|1822|0|{}658|661|}
{2010212001|XXGvertex_oport_oport|1163|0|1824|0|{0|out|}661|662|}
{2010006001|XXGobject_psameas_object|1164|0|1826|0|{metadata|out_metadata|1|0|}662|661|}
{2010211001|XXGvertex_iport_iport|1165|0|1827|0|{0|in|}661|663|}
{2010006001|XXGobject_psameas_object|1166|0|1829|0|{metadata|in_metadata|1|0|}663|661|}
{2010006001|XXGobject_psameas_object|1167|0|1830|0|{Layout|Layout|0|0|}658|584|}
{2010006001|XXGobject_psameas_object|1168|0|1831|0|{in_metadata|write_metadata|0|0|}658|584|}
{2010006001|XXGobject_psameas_object|1169|0|1832|0|{out_metadata|write_metadata|0|0|}658|584|}
{2010601001|XXGgraph_vertex_vertex|1170|0|1833|0|{Replicate_|}1|664|}
{2010212001|XXGvertex_oport_oport|1171|0|1835|0|{0|out|}664|665|}
{2010213001|XXGoport_dst_flow|1172|0|1837|0|{0|}665|23|}
{2010211001|XXGvertex_iport_iport|1173|0|1838|0|{0|in|}664|666|}
{2010214001|XXGiport_src_flow|1174|0|1840|0|{0|}666|21|}
{2010007001|XXGobject_proto_object|1175|0|1841|0|{}664|667|}
{2010212001|XXGvertex_oport_oport|1176|0|1843|0|{0|out|}667|668|}
{2010006001|XXGobject_psameas_object|1177|0|1845|0|{metadata|out_metadata|1|0|}668|667|}
{2010211001|XXGvertex_iport_iport|1178|0|1846|0|{0|in|}667|669|}
{2010006001|XXGobject_psameas_object|1179|0|1848|0|{metadata|in_metadata|1|0|}669|667|}
{2010006001|XXGobject_psameas_object|1180|0|1849|0|{Layout|Layout|0|0|}664|59|}
{2010006001|XXGobject_psameas_object|1181|0|1850|0|{in_metadata|write_metadata|0|0|}664|584|}
{2010006001|XXGobject_psameas_object|1182|0|1851|0|{out_metadata|write_metadata|0|0|}664|584|}
{2010601001|XXGgraph_vertex_vertex|1183|0|1852|0|{Replicate_1|}1|670|}
{2010212001|XXGvertex_oport_oport|1184|0|1854|0|{0|out|}670|671|}
{2010213001|XXGoport_dst_flow|1185|0|1856|0|{0|}671|29|}
{2010213001|XXGoport_dst_flow|1186|0|1857|0|{1|}671|18|}
{2010211001|XXGvertex_iport_iport|1187|0|1858|0|{0|in|}670|672|}
{2010214001|XXGiport_src_flow|1188|0|1860|0|{0|}672|36|}
{2010007001|XXGobject_proto_object|1189|0|1861|0|{}670|673|}
{2010212001|XXGvertex_oport_oport|1190|0|1863|0|{0|out|}673|674|}
{2010006001|XXGobject_psameas_object|1191|0|1865|0|{metadata|out_metadata|1|0|}674|673|}
{2010211001|XXGvertex_iport_iport|1192|0|1866|0|{0|in|}673|675|}
{2010006001|XXGobject_psameas_object|1193|0|1868|0|{metadata|in_metadata|1|0|}675|673|}
{2010006001|XXGobject_psameas_object|1194|0|1869|0|{Layout|Layout|0|0|}670|92|}
{2010006001|XXGobject_psameas_object|1195|0|1870|0|{in_metadata|write_metadata|0|0|}670|92|}
{2010006001|XXGobject_psameas_object|1196|0|1871|0|{out_metadata|write_metadata|0|0|}670|92|}
{2010601001|XXGgraph_vertex_vertex|1197|0|1872|0|{Replicate_PSets|}1|676|}
{2010212001|XXGvertex_oport_oport|1198|0|1874|0|{0|out|}676|677|}
{2010213001|XXGoport_dst_flow|1199|0|1876|0|{0|}677|47|}
{2010213001|XXGoport_dst_flow|1200|0|1877|0|{1|}677|49|}
{2010211001|XXGvertex_iport_iport|1201|0|1878|0|{0|in|}676|678|}
{2010214001|XXGiport_src_flow|1202|0|1880|0|{0|}678|28|}
{2010007001|XXGobject_proto_object|1203|0|1881|0|{}676|679|}
{2010212001|XXGvertex_oport_oport|1204|0|1883|0|{0|out|}679|680|}
{2010006001|XXGobject_psameas_object|1205|0|1885|0|{metadata|out_metadata|1|0|}680|679|}
{2010211001|XXGvertex_iport_iport|1206|0|1886|0|{0|in|}679|681|}
{2010006001|XXGobject_psameas_object|1207|0|1888|0|{metadata|in_metadata|1|0|}681|679|}
{2010006001|XXGobject_psameas_object|1208|0|1889|0|{Layout|Layout|0|0|}676|354|}
{2010006001|XXGobject_psameas_object|1209|0|1890|0|{in_metadata|out0_metadata|0|0|}676|342|}
{2010006001|XXGobject_psameas_object|1210|0|1891|0|{out_metadata|out0_metadata|0|0|}676|342|}
{2010601001|XXGgraph_vertex_vertex|1211|0|1892|0|{Rollup_m_plan_Commands_for_Links|}1|63|}
{2010601001|XXGgraph_vertex_vertex|1212|0|1893|0|{Rollup_m_plan_Commands_for_Tasks|}1|682|}
{2010212001|XXGvertex_oport_oport|1213|0|1895|0|{0|out|}682|683|}
{2010213001|XXGoport_dst_flow|1214|0|1897|0|{0|}683|42|}
{2010212001|XXGvertex_oport_oport|1215|0|1898|0|{1|reject|}682|684|}
{2010212001|XXGvertex_oport_oport|1216|0|1900|0|{2|error|}682|685|}
{2010212001|XXGvertex_oport_oport|1217|0|1902|0|{3|log|}682|686|}
{2010211001|XXGvertex_iport_iport|1218|0|1904|0|{0|in|}682|687|}
{2010214001|XXGiport_src_flow|1219|0|1906|0|{0|}687|37|}
{2010007001|XXGobject_proto_object|1220|0|1907|0|{}682|688|}
{2010212001|XXGvertex_oport_oport|1221|0|1909|0|{0|out|}688|689|}
{2010006001|XXGobject_psameas_object|1222|0|1911|0|{metadata|out_metadata|1|0|}689|688|}
{2010212001|XXGvertex_oport_oport|1223|0|1912|0|{1|reject|}688|690|}
{2010006001|XXGobject_psameas_object|1224|0|1914|0|{metadata|reject_metadata|1|0|}690|688|}
{2010212001|XXGvertex_oport_oport|1225|0|1915|0|{2|error|}688|691|}
{2010006001|XXGobject_psameas_object|1226|0|1917|0|{metadata|error_metadata|1|0|}691|688|}
{2010212001|XXGvertex_oport_oport|1227|0|1918|0|{3|log|}688|692|}
{2010006001|XXGobject_psameas_object|1228|0|1920|0|{metadata|log_metadata|1|0|}692|688|}
{2010211001|XXGvertex_iport_iport|1229|0|1921|0|{0|in|}688|693|}
{2010006001|XXGobject_psameas_object|1230|0|1923|0|{metadata|in_metadata|1|0|}693|688|}
{2010006001|XXGobject_psameas_object|1231|0|1924|0|{Layout|Layout|0|0|}682|59|}
{2010006001|XXGobject_psameas_object|1232|0|1925|0|{in_metadata|out_metadata|0|0|}682|516|}
{2010006001|XXGobject_psameas_object|1233|0|1926|0|{reject_metadata|out_metadata|0|0|}682|516|}
{2010601001|XXGgraph_vertex_vertex|1234|0|1927|0|{Trash|}1|694|}
{2010211001|XXGvertex_iport_iport|1235|0|1929|0|{0|in|}694|695|}
{2010214001|XXGiport_src_flow|1236|0|1931|0|{0|}695|26|}
{2010007001|XXGobject_proto_object|1237|0|1932|0|{}694|696|}
{2010211001|XXGvertex_iport_iport|1238|0|1934|0|{0|in|}696|697|}
{2010006001|XXGobject_psameas_object|1239|0|1936|0|{metadata|in_metadata|1|0|}697|696|}
{2010006001|XXGobject_psameas_object|1240|0|1937|0|{Layout|Layout|0|0|}694|354|}
{2010006001|XXGobject_psameas_object|1241|0|1938|0|{in_metadata|out_metadata|0|0|}694|360|}
{2010601001|XXGgraph_vertex_vertex|1242|0|1939|0|{Trash_1|}1|698|}
{2010211001|XXGvertex_iport_iport|1243|0|1941|0|{0|in|}698|699|}
{2010214001|XXGiport_src_flow|1244|0|1943|0|{0|}699|33|}
{2010007001|XXGobject_proto_object|1245|0|1944|0|{}698|700|}
{2010211001|XXGvertex_iport_iport|1246|0|1946|0|{0|in|}700|701|}
{2010006001|XXGobject_psameas_object|1247|0|1948|0|{metadata|in_metadata|1|0|}701|700|}
{2010006001|XXGobject_psameas_object|1248|0|1949|0|{Layout|Layout|0|0|}698|354|}
{2010006001|XXGobject_psameas_object|1249|0|1950|0|{in_metadata|out0_metadata|0|0|}698|342|}
{2010601001|XXGgraph_vertex_vertex|1250|0|1951|0|{Unload_Graph_Category|}1|354|}
{2010601001|XXGgraph_vertex_vertex|1251|0|1952|0|{Version_Log|}1|702|}
{2010605001|XXGgraph_legend_legend|1252|0|1954|0|{0|}702|703|}
{2010241001|XXGlegend_face_face|1253|0|1956|0|{}703|704|}
{2010605001|XXGgraph_legend_legend|1254|0|1958|0|{1|}702|705|}
{2010241001|XXGlegend_face_face|1255|0|1960|0|{}705|706|}
{2010605001|XXGgraph_legend_legend|1256|0|1962|0|{2|}702|707|}
{2010241001|XXGlegend_face_face|1257|0|1964|0|{}707|708|}
{2010109001|XXGobject_property_value|1258|0|1966|0|{0|TrackingThumbprint|72|}1|709|}
