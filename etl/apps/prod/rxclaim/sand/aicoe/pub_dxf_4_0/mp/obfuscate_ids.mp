@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|56|rel_count|91|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "/~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "/~$PUB_DB_XFR/file_list.xfr";|8|9|RK|@{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|FK|@{0|}}
{30001002|XXparameter|FILE_TYPE|IDS|15|9|FK|@{2|IDS|Event|}}
{30001002|XXparameter|IDS_DATASET|ids_common.d_member|3|9|FK|@{0|}}
{30001002|XXparameter|DATASET_IDENTIFIER|$[get_ids_dataset_identifier(IDS_DATASET)]|3|9|RK|@{0|}}
{30001002|XXparameter|IDS_DATASET_IS_REDUCED|$[first_defined(null_if_error(string_split(IDS_DATASET, ".")[2]), "") == "reduced"]|13|9|RK|@{0|}}
{30001002|XXparameter|LOAD_PSET_DIR|$AI_PSET|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_PATH|$PUB_DATAHUB_MFS_LOOKUP|3|9|K|@{0|}}
{30001002|XXparameter|IDS_DML_FILE|$PUB_DATAHUB_DML|3|9|K|@{0|}}
{30001002|XXparameter|DML_FL|$[begin

let string("") v_ids_dataset=IDS_DATASET;
let string("")[] v_details = string_split_no_empty(IDS_DATASET,".");
let string("") v_sub_area = v_details[0];
let string("") v_target_nm = v_details[1];

let string("") ids_nk_flag_value = get_ids_with_nk_flag(string_split(IDS_DATASET, ".")[0], IDS_DATASET, LOAD_PSET_DIR, PUB_DATAHUB_DML);

let string(1) ids_nk_flag = if( ids_nk_flag_value member [vector "1", "True" ]) "1" else "0";  //load pset can return boolean values as true or 1 or false or 0

result :: if(IDS_DATASET_IS_REDUCED) 
                IDS_DML_FILE + "/" + v_sub_area + "/" + string_concat(v_sub_area,".",v_target_nm) + ".reduced.dml" 
            else if ( ids_nk_flag == "1" )
                IDS_DML_FILE + "/nk/" + v_sub_area + "/" + string_concat(v_sub_area,".",v_target_nm) + ".dml" 
            else
                IDS_DML_FILE + "/" + v_sub_area + "/" + string_concat(v_sub_area,".",v_target_nm) + ".dml" ;

end ]|3|9|K|@{0|}}
{30001002|XXparameter|INPUT_FILE|$[begin
let string("") v_ids_dataset = IDS_DATASET;
let string("")[] v_details = string_split_no_empty(IDS_DATASET,".");
let string("") v_sub_area = v_details[0];
let string("") v_target_nm = v_details[1];
let string("") v_fact_fl_dt = if( length_of(v_details) > 2) v_details[2] else "";

result ::  if(IDS_DATASET_IS_REDUCED) 
                                IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.dat.gz"
           else 
                                IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".dat.gz" ;
end ]|3|9|FK|@{0|}}
{30001002|XXparameter|INPUT_INDEX_FILE|$[string_replace(INPUT_FILE,".dat.gz",".idx")]|3|9|K|@{0|}}
{30001002|XXparameter|OUTPUT_FILE|$[string_replace(INPUT_FILE,".dat.gz",".obfuscated.dat.gz")]|3|9|K|@{0|}}
{30001002|XXparameter|OUTPUT_INDEX_FILE|$[string_replace(OUTPUT_FILE,".dat.gz",".idx")]|3|9|K|@{0|}}
{30001002|XXparameter|ICFF_KEY|dxf_hk_part1|3|9|K|@{0|}}
{30001002|XXparameter|OBFUSCATE_FIELDS_LIST|mbr_st_cd,mbr_zip|3|9|FK|@{0|}}
{30001002|XXparameter|!ab_compatibility|3.5.4.0|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|obfuscate_ids|abansa28|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|812000|439000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|1|}Job 'obfuscate_ids' Execution Status Report


Job "obfuscate_ids" Execution started at Monday, April 22, 2019 04:53:16
Job completed successfully at Monday, April 22, 2019 04:53:26

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:00:10
Run performed by user abansa28
Total data moved through all flows: 0 records (0 bytes)
Total CPU time (all processes): 1 seconds
Average CPU utilization across all nodes: 0.00 percent
|||#! /bin/ksh -e

# Rename the obfuscated file back to original name

if [ $mpjret -eq 0 ]
then
        echo " Renaming Obfuscated IDS/event file to original IDS file"

        if [ $FILE_TYPE == "IDS" ]
        then
                m_mv $OUTPUT_FILE $INPUT_FILE
                m_mv $OUTPUT_INDEX_FILE $INPUT_INDEX_FILE  
        else 
                m_mv $OUTPUT_FILE $INPUT_FILE
        fi

else 
        echo "Graph failed"
fi
|@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@apvrd44256 - HT2 Dev Server||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|128|160|1|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@IDS data obfuscation graph|256000|26000|0|0|0|0|10719|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|128|160|1|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}10776|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}10775|2065|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}10771|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}10773|2065|}}
{2010600005|XXGgraph|11|0|21|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|1|3|9|P|@{0|}}
{30001002|XXparameter|!prototype|$PUB_DXF_COMPONENTS/data_obfuscation.inbound.mgi|3|9|Pf|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|OBFUSCATE_FIELDS_LIST|$OBFUSCATE_FIELDS_LIST|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@205000|200000|0|0|0|0|10777|Data obfuscation IDS -selected fields||@1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|1|}}
{2010600005|XXGgraph|12|0|23|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|implementation|$PUB_DXF_COMPONENTS/data_obfuscation.inbound.mp|44|9|RFf|A target subgraph that implements this interface, or a pset for one.|{0|}}
{30001002|XXparameter|!_ab_graph_interface|1|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|condition.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|condition_interpretation.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|conditionOutputPort.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|implementation.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|error_group|@3|9|F|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|log_group|@3|9|F|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|_ab_graph_is_handler|False|13|1|Hl|Optional graph_is_handler.|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Layout.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|Layout.layout_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|in0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|in0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|out0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|out0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|OBFUSCATE_FIELDS_LIST||3|9|FK|@{0|}}
{30001002|XXparameter|mpcmodtime|1555373597|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in0 = out0
metadata type: out0 = in0|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|Graph Interface||@1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|600000|400000|7|}}
{2010203004|XXGoport|13|0|25|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010202004|XXGiport|14|0|28|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010203004|XXGoport|15|0|31|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010202004|XXGiport|16|0|34|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010503005|XXGfvertex|17|0|37|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$DML_FL|3|2|f$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
}}@0|@137000|78000|0|0|0|0|10743|ICFF IDS with obfuscation|Ab Initio Software|@1|1000000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|18|0|39|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|19|0|41|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|20|0|43|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|21|0|46|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$INPUT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$DML_FL|3|2|f$|@{0|}}
}}@0|@38000|239000|0|0|0|0|10759|ICFF IDS without obfuscation|Ab Initio Software|@1|1000000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|22|0|48|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|23|0|51|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|24|0|53|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|25|0|58|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|450000|249500|0|0|0|0|10755|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|26|0|60|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|27|0|64|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|28|0|67|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|29|0|69|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|30|0|72|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|31|0|78|0|{Subgraph created from graph "obfuscate_ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[FILE_TYPE == "Event"]|3|9|F||{0|}}
}}@0|@636000|306000|0|0|0|0|10774|Write Obfuscated Event file|abansa28|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|328000|205000|7|}}
{2010202004|XXGiport|32|0|81|0|{@{}@0|0|0|0|in0|.6265060240963856|@@@13840|0|}}
{2010600005|XXGgraph|33|0|85|0|{Subgraph created from graph "obfuscate_ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[FILE_TYPE == "IDS"]|3|9|F||{0|}}
}}@0|@630000|161000|0|0|0|0|10772|Write Obfuscated IDS file|abansa28|Created 4/22/2019 4:35:25 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|463000|364000|3|}}
{2010210004|XXGflow|34|0|87|0|{@{}@384|.5|.5|{0|}10764|17|}}
{2010210004|XXGflow|35|0|89|0|{@{}@384|.5|.5|{0|}10762|17|}}
{2010503005|XXGfvertex|36|0|91|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$OUTPUT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
}}@0|@332000|85000|0|0|0|0|10765|Obfuscated ICFF IDS File|Ab Initio Software|@1|30000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|37|0|93|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|38|0|96|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|39|0|98|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|40|0|101|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$OUTPUT_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@334000|255000|0|0|0|0|10763|Obfuscated ICFF IDS Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|41|0|103|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|42|0|106|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|43|0|108|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|44|0|111|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@55000|125000|0|0|0|0|10761|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|45|0|113|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|46|0|116|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|47|0|119|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|48|0|121|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|49|0|123|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False|3|15|P?|@{0|}}
{30001002|XXparameter|key_index||19|2|FK$|Field used for index key|{0|}}
{30001002|XXparameter|key_index.condition|param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|key_index key|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|block_size|32768|1|2|FK$|Block size for data compression|{0|}}
{30001002|XXparameter|bitmap_size|0|1|2|FK$|Size of the screening bitmap. Set miss_rate instead for automatic sizing.|{0|}}
{30001002|XXparameter|miss_rate|0|1|2|FK$|Specify a value from - 0: No bitmap, 1: Very Low(1 in 10000), 2: Low(1 in 1000), 3: Medium(1 in 100), 4: High(1 in 10). Bitmap is sized automatically to achieve this miss rate.|{0|}}
{30001002|XXparameter|miss_rate.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|RFKl|Package containing the create_output_address transform function.|{0|}}
{30001002|XXparameter|package.condition|version 2.15.5.r34: param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|flags|+block_compressed|3|2|K$||{0|}}
{30001002|XXparameter|compression_level||1|2|FK$|Compression (0 = none, 1 = least, 9 = most, unset = AB_DEFAULT_COMPRESSION_LEVEL)|{0|}}
{30001002|XXparameter|compression_level.condition|version 3.1.2.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if block compressed lookup to be written is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=in,w|3|2|H$||{0|}}
{30001002|XXparameter|num_operations|1|1|2|H$|Number of steps in package|{0|}}
{30001002|XXparameter|operation1|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$|Create address port output record from input record and its direct address|{0|}}
{30001002|XXparameter|operation1_analysis|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|50|0|125|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|51|0|128|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|52|0|131|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|53|0|134|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|54|0|141|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010110002|XXGconstant|55|0|145|0|{@{}@{1|2678929|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_1|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_2|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_3|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_4|}1|10|}
{2010601001|XXGgraph_vertex_vertex|10|0|20|0|{Data_obfuscation_IDS_selected_fields|}1|11|}
{2010401001|XXGvertex_prototype_vertex|11|0|22|0|{}11|12|}
{2010212001|XXGvertex_oport_oport|12|0|24|0|{0|out0|}12|13|}
{2010006001|XXGobject_psameas_object|13|0|26|0|{metadata|out0_metadata|1|0|}13|12|}
{2010211001|XXGvertex_iport_iport|14|0|27|0|{0|in0|}12|14|}
{2010006001|XXGobject_psameas_object|15|0|29|0|{metadata|in0_metadata|1|0|}14|12|}
{2010212001|XXGvertex_oport_oport|16|0|30|0|{0|out0|}11|15|}
{2010213001|XXGoport_dst_flow|17|0|32|0|{0|}15|7|}
{2010211001|XXGvertex_iport_iport|18|0|33|0|{0|in0|}11|16|}
{2010214001|XXGiport_src_flow|19|0|35|0|{0|}16|8|}
{2010006001|XXGobject_psameas_object|20|0|36|0|{Layout|Layout|0|0|}11|17|}
{2010211001|XXGvertex_iport_iport|21|0|38|0|{0|write|}17|18|}
{2010007001|XXGobject_proto_object|22|0|40|0|{}17|19|}
{2010211001|XXGvertex_iport_iport|23|0|42|0|{0|write|}19|20|}
{2010006001|XXGobject_psameas_object|24|0|44|0|{metadata|write_metadata|1|0|}20|19|}
{2010006001|XXGobject_psameas_object|25|0|45|0|{in0_metadata|read_metadata|0|0|}11|21|}
{2010212001|XXGvertex_oport_oport|26|0|47|0|{0|read|}21|22|}
{2010213001|XXGoport_dst_flow|27|0|49|0|{0|}22|8|}
{2010007001|XXGobject_proto_object|28|0|50|0|{}21|23|}
{2010212001|XXGvertex_oport_oport|29|0|52|0|{0|read|}23|24|}
{2010006001|XXGobject_psameas_object|30|0|54|0|{metadata|read_metadata|1|0|}24|23|}
{2010006001|XXGobject_psameas_object|31|0|55|0|{out0_metadata|read_metadata|0|0|}11|21|}
{2010601001|XXGgraph_vertex_vertex|32|0|56|0|{ICFF_IDS_without_obfuscation|}1|21|}
{2010601001|XXGgraph_vertex_vertex|33|0|57|0|{Replicate|}1|25|}
{2010212001|XXGvertex_oport_oport|34|0|59|0|{0|out|}25|26|}
{2010213001|XXGoport_dst_flow|35|0|61|0|{0|}26|9|}
{2010213001|XXGoport_dst_flow|36|0|62|0|{1|}26|10|}
{2010211001|XXGvertex_iport_iport|37|0|63|0|{0|in|}25|27|}
{2010214001|XXGiport_src_flow|38|0|65|0|{0|}27|7|}
{2010007001|XXGobject_proto_object|39|0|66|0|{}25|28|}
{2010212001|XXGvertex_oport_oport|40|0|68|0|{0|out|}28|29|}
{2010006001|XXGobject_psameas_object|41|0|70|0|{metadata|out_metadata|1|0|}29|28|}
{2010211001|XXGvertex_iport_iport|42|0|71|0|{0|in|}28|30|}
{2010006001|XXGobject_psameas_object|43|0|73|0|{metadata|in_metadata|1|0|}30|28|}
{2010006001|XXGobject_psameas_object|44|0|74|0|{Layout|Layout|0|0|}25|17|}
{2010006001|XXGobject_psameas_object|45|0|75|0|{in_metadata|read_metadata|0|0|}25|21|}
{2010006001|XXGobject_psameas_object|46|0|76|0|{out_metadata|read_metadata|0|0|}25|21|}
{2010601001|XXGgraph_vertex_vertex|47|0|77|0|{Write_Obfuscated_Event_file|}1|31|}
{2010601001|XXGgraph_vertex_vertex|48|0|79|0|{ICFF_IDS_with_obfuscation|}31|17|}
{2010211001|XXGvertex_iport_iport|49|0|80|0|{0|in0|}31|32|}
{2010215002|XXGiport_binding_iport|50|0|82|0|{.5|.5|{0|}1|}32|18|}
{2010214001|XXGiport_src_flow|51|0|83|0|{0|}32|10|}
{2010601001|XXGgraph_vertex_vertex|52|0|84|0|{Write_Obfuscated_IDS_file|}1|33|}
{2010604001|XXGgraph_flow_flow|53|0|86|0|{Flow_6|}33|34|}
{2010604001|XXGgraph_flow_flow|54|0|88|0|{Flow_7|}33|35|}
{2010601001|XXGgraph_vertex_vertex|55|0|90|0|{Obfuscated_ICFF_IDS_File|}33|36|}
{2010211001|XXGvertex_iport_iport|56|0|92|0|{0|write|}36|37|}
{2010214001|XXGiport_src_flow|57|0|94|0|{0|}37|34|}
{2010007001|XXGobject_proto_object|58|0|95|0|{}36|38|}
{2010211001|XXGvertex_iport_iport|59|0|97|0|{0|write|}38|39|}
{2010006001|XXGobject_psameas_object|60|0|99|0|{metadata|write_metadata|1|0|}39|38|}
{2010601001|XXGgraph_vertex_vertex|61|0|100|0|{Obfuscated_ICFF_IDS_Index_File|}33|40|}
{2010211001|XXGvertex_iport_iport|62|0|102|0|{0|write|}40|41|}
{2010214001|XXGiport_src_flow|63|0|104|0|{0|}41|35|}
{2010007001|XXGobject_proto_object|64|0|105|0|{}40|42|}
{2010211001|XXGvertex_iport_iport|65|0|107|0|{0|write|}42|43|}
{2010006001|XXGobject_psameas_object|66|0|109|0|{metadata|write_metadata|1|0|}43|42|}
{2010006001|XXGobject_psameas_object|67|0|110|0|{write_metadata|index_metadata|0|0|}40|44|}
{2010212001|XXGvertex_oport_oport|68|0|112|0|{0|out|}44|45|}
{2010213001|XXGoport_dst_flow|69|0|114|0|{0|}45|34|}
{2010212001|XXGvertex_oport_oport|70|0|115|0|{1|index|}44|46|}
{2010213001|XXGoport_dst_flow|71|0|117|0|{0|}46|35|}
{2010212001|XXGvertex_oport_oport|72|0|118|0|{2|address|}44|47|}
{2010211001|XXGvertex_iport_iport|73|0|120|0|{0|in|}44|48|}
{2010007001|XXGobject_proto_object|74|0|122|0|{}44|49|}
{2010212001|XXGvertex_oport_oport|75|0|124|0|{0|out|}49|50|}
{2010006001|XXGobject_psameas_object|76|0|126|0|{metadata|out_metadata|1|0|}50|49|}
{2010212001|XXGvertex_oport_oport|77|0|127|0|{1|index|}49|51|}
{2010006001|XXGobject_psameas_object|78|0|129|0|{metadata|index_metadata|1|0|}51|49|}
{2010212001|XXGvertex_oport_oport|79|0|130|0|{2|address|}49|52|}
{2010006001|XXGobject_psameas_object|80|0|132|0|{metadata|address_metadata|1|0|}52|49|}
{2010211001|XXGvertex_iport_iport|81|0|133|0|{0|in|}49|53|}
{2010006001|XXGobject_psameas_object|82|0|135|0|{metadata|in_metadata|1|0|}53|49|}
{2010006001|XXGobject_psameas_object|83|0|136|0|{Layout|Layout|0|0|}44|36|}
{2010006001|XXGobject_psameas_object|84|0|137|0|{in_metadata|read_metadata|0|0|}44|21|}
{2010006001|XXGobject_psameas_object|85|0|138|0|{out_metadata|write_metadata|0|0|}44|36|}
{2010601001|XXGgraph_vertex_vertex|86|0|139|0|{Write_Block_Compressed_Lookup|}33|44|}
{2010211001|XXGvertex_iport_iport|87|0|140|0|{0|in0|}33|54|}
{2010215002|XXGiport_binding_iport|88|0|142|0|{.5|.5|{0|}10754|}54|48|}
{2010214001|XXGiport_src_flow|89|0|143|0|{0|}54|9|}
{2010109001|XXGobject_property_value|90|0|144|0|{0|TrackingThumbprint|72|}1|55|}
