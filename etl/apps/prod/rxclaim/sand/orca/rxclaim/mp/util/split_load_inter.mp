@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|4|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|139|rel_count|241|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";|8|1|FKl|Provides functions and types to use in PDL.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|___Runtime_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|REFK|The numeric ID that identifies this run uniquely.  Defaults to 0, but should be set the same for all tables loaded in a single job by the invoking plan.|{0|}}
{30001002|XXparameter|___Intermediate_PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|TARGET_SYSTEM|ids_rxclaim.f_mpd_claim_transaction|3|9|RFK|@{0|}}
{30001002|XXparameter|TARGET_SYSTEM_LOWER|$[string_downcase(TARGET_SYSTEM)]|3|9|REK|@{0|}}
{30001002|XXparameter|ILM_NAME|ctrx_f_mpd_claim_transaction|3|9|RFK|@{0|}}
{30001002|XXparameter|SPLIT_FILE_NAME|AB_PARAMETER_ENV|3|10|RKd|Split File - Outcome of Keying process |{0|}}
{30001002|XXparameter|SPLIT_FILE_NAME:eme|$[
AI_MFS + "/split/interim." + ILM_NAME + "." + TARGET_SYSTEM_LOWER + "." + "\{RUN_ID\}" + ".dat.gz"
]|3|9||@{0|}}
{30001002|XXparameter|SPLIT_FILE_NAME:sandbox|$[
AI_MFS + "/split/interim." + ILM_NAME + "." + TARGET_SYSTEM_LOWER + "." + RUN_ID + ".dat.gz"
]|3|9||@{0|}}
{30001002|XXparameter|SPLIT_DML_FILE|$[
AI_DML + "/split." + string_split(TARGET_SYSTEM_LOWER, ".")[0] + "/split." + TARGET_SYSTEM_LOWER + ".dml"
]|3|9|RK|@{0|}}
{30001002|XXparameter|FINAL_SPLIT_FILE|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|FINAL_SPLIT_FILE:eme|$[
AI_MFS + "/split/split." + "\{ILM\}"+ "." + TARGET_SYSTEM_LOWER + "." + "\{RUN_ID\}" + ".dat.gz"
]|3|9||@{0|}}
{30001002|XXparameter|FINAL_SPLIT_FILE:sandbox|$[
AI_MFS + "/split/split." + ILM_NAME + "." + TARGET_SYSTEM_LOWER + "." + RUN_ID + ".dat.gz"
]|3|9||@{0|}}
{30001002|XXparameter|FILTER_EXPR|medicareprty.src_env_sk==630|3|9|FK|@{0|}}
{30001002|XXparameter|___DML_and_Record_Type_and_KEY_Parameters___|@3|9|K|@{0|}}
{30001002|XXparameter|SPLIT_DML|$[read_file(SPLIT_DML_FILE)]|3|9|RK|The record format of the shred.|{0|}}
{30001002|XXparameter|HASH_RECORD|include "~$PUB_DXF_DML/generic_data_types.dml";
metadata type = hash_key_combine_type;|7|9|K|Value will come from generic_data_types.dml file defined in PUB_DXF_DML location|{0|}}
{30001002|XXparameter|SOURCE_NATURAL_KEY|$[get_ids_table_nk(TARGET_SYSTEM_LOWER)]|3|9|FK|\{field_1; ...; field_n\}: The natural key for the target table, without any effective date fields.|{0|}}
{30001002|XXparameter|ICFF_IDS|ids_rxclaim.f_claim_transaction.reduced|3|9|FK|@{0|}}
{30001002|XXparameter|NATURAL_KEY|$[get_ids_table_nk(ICFF_IDS)]|3|9|FK|\{field_1; ...; field_n\}: The natural key for the target table, without any effective date fields.|{0|}}
{30001002|XXparameter|ICFF_IDS_DML_FILE|$[PUB_DATAHUB_DML + "/" + string_split(ICFF_IDS,".")[0] + "/" +  ICFF_IDS + ".dml" ]|3|9|K|@{0|}}
{30001002|XXparameter|ICFF_IDS_DML|$[read_type(PUB_DATAHUB_DML + "/" + string_split(ICFF_IDS,".")[0] + "/" + ICFF_IDS + ".dml") ]|3|9|K|@{0|}}
{30001002|XXparameter|ICFF_KEY|dxf_hk_part1|3|9|K|A common fixed ( Hardcoded)  ICFF key used across ORCA . |{0|}}
{30001002|XXparameter|DO_TWO_STEP_LOOKUP|$[if(file_information(PUB_DXF_META + "/two_step_lookup_list.dat").found)  ICFF_IDS member string_split(string_filter_out(read_file(PUB_DXF_META + "/two_step_lookup_list.dat"),"\\r"),"\\n") else 0 ]|1|9|K|This list provide two step lookup flag|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|7\|\{53\|error_suppression\|2\|\{56\|Write_ICFFs.Audit_ICFF\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Write_ICFFs.Write_Audit_ICFF.out to Write_ICFFs.Audit_ICFF.write:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Write_ICFFs.Audit_Index\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Write_ICFFs.Write_Audit_ICFF.index to Write_ICFFs.Audit_Index.write:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Write_ICFFs.Main_ICFF\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Write_ICFFs.Write_Main_ICFF.out to Write_ICFFs.Main_ICFF.write:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Write_ICFFs.Main_Index\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Write_ICFFs.Write_Main_ICFF.index to Write_ICFFs.Main_Index.write:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Write_ICFFs.Write_Audit_ICFF\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Determine_Actions.audit to Write_ICFFs.audit:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Write_ICFFs.Write_Main_ICFF\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Determine_Actions.icff to Write_ICFFs.icff:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Write_Event_Log.Event_Log_Entry\|\}\{53\|status_info\|4\|\{56\|DA_fixed_param_error\|\}\{56\|CTL10086\|\}\{51\|1\|DA_parameter\|\{56\|transform\|\}\}\{\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|4|1|1|Hnl|@{0|}}
{30001002|XXparameter|ICFF_FILE|$[begin
        let int v_len=length_of(string_split(ICFF_IDS,"."));
        let string("") v_ids_name=if (v_len > 2 ) string_concat(string_split(ICFF_IDS,".")[1], "." , string_split(ICFF_IDS,".")[2])   else string_split(ICFF_IDS,".")[1];
        result :: PUB_DATAHUB_MFS_LOOKUP + "/ids/" + string_split(ICFF_IDS,".")[0] + "/one/"+ v_ids_name + ".dat.gz" ;
end  ]|3|9|K|ICFFLookup File |{0|}}
{30001002|XXparameter|ICFF_IDX_FILE|$[begin
        let int v_len=length_of(string_split(ICFF_IDS,"."));
        let string("") v_ids_name=if (v_len > 2 ) string_concat(string_split(ICFF_IDS,".")[1], "." , string_split(ICFF_IDS,".")[2])   else string_split(ICFF_IDS,".")[1];
        result :: PUB_DATAHUB_MFS_LOOKUP + "/ids/" + string_split(ICFF_IDS,".")[0] + "/one/"+ v_ids_name + ".idx" ;
end  ]|3|9|K|ICFF lookup index file|{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|1190000|518000|0|split_load_inter|Mukesh Singh|Created 6/1/2011 9:09:11 AM|1|10|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1493000|657000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{2|1|1|}Job 'load.icff' Execution Status Report


Job "load.icff" Execution started at Thursday, November 08, 2018 06:42:09
Job completed successfully at Thursday, November 08, 2018 06:42:45

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:00:35
Run performed by user bmolgi1
Total data moved through all flows: 0 records (0 bytes)
Total CPU time (all processes): 13 seconds
Average CPU utilization across all nodes: 0.00 percent
||#! /bin/ksh -e

#Check ids subject are dir
if [[ ! -d $\{IDS_DATA_PATH\} ]];then
        echo "Creating directory $\{IDS_DATA_PATH\}"
        m_mkdir -p -m 2775 $\{IDS_DATA_PATH\}
fi

#Check XREF DIR
XREF_DIR=`dirname $\{XREF_KEY_ICFF_FILE\}`
if [[ ! -d $\{XREF_DIR\} ]];then
        echo "Creating directory $\{XREF_DIR\}"
        m_mkdir -p -m 2775 $\{XREF_DIR\}
fi

#Check REJECT DIR
if [[ ! -d $\{AI_MFS_REJECT\}/load.$\{SUBJECT_AREA\} ]];then
        echo "Creating directory $\{AI_MFS_REJECT\}/load.$\{SUBJECT_AREA\}"
        m_mkdir -p -m 2775 $\{AI_MFS_REJECT\}/load.$\{SUBJECT_AREA\}
fi

#Check MAX_SK DIR
if [[ ! -d $\{PUB_DATAHUB_SERIAL_LOOKUP\}/ids/$\{SUBJECT_AREA\}/max_sk ]];then
        echo "Creating directory $\{PUB_DATAHUB_SERIAL_LOOKUP\}/ids/$\{SUBJECT_AREA\}/max_sk"
        m_mkdir -p -m 2775 $\{PUB_DATAHUB_SERIAL_LOOKUP\}/ids/$\{SUBJECT_AREA\}/max_sk
fi

#Check AI_SERIAL_LOG IDS Subject Area DIR
if [[ ! -d $\{AI_SERIAL_LOG\}/load.$\{SUBJECT_AREA\} ]];then
        echo "Creating directory $\{AI_SERIAL_LOG\}/load.$\{SUBJECT_AREA\}"
        m_mkdir -p -m 2775 $\{AI_SERIAL_LOG\}/load.$\{SUBJECT_AREA\}
fi

if [[ ! -f "$ICFF_FILE" ]] ; then
  m_touch "mfile:$ICFF_FILE"
fi

if [[ ! -f "$ICFF_INDEX_FILE" ]] ; then
  m_touch "mfile:$ICFF_INDEX_FILE"
fi

if  [[ ! -f "$XREF_KEY_ICFF_FILE" && $IS_WRITE_MFS_XREF_ICFF == "Y" ]] ; then
  m_touch "$XREF_KEY_ICFF_FILE"
fi

if  [[ ! -f "$XREF_KEY_INDEX_FILE" && $IS_WRITE_MFS_XREF_ICFF == "Y" ]] ; then
  m_touch "$XREF_KEY_INDEX_FILE"
fi

##Check processed directory exist : AI_MFS/placeholder/processed 
if [ ! -d "$AI_MFS/placeholder/processed" ]; then
  m_mkdir -m 2775 "$AI_MFS/placeholder/processed"
fi

##Check processed directory exist : AI_MFS/split/processed 
if [ ! -d "$AI_MFS/split/processed" ]; then
  m_mkdir -m 2775 "$AI_MFS/split/processed"
fi

if  [[ ! -f "$EVENT_LOG_FILE" ]] ; then
  m_touch "$EVENT_LOG_FILE"
fi

COUNT_DIR=`dirname $COUNT_LOG_FL`
if [[ ! -d $COUNT_DIR ]];then
        m_mkdir -m 2775 -p $COUNT_DIR
fi

export AB_REPORT="summary=$AI_SERIAL_LOG/load.$SUBJECT_AREA/load.$TARGET_LOWER.summary.log $AB_REPORT"
|#! /bin/ksh -e

#Move processed files to /processed directory
if [ $mpjret -eq 0 ]
then
        for i in $( echo $INPUT_FILE_STRING \| tr "\|" " " ); do  
                m_mv "$AI_MFS/$INPUT_FILE_DRIVING_MASK/$i" "$AI_MFS/$INPUT_FILE_DRIVING_MASK/processed/$i" 
        done; 
else
        echo "Graph Failed"
fi


if [[ ( x"$AB_APPCONF_EXECUTION" = x"true" \|\| x"$AB_APPCONF_EXECUTION" = x"True" ) && -f "$AI_RAW_TRACKING_FILE" ]]; then
  AB_REPORT="monitor,flows totals" m_report_tracking -phase-end "$AI_RAW_TRACKING_FILE" \| egrep 'Update_Target.Flow_2\| dup\| reject\| second' 1>&2
fi


if [ $DATASET_IDENTIFIER == "many" ]
then
        if [ x"$IDS_DATA_PATH" == "x" ]
        then
          echo " IDS Data path is not resolved in parameter :IDS_DATA_PATH"
       else 
          cd $IDS_DATA_PATH
           #echo " Inside $IDS_DATA_PATH "
           #check_updated_file_count=`find ./ -type f -name "$\{TARGET_ENTITY\}.*" ! -perm 664 \| wc -l`
           #echo updated file count : $check_updated_file_count
           #     if [ $check_updated_file_count -gt 100 ]
           #     then
           #             m_chmod  664 $\{TARGET_ENTITY\}.*
                        # do not m_chmod if no file is present 
            #    elif [ $check_updated_file_count -gt 0 ]
            #    then
            #            echo " running individul file permission commands for $i"
                        find ./ -type f -name "$\{TARGET_ENTITY\}.*" ! -perm 664 \| xargs -I \{\} m_chmod 664 \{\}
             #   else 
             #          echo " No FACT file is updated today "
             #   fi
              
       fi 
fi

if [[ ( $mpjret -eq 0 ) && ( "$IS_WRITE_MFS_XREF_ICFF" != "Y") &&  ( x"$XREF_KEY_ICFF_FILE" != "x" ) && ( x"$XREF_KEY_INDEX_TEMP_FILE " != "x" ) ]]
then
        echo " Renaming Non  ICFF temp xref's to main xref's "
        m_mv $XREF_NON_ICFF_LOOKUP_TEMP_FILE $XREF_NON_ICFF_LOOKUP_FILE
        m_mv $XREF_NON_ICFF_INDEX_TEMP_FILE $XREF_NON_ICFF_INDEX_FILE  
fi

if [[ ( $mpjret -eq 0 ) && ( "$SUBJECT_AREA" == "ids_common" ) ]]
then
        echo " End of Script Process : Re-creating ctl file "
        rm -f $IDS_DATA_PATH/$TARGET_ENTITY.dat.gz
        m_touch $IDS_DATA_PATH/$TARGET_ENTITY.dat.gz
        rm -f $IDS_DATA_PATH/$TARGET_ENTITY.idx
        m_touch $IDS_DATA_PATH/$TARGET_ENTITY.idx
        rm -f $XREF_KEY_ICFF_FILE
        m_touch $XREF_KEY_ICFF_FILE
        rm -f $XREF_KEY_INDEX_FILE
        m_touch $XREF_KEY_INDEX_FILE
        rm -f $REDUCED_ICFF_FILE
        m_touch $REDUCED_ICFF_FILE
        rm -f $REDUCED_INDEX_FILE
        m_touch $REDUCED_INDEX_FILE
        
        chmod 776 $IDS_DATA_PATH/.$TARGET_ENTITY.dat.gz.mfctl

        chmod 776 $IDS_DATA_PATH/.$TARGET_ENTITY.idx.mfctl

        if [[ $IS_WRITE_MFS_XREF_ICFF == "Y" ]]; then
                chmod 776 $PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/xref/.xref.$TARGET_ENTITY.dat.gz.mfctl
        else
                chmod 776 $PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/xref/.xref.$TARGET_ENTITY.dat.mfctl
        fi

        chmod 776 $PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/xref/.xref.$TARGET_ENTITY.idx.mfctl

        if [[ $IS_WRITE_REDUCED_DATASET == "True" ]]; then
                chmod 776 $PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/one/.$TARGET_ENTITY.reduced.dat.gz.mfctl
                chmod 776 $PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/one/.$TARGET_ENTITY.reduced.idx.mfctl
        fi
fi

#The below code is handled only for d_pharmacy_network where aiorcbp is trying to create placeholder records and the dataset is owned by aiorcrxc. This is temporary and will be removed once co-op is upgraded to 3.3.3
if [[ ( $mpjret -eq 0 ) && ( "$TARGET_NAME" == "ids_rxclaim.d_pharmacy_network" ) ]] 
then
        echo " End of Script Process : Re-creating ctl file "
        rm -f $IDS_DATA_PATH/$TARGET_ENTITY.dat.gz
        m_touch $IDS_DATA_PATH/$TARGET_ENTITY.dat.gz
        rm -f $IDS_DATA_PATH/$TARGET_ENTITY.idx
        m_touch $IDS_DATA_PATH/$TARGET_ENTITY.idx
        rm -f $XREF_KEY_ICFF_FILE
        m_touch $XREF_KEY_ICFF_FILE
        rm -f $XREF_KEY_INDEX_FILE
        m_touch $XREF_KEY_INDEX_FILE
       
        chmod 776 $IDS_DATA_PATH/.$TARGET_ENTITY.dat.gz.mfctl

        chmod 776 $IDS_DATA_PATH/.$TARGET_ENTITY.idx.mfctl

        if [[ $IS_WRITE_MFS_XREF_ICFF == "Y" ]]; then
                chmod 776 $PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/xref/.xref.$TARGET_ENTITY.dat.gz.mfctl
        else
                chmod 776 $PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/xref/.xref.$TARGET_ENTITY.dat.mfctl
        fi

        chmod 776 $PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/xref/.xref.$TARGET_ENTITY.idx.mfctl

        if [[ $IS_WRITE_REDUCED_DATASET == "True" ]]; then
                rm -f $REDUCED_ICFF_FILE
                m_touch $REDUCED_ICFF_FILE
                rm -f $REDUCED_INDEX_FILE
                m_touch $REDUCED_INDEX_FILE
                chmod 776 $PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/one/.$TARGET_ENTITY.reduced.dat.gz.mfctl
                chmod 776 $PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/one/.$TARGET_ENTITY.reduced.idx.mfctl
        fi
fi

#Rename temp xrefs to main xrefs
#This make sure that xref's are unavailable for keying for a very minimal amount of time 
|@CLAIM_DW_SBOXSt|33206783|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Trebuchet MS|128|120|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Read Split File and Lookup 
with F_claim_reduced|363000|84000|0|0|0|0|14662|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial Rounded MT Bold|32768|360|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!is_dynamic|true|3|9|P|@{0|}}
}}@Target Name: $TARGET_NAME  |505000|270000|0|0|0|0|14643|}}
{2010242002|XXGface|8|0|15|0|{@{}@Trebuchet MS|128|120|0|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}14731|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}14729|529|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}14728|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}14734|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}14735|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}14732|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}14716|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}14715|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}14703|17|}}
{2010501005|XXGpvertex|18|0|35|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|$FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|272000|440000|0|0|0|0|14733|Filter-Non Matched Records|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|19|0|37|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|20|0|40|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|21|0|43|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|22|0|45|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|23|0|47|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|24|0|49|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|25|0|52|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|26|0|54|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|27|0|57|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|28|0|60|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|29|0|63|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|30|0|66|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|31|0|69|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|32|0|72|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|$SPLIT_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$FINAL_SPLIT_FILE|3|2|$|@{0|}}
}}@0|@90000|470000|0|0|0|0|14723|Read Split File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|33|0|74|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|34|0|77|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|35|0|79|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|36|0|86|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$FINAL_SPLIT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$SPLIT_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
}}@1|@1405000|580000|0|0|0|0|14704|Final Split File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|37|0|88|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|38|0|91|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
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
{2010202004|XXGiport|39|0|93|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|40|0|96|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Gather|1293000|590000|0|0|0|0|14700|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|41|0|98|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|42|0|101|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|43|0|106|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|44|0|108|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|45|0|111|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|46|0|115|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "' + PUB_DXF_DML + '/generic_data_types.dml" ;
include "' + PUB_DXF_XFR + '/common_functions.xfr";


type lookup_record_type = ' + TARGET_NK_DML + ';' +

' let hash_key_type v_hash_key_full= [vector 0 ,0 ];
let int v_flag=0;
let decimal("") v_dxf_src_env_rank_lookup_record=0;
let int v_true_update_flag=0;

let  unsigned integer(8) v_hash_key_half=0;
let lookup_identifier_type current_lookup = lookup_not_loaded();
let lookup_record_type lookup_record_value = allocate_with_nulls();
let lookup_record_type exact_record_value=allocate_with_defaults();
let lookup_record_type exact_next_record_value=allocate_with_nulls();
let  hash_key_type v_record_hash_from_in=allocate_with_defaults();
let hash_key_type  v_record_hash_from_lkp=allocate_with_defaults(); 

//These parameters are only added to get count of values.
/*Reformat operation*/

//let decimal ("") insert_record_count=0;
//let decimal("") update_record_count=0;
//let decimal("") same_record_count=0;
//let decimal("") total_record_count=0;
//let decimal("") suppressed_update_record_count=0;

 // if (current_lookup == lookup_not_loaded()) 
       // current_lookup = lookup_load(this_partition_path("' + ICFF_FILE + '"),this_partition_path("' + ICFF_INDEX_FILE + '),"ICFF_TEMPLATE" );

//let lookup_record_type lookup_record_value;
out::reformat(in) =
begin
 let integer(2) match_count=0;
 exact_record_value=allocate_with_defaults();
 if (current_lookup == lookup_not_loaded()) 
     current_lookup = lookup_load(this_partition_path("' + ICFF_FILE + '"),this_partition_path("'+ICFF_INDEX_FILE+'"),"ICFF_TEMPLATE_IDS" );  
 lookup_record_value = first_defined(lookup_last(current_lookup, "ICFF_TEMPLATE_IDS", in.dxf_hk_part1),allocate_with_defaults() );
 exact_record_value=allocate_with_defaults();
 exact_record_value = if (lookup_record_value.dxf_hk_part1 ==0 ) lookup_record_value               // No Match found on half hash key , So this is insert record.
                      else if  ( in.dxf_hk_part2 == lookup_record_value.dxf_hk_part2 ) lookup_record_value  //A match is found on dxf part1 as well as dxf part2 keys , this is an exact match in first iteration itself 
                      else                                                                        //A Match is found on half hash key but not on full hash key, find exact match inside iteration  .
                      begin
                        match_count=lookup_count(current_lookup, "ICFF_TEMPLATE_IDS", in.dxf_hk_part1);
                          begin block exact_record_match
                             for (let int k, k < match_count)
                               begin 
                                exact_next_record_value = if( k == 0 ) lookup_last(current_lookup, "ICFF_TEMPLATE_IDS", in.dxf_hk_part1) else lookup_previous(current_lookup,"ICFF_TEMPLATE_IDS");
                                 if ( in.dxf_hk_part2 == exact_next_record_value.dxf_hk_part2 ) 
                                  begin
                                        exact_record_value = exact_next_record_value;
                                        exit  exact_record_match;
                                  end
                                                                                                 
                             end
                          end block exact_record_match
                       result :: exact_record_value ;
                       end ; 
                                                                      
                                                                    
                                                                         
/* Match Cases 

1. Hash_key_half found a match in IDS ICFF  :
        a.It also found a found a match with full hash key 
             1. Go ahead and compare column hash for CDC to find update .
             
        b.Hash key half has a match but there is no mtach for hash_key (full)
            1. It become insert .
2.dxf_hk_part1 has no match in IDS ICFF 
      a.This become an insert record .
*/                                                                       
         
                                                                 
//Till Above , the code to find exact record is over .
//Do CDC based on full hash key ( 128 bit) murmur hash algorithm .
    
        v_record_hash_from_in= get_hash(in,"'+FIELDS_TO_COMPARE_HASH_EXPR+'" ); 
        v_record_hash_from_lkp= get_hash(exact_record_value,"'+FIELDS_TO_COMPARE_HASH_EXPR+'" ); 
        
//Asign Flags to identify change records 
        v_flag =      if (exact_record_value.dxf_hk_part1 == 0 or exact_record_value.dxf_hk_part2 ==0  ) 1  // Insert 
                     else if ( v_record_hash_from_in == v_record_hash_from_lkp ) 0  //Same  
                     else if( v_record_hash_from_in != v_record_hash_from_lkp )  2  //update
                     else 99;|3|3|c|@{0|}}
{30001002|XXparameter|out0_metadata|$SPLIT_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata|$\{INTER_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|=|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|969250|307500|0|0|0|0|14730|RFMT:lookUp IDS & CDC|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|47|0|117|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|48|0|120|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|49|0|122|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|50|0|124|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|51|0|126|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|52|0|129|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|53|0|131|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|54|0|135|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|55|0|138|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|56|0|141|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|57|0|144|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|58|0|150|0|{Subgraph created from graph "load.type1.icff"|{}@0|@285000|249750|0|0|0|0|14718|LookUps|Mukesh Singh|Created 4/5/2016 5:28:10 PM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|463000|207000|3|}}
{2010240003|XXGlegend|59|0|152|0|{@{}@Disabled input file 
to view ICFF lookup data|294000|119500|0|0|0|0|10281|}}
{2010242002|XXGface|60|0|154|0|{@{}@Arial|12632256|90|0|}}
{2010240003|XXGlegend|61|0|156|0|{@{}@This will be IDS ICFF Data file if Dataset is DIM
Will be Xref ICFF Data file if Dataset is FACT|17000|122000|0|0|0|0|10286|}}
{2010242002|XXGface|62|0|158|0|{@{}@Arial Narrow|32768|100|0|}}
{2010503005|XXGfvertex|63|0|160|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|$[if(DATASET_IDENTIFIER == "many" or USE_XREF_FOR_CDC) XREF_KEY_FILE_DML else TARGET_NK_DML ]|3|9||@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|keep_on_disk|True|3|1|l|@{0|}}
{30001002|XXparameter|cache|True|3|1|l|@{0|}}
}}@0|@76000|58000|0|0|0|0|10303|ICFF_TEMPLATE_IDS|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|64|0|162|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x1200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|Layout|file:/~null|28|9|RF||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|block_compressed.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010503005|XXGfvertex|65|0|164|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{ICFF_FILE\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$\{ICFF_FILE\}|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$[if(DATASET_IDENTIFIER == "many") XREF_KEY_FILE_DML else TARGET_DML ]|3|9||@{0|}}
}}@0|@299000|65000|0|0|0|0|10304|ICFF lookup FILE for IDS|Ab Initio Software|@1|400|-1||6||33089|-1|-1|}}
{2010203004|XXGoport|66|0|166|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|67|0|168|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
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
{30001002|XXparameter|read_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1455153111|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|68|0|170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|69|0|173|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@741000|316000|0|0|481000|303000|14724|PBKS:\{ICFF_KEY\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|70|0|175|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|71|0|177|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|72|0|179|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|73|0|182|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|74|0|184|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$SPLIT_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";

out :: reformat(in) =
begin

   let hash_key_combine_type dxf_hk =  reinterpret(get_hash(in, $"SOURCE_NATURAL_KEY"));
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[ !( NATURAL_KEY == SOURCE_NATURAL_KEY) ]|3|9||@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|528000|305000|0|0|0|0|14736|RFMT: Get Hash and src_env_rank|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|75|0|186|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|76|0|189|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|77|0|191|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|78|0|193|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|79|0|195|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|80|0|198|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|81|0|200|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|82|0|204|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|83|0|207|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|84|0|210|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|85|0|213|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|86|0|220|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|87|0|222|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|88|0|224|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|89|0|229|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|90|0|233|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|91|0|237|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Key||19|2|RFs$|Field to partition on|{0|}}
{30001002|XXparameter|InputLayout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Max_core|100663296|1|2|F$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|OutputLayout|@9|2|RFs$||{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|92|0|239|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|93|0|241|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|94|0|243|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|95|0|246|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|96|0|248|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|9|RF||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to partition on|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|97|0|250|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|98|0|253|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|99|0|258|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|100|0|260|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|101|0|262|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|102|0|265|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|9|RF||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core||1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|103|0|267|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|104|0|270|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|105|0|276|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|106|0|279|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|107|0|287|0|{Subgraph created from graph "LookUp and CDC on HASH Keys"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ DO_TWO_STEP_LOOKUP == 1  and not USE_XREF_FOR_CDC and not TRUNCATE_AND_LOAD and DATASET_IDENTIFIER != "many" ]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@1215500|305000|0|0|0|0|14717|Two Step Lookup|Mukesh Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|765000|298000|3|}}
{2010210004|XXGflow|108|0|289|0|{@{}@384|.5|.5|{0|}12694|17|}}
{2010501005|XXGpvertex|109|0|291|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|flag == 1|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|40000|110000|0|0|0|0|12693|FBE-Only Pass Insert|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|110|0|293|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|111|0|296|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|112|0|298|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|113|0|300|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|114|0|302|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|115|0|304|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|116|0|306|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|117|0|308|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|118|0|311|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|119|0|314|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|120|0|317|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|121|0|320|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|122|0|323|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|123|0|331|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|transform0|$\{ARCHIVE_CDC_XFR\}|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|275000|35000|0|0|0|0|12696|RFMT: CDC With Archive IDS|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|124|0|333|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|125|0|335|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|126|0|337|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|127|0|339|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|128|0|341|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|129|0|344|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|130|0|346|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|131|0|350|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|132|0|353|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|133|0|356|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|134|0|359|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|135|0|366|0|{@{}@0|0|0|0|out0|.7725490196078432|@@@13328|0|}}
{2010203004|XXGoport|136|0|370|0|{@{}@0|0|0|0|out1|.4597315436241611|@@@14352|0|}}
{2010202004|XXGiport|137|0|374|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010110002|XXGconstant|138|0|378|0|{@{}@{1|9592733|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010605001|XXGgraph_legend_legend|6|0|12|0|{1|}1|7|}
{2010241001|XXGlegend_face_face|7|0|14|0|{}7|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_1|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_11|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_2|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_3|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_4|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_5|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_6|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_7|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_8|}1|17|}
{2010601001|XXGgraph_vertex_vertex|17|0|34|0|{Filter_Non_Matched_Records|}1|18|}
{2010212001|XXGvertex_oport_oport|18|0|36|0|{0|out|}18|19|}
{2010213001|XXGoport_dst_flow|19|0|38|0|{0|}19|12|}
{2010212001|XXGvertex_oport_oport|20|0|39|0|{1|deselect|}18|20|}
{2010213001|XXGoport_dst_flow|21|0|41|0|{0|}20|14|}
{2010212001|XXGvertex_oport_oport|22|0|42|0|{2|reject|}18|21|}
{2010212001|XXGvertex_oport_oport|23|0|44|0|{3|error|}18|22|}
{2010212001|XXGvertex_oport_oport|24|0|46|0|{4|log|}18|23|}
{2010211001|XXGvertex_iport_iport|25|0|48|0|{0|in|}18|24|}
{2010214001|XXGiport_src_flow|26|0|50|0|{0|}24|9|}
{2010007001|XXGobject_proto_object|27|0|51|0|{}18|25|}
{2010212001|XXGvertex_oport_oport|28|0|53|0|{0|out|}25|26|}
{2010006001|XXGobject_psameas_object|29|0|55|0|{metadata|out_metadata|1|0|}26|25|}
{2010212001|XXGvertex_oport_oport|30|0|56|0|{1|deselect|}25|27|}
{2010006001|XXGobject_psameas_object|31|0|58|0|{metadata|deselect_metadata|1|0|}27|25|}
{2010212001|XXGvertex_oport_oport|32|0|59|0|{2|reject|}25|28|}
{2010006001|XXGobject_psameas_object|33|0|61|0|{metadata|reject_metadata|1|0|}28|25|}
{2010212001|XXGvertex_oport_oport|34|0|62|0|{3|error|}25|29|}
{2010006001|XXGobject_psameas_object|35|0|64|0|{metadata|error_metadata|1|0|}29|25|}
{2010212001|XXGvertex_oport_oport|36|0|65|0|{4|log|}25|30|}
{2010006001|XXGobject_psameas_object|37|0|67|0|{metadata|log_metadata|1|0|}30|25|}
{2010211001|XXGvertex_iport_iport|38|0|68|0|{0|in|}25|31|}
{2010006001|XXGobject_psameas_object|39|0|70|0|{metadata|in_metadata|1|0|}31|25|}
{2010006001|XXGobject_psameas_object|40|0|71|0|{Layout|Layout|0|0|}18|32|}
{2010212001|XXGvertex_oport_oport|41|0|73|0|{0|read|}32|33|}
{2010213001|XXGoport_dst_flow|42|0|75|0|{0|}33|9|}
{2010007001|XXGobject_proto_object|43|0|76|0|{}32|34|}
{2010212001|XXGvertex_oport_oport|44|0|78|0|{0|read|}34|35|}
{2010006001|XXGobject_psameas_object|45|0|80|0|{metadata|read_metadata|1|0|}35|34|}
{2010006001|XXGobject_psameas_object|46|0|81|0|{deselect_metadata|read_metadata|0|0|}18|32|}
{2010006001|XXGobject_psameas_object|47|0|82|0|{in_metadata|read_metadata|0|0|}18|32|}
{2010006001|XXGobject_psameas_object|48|0|83|0|{out_metadata|read_metadata|0|0|}18|32|}
{2010006001|XXGobject_psameas_object|49|0|84|0|{reject_metadata|read_metadata|0|0|}18|32|}
{2010601001|XXGgraph_vertex_vertex|50|0|85|0|{Final_Split_File|}1|36|}
{2010211001|XXGvertex_iport_iport|51|0|87|0|{0|write|}36|37|}
{2010214001|XXGiport_src_flow|52|0|89|0|{0|}37|17|}
{2010007001|XXGobject_proto_object|53|0|90|0|{}36|38|}
{2010211001|XXGvertex_iport_iport|54|0|92|0|{0|write|}38|39|}
{2010006001|XXGobject_psameas_object|55|0|94|0|{metadata|write_metadata|1|0|}39|38|}
{2010601001|XXGgraph_vertex_vertex|56|0|95|0|{Gather|}1|40|}
{2010212001|XXGvertex_oport_oport|57|0|97|0|{0|out|}40|41|}
{2010213001|XXGoport_dst_flow|58|0|99|0|{0|}41|17|}
{2010211001|XXGvertex_iport_iport|59|0|100|0|{0|in|}40|42|}
{2010214001|XXGiport_src_flow|60|0|102|0|{0|}42|15|}
{2010214001|XXGiport_src_flow|61|0|103|0|{1|}42|16|}
{2010214001|XXGiport_src_flow|62|0|104|0|{2|}42|14|}
{2010007001|XXGobject_proto_object|63|0|105|0|{}40|43|}
{2010212001|XXGvertex_oport_oport|64|0|107|0|{0|out|}43|44|}
{2010006001|XXGobject_psameas_object|65|0|109|0|{metadata|out_metadata|1|0|}44|43|}
{2010211001|XXGvertex_iport_iport|66|0|110|0|{0|in|}43|45|}
{2010006001|XXGobject_psameas_object|67|0|112|0|{metadata|in_metadata|1|0|}45|43|}
{2010006001|XXGobject_psameas_object|68|0|113|0|{Layout|Layout|0|0|}40|36|}
{2010006001|XXGobject_psameas_object|69|0|114|0|{in_metadata|out0_metadata|0|0|}40|46|}
{2010212001|XXGvertex_oport_oport|70|0|116|0|{0|out0|}46|47|}
{2010213001|XXGoport_dst_flow|71|0|118|0|{0|}47|10|}
{2010212001|XXGvertex_oport_oport|72|0|119|0|{1|reject0|}46|48|}
{2010212001|XXGvertex_oport_oport|73|0|121|0|{2|error0|}46|49|}
{2010212001|XXGvertex_oport_oport|74|0|123|0|{3|log|}46|50|}
{2010211001|XXGvertex_iport_iport|75|0|125|0|{0|in|}46|51|}
{2010214001|XXGiport_src_flow|76|0|127|0|{0|}51|11|}
{2010007001|XXGobject_proto_object|77|0|128|0|{}46|52|}
{2010212001|XXGvertex_oport_oport|78|0|130|0|{0|out0|}52|53|}
{2010006001|XXGobject_psameas_object|79|0|132|0|{metadata|out0_metadata|1|0|}53|52|}
{2010006001|XXGobject_psameas_object|80|0|133|0|{transform0|transform0|1|0|}53|52|}
{2010212001|XXGvertex_oport_oport|81|0|134|0|{1|reject0|}52|54|}
{2010006001|XXGobject_psameas_object|82|0|136|0|{metadata|reject0_metadata|1|0|}54|52|}
{2010212001|XXGvertex_oport_oport|83|0|137|0|{2|error0|}52|55|}
{2010006001|XXGobject_psameas_object|84|0|139|0|{metadata|error0_metadata|1|0|}55|52|}
{2010212001|XXGvertex_oport_oport|85|0|140|0|{3|log|}52|56|}
{2010006001|XXGobject_psameas_object|86|0|142|0|{metadata|log_metadata|1|0|}56|52|}
{2010211001|XXGvertex_iport_iport|87|0|143|0|{0|in|}52|57|}
{2010006001|XXGobject_psameas_object|88|0|145|0|{metadata|in_metadata|1|0|}57|52|}
{2010006001|XXGobject_psameas_object|89|0|146|0|{Layout|Layout|0|0|}46|36|}
{2010006001|XXGobject_psameas_object|90|0|147|0|{reject0_metadata|in_metadata|0|0|}46|46|}
{2010006001|XXGobject_psameas_object|91|0|148|0|{out_metadata|out0_metadata|0|0|}40|46|}
{2010601001|XXGgraph_vertex_vertex|92|0|149|0|{LookUps|}1|58|}
{2010605001|XXGgraph_legend_legend|93|0|151|0|{0|}58|59|}
{2010241001|XXGlegend_face_face|94|0|153|0|{}59|60|}
{2010605001|XXGgraph_legend_legend|95|0|155|0|{1|}58|61|}
{2010241001|XXGlegend_face_face|96|0|157|0|{}61|62|}
{2010601001|XXGgraph_vertex_vertex|97|0|159|0|{ICFF_TEMPLATE_IDS|}58|63|}
{2010007001|XXGobject_proto_object|98|0|161|0|{}63|64|}
{2010601001|XXGgraph_vertex_vertex|99|0|163|0|{ICFF_lookup_FILE_for_IDS|}58|65|}
{2010212001|XXGvertex_oport_oport|100|0|165|0|{0|read|}65|66|}
{2010007001|XXGobject_proto_object|101|0|167|0|{}65|67|}
{2010212001|XXGvertex_oport_oport|102|0|169|0|{0|read|}67|68|}
{2010006001|XXGobject_psameas_object|103|0|171|0|{metadata|read_metadata|1|0|}68|67|}
{2010601001|XXGgraph_vertex_vertex|104|0|172|0|{PBKS_ICFF_KEY_|}1|69|}
{2010604001|XXGgraph_flow_flow|105|0|174|0|{Flow_1|}69|70|}
{2010601001|XXGgraph_vertex_vertex|106|0|176|0|{Partition_by_Key|}69|71|}
{2010212001|XXGvertex_oport_oport|107|0|178|0|{0|out|}71|72|}
{2010213001|XXGoport_dst_flow|108|0|180|0|{0|}72|70|}
{2010211001|XXGvertex_iport_iport|109|0|181|0|{0|in|}71|73|}
{2010006001|XXGobject_psameas_object|110|0|183|0|{in_metadata|out0_metadata|0|0|}71|74|}
{2010212001|XXGvertex_oport_oport|111|0|185|0|{0|out0|}74|75|}
{2010213001|XXGoport_dst_flow|112|0|187|0|{0|}75|13|}
{2010212001|XXGvertex_oport_oport|113|0|188|0|{1|reject0|}74|76|}
{2010212001|XXGvertex_oport_oport|114|0|190|0|{2|error0|}74|77|}
{2010212001|XXGvertex_oport_oport|115|0|192|0|{3|log|}74|78|}
{2010211001|XXGvertex_iport_iport|116|0|194|0|{0|in|}74|79|}
{2010214001|XXGiport_src_flow|117|0|196|0|{0|}79|12|}
{2010007001|XXGobject_proto_object|118|0|197|0|{}74|80|}
{2010212001|XXGvertex_oport_oport|119|0|199|0|{0|out0|}80|81|}
{2010006001|XXGobject_psameas_object|120|0|201|0|{metadata|out0_metadata|1|0|}81|80|}
{2010006001|XXGobject_psameas_object|121|0|202|0|{transform0|transform0|1|0|}81|80|}
{2010212001|XXGvertex_oport_oport|122|0|203|0|{1|reject0|}80|82|}
{2010006001|XXGobject_psameas_object|123|0|205|0|{metadata|reject0_metadata|1|0|}82|80|}
{2010212001|XXGvertex_oport_oport|124|0|206|0|{2|error0|}80|83|}
{2010006001|XXGobject_psameas_object|125|0|208|0|{metadata|error0_metadata|1|0|}83|80|}
{2010212001|XXGvertex_oport_oport|126|0|209|0|{3|log|}80|84|}
{2010006001|XXGobject_psameas_object|127|0|211|0|{metadata|log_metadata|1|0|}84|80|}
{2010211001|XXGvertex_iport_iport|128|0|212|0|{0|in|}80|85|}
{2010006001|XXGobject_psameas_object|129|0|214|0|{metadata|in_metadata|1|0|}85|80|}
{2010006001|XXGobject_psameas_object|130|0|215|0|{Layout|Layout|0|0|}74|32|}
{2010006001|XXGobject_psameas_object|131|0|216|0|{in_metadata|out0_metadata|0|0|}74|74|}
{2010006001|XXGobject_psameas_object|132|0|217|0|{reject0_metadata|out0_metadata|0|0|}74|74|}
{2010006001|XXGobject_psameas_object|133|0|218|0|{out_metadata|out0_metadata|0|0|}71|74|}
{2010601001|XXGgraph_vertex_vertex|134|0|219|0|{Sort|}69|86|}
{2010212001|XXGvertex_oport_oport|135|0|221|0|{0|out|}86|87|}
{2010211001|XXGvertex_iport_iport|136|0|223|0|{0|in|}86|88|}
{2010214001|XXGiport_src_flow|137|0|225|0|{0|}88|70|}
{2010006001|XXGobject_psameas_object|138|0|226|0|{in_metadata|in_metadata|0|0|}86|46|}
{2010006001|XXGobject_psameas_object|139|0|227|0|{out_metadata|in_metadata|0|0|}86|46|}
{2010212001|XXGvertex_oport_oport|140|0|228|0|{0|out0|}69|89|}
{2010216002|XXGoport_binding_oport|141|0|230|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}89|87|}
{2010213001|XXGoport_dst_flow|142|0|231|0|{0|}89|11|}
{2010211001|XXGvertex_iport_iport|143|0|232|0|{0|in0|}69|90|}
{2010215002|XXGiport_binding_iport|144|0|234|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}90|73|}
{2010214001|XXGiport_src_flow|145|0|235|0|{0|}90|13|}
{2010007001|XXGobject_proto_object|146|0|236|0|{}69|91|}
{2010604001|XXGgraph_flow_flow|147|0|238|0|{Flow_1|}91|92|}
{2010601001|XXGgraph_vertex_vertex|148|0|240|0|{Partition_by_Key|}91|93|}
{2010212001|XXGvertex_oport_oport|149|0|242|0|{0|out|}93|94|}
{2010213001|XXGoport_dst_flow|150|0|244|0|{0|}94|92|}
{2010211001|XXGvertex_iport_iport|151|0|245|0|{0|in|}93|95|}
{2010007001|XXGobject_proto_object|152|0|247|0|{}93|96|}
{2010212001|XXGvertex_oport_oport|153|0|249|0|{0|out|}96|97|}
{2010006001|XXGobject_psameas_object|154|0|251|0|{metadata|out_metadata|1|0|}97|96|}
{2010211001|XXGvertex_iport_iport|155|0|252|0|{0|in|}96|98|}
{2010006001|XXGobject_psameas_object|156|0|254|0|{metadata|in_metadata|1|0|}98|96|}
{2010006001|XXGobject_psameas_object|157|0|255|0|{Layout|InputLayout|1|0|}93|91|}
{2010006001|XXGobject_psameas_object|158|0|256|0|{key|Key|1|0|}93|91|}
{2010601001|XXGgraph_vertex_vertex|159|0|257|0|{Sort|}91|99|}
{2010212001|XXGvertex_oport_oport|160|0|259|0|{0|out|}99|100|}
{2010211001|XXGvertex_iport_iport|161|0|261|0|{0|in|}99|101|}
{2010214001|XXGiport_src_flow|162|0|263|0|{0|}101|92|}
{2010007001|XXGobject_proto_object|163|0|264|0|{}99|102|}
{2010212001|XXGvertex_oport_oport|164|0|266|0|{0|out|}102|103|}
{2010006001|XXGobject_psameas_object|165|0|268|0|{metadata|out_metadata|1|0|}103|102|}
{2010211001|XXGvertex_iport_iport|166|0|269|0|{0|in|}102|104|}
{2010006001|XXGobject_psameas_object|167|0|271|0|{metadata|in_metadata|1|0|}104|102|}
{2010006001|XXGobject_psameas_object|168|0|272|0|{Layout|OutputLayout|1|0|}99|91|}
{2010006001|XXGobject_psameas_object|169|0|273|0|{key|Key|1|0|}99|91|}
{2010006001|XXGobject_psameas_object|170|0|274|0|{max_core|Max_core|1|0|}99|91|}
{2010212001|XXGvertex_oport_oport|171|0|275|0|{0|out0|}91|105|}
{2010216002|XXGoport_binding_oport|172|0|277|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}105|100|}
{2010211001|XXGvertex_iport_iport|173|0|278|0|{0|in0|}91|106|}
{2010215002|XXGiport_binding_iport|174|0|280|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}106|95|}
{2010006001|XXGobject_psameas_object|175|0|281|0|{InputLayout|Layout|0|0|}69|32|}
{2010006001|XXGobject_psameas_object|176|0|282|0|{OutputLayout|Layout|0|0|}69|36|}
{2010601001|XXGgraph_vertex_vertex|177|0|283|0|{RFMT_Get_Hash_and_src_env_rank|}1|74|}
{2010601001|XXGgraph_vertex_vertex|178|0|284|0|{RFMT_lookUp_IDS_CDC|}1|46|}
{2010601001|XXGgraph_vertex_vertex|179|0|285|0|{Read_Split_File|}1|32|}
{2010601001|XXGgraph_vertex_vertex|180|0|286|0|{Two_Step_Lookup|}1|107|}
{2010604001|XXGgraph_flow_flow|181|0|288|0|{Flow_4|}107|108|}
{2010601001|XXGgraph_vertex_vertex|182|0|290|0|{FBE_Only_Pass_Insert|}107|109|}
{2010212001|XXGvertex_oport_oport|183|0|292|0|{0|out|}109|110|}
{2010213001|XXGoport_dst_flow|184|0|294|0|{0|}110|108|}
{2010212001|XXGvertex_oport_oport|185|0|295|0|{1|deselect|}109|111|}
{2010212001|XXGvertex_oport_oport|186|0|297|0|{2|reject|}109|112|}
{2010212001|XXGvertex_oport_oport|187|0|299|0|{3|error|}109|113|}
{2010212001|XXGvertex_oport_oport|188|0|301|0|{4|log|}109|114|}
{2010211001|XXGvertex_iport_iport|189|0|303|0|{0|in|}109|115|}
{2010007001|XXGobject_proto_object|190|0|305|0|{}109|116|}
{2010212001|XXGvertex_oport_oport|191|0|307|0|{0|out|}116|117|}
{2010006001|XXGobject_psameas_object|192|0|309|0|{metadata|out_metadata|1|0|}117|116|}
{2010212001|XXGvertex_oport_oport|193|0|310|0|{1|deselect|}116|118|}
{2010006001|XXGobject_psameas_object|194|0|312|0|{metadata|deselect_metadata|1|0|}118|116|}
{2010212001|XXGvertex_oport_oport|195|0|313|0|{2|reject|}116|119|}
{2010006001|XXGobject_psameas_object|196|0|315|0|{metadata|reject_metadata|1|0|}119|116|}
{2010212001|XXGvertex_oport_oport|197|0|316|0|{3|error|}116|120|}
{2010006001|XXGobject_psameas_object|198|0|318|0|{metadata|error_metadata|1|0|}120|116|}
{2010212001|XXGvertex_oport_oport|199|0|319|0|{4|log|}116|121|}
{2010006001|XXGobject_psameas_object|200|0|321|0|{metadata|log_metadata|1|0|}121|116|}
{2010211001|XXGvertex_iport_iport|201|0|322|0|{0|in|}116|122|}
{2010006001|XXGobject_psameas_object|202|0|324|0|{metadata|in_metadata|1|0|}122|116|}
{2010006001|XXGobject_psameas_object|203|0|325|0|{Layout|Layout|0|0|}109|36|}
{2010006001|XXGobject_psameas_object|204|0|326|0|{deselect_metadata|out0_metadata|0|0|}109|46|}
{2010006001|XXGobject_psameas_object|205|0|327|0|{in_metadata|out0_metadata|0|0|}109|46|}
{2010006001|XXGobject_psameas_object|206|0|328|0|{out_metadata|out0_metadata|0|0|}109|46|}
{2010006001|XXGobject_psameas_object|207|0|329|0|{reject_metadata|out0_metadata|0|0|}109|46|}
{2010601001|XXGgraph_vertex_vertex|208|0|330|0|{RFMT_CDC_With_Archive_IDS|}107|123|}
{2010212001|XXGvertex_oport_oport|209|0|332|0|{0|out0|}123|124|}
{2010212001|XXGvertex_oport_oport|210|0|334|0|{1|reject0|}123|125|}
{2010212001|XXGvertex_oport_oport|211|0|336|0|{2|error0|}123|126|}
{2010212001|XXGvertex_oport_oport|212|0|338|0|{3|log|}123|127|}
{2010211001|XXGvertex_iport_iport|213|0|340|0|{0|in|}123|128|}
{2010214001|XXGiport_src_flow|214|0|342|0|{0|}128|108|}
{2010007001|XXGobject_proto_object|215|0|343|0|{}123|129|}
{2010212001|XXGvertex_oport_oport|216|0|345|0|{0|out0|}129|130|}
{2010006001|XXGobject_psameas_object|217|0|347|0|{metadata|out0_metadata|1|0|}130|129|}
{2010006001|XXGobject_psameas_object|218|0|348|0|{transform0|transform0|1|0|}130|129|}
{2010212001|XXGvertex_oport_oport|219|0|349|0|{1|reject0|}129|131|}
{2010006001|XXGobject_psameas_object|220|0|351|0|{metadata|reject0_metadata|1|0|}131|129|}
{2010212001|XXGvertex_oport_oport|221|0|352|0|{2|error0|}129|132|}
{2010006001|XXGobject_psameas_object|222|0|354|0|{metadata|error0_metadata|1|0|}132|129|}
{2010212001|XXGvertex_oport_oport|223|0|355|0|{3|log|}129|133|}
{2010006001|XXGobject_psameas_object|224|0|357|0|{metadata|log_metadata|1|0|}133|129|}
{2010211001|XXGvertex_iport_iport|225|0|358|0|{0|in|}129|134|}
{2010006001|XXGobject_psameas_object|226|0|360|0|{metadata|in_metadata|1|0|}134|129|}
{2010006001|XXGobject_psameas_object|227|0|361|0|{Layout|Layout|0|0|}123|36|}
{2010006001|XXGobject_psameas_object|228|0|362|0|{in_metadata|out0_metadata|0|0|}123|46|}
{2010006001|XXGobject_psameas_object|229|0|363|0|{out0_metadata|out0_metadata|0|0|}123|46|}
{2010006001|XXGobject_psameas_object|230|0|364|0|{reject0_metadata|out0_metadata|0|0|}123|46|}
{2010212001|XXGvertex_oport_oport|231|0|365|0|{0|out0|}107|135|}
{2010216002|XXGoport_binding_oport|232|0|367|0|{.5|.5|{0|}12698|}135|111|}
{2010213001|XXGoport_dst_flow|233|0|368|0|{0|}135|16|}
{2010212001|XXGvertex_oport_oport|234|0|369|0|{1|out1|}107|136|}
{2010216002|XXGoport_binding_oport|235|0|371|0|{.5|.5|{0|}12699|}136|124|}
{2010213001|XXGoport_dst_flow|236|0|372|0|{0|}136|15|}
{2010211001|XXGvertex_iport_iport|237|0|373|0|{0|in0|}107|137|}
{2010215002|XXGiport_binding_iport|238|0|375|0|{.5|.5|{0|}12697|}137|115|}
{2010214001|XXGiport_src_flow|239|0|376|0|{0|}137|10|}
{2010109001|XXGobject_property_value|240|0|377|0|{0|TrackingThumbprint|72|}1|138|}
