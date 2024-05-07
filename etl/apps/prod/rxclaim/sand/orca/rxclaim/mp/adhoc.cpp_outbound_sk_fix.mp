@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|279|rel_count|534|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|CHILD_TABLE|c_member_dtl|3|9|REFK|@{0|}}
{30001002|XXparameter|PARENT_TABLE|c_member|3|9|REFK|@{0|}}
{30001002|XXparameter|CHILD_DML|$[$PUB_DATAHUB_DML +"/ids_common/ids_common."+ CHILD_TABLE+".dml"]|3|9|FK|@{0|}}
{30001002|XXparameter|PARENT_DML|$[PUB_DATAHUB_DML+"/ids_common/ids_common."+PARENT_TABLE+".dml"]|3|9|RFK|@{0|}}
{30001002|XXparameter|CHILD_IDS_FILE|$[PUB_DATAHUB_MFS_LOOKUP+"/ids/ids_common/one/"+CHILD_TABLE+".dat.gz"]|3|9|RFK|@{0|}}
{30001002|XXparameter|PARENT_IDS_FILE|$[PUB_DATAHUB_MFS_LOOKUP+"/ids/ids_common/one/"+PARENT_TABLE+".dat.gz"]|3|9|RFK|@{0|}}
{30001002|XXparameter|JOIN_KEY|$(grep -w $PARENT_TABLE $AI_CAT/map.cpp/map.cpp.$CHILD_TABLE.$CHILD_TABLE.cat\| cut -d "," -f2)|3|9|RFK|@{0|}}
{30001002|XXparameter|NK_CHILD_TABLE|$(grep -w $CHILD_TABLE $PUB_DXF_META/ids_table_properties.dat\| cut -d "\|" -f5)|3|9|RFK|@{0|}}
{30001002|XXparameter|INV_NAME|$[if(string_like(PARENT_TABLE,"c_%")) (string_replace(PARENT_TABLE, "c_", "cpp_")) else (string_replace(PARENT_TABLE, "pc_", "cpp_pc_"))]|3|9|REFK|@{0|}}
{30001002|XXparameter|MINOR_KEY|$(grep "_sk" $PUB_DATAHUB_DML/ids_common/ids_common.$PARENT_TABLE.dml \| grep $INV_NAME \| sed s/" "//g\| sed 's/[)=]/ /g'\|cut -d " " -f2)|3|9|RFK|@{0|}}
{30001002|XXparameter|OUTPUT_FILE|$[PUB_DATAHUB_MFS_LOOKUP+"/ids/ids_common/one/"+CHILD_TABLE+".fixed_new.dat.gz"]|3|9|REFK|@{0|}}
{30001002|XXparameter|OUTPUT_INDEX_FILE|$[PUB_DATAHUB_MFS_LOOKUP+"/ids/ids_common/one/"+CHILD_TABLE+".fixed_new.idx"]|3|9|FK|@{0|}}
{30001002|XXparameter|OUTPUT_DML|$[$PUB_DATAHUB_DML +"/ids_common/ids_common."+ CHILD_TABLE+".dml"]|3|9|RFK|@{0|}}
{30001002|XXparameter|CHILD_UPDATE_TS|$[if (string_like(CHILD_TABLE,"c_%")) "cpp_update_ts" else "px_update_datetime" ]|3|9|RFK|@{0|}}
{30001002|XXparameter|PARENT_UPDATE_TS|$[if (string_like(PARENT_TABLE,"c_%"))"cpp_update_ts" else "px_update_datetime" ]|3|9|RFK|@{0|}}
{30001002|XXparameter|DUP_PARENT_FIELD|$[if (string_like(PARENT_TABLE,"c_%")) (string_replace("cpp_update_ts","cpp",PARENT_TABLE)) else (string_replace("px_update_datetime","px",PARENT_TABLE))]|3|9|RFK|@{0|}}
{30001002|XXparameter|ICFF_KEY|\{dxf_hk_part1\}|3|9|RFK|@{0|}}
{30001002|XXparameter|RMFT_DML|$[add_field(add_field (remove_fields(read_type(CHILD_DML),"newline"), if (string_like(PARENT_TABLE,"c_%")) (string_replace("cpp_update_ts","cpp",PARENT_TABLE)) else (string_replace("px_update_datetime","px",PARENT_TABLE)), 'datetime("YYYYMMDD HH24:MI:SS")'),"newline","string(1)")]|3|9|RFK|@{0|}}
{30001002|XXparameter|CHECK_REFORMAT_DML|$[begin 

let string("")[] join_key = re_split(re_replace(JOIN_KEY,"[\{ \}]",""),";");
let dml_field_info_vec child_info = record_info(read_file(CHILD_DML));
let dml_field_info_vec parent_info = record_info(read_file(PARENT_DML));
let string("")[] tmp_child_vec = allocate_with_nulls();
let string("")[] tmp_parent_vec = allocate_with_nulls();
for ( let nk in join_key )
begin
        for( let fields in child_info)
        begin             
                if(string_like(fields.name,nk))
                        tmp_child_vec = vector_append(tmp_child_vec,string_concat(fields.name,"#",fields.dml_type));
        end
       for( let fields1 in parent_info)
        begin                               
                if(string_like(fields1.name,nk))
                        tmp_parent_vec = vector_append(tmp_parent_vec,string_concat(fields1.name,"#",fields1.dml_type));           
                                
        end
end


result:: length_of(vector_difference(tmp_child_vec,tmp_parent_vec));
end 
]|3|9|RK|@{0|}}
{30001002|XXparameter|OPTIONAL_RMFT_DML|$[
begin

let string("")[] join_key = re_split(re_replace(JOIN_KEY,"[\{ \}]",""),";");
let dml_field_info_vec parent_info = record_info(read_file(PARENT_DML));
let dml_field_info_vec parent_nk = allocate_with_defaults();
let string("") dml= remove_fields(read_type(CHILD_DML),"newline");
let decimal("")  index = 0;


for ( let nk in join_key )
begin
       
       for( let fields1 in parent_info)
        begin              
                 parent_nk=if(string_like(fields1.name,nk)) vector_append(parent_nk,fields1) else parent_nk ;                                                         
        end
end

if(CHECK_REFORMAT_DML > 0)
        for(let nk1 in join_key)
        begin

              dml=remove_fields(dml,nk1);
               dml= add_field(dml,parent_nk[index].name + '= NULL("")',parent_nk[index].dml_type); 

              index = index + 1;
        end

result :: add_field(dml,'newline = NULL("")',"string(1)")  ;

end
]|3|9|RK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|c_intvn_idntfn_fix|pkhobrag|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|2356000|702000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{2|1|0|}Job 'adhoc.cpp_outbound_sk_fix' Execution Status Report


Job "adhoc.cpp_outbound_sk_fix" Execution started at Monday, May 28, 2018 05:39:15
***** Job manually cancelled at Monday, May 28, 2018 05:39:45 *****

------------------------------
Job Statistics:

Job status at termination: Cancelled
Run time (wall clock): 0:00:29
Run performed by user pkhobrag
Total data moved through all flows: 25021316 records (7462434944 bytes)
Total CPU time (all processes): 261 seconds
Average CPU utilization across all nodes: 29.19 percent
||||@@33469951|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Pratik QA||||1|60|0|1|1|1|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@144|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{0|}1582|2065|}}
{2010243001|XXGwatcher|6|0|11|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5147058963775635|{0|}1530|17|}}
{2010243001|XXGwatcher|8|0|15|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}1525|17|}}
{2010243001|XXGwatcher|10|0|19|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}1570|17|}}
{2010243001|XXGwatcher|12|0|23|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}1585|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}1547|17|}}
{2010243001|XXGwatcher|15|0|29|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.6205882430076599|.5|{0|}1577|1041|}}
{2010243001|XXGwatcher|17|0|33|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{0|}1568|17|}}
{2010243001|XXGwatcher|19|0|37|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{0|}1532|17|}}
{2010243001|XXGwatcher|21|0|41|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|22|0|43|0|{@{}@384|.5|.5|{0|}1527|17|}}
{2010243001|XXGwatcher|23|0|45|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|24|0|47|0|{@{}@384|.5|.5|{0|}1580|17|}}
{2010210004|XXGflow|25|0|49|0|{@{}@384|.5|.5|{0|}1587|17|}}
{2010243001|XXGwatcher|26|0|51|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|27|0|53|0|{@{}@384|.5|.5|{0|}1478|17|}}
{2010210004|XXGflow|28|0|55|0|{@{}@384|.5|.5|{0|}1579|17|}}
{2010243001|XXGwatcher|29|0|57|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|30|0|59|0|{@{}@384|.5|.5|{0|}1569|17|}}
{2010243001|XXGwatcher|31|0|61|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|32|0|63|0|{@{}@384|.5|.5|{0|}1578|1041|}}
{2010210004|XXGflow|33|0|65|0|{@{}@384|.5|.5|{0|}1512|2065|}}
{2010210004|XXGflow|34|0|67|0|{@{}@384|.5|.5|{0|}1534|17|}}
{2010243001|XXGwatcher|35|0|69|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|36|0|71|0|{@{}@384|.5|.5|{0|}1584|17|}}
{2010243001|XXGwatcher|37|0|73|0|{@{}@1|100|-1||0|}}
{2010503005|XXGfvertex|38|0|75|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$CHILD_IDS_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$CHILD_IDS_FILE|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$CHILD_DML|3|9|fj|@{0|}}
}}@0|@37000|352500|0|0|0|0|1583|Child Table IDS File|Ab Initio Software|@1|4717|-1|@6|dxf_sk==85488|33025|-1|-1|}}
{2010203004|XXGoport|39|0|77|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|40|0|80|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|41|0|82|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|42|0|85|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$OUTPUT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
}}@0|@2252000|132500|0|0|0|0|1588|Child Table IDS File(Fixed)|Ab Initio Software|@1|100|-1|@6||33025|-1|-1|}}
{2010202004|XXGiport|43|0|87|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|44|0|90|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|45|0|92|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|46|0|95|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$NK_CHILD_TABLE|3|9||@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|1665000|265000|0|0|0|0|1531|Dedup Sorted on child table NK|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|47|0|97|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|48|0|100|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|49|0|102|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|50|0|104|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|51|0|106|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|52|0|108|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|53|0|111|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|dup_metadata||7|1|Fsl||{0|}}
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
{2010203004|XXGoport|54|0|113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|55|0|116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|56|0|119|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|57|0|122|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|58|0|125|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|59|0|128|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|60|0|136|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|$CHILD_UPDATE_TS >= $DUP_PARENT_FIELD|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata|/* DML Generated by IDS Table DML Onboarding Process for table: C_INTVN_IDNTFN
 * On: FRI SEP 29 2017 06:19:32
 */

record
  unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
  integer(8)  dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01",0)   cpp_intvn_idntfn_sk = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0, maximum_length=39, sign_reserved)   intvn_idntfn_id = NULL("") /*DECIMAL(38) NOT NULL*/;
  decimal("\\x01",0)   job_id = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)   cpp_job_sk = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0, maximum_length=39, sign_reserved)   cli_src_env_id = NULL("") /*DECIMAL(38)*/;
  decimal("\\x01",0)   cli_carrier_id = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)   cli_acct_id = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)   cli_emplyr_group_id = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)   cli_member_id = NULL("") /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4)   src_env_id = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)   carrier_id = NULL("") /*VARCHAR(30) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=40)   acct_id = NULL("") /*VARCHAR(40) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)   emplyr_group_id = NULL("") /*VARCHAR(30) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20)   member_id = NULL("") /*VARCHAR(20) NOT NULL*/;
  decimal("\\x01",0)   cpp_member_sk = NULL("") /*BIGINT NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")   intvn_dt = NULL("") /*TIMESTAMP(6) NOT NULL*/;
  utf8 string("\\x01", maximum_length=400)   intvn_name = NULL("") /*NVARCHAR(100) NOT NULL*/;
  utf8 string("\\x01", maximum_length=1200)   intvn_descr = NULL("") /*NVARCHAR(300) NOT NULL*/;
  utf8 string("\\x01", maximum_length=40)   idntfn_cd = NULL("") /*NVARCHAR(10) NOT NULL*/;
  utf8 string("\\x01", maximum_length=40)   intvn_cd = NULL("") /*NVARCHAR(10) NOT NULL*/;
  utf8 string("\\x01", maximum_length=40)   lvl = NULL("") /*NVARCHAR(10) NOT NULL*/;
  decimal("\\x01".5, maximum_length=17, sign_reserved)   risk_score = NULL("") /*DECIMAL(15,5)*/;
  utf8 string("\\x01", maximum_length=60)   risk_category = NULL("") /*NVARCHAR(15)*/;
  utf8 string("\\x01", maximum_length=4)   intvn_process_flag = NULL("") /*NVARCHAR(1) NOT NULL*/;
  utf8 string("\\x01", maximum_length=80)   intvn_type = NULL("") /*NVARCHAR(20)*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")   claim_review_period_start_dt = NULL("") /*TIMESTAMP(6) NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")   claim_review_period_end_dt = NULL("") /*TIMESTAMP(6) NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")   cpp_update_ts = NULL("") /*TIMESTAMP(6)*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") c_job_update_ts = NULL("") /*TIMESTAMP(6)*/;
  utf8 string("\\x01", maximum_length=80)   cpp_updated_by = NULL("") /*NVARCHAR(20)*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")   cpp_create_ts = NULL("") /*TIMESTAMP(6) NOT NULL*/;
  utf8 string("\\x01", maximum_length=80)   cpp_created_by = NULL("") /*NVARCHAR(20) NOT NULL*/;
  decimal("\\x01",0)   src_env_sk = NULL("") /*BIGINT*/;
  decimal("\\x01", maximum_length=5)   dxf_src_sys_id =   0;
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_create_dttm = NULL("");
  string("\\x01", maximum_length=20)   ids_create_uid = NULL("");
  decimal("\\x01",maximum_length=20)   ids_create_run_id =   0;
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
  string("\\x01", maximum_length=20)   ids_updt_uid = NULL("");
  decimal("\\x01",maximum_length=20)   ids_updt_run_id =   0;
  string("\\x01",maximum_length=2)   ids_rec_stat_cd = NULL("");
  string(1)  newline = NULL("");
  
end

;|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|$CHILD_DML|3|9|f|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|1097000|305000|0|0|0|0|1571|FBE|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|61|0|138|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|62|0|141|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|63|0|144|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|64|0|146|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|65|0|148|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|66|0|150|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|67|0|153|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|68|0|155|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|69|0|158|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|70|0|161|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|71|0|164|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|72|0|167|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|73|0|170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|74|0|174|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Join.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$JOIN_KEY|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$RMFT_DML|3|9||@{0|}}
{30001002|XXparameter|transform|/*Join transform*/
out::join(in0,in1)=
begin
  out.* :: in0.*;
  out.$MINOR_KEY :: in1.dxf_sk;
  out.$DUP_PARENT_FIELD :: in1.$PARENT_UPDATE_TS;

end;|3|9||@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Join|484000|300000|0|0|0|0|1581|Join on id|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|75|0|176|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|76|0|179|0|{@{}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|77|0|182|0|{@{}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|78|0|184|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|79|0|186|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|80|0|188|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|81|0|190|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|82|0|192|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|83|0|194|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|84|0|197|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|85|0|200|0|{Performs inner, outer, and semi-joins with multiple flows of data records. It maximizes performance by loading input data records into main memory.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?join|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of inputs to join function|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not sorted. In this case, JOIN processes the data in-memory without sorting it.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|_min_count|2|1|2|FH$|Minimum number of inputs to join|{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field(s) on which to join|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required DML function|{0|}}
{30001002|XXparameter|join_type|Inner Join (matching records required on all inputs)|15|1|Fl|Handling for duplicate and missing key values|{3|Inner Join (matching records required on all inputs)|Full Outer Join (use null for missing records)|Explicit|}}
{30001002|XXparameter|join_type.display_name|join-type|3|9|P|@{0|}}
{30001002|XXparameter|show_interface|True|13|1|Hl|Whether to show the interface parameter|{0|}}
{30001002|XXparameter|show_interface.update_clauses|update_value True|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface|version-3-2-2|15|1|Fl|Controls whether to use the legacy interface or the improved Co>Operating System Version 3.2.2 and later parameter interface.  Specifically, it controls whether to use the legacy record-required parameter with inverted booleans or the Version 3.2.2 record-match-required parameter with normal booleans. The choice of parameter-interface is compatible with all Co>Operating System versions except when count is greater than 5 in which case older Co>Operating Systems will fail with the version-3-2-2 interface.|{2|version-3-2-2|legacy|}}
{30001002|XXparameter|parameter_interface.display_name|parameter-interface|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface.condition|version 3.2: param show_interface True param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|parameter_interface.update_clauses|update_value legacy|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface_internal|value join-type Inner* legacy value join-type Full* legacy sameas parameter-interface default dollar_substitution version-3-2-2|3|13|v|Sets the value of the internal parameter interface|{0|}}
{30001002|XXparameter|parameter_interface_internal.display_name|parameter-interface-internal|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required0.display_name|record-match-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required1|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required1.display_name|record-match-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required0|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
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
{30001002|XXparameter|record_match_required_not0|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not0.display_name|record-match-required-not0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not1|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not1.display_name|record-match-required-not1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll0|value record-match-required0 F* True value record-match-required0 T* False value record-match-required0 f* True value record-match-required0 t* False value record-match-required0 0 True value record-match-required0 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll0.display_name|record-match-required-not-unroll0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll0.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll1|value record-match-required1 F* True value record-match-required1 T* False value record-match-required1 f* True value record-match-required1 t* False value record-match-required1 0 True value record-match-required1 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll1.display_name|record-match-required-not-unroll1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll1.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll2|value record-match-required2 F* True value record-match-required2 T* False value record-match-required2 f* True value record-match-required2 t* False value record-match-required2 0 True value record-match-required2 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll2.display_name|record-match-required-not-unroll2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll2.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll3|value record-match-required3 F* True value record-match-required3 T* False value record-match-required3 f* True value record-match-required3 t* False value record-match-required3 0 True value record-match-required3 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll3.display_name|record-match-required-not-unroll3|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll3.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll4|value record-match-required4 F* True value record-match-required4 T* False value record-match-required4 f* True value record-match-required4 t* False value record-match-required4 0 True value record-match-required4 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll4.display_name|record-match-required-not-unroll4|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll4.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems|value record-match-required5 * True default constant False|13|13|Kv|Interface protection parameter|{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.display_name|join-mpc-interface-3-2-supports-maximum-count-of-5-in-older-cooperating-systems|3|9|P|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.keyword|join-mpc-interface-3-2-supports-maximum-count-of-5-in-older-cooperating-systems|3|9|P|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.condition|version :3.2.1.r9 param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_display_values|True(recordrequiredonthisinput) False(usenullformissingrecord)|3|2|H$||{0|}}
{30001002|XXparameter|record_required_display_values.display_name|record-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|dedup_display_values|Donotdedupthisinput Dedupthisinputbeforejoining|3|2|H$||{0|}}
{30001002|XXparameter|dedup_display_values.display_name|dedup-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_display_values|False(usenullformissingrecord) True(recordrequiredonthisinput)|3|2|H$||{0|}}
{30001002|XXparameter|record_match_required_display_values.display_name|record-match-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_positional1|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional0|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional0.display_name|matchoptional-positional0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional1|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional1.display_name|matchoptional-positional1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
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
{30001002|XXparameter|record_required_keyword0.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword0|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword0.display_name|matchoptional-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword1|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword1.display_name|matchoptional-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
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
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp max-memory max-core dedup singlematch dedup-keyword singlematch record-required matchoptional record-required-keyword matchoptional select-keyword select record-required-positional matchoptional dedup-positional singlematch matchoptional-keyword matchoptional matchoptional-positional matchoptional|3|2|H$||{0|}}
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
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
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
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|unused0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|unused1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,unused[*],reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: unused = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Join|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|86|0|202|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|87|0|205|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|88|0|208|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|89|0|211|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|90|0|214|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|91|0|217|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|92|0|220|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|93|0|223|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|94|0|226|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|select0||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required0.display_name|record-match-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional0.display_name|matchoptional-positional0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword0.display_name|matchoptional-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not0||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not0.display_name|record-match-required-not0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|95|0|244|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|select1||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required1.display_name|record-match-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup1||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional1.display_name|matchoptional-positional1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword1.display_name|matchoptional-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not1||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not1.display_name|record-match-required-not1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|96|0|263|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
out.*::in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata|$OPTIONAL_RMFT_DML|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|$[CHECK_REFORMAT_DML!=0]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|169000|525000|0|0|0|0|1586|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|97|0|265|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|98|0|268|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|99|0|270|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|100|0|272|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|101|0|274|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|102|0|277|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|103|0|279|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|104|0|283|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|105|0|286|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|106|0|289|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|107|0|292|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|108|0|298|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PARENT_IDS_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$PARENT_IDS_FILE|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$PARENT_DML|3|9|f|@{0|}}
}}@0|@30000|200000|0|0|0|0|1505|Parent Table IDS File|Ab Initio Software|@1|100|-1|@6|cpp_job_sk==85488|33025|-1|-1|}}
{2010203004|XXGoport|109|0|300|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|110|0|303|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|111|0|305|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|112|0|313|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|cpp_member_sk==-1|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|155000|337500|0|0|0|0|1548|Filter by Expression|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|113|0|315|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|114|0|318|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|115|0|321|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|116|0|323|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|117|0|325|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|118|0|327|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|119|0|330|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|120|0|332|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|121|0|335|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|122|0|338|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|123|0|341|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|124|0|344|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|125|0|347|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|126|0|355|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_INDEX_FILE|3|2|$|@{0|}}
}}@0|@2263000|259500|0|0|0|0|1476|Index file for Child Table|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|127|0|357|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|128|0|360|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|129|0|362|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|130|0|365|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|@3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Write Block-Compressed Lookup|2024000|140000|0|0|0|0|1479|Write Block-Compressed Lookup-1|Ab Initio Software|Built-in 2.14.1:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|131|0|367|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|132|0|370|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|133|0|373|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|134|0|375|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|135|0|378|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Write Block-Compressed Lookup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|136|0|380|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|137|0|383|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|138|0|386|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|139|0|389|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|140|0|396|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform|/* This type is optional.*/
// type temporary_type = NULL_TYPE;

/* This function is optional. */
/*Number of records to output.  Either this function or finished() must be defined.*/
out::length(in)=
begin
out::if(in.$DUP_PARENT_FIELD > in.$CHILD_UPDATE_TS) 2 else 1;
end;

/*Do computation*/
out::normalize(in,index)=
begin
out.*::in.*;
out.$DUP_PARENT_FIELD::if(index==1) "19000101 00:00:01" else in.$DUP_PARENT_FIELD;
out.$MINOR_KEY::if(index==1) -1 else in.$MINOR_KEY;
end;|3|9||@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Normalize|812000|269500|0|0|0|0|1567|Normalize : Duplicaing records(parent_update_ts > child_update_ts)|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|141|0|398|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|142|0|401|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|143|0|403|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|144|0|405|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|145|0|407|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|146|0|410|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|num_operations|12|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation12|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Normalize|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|147|0|412|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|148|0|415|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|149|0|418|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|150|0|421|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|151|0|424|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|152|0|431|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$JOIN_KEY|3|9||@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@155000|180000|0|0|481000|303000|1513|PBKS1 on id|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|153|0|433|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|154|0|435|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|155|0|437|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|156|0|440|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|157|0|444|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|158|0|446|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|159|0|448|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|160|0|453|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|161|0|457|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|162|0|461|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|163|0|463|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|164|0|465|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|165|0|467|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|166|0|470|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|167|0|472|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|168|0|474|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|169|0|477|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|170|0|482|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|171|0|484|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|172|0|486|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|173|0|489|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|174|0|491|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|175|0|494|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|176|0|500|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|177|0|503|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|178|0|508|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|9||@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@1864000|395000|0|0|481000|303000|1528|PBKS on ICFF Key|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|179|0|510|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|180|0|512|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|181|0|514|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|182|0|517|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|183|0|521|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|184|0|523|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|185|0|525|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|186|0|530|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|187|0|534|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|188|0|540|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|189|0|542|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|190|0|544|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|191|0|546|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|192|0|549|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|193|0|551|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|194|0|553|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|195|0|556|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|196|0|561|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|197|0|563|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|198|0|565|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|199|0|568|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|200|0|570|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|201|0|573|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|202|0|579|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|203|0|582|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|204|0|587|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$JOIN_KEY|3|9||@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@330000|515500|0|0|481000|303000|1560|PBKS on id|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|205|0|589|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|206|0|591|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|207|0|593|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|208|0|596|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|209|0|600|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|210|0|602|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|211|0|604|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|212|0|609|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|213|0|613|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|214|0|617|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|215|0|619|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|216|0|621|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|217|0|623|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|218|0|626|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|219|0|628|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|220|0|630|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|221|0|633|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|222|0|638|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|223|0|640|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|224|0|642|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|225|0|645|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|226|0|647|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|227|0|650|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|228|0|656|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|229|0|659|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|230|0|664|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$NK_CHILD_TABLE|3|9||@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@1275000|275000|0|0|481000|303000|1535|PBK and sort on CHILD_NK|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|231|0|666|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|232|0|668|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|233|0|670|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|234|0|673|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|235|0|677|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|236|0|679|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|237|0|681|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|238|0|686|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|239|0|690|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|240|0|694|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|241|0|696|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|242|0|698|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|243|0|700|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|244|0|703|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|245|0|705|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|246|0|707|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|247|0|710|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|248|0|715|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|249|0|717|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|250|0|719|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|251|0|722|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|252|0|724|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|253|0|727|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|254|0|733|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|255|0|736|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|256|0|743|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|670000|607500|0|0|0|0|1393|Reformat-1|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|257|0|745|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|258|0|748|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|259|0|750|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|260|0|752|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|261|0|754|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|262|0|757|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|263|0|759|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|264|0|763|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|265|0|766|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|266|0|769|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|267|0|772|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|268|0|779|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|major_key|$NK_CHILD_TABLE|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|$MINOR_KEY|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|1473000|258500|0|0|0|0|1533|Sort within Groups : Minor Key(parent sk)|Ab Initio Software|Built-in 2.1.7:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|269|0|781|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|270|0|784|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|271|0|787|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|major_key||19|2|RFK$|Input is assumed to be sorted on this key|{0|}}
{30001002|XXparameter|major_key.display_name|major-key|3|9|P|@{0|}}
{30001002|XXparameter|major_key.keyword|major-key|3|9|P|@{0|}}
{30001002|XXparameter|minor_key||19|2|RFK$|Input will be sorted within groups on this key|{0|}}
{30001002|XXparameter|minor_key.display_name|minor-key|3|9|P|@{0|}}
{30001002|XXparameter|minor_key.keyword|minor-key|3|9|P|@{0|}}
{30001002|XXparameter|max_core|10485760|1|2|FK$|maximum memory usage in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|allow_unsorted|false|13|1|FKl|Allows input not sorted by major key|{0|}}
{30001002|XXparameter|allow_unsorted.display_name|allow-unsorted|3|9|P|@{0|}}
{30001002|XXparameter|allow_unsorted.keyword|allow-unsorted|3|9|P|@{0|}}
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
}}@0|Sort within Groups|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|272|0|789|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|273|0|792|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|274|0|798|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Trash|1112000|82500|0|0|0|0|1377|Trash|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|275|0|800|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|276|0|803|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|277|0|805|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010110002|XXGconstant|278|0|811|0|{@{}@{1|32774|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010244001|XXGflow_watcher_watcher|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_10|}1|7|}
{2010244001|XXGflow_watcher_watcher|7|0|14|0|{}7|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_11|}1|9|}
{2010244001|XXGflow_watcher_watcher|9|0|18|0|{}9|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_12|}1|11|}
{2010244001|XXGflow_watcher_watcher|11|0|22|0|{}11|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_13|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_14|}1|14|}
{2010244001|XXGflow_watcher_watcher|14|0|28|0|{}14|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_2|}1|16|}
{2010244001|XXGflow_watcher_watcher|16|0|32|0|{}16|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_20|}1|18|}
{2010244001|XXGflow_watcher_watcher|18|0|36|0|{}18|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_21|}1|20|}
{2010244001|XXGflow_watcher_watcher|20|0|40|0|{}20|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_28|}1|22|}
{2010244001|XXGflow_watcher_watcher|22|0|44|0|{}22|23|}
{2010604001|XXGgraph_flow_flow|23|0|46|0|{Flow_3|}1|24|}
{2010604001|XXGgraph_flow_flow|24|0|48|0|{Flow_30|}1|25|}
{2010244001|XXGflow_watcher_watcher|25|0|50|0|{}25|26|}
{2010604001|XXGgraph_flow_flow|26|0|52|0|{Flow_32|}1|27|}
{2010604001|XXGgraph_flow_flow|27|0|54|0|{Flow_4|}1|28|}
{2010244001|XXGflow_watcher_watcher|28|0|56|0|{}28|29|}
{2010604001|XXGgraph_flow_flow|29|0|58|0|{Flow_5|}1|30|}
{2010244001|XXGflow_watcher_watcher|30|0|60|0|{}30|31|}
{2010604001|XXGgraph_flow_flow|31|0|62|0|{Flow_6|}1|32|}
{2010604001|XXGgraph_flow_flow|32|0|64|0|{Flow_7|}1|33|}
{2010604001|XXGgraph_flow_flow|33|0|66|0|{Flow_8|}1|34|}
{2010244001|XXGflow_watcher_watcher|34|0|68|0|{}34|35|}
{2010604001|XXGgraph_flow_flow|35|0|70|0|{Flow_9|}1|36|}
{2010244001|XXGflow_watcher_watcher|36|0|72|0|{}36|37|}
{2010601001|XXGgraph_vertex_vertex|37|0|74|0|{Child_Table_IDS_File|}1|38|}
{2010212001|XXGvertex_oport_oport|38|0|76|0|{0|read|}38|39|}
{2010213001|XXGoport_dst_flow|39|0|78|0|{0|}39|5|}
{2010007001|XXGobject_proto_object|40|0|79|0|{}38|40|}
{2010212001|XXGvertex_oport_oport|41|0|81|0|{0|read|}40|41|}
{2010006001|XXGobject_psameas_object|42|0|83|0|{metadata|read_metadata|1|0|}41|40|}
{2010601001|XXGgraph_vertex_vertex|43|0|84|0|{Child_Table_IDS_File_Fixed_|}1|42|}
{2010211001|XXGvertex_iport_iport|44|0|86|0|{0|write|}42|43|}
{2010214001|XXGiport_src_flow|45|0|88|0|{0|}43|25|}
{2010007001|XXGobject_proto_object|46|0|89|0|{}42|44|}
{2010211001|XXGvertex_iport_iport|47|0|91|0|{0|write|}44|45|}
{2010006001|XXGobject_psameas_object|48|0|93|0|{metadata|write_metadata|1|0|}45|44|}
{2010601001|XXGgraph_vertex_vertex|49|0|94|0|{Dedup_Sorted_on_child_table_NK|}1|46|}
{2010212001|XXGvertex_oport_oport|50|0|96|0|{0|out|}46|47|}
{2010213001|XXGoport_dst_flow|51|0|98|0|{0|}47|7|}
{2010212001|XXGvertex_oport_oport|52|0|99|0|{1|dup|}46|48|}
{2010212001|XXGvertex_oport_oport|53|0|101|0|{2|reject|}46|49|}
{2010212001|XXGvertex_oport_oport|54|0|103|0|{3|error|}46|50|}
{2010212001|XXGvertex_oport_oport|55|0|105|0|{4|log|}46|51|}
{2010211001|XXGvertex_iport_iport|56|0|107|0|{0|in|}46|52|}
{2010214001|XXGiport_src_flow|57|0|109|0|{0|}52|20|}
{2010007001|XXGobject_proto_object|58|0|110|0|{}46|53|}
{2010212001|XXGvertex_oport_oport|59|0|112|0|{0|out|}53|54|}
{2010006001|XXGobject_psameas_object|60|0|114|0|{metadata|out_metadata|1|0|}54|53|}
{2010212001|XXGvertex_oport_oport|61|0|115|0|{1|dup|}53|55|}
{2010006001|XXGobject_psameas_object|62|0|117|0|{metadata|dup_metadata|1|0|}55|53|}
{2010212001|XXGvertex_oport_oport|63|0|118|0|{2|reject|}53|56|}
{2010006001|XXGobject_psameas_object|64|0|120|0|{metadata|reject_metadata|1|0|}56|53|}
{2010212001|XXGvertex_oport_oport|65|0|121|0|{3|error|}53|57|}
{2010006001|XXGobject_psameas_object|66|0|123|0|{metadata|error_metadata|1|0|}57|53|}
{2010212001|XXGvertex_oport_oport|67|0|124|0|{4|log|}53|58|}
{2010006001|XXGobject_psameas_object|68|0|126|0|{metadata|log_metadata|1|0|}58|53|}
{2010211001|XXGvertex_iport_iport|69|0|127|0|{0|in|}53|59|}
{2010006001|XXGobject_psameas_object|70|0|129|0|{metadata|in_metadata|1|0|}59|53|}
{2010006001|XXGobject_psameas_object|71|0|130|0|{Layout|Layout|0|0|}46|38|}
{2010006001|XXGobject_psameas_object|72|0|131|0|{dup_metadata|read_metadata|0|0|}46|38|}
{2010006001|XXGobject_psameas_object|73|0|132|0|{in_metadata|read_metadata|0|0|}46|38|}
{2010006001|XXGobject_psameas_object|74|0|133|0|{out_metadata|read_metadata|0|0|}46|38|}
{2010006001|XXGobject_psameas_object|75|0|134|0|{reject_metadata|read_metadata|0|0|}46|38|}
{2010601001|XXGgraph_vertex_vertex|76|0|135|0|{FBE|}1|60|}
{2010212001|XXGvertex_oport_oport|77|0|137|0|{0|out|}60|61|}
{2010213001|XXGoport_dst_flow|78|0|139|0|{0|}61|30|}
{2010212001|XXGvertex_oport_oport|79|0|140|0|{1|deselect|}60|62|}
{2010213001|XXGoport_dst_flow|80|0|142|0|{0|}62|11|}
{2010212001|XXGvertex_oport_oport|81|0|143|0|{2|reject|}60|63|}
{2010212001|XXGvertex_oport_oport|82|0|145|0|{3|error|}60|64|}
{2010212001|XXGvertex_oport_oport|83|0|147|0|{4|log|}60|65|}
{2010211001|XXGvertex_iport_iport|84|0|149|0|{0|in|}60|66|}
{2010214001|XXGiport_src_flow|85|0|151|0|{0|}66|18|}
{2010007001|XXGobject_proto_object|86|0|152|0|{}60|67|}
{2010212001|XXGvertex_oport_oport|87|0|154|0|{0|out|}67|68|}
{2010006001|XXGobject_psameas_object|88|0|156|0|{metadata|out_metadata|1|0|}68|67|}
{2010212001|XXGvertex_oport_oport|89|0|157|0|{1|deselect|}67|69|}
{2010006001|XXGobject_psameas_object|90|0|159|0|{metadata|deselect_metadata|1|0|}69|67|}
{2010212001|XXGvertex_oport_oport|91|0|160|0|{2|reject|}67|70|}
{2010006001|XXGobject_psameas_object|92|0|162|0|{metadata|reject_metadata|1|0|}70|67|}
{2010212001|XXGvertex_oport_oport|93|0|163|0|{3|error|}67|71|}
{2010006001|XXGobject_psameas_object|94|0|165|0|{metadata|error_metadata|1|0|}71|67|}
{2010212001|XXGvertex_oport_oport|95|0|166|0|{4|log|}67|72|}
{2010006001|XXGobject_psameas_object|96|0|168|0|{metadata|log_metadata|1|0|}72|67|}
{2010211001|XXGvertex_iport_iport|97|0|169|0|{0|in|}67|73|}
{2010006001|XXGobject_psameas_object|98|0|171|0|{metadata|in_metadata|1|0|}73|67|}
{2010006001|XXGobject_psameas_object|99|0|172|0|{Layout|Layout|0|0|}60|38|}
{2010006001|XXGobject_psameas_object|100|0|173|0|{in_metadata|out_metadata|0|0|}60|74|}
{2010212001|XXGvertex_oport_oport|101|0|175|0|{0|out|}74|75|}
{2010213001|XXGoport_dst_flow|102|0|177|0|{0|}75|28|}
{2010212001|XXGvertex_oport_oport|103|0|178|0|{1|unused0|}74|76|}
{2010213001|XXGoport_dst_flow|104|0|180|0|{0|}76|24|}
{2010212001|XXGvertex_oport_oport|105|0|181|0|{2|unused1|}74|77|}
{2010212001|XXGvertex_oport_oport|106|0|183|0|{3|reject0|}74|78|}
{2010212001|XXGvertex_oport_oport|107|0|185|0|{4|reject1|}74|79|}
{2010212001|XXGvertex_oport_oport|108|0|187|0|{5|error0|}74|80|}
{2010212001|XXGvertex_oport_oport|109|0|189|0|{6|error1|}74|81|}
{2010212001|XXGvertex_oport_oport|110|0|191|0|{7|log|}74|82|}
{2010211001|XXGvertex_iport_iport|111|0|193|0|{0|in0|}74|83|}
{2010214001|XXGiport_src_flow|112|0|195|0|{0|}83|16|}
{2010211001|XXGvertex_iport_iport|113|0|196|0|{1|in1|}74|84|}
{2010214001|XXGiport_src_flow|114|0|198|0|{0|}84|32|}
{2010007001|XXGobject_proto_object|115|0|199|0|{}74|85|}
{2010212001|XXGvertex_oport_oport|116|0|201|0|{0|out|}85|86|}
{2010006001|XXGobject_psameas_object|117|0|203|0|{metadata|out_metadata|1|0|}86|85|}
{2010212001|XXGvertex_oport_oport|118|0|204|0|{1|unused0|}85|87|}
{2010006001|XXGobject_psameas_object|119|0|206|0|{metadata|unused0_metadata|1|0|}87|85|}
{2010212001|XXGvertex_oport_oport|120|0|207|0|{2|unused1|}85|88|}
{2010006001|XXGobject_psameas_object|121|0|209|0|{metadata|unused1_metadata|1|0|}88|85|}
{2010212001|XXGvertex_oport_oport|122|0|210|0|{3|reject0|}85|89|}
{2010006001|XXGobject_psameas_object|123|0|212|0|{metadata|reject0_metadata|1|0|}89|85|}
{2010212001|XXGvertex_oport_oport|124|0|213|0|{4|reject1|}85|90|}
{2010006001|XXGobject_psameas_object|125|0|215|0|{metadata|reject1_metadata|1|0|}90|85|}
{2010212001|XXGvertex_oport_oport|126|0|216|0|{5|error0|}85|91|}
{2010006001|XXGobject_psameas_object|127|0|218|0|{metadata|error0_metadata|1|0|}91|85|}
{2010212001|XXGvertex_oport_oport|128|0|219|0|{6|error1|}85|92|}
{2010006001|XXGobject_psameas_object|129|0|221|0|{metadata|error1_metadata|1|0|}92|85|}
{2010212001|XXGvertex_oport_oport|130|0|222|0|{7|log|}85|93|}
{2010006001|XXGobject_psameas_object|131|0|224|0|{metadata|log_metadata|1|0|}93|85|}
{2010211001|XXGvertex_iport_iport|132|0|225|0|{0|in0|}85|94|}
{2010006001|XXGobject_psameas_object|133|0|227|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|1|0|}94|85|}
{2010006001|XXGobject_psameas_object|134|0|228|0|{dedup0|dedup0|1|0|}94|85|}
{2010006001|XXGobject_psameas_object|135|0|229|0|{dedup_keyword0|dedup_keyword0|1|0|}94|85|}
{2010006001|XXGobject_psameas_object|136|0|230|0|{dedup_positional0|dedup_positional0|1|0|}94|85|}
{2010006001|XXGobject_psameas_object|137|0|231|0|{matchoptional_keyword0|matchoptional_keyword0|1|0|}94|85|}
{2010006001|XXGobject_psameas_object|138|0|232|0|{matchoptional_positional0|matchoptional_positional0|1|0|}94|85|}
{2010006001|XXGobject_psameas_object|139|0|233|0|{metadata|in0_metadata|1|0|}94|85|}
{2010006001|XXGobject_psameas_object|140|0|234|0|{override_key0|override_key0|1|0|}94|85|}
{2010006001|XXGobject_psameas_object|141|0|235|0|{record_match_required0|record_match_required0|1|0|}94|85|}
{2010006001|XXGobject_psameas_object|142|0|236|0|{record_match_required_not0|record_match_required_not0|1|0|}94|85|}
{2010006001|XXGobject_psameas_object|143|0|237|0|{record_required0|record_required0|1|0|}94|85|}
{2010006001|XXGobject_psameas_object|144|0|238|0|{record_required_keyword0|record_required_keyword0|1|0|}94|85|}
{2010006001|XXGobject_psameas_object|145|0|239|0|{record_required_positional0|record_required_positional0|1|0|}94|85|}
{2010006001|XXGobject_psameas_object|146|0|240|0|{select0|select0|1|0|}94|85|}
{2010006001|XXGobject_psameas_object|147|0|241|0|{select_keyword0|select_keyword0|1|0|}94|85|}
{2010006001|XXGobject_psameas_object|148|0|242|0|{select_positional0|select_positional0|1|0|}94|85|}
{2010211001|XXGvertex_iport_iport|149|0|243|0|{1|in1|}85|95|}
{2010006001|XXGobject_psameas_object|150|0|245|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|1|0|}95|85|}
{2010006001|XXGobject_psameas_object|151|0|246|0|{dedup1|dedup1|1|0|}95|85|}
{2010006001|XXGobject_psameas_object|152|0|247|0|{dedup_keyword1|dedup_keyword1|1|0|}95|85|}
{2010006001|XXGobject_psameas_object|153|0|248|0|{dedup_positional1|dedup_positional1|1|0|}95|85|}
{2010006001|XXGobject_psameas_object|154|0|249|0|{matchoptional_keyword1|matchoptional_keyword1|1|0|}95|85|}
{2010006001|XXGobject_psameas_object|155|0|250|0|{matchoptional_positional1|matchoptional_positional1|1|0|}95|85|}
{2010006001|XXGobject_psameas_object|156|0|251|0|{metadata|in1_metadata|1|0|}95|85|}
{2010006001|XXGobject_psameas_object|157|0|252|0|{override_key1|override_key1|1|0|}95|85|}
{2010006001|XXGobject_psameas_object|158|0|253|0|{record_match_required1|record_match_required1|1|0|}95|85|}
{2010006001|XXGobject_psameas_object|159|0|254|0|{record_match_required_not1|record_match_required_not1|1|0|}95|85|}
{2010006001|XXGobject_psameas_object|160|0|255|0|{record_required1|record_required1|1|0|}95|85|}
{2010006001|XXGobject_psameas_object|161|0|256|0|{record_required_keyword1|record_required_keyword1|1|0|}95|85|}
{2010006001|XXGobject_psameas_object|162|0|257|0|{record_required_positional1|record_required_positional1|1|0|}95|85|}
{2010006001|XXGobject_psameas_object|163|0|258|0|{select1|select1|1|0|}95|85|}
{2010006001|XXGobject_psameas_object|164|0|259|0|{select_keyword1|select_keyword1|1|0|}95|85|}
{2010006001|XXGobject_psameas_object|165|0|260|0|{select_positional1|select_positional1|1|0|}95|85|}
{2010006001|XXGobject_psameas_object|166|0|261|0|{Layout|Layout|0|0|}74|38|}
{2010006001|XXGobject_psameas_object|167|0|262|0|{in0_metadata|out0_metadata|0|0|}74|96|}
{2010212001|XXGvertex_oport_oport|168|0|264|0|{0|out0|}96|97|}
{2010213001|XXGoport_dst_flow|169|0|266|0|{0|}97|13|}
{2010212001|XXGvertex_oport_oport|170|0|267|0|{1|reject0|}96|98|}
{2010212001|XXGvertex_oport_oport|171|0|269|0|{2|error0|}96|99|}
{2010212001|XXGvertex_oport_oport|172|0|271|0|{3|log|}96|100|}
{2010211001|XXGvertex_iport_iport|173|0|273|0|{0|in|}96|101|}
{2010214001|XXGiport_src_flow|174|0|275|0|{0|}101|36|}
{2010007001|XXGobject_proto_object|175|0|276|0|{}96|102|}
{2010212001|XXGvertex_oport_oport|176|0|278|0|{0|out0|}102|103|}
{2010006001|XXGobject_psameas_object|177|0|280|0|{metadata|out0_metadata|1|0|}103|102|}
{2010006001|XXGobject_psameas_object|178|0|281|0|{transform0|transform0|1|0|}103|102|}
{2010212001|XXGvertex_oport_oport|179|0|282|0|{1|reject0|}102|104|}
{2010006001|XXGobject_psameas_object|180|0|284|0|{metadata|reject0_metadata|1|0|}104|102|}
{2010212001|XXGvertex_oport_oport|181|0|285|0|{2|error0|}102|105|}
{2010006001|XXGobject_psameas_object|182|0|287|0|{metadata|error0_metadata|1|0|}105|102|}
{2010212001|XXGvertex_oport_oport|183|0|288|0|{3|log|}102|106|}
{2010006001|XXGobject_psameas_object|184|0|290|0|{metadata|log_metadata|1|0|}106|102|}
{2010211001|XXGvertex_iport_iport|185|0|291|0|{0|in|}102|107|}
{2010006001|XXGobject_psameas_object|186|0|293|0|{metadata|in_metadata|1|0|}107|102|}
{2010006001|XXGobject_psameas_object|187|0|294|0|{Layout|Layout|0|0|}96|38|}
{2010006001|XXGobject_psameas_object|188|0|295|0|{in_metadata|read_metadata|0|0|}96|38|}
{2010006001|XXGobject_psameas_object|189|0|296|0|{reject0_metadata|read_metadata|0|0|}96|38|}
{2010006001|XXGobject_psameas_object|190|0|297|0|{in1_metadata|read_metadata|0|0|}74|108|}
{2010212001|XXGvertex_oport_oport|191|0|299|0|{0|read|}108|109|}
{2010213001|XXGoport_dst_flow|192|0|301|0|{0|}109|33|}
{2010007001|XXGobject_proto_object|193|0|302|0|{}108|110|}
{2010212001|XXGvertex_oport_oport|194|0|304|0|{0|read|}110|111|}
{2010006001|XXGobject_psameas_object|195|0|306|0|{metadata|read_metadata|1|0|}111|110|}
{2010006001|XXGobject_psameas_object|196|0|307|0|{reject0_metadata|out0_metadata|0|0|}74|96|}
{2010006001|XXGobject_psameas_object|197|0|308|0|{reject1_metadata|read_metadata|0|0|}74|108|}
{2010006001|XXGobject_psameas_object|198|0|309|0|{unused0_metadata|out0_metadata|0|0|}74|96|}
{2010006001|XXGobject_psameas_object|199|0|310|0|{unused1_metadata|read_metadata|0|0|}74|108|}
{2010006001|XXGobject_psameas_object|200|0|311|0|{reject_metadata|out_metadata|0|0|}60|74|}
{2010601001|XXGgraph_vertex_vertex|201|0|312|0|{Filter_by_Expression|}1|112|}
{2010212001|XXGvertex_oport_oport|202|0|314|0|{0|out|}112|113|}
{2010213001|XXGoport_dst_flow|203|0|316|0|{0|}113|36|}
{2010212001|XXGvertex_oport_oport|204|0|317|0|{1|deselect|}112|114|}
{2010213001|XXGoport_dst_flow|205|0|319|0|{0|}114|14|}
{2010212001|XXGvertex_oport_oport|206|0|320|0|{2|reject|}112|115|}
{2010212001|XXGvertex_oport_oport|207|0|322|0|{3|error|}112|116|}
{2010212001|XXGvertex_oport_oport|208|0|324|0|{4|log|}112|117|}
{2010211001|XXGvertex_iport_iport|209|0|326|0|{0|in|}112|118|}
{2010214001|XXGiport_src_flow|210|0|328|0|{0|}118|5|}
{2010007001|XXGobject_proto_object|211|0|329|0|{}112|119|}
{2010212001|XXGvertex_oport_oport|212|0|331|0|{0|out|}119|120|}
{2010006001|XXGobject_psameas_object|213|0|333|0|{metadata|out_metadata|1|0|}120|119|}
{2010212001|XXGvertex_oport_oport|214|0|334|0|{1|deselect|}119|121|}
{2010006001|XXGobject_psameas_object|215|0|336|0|{metadata|deselect_metadata|1|0|}121|119|}
{2010212001|XXGvertex_oport_oport|216|0|337|0|{2|reject|}119|122|}
{2010006001|XXGobject_psameas_object|217|0|339|0|{metadata|reject_metadata|1|0|}122|119|}
{2010212001|XXGvertex_oport_oport|218|0|340|0|{3|error|}119|123|}
{2010006001|XXGobject_psameas_object|219|0|342|0|{metadata|error_metadata|1|0|}123|119|}
{2010212001|XXGvertex_oport_oport|220|0|343|0|{4|log|}119|124|}
{2010006001|XXGobject_psameas_object|221|0|345|0|{metadata|log_metadata|1|0|}124|119|}
{2010211001|XXGvertex_iport_iport|222|0|346|0|{0|in|}119|125|}
{2010006001|XXGobject_psameas_object|223|0|348|0|{metadata|in_metadata|1|0|}125|119|}
{2010006001|XXGobject_psameas_object|224|0|349|0|{Layout|Layout|0|0|}112|38|}
{2010006001|XXGobject_psameas_object|225|0|350|0|{deselect_metadata|read_metadata|0|0|}112|38|}
{2010006001|XXGobject_psameas_object|226|0|351|0|{in_metadata|read_metadata|0|0|}112|38|}
{2010006001|XXGobject_psameas_object|227|0|352|0|{out_metadata|read_metadata|0|0|}112|38|}
{2010006001|XXGobject_psameas_object|228|0|353|0|{reject_metadata|read_metadata|0|0|}112|38|}
{2010601001|XXGgraph_vertex_vertex|229|0|354|0|{Index_file_for_Child_Table|}1|126|}
{2010211001|XXGvertex_iport_iport|230|0|356|0|{0|write|}126|127|}
{2010214001|XXGiport_src_flow|231|0|358|0|{0|}127|27|}
{2010007001|XXGobject_proto_object|232|0|359|0|{}126|128|}
{2010211001|XXGvertex_iport_iport|233|0|361|0|{0|write|}128|129|}
{2010006001|XXGobject_psameas_object|234|0|363|0|{metadata|write_metadata|1|0|}129|128|}
{2010006001|XXGobject_psameas_object|235|0|364|0|{write_metadata|index_metadata|0|0|}126|130|}
{2010212001|XXGvertex_oport_oport|236|0|366|0|{0|out|}130|131|}
{2010213001|XXGoport_dst_flow|237|0|368|0|{0|}131|25|}
{2010212001|XXGvertex_oport_oport|238|0|369|0|{1|index|}130|132|}
{2010213001|XXGoport_dst_flow|239|0|371|0|{0|}132|27|}
{2010212001|XXGvertex_oport_oport|240|0|372|0|{2|address|}130|133|}
{2010211001|XXGvertex_iport_iport|241|0|374|0|{0|in|}130|134|}
{2010214001|XXGiport_src_flow|242|0|376|0|{0|}134|22|}
{2010007001|XXGobject_proto_object|243|0|377|0|{}130|135|}
{2010212001|XXGvertex_oport_oport|244|0|379|0|{0|out|}135|136|}
{2010006001|XXGobject_psameas_object|245|0|381|0|{metadata|out_metadata|1|0|}136|135|}
{2010212001|XXGvertex_oport_oport|246|0|382|0|{1|index|}135|137|}
{2010006001|XXGobject_psameas_object|247|0|384|0|{metadata|index_metadata|1|0|}137|135|}
{2010212001|XXGvertex_oport_oport|248|0|385|0|{2|address|}135|138|}
{2010006001|XXGobject_psameas_object|249|0|387|0|{metadata|address_metadata|1|0|}138|135|}
{2010211001|XXGvertex_iport_iport|250|0|388|0|{0|in|}135|139|}
{2010006001|XXGobject_psameas_object|251|0|390|0|{metadata|in_metadata|1|0|}139|135|}
{2010006001|XXGobject_psameas_object|252|0|391|0|{Layout|Layout|0|0|}130|42|}
{2010006001|XXGobject_psameas_object|253|0|392|0|{in_metadata|read_metadata|0|0|}130|38|}
{2010006001|XXGobject_psameas_object|254|0|393|0|{out_metadata|write_metadata|0|0|}130|42|}
{2010601001|XXGgraph_vertex_vertex|255|0|394|0|{Join_on_id|}1|74|}
{2010601001|XXGgraph_vertex_vertex|256|0|395|0|{Normalize_Duplicaing_records_parent_update_ts_child_update_ts_|}1|140|}
{2010212001|XXGvertex_oport_oport|257|0|397|0|{0|out|}140|141|}
{2010213001|XXGoport_dst_flow|258|0|399|0|{0|}141|18|}
{2010212001|XXGvertex_oport_oport|259|0|400|0|{1|reject|}140|142|}
{2010212001|XXGvertex_oport_oport|260|0|402|0|{2|error|}140|143|}
{2010212001|XXGvertex_oport_oport|261|0|404|0|{3|log|}140|144|}
{2010211001|XXGvertex_iport_iport|262|0|406|0|{0|in|}140|145|}
{2010214001|XXGiport_src_flow|263|0|408|0|{0|}145|28|}
{2010007001|XXGobject_proto_object|264|0|409|0|{}140|146|}
{2010212001|XXGvertex_oport_oport|265|0|411|0|{0|out|}146|147|}
{2010006001|XXGobject_psameas_object|266|0|413|0|{metadata|out_metadata|1|0|}147|146|}
{2010212001|XXGvertex_oport_oport|267|0|414|0|{1|reject|}146|148|}
{2010006001|XXGobject_psameas_object|268|0|416|0|{metadata|reject_metadata|1|0|}148|146|}
{2010212001|XXGvertex_oport_oport|269|0|417|0|{2|error|}146|149|}
{2010006001|XXGobject_psameas_object|270|0|419|0|{metadata|error_metadata|1|0|}149|146|}
{2010212001|XXGvertex_oport_oport|271|0|420|0|{3|log|}146|150|}
{2010006001|XXGobject_psameas_object|272|0|422|0|{metadata|log_metadata|1|0|}150|146|}
{2010211001|XXGvertex_iport_iport|273|0|423|0|{0|in|}146|151|}
{2010006001|XXGobject_psameas_object|274|0|425|0|{metadata|in_metadata|1|0|}151|146|}
{2010006001|XXGobject_psameas_object|275|0|426|0|{Layout|Layout|0|0|}140|38|}
{2010006001|XXGobject_psameas_object|276|0|427|0|{in_metadata|out_metadata|0|0|}140|74|}
{2010006001|XXGobject_psameas_object|277|0|428|0|{out_metadata|out_metadata|0|0|}140|74|}
{2010006001|XXGobject_psameas_object|278|0|429|0|{reject_metadata|out_metadata|0|0|}140|74|}
{2010601001|XXGgraph_vertex_vertex|279|0|430|0|{PBKS1_on_id|}1|152|}
{2010604001|XXGgraph_flow_flow|280|0|432|0|{Flow_1|}152|153|}
{2010601001|XXGgraph_vertex_vertex|281|0|434|0|{Partition_by_Key|}152|154|}
{2010212001|XXGvertex_oport_oport|282|0|436|0|{0|out|}154|155|}
{2010213001|XXGoport_dst_flow|283|0|438|0|{0|}155|153|}
{2010211001|XXGvertex_iport_iport|284|0|439|0|{0|in|}154|156|}
{2010006001|XXGobject_psameas_object|285|0|441|0|{in_metadata|read_metadata|0|0|}154|108|}
{2010006001|XXGobject_psameas_object|286|0|442|0|{out_metadata|read_metadata|0|0|}154|108|}
{2010601001|XXGgraph_vertex_vertex|287|0|443|0|{Sort|}152|157|}
{2010212001|XXGvertex_oport_oport|288|0|445|0|{0|out|}157|158|}
{2010211001|XXGvertex_iport_iport|289|0|447|0|{0|in|}157|159|}
{2010214001|XXGiport_src_flow|290|0|449|0|{0|}159|153|}
{2010006001|XXGobject_psameas_object|291|0|450|0|{in_metadata|read_metadata|0|0|}157|108|}
{2010006001|XXGobject_psameas_object|292|0|451|0|{out_metadata|read_metadata|0|0|}157|108|}
{2010212001|XXGvertex_oport_oport|293|0|452|0|{0|out0|}152|160|}
{2010216002|XXGoport_binding_oport|294|0|454|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}160|158|}
{2010213001|XXGoport_dst_flow|295|0|455|0|{0|}160|32|}
{2010211001|XXGvertex_iport_iport|296|0|456|0|{0|in0|}152|161|}
{2010215002|XXGiport_binding_iport|297|0|458|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}161|156|}
{2010214001|XXGiport_src_flow|298|0|459|0|{0|}161|33|}
{2010007001|XXGobject_proto_object|299|0|460|0|{}152|162|}
{2010604001|XXGgraph_flow_flow|300|0|462|0|{Flow_1|}162|163|}
{2010601001|XXGgraph_vertex_vertex|301|0|464|0|{Partition_by_Key|}162|164|}
{2010212001|XXGvertex_oport_oport|302|0|466|0|{0|out|}164|165|}
{2010213001|XXGoport_dst_flow|303|0|468|0|{0|}165|163|}
{2010211001|XXGvertex_iport_iport|304|0|469|0|{0|in|}164|166|}
{2010007001|XXGobject_proto_object|305|0|471|0|{}164|167|}
{2010212001|XXGvertex_oport_oport|306|0|473|0|{0|out|}167|168|}
{2010006001|XXGobject_psameas_object|307|0|475|0|{metadata|out_metadata|1|0|}168|167|}
{2010211001|XXGvertex_iport_iport|308|0|476|0|{0|in|}167|169|}
{2010006001|XXGobject_psameas_object|309|0|478|0|{metadata|in_metadata|1|0|}169|167|}
{2010006001|XXGobject_psameas_object|310|0|479|0|{Layout|InputLayout|1|0|}164|162|}
{2010006001|XXGobject_psameas_object|311|0|480|0|{key|Key|1|0|}164|162|}
{2010601001|XXGgraph_vertex_vertex|312|0|481|0|{Sort|}162|170|}
{2010212001|XXGvertex_oport_oport|313|0|483|0|{0|out|}170|171|}
{2010211001|XXGvertex_iport_iport|314|0|485|0|{0|in|}170|172|}
{2010214001|XXGiport_src_flow|315|0|487|0|{0|}172|163|}
{2010007001|XXGobject_proto_object|316|0|488|0|{}170|173|}
{2010212001|XXGvertex_oport_oport|317|0|490|0|{0|out|}173|174|}
{2010006001|XXGobject_psameas_object|318|0|492|0|{metadata|out_metadata|1|0|}174|173|}
{2010211001|XXGvertex_iport_iport|319|0|493|0|{0|in|}173|175|}
{2010006001|XXGobject_psameas_object|320|0|495|0|{metadata|in_metadata|1|0|}175|173|}
{2010006001|XXGobject_psameas_object|321|0|496|0|{Layout|OutputLayout|1|0|}170|162|}
{2010006001|XXGobject_psameas_object|322|0|497|0|{key|Key|1|0|}170|162|}
{2010006001|XXGobject_psameas_object|323|0|498|0|{max_core|Max_core|1|0|}170|162|}
{2010212001|XXGvertex_oport_oport|324|0|499|0|{0|out0|}162|176|}
{2010216002|XXGoport_binding_oport|325|0|501|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}176|171|}
{2010211001|XXGvertex_iport_iport|326|0|502|0|{0|in0|}162|177|}
{2010215002|XXGiport_binding_iport|327|0|504|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}177|166|}
{2010006001|XXGobject_psameas_object|328|0|505|0|{InputLayout|Layout|0|0|}152|108|}
{2010006001|XXGobject_psameas_object|329|0|506|0|{OutputLayout|Layout|0|0|}152|38|}
{2010601001|XXGgraph_vertex_vertex|330|0|507|0|{PBKS_on_ICFF_Key|}1|178|}
{2010604001|XXGgraph_flow_flow|331|0|509|0|{Flow_1|}178|179|}
{2010601001|XXGgraph_vertex_vertex|332|0|511|0|{Partition_by_Key|}178|180|}
{2010212001|XXGvertex_oport_oport|333|0|513|0|{0|out|}180|181|}
{2010213001|XXGoport_dst_flow|334|0|515|0|{0|}181|179|}
{2010211001|XXGvertex_iport_iport|335|0|516|0|{0|in|}180|182|}
{2010006001|XXGobject_psameas_object|336|0|518|0|{in_metadata|read_metadata|0|0|}180|38|}
{2010006001|XXGobject_psameas_object|337|0|519|0|{out_metadata|read_metadata|0|0|}180|38|}
{2010601001|XXGgraph_vertex_vertex|338|0|520|0|{Sort|}178|183|}
{2010212001|XXGvertex_oport_oport|339|0|522|0|{0|out|}183|184|}
{2010211001|XXGvertex_iport_iport|340|0|524|0|{0|in|}183|185|}
{2010214001|XXGiport_src_flow|341|0|526|0|{0|}185|179|}
{2010006001|XXGobject_psameas_object|342|0|527|0|{in_metadata|read_metadata|0|0|}183|38|}
{2010006001|XXGobject_psameas_object|343|0|528|0|{out_metadata|read_metadata|0|0|}183|38|}
{2010212001|XXGvertex_oport_oport|344|0|529|0|{0|out0|}178|186|}
{2010216002|XXGoport_binding_oport|345|0|531|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}186|184|}
{2010213001|XXGoport_dst_flow|346|0|532|0|{0|}186|22|}
{2010211001|XXGvertex_iport_iport|347|0|533|0|{0|in0|}178|187|}
{2010215002|XXGiport_binding_iport|348|0|535|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}187|182|}
{2010214001|XXGiport_src_flow|349|0|536|0|{0|}187|7|}
{2010214001|XXGiport_src_flow|350|0|537|0|{1|}187|9|}
{2010214001|XXGiport_src_flow|351|0|538|0|{2|}187|14|}
{2010007001|XXGobject_proto_object|352|0|539|0|{}178|188|}
{2010604001|XXGgraph_flow_flow|353|0|541|0|{Flow_1|}188|189|}
{2010601001|XXGgraph_vertex_vertex|354|0|543|0|{Partition_by_Key|}188|190|}
{2010212001|XXGvertex_oport_oport|355|0|545|0|{0|out|}190|191|}
{2010213001|XXGoport_dst_flow|356|0|547|0|{0|}191|189|}
{2010211001|XXGvertex_iport_iport|357|0|548|0|{0|in|}190|192|}
{2010007001|XXGobject_proto_object|358|0|550|0|{}190|193|}
{2010212001|XXGvertex_oport_oport|359|0|552|0|{0|out|}193|194|}
{2010006001|XXGobject_psameas_object|360|0|554|0|{metadata|out_metadata|1|0|}194|193|}
{2010211001|XXGvertex_iport_iport|361|0|555|0|{0|in|}193|195|}
{2010006001|XXGobject_psameas_object|362|0|557|0|{metadata|in_metadata|1|0|}195|193|}
{2010006001|XXGobject_psameas_object|363|0|558|0|{Layout|InputLayout|1|0|}190|188|}
{2010006001|XXGobject_psameas_object|364|0|559|0|{key|Key|1|0|}190|188|}
{2010601001|XXGgraph_vertex_vertex|365|0|560|0|{Sort|}188|196|}
{2010212001|XXGvertex_oport_oport|366|0|562|0|{0|out|}196|197|}
{2010211001|XXGvertex_iport_iport|367|0|564|0|{0|in|}196|198|}
{2010214001|XXGiport_src_flow|368|0|566|0|{0|}198|189|}
{2010007001|XXGobject_proto_object|369|0|567|0|{}196|199|}
{2010212001|XXGvertex_oport_oport|370|0|569|0|{0|out|}199|200|}
{2010006001|XXGobject_psameas_object|371|0|571|0|{metadata|out_metadata|1|0|}200|199|}
{2010211001|XXGvertex_iport_iport|372|0|572|0|{0|in|}199|201|}
{2010006001|XXGobject_psameas_object|373|0|574|0|{metadata|in_metadata|1|0|}201|199|}
{2010006001|XXGobject_psameas_object|374|0|575|0|{Layout|OutputLayout|1|0|}196|188|}
{2010006001|XXGobject_psameas_object|375|0|576|0|{key|Key|1|0|}196|188|}
{2010006001|XXGobject_psameas_object|376|0|577|0|{max_core|Max_core|1|0|}196|188|}
{2010212001|XXGvertex_oport_oport|377|0|578|0|{0|out0|}188|202|}
{2010216002|XXGoport_binding_oport|378|0|580|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}202|197|}
{2010211001|XXGvertex_iport_iport|379|0|581|0|{0|in0|}188|203|}
{2010215002|XXGiport_binding_iport|380|0|583|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}203|192|}
{2010006001|XXGobject_psameas_object|381|0|584|0|{InputLayout|Layout|0|0|}178|38|}
{2010006001|XXGobject_psameas_object|382|0|585|0|{OutputLayout|Layout|0|0|}178|42|}
{2010601001|XXGgraph_vertex_vertex|383|0|586|0|{PBKS_on_id|}1|204|}
{2010604001|XXGgraph_flow_flow|384|0|588|0|{Flow_1|}204|205|}
{2010601001|XXGgraph_vertex_vertex|385|0|590|0|{Partition_by_Key|}204|206|}
{2010212001|XXGvertex_oport_oport|386|0|592|0|{0|out|}206|207|}
{2010213001|XXGoport_dst_flow|387|0|594|0|{0|}207|205|}
{2010211001|XXGvertex_iport_iport|388|0|595|0|{0|in|}206|208|}
{2010006001|XXGobject_psameas_object|389|0|597|0|{in_metadata|out0_metadata|0|0|}206|96|}
{2010006001|XXGobject_psameas_object|390|0|598|0|{out_metadata|out0_metadata|0|0|}206|96|}
{2010601001|XXGgraph_vertex_vertex|391|0|599|0|{Sort|}204|209|}
{2010212001|XXGvertex_oport_oport|392|0|601|0|{0|out|}209|210|}
{2010211001|XXGvertex_iport_iport|393|0|603|0|{0|in|}209|211|}
{2010214001|XXGiport_src_flow|394|0|605|0|{0|}211|205|}
{2010006001|XXGobject_psameas_object|395|0|606|0|{in_metadata|out0_metadata|0|0|}209|96|}
{2010006001|XXGobject_psameas_object|396|0|607|0|{out_metadata|out0_metadata|0|0|}209|96|}
{2010212001|XXGvertex_oport_oport|397|0|608|0|{0|out0|}204|212|}
{2010216002|XXGoport_binding_oport|398|0|610|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}212|210|}
{2010213001|XXGoport_dst_flow|399|0|611|0|{0|}212|16|}
{2010211001|XXGvertex_iport_iport|400|0|612|0|{0|in0|}204|213|}
{2010215002|XXGiport_binding_iport|401|0|614|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}213|208|}
{2010214001|XXGiport_src_flow|402|0|615|0|{0|}213|13|}
{2010007001|XXGobject_proto_object|403|0|616|0|{}204|214|}
{2010604001|XXGgraph_flow_flow|404|0|618|0|{Flow_1|}214|215|}
{2010601001|XXGgraph_vertex_vertex|405|0|620|0|{Partition_by_Key|}214|216|}
{2010212001|XXGvertex_oport_oport|406|0|622|0|{0|out|}216|217|}
{2010213001|XXGoport_dst_flow|407|0|624|0|{0|}217|215|}
{2010211001|XXGvertex_iport_iport|408|0|625|0|{0|in|}216|218|}
{2010007001|XXGobject_proto_object|409|0|627|0|{}216|219|}
{2010212001|XXGvertex_oport_oport|410|0|629|0|{0|out|}219|220|}
{2010006001|XXGobject_psameas_object|411|0|631|0|{metadata|out_metadata|1|0|}220|219|}
{2010211001|XXGvertex_iport_iport|412|0|632|0|{0|in|}219|221|}
{2010006001|XXGobject_psameas_object|413|0|634|0|{metadata|in_metadata|1|0|}221|219|}
{2010006001|XXGobject_psameas_object|414|0|635|0|{Layout|InputLayout|1|0|}216|214|}
{2010006001|XXGobject_psameas_object|415|0|636|0|{key|Key|1|0|}216|214|}
{2010601001|XXGgraph_vertex_vertex|416|0|637|0|{Sort|}214|222|}
{2010212001|XXGvertex_oport_oport|417|0|639|0|{0|out|}222|223|}
{2010211001|XXGvertex_iport_iport|418|0|641|0|{0|in|}222|224|}
{2010214001|XXGiport_src_flow|419|0|643|0|{0|}224|215|}
{2010007001|XXGobject_proto_object|420|0|644|0|{}222|225|}
{2010212001|XXGvertex_oport_oport|421|0|646|0|{0|out|}225|226|}
{2010006001|XXGobject_psameas_object|422|0|648|0|{metadata|out_metadata|1|0|}226|225|}
{2010211001|XXGvertex_iport_iport|423|0|649|0|{0|in|}225|227|}
{2010006001|XXGobject_psameas_object|424|0|651|0|{metadata|in_metadata|1|0|}227|225|}
{2010006001|XXGobject_psameas_object|425|0|652|0|{Layout|OutputLayout|1|0|}222|214|}
{2010006001|XXGobject_psameas_object|426|0|653|0|{key|Key|1|0|}222|214|}
{2010006001|XXGobject_psameas_object|427|0|654|0|{max_core|Max_core|1|0|}222|214|}
{2010212001|XXGvertex_oport_oport|428|0|655|0|{0|out0|}214|228|}
{2010216002|XXGoport_binding_oport|429|0|657|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}228|223|}
{2010211001|XXGvertex_iport_iport|430|0|658|0|{0|in0|}214|229|}
{2010215002|XXGiport_binding_iport|431|0|660|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}229|218|}
{2010006001|XXGobject_psameas_object|432|0|661|0|{InputLayout|Layout|0|0|}204|38|}
{2010006001|XXGobject_psameas_object|433|0|662|0|{OutputLayout|Layout|0|0|}204|38|}
{2010601001|XXGgraph_vertex_vertex|434|0|663|0|{PBK_and_sort_on_CHILD_NK|}1|230|}
{2010604001|XXGgraph_flow_flow|435|0|665|0|{Flow_1|}230|231|}
{2010601001|XXGgraph_vertex_vertex|436|0|667|0|{Partition_by_Key|}230|232|}
{2010212001|XXGvertex_oport_oport|437|0|669|0|{0|out|}232|233|}
{2010213001|XXGoport_dst_flow|438|0|671|0|{0|}233|231|}
{2010211001|XXGvertex_iport_iport|439|0|672|0|{0|in|}232|234|}
{2010006001|XXGobject_psameas_object|440|0|674|0|{in_metadata|out_metadata|0|0|}232|60|}
{2010006001|XXGobject_psameas_object|441|0|675|0|{out_metadata|out_metadata|0|0|}232|60|}
{2010601001|XXGgraph_vertex_vertex|442|0|676|0|{Sort|}230|235|}
{2010212001|XXGvertex_oport_oport|443|0|678|0|{0|out|}235|236|}
{2010211001|XXGvertex_iport_iport|444|0|680|0|{0|in|}235|237|}
{2010214001|XXGiport_src_flow|445|0|682|0|{0|}237|231|}
{2010006001|XXGobject_psameas_object|446|0|683|0|{in_metadata|out_metadata|0|0|}235|60|}
{2010006001|XXGobject_psameas_object|447|0|684|0|{out_metadata|out_metadata|0|0|}235|60|}
{2010212001|XXGvertex_oport_oport|448|0|685|0|{0|out0|}230|238|}
{2010216002|XXGoport_binding_oport|449|0|687|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}238|236|}
{2010213001|XXGoport_dst_flow|450|0|688|0|{0|}238|34|}
{2010211001|XXGvertex_iport_iport|451|0|689|0|{0|in0|}230|239|}
{2010215002|XXGiport_binding_iport|452|0|691|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}239|234|}
{2010214001|XXGiport_src_flow|453|0|692|0|{0|}239|30|}
{2010007001|XXGobject_proto_object|454|0|693|0|{}230|240|}
{2010604001|XXGgraph_flow_flow|455|0|695|0|{Flow_1|}240|241|}
{2010601001|XXGgraph_vertex_vertex|456|0|697|0|{Partition_by_Key|}240|242|}
{2010212001|XXGvertex_oport_oport|457|0|699|0|{0|out|}242|243|}
{2010213001|XXGoport_dst_flow|458|0|701|0|{0|}243|241|}
{2010211001|XXGvertex_iport_iport|459|0|702|0|{0|in|}242|244|}
{2010007001|XXGobject_proto_object|460|0|704|0|{}242|245|}
{2010212001|XXGvertex_oport_oport|461|0|706|0|{0|out|}245|246|}
{2010006001|XXGobject_psameas_object|462|0|708|0|{metadata|out_metadata|1|0|}246|245|}
{2010211001|XXGvertex_iport_iport|463|0|709|0|{0|in|}245|247|}
{2010006001|XXGobject_psameas_object|464|0|711|0|{metadata|in_metadata|1|0|}247|245|}
{2010006001|XXGobject_psameas_object|465|0|712|0|{Layout|InputLayout|1|0|}242|240|}
{2010006001|XXGobject_psameas_object|466|0|713|0|{key|Key|1|0|}242|240|}
{2010601001|XXGgraph_vertex_vertex|467|0|714|0|{Sort|}240|248|}
{2010212001|XXGvertex_oport_oport|468|0|716|0|{0|out|}248|249|}
{2010211001|XXGvertex_iport_iport|469|0|718|0|{0|in|}248|250|}
{2010214001|XXGiport_src_flow|470|0|720|0|{0|}250|241|}
{2010007001|XXGobject_proto_object|471|0|721|0|{}248|251|}
{2010212001|XXGvertex_oport_oport|472|0|723|0|{0|out|}251|252|}
{2010006001|XXGobject_psameas_object|473|0|725|0|{metadata|out_metadata|1|0|}252|251|}
{2010211001|XXGvertex_iport_iport|474|0|726|0|{0|in|}251|253|}
{2010006001|XXGobject_psameas_object|475|0|728|0|{metadata|in_metadata|1|0|}253|251|}
{2010006001|XXGobject_psameas_object|476|0|729|0|{Layout|OutputLayout|1|0|}248|240|}
{2010006001|XXGobject_psameas_object|477|0|730|0|{key|Key|1|0|}248|240|}
{2010006001|XXGobject_psameas_object|478|0|731|0|{max_core|Max_core|1|0|}248|240|}
{2010212001|XXGvertex_oport_oport|479|0|732|0|{0|out0|}240|254|}
{2010216002|XXGoport_binding_oport|480|0|734|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}254|249|}
{2010211001|XXGvertex_iport_iport|481|0|735|0|{0|in0|}240|255|}
{2010215002|XXGiport_binding_iport|482|0|737|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}255|244|}
{2010006001|XXGobject_psameas_object|483|0|738|0|{InputLayout|Layout|0|0|}230|38|}
{2010006001|XXGobject_psameas_object|484|0|739|0|{OutputLayout|Layout|0|0|}230|38|}
{2010601001|XXGgraph_vertex_vertex|485|0|740|0|{Parent_Table_IDS_File|}1|108|}
{2010601001|XXGgraph_vertex_vertex|486|0|741|0|{Reformat|}1|96|}
{2010601001|XXGgraph_vertex_vertex|487|0|742|0|{Reformat_1|}1|256|}
{2010212001|XXGvertex_oport_oport|488|0|744|0|{0|out0|}256|257|}
{2010213001|XXGoport_dst_flow|489|0|746|0|{0|}257|9|}
{2010212001|XXGvertex_oport_oport|490|0|747|0|{1|reject0|}256|258|}
{2010212001|XXGvertex_oport_oport|491|0|749|0|{2|error0|}256|259|}
{2010212001|XXGvertex_oport_oport|492|0|751|0|{3|log|}256|260|}
{2010211001|XXGvertex_iport_iport|493|0|753|0|{0|in|}256|261|}
{2010214001|XXGiport_src_flow|494|0|755|0|{0|}261|24|}
{2010007001|XXGobject_proto_object|495|0|756|0|{}256|262|}
{2010212001|XXGvertex_oport_oport|496|0|758|0|{0|out0|}262|263|}
{2010006001|XXGobject_psameas_object|497|0|760|0|{metadata|out0_metadata|1|0|}263|262|}
{2010006001|XXGobject_psameas_object|498|0|761|0|{transform0|transform0|1|0|}263|262|}
{2010212001|XXGvertex_oport_oport|499|0|762|0|{1|reject0|}262|264|}
{2010006001|XXGobject_psameas_object|500|0|764|0|{metadata|reject0_metadata|1|0|}264|262|}
{2010212001|XXGvertex_oport_oport|501|0|765|0|{2|error0|}262|265|}
{2010006001|XXGobject_psameas_object|502|0|767|0|{metadata|error0_metadata|1|0|}265|262|}
{2010212001|XXGvertex_oport_oport|503|0|768|0|{3|log|}262|266|}
{2010006001|XXGobject_psameas_object|504|0|770|0|{metadata|log_metadata|1|0|}266|262|}
{2010211001|XXGvertex_iport_iport|505|0|771|0|{0|in|}262|267|}
{2010006001|XXGobject_psameas_object|506|0|773|0|{metadata|in_metadata|1|0|}267|262|}
{2010006001|XXGobject_psameas_object|507|0|774|0|{Layout|Layout|0|0|}256|38|}
{2010006001|XXGobject_psameas_object|508|0|775|0|{in_metadata|out0_metadata|0|0|}256|96|}
{2010006001|XXGobject_psameas_object|509|0|776|0|{out0_metadata|read_metadata|0|0|}256|38|}
{2010006001|XXGobject_psameas_object|510|0|777|0|{reject0_metadata|out0_metadata|0|0|}256|96|}
{2010601001|XXGgraph_vertex_vertex|511|0|778|0|{Sort_within_Groups_Minor_Key_parent_sk_|}1|268|}
{2010212001|XXGvertex_oport_oport|512|0|780|0|{0|out|}268|269|}
{2010213001|XXGoport_dst_flow|513|0|782|0|{0|}269|20|}
{2010211001|XXGvertex_iport_iport|514|0|783|0|{0|in|}268|270|}
{2010214001|XXGiport_src_flow|515|0|785|0|{0|}270|34|}
{2010007001|XXGobject_proto_object|516|0|786|0|{}268|271|}
{2010212001|XXGvertex_oport_oport|517|0|788|0|{0|out|}271|272|}
{2010006001|XXGobject_psameas_object|518|0|790|0|{metadata|out_metadata|1|0|}272|271|}
{2010211001|XXGvertex_iport_iport|519|0|791|0|{0|in|}271|273|}
{2010006001|XXGobject_psameas_object|520|0|793|0|{metadata|in_metadata|1|0|}273|271|}
{2010006001|XXGobject_psameas_object|521|0|794|0|{Layout|Layout|0|0|}268|38|}
{2010006001|XXGobject_psameas_object|522|0|795|0|{in_metadata|out_metadata|0|0|}268|60|}
{2010006001|XXGobject_psameas_object|523|0|796|0|{out_metadata|out_metadata|0|0|}268|60|}
{2010601001|XXGgraph_vertex_vertex|524|0|797|0|{Trash|}1|274|}
{2010211001|XXGvertex_iport_iport|525|0|799|0|{0|in|}274|275|}
{2010214001|XXGiport_src_flow|526|0|801|0|{0|}275|11|}
{2010007001|XXGobject_proto_object|527|0|802|0|{}274|276|}
{2010211001|XXGvertex_iport_iport|528|0|804|0|{0|in|}276|277|}
{2010006001|XXGobject_psameas_object|529|0|806|0|{metadata|in_metadata|1|0|}277|276|}
{2010006001|XXGobject_psameas_object|530|0|807|0|{Layout|Layout|0|0|}274|38|}
{2010006001|XXGobject_psameas_object|531|0|808|0|{in_metadata|deselect_metadata|0|0|}274|60|}
{2010601001|XXGgraph_vertex_vertex|532|0|809|0|{Write_Block_Compressed_Lookup_1|}1|130|}
{2010109001|XXGobject_property_value|533|0|810|0|{0|TrackingThumbprint|72|}1|278|}
