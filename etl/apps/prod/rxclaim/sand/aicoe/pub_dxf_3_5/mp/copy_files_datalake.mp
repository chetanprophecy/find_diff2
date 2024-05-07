@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|14|rel_count|15|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|TRANSFER_DATA_ONLY|N|3|9|RFK|@{0|}}
{30001002|XXparameter|SOURCE_CODE|BRIOVARX|3|9|RFK||{0|}}
{30001002|XXparameter|SOURCE_SYSTEM|salesforce.hemophilia_order__c|3|9|RFK||{0|}}
{30001002|XXparameter|FILE_TYPE|//For BP Application only and Passed through Pset level|3|9|RFK|@{0|}}
{30001002|XXparameter|DL_PATH|//Should be set in intermediate pset|3|9|REFK|@{0|}}
{30001002|XXparameter|SOURCE_UPPER|$[ string_upcase(SOURCE_SYSTEM) ]|3|9|RFK||{0|}}
{30001002|XXparameter|SOURCE_SCHEMA_NAME|$[ re_replace(SOURCE_UPPER, "[.].*", "") ]|3|9|RFK||{0|}}
{30001002|XXparameter|SOURCE_ENTITY_NAME|$[string_split(SOURCE_UPPER,".")[1] ]|3|9|RFK||{0|}}
{30001002|XXparameter|RUN_TIMESTAMP|$[ (string(""))(datetime("YYYYMMDDHH24MISS"))now() ]|3|9|RFK||{0|}}
{30001002|XXparameter|DATA_FILE_NAME|$[ AI_SERIAL + "/" + "salesforce_data" + "/" + SOURCE_CODE + "_" + SOURCE_SCHEMA_NAME + "_" + SOURCE_ENTITY_NAME + ".dat.gz" ]|3|9|RFK||{0|}}
{30001002|XXparameter|DL_DATA_FILE|$[DL_PATH + "/" + SOURCE_CODE + "_" + SOURCE_SCHEMA_NAME + "_" + SOURCE_ENTITY_NAME + "_" + string_substring(RUN_TIMESTAMP,1,8) + "T" + string_substring(RUN_TIMESTAMP,9,6) + ".dat.gz"]|3|9|RFK||{0|}}
{30001002|XXparameter|!ab_compatibility|3.5.1.0|3|9|P|@{0|}}
{30001002|XXparameter|CONTROL_FILE_NAME|$[ AI_SERIAL + "/" + "salesforce_ctl" + "/" + SOURCE_CODE + "_" + SOURCE_SCHEMA_NAME + "_" + SOURCE_ENTITY_NAME + ".ctl" ]|3|9|RFK||{0|}}
{30001002|XXparameter|DL_CONTROL_FILE|$[DL_PATH + "/" + SOURCE_CODE + "_" + SOURCE_SCHEMA_NAME + "_" + SOURCE_ENTITY_NAME + "_" + string_substring(RUN_TIMESTAMP,1,8) + "T" + string_substring(RUN_TIMESTAMP,9,6) + ".ctl"]|3|9|RFK||{0|}}
{30001002|XXparameter|META_FILE_NAME|$[ AI_SERIAL + "/" + "salesforce_meta" + "/" + SOURCE_CODE + "_" + SOURCE_SCHEMA_NAME + "_" + SOURCE_ENTITY_NAME + ".meta" ]|3|9|RFK||{0|}}
{30001002|XXparameter|DL_META_FILE|$[DL_PATH + "/" + SOURCE_CODE + "_" + SOURCE_SCHEMA_NAME + "_" + SOURCE_ENTITY_NAME + "_" + string_substring(RUN_TIMESTAMP,1,8) + "T" + string_substring(RUN_TIMESTAMP,9,6) + ".meta"]|3|9|RFK||{0|}}
{30001002|XXparameter|SCP_USER|//Should be set in intermediate pset|3|9|REFK|@{0|}}
{30001002|XXparameter|SCP_HOST|//Should be set in intermediate pset|3|9|REFK||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|copy_files_datalake|Rohan.Goel|@1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|644000|366000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|1|}Job 'copy_files_datalake' Execution Status Report

||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@apsrd02143 - RHEL 7||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|32768|120|1|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Puropose: Transfers files to DL

Transfer Method: SCP

Description: Set parameter \{TRANSFER_DATA_ONLY\} to Y if only one file has to 
transferred otherwise all three files data,meta,ctl will be transferred. 

Note:- File names should include complete path information.|16000|15000|0|0|0|0|19|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|32768|120|1|}}
{2010501005|XXGpvertex|7|0|13|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Run_Program.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|commandline|ksh -c ' if [ "$\{TRANSFER_DATA_ONLY\}" == "Y" ];then
             if [ `echo \| rev \| cut -d"." -f1 \| rev` == "gz" ]; then
                 if [ -f $\{DATA_FILE_NAME\} ] && [ `zcat $\{DATA_FILE_NAME\} \| head \| wc -l` -gt 0 ];then
                   scp $\{DATA_FILE_NAME\} $\{SCP_USER\}\@$\{SCP_HOST\}:$\{DL_DATA_FILE\};
                   if [ $? -gt 0 ];then exit 1; fi;
                   echo $\{DL_DATA_FILE\} >> $\{AI_SERIAL\}/`echo $\{SOURCE_SCHEMA_NAME\} \| tr [A-Z] [a-z]`_files_transfered_`date +%Y%m%d`.dat;
                 else
                   echo "Data file for $\{DATA_FILE_NAME\} 0 byte today. No files copied to DL" >> $\{AI_SERIAL\}/`echo $\{SOURCE_SCHEMA_NAME\} \| tr [A-Z] [a-z]`_files_transfered_`date +%Y%m%d`.dat;
                 fi;
             else 
                 if [ -s $\{DATA_FILE_NAME\} ];then
                   scp $\{DATA_FILE_NAME\} $\{SCP_USER\}\@$\{SCP_HOST\}:$\{DL_DATA_FILE\};
                   if [ $? -gt 0 ];then exit 1; fi;
                   echo $\{DL_DATA_FILE\} >> $\{AI_SERIAL\}/`echo $\{SOURCE_SCHEMA_NAME\} \| tr [A-Z] [a-z]`_files_transfered_`date +%Y%m%d`.dat;
                 else
                   echo "Data file for $\{DATA_FILE_NAME\} 0 byte today. No files copied to DL" >> $\{AI_SERIAL\}/`echo $\{SOURCE_SCHEMA_NAME\} \| tr [A-Z] [a-z]`_files_transfered_`date +%Y%m%d`.dat;
                 fi;
              fi;
         else
             if [ -f $\{DATA_FILE_NAME\} ] && [ `zcat $\{DATA_FILE_NAME\} \| head \| wc -l` -gt 0 ] && [ -s $\{CONTROL_FILE_NAME\} ] && [ -s $\{META_FILE_NAME\} ];then
                   scp $\{DATA_FILE_NAME\} $\{SCP_USER\}\@$\{SCP_HOST\}:$\{DL_DATA_FILE\};
                   if [ $? -gt 0 ];then exit 1; fi;
                   echo $\{DL_DATA_FILE\} >> $\{AI_SERIAL\}/`echo $\{SOURCE_SCHEMA_NAME\} \| tr [A-Z] [a-z]`_files_transfered_`date +%Y%m%d`.dat;
                   scp $\{CONTROL_FILE_NAME\} $\{SCP_USER\}\@$\{SCP_HOST\}:$\{DL_CONTROL_FILE\};
                   if [ $? -gt 0 ];then exit 1; fi;
                   echo $\{DL_CONTROL_FILE\} >> $\{AI_SERIAL\}/`echo $\{SOURCE_SCHEMA_NAME\} \| tr [A-Z] [a-z]`_files_transfered_`date +%Y%m%d`.dat;
                   scp $\{META_FILE_NAME\} $\{SCP_USER\}\@$\{SCP_HOST\}:$\{DL_META_FILE\};
                   if [ $? -gt 0 ];then exit 1; fi;
                   echo $\{DL_META_FILE\} >> $\{AI_SERIAL\}/`echo $\{SOURCE_SCHEMA_NAME\} \| tr [A-Z] [a-z]`_files_transfered_`date +%Y%m%d`.dat;
               
             else echo "Data file for $\{DATA_FILE_NAME\} 0 byte today. No files copied to DL" >> $\{AI_SERIAL\}/`echo $\{SOURCE_SCHEMA_NAME\} \| tr [A-Z] [a-z]`_files_transfered_`date +%Y%m%d`.dat;
             fi
         fi'|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
}}@0|Run Program|212000|244500|0|0|0|0|20|Copy files to DL|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|8|0|15|0|{@{}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|9|0|17|0|{@{}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|10|0|19|0|{Executes a standard UNIX or Windows program.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|filter|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|commandline||16|2|RFO$|Command line of UNIX or Windows program to execute|{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Run Program|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|11|0|21|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|12|0|24|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010110002|XXGconstant|13|0|27|0|{@{}@{1|9972096|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010601001|XXGgraph_vertex_vertex|6|0|12|0|{Copy_files_to_DL|}1|7|}
{2010212001|XXGvertex_oport_oport|7|0|14|0|{0|out|}7|8|}
{2010211001|XXGvertex_iport_iport|8|0|16|0|{0|in|}7|9|}
{2010007001|XXGobject_proto_object|9|0|18|0|{}7|10|}
{2010212001|XXGvertex_oport_oport|10|0|20|0|{0|out|}10|11|}
{2010006001|XXGobject_psameas_object|11|0|22|0|{metadata|out_metadata|1|0|}11|10|}
{2010211001|XXGvertex_iport_iport|12|0|23|0|{0|in|}10|12|}
{2010006001|XXGobject_psameas_object|13|0|25|0|{metadata|in_metadata|1|0|}12|10|}
{2010109001|XXGobject_property_value|14|0|26|0|{0|TrackingThumbprint|72|}1|13|}
