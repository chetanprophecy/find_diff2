@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|659|rel_count|1096|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|RUN_ID|$[ (string(""))(datetime("YYYYMMDD"))now() ]|3|9|RFK|@{0|}}
{30001002|XXparameter|SOURCE_NAME|\{SYSTEM\}.\{SOURCE\}|3|9|RFK||{0|}}
{30001002|XXparameter|RUN_TIMESTAMP|$[ (string(""))(datetime("YYYYMMDDHH24MISS"))now() ]|3|9|RFK||{0|}}
{30001002|XXparameter|SOURCE_LOWER|$[ string_downcase(SOURCE_NAME) ]|3|9|RFK||{0|}}
{30001002|XXparameter|SOURCE_SYSTEM|$[ re_replace(SOURCE_LOWER, "[.].*", "") ]|3|9|RFK||{0|}}
{30001002|XXparameter|START_CHANGES_TIME|$[ string_split(read_file(AI_SERIAL + "/" + SOURCE_SYSTEM + "_start_changes_time" + ".txt"),"\\n")[0]]|3|9|RFK||{0|}}
{30001002|XXparameter|END_CHANGES_TIME|$[(datetime("YYYY-MM-DD HH24:MI:SS")) now()]|3|9|RFK||{0|}}
{30001002|XXparameter|WHERE_CLAUSE|$["where LastModifiedDate > " + string_replace(START_CHANGES_TIME," ","T") + "Z" + " and LastModifiedDate <= " + string_replace(END_CHANGES_TIME," ","T") + "Z"]|3|9|RFK||{0|}}
{30001002|XXparameter|CLEAN_FILE_URL|$[ "mfile:" + AI_MFS + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_LOWER + "." +  RUN_ID + ".dat.gz" ]|3|9|RK||{0|}}
{30001002|XXparameter|CLEAN_DML_FILE|$[ AI_DML + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_LOWER + ".dml" ]|3|9|RK||{0|}}
{30001002|XXparameter|SF_OBJECT_DML|$[read_file(AI_DML + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_LOWER + ".dml")]|3|9|RFK||{0|}}
{30001002|XXparameter|MAP_SOURCE_CLEAN_XFR|$[ 
begin
  let all_types = package_info(SF_OBJECT_DML).members;
  let dml_field_info_vec info_vec_input;
  let string("") trans = "out::reformat(in)= \\n begin \\n";
  all_types = for (let i, i<length_of(package_info(SF_OBJECT_DML).members)) : all_types[i];
  for (let t in all_types)
  begin
    let vec = record_info(SF_OBJECT_DML + "\\nmetadata type =" + t.dml_type + ";");
    info_vec_input = for (let x in vec) : if (x.name != "m0_type" and string_index(x.name,"()")==0) x;
  end
  

/*  for (let i, i < length_of(info_vec_input)) // Get each name field
    begin
    if (info_vec_input[i].form member[vector 'string'])
      trans = trans + "out." + string_replace(info_vec_input[i].name,'m0_','') + " ::" + "string_convert_explicit(" + " in." + info_vec_input[i].name + ",'iso-8859-1',' ')" + ";" + "\\n";  
    else 
      trans = trans + "out." + string_replace(info_vec_input[i].name,'m0_','') + " ::" +  " in." + info_vec_input[i].name  + ";" + "\\n";
    end */ //removing charset conversion

 for (let i, i < length_of(info_vec_input)) // Get each name field
    begin
       trans = trans + "out." + string_replace(info_vec_input[i].name,'m0_','') + " ::" +  " in." + info_vec_input[i].name  + ";" + "\\n";
    end 

trans = trans + "\\n end;";


  result :: trans;


end;
]|3|9|RFK||{0|}}
{30001002|XXparameter|SF_OBJECT_SOQL|$[read_file(AI_SQL + "/" + SOURCE_SYSTEM + "/" + string_split(SOURCE_LOWER,".")[1] + ".soql")]|3|9|RFK||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|SALESFORCE_ENVIRONMENT|'' // This must be set appropriately in the intermediate pset.|3|9|RFK||{0|}}
{30001002|XXparameter|SALESFORCE_USERNAME|'' // This must be set appropriately in the intermediate pset.|3|9|RFK||{0|}}
{30001002|XXparameter|AB_SALESFORCE_VERSION|'' // This must be set appropriately in the intermediate pset.|3|9|RFK||{0|}}
{30001002|XXparameter|SALESFORCE_ENCRYPTED_PASSWORD|'' // This must be set appropriately in the intermediate pset.|3|9|RFK||{0|}}
{30001002|XXparameter|AB_EXPECTED_RECORD_MBYTES|10|3|9|REFK||{0|}}
{30001002|XXparameter|READ_DB_NORMALIZE_XFR_FILE|$PUB_DXF_XFR/dxf_process_log.get_database.default.xfr|3|9|RFK|@{0|}}
{30001002|XXparameter|SOURCE_LOGICAL_NAME|// setup in intermediate pset|3|9|RFK|@{0|}}
{30001002|XXparameter|DATASET_NAME|$SOURCE_NAME|3|9|RFK|@{0|}}
{30001002|XXparameter|SQL_SCRIPT|$SF_OBJECT_SOQL|3|9|RFK|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|get.salesforce|Rohan.Goel|@1|100|-1|@9|@2049|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1113000|758000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.2.0|{1|1|}Job 'get.salesforce' Execution Status Report


Job "get.salesforce" Execution started at Tuesday, March 14, 2017 13:43:24
Job completed successfully at Tuesday, March 14, 2017 13:47:31

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:04:07
Run performed by user Rohan.Goel
Total data moved through all flows: 8338 records (13788075 bytes)
Total CPU time (all processes): 13 seconds
Average CPU utilization across all nodes: 0.00 percent
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@IDW PLM Dev 1 4.0||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!is_dynamic|true|3|9|P|@{0|}}
}}@SOURCE_NAME - $SOURCE_NAME  |184000|152000|0|0|0|0|12073|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|255|160|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@Extract from Salesforce|25103|40494|205000|35000|391000|56000|12095|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|32768|360|1|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}12097|19|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}12069|2065|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}12105|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}12100|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}12096|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}12098|19|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}12103|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}12079|20|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.04210526496171951|.5|{12|754000|344000|754000|364000|754000|368000|643000|368000|643000|469000|664000|469000|}12067|19|}}
{2010243001|XXGwatcher|18|0|35|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.5|{8|791000|469000|811000|469000|840000|469000|861000|469000|}12089|17|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{0|}12065|17|}}
{2010503005|XXGfvertex|21|0|41|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|Layout|$CLEAN_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/clean.$SOURCE_SYSTEM/clean.$SOURCE_LOWER.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$CLEAN_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@985913|344047|1153000|334000|56000|50000|12070|Clean File|Ab Initio Software||1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|22|0|43|0|{@{}@1143000|354000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|23|0|46|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1400276304|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|24|0|48|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|25|0|51|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_ERROR/$\{SOURCE_LOWER\}_$\{RUN_ID\}.err", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_ERROR/$\{SOURCE_LOWER\}_$\{RUN_ID\}.err|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
}}@0|@424000|590500|0|0|0|0|12106|Error|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|26|0|53|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|27|0|56|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|28|0|58|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|29|0|61|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@376003|697653|261000|703000|118000|69000|161|Reformat|Ab Initio Software|Built-in 1.0:|1|10|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|30|0|63|0|{@{}@378000|734000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|31|0|65|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|32|0|67|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|33|0|69|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|34|0|71|0|{@{}@251000|729000|11000|21000|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|35|0|73|0|{@{}@384|.6849315166473389|.5|{12|494000|227000|494000|247000|494000|587000|219000|587000|219000|744000|250000|744000|}160|17|}}
{2010210004|XXGflow|36|0|75|0|{@{}@384|.6730769276618958|.5|{12|1066000|434000|1086000|434000|1086000|635000|229000|635000|229000|734000|250000|734000|}173|17|}}
{2010501005|XXGpvertex|37|0|77|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
}}@0|@305737|94487|306000|299000|143000|107000|132|R to insert request parameters|Ab Initio Software|Built-in 1.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|38|0|79|0|{@{}@448000|349000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|39|0|81|0|{@{}@384|.5|.5|{12|459000|354000|479000|354000|479000|257000|175000|257000|175000|159000|196000|159000|}133|17|}}
{2010203004|XXGoport|40|0|83|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|41|0|85|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|42|0|87|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|43|0|89|0|{@{}@296000|349000|11000|11000|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|44|0|91|0|{@{}@384|.5|.5|{8|251000|354000|271000|354000|274000|354000|295000|354000|}131|17|}}
{2010501005|XXGpvertex|45|0|93|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@19000|117500|39000|138000|60000|60000|85|Create Data|Ab Initio Software|Built-in 2.15.2:|1|100|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|46|0|95|0|{@{}@98000|164000|11000|11000|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|47|0|97|0|{@{}@384|.5|.5|{12|109000|169000|129000|169000|129000|261000|67000|261000|67000|354000|88000|354000|}129|17|}}
{2010203004|XXGoport|48|0|99|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|49|0|101|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|50|0|104|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@491666|93500|207000|104000|125000|107000|135|Write XML Transform|Ab Initio Software|Built-in 2.14.19:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|51|0|106|0|{@{}@331000|154000|11000|11000|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|52|0|108|0|{@{}@384|.5|.5|{8|342000|159000|362000|159000|419000|159000|440000|159000|}134|17|}}
{2010203004|XXGoport|53|0|110|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|54|0|112|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|55|0|114|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|56|0|116|0|{@{}@197000|154000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|57|0|120|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@106000|157000|126000|177000|123000|107000|84|Call Web Service|Ab Initio Software|Built-in 2.13.1.m6:|1|100|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|58|0|122|0|{@{}@248000|224000|11000|11000|out|0.0|@@@2320|0|}}
{2010210004|XXGflow|59|0|124|0|{@{}@384|.5|.5|{12|259000|229000|279000|229000|288000|229000|288000|134000|298000|134000|319000|134000|}81|17|}}
{2010203004|XXGoport|60|0|126|0|{@{}@144000|283000|11000|11000|reject|0.0|@@@1168|0|}}
{2010210004|XXGflow|61|0|128|0|{@{}@384|.5|.5|{12|149000|294000|149000|334000|149000|354000|154000|354000|154000|375000|154000|396000|}82|1041|}}
{2010203004|XXGoport|62|0|130|0|{@{}@184000|283000|11000|11000|error|0.0|@@@1176|0|}}
{2010210004|XXGflow|63|0|132|0|{@{}@384|.7029703259468079|.5|{12|189000|294000|189000|324000|189000|352000|194000|352000|194000|365000|194000|396000|}83|1041|}}
{2010203004|XXGoport|64|0|134|0|{@{}@224000|283000|11000|11000|log|0.0|@@@1176|0|}}
{2010210004|XXGflow|65|0|136|0|{@{}@384|.5|.5|{10|229000|294000|229000|314000|229000|354000|520000|354000|541000|354000|}89|17|}}
{2010202004|XXGiport|66|0|138|0|{@{}@116000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|67|0|144|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@321702|234520|342000|255000|119000|107000|18|Read Fault XML Transform|Ab Initio Software|Built-in 2.14.19:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|68|0|146|0|{@{}@460000|304000|11000|11000|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|69|0|148|0|{@{}@384|.5|0.0|{12|471000|309000|491000|309000|491000|309000|491000|414000|839000|414000|880000|414000|}5|17|}}
{2010203004|XXGoport|70|0|150|0|{@{}@394000|361000|11000|11000|reject|0.0|@@@1168|0|}}
{2010210004|XXGflow|71|0|152|0|{@{}@384|.5|.5|{10|399000|372000|399000|392000|399000|449000|419000|449000|440000|449000|}85|17|}}
{2010203004|XXGoport|72|0|154|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|73|0|156|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|74|0|158|0|{@{}@332000|304000|11000|11000|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|75|0|160|0|{@{}@384|.5|0.0|{12|498000|174000|518000|174000|518000|241000|310000|241000|310000|309000|331000|309000|}11|17|}}
{2010501005|XXGpvertex|76|0|165|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Gather|124000|591500|0|0|0|0|11095|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|77|0|167|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|78|0|170|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|79|0|173|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|80|0|175|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|81|0|178|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|82|0|184|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Gather|172000|510000|0|0|0|0|11123|Gather-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|83|0|186|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|84|0|189|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|85|0|192|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|86|0|194|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|87|0|197|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010503005|XXGfvertex|88|0|200|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/$\{SOURCE_LOWER\}_$\{RUN_ID\}.log", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/$\{SOURCE_LOWER\}_$\{RUN_ID\}.log|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
}}@0|@306000|500000|0|0|0|0|12104|Log|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|89|0|202|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|90|0|205|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|91|0|207|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|92|0|210|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@651000|515000|666000|521000|40000|47000|88|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|93|0|212|0|{@{}@679000|567000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|94|0|214|0|{@{}@679000|511000|11000|11000|in|0.0|@@@1812|0|}}
{2010210004|XXGflow|95|0|216|0|{@{}@384|.5|.5|{12|695000|354000|715000|354000|715000|421000|684000|421000|684000|489000|684000|510000|}90|17|}}
{2010503005|XXGfvertex|96|0|222|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/get.$SOURCE_LOWER.job_log.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/get.$SOURCE_LOWER.job_log.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/dxf_process_log.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|2\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
}}@0|@1025000|687500|872000|443000|56000|50000|12090|Get Job Log|Ab Initio Software||1|100|0||6||33025|-1|-1|}}
{2010202004|XXGiport|97|0|224|0|{@{}@862000|464000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|98|0|227|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403542|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|99|0|229|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|100|0|233|0|{Adds Source IDs and Record Counts.  Also logs the totals.

We use a Normalize here so that other kinds of filtering or expansion could be done as well.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|$READ_DB_NORMALIZE_XFR_FILE|3|9|fj|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@702952|302880|683000|208000|145000|126000|12068|Normalize: Add Job ID & Record Count|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|101|0|235|0|{@{}@827000|264000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|102|0|238|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|103|0|240|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|104|0|242|0|{@{}@749000|333000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|105|0|245|0|{@{}@673000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|106|0|248|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|107|0|250|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|108|0|253|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|109|0|256|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|110|0|259|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|111|0|262|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|112|0|269|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Partition by Round-robin|263000|346500|0|0|0|0|12080|Partition by Round-robin|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|113|0|271|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|114|0|274|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|115|0|277|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|roundrobin-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|block_size|1|1|2|RFO$|Number of records before switching to the next port|{0|}}
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
}}@0|Partition by Round-robin|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|116|0|279|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|117|0|282|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|118|0|286|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@1500131|368946|1472000|409000|135000|127000|49|Normalize to get 1 object per record|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|119|0|288|0|{@{}@1606000|469000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|120|0|290|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|121|0|292|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|122|0|294|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|123|0|296|0|{@{}@1462000|464000|11000|21000|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|124|0|298|0|{@{}@384|.5|1.0|{12|1392000|124000|1412000|124000|1426000|124000|1426000|469000|1440000|469000|1461000|469000|}166|17|}}
{2010210004|XXGflow|125|0|300|0|{@{}@384|.5|.5|{12|1169000|224000|1189000|224000|1309000|224000|1309000|479000|1430000|479000|1461000|479000|}169|17|}}
{2010501005|XXGpvertex|126|0|303|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@1277396|125851|1037000|171000|122000|107000|170|Read queryMore results|Ab Initio Software|Built-in 2.14.19:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|127|0|305|0|{@{}@1158000|219000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|128|0|308|0|{@{}@1094000|277000|11000|11000|reject|0.0|@@@1168|0|}}
{2010210004|XXGflow|129|0|310|0|{@{}@384|.2293577939271927|.5|{12|1099000|288000|1099000|308000|1099000|338000|740000|338000|740000|439000|771000|439000|}172|17|}}
{2010203004|XXGoport|130|0|312|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|131|0|314|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|132|0|316|0|{@{}@1027000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|133|0|318|0|{@{}@384|.5|.5|{12|937000|189000|957000|189000|981000|189000|981000|224000|1005000|224000|1026000|224000|}168|17|}}
{2010501005|XXGpvertex|134|0|321|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@697225|29276|717000|49000|134000|126000|19|Read Response XML Transform|Ab Initio Software|Built-in 2.14.19:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|135|0|323|0|{@{}@850000|109000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|136|0|325|0|{@{}@779000|174000|11000|11000|reject|0.0|@@@1168|0|}}
{2010210004|XXGflow|137|0|327|0|{@{}@384|.5|.5|{12|784000|185000|784000|205000|774000|205000|774000|193000|764000|193000|764000|214000|}9|17|}}
{2010203004|XXGoport|138|0|329|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|139|0|331|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|140|0|333|0|{@{}@707000|109000|11000|11000|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|141|0|335|0|{@{}@384|.5|.5|{12|498000|94000|538000|94000|611000|94000|611000|114000|685000|114000|706000|114000|}10|17|}}
{2010501005|XXGpvertex|142|0|338|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@310289|51920|330000|72000|158000|127000|13|Dispatch by HTTP Response Code|Ab Initio Software|Built-in 1.0:|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|143|0|340|0|{@{}@487000|89000|11000|11000|_2xx|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|144|0|343|0|{@{}@487000|129000|11000|11000|Other|0.0|count|out|1|2448|0|}}
{2010210004|XXGflow|145|0|345|0|{@{}@384|.5|.14814814925193787|{12|498000|134000|528000|134000|575000|134000|575000|404000|849000|404000|880000|404000|}8|17|}}
{2010203004|XXGoport|146|0|347|0|{@{}@487000|169000|11000|11000|_5xx|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|147|0|350|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|148|0|352|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|149|0|354|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|150|0|356|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|151|0|358|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|152|0|360|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|153|0|362|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|154|0|364|0|{@{}@320000|129000|11000|11000|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|155|0|377|0|{Retrieves Salesforce objects matching the specified query expression.
COPYRIGHT 2008-2014 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Interchange/Salesforce/Query_Salesforce_Objects.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|salesforce_dml_internal|type sObject_t = record     // Hemophilia_Order__c
  utf8 string('\\0') m0_type = 'Hemophilia_Order__c';
  utf8 string('\\0') m0_Id = NULL;
  utf8 string('\\0') m0_ACVD__c = NULL;           /* textarea length 255 */
  utf8 string('\\0') m0_Address_to_Deliver__c = NULL; /* string length 250 */
  utf8 string('\\0') m0_Allocated_Assay__c = NULL; /* textarea length 255 */
  decimal('\\0', allow_exponent) m0_Amount_Paid_by_Copay_Assist__c = NULL; /* double precision 18 scale 2 */
  decimal('\\0', allow_exponent) m0_Amount_Paid_by_Patient__c = NULL; /* double precision 18 scale 2 */
  decimal('\\0', allow_exponent) m0_Amount_Paid_by_Plan__c = NULL; /* double precision 18 scale 2 */
  utf8 string('\\0') m0_Bleed_Notes__c = NULL;    /* textarea length 255 */
  utf8 string('\\0') m0_Bleed_Occurrence__c = NULL; /* picklist length 255 */
  utf8 string('\\0') m0_Cause_of_Bleed__c = NULL; /* picklist length 255 */
  utf8 string('\\0') m0_Changes_to_Infusion_Method__c = NULL; /* picklist length 255 */
  utf8 string('\\0') m0_Changes_to_Rx_Dosing_or_Therapy__c = NULL; /* picklist length 255 */
  utf8 string('\\0') m0_Consult_Notes_for_any_of_the_above__c = NULL; /* textarea length 255 */
  utf8 string('\\0') m0_CreatedById = NULL;       /* reference */
  datetime('YYYY-MM-DDTHH24:MI:SS.nnn+ZO:NE') m0_CreatedDate = NULL; /* datetime */
  utf8 string('\\0') m0_Current_Supplies_c__c = NULL; /* textarea length 33000 */
  date('YYYY-MM-DD') m0_Date_of_Bleed__c = NULL; /* date */
  date('YYYY-MM-DD') m0_Date_Patient_Notified__c = NULL; /* date */
  utf8 string('\\0') m0_Delivery_Complete__c = NULL; /* picklist length 255 */
  date('YYYY-MM-DD') m0_Delset_Receive_Date__c = NULL; /* date */
  utf8 string('\\0') m0_Delset_RPh__c = NULL;     /* picklist length 255 */
  utf8 string('\\0') m0_Description_of_Problem_Dropping_Order__c = NULL; /* textarea length 255 */
  utf8 string('\\0') m0_Discontinued_Supplies__c = NULL; /* textarea length 32768 */
  decimal('\\0', allow_exponent) m0_Dispensed_Qty__c = NULL; /* double precision 18 */
  date('YYYY-MM-DD') m0_DOB__c = NULL;           /* date */
  utf8 string('\\0') m0_Doses_remaining__c = NULL; /* textarea length 255 */
  utf8 string('\\0') m0_Drug_Name__c = NULL;      /* picklist length 255 */
  utf8 string('\\0') m0_ER__c = NULL;             /* picklist length 255 */
  utf8 string('\\0') m0_Exception_Description__c = NULL; /* textarea length 255 */
  utf8 string('\\0') m0_Exception_occur__c = NULL; /* picklist length 255 */
  date('YYYY-MM-DD') m0_Expected_Delivery_Date__c = NULL; /* date */
  utf8 string('\\0') m0_Experience_with_Services_at_Optum__c = NULL; /* textarea length 255 */
  utf8 string('\\0') m0_Follow_Up_Notes__c = NULL; /* boolean */
  utf8 string('\\0') m0_Follow_Up_Plan_Notes__c = NULL; /* textarea length 255 */
  utf8 string('\\0') m0_Hemophilia_Delset_Consult__c = NULL; /* textarea length 255 */
  utf8 string('\\0') m0_Hospitalization__c = NULL; /* picklist length 255 */
  utf8 string('\\0') m0_If_ER_Bleed_Related__c = NULL; /* picklist length 255 */
  utf8 string('\\0') m0_Insurance_Plan_Billed__c = NULL; /* string length 255 */
  utf8 string('\\0') m0_Insurance_Plan_Category__c = NULL; /* string length 100 */
  utf8 string('\\0') m0_Intervention_Description__c = NULL; /* textarea length 255 */
  utf8 string('\\0') m0_Interventions__c = NULL;  /* multipicklist length 4099 */
  utf8 string('\\0') m0_IRIS_Account_ID__c = NULL; /* string length 1300 */
  utf8 string('\\0') m0_IsDeleted = NULL;         /* boolean */
  utf8 string('\\0') m0_IV_Access_Issues_IV_Infections__c = NULL; /* picklist length 255 */
  date('YYYY-MM-DD') m0_LastActivityDate = NULL; /* date */
  utf8 string('\\0') m0_LastModifiedById = NULL;  /* reference */
  datetime('YYYY-MM-DDTHH24:MI:SS.nnn+ZO:NE') m0_LastModifiedDate = NULL; /* datetime */
  utf8 string('\\0') m0_Location_of_Bleed__c = NULL; /* picklist length 255 */
  utf8 string('\\0') m0_Method_of_Shipping__c = NULL; /* picklist length 255 */
  utf8 string('\\0') m0_Missed_Doses__c = NULL;   /* textarea length 255 */
  utf8 string('\\0') m0_Name = NULL;              /* string length 80 */
  utf8 string('\\0') m0_Nature_of_Problem__c = NULL; /* multipicklist length 4099 */
  decimal('\\0', allow_exponent) m0_Number_of_ays_infused__c = NULL; /* double precision 3 */
  decimal('\\0', allow_exponent) m0_Number_of_Days_Bleed_Occurred__c = NULL; /* double precision 3 */
  decimal('\\0', allow_exponent) m0_Number_of_Infusions_Used__c = NULL; /* double precision 3 */
  utf8 string('\\0') m0_Order_Number_2__c = NULL; /* string length 100 */
  utf8 string('\\0') m0_Order_Status__c = NULL;   /* picklist length 255 */
  utf8 string('\\0') m0_Patient_Name__c = NULL;   /* reference */
  utf8 string('\\0') m0_Patient_Profile_Cleanup__c = NULL; /* multipicklist length 4099 */
  utf8 string('\\0') m0_Place_Of_Infusion__c = NULL; /* picklist length 255 */
  utf8 string('\\0') m0_Precheck_Notes__c = NULL; /* textarea length 32768 */
  utf8 string('\\0') m0_Precheck_Problems__c = NULL; /* multipicklist length 4099 */
  utf8 string('\\0') m0_Precheck_RPh__c = NULL;   /* reference */
  decimal('\\0', allow_exponent) m0_Prescribed_Qty__c = NULL; /* double precision 18 */
  utf8 string('\\0') m0_Problem_Dropping_Order__c = NULL; /* boolean */
  utf8 string('\\0') m0_Prompt_Treatment__c = NULL; /* picklist length 255 */
  decimal('\\0', allow_exponent) m0_QOL_Days_of_school_work_missed__c = NULL; /* double precision 3 */
  utf8 string('\\0') m0_RecordTypeId = NULL;      /* reference */
  utf8 string('\\0') m0_Referral_to_another_Optum_UHC_service__c = NULL; /* picklist length 255 */
  utf8 string('\\0') m0_RICE_Offered_Educated__c = NULL; /* picklist length 255 */
  utf8 string('\\0') m0_Rx_Dispensed__c = NULL;   /* string length 25 */
  utf8 string('\\0') m0_Rx_Profile__c = NULL;     /* reference */
  utf8 string('\\0') m0_Same_Day_Ship__c = NULL;  /* picklist length 255 */
  utf8 string('\\0') m0_Secondary_Precheck_RPh__c = NULL; /* reference */
  utf8 string('\\0') m0_Secondary_RPh_c__c = NULL; /* picklist length 255 */
  date('YYYY-MM-DD') m0_Ship_Date__c = NULL;     /* date */
  utf8 string('\\0') m0_Supplies_for_this_Order__c = NULL; /* textarea length 32768 */
  utf8 string('\\0') m0_Supplies_Requested_Other__c = NULL; /* textarea length 255 */
  utf8 string('\\0') m0_Supplies_Requested_Other_2__c = NULL; /* multipicklist length 4099 */
  utf8 string('\\0') m0_Supplies_Requested_Port_A_Cath__c = NULL; /* multipicklist length 4099 */
  utf8 string('\\0') m0_Supplies_Requested_Port_A_Cath_2__c = NULL; /* multipicklist length 4099 */
  datetime('YYYY-MM-DDTHH24:MI:SS.nnn+ZO:NE') m0_SystemModstamp = NULL; /* datetime */
  utf8 string('\\0') m0_Tracking_Number__c = NULL; /* string length 250 */
  utf8 string('\\0') m0_Urgent_Ship__c = NULL;    /* boolean */
  decimal('\\0', allow_exponent) m0_Variance__c = NULL; /* double precision 18 scale 3 */
  decimal('\\0', allow_exponent) m0_Variance_2__c = NULL; /* percent precision 18 scale 3 */
  decimal('\\0', allow_exponent) m0_Weight_kg__c = NULL; /* double precision 4 scale 1 */
  utf8 string('\\0') XML_nillable_elements()  = 'm0_ACVD__c,m0_Address_to_Deliver__c,m0_Allocated_Assay__c,m0_Amount_Paid_by_Copay_Assist__c,m0_Amount_Paid_by_Patient__c,m0_Amount_Paid_by_Plan__c,m0_Bleed_Notes__c,m0_Bleed_Occurrence__c,m0_Cause_of_Bleed__c,m0_Changes_to_Infusion_Method__c,m0_Changes_to_Rx_Dosing_or_Therapy__c,m0_Consult_Notes_for_any_of_the_above__c,m0_CreatedById,m0_CreatedDate,m0_Current_Supplies_c__c,m0_Date_of_Bleed__c,m0_Date_Patient_Notified__c,m0_Delivery_Complete__c,m0_Delset_Receive_Date__c,m0_Delset_RPh__c,m0_Description_of_Problem_Dropping_Order__c,m0_Discontinued_Supplies__c,m0_Dispensed_Qty__c,m0_DOB__c,m0_Doses_remaining__c,m0_Drug_Name__c,m0_ER__c,m0_Exception_Description__c,m0_Exception_occur__c,m0_Expected_Delivery_Date__c,m0_Experience_with_Services_at_Optum__c,m0_Follow_Up_Notes__c,m0_Follow_Up_Plan_Notes__c,m0_Hemophilia_Delset_Consult__c,m0_Hospitalization__c,m0_Id,m0_If_ER_Bleed_Related__c,m0_Insurance_Plan_Billed__c,m0_Insurance_Plan_Category__c,m0_Intervention_Description__c,m0_Interventions__c,m0_IRIS_Account_ID__c,m0_IsDeleted,m0_IV_Access_Issues_IV_Infections__c,m0_LastActivityDate,m0_LastModifiedById,m0_LastModifiedDate,m0_Location_of_Bleed__c,m0_Method_of_Shipping__c,m0_Missed_Doses__c,m0_Name,m0_Nature_of_Problem__c,m0_Number_of_ays_infused__c,m0_Number_of_Days_Bleed_Occurred__c,m0_Number_of_Infusions_Used__c,m0_Order_Number_2__c,m0_Order_Status__c,m0_Patient_Name__c,m0_Patient_Profile_Cleanup__c,m0_Place_Of_Infusion__c,m0_Precheck_Notes__c,m0_Precheck_Problems__c,m0_Precheck_RPh__c,m0_Prescribed_Qty__c,m0_Problem_Dropping_Order__c,m0_Prompt_Treatment__c,m0_QOL_Days_of_school_work_missed__c,m0_RecordTypeId,m0_Referral_to_another_Optum_UHC_service__c,m0_RICE_Offered_Educated__c,m0_Rx_Dispensed__c,m0_Rx_Profile__c,m0_Same_Day_Ship__c,m0_Secondary_Precheck_RPh__c,m0_Secondary_RPh_c__c,m0_Ship_Date__c,m0_Supplies_for_this_Order__c,m0_Supplies_Requested_Other__c,m0_Supplies_Requested_Other_2__c,m0_Supplies_Requested_Port_A_Cath__c,m0_Supplies_Requested_Port_A_Cath_2__c,m0_SystemModstamp,m0_Tracking_Number__c,m0_Urgent_Ship__c,m0_Variance__c,m0_Variance_2__c,m0_Weight_kg__c,';
  utf8 string('\\0') XML_namespace_mappings() = 'm0,=urn:sobject.partner.soap.sforce.com;' +
                                          'xsi,=http://www.w3.org/2001/XMLSchema-instance;';
  utf8 string('\\0') XML_default_namespace()  = 'urn:partner.soap.sforce.com';
end;|3|2|$|@{0|}}
{30001002|XXparameter|queried_object_info|''|3|9||@{0|}}
{30001002|XXparameter|soql_query_internal|SELECT ACVD__c, Address_to_Deliver__c, Allocated_Assay__c, Amount_Paid_by_Copay_Assist__c, Amount_Paid_by_Patient__c, Amount_Paid_by_Plan__c, Bleed_Notes__c, Bleed_Occurrence__c, Cause_of_Bleed__c, Changes_to_Infusion_Method__c, Changes_to_Rx_Dosing_or_Therapy__c, Consult_Notes_for_any_of_the_above__c, CreatedById, CreatedDate, Current_Supplies_c__c, Date_of_Bleed__c, Date_Patient_Notified__c, Delivery_Complete__c, Delset_Receive_Date__c, Delset_RPh__c, Description_of_Problem_Dropping_Order__c, Discontinued_Supplies__c, Dispensed_Qty__c, DOB__c, Doses_remaining__c, Drug_Name__c, ER__c, Exception_Description__c, Exception_occur__c, Expected_Delivery_Date__c, Experience_with_Services_at_Optum__c, Follow_Up_Notes__c, Follow_Up_Plan_Notes__c, Hemophilia_Delset_Consult__c, Hospitalization__c, Id, If_ER_Bleed_Related__c, Insurance_Plan_Billed__c, Insurance_Plan_Category__c, Intervention_Description__c, Interventions__c, IRIS_Account_ID__c, IsDeleted, IV_Access_Issues_IV_Infections__c, LastActivityDate, LastModifiedById, LastModifiedDate, Location_of_Bleed__c, Method_of_Shipping__c, Missed_Doses__c, Name, Nature_of_Problem__c, Number_of_ays_infused__c, Number_of_Days_Bleed_Occurred__c, Number_of_Infusions_Used__c, Order_Number_2__c, Order_Status__c, Patient_Name__c, Patient_Profile_Cleanup__c, Place_Of_Infusion__c, Precheck_Notes__c, Precheck_Problems__c, Precheck_RPh__c, Prescribed_Qty__c, Problem_Dropping_Order__c, Prompt_Treatment__c, QOL_Days_of_school_work_missed__c, RecordTypeId, Referral_to_another_Optum_UHC_service__c, RICE_Offered_Educated__c, Rx_Dispensed__c, Rx_Profile__c, Same_Day_Ship__c, Secondary_Precheck_RPh__c, Secondary_RPh_c__c, Ship_Date__c, Supplies_for_this_Order__c, Supplies_Requested_Other__c, Supplies_Requested_Other_2__c, Supplies_Requested_Port_A_Cath__c, Supplies_Requested_Port_A_Cath_2__c, SystemModstamp, Tracking_Number__c, Urgent_Ship__c, Variance__c, Variance_2__c, Weight_kg__c FROM Hemophilia_Order__c|3|1|l|@{0|}}
{30001002|XXparameter|salesforce_dml|$SF_OBJECT_DML|3|9||@{0|}}
{30001002|XXparameter|salesforce_soql|$SF_OBJECT_SOQL|3|9||@{0|}}
{30001002|XXparameter|query_options|$WHERE_CLAUSE|3|2|$|@{0|}}
{30001002|XXparameter|action|QueryAll|3|2|$|@{0|}}
}}@0|@40000|312500|0|0|1682000|872000|12099|Query Salesforce Objects|Ab Initio|Created 01/31/08 20:20:41|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1682603|872000|0|}}
{2010240003|XXGlegend|156|0|379|0|{@{}@Ignore unknown elements 
in both Read XML Transforms 
because salesforce give back extra Id field|824622|228383|765000|248000|321000|57000|70|}}
{2010242002|XXGface|157|0|381|0|{@{}@Arial|255|120|1|}}
{2010240003|XXGlegend|158|0|383|0|{@{}@Note:  this component uses hidden parameters
not visible in the GDE.|220988|15390|241000|35000|357000|38000|29|}}
{2010242002|XXGface|159|0|385|0|{@{}@Arial|255|120|1|}}
{2010210004|XXGflow|160|0|389|0|{@{}@384|.623711347579956|.5|{12|1329000|189000|1329000|209000|1329000|346000|750000|346000|750000|429000|771000|429000|}171|17|}}
{2010210004|XXGflow|161|0|394|0|{@{}@384|.5|.5|{8|639000|159000|659000|159000|706000|159000|727000|159000|}136|17|}}
{2010210004|XXGflow|162|0|401|0|{@{}@384|.5|.5|{12|937000|129000|957000|129000|1099000|129000|1099000|124000|1242000|124000|1263000|124000|}165|17|}}
{2010501005|XXGpvertex|163|0|405|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@1172530|379780|923000|380000|133000|107000|174|Not Expected Response|Ab Initio Software|Built-in 1.0:|1|10|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|164|0|407|0|{@{}@1055000|429000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|165|0|410|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|166|0|412|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|167|0|414|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|168|0|416|0|{@{}@913000|429000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|169|0|426|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@1104202|66867|1274000|72000|108000|107000|167|Read query results|Ab Initio Software|Built-in 2.14.19:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|170|0|428|0|{@{}@1381000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|171|0|431|0|{@{}@1324000|178000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|172|0|434|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|173|0|436|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|174|0|438|0|{@{}@1264000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|175|0|445|0|{|{}@0|@657587|91929|451000|103000|992000|640000|80|Salesforce CWS and Fault Handling|Ab Initio|Created 1/7/2014 2:31:18 PM|1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}.17943547666072845|992000|640000|1|}}
{2010210004|XXGflow|176|0|452|0|{@{}@384|.5|.9180327653884888|{12|419000|529000|439000|529000|824000|529000|824000|434000|859000|434000|880000|434000|}6|17|}}
{2010210004|XXGflow|177|0|454|0|{@{}@384|.5|.5|{10|174000|488000|174000|508000|174000|529000|263000|529000|284000|529000|}7|17|}}
{2010210004|XXGflow|178|0|460|0|{@{}@384|.5|.6103895902633667|{12|582000|449000|602000|449000|752000|449000|752000|424000|849000|424000|880000|424000|}86|17|}}
{2010210004|XXGflow|179|0|462|0|{@{}@384|.035087719559669495|.5|{10|764000|344000|764000|364000|764000|394000|859000|394000|880000|394000|}12|17|}}
{2010501005|XXGpvertex|180|0|468|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@275001|456000|295000|476000|114000|107000|14|Error as Fault|Ab Initio Software|Built-in 1.0:|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|181|0|470|0|{@{}@408000|524000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|182|0|473|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|183|0|475|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|184|0|477|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|185|0|479|0|{@{}@285000|524000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|186|0|483|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@108647|387000|129000|407000|90000|71000|15|Fuse|Ab Initio Software|Built-in 2.10:|1|10|-1||6||32897|1|{1|0|}}}
{2010203004|XXGoport|187|0|485|0|{@{}@169000|477000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|188|0|488|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|189|0|490|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|190|0|492|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|191|0|494|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|192|0|496|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|193|0|498|0|{@{}@149000|397000|11000|11000|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|194|0|501|0|{@{}@189000|397000|11000|11000|in1|0.0|count|in|1|1936|0|}}
{2010501005|XXGpvertex|195|0|512|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@881001|383000|891000|377000|50000|71000|16|Gather|Ab Initio Software|Built-in 1.0:|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|196|0|514|0|{@{}@940000|409000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|197|0|516|0|{@{}@881000|389000|11000|51000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|198|0|526|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@697635|205061|718000|225000|90000|109000|17|Not Expected Response|Ab Initio Software|Built-in 1.0:|1|10|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|199|0|528|0|{@{}@759000|333000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|200|0|531|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|201|0|533|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|202|0|535|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|203|0|537|0|{@{}@759000|215000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|204|0|544|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@430883|377000|451000|397000|121000|107000|87|Not a SOAP Fault|Ab Initio Software|Built-in 1.0:|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|205|0|546|0|{@{}@571000|444000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|206|0|549|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|207|0|551|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|208|0|553|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|209|0|555|0|{@{}@441000|444000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|210|0|562|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@532000|281500|552000|302000|133000|107000|91|Put data back to full utf8|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|211|0|564|0|{@{}@684000|349000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|212|0|567|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|213|0|569|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|214|0|571|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|215|0|573|0|{@{}@542000|349000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|216|0|583|0|{@{}@489000|216000|11000|11000|fault|.25|@@@13712|0|}}
{2010203004|XXGoport|217|0|587|0|{@{}@628000|154000|11000|11000|out0|.5|@@@14736|0|}}
{2010203004|XXGoport|218|0|591|0|{@{}@564000|216000|11000|11000|log|.6723790322580645|@@@13336|0|}}
{2010202004|XXGiport|219|0|594|0|{@{}@441000|154000|11000|11000|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|220|0|598|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@857739|88212|738000|98000|189000|127000|138|Separate query from queryMore results|Ab Initio Software|Built-in 1.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|221|0|600|0|{@{}@926000|124000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|222|0|603|0|{@{}@926000|184000|11000|11000|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|223|0|606|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|224|0|608|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|225|0|610|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|226|0|612|0|{@{}@728000|154000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|227|0|620|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@118658|94231|99000|299000|142000|107000|130|Sleep when continuous|Ab Initio Software|Built-in 1.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|228|0|622|0|{@{}@240000|349000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|229|0|625|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|230|0|627|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|231|0|629|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|232|0|631|0|{@{}@89000|349000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|233|0|639|0|{@{}@0|0|0|0|out|.5|@@@14736|0|}}
{2010203004|XXGoport|234|0|643|0|{@{}@0|0|0|0|error|.25|@@@13720|0|}}
{2010203004|XXGoport|235|0|647|0|{@{}@0|0|0|0|log|.75|@@@13336|0|}}
{2010600005|XXGgraph|236|0|651|0|{Retrieves Salesforce objects matching the specified query expression.
COPYRIGHT 2008-2014 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|soql_query_internal|/* Supplied by the Salesforce editor */|3|1|FHKl|SET BY EDITOR - Base query sent to Salesforce|{0|}}
{30001002|XXparameter|SFDC_TYPED_salesforce_dml_internal|type sObject_t = NULL_TYPE;|3|2|K$||{0|}}
{30001002|XXparameter|salesforce_dml_internal|/* Will be generated by the Salesforce editor */|3|2|FHK$||{0|}}
{30001002|XXparameter|action|Query|15|2|FK$|Salesforce function to be performed.|{2|Query|QueryAll|}}
{30001002|XXparameter|queried_object_info||3|2|RFK$|Editing this brings up the interactive salesforce UI to select objects and fields desired. The objects selected are stored in this field for the next edit.|{0|}}
{30001002|XXparameter|queried_object_info.custom_editor_key|SFDCBrowser|3|9|P|@{0|}}
{30001002|XXparameter|query_options||3|2|FK$|Allows you to add a WHERE clause, ORDER BY clause or LIMIT statement to your query.|{0|}}
{30001002|XXparameter|salesforce_dml|$salesforce_dml_internal|3|9|FK||{0|}}
{30001002|XXparameter|salesforce_soql|$soql_query_internal|3|9|FK||{0|}}
{30001002|XXparameter|salesforce_environment|$SALESFORCE_ENVIRONMENT|3|2|FK$|The salesforce environment (for example, "Sandbox" or "Production") to connect to.|{0|}}
{30001002|XXparameter|salesforce_username|$SALESFORCE_USERNAME|3|2|RFK$|The Salesforce user login name.|{0|}}
{30001002|XXparameter|salesforce_encrypted_password|$SALESFORCE_ENCRYPTED_PASSWORD|3|2|RFK$|Create this password using the m_passwordsforce utility.|{0|}}
{30001002|XXparameter|salesforce_version|$AB_SALESFORCE_VERSION|3|2|FK$|The Salesforce version number to be used.|{0|}}
{30001002|XXparameter|layout|$AI_SERIAL|3|2|FK$|Layout where the component will run.|{0|}}
{30001002|XXparameter|batch_size|500|3|2|FK$|The number of messages to batch together into a single salesforce api request. Setting this too high may exceed the limit configured for your salesforce instance or cause timeouts. Setting it too low will cause poor performance and may cause you to exceed the total requests per day configured for your instance.|{0|}}
{30001002|XXparameter|max_retry_count|3|3|2|FK$|Maximum number of retries before a timeout will be considered a reject|{0|}}
{30001002|XXparameter|retry_delay|20|3|2|FK$|Number of seconds to delay after each timeout before re-sending the request|{0|}}
{30001002|XXparameter|concurrency_mode|batch|15|1|FKl|Mode that controls concurrency parameters|{2|batch|continuous-nonrecoverable|}}
{30001002|XXparameter|is_continuous|$[if (concurrency_mode=="batch")"False" else "True"]|13|9|K||{0|}}
{30001002|XXparameter|continuous_subscribe_interval|600|3|2|FK$|Number of seconds between calls to Salesforce.|{0|}}
{30001002|XXparameter|save_output_frequency|0|3|2|RFK$|Use only when concurrency_mode is batch.  Specifies how often component should save responses for later replay.|{0|}}
{30001002|XXparameter|network_use_http_proxy|False|13|1|Fl|Use HTTP proxy.|{0|}}
{30001002|XXparameter|http_proxy_host_name||3|2|FK$|HTTP proxy host name.|{0|}}
{30001002|XXparameter|http_proxy_auth_method|Basic|15|1|FKl|HTTP proxy authorization method|{2|None|Basic|}}
{30001002|XXparameter|http_proxy_auth_user_name||3|2|FK$|HTTP Proxy authorization user name|{0|}}
{30001002|XXparameter|http_proxy_auth_user_password||3|2|FK$|Password for HTTP proxy authorization|{0|}}
{30001002|XXparameter|http_request_timeout|60|1|2|FK$|The maximum time in seconds that the processing of HTTP request can take.|{0|}}
{30001002|XXparameter|gateway||3|2|FK$|URL for gateway connections.|{0|}}
{30001002|XXparameter|use_gateway_only_for_login|False|13|2|FK$|If True, the gateway is used only for login requests and no other Salesforce operations|{0|}}
{30001002|XXparameter|append_sessionid_to_gateway_url||13|2|FK$|Boolean: Specifies whether the URL sent to the gateway should have the session ID appended.|{0|}}
{30001002|XXparameter|ssl_cert_file||3|2|FK$|URL to file with certificate for client.|{0|}}
{30001002|XXparameter|ssl_cert_type|PEM|15|2|FK$|Type of client certificate, one of DER, PEM, or ENG.|{3|DER|PEM|ENG|}}
{30001002|XXparameter|ssl_cert_password||3|2|FK$|Password for the client certificate.|{0|}}
{30001002|XXparameter|ssl_private_key||3|2|FK$|URL to file with client private key.|{0|}}
{30001002|XXparameter|ssl_private_key_type|PEM|15|2|FK$|Type of client private key, one of DER, PEM, or ENG.|{3|DER|PEM|ENG|}}
{30001002|XXparameter|ssl_private_key_password||3|2|FK$|Password for the client private key.|{0|}}
{30001002|XXparameter|ssl_cacert_file|/~ab_home/lib/ca-bundle.crt|3|2|FK$|URL to file with X509 CA certificates.|{0|}}
{30001002|XXparameter|add_endpoint_soap_header|False|13|2|RK$|When using a gateway, specifies whether to include url enpoint in the SOAP header.|{0|}}
{30001002|XXparameter|concurrent_requests_max_number|1|3|2|K$|The maximum number of concurrent requests.|{0|}}
{30001002|XXparameter|SFDC_USERNAME|$\{salesforce_username\}|3|3|RKc||{0|}}
{30001002|XXparameter|SFDC_PASSWORD|$\{salesforce_encrypted_password\}|3|3|RKc||{0|}}
{30001002|XXparameter|SFDC_TOKEN||3|3|Ksc||{0|}}
{30001002|XXparameter|SFDC_FUNCTION|$[string_replace(action, "Query", "query")]|3|9|RK|$[string_replace(action, "Query", "query")]|{0|}}
{30001002|XXparameter|SOAPAction||3|2|Ks$||{0|}}
{30001002|XXparameter|salesforce_string_characterset|utf8|3|2|K$||{0|}}
{30001002|XXparameter|SALESFORCE_TYPES|$[ 
begin
  let all_types = package_info(salesforce_dml).members;
  let string("") sf_types  = "";
  all_types = for (let i, i<length_of(package_info(salesforce_dml).members)) : all_types[i];
  for (let t in all_types)
  begin
    let vec = record_info(salesforce_dml + "\\nmetadata type =" + t.dml_type + ";");
    let modified_vec = for (let x in vec) : if (x.name != "m0_type" and string_index(x.name,"()")==0) x;
    let modified_type = add_fields(salesforce_dml + "\\n metadata type=record\\nend;", modified_vec);
    let m_index = string_index(modified_type, "metadata type");
    sf_types = sf_types + "type " + t.name + ((m_index > 0) ? string_substring(modified_type, m_index+13,length_of(modified_type)) + "\\n" : " =\\n" + re_replace(modified_type,"\\n$","") + ";\\n\\n");
  end;
  result :: sf_types;
end;
]|3|9|K||{0|}}
{30001002|XXparameter|soql_query_internal_modified|$[string_replace(string_replace(string_replace(string_replace(salesforce_soql, ",Id,", ","), "\{Id,", "\{"), ",Id\}", "\}"), "\{Id\}", "\{\}")]|3|9|K||{0|}}
{30001002|XXparameter|read_xml_record_format|$\{salesforce_dml\}

type result_t = record
 utf8 string('\\0') xsi_type;
 utf8 string('\\0') XML_attribute_fields() = 'xsi_type,';
 utf8 string('\\0') done;
 utf8 string('\\0') queryLocator = NULL;
 sObject_t[big endian integer(4)] records;
 utf8 string('\\0') size;
 utf8 string('\\0') XML_namespace_mappings() = ',=urn:partner.soap.sforce.com;xsi,=http://www.w3.org/2001/XMLSchema-instance;';
 utf8 string('\\0') XML_nillable_elements() = 'queryLocator,';
 utf8 string('\\0') XML_base_element() = 'urn:partner.soap.sforce.com:result';
end;

metadata type = result_t;|7|9|RK||{0|}}
{30001002|XXparameter|out_record_format|/* Should not be edited */

$\{SALESFORCE_TYPES\}

metadata type = sObject_t;|7|9|||{0|}}
{30001002|XXparameter|read_xml_transform|type document_type = utf8 string(integer(4));

$\{salesforce_dml\}

type result_t = record
 utf8 string('\\0') xsi_type;
 utf8 string('\\0') XML_attribute_fields() = 'xsi_type,';
 utf8 string('\\0') done;
 utf8 string('\\0') queryLocator = NULL;
 sObject_t[big endian integer(4)] records;
 utf8 string('\\0') size;
 utf8 string('\\0') XML_namespace_mappings() = ',=urn:partner.soap.sforce.com;xsi,=http://www.w3.org/2001/XMLSchema-instance;';
 utf8 string('\\0') XML_nillable_elements() = 'queryLocator,';
 utf8 string('\\0') XML_base_element() = 'urn:partner.soap.sforce.com:result';
end;

type parsed_xml_type = result_t;

/*Called to prepare a message*/
xml_doc::prepare_document(in)=
begin
  xml_doc::in.response_data;
end;

/*Called to create an output record*/
out::create_output(in,parsed_record)=
begin
 out.*::parsed_record.*;
end;|8|9|K||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|connector_version|3|3|2|RK$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
}}@0|@584000|472000|0|0|1682000|872000|241|Query_Salesforce_Objects|||1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1682603|872000|2|}}
{2010240003|XXGlegend|237|0|653|0|{@{}@Ignore unknown elements 
in both Read XML Transforms 
because salesforce give back extra Id field|824622|228383|765000|248000|321000|57000|70|}}
{2010242002|XXGface|238|0|655|0|{@{}@Arial|255|120|1|}}
{2010240003|XXGlegend|239|0|657|0|{@{}@Note:  this component uses hidden parameters
not visible in the GDE.|220988|15390|241000|35000|357000|38000|29|}}
{2010242002|XXGface|240|0|659|0|{@{}@Arial|255|120|1|}}
{2010210004|XXGflow|241|0|661|0|{@{}@384|.5|.5|{8|342000|159000|362000|159000|419000|159000|440000|159000|}134|17|}}
{2010210004|XXGflow|242|0|663|0|{@{}@384|.2293577939271927|.5|{12|1099000|288000|1099000|308000|1099000|338000|740000|338000|740000|439000|771000|439000|}172|17|}}
{2010210004|XXGflow|243|0|665|0|{@{}@384|.623711347579956|.5|{12|1329000|189000|1329000|209000|1329000|346000|750000|346000|750000|429000|771000|429000|}171|17|}}
{2010210004|XXGflow|244|0|667|0|{@{}@384|.6849315166473389|.5|{12|494000|227000|494000|247000|494000|587000|219000|587000|219000|744000|250000|744000|}160|17|}}
{2010210004|XXGflow|245|0|669|0|{@{}@384|.5|.5|{12|109000|169000|129000|169000|129000|261000|67000|261000|67000|354000|88000|354000|}129|17|}}
{2010210004|XXGflow|246|0|671|0|{@{}@384|.5|.5|{8|251000|354000|271000|354000|274000|354000|295000|354000|}131|17|}}
{2010210004|XXGflow|247|0|673|0|{@{}@384|.5|.5|{8|639000|159000|659000|159000|706000|159000|727000|159000|}136|17|}}
{2010210004|XXGflow|248|0|675|0|{@{}@384|.6730769276618958|.5|{12|1066000|434000|1086000|434000|1086000|635000|229000|635000|229000|734000|250000|734000|}173|17|}}
{2010210004|XXGflow|249|0|677|0|{@{}@384|.5|1.0|{12|1392000|124000|1412000|124000|1426000|124000|1426000|469000|1440000|469000|1461000|469000|}166|17|}}
{2010210004|XXGflow|250|0|679|0|{@{}@384|.5|.5|{12|459000|354000|479000|354000|479000|257000|175000|257000|175000|159000|196000|159000|}133|17|}}
{2010210004|XXGflow|251|0|681|0|{@{}@384|.5|.5|{12|937000|189000|957000|189000|981000|189000|981000|224000|1005000|224000|1026000|224000|}168|17|}}
{2010210004|XXGflow|252|0|683|0|{@{}@384|.5|.5|{12|1169000|224000|1189000|224000|1309000|224000|1309000|479000|1430000|479000|1461000|479000|}169|17|}}
{2010210004|XXGflow|253|0|685|0|{@{}@384|.5|.5|{12|937000|129000|957000|129000|1099000|129000|1099000|124000|1242000|124000|1263000|124000|}165|17|}}
{2010501005|XXGpvertex|254|0|687|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|$[ if (concurrency_mode=='batch') 1 else 100000000]|3|9||@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|continuous||3|8|=|@{0|}}
{30001002|XXparameter|out_metadata|record
string(1) a;
end|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@19000|117500|39000|138000|60000|60000|85|Create Data|Ab Initio Software|Built-in 2.15.2:|1|100|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|255|0|689|0|{@{}@98000|164000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|256|0|692|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|257|0|694|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|258|0|696|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1442863192|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|Create Data|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|259|0|698|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|260|0|701|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|261|0|704|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|262|0|708|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|out :: length(in) =
begin
  out :: length_of(in.records);
end;

out :: normalize(in, index) =
begin
  out :: in.records[index];
end;|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@1500131|368946|1472000|409000|135000|127000|49|Normalize to get 1 object per record|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|263|0|710|0|{@{}@1606000|469000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|264|0|712|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|265|0|714|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|266|0|716|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|267|0|718|0|{@{}@1462000|464000|11000|21000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|268|0|722|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1442863192|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Normalize|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|269|0|724|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|270|0|727|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|271|0|730|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|272|0|733|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|273|0|736|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|274|0|740|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.detail      :: in.response_data;
  out.faultstring :: "Error parsing response";
  out.faultcode   :: "SERVER";
  out.requestdata :: in.request_data;
end;|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@1172530|379780|923000|380000|133000|107000|174|Not Expected Response|Ab Initio Software|Built-in 1.0:|1|10|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|275|0|742|0|{@{}@1055000|429000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|276|0|745|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|277|0|747|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|278|0|749|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|279|0|751|0|{@{}@913000|429000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|280|0|755|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1442863192|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|281|0|757|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|282|0|761|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|283|0|764|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|284|0|767|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|285|0|770|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|286|0|773|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|out::reformat(in) =
begin
  out.SOAPENV_Header.m_SessionHeader.m_sessionId :1: "SESSION_ID";
  out.SOAPENV_Header.m_QueryOptions.m_batchSize :: "$\{batch_size\}";
  out.SOAPENV_Body.m_$\{SFDC_FUNCTION\}.m_queryString::"$\{salesforce_soql\}" + " $\{query_options\}";
end;|3|3|c|@{0|}}
{30001002|XXparameter|Layout|$layout|3|2|$|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@305737|94487|306000|299000|143000|107000|132|R to insert request parameters|Ab Initio Software|Built-in 1.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|287|0|775|0|{@{}@448000|349000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|288|0|778|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|289|0|780|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|290|0|782|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|291|0|784|0|{@{}@296000|349000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|292|0|787|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1442863192|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|293|0|789|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|294|0|793|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|295|0|796|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|296|0|799|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|297|0|802|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|298|0|805|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Deprecated/XML/Read_XML_Transform.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|package||3|8|=|@{0|}}
{30001002|XXparameter|ignore_unknown_elements|True|3|1|l|@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@1277396|125851|1037000|171000|122000|107000|170|Read queryMore results|Ab Initio Software|Built-in 2.14.19:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|299|0|807|0|{@{}@1158000|219000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|300|0|810|0|{@{}@1094000|277000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|301|0|813|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|302|0|815|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|303|0|817|0|{@{}@1027000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|304|0|820|0|{Reads a string, translates the XML data into DML-described records, and sends these records to its out port.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|read-xml-xfr|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/read-xml-xfr|3|2|H$||{0|}}
{30001002|XXparameter|package||8|1|RFOl|Functions for message creation|{0|}}
{30001002|XXparameter|num_includes|0|1|2|H$|Number of includes in package|{0|}}
{30001002|XXparameter|num_variables|2|1|2|H$|Number of intermediate types|{0|}}
{30001002|XXparameter|variable1|document_type xml_doc "utf8 string(integer(4))"|3|2|H$|Type for xml document|{0|}}
{30001002|XXparameter|variable2|parsed_xml_type parsed_record "record end"|3|2|H$|type generated by xml-to-dml|{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|xml_doc::prepare_document(in)|3|2|H$|Called to prepare a message|{0|}}
{30001002|XXparameter|operation2|out::create_output(in, parsed_record, string('') parse_error optional)|3|2|H$|Called to create an output record|{0|}}
{30001002|XXparameter|parser|expat|15|1|FKl|XML Parser to use|{2|expat|xerces|}}
{30001002|XXparameter|parser.condition|version 2.11:|3|15|P?|@{0|}}
{30001002|XXparameter|output_count|any number|15|1|FKl|Force an error if the number of output records for a parsed document does not meet this constraint.|{4|any number|exactly one|one or more|zero or one|}}
{30001002|XXparameter|output_count.display_name|output-count|3|9|P|@{0|}}
{30001002|XXparameter|output_count.keyword|output-count|3|9|P|@{0|}}
{30001002|XXparameter|missing_fields|ignore|15|1|FKl|What should be done if an element or attribute is missing in the input document.|{2|ignore|error|}}
{30001002|XXparameter|missing_fields.display_name|missing-fields|3|9|P|@{0|}}
{30001002|XXparameter|missing_fields.keyword|missing-fields|3|9|P|@{0|}}
{30001002|XXparameter|missing_fields.condition|version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_unknown_attributes|False|13|1|FKl|Ignore unknown attributes in the input XML|{0|}}
{30001002|XXparameter|ignore_unknown_attributes.display_name|ignore-unknown-attributes|3|9|P|@{0|}}
{30001002|XXparameter|ignore_unknown_attributes.keyword|ignore-unknown-attributes|3|9|P|@{0|}}
{30001002|XXparameter|ignore_unknown_elements|False|13|1|FKl|Ignore unknown elements in the input XML|{0|}}
{30001002|XXparameter|ignore_unknown_elements.display_name|ignore-unknown-elements|3|9|P|@{0|}}
{30001002|XXparameter|ignore_unknown_elements.keyword|ignore-unknown-elements|3|9|P|@{0|}}
{30001002|XXparameter|ignore_blank_cdata|False|13|1|FKl|Suppress records corresponding to all-whitespace character data|{0|}}
{30001002|XXparameter|ignore_blank_cdata.display_name|ignore-blank-cdata|3|9|P|@{0|}}
{30001002|XXparameter|ignore_blank_cdata.keyword|ignore-blank-cdata|3|9|P|@{0|}}
{30001002|XXparameter|ignore_namespaces|True|13|1|FKl|Ignore namespaces except to disambiguate elements or attributes|{0|}}
{30001002|XXparameter|ignore_namespaces.display_name|ignore-namespaces|3|9|P|@{0|}}
{30001002|XXparameter|ignore_namespaces.keyword|ignore-namespaces|3|9|P|@{0|}}
{30001002|XXparameter|ignore_namespaces.condition|param custom-format False version 2.16.0:|3|15|P?|@{0|}}
{30001002|XXparameter|custom_format|False|13|1|FKl|Use arbitrary type for parsed_xml_type instead of one generated by xml-to-dml.|{0|}}
{30001002|XXparameter|custom_format.display_name|custom-format|3|9|P|@{0|}}
{30001002|XXparameter|custom_format.keyword|custom-format|3|9|P|@{0|}}
{30001002|XXparameter|custom_format.condition|version 2.14.23:|3|15|P?|@{0|}}
{30001002|XXparameter|base_element||3|2|RFK$|Name of the element which will be used to fill the parsed_xml_type record.|{0|}}
{30001002|XXparameter|base_element.display_name|base-element|3|9|P|@{0|}}
{30001002|XXparameter|base_element.keyword|base-element|3|9|P|@{0|}}
{30001002|XXparameter|base_element.condition|param custom-format True version 2.14.23:|3|15|P?|@{0|}}
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
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|version 2.14.46:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1442863192|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"
metadata type: reject = in|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Read XML Transform|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|305|0|822|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|306|0|825|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|307|0|828|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|308|0|831|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|309|0|834|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|310|0|839|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Deprecated/XML/Read_XML_Transform.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|package||3|8|=|@{0|}}
{30001002|XXparameter|ignore_unknown_elements|True|3|1|l|@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@1104202|66867|1274000|72000|108000|107000|167|Read query results|Ab Initio Software|Built-in 2.14.19:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|311|0|841|0|{@{}@1381000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|312|0|844|0|{@{}@1324000|178000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|313|0|847|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|314|0|849|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|315|0|851|0|{@{}@1264000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|316|0|854|0|{Reads a string, translates the XML data into DML-described records, and sends these records to its out port.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|read-xml-xfr|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/read-xml-xfr|3|2|H$||{0|}}
{30001002|XXparameter|package||8|1|RFOl|Functions for message creation|{0|}}
{30001002|XXparameter|num_includes|0|1|2|H$|Number of includes in package|{0|}}
{30001002|XXparameter|num_variables|2|1|2|H$|Number of intermediate types|{0|}}
{30001002|XXparameter|variable1|document_type xml_doc "utf8 string(integer(4))"|3|2|H$|Type for xml document|{0|}}
{30001002|XXparameter|variable2|parsed_xml_type parsed_record "record end"|3|2|H$|type generated by xml-to-dml|{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|xml_doc::prepare_document(in)|3|2|H$|Called to prepare a message|{0|}}
{30001002|XXparameter|operation2|out::create_output(in, parsed_record, string('') parse_error optional)|3|2|H$|Called to create an output record|{0|}}
{30001002|XXparameter|parser|expat|15|1|FKl|XML Parser to use|{2|expat|xerces|}}
{30001002|XXparameter|parser.condition|version 2.11:|3|15|P?|@{0|}}
{30001002|XXparameter|output_count|any number|15|1|FKl|Force an error if the number of output records for a parsed document does not meet this constraint.|{4|any number|exactly one|one or more|zero or one|}}
{30001002|XXparameter|output_count.display_name|output-count|3|9|P|@{0|}}
{30001002|XXparameter|output_count.keyword|output-count|3|9|P|@{0|}}
{30001002|XXparameter|missing_fields|ignore|15|1|FKl|What should be done if an element or attribute is missing in the input document.|{2|ignore|error|}}
{30001002|XXparameter|missing_fields.display_name|missing-fields|3|9|P|@{0|}}
{30001002|XXparameter|missing_fields.keyword|missing-fields|3|9|P|@{0|}}
{30001002|XXparameter|missing_fields.condition|version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_unknown_attributes|False|13|1|FKl|Ignore unknown attributes in the input XML|{0|}}
{30001002|XXparameter|ignore_unknown_attributes.display_name|ignore-unknown-attributes|3|9|P|@{0|}}
{30001002|XXparameter|ignore_unknown_attributes.keyword|ignore-unknown-attributes|3|9|P|@{0|}}
{30001002|XXparameter|ignore_unknown_elements|False|13|1|FKl|Ignore unknown elements in the input XML|{0|}}
{30001002|XXparameter|ignore_unknown_elements.display_name|ignore-unknown-elements|3|9|P|@{0|}}
{30001002|XXparameter|ignore_unknown_elements.keyword|ignore-unknown-elements|3|9|P|@{0|}}
{30001002|XXparameter|ignore_blank_cdata|False|13|1|FKl|Suppress records corresponding to all-whitespace character data|{0|}}
{30001002|XXparameter|ignore_blank_cdata.display_name|ignore-blank-cdata|3|9|P|@{0|}}
{30001002|XXparameter|ignore_blank_cdata.keyword|ignore-blank-cdata|3|9|P|@{0|}}
{30001002|XXparameter|ignore_namespaces|True|13|1|FKl|Ignore namespaces except to disambiguate elements or attributes|{0|}}
{30001002|XXparameter|ignore_namespaces.display_name|ignore-namespaces|3|9|P|@{0|}}
{30001002|XXparameter|ignore_namespaces.keyword|ignore-namespaces|3|9|P|@{0|}}
{30001002|XXparameter|ignore_namespaces.condition|param custom-format False version 2.16.0:|3|15|P?|@{0|}}
{30001002|XXparameter|custom_format|False|13|1|FKl|Use arbitrary type for parsed_xml_type instead of one generated by xml-to-dml.|{0|}}
{30001002|XXparameter|custom_format.display_name|custom-format|3|9|P|@{0|}}
{30001002|XXparameter|custom_format.keyword|custom-format|3|9|P|@{0|}}
{30001002|XXparameter|custom_format.condition|version 2.14.23:|3|15|P?|@{0|}}
{30001002|XXparameter|base_element||3|2|RFK$|Name of the element which will be used to fill the parsed_xml_type record.|{0|}}
{30001002|XXparameter|base_element.display_name|base-element|3|9|P|@{0|}}
{30001002|XXparameter|base_element.keyword|base-element|3|9|P|@{0|}}
{30001002|XXparameter|base_element.condition|param custom-format True version 2.14.23:|3|15|P?|@{0|}}
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
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|version 2.14.46:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1442863192|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"
metadata type: reject = in|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Read XML Transform|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|317|0|856|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|318|0|859|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|319|0|862|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|320|0|865|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|321|0|868|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|322|0|873|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.* :: in.*;
  out.request.soql_query :: "$\{salesforce_soql\}";
  out.request.query_options :: "$\{query_options\}";
end;|3|3|c|@{0|}}
{30001002|XXparameter|out0_metadata|/* Should not be edited */

type query_t=record
  utf8 string('\\0') soql_query;
  utf8 string('\\0') query_options;
end;

metadata type = record
  query_t request;
  utf8 string('\\0') faultcode;
  utf8 string('\\0') faultstring;
  utf8 string('\\0') faultactor = NULL;
  utf8 string('\\0') detail;
end;|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@376003|697653|261000|703000|118000|69000|161|Reformat|Ab Initio Software|Built-in 1.0:|1|10|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|323|0|875|0|{@{}@378000|734000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|324|0|877|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|325|0|879|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|326|0|881|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|327|0|883|0|{@{}@251000|729000|11000|21000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|328|0|887|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1442863192|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|329|0|889|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|330|0|893|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|331|0|896|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|332|0|899|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|333|0|902|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|334|0|905|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Interchange/Salesforce/Internal/mp/Salesforce_CWS_and_Fault_Handling.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_xml_transform|type document_type = utf8 string(integer(4));

//Dummy type...don't translate in Query
type parsed_xml_type = record
string('\\0') Envelope = '';

  // Introspection methods:
  int XML_introspection_version() = 2;
  int XML_schema_model() = 1;
  string('\\0') XML_root_element() = 'Envelope';
  string('\\0') XML_base_element() = 'Envelope';
  string('\\0') XML_leaf_element() = 'Envelope';
  string('\\0') XML_character_data_field() = '';
  string('\\0') XML_element_attributes() = "Envelope=;";
  string('\\0') XML_element_children() = "Envelope=;";

  // Name translations:
  int XML_prefix_namespaces() = 1;
  string('\\0') XML_name_translations() = '';
end;

//Dummy doc...don't translate in Query 
/*Called to prepare a message*/
xml_doc::prepare_document(in)=
begin
  xml_doc::"<Envelope />";
end;

/*Called to create an output record*/
out::create_output(in,parsed_record)=
begin
 out.*::in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|read_xml_output_record_format|record
 utf8 string(big endian integer(4)) request_data;
 utf8 string(big endian integer(4)) response_data;
 end|3|1|l|@{0|}}
{30001002|XXparameter|CWS_PACKAGE|/*
              NOTICE
  COPYRIGHT 2009-2014 AB INITIO
UNPUBLISHED -- ALL RIGHTS RESERVED

This program is confidential and a trade secret of Ab Initio.
Receipt or possession conveys no rights for any purpose without
specific written consent from Ab Initio.
*/
///////////
/* Types */
///////////

/* Metadata for records containing request information */
type request_type =
record
  ascii string("\\0") request_url;
  record
    utf8 string("\\0") name;
    utf8 string("\\0") value;
  end[big endian integer(4)] request_url_params = NULL;
  utf8 string(big endian integer(4)) request_body = NULL;
  utf8 string("\\0") request_http_headers; // 'SOAPAction: ""' should be present
end;

/* Metadata for records containing response information*/
type response_type =
record
  big endian integer(4) response_code;
  ascii string(big endian integer(4)) response_headers = NULL;
  utf8 string(big endian integer(4)) response_body = NULL;
end;

type response_vector_type=response_type[int]; /* Response vector */

/* holds retry counts for timeouts, plus a record number for logging purposes */
type temporary_type =
record
  integer(8) record_num;
  integer(4) thread;
end;

/* use empty string defaults to support timeout test */
type login_reply_type =
record
  utf8 string("\\0") sessionID='';
  utf8 string("\\0") serverURL='';
  integer(4)        errorStatus = 0;
  utf8 string("\\0") errorMessage='';
end;

/////////////
/* Globals */
/////////////

let int testing_flag = ('$\{salesforce_environment\}' == "AbInitioTest");
let string(int) sf_env = string_downcase('$\{salesforce_environment\}');
let int use_gateway=(string_filter_out('$\{gateway\}', ' \\t\\n\\r')!='');
let int append_sessionid = (string_downcase(string_substring('$\{append_sessionid_to_gateway_url\}', 1, 1)) == 't');
let int use_gateway_only_for_login = ("$\{USE_GATEWAY_ONLY_FOR_LOGIN\}" == "True") or ("$\{USE_GATEWAY_ONLY_FOR_LOGIN\}" == "true") or ("$\{USE_GATEWAY_ONLY_FOR_LOGIN\}" == "1");
let ascii string(int) sfdc_hostname=(if (sf_env=="sandbox") "test.salesforce.com" else "login.salesforce.com");
let ascii string(int) salesforce_login_url = string_concat("https://", sfdc_hostname, "/services/Soap/u/", '$\{salesforce_version\}');
let ascii string(int) url_prefix = if (!use_gateway) string_concat("https://", sfdc_hostname, "/") else '$\{gateway\}/' ;

let ascii string(int) login_url = string_concat(url_prefix , "services/Soap/u/", '$\{salesforce_version\}');  // URL for logins

let utf8 string(int) server_url = "";
let utf8 string(int) endpoint_url = "";
let utf8 string(int) session_id = "";

let integer(4) login_sts = do_login();

let integer(4)[$\{CONCURRENT_REQUESTS_MAX_NUMBER\}] retry_counts = make_constant_vector($\{CONCURRENT_REQUESTS_MAX_NUMBER\},-1);
let integer(8) global_rec_num = 0;

/* query_more and query_locator are needed for query. As long as query_locator is "", other types
   won't be affected. */

let utf8 string(int) query_more = '<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><SOAP-ENV:Header><m:SessionHeader xmlns:m="urn:partner.soap.sforce.com"><m:sessionId>SESSION_ID</m:sessionId></m:SessionHeader>ENDPOINT_URL<m:QueryOptions xmlns:m="urn:partner.soap.sforce.com"><m:batchSize>BATCH_SIZE</m:batchSize></m:QueryOptions></SOAP-ENV:Header><SOAP-ENV:Body><m:queryMore xmlns:m="urn:partner.soap.sforce.com"><m:queryLocator>QUERY_LOCATOR</m:queryLocator></m:queryMore></SOAP-ENV:Body></SOAP-ENV:Envelope>';
let utf8 string(int) query_locator = "";

////////////////////////////
/* User defined functions */
////////////////////////////

/* Find an element of the vector which is not allocated yet.
   Return the index of that value to be assigned to temp.
   Set that element to 0, meaning no retries yet. */

out::new_retry_count() =
begin
  let int i=0;
  let int done = 0;
  let int idx;
  for(i,i<length_of(retry_counts) and not done)
  begin
    if (retry_counts[i] == -1)
    begin
      idx = i;
      done = 1;
      retry_counts[idx] = 0;
    end
  end
  out :: idx;
end;

out::increment_retry_count(idx) =
begin
  retry_counts[idx] = retry_counts[idx] + 1;
  out :: 0;
end;

out::drop_retry_count(idx) =
begin
  retry_counts[idx] = -1;
  out :: 0;
end;

out::get_retry_count(idx) =
begin
  out :: retry_counts[idx];
end;

/* Log in to Salesforce account/server */

out::do_login() =
begin
  let login_reply_type reply = allocate ();
  let string("\\0") errorString = "";
  let string("\\0") instanceID  = "";

  if (testing_flag)
    begin
      reply.sessionID    = "fake_session_id";
      reply.serverURL    = "http://felca1:8088/examples/jsp/ab/ab-sleep.jsp?test=test";
      reply.errorStatus  = 0;
      reply.errorMessage = "";
    end
  else
    begin
      if (use_gateway)
        reply = sforce_login("$\{SFDC_USERNAME\}","$\{SFDC_PASSWORD\}", login_url, salesforce_login_url);
      else
        reply = sforce_login("$\{SFDC_USERNAME\}","$\{SFDC_PASSWORD\}", login_url);
      if (reply.errorStatus != 0)
          errorString = errorString + "Error from Salesforce login " + string_representation(+reply.errorStatus) + " : ";
      if (reply.errorStatus != 0 && !is_null(reply.errorMessage))
          errorString = errorString + " " + string_representation(reply.errorMessage);
    end

  if (errorString     != "") force_abort(errorString);
  if (reply.sessionID == "") force_abort("No session ID returned from Salesforce login");
  if (reply.serverURL == "") force_abort("No server URL returned from Salesforce login");

  // Reset global information based upon login

  instanceID   = string_substring(reply.serverURL,string_rindex(reply.serverURL, "/")+1, length_of(reply.serverURL));
  server_url   = if (use_gateway) (login_url + (if (append_sessionid) '/' + instanceID else '')) else reply.serverURL;
  server_url   = if (use_gateway_only_for_login) reply.serverURL else server_url;
  endpoint_url = reply.serverURL;
  session_id   = reply.sessionID;  // sessionId from the login response

  out :: 0;
end;

out::build_request_headers () =
begin
  out :: string_concat('SOAPAction: ""',
         if (use_gateway)
           ('\\nEndpointURL: ' + endpoint_url)
         else
           '');
end;

///////////////////////
/* Builtin functions */
///////////////////////

out::initialize(temp) =
begin
  global_rec_num = global_rec_num+(this_partition()+1);
  out.record_num :: global_rec_num;
  out.thread     :: new_retry_count();

end;

request::prepare_request(in) =
begin
  request.request_url          :: server_url;
  request.request_body         :: string_replace(string_replace(in.request, "SESSION_ID", session_id), "ENDPOINT_URL", "");
  request.request_http_headers :: build_request_headers ();
end;

/* Called for retries and for query_more */

out::prepare_next_request(in, responses, temp) =
begin

  /* If query_more, update that request template. Otherwise, update in.request (for retries) */

  let utf8 string(int) request = if (!is_blank(query_locator))
        string_replace(string_replace(string_replace(string_replace(query_more,"QUERY_LOCATOR",query_locator), "SESSION_ID", session_id),"BATCH_SIZE","$\{batch_size\}"), "ENDPOINT_URL", "")
        else string_replace(string_replace(in.request, "SESSION_ID", session_id), "ENDPOINT_URL", "");
  out.request_url          :: server_url;
  out.request_body         :: request;
  out.request_http_headers :: build_request_headers ();
end;

/* Count retries of actual requests, not while we are logging in */

out::rollup(in, responses, temp) =
begin
  out.record_num :: temp.record_num;
  out.*          :: temp.*;
end;

/* Take the output from the last response. */

out::create_output(in, responses, temp) =
begin
  let integer(4)response_code = responses[length_of(responses) - 1].response_code;
  out.* :: in.*;
  out.response_code :: response_code;
  // Send back empty response when testing
  out.response_data :: if (testing_flag) ''
                       else reinterpret_as(utf8 string(big endian integer(4)), responses[length_of(responses) - 1].response_body);
  out.request_data  :: in.request;
end;

/* Determine whether this is a retry error and retries not exceeded, a success, or a failure.
   On retries, sleep for specified interval. */

out::post_process(in, status, request, responses, temp) =
begin
  let int not_done = 0;
  let integer(4) response_code = if (is_defined(responses) and length_of(responses) > 0)
                                   responses[length_of(responses) - 1].response_code else 0; // don't refer to an element of responses unless it's defined
  let utf8 string("") response_body = if (is_defined(responses) and length_of(responses) > 0)
                                        reinterpret_as(utf8 string(big endian integer(4)), responses[length_of(responses) - 1].response_body) else ""; // don't refer to an element of responses unless it's defined
  let integer(4) success = status == 0;
  let integer(4) http_success = success and response_code/100 == 2;
  let integer(1) http_server_fail = success and response_code/100 == 5;
  let integer(4) timeout = status == 28;   /* 28 is the curl code for timeout */
  let integer(4) retry = ((timeout and get_retry_count(temp.thread) < ((decimal("")) "$\{MAX_RETRY_COUNT\}") - 1));
  let ascii string("\\0") log_status = "";
  let integer(4) exc_start     = 0;
  let integer(1) session_retry = 0;

  let integer(4) return_code = if (retry) 2
    else if (success) 1
    else 0;

  // If the HTTP status was 5xx, get the Salesforce exception code.  We're specifically checking
  //  for a session timeout. If so, force a new login.
  if (http_server_fail) begin
    // Look for just the fragments of start and end elements (in case they change over time)
    //  This should match <sf:exceptionCode>INVALID_SESSION_ID</sf:exceptionCode>
    exc_start = string_index(response_body, ":exceptionCode>INVALID_SESSION_ID</", 0);
    if (exc_start > 0) begin
      session_retry = 1;
      write_to_log("SFDC", "Session timeout - performing login");
      return_code = 2;
      login_sts   = do_login();
    end
  end

  log_status = if (http_success) "SUCCESS"
    else if (timeout and retry)  "TIMEOUT RETRY NUMBER " + string_ltrim((decimal("")) (get_retry_count(temp.thread) + 1))
    else if (timeout)            "TIMED OUT"
    else if (session_retry)      "SESSION TIMEOUT"
    else                         "FAILURE, status: " + string_ltrim((decimal("")) status) + (if (is_defined(response_body) and not is_blank(response_body))", response body: " + response_body);

  if ((return_code == 2) && !session_retry)
    sleep_for_microseconds((decimal("")) "$\{RETRY_DELAY\}" * 1000000);
  if (timeout)
    increment_retry_count(temp.thread);
  if (return_code != 2)
    drop_retry_count(temp.thread);

  write_to_log("SFDC", string_concat("record number: ", (string(" "))(decimal("")) temp.record_num,
                                     ", record:" , reinterpret_as(string(big endian integer(4)), request.request_body),
                                     ", status: ", log_status));

  /* Handle special case for query where more requests (queryMore) are needed
     to get the next set of query responses. */

  if ( ('$\{action\}'=="Query") \|\| ('$\{action\}'=="QueryAll") )
    begin
      not_done = if (testing_flag) 0 else string_index(response_body,"<done>false</done>") != 0;
      if (not_done and http_success)
        begin
          query_locator = string_substring(response_body,string_index(response_body,"<queryLocator>") + 14,
                          string_index(response_body,"</queryLocator>") - string_index(response_body,"<queryLocator>") - 14);
        end
       /*   - returned status from post_process
         0 - error
         1 - request done
         2 - new request needed
         4 - create output record and then do new request
       */

      return_code = if (not_done) 4 else return_code;
    end

  out :: return_code;

end;|3|2|$|@{0|}}
}}@0|@657587|91929|451000|103000|992000|640000|80|Salesforce CWS and Fault Handling|Ab Initio|Created 1/7/2014 2:31:18 PM|1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}.17943547666072845|992000|640000|1|}}
{2010210004|XXGflow|335|0|907|0|{@{}@384|.5|.5|{12|259000|229000|279000|229000|288000|229000|288000|134000|298000|134000|319000|134000|}81|17|}}
{2010210004|XXGflow|336|0|909|0|{@{}@384|.5|0.0|{12|471000|309000|491000|309000|491000|309000|491000|414000|839000|414000|880000|414000|}5|17|}}
{2010210004|XXGflow|337|0|911|0|{@{}@384|.7029703259468079|.5|{12|189000|294000|189000|324000|189000|352000|194000|352000|194000|365000|194000|396000|}83|1041|}}
{2010210004|XXGflow|338|0|913|0|{@{}@384|.5|.5|{10|229000|294000|229000|314000|229000|354000|520000|354000|541000|354000|}89|17|}}
{2010210004|XXGflow|339|0|915|0|{@{}@384|.5|.5|{12|695000|354000|715000|354000|715000|421000|684000|421000|684000|489000|684000|510000|}90|17|}}
{2010210004|XXGflow|340|0|917|0|{@{}@384|.5|.9180327653884888|{12|419000|529000|439000|529000|824000|529000|824000|434000|859000|434000|880000|434000|}6|17|}}
{2010210004|XXGflow|341|0|919|0|{@{}@384|.5|.5|{10|174000|488000|174000|508000|174000|529000|263000|529000|284000|529000|}7|17|}}
{2010210004|XXGflow|342|0|921|0|{@{}@384|.5|.14814814925193787|{12|498000|134000|528000|134000|575000|134000|575000|404000|849000|404000|880000|404000|}8|17|}}
{2010210004|XXGflow|343|0|923|0|{@{}@384|.5|.5|{12|784000|185000|784000|205000|774000|205000|774000|193000|764000|193000|764000|214000|}9|17|}}
{2010210004|XXGflow|344|0|925|0|{@{}@384|.5|.5|{12|498000|94000|538000|94000|611000|94000|611000|114000|685000|114000|706000|114000|}10|17|}}
{2010210004|XXGflow|345|0|927|0|{@{}@384|.5|0.0|{12|498000|174000|518000|174000|518000|241000|310000|241000|310000|309000|331000|309000|}11|17|}}
{2010210004|XXGflow|346|0|929|0|{@{}@384|.5|.6103895902633667|{12|582000|449000|602000|449000|752000|449000|752000|424000|849000|424000|880000|424000|}86|17|}}
{2010210004|XXGflow|347|0|931|0|{@{}@384|.035087719559669495|.5|{10|764000|344000|764000|364000|764000|394000|859000|394000|880000|394000|}12|17|}}
{2010210004|XXGflow|348|0|933|0|{@{}@384|.5|.5|{10|399000|372000|399000|392000|399000|449000|419000|449000|440000|449000|}85|17|}}
{2010210004|XXGflow|349|0|935|0|{@{}@384|.5|.5|{12|149000|294000|149000|334000|149000|354000|154000|354000|154000|375000|154000|396000|}82|1041|}}
{2010501005|XXGpvertex|350|0|937|0|{|{}@0|@106000|157000|126000|177000|123000|107000|84|Call Web Service|Ab Initio Software|Built-in 2.13.1.m6:|1|100|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|351|0|939|0|{@{}@248000|224000|11000|11000|out|0.0|@@@2320|0|}}
{2010203004|XXGoport|352|0|942|0|{@{}@144000|283000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|353|0|945|0|{@{}@184000|283000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|354|0|948|0|{@{}@224000|283000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|355|0|951|0|{@{}@116000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|356|0|953|0|{|{}@0|@310289|51920|330000|72000|158000|127000|13|Dispatch by HTTP Response Code|Ab Initio Software|Built-in 1.0:|1|10|-1||6||36865|1|{1|0|}}}
{2010203004|XXGoport|357|0|955|0|{@{}@487000|89000|11000|11000|_2xx|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|358|0|958|0|{@{}@487000|129000|11000|11000|Other|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|359|0|961|0|{@{}@487000|169000|11000|11000|_5xx|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|360|0|964|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|361|0|966|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|362|0|968|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|363|0|970|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|364|0|972|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|365|0|974|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|366|0|976|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|367|0|978|0|{@{}@320000|129000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|368|0|981|0|{|{}@0|@275001|456000|295000|476000|114000|107000|14|Error as Fault|Ab Initio Software|Built-in 1.0:|1|10|-1||6||36865|1|{1|0|}}}
{2010203004|XXGoport|369|0|983|0|{@{}@408000|524000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|370|0|986|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|371|0|988|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|372|0|990|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|373|0|992|0|{@{}@285000|524000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|374|0|995|0|{|{}@0|@108647|387000|129000|407000|90000|71000|15|Fuse|Ab Initio Software|Built-in 2.10:|1|10|-1||6||36993|1|{1|0|}}}
{2010203004|XXGoport|375|0|997|0|{@{}@169000|477000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|376|0|1000|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|377|0|1002|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|378|0|1004|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|379|0|1006|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|380|0|1008|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|381|0|1010|0|{@{}@149000|397000|11000|11000|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|382|0|1013|0|{@{}@189000|397000|11000|11000|in1|0.0|count|in|1|1936|0|}}
{2010501005|XXGpvertex|383|0|1016|0|{|{}@0|@881001|383000|891000|377000|50000|71000|16|Gather|Ab Initio Software|Built-in 1.0:|1|10|-1||6||36865|1|{1|0|}}}
{2010203004|XXGoport|384|0|1018|0|{@{}@940000|409000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|385|0|1020|0|{@{}@881000|389000|11000|51000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|386|0|1027|0|{|{}@0|@697635|205061|718000|225000|90000|109000|17|Not Expected Response|Ab Initio Software|Built-in 1.0:|1|10|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|387|0|1029|0|{@{}@759000|333000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|388|0|1032|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|389|0|1034|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|390|0|1036|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|391|0|1038|0|{@{}@759000|215000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|392|0|1041|0|{|{}@0|@430883|377000|451000|397000|121000|107000|87|Not a SOAP Fault|Ab Initio Software|Built-in 1.0:|1|10|-1||6||36865|1|{1|0|}}}
{2010203004|XXGoport|393|0|1043|0|{@{}@571000|444000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|394|0|1046|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|395|0|1048|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|396|0|1050|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|397|0|1052|0|{@{}@441000|444000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|398|0|1055|0|{|{}@0|@532000|281500|552000|302000|133000|107000|91|Put data back to full utf8|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|399|0|1057|0|{@{}@684000|349000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|400|0|1060|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|401|0|1062|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|402|0|1064|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|403|0|1066|0|{@{}@542000|349000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|404|0|1069|0|{|{}@0|@321702|234520|342000|255000|119000|107000|18|Read Fault XML Transform|Ab Initio Software|Built-in 2.14.19:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|405|0|1071|0|{@{}@460000|304000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|406|0|1074|0|{@{}@394000|361000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|407|0|1077|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|408|0|1079|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|409|0|1081|0|{@{}@332000|304000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|410|0|1084|0|{|{}@0|@697225|29276|717000|49000|134000|126000|19|Read Response XML Transform|Ab Initio Software|Built-in 2.14.19:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|411|0|1086|0|{@{}@850000|109000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|412|0|1088|0|{@{}@779000|174000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|413|0|1091|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|414|0|1093|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|415|0|1095|0|{@{}@707000|109000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|416|0|1098|0|{|{}@0|@651000|515000|666000|521000|40000|47000|88|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|417|0|1100|0|{@{}@679000|567000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|418|0|1102|0|{@{}@679000|511000|11000|11000|in|0.0|@@@1812|0|}}
{2010203004|XXGoport|419|0|1105|0|{@{}@489000|216000|11000|11000|fault|.25|@@@13712|0|}}
{2010203004|XXGoport|420|0|1109|0|{@{}@628000|154000|11000|11000|out0|.5|@@@14736|0|}}
{2010203004|XXGoport|421|0|1113|0|{@{}@564000|216000|11000|11000|log|.6723790322580645|@@@13336|0|}}
{2010202004|XXGiport|422|0|1116|0|{@{}@441000|154000|11000|11000|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|423|0|1120|0|{
COPYRIGHT 2008 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|read_xml_transform||8|9|RFO|Functions for message creation|{0|}}
{30001002|XXparameter|read_xml_output_record_format||7|1|RFsl||{0|}}
{30001002|XXparameter|BATCH_SIZE|$batch_size|3|2|RFK$||{0|}}
{30001002|XXparameter|MAX_RETRY_COUNT|$max_retry_count|3|2|RFK$||{0|}}
{30001002|XXparameter|RETRY_DELAY|$retry_delay|3|2|RFK$||{0|}}
{30001002|XXparameter|SFDC_USERNAME|$salesforce_username|3|2|RFK$||{0|}}
{30001002|XXparameter|SFDC_PASSWORD|$salesforce_encrypted_password|3|2|RFK$||{0|}}
{30001002|XXparameter|CONCURRENCY_MODE|$concurrency_mode|3|2|RFK$|Mode that controls concurrency parameters|{0|}}
{30001002|XXparameter|CONCURRENT_REQUESTS_MAX_NUMBER|$concurrent_requests_max_number|1|2|RFK$|Maximum number of concurrent requests.|{0|}}
{30001002|XXparameter|SAVE_OUTPUT_FREQUENCY|$save_output_frequency|3|2|RFK$||{0|}}
{30001002|XXparameter|NETWORK_USE_HTTP_PROXY|$network_use_http_proxy|13|2|RF$|Use HTTP proxy.|{0|}}
{30001002|XXparameter|HTTP_PROXY_HOST_NAME|$http_proxy_host_name|3|2|RFK$|HTTP proxy host name.|{0|}}
{30001002|XXparameter|HTTP_PROXY_AUTH_METHOD|$http_proxy_auth_method|3|2|FK$||{0|}}
{30001002|XXparameter|HTTP_PROXY_AUTH_USER_NAME|$http_proxy_auth_user_name|3|2|FK$||{0|}}
{30001002|XXparameter|HTTP_PROXY_AUTH_USER_PASSWORD|$http_proxy_auth_user_password|3|2|FK$||{0|}}
{30001002|XXparameter|HTTP_REQUEST_TIMEOUT|$http_request_timeout|1|2|RFK$|The maximum time in seconds that the processing of HTTP request can take.|{0|}}
{30001002|XXparameter|GATEWAY|$gateway|3|2|FK$||{0|}}
{30001002|XXparameter|USE_GATEWAY_ONLY_FOR_LOGIN|$use_gateway_only_for_login|13|2|RFK$||{0|}}
{30001002|XXparameter|APPEND_SESSIONID_TO_GATEWAY_URL|$append_sessionid_to_gateway_url|13|2|RFK$||{0|}}
{30001002|XXparameter|SSL_CERT_FILE|$ssl_cert_file|3|2|FK$|URL to file with certificate for client|{0|}}
{30001002|XXparameter|SSL_CERT_TYPE|$ssl_cert_type|15|2|FK$|Type of client certificate, one of DER, PEM, or ENG|{3|PEM|DER|ENG|}}
{30001002|XXparameter|SSL_CERT_PASSWORD|$ssl_cert_password|3|2|FK$|Password for the client certificate|{0|}}
{30001002|XXparameter|SSL_PRIVATE_KEY|$ssl_private_key|3|2|FK$|URL to file with client private key|{0|}}
{30001002|XXparameter|SSL_PRIVATE_KEY_TYPE|$ssl_private_key_type|15|2|FK$|Type of client private key, one of DER, PEM, or ENG|{3|PEM|DER|ENG|}}
{30001002|XXparameter|SSL_PRIVATE_KEY_PASSWORD|$ssl_private_key_password|3|2|FK$|Password for the client private key|{0|}}
{30001002|XXparameter|SSL_CACERT_FILE|$ssl_cacert_file|3|2|FK$|URL to file with X509 CA certificates|{0|}}
{30001002|XXparameter|CWS_PACKAGE|/*
              NOTICE
  COPYRIGHT 2009-2014 AB INITIO
UNPUBLISHED -- ALL RIGHTS RESERVED

This program is confidential and a trade secret of Ab Initio.
Receipt or possession conveys no rights for any purpose without
specific written consent from Ab Initio.
*/
///////////
/* Types */
///////////

/* Metadata for records containing request information */
type request_type =
record
  ascii string("\\0") request_url;
  record
    utf8 string("\\0") name;
    utf8 string("\\0") value;
  end[big endian integer(4)] request_url_params = NULL;
  utf8 string(big endian integer(4)) request_body = NULL;
  utf8 string("\\0") request_http_headers; // 'SOAPAction: ""' should be present
end;

/* Metadata for records containing response information*/
type response_type =
record
  big endian integer(4) response_code;
  ascii string(big endian integer(4)) response_headers = NULL;
  utf8 string(big endian integer(4)) response_body = NULL;
end;

type response_vector_type=response_type[int]; /* Response vector */

/* holds retry counts for timeouts, plus a record number for logging purposes */
type temporary_type =
record
  integer(8) record_num;
  integer(4) thread;
end;

/* use empty string defaults to support timeout test */
type login_reply_type =
record
  utf8 string("\\0") sessionID='';
  utf8 string("\\0") serverURL='';
  integer(4)        errorStatus = 0;
  utf8 string("\\0") errorMessage='';
end;

/////////////
/* Globals */
/////////////
let string(int) sf_env = string_downcase('$\{salesforce_environment\}');
let int testing_flag = ('$\{salesforce_environment\}' == "AbInitioTest");
let int use_gateway=(string_filter_out('$\{gateway\}', ' \\t\\n\\r')!='');
let int append_sessionid = (string_downcase(string_substring('$\{append_sessionid_to_gateway_url\}', 1, 1)) == 't');
let int use_gateway_only_for_login = ("$\{USE_GATEWAY_ONLY_FOR_LOGIN\}" == "True") or ("$\{USE_GATEWAY_ONLY_FOR_LOGIN\}" == "true") or ("$\{USE_GATEWAY_ONLY_FOR_LOGIN\}" == "1") ;
let ascii string(int) salesforce_login_url = string_concat("https://", if (sf_env=="sandbox") "test" else "www" , ".salesforce.com/", "services/Soap/u/", '$\{salesforce_version\}');
let ascii string(int) url_prefix = if (!use_gateway) string_concat("https://", if (sf_env=="sandbox")  "test" else "www" , ".salesforce.com/") else '$\{gateway\}/' ;

let ascii string(int) login_url = string_concat(url_prefix , "services/Soap/u/", '$\{salesforce_version\}');  // URL for logins

let utf8 string(int) server_url = "";
let utf8 string(int) endpoint_url = "";
let utf8 string(int) session_id = "";

let integer(4) login_sts = do_login();

let integer(4)[$\{CONCURRENT_REQUESTS_MAX_NUMBER\}] retry_counts = make_constant_vector($\{CONCURRENT_REQUESTS_MAX_NUMBER\},-1);
let integer(8) global_rec_num = 0;

/* query_more and query_locator are needed for query. As long as query_locator is "", other types
   won't be affected. */

let utf8 string(int) query_more = '<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><SOAP-ENV:Header><m:SessionHeader xmlns:m="urn:partner.soap.sforce.com"><m:sessionId>SESSION_ID</m:sessionId></m:SessionHeader>ENDPOINT_URL<m:QueryOptions xmlns:m="urn:partner.soap.sforce.com"><m:batchSize>BATCH_SIZE</m:batchSize></m:QueryOptions></SOAP-ENV:Header><SOAP-ENV:Body><m:queryMore xmlns:m="urn:partner.soap.sforce.com"><m:queryLocator>QUERY_LOCATOR</m:queryLocator></m:queryMore></SOAP-ENV:Body></SOAP-ENV:Envelope>';
let utf8 string(int) query_locator = "";

////////////////////////////
/* User defined functions */
////////////////////////////

/* Find an element of the vector which is not allocated yet.
   Return the index of that value to be assigned to temp.
   Set that element to 0, meaning no retries yet. */

out::new_retry_count() =
begin
  let int i=0;
  let int done = 0;
  let int idx;
  for(i,i<length_of(retry_counts) and not done)
  begin
    if (retry_counts[i] == -1)
    begin
      idx = i;
      done = 1;
      retry_counts[idx] = 0;
    end
  end
  out :: idx;
end;

out::increment_retry_count(idx) =
begin
  retry_counts[idx] = retry_counts[idx] + 1;
  out :: 0;
end;

out::drop_retry_count(idx) =
begin
  retry_counts[idx] = -1;
  out :: 0;
end;

out::get_retry_count(idx) =
begin
  out :: retry_counts[idx];
end;

/* Log in to Salesforce account/server */

out::do_login() =
begin
  let login_reply_type reply = allocate ();
  let string("\\0") errorString = "";
  let string("\\0") instanceID  = "";

  if (testing_flag)
    begin
      reply.sessionID    = "fake_session_id";
      reply.serverURL    = "http://felca1:8088/examples/jsp/ab/ab-sleep.jsp?test=test";
      reply.errorStatus  = 0;
      reply.errorMessage = "";
    end
  else
    begin
      if (use_gateway)
        reply = sforce_login("$\{SFDC_USERNAME\}","$\{SFDC_PASSWORD\}", login_url, salesforce_login_url);
      else
        reply = sforce_login("$\{SFDC_USERNAME\}","$\{SFDC_PASSWORD\}", login_url);
      if (reply.errorStatus != 0)
          errorString = errorString + "Error from Salesforce login " + string_representation(+reply.errorStatus) + " : ";
      if (reply.errorStatus != 0 && !is_null(reply.errorMessage))
          errorString = errorString + " " + string_representation(reply.errorMessage);
    end

  if (errorString     != "") force_abort(errorString);
  if (reply.sessionID == "") force_abort("No session ID returned from Salesforce login");
  if (reply.serverURL == "") force_abort("No server URL returned from Salesforce login");

  // Reset global information based upon login

  instanceID   = string_substring(reply.serverURL,string_rindex(reply.serverURL, "/")+1, length_of(reply.serverURL));
  server_url   = if (use_gateway) (login_url + (if (append_sessionid) '/' + instanceID else '')) else reply.serverURL;
  server_url   = if (use_gateway_only_for_login) reply.serverURL else server_url;
  endpoint_url = reply.serverURL;
  session_id   = reply.sessionID;  // sessionId from the login response

  out :: 0;
end;

out::build_request_headers () =
begin
  out :: string_concat('SOAPAction: ""',
         if (use_gateway)
           ('\\nEndpointURL: ' + endpoint_url)
         else
           '');
end;

///////////////////////
/* Builtin functions */
///////////////////////

out::initialize(temp) =
begin
  global_rec_num = global_rec_num+(this_partition()+1);
  out.record_num :: global_rec_num;
  out.thread     :: new_retry_count();

end;

request::prepare_request(in) =
begin
  request.request_url          :: server_url;
  request.request_body         :: string_replace(string_replace(in.request, "SESSION_ID", session_id), "ENDPOINT_URL", "");
  request.request_http_headers :: build_request_headers ();
end;

/* Called for retries and for query_more */

out::prepare_next_request(in, responses, temp) =
begin

  /* If query_more, update that request template. Otherwise, update in.request (for retries) */

  let utf8 string(int) request = if (!is_blank(query_locator))
        string_replace(string_replace(string_replace(string_replace(query_more,"QUERY_LOCATOR",query_locator), "SESSION_ID", session_id),"BATCH_SIZE","$\{batch_size\}"), "ENDPOINT_URL", "")
        else string_replace(string_replace(in.request, "SESSION_ID", session_id), "ENDPOINT_URL", "");
  out.request_url          :: server_url;
  out.request_body         :: request;
  out.request_http_headers :: build_request_headers ();
end;

/* Count retries of actual requests, not while we are logging in */

out::rollup(in, responses, temp) =
begin
  out.record_num :: temp.record_num;
  out.*          :: temp.*;
end;

/* Take the output from the last response. */

out::create_output(in, responses, temp) =
begin
  let integer(4)response_code = responses[length_of(responses) - 1].response_code;
  out.* :: in.*;
  out.response_code :: response_code;
  // Send back empty response when testing
  out.response_data :: if (testing_flag) ''
                       else reinterpret_as(utf8 string(big endian integer(4)), responses[length_of(responses) - 1].response_body);
  out.request_data  :: in.request;
end;

/* Determine whether this is a retry error and retries not exceeded, a success, or a failure.
   On retries, sleep for specified interval. */

out::post_process(in, status, request, responses, temp) =
begin
  let int not_done = 0;
  let integer(4) response_code = if (is_defined(responses) and length_of(responses) > 0)
                                   responses[length_of(responses) - 1].response_code else 0; // don't refer to an element of responses unless it's defined
  let utf8 string("") response_body = if (is_defined(responses) and length_of(responses) > 0)
                                        reinterpret_as(utf8 string(big endian integer(4)), responses[length_of(responses) - 1].response_body) else ""; // don't refer to an element of responses unless it's defined
  let integer(4) success = status == 0;
  let integer(4) http_success = success and response_code/100 == 2;
  let integer(1) http_server_fail = success and response_code/100 == 5;
  let integer(4) timeout = status == 28;   /* 28 is the curl code for timeout */
  let integer(4) retry = ((timeout and get_retry_count(temp.thread) < ((decimal("")) "$\{MAX_RETRY_COUNT\}") - 1));
  let ascii string("\\0") log_status = "";
  let integer(4) exc_start     = 0;
  let integer(1) session_retry = 0;

  let integer(4) return_code = if (retry) 2
    else if (success) 1
    else 0;

  // If the HTTP status was 5xx, get the Salesforce exception code.  We're specifically checking
  //  for a session timeout. If so, force a new login.
  if (http_server_fail) begin
    // Look for just the fragments of start and end elements (in case they change over time)
    //  This should match <sf:exceptionCode>INVALID_SESSION_ID</sf:exceptionCode>
    exc_start = string_index(response_body, ":exceptionCode>INVALID_SESSION_ID</", 0);
    if (exc_start > 0) begin
      session_retry = 1;
      write_to_log("SFDC", "Session timeout - performing login");
      return_code = 2;
      login_sts   = do_login();
    end
  end

  log_status = if (http_success) "SUCCESS"
    else if (timeout and retry)  "TIMEOUT RETRY NUMBER " + string_ltrim((decimal("")) (get_retry_count(temp.thread) + 1))
    else if (timeout)            "TIMED OUT"
    else if (session_retry)      "SESSION TIMEOUT"
    else                         "FAILURE, status: " + string_ltrim((decimal("")) status) + (if (is_defined(response_body) and not is_blank(response_body))", response body: " + response_body);

  if ((return_code == 2) && !session_retry)
    sleep_for_microseconds((decimal("")) "$\{RETRY_DELAY\}" * 1000000);
  if (timeout)
    increment_retry_count(temp.thread);
  if (return_code != 2)
    drop_retry_count(temp.thread);

  write_to_log("SFDC", string_concat("record number: ", (string(" "))(decimal("")) temp.record_num, ", record:" , reinterpret_as( string(big endian integer(4)), (request.request_body)) , ", status: " , log_status));

  /* Handle special case for query where more requests (queryMore) are needed
     to get the next set of query responses. */

  if ( ('$\{action\}'=="Query") \|\| ('$\{action\}'=="QueryAll") )
    begin
      not_done = if (testing_flag) 0 else string_index(response_body,"<done>false</done>") != 0;
      if (not_done and http_success)
        begin
          query_locator = string_substring(response_body,string_index(response_body,"<queryLocator>") + 14,
                          string_index(response_body,"</queryLocator>") - string_index(response_body,"<queryLocator>") - 14);
        end
       /*   - returned status from post_process
         0 - error
         1 - request done
         2 - new request needed
         4 - create output record and then do new request
       */

      return_code = if (not_done) 4 else return_code;
    end

  out :: return_code;

end;|8|3|RFKc||{0|}}
{30001002|XXparameter|CONCURRENT_REQUESTS_MAINTAIN_RECORD_ORDER|$[if(CONCURRENCY_MODE=='batch' and ((integer(4)) (decimal(' ')) SAVE_OUTPUT_FREQUENCY)>0) 'True' else 'False']|3|9|RFK||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1442863187|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@1443000|356000|0|0|992000|640000|0|Salesforce_CWS_and_Fault_Handling|||1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|992000|640000|3|}}
{2010210004|XXGflow|424|0|1122|0|{@{}@384|.5|.5|{12|259000|229000|279000|229000|288000|229000|288000|134000|298000|134000|319000|134000|}81|17|}}
{2010210004|XXGflow|425|0|1124|0|{@{}@384|.5|0.0|{12|471000|309000|491000|309000|491000|309000|491000|414000|839000|414000|880000|414000|}5|17|}}
{2010210004|XXGflow|426|0|1126|0|{@{}@384|.7029703259468079|.5|{12|189000|294000|189000|324000|189000|352000|194000|352000|194000|365000|194000|396000|}83|1041|}}
{2010210004|XXGflow|427|0|1128|0|{@{}@384|.5|.5|{10|229000|294000|229000|314000|229000|354000|520000|354000|541000|354000|}89|17|}}
{2010210004|XXGflow|428|0|1130|0|{@{}@384|.5|.5|{12|695000|354000|715000|354000|715000|421000|684000|421000|684000|489000|684000|510000|}90|17|}}
{2010210004|XXGflow|429|0|1132|0|{@{}@384|.5|.9180327653884888|{12|419000|529000|439000|529000|824000|529000|824000|434000|859000|434000|880000|434000|}6|17|}}
{2010210004|XXGflow|430|0|1134|0|{@{}@384|.5|.5|{10|174000|488000|174000|508000|174000|529000|263000|529000|284000|529000|}7|17|}}
{2010210004|XXGflow|431|0|1136|0|{@{}@384|.5|.14814814925193787|{12|498000|134000|528000|134000|575000|134000|575000|404000|849000|404000|880000|404000|}8|17|}}
{2010210004|XXGflow|432|0|1138|0|{@{}@384|.5|.5|{12|784000|185000|784000|205000|774000|205000|774000|193000|764000|193000|764000|214000|}9|17|}}
{2010210004|XXGflow|433|0|1140|0|{@{}@384|.5|.5|{12|498000|94000|538000|94000|611000|94000|611000|114000|685000|114000|706000|114000|}10|17|}}
{2010210004|XXGflow|434|0|1142|0|{@{}@384|.5|0.0|{12|498000|174000|518000|174000|518000|241000|310000|241000|310000|309000|331000|309000|}11|17|}}
{2010210004|XXGflow|435|0|1144|0|{@{}@384|.5|.6103895902633667|{12|582000|449000|602000|449000|752000|449000|752000|424000|849000|424000|880000|424000|}86|17|}}
{2010210004|XXGflow|436|0|1146|0|{@{}@384|.035087719559669495|.5|{10|764000|344000|764000|364000|764000|394000|859000|394000|880000|394000|}12|17|}}
{2010210004|XXGflow|437|0|1148|0|{@{}@384|.5|.5|{10|399000|372000|399000|392000|399000|449000|419000|449000|440000|449000|}85|17|}}
{2010210004|XXGflow|438|0|1150|0|{@{}@384|.5|.5|{12|149000|294000|149000|334000|149000|354000|154000|354000|154000|375000|154000|396000|}82|1041|}}
{2010501005|XXGpvertex|439|0|1152|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/Web_Services/Call_Web_Service.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|package|$\{CWS_PACKAGE\}|3|3|c|@{0|}}
{30001002|XXparameter|simple_interface|False|3|1|l|@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|network_use_http_proxy|$NETWORK_USE_HTTP_PROXY|3|2|$|@{0|}}
{30001002|XXparameter|network_http_proxy_host|$HTTP_PROXY_HOST_NAME|3|2|$|@{0|}}
{30001002|XXparameter|network_http_proxy_auth_method|$HTTP_PROXY_AUTH_METHOD|3|2|$|@{0|}}
{30001002|XXparameter|network_http_proxy_auth_user_name|$HTTP_PROXY_AUTH_USER_NAME|3|2|$|@{0|}}
{30001002|XXparameter|network_http_proxy_auth_user_password|$HTTP_PROXY_AUTH_USER_PASSWORD|3|2|$|@{0|}}
{30001002|XXparameter|http_auth_user_name|$HTTP_PROXY_AUTH_USER_NAME|3|2|$|@{0|}}
{30001002|XXparameter|http_auth_user_password_encrypted|$HTTP_PROXY_AUTH_USER_PASSWORD_ENCRYPTED|3|2|$|@{0|}}
{30001002|XXparameter|http_request_timeout|$HTTP_REQUEST_TIMEOUT|3|2|$|@{0|}}
{30001002|XXparameter|http_request_type|POST|3|1|l|@{0|}}
{30001002|XXparameter|http_request_headers|SOAPAction: "$SOAPAction"|3|2|$|@{0|}}
{30001002|XXparameter|show_ssl|True|3|1|l|@{0|}}
{30001002|XXparameter|ssl_cert_file|$SSL_CERT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|ssl_cert_type|$SSL_CERT_TYPE|3|2|$|@{0|}}
{30001002|XXparameter|ssl_cert_password|$SSL_CERT_PASSWORD|3|2|$|@{0|}}
{30001002|XXparameter|ssl_private_key|$SSL_PRIVATE_KEY|3|2|$|@{0|}}
{30001002|XXparameter|ssl_private_key_type|$SSL_PRIVATE_KEY_TYPE|3|2|$|@{0|}}
{30001002|XXparameter|ssl_private_key_password|$SSL_PRIVATE_KEY_PASSWORD|3|2|$|@{0|}}
{30001002|XXparameter|ssl_cacert_file|$SSL_CACERT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|connection_timeout|$[HTTP_REQUEST_TIMEOUT/2]|3|9||@{0|}}
{30001002|XXparameter|concurrency_mode|$CONCURRENCY_MODE|3|2|$|@{0|}}
{30001002|XXparameter|concurrent_requests_allowed|True|3|9||@{0|}}
{30001002|XXparameter|concurrent_requests_max_number|$CONCURRENT_REQUESTS_MAX_NUMBER|3|2|$|@{0|}}
{30001002|XXparameter|concurrent_requests_maintain_record_order|$CONCURRENT_REQUESTS_MAINTAIN_RECORD_ORDER|3|2|$|@{0|}}
{30001002|XXparameter|save_output_frequency|$SAVE_OUTPUT_FREQUENCY|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata|record 
  utf8 string(integer(4)) request;
  utf8 string(integer(4))[big endian integer(4)] other_payload;
end|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|record
  integer(4) response_code;
  utf8 string(integer(4)) response_data;
  utf8 string(integer(4)) request_data;
  utf8 string(integer(4))[integer(4)] other_payload;
end;|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|record
  ascii string(big endian integer(4)) response_headers = NULL;
  void(big endian integer(4)) response_body = NULL;
  ascii string("\\0") error = NULL;
  big endian integer(4) error_code = NULL;
end|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@106000|157000|126000|177000|123000|107000|84|Call Web Service|Ab Initio Software|Built-in 2.13.1.m6:|1|100|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|440|0|1154|0|{@{}@248000|224000|11000|11000|out|0.0|@@@2320|0|}}
{2010203004|XXGoport|441|0|1157|0|{@{}@144000|283000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|442|0|1160|0|{@{}@184000|283000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|443|0|1163|0|{@{}@224000|283000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|444|0|1166|0|{@{}@116000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|445|0|1168|0|{Call Web Service Component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|call-web-service|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/internet-connector|3|2|H$||{0|}}
{30001002|XXparameter|package||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|simple_interface|True|13|1|Fl|Present a subset of available parameters|{0|}}
{30001002|XXparameter|simple_interface.display_name|simple-interface|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if errors happen|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|network_port||1|2|FK$|Remote port number.|{0|}}
{30001002|XXparameter|network_port.display_name|network-port|3|9|P|@{0|}}
{30001002|XXparameter|network_port.keyword|network-port|3|9|P|@{0|}}
{30001002|XXparameter|network_port.condition|param simple-interface False|3|15|P?|@{0|}}
{30001002|XXparameter|network_receive_buffer_size||1|2|FK$|Receive buffer size.|{0|}}
{30001002|XXparameter|network_receive_buffer_size.display_name|network-receive-buffer-size|3|9|P|@{0|}}
{30001002|XXparameter|network_receive_buffer_size.keyword|network-receive-buffer-size|3|9|P|@{0|}}
{30001002|XXparameter|network_receive_buffer_size.condition|param simple-interface False|3|15|P?|@{0|}}
{30001002|XXparameter|network_dns_cache_timeout|60|1|2|FK$|DNS cache timeout.|{0|}}
{30001002|XXparameter|network_dns_cache_timeout.display_name|network-dns-cache-timeout|3|9|P|@{0|}}
{30001002|XXparameter|network_dns_cache_timeout.keyword|network-dns-cache-timeout|3|9|P|@{0|}}
{30001002|XXparameter|network_dns_cache_timeout.condition|param simple-interface False|3|15|P?|@{0|}}
{30001002|XXparameter|network_use_http_proxy|False|13|1|Fl|Use HTTP proxy.|{0|}}
{30001002|XXparameter|network_use_http_proxy.display_name|network-use-http-proxy|3|9|P|@{0|}}
{30001002|XXparameter|network_http_proxy_host||3|2|FK$|HTTP proxy host name.|{0|}}
{30001002|XXparameter|network_http_proxy_host.display_name|network-http-proxy-host|3|9|P|@{0|}}
{30001002|XXparameter|network_http_proxy_host.keyword|network-http-proxy-host|3|9|P|@{0|}}
{30001002|XXparameter|network_http_proxy_host.condition|param network-use-http-proxy True|3|15|P?|@{0|}}
{30001002|XXparameter|network_http_proxy_auth_method|None|15|1|FKl|HTTP proxy authentication Method.|{2|None|Basic|}}
{30001002|XXparameter|network_http_proxy_auth_method.display_name|network-http-proxy-auth-method|3|9|P|@{0|}}
{30001002|XXparameter|network_http_proxy_auth_method.keyword|network-http-proxy-auth-method|3|9|P|@{0|}}
{30001002|XXparameter|network_http_proxy_auth_method.condition|param network-use-http-proxy True|3|15|P?|@{0|}}
{30001002|XXparameter|network_http_proxy_auth_user_name||3|2|FK$|HTTP proxy login name.|{0|}}
{30001002|XXparameter|network_http_proxy_auth_user_name.display_name|network-http-proxy-auth-user-name|3|9|P|@{0|}}
{30001002|XXparameter|network_http_proxy_auth_user_name.keyword|network-http-proxy-auth-user-name|3|9|P|@{0|}}
{30001002|XXparameter|network_http_proxy_auth_user_name.condition|param network-use-http-proxy True param network-http-proxy-auth-method Basic|3|15|P?|@{0|}}
{30001002|XXparameter|network_http_proxy_auth_user_password||3|2|FK$|HTTP proxy login password.|{0|}}
{30001002|XXparameter|network_http_proxy_auth_user_password.display_name|network-http-proxy-auth-user-password|3|9|P|@{0|}}
{30001002|XXparameter|network_http_proxy_auth_user_password.keyword|network-http-proxy-auth-user-password|3|9|P|@{0|}}
{30001002|XXparameter|network_http_proxy_auth_user_password.condition|param network-use-http-proxy True param network-http-proxy-auth-method Basic|3|15|P?|@{0|}}
{30001002|XXparameter|http_protocol_version|1.1|15|1|FKl|HTTP protocol version.|{3|1.1|1.0|Any|}}
{30001002|XXparameter|http_protocol_version.display_name|http-protocol-version|3|9|P|@{0|}}
{30001002|XXparameter|http_protocol_version.keyword|http-protocol-version|3|9|P|@{0|}}
{30001002|XXparameter|http_protocol_version.condition|param simple-interface False|3|15|P?|@{0|}}
{30001002|XXparameter|http_auth_method|None|15|1|FKl|HTTP authentication Method.|{3|None|Basic|NTLM|}}
{30001002|XXparameter|http_auth_method.display_name|http-auth-method|3|9|P|@{0|}}
{30001002|XXparameter|http_auth_method.keyword|http-auth-method|3|9|P|@{0|}}
{30001002|XXparameter|has_userpasswd|value http-auth-method Basic 1 value http-auth-method NTLM 1 value http-auth-method * 0|3|13|v|Dummy for parameter requests-allowed enable|{0|}}
{30001002|XXparameter|http_auth_user_name||3|2|FK$|Login name.|{0|}}
{30001002|XXparameter|http_auth_user_name.display_name|http-auth-user-name|3|9|P|@{0|}}
{30001002|XXparameter|http_auth_user_name.keyword|http-auth-user-name|3|9|P|@{0|}}
{30001002|XXparameter|http_auth_user_name.condition|param has_userpasswd 1|3|15|P?|@{0|}}
{30001002|XXparameter|http_auth_user_password||3|2|FK$|Login password.|{0|}}
{30001002|XXparameter|http_auth_user_password.display_name|http-auth-user-password|3|9|P|@{0|}}
{30001002|XXparameter|http_auth_user_password.keyword|http-auth-user-password|3|9|P|@{0|}}
{30001002|XXparameter|http_auth_user_password.condition|param has_userpasswd 1|3|15|P?|@{0|}}
{30001002|XXparameter|http_auth_user_password_encrypted||3|2|FK$|Login password(encrypted).|{0|}}
{30001002|XXparameter|http_auth_user_password_encrypted.display_name|http-auth-user-password-encrypted|3|9|P|@{0|}}
{30001002|XXparameter|http_auth_user_password_encrypted.keyword|http-auth-user-password-encrypted|3|9|P|@{0|}}
{30001002|XXparameter|http_auth_user_password_encrypted.condition|param has_userpasswd 1 version 2.15.3.r27:|3|15|P?|@{0|}}
{30001002|XXparameter|http_auth_ignore_on_redirect|False|13|1|FKl|Do not authenticate on redirect.|{0|}}
{30001002|XXparameter|http_auth_ignore_on_redirect.display_name|http-auth-ignore-on-redirect|3|9|P|@{0|}}
{30001002|XXparameter|http_auth_ignore_on_redirect.keyword|http-auth-ignore-on-redirect|3|9|P|@{0|}}
{30001002|XXparameter|http_auth_ignore_on_redirect.condition|param http-ignore-redirect False param http-auth-method Basic|3|15|P?|@{0|}}
{30001002|XXparameter|http_request_timeout|20|2|2|FK$|The maximum time in seconds that the processing of HTTP request can take.|{0|}}
{30001002|XXparameter|http_request_timeout.display_name|http-request-timeout|3|9|P|@{0|}}
{30001002|XXparameter|http_request_timeout.keyword|http-request-timeout|3|9|P|@{0|}}
{30001002|XXparameter|http_request_type|GET|15|1|FKl|HTTP request type.|{4|GET|POST|PUT|DELETE|}}
{30001002|XXparameter|http_request_type.display_name|http-request-type|3|9|P|@{0|}}
{30001002|XXparameter|http_request_type.keyword|http-request-type|3|9|P|@{0|}}
{30001002|XXparameter|http_request_body_type|text/xml|15|1|FKl|Content type of the body of HTTP request.|{6|text/xml|text/html|text/plain|application/x-www-form-urlencoded|application/octet-stream|application/soap+xml|}}
{30001002|XXparameter|http_request_body_type.display_name|http-request-body-type|3|9|P|@{0|}}
{30001002|XXparameter|http_request_body_type.keyword|http-request-body-type|3|9|P|@{0|}}
{30001002|XXparameter|http_request_body_type.condition|param http-request-type P*|3|15|P?|@{0|}}
{30001002|XXparameter|http_request_body_charset|utf-8|15|1|FKl|Character set of the body of HTTP request.|{13|utf-8|iso-8859-1|iso-8859-2|iso-8859-3|iso-8859-4|iso-8859-5|iso-8859-6|iso-8859-7|iso-8859-8|iso-8859-9|ibm1047|euc-jp|shift_jis|}}
{30001002|XXparameter|http_request_body_charset.display_name|http-request-body-charset|3|9|P|@{0|}}
{30001002|XXparameter|http_request_body_charset.keyword|http-request-body-charset|3|9|P|@{0|}}
{30001002|XXparameter|http_request_body_charset.condition|param http-request-type P* param not_request_body_octet_stream True|3|15|P?|@{0|}}
{30001002|XXparameter|http_request_encode_punct_marks|True|13|1|Fl|Whether to urlencode the following characters: - _ . ! ~ * ' ( )|{0|}}
{30001002|XXparameter|http_request_encode_punct_marks.display_name|http-request-encode-punct-marks|3|9|P|@{0|}}
{30001002|XXparameter|http_request_encode_punct_marks.condition|param simple-interface False|3|15|P?|@{0|}}
{30001002|XXparameter|http_request_dont_encode_punct_marks|value http-request-encode-punct-marks True False value http-request-encode-punct-marks False True|13|13|Kv||{0|}}
{30001002|XXparameter|http_request_dont_encode_punct_marks.display_name|http-request-dont-encode-punct-marks|3|9|P|@{0|}}
{30001002|XXparameter|http_request_dont_encode_punct_marks.keyword|http-request-dont-encode-punct-marks|3|9|P|@{0|}}
{30001002|XXparameter|http_request_dont_encode_punct_marks.condition|param simple-interface False|3|15|P?|@{0|}}
{30001002|XXparameter|http_request_user_agent||3|2|FK$|User agent.|{0|}}
{30001002|XXparameter|http_request_user_agent.display_name|http-request-user-agent|3|9|P|@{0|}}
{30001002|XXparameter|http_request_user_agent.keyword|http-request-user-agent|3|9|P|@{0|}}
{30001002|XXparameter|http_request_user_agent.condition|param simple-interface False|3|15|P?|@{0|}}
{30001002|XXparameter|http_request_headers||3|2|FK$|List of request headers (one per line).|{0|}}
{30001002|XXparameter|http_request_headers.display_name|http-request-headers|3|9|P|@{0|}}
{30001002|XXparameter|http_request_headers.keyword|http-request-headers|3|9|P|@{0|}}
{30001002|XXparameter|http_request_headers.condition|param simple-interface False|3|15|P?|@{0|}}
{30001002|XXparameter|http_response_body_type|text/xml|15|1|RFKl|Content type of the body of HTTP response.|{5|text/xml|text/html|text/plain|application/octet-stream|application/soap+xml|}}
{30001002|XXparameter|http_response_body_type.display_name|http-response-body-type|3|9|P|@{0|}}
{30001002|XXparameter|http_response_body_type.keyword|http-response-body-type|3|9|P|@{0|}}
{30001002|XXparameter|http_response_body_charset|utf-8|15|1|FKl|Character set of the body of HTTP response.|{13|utf-8|iso-8859-1|iso-8859-2|iso-8859-3|iso-8859-4|iso-8859-5|iso-8859-6|iso-8859-7|iso-8859-8|iso-8859-9|ibm1047|euc-jp|shift_jis|}}
{30001002|XXparameter|http_response_body_charset.display_name|http-response-body-charset|3|9|P|@{0|}}
{30001002|XXparameter|http_response_body_charset.keyword|http-response-body-charset|3|9|P|@{0|}}
{30001002|XXparameter|http_response_body_charset.condition|param not_response_body_octet_stream True|3|15|P?|@{0|}}
{30001002|XXparameter|http_ignore_redirect|False|13|1|FKl|Do not handle HTTP redirects.|{0|}}
{30001002|XXparameter|http_ignore_redirect.display_name|http-ignore-redirect|3|9|P|@{0|}}
{30001002|XXparameter|http_ignore_redirect.keyword|http-ignore-redirect|3|9|P|@{0|}}
{30001002|XXparameter|http_ignore_redirect.condition|param simple-interface False|3|15|P?|@{0|}}
{30001002|XXparameter|http_max_redirects|20|1|2|FK$|Maximum number of HTTP redirects.|{0|}}
{30001002|XXparameter|http_max_redirects.display_name|http-max-redirects|3|9|P|@{0|}}
{30001002|XXparameter|http_max_redirects.keyword|http-max-redirects|3|9|P|@{0|}}
{30001002|XXparameter|http_max_redirects.condition|param http-ignore-redirect False param simple-interface False|3|15|P?|@{0|}}
{30001002|XXparameter|http_200_aliases||3|2|FK$|list of aliases (one per line) to be treated as a valid HTTP header line such as HTTP/1.0 200 OK.|{0|}}
{30001002|XXparameter|http_200_aliases.display_name|http-200-aliases|3|9|P|@{0|}}
{30001002|XXparameter|http_200_aliases.keyword|http-200-aliases|3|9|P|@{0|}}
{30001002|XXparameter|http_200_aliases.condition|param simple-interface False|3|15|P?|@{0|}}
{30001002|XXparameter|http_fail_on_error|False|13|1|FKl|Fail if the HTTP code returned is >= 300.|{0|}}
{30001002|XXparameter|http_fail_on_error.display_name|http-fail-on-error|3|9|P|@{0|}}
{30001002|XXparameter|http_fail_on_error.keyword|http-fail-on-error|3|9|P|@{0|}}
{30001002|XXparameter|http_fail_on_error.condition|param simple-interface False|3|15|P?|@{0|}}
{30001002|XXparameter|http_cookie_file||3|2|FK$|URL to file in which to pre-load cookies.  If unset, cookie support is disabled.  File will not be created if it does not exist.|{0|}}
{30001002|XXparameter|http_cookie_file.display_name|http-cookie-file|3|9|P|@{0|}}
{30001002|XXparameter|http_cookie_file.keyword|http-cookie-file|3|9|P|@{0|}}
{30001002|XXparameter|http_cookie_file.condition|param simple-interface False|3|15|P?|@{0|}}
{30001002|XXparameter|show_ssl|False|13|1|Fl|Show SSL related parameters.|{0|}}
{30001002|XXparameter|show_ssl.display_name|show-ssl|3|9|P|@{0|}}
{30001002|XXparameter|show_ssl.condition|param simple-interface False|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_cert_file||3|2|FK$|URL to file with certificate for client|{0|}}
{30001002|XXparameter|ssl_cert_file.display_name|ssl-cert-file|3|9|P|@{0|}}
{30001002|XXparameter|ssl_cert_file.keyword|ssl-cert-file|3|9|P|@{0|}}
{30001002|XXparameter|ssl_cert_file.condition|param simple-interface False param show-ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_cert_type|PEM|15|1|FKl|Type of client certificate, one of DER, PEM, or ENG|{3|PEM|DER|ENG|}}
{30001002|XXparameter|ssl_cert_type.display_name|ssl-cert-type|3|9|P|@{0|}}
{30001002|XXparameter|ssl_cert_type.keyword|ssl-cert-type|3|9|P|@{0|}}
{30001002|XXparameter|ssl_cert_type.condition|param simple-interface False param show-ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_cert_password||3|2|FK$|Password for the client certificate|{0|}}
{30001002|XXparameter|ssl_cert_password.display_name|ssl-cert-password|3|9|P|@{0|}}
{30001002|XXparameter|ssl_cert_password.keyword|ssl-cert-password|3|9|P|@{0|}}
{30001002|XXparameter|ssl_cert_password.condition|param simple-interface False param show-ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_cert_password_encrypted||3|2|FK$|Password for the client certificate(encrypted)|{0|}}
{30001002|XXparameter|ssl_cert_password_encrypted.display_name|ssl-cert-password-encrypted|3|9|P|@{0|}}
{30001002|XXparameter|ssl_cert_password_encrypted.keyword|ssl-cert-password-encrypted|3|9|P|@{0|}}
{30001002|XXparameter|ssl_cert_password_encrypted.condition|param simple-interface False param show-ssl True version 2.15.3.r27:|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_private_key||3|2|FK$|URL to file with client private key|{0|}}
{30001002|XXparameter|ssl_private_key.display_name|ssl-private-key|3|9|P|@{0|}}
{30001002|XXparameter|ssl_private_key.keyword|ssl-private-key|3|9|P|@{0|}}
{30001002|XXparameter|ssl_private_key.condition|param simple-interface False param show-ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_private_key_type|PEM|15|1|FKl|Type of client private key, one of DER, PEM, or ENG|{3|PEM|DER|ENG|}}
{30001002|XXparameter|ssl_private_key_type.display_name|ssl-private-key-type|3|9|P|@{0|}}
{30001002|XXparameter|ssl_private_key_type.keyword|ssl-private-key-type|3|9|P|@{0|}}
{30001002|XXparameter|ssl_private_key_type.condition|param simple-interface False param show-ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_private_key_password||3|2|FK$|Password for the client private key|{0|}}
{30001002|XXparameter|ssl_private_key_password.display_name|ssl-private-key-password|3|9|P|@{0|}}
{30001002|XXparameter|ssl_private_key_password.keyword|ssl-private-key-password|3|9|P|@{0|}}
{30001002|XXparameter|ssl_private_key_password.condition|param simple-interface False param show-ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_private_key_password_encrypted||3|2|FK$|Password for the client private key(encrypted)|{0|}}
{30001002|XXparameter|ssl_private_key_password_encrypted.display_name|ssl-private-key-password-encrypted|3|9|P|@{0|}}
{30001002|XXparameter|ssl_private_key_password_encrypted.keyword|ssl-private-key-password-encrypted|3|9|P|@{0|}}
{30001002|XXparameter|ssl_private_key_password_encrypted.condition|param simple-interface False param show-ssl True version 2.15.3.r27:|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_cacert_file|/~ab_home/lib/ca-bundle.crt|3|2|FK$|URL to file with X509 CA certificates|{0|}}
{30001002|XXparameter|ssl_cacert_file.display_name|ssl-cacert-file|3|9|P|@{0|}}
{30001002|XXparameter|ssl_cacert_file.keyword|ssl-cacert-file|3|9|P|@{0|}}
{30001002|XXparameter|ssl_cacert_file.condition|param simple-interface False param show-ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_cacert_path||3|2|FK$|URL to directory containing X509 CA certificates|{0|}}
{30001002|XXparameter|ssl_cacert_path.display_name|ssl-cacert-path|3|9|P|@{0|}}
{30001002|XXparameter|ssl_cacert_path.keyword|ssl-cacert-path|3|9|P|@{0|}}
{30001002|XXparameter|ssl_cacert_path.condition|param simple-interface False param show-ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_dont_verify_cert|False|13|1|FKl|If true, SSL peer certificate verification is not performed.|{0|}}
{30001002|XXparameter|ssl_dont_verify_cert.display_name|ssl-dont-verify-cert|3|9|P|@{0|}}
{30001002|XXparameter|ssl_dont_verify_cert.keyword|ssl-dont-verify-cert|3|9|P|@{0|}}
{30001002|XXparameter|ssl_dont_verify_cert.condition|param simple-interface False param show-ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_verify_server|False|13|1|FKl|If true, SSL peer certificate verification against server is performed.|{0|}}
{30001002|XXparameter|ssl_verify_server.display_name|ssl-verify-server|3|9|P|@{0|}}
{30001002|XXparameter|ssl_verify_server.keyword|ssl-verify-server|3|9|P|@{0|}}
{30001002|XXparameter|ssl_verify_server.condition|param simple-interface False param ssl-dont-verify-cert False param show-ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_ciphers||3|2|FK$|Set of SSL ciphers to use|{0|}}
{30001002|XXparameter|ssl_ciphers.display_name|ssl-ciphers|3|9|P|@{0|}}
{30001002|XXparameter|ssl_ciphers.keyword|ssl-ciphers|3|9|P|@{0|}}
{30001002|XXparameter|ssl_ciphers.condition|param simple-interface False param show-ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_random_file||3|2|FK$|Local file containing random data|{0|}}
{30001002|XXparameter|ssl_random_file.display_name|ssl-random-file|3|9|P|@{0|}}
{30001002|XXparameter|ssl_random_file.keyword|ssl-random-file|3|9|P|@{0|}}
{30001002|XXparameter|ssl_random_file.condition|version 3.0.1.r9: param show-ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_version||15|1|FKl|Restrict SSL protocol version|{4| |TLSv1|SSLv2|SSLv3|}}
{30001002|XXparameter|ssl_version.display_name|ssl-version|3|9|P|@{0|}}
{30001002|XXparameter|ssl_version.keyword|ssl-version|3|9|P|@{0|}}
{30001002|XXparameter|ssl_version.condition|param simple-interface False param show-ssl True version 3.1.6.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|connection_timeout|10|2|2|FK$|The maximum time in seconds to establish a connection.|{0|}}
{30001002|XXparameter|connection_timeout.display_name|connection-timeout|3|9|P|@{0|}}
{30001002|XXparameter|connection_timeout.keyword|connection-timeout|3|9|P|@{0|}}
{30001002|XXparameter|connection_reuse_forbidden|False|13|1|FKl|Indicates whether the connections can be reused between requests.|{0|}}
{30001002|XXparameter|connection_reuse_forbidden.display_name|connection-reuse-forbidden|3|9|P|@{0|}}
{30001002|XXparameter|connection_reuse_forbidden.keyword|connection-reuse-forbidden|3|9|P|@{0|}}
{30001002|XXparameter|connection_reuse_forbidden.condition|param simple-interface False|3|15|P?|@{0|}}
{30001002|XXparameter|concurrency_mode|batch|15|1|FKl|Mode that controls concurrency parameters|{4|batch|continuous|continuous-service|continuous-nonrecoverable|}}
{30001002|XXparameter|concurrency_mode.display_name|concurrency-mode|3|9|P|@{0|}}
{30001002|XXparameter|concurrency_mode.keyword|concurrency-mode|3|9|P|@{0|}}
{30001002|XXparameter|concurrency_mode.condition|version 2.15.1.r20: param simple-interface False|3|15|P?|@{0|}}
{30001002|XXparameter|is_blip_passing|value concurrency-mode continuous-service 1 value concurrency-mode * 0|3|13|v|Control for expert validation|{0|}}
{30001002|XXparameter|has_requests_allowed|value concurrency-mode batch 1 value concurrency-mode continuous-nonrecoverable 1 value concurrency-mode continuous 1 value concurrency-mode * 0|3|13|v|Dummy for parameter requests-allowed enable|{0|}}
{30001002|XXparameter|concurrent_requests_allowed|False|13|1|FKl|Allow concurrent HTTP requests.|{0|}}
{30001002|XXparameter|concurrent_requests_allowed.display_name|concurrent-requests-allowed|3|9|P|@{0|}}
{30001002|XXparameter|concurrent_requests_allowed.keyword|concurrent-requests-allowed|3|9|P|@{0|}}
{30001002|XXparameter|concurrent_requests_allowed.condition|param simple-interface False param has_requests_allowed 1|3|15|P?|@{0|}}
{30001002|XXparameter|has_max_number|value concurrency-mode continuous-service 1 value concurrent-requests-allowed True 1 value concurrent-requests-allowed False 0|3|13|v|Dummy for parameter requests-max_number enable|{0|}}
{30001002|XXparameter|concurrent_requests_max_number|1|1|2|FK$|Maximum number of concurrent requests.|{0|}}
{30001002|XXparameter|concurrent_requests_max_number.display_name|concurrent-requests-max-number|3|9|P|@{0|}}
{30001002|XXparameter|concurrent_requests_max_number.keyword|concurrent-requests-max-number|3|9|P|@{0|}}
{30001002|XXparameter|concurrent_requests_max_number.condition|param has_max_number 1|3|15|P?|@{0|}}
{30001002|XXparameter|has_maintain_order|value concurrency-mode continuous-service 0 value concurrency-mode * 1|3|13|v|Dummy for parameter requests-allowed enable|{0|}}
{30001002|XXparameter|concurrent_requests_maintain_record_order|True|13|1|FKl|Maintain the order of output records the same as the order of input records.|{0|}}
{30001002|XXparameter|concurrent_requests_maintain_record_order.display_name|concurrent-requests-maintain-record-order|3|9|P|@{0|}}
{30001002|XXparameter|concurrent_requests_maintain_record_order.keyword|concurrent-requests-maintain-record-order|3|9|P|@{0|}}
{30001002|XXparameter|concurrent_requests_maintain_record_order.condition|param concurrent-requests-allowed True param has_maintain_order 1|3|15|P?|@{0|}}
{30001002|XXparameter|has_continuous_mode|value concurrency-mode continuous 1 value concurrency-mode * 0|3|13|v|Dummy for continuous analysis|{0|}}
{30001002|XXparameter|save_output_frequency|0|1|2|FK$|How often to save responses for later replay|{0|}}
{30001002|XXparameter|save_output_frequency.display_name|save-output-frequency|3|9|P|@{0|}}
{30001002|XXparameter|save_output_frequency.keyword|save-output-frequency|3|9|P|@{0|}}
{30001002|XXparameter|save_output_frequency.condition|version 2.15.2.r24: param concurrency-mode batch param simple-interface False param concurrent-requests-maintain-record-order True|3|15|P?|@{0|}}
{30001002|XXparameter|nz_sfreq|value save-output-frequency 0 False value save-output-frequency * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|leadchkpt|-__ab__leading-checkpoint__ab__|3|2|O$||{0|}}
{30001002|XXparameter|leadchkpt.condition|param nz_sfreq True|3|15|P?|@{0|}}
{30001002|XXparameter|soap_action||3|2|FK$|SOAP Web Service to invoke.|{0|}}
{30001002|XXparameter|soap_action.display_name|soap-action|3|9|P|@{0|}}
{30001002|XXparameter|soap_action.keyword|soap-action|3|9|P|@{0|}}
{30001002|XXparameter|soap_action.condition|version 2.15.1.r20: param http-request-body-type application/soap+xml|3|15|P?|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|debug|False|13|1|Fl|Enable debug mode|{0|}}
{30001002|XXparameter|debug.condition|param simple-interface False|3|15|P?|@{0|}}
{30001002|XXparameter|debug_file_name|debug|3|2|FK$|Name of the debug file|{0|}}
{30001002|XXparameter|debug_file_name.display_name|debug-file-name|3|9|P|@{0|}}
{30001002|XXparameter|debug_file_name.keyword|debug-file-name|3|9|P|@{0|}}
{30001002|XXparameter|debug_file_name.condition|param simple-interface False param debug True|3|15|P?|@{0|}}
{30001002|XXparameter|not_request_body_octet_stream|value http-request-body-type application/octet-stream False value http-request-body-type * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_response_body_octet_stream|value http-response-body-type application/octet-stream False value http-response-body-type * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|request_type|value_in_version 3.2.1.r10.0: record
asciistring("\\0")request_url;
record
utf8string("\\0")name;
utf8string("\\0")value;
end[bigendianinteger(4)]request_url_params=NULL;
void(bigendianinteger(4))request_body=NULL;
utf8string("\\0")request_http_headers=NULL;
utf8string("\\0")request_soap_action=NULL;
utf8string("\\0")request_http_request_type=NULL;
utf8string("\\0")request_http_request_body_type=NULL;
utf8string("\\0")request_http_request_body_charset=NULL;
//(optional)floatrequest_timeout=NULL;
//(optional)floatrequest_connect_timeout=NULL;
end default dollar_substitution record
asciistring("\\0")request_url;
record
utf8string("\\0")name;
utf8string("\\0")value;
end[bigendianinteger(4)]request_url_params=NULL;
void(bigendianinteger(4))request_body=NULL;
utf8string("\\0")request_http_headers=NULL;
utf8string("\\0")request_soap_action=NULL;
utf8string("\\0")request_http_request_type=NULL;
utf8string("\\0")request_http_request_body_type=NULL;
utf8string("\\0")request_http_request_body_charset=NULL;
end|3|13|Hv||{0|}}
{30001002|XXparameter|response_type|record
//   The response_type field definitions are shown below.
//   The definitions are shown here for informational purposes only.
//   You cannot change the definition of response_type.
  big endian integer(4) response_code;
  ascii string(big endian integer(4)) response_headers = NULL;
  void(big endian integer(4)) response_body = NULL;
  end|3|2|H$||{0|}}
{30001002|XXparameter|num_types|6|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details;   ascii string(big endian integer(4)) response_headers = NULL;  void(big endian integer(4)) response_body = NULL;  ascii string('') error = NULL;  big endian integer(4) error_code = NULL;end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of log_event|{0|}}
{30001002|XXparameter|type3|request_type request <parameter request_type>|3|2|H$|Metadata for records containing request information|{0|}}
{30001002|XXparameter|type4|optional response_type response <parameter response_type>|3|2|H$|Metadata for records containing response information|{0|}}
{30001002|XXparameter|type5|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|type6|optional response_vector_type  responses "response_type[int]"|3|2|H$|Response vector|{0|}}
{30001002|XXparameter|num_operations|14|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional temp ? temp::initialize(in in): NULL|3|2|H$|Called to initialize temporary variable|{0|}}
{30001002|XXparameter|operation2|request::prepare_request(in)|3|2|H$|Prepare request information|{0|}}
{30001002|XXparameter|operation3|optional temp ? int out::next_request_select(in in, response_vector_type responses, temp temp): NULL|3|2|H$|Called to determine if we should make another RPC call|{0|}}
{30001002|XXparameter|operation3_analysis|optional temp ? int select_out::next_request_select(in in, response_vector_type responses, temp temp): NULL|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional temp ? request::prepare_next_request(in in, response_vector_type responses, temp temp): NULL|3|2|H$|Called to prepare next request|{0|}}
{30001002|XXparameter|operation5|optional temp ? temp::rollup(in in, response_vector_type responses, temp temp): NULL|3|2|H$|Called to update temporary variable based on newest responses|{0|}}
{30001002|XXparameter|operation6|temp ? out::create_output(in in, response_vector_type responses, temp temp) : out::create_output(in in,response response)|3|2|H$|Called to create an output record|{0|}}
{30001002|XXparameter|operation7|optional int post_process_out::post_process(in in, int status, request_type request, response_vector_type responses, temp temp)|3|2|H$|Called after a request to determine if we should make another Web call|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation12|optional temp ? temp::rollup_error(in in, response_vector_type responses, temp temp, int status): NULL|3|2|H$|Called on error to update temporary variable|{0|}}
{30001002|XXparameter|operation12.condition|version 3.2.2.r15.0:|3|15|P?|@{0|}}
{30001002|XXparameter|operation13|optional request::prepare_request_for_simul(request, do_recording)|3|2|H$|Called to prepare a request for simulator|{0|}}
{30001002|XXparameter|operation14|optional response::prepare_response_for_simul(request, response, do_recording)|3|2|H$|Called to prepare a response for simulator|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_ab_update_name_change_map|transform package|3|2|$||{0|}}
{30001002|XXparameter|simulate|False|13|1|FKl|Enables simulator|{0|}}
{30001002|XXparameter|simulate.condition|version 3.2.2.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|simulator_mode|Playing|15|1|FKl|Simulator mode|{2|Recording|Playing|}}
{30001002|XXparameter|simulator_mode.condition|version 3.2.2.r15: param simulate True|3|15|P?|@{0|}}
{30001002|XXparameter|simulator_location||3|2|FK$|Simulator url|{0|}}
{30001002|XXparameter|simulator_location.condition|version 3.2.2.r15: param simulate True|3|15|P?|@{0|}}
{30001002|XXparameter|continuous_analysis|is_blip_passing ? nonrecoverable,order : nonrecoverable|3|2|H$||{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1430423870|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = "record
  ascii string(big endian integer(4)) response_headers = NULL;
  void(big endian integer(4)) response_body = NULL;
  ascii string(\\"\\\\0\\") error = NULL;
  big endian integer(4) error_code = NULL;
end"
metadata type: log = remote("$AB_HOME/include/log-info.dml")
metadata type: debug = "string('\\\\n')"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|446|0|1170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2320|0|}}
{2010203004|XXGoport|447|0|1173|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|448|0|1176|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|449|0|1179|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|450|0|1182|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|451|0|1185|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|out::reformat(in) =
begin
  out.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|transform1|out::reformat(in) =
begin
  out.faultcode:: "SERVER";
  out.faultstring:: string_concat("Unexpected response: " ,  (decimal(10))in.response_code);
  out.requestdata:: in.request_data;
  out.detail:: in.response_data;
end;|3|1|l|@{0|}}
{30001002|XXparameter|transform2|out::reformat(in) =
begin
  out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|output_index|out::output_index(in) =
begin
  out :: if ((in.response_code/100) == 2) 0 else if ((in.response_code/100) == 5) 2 else 1;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata|record
 utf8 string(integer(4)) request_data;
 utf8 string(integer(4)) response_data;
 utf8 string(integer(4))[big endian integer(4)] other_payload;
 end;|3|1|l|@{0|}}
{30001002|XXparameter|reject2_metadata|record
  integer(4) response_code;
  string(integer(4)) response_data;
end;|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|error1_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|error2_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@310289|51920|330000|72000|158000|127000|13|Dispatch by HTTP Response Code|Ab Initio Software|Built-in 1.0:|1|10|-1||6||36865|1|{1|0|}}}
{2010203004|XXGoport|452|0|1187|0|{@{}@487000|89000|11000|11000|_2xx|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|453|0|1190|0|{@{}@487000|129000|11000|11000|Other|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|454|0|1193|0|{@{}@487000|169000|11000|11000|_5xx|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|455|0|1196|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|456|0|1198|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|457|0|1200|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|458|0|1202|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|459|0|1204|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|460|0|1206|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|461|0|1208|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|462|0|1210|0|{@{}@320000|129000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|463|0|1213|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|3|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform1||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform2||8|1|FOl|Reformat transform|{0|}}
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
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out2_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1430423878|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|464|0|1215|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|_2xx|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|465|0|1219|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|Other|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|466|0|1223|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform2||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|_5xx|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|467|0|1227|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|468|0|1230|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|469|0|1233|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|470|0|1236|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|471|0|1239|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|472|0|1242|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|473|0|1245|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|474|0|1248|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|475|0|1251|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in) =
begin
  out.faultcode::"CLIENT";
  out.faultstring::in.error;
  out.requestdata:: in.request;
  out.detail:: "";
end;|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@275001|456000|295000|476000|114000|107000|14|Error as Fault|Ab Initio Software|Built-in 1.0:|1|10|-1||6||36865|1|{1|0|}}}
{2010203004|XXGoport|476|0|1253|0|{@{}@408000|524000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|477|0|1256|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|478|0|1258|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|479|0|1260|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|480|0|1262|0|{@{}@285000|524000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|481|0|1265|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1430423878|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|482|0|1267|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|483|0|1271|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|484|0|1274|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|485|0|1277|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|486|0|1280|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|487|0|1283|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Fuse.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|out::fuse(in0, in1) =
begin
  out.request:: in0.request;
  out.error:: if (in1.error_code == 28)
 "Message timed out: 28"
else
 string_concat(in1.error, string_concat(": ", (decimal(10)) in1.error_code));
end;|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|record 
  utf8 string(big endian integer(4)) request;
  utf8 string(big endian integer(4)) error;
end;|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|error1_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@108647|387000|129000|407000|90000|71000|15|Fuse|Ab Initio Software|Built-in 2.10:|1|10|-1||6||36993|1|{1|0|}}}
{2010203004|XXGoport|488|0|1285|0|{@{}@169000|477000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|489|0|1288|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|490|0|1290|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|491|0|1292|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|492|0|1294|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|493|0|1296|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|494|0|1298|0|{@{}@149000|397000|11000|11000|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|495|0|1301|0|{@{}@189000|397000|11000|11000|in1|0.0|count|in|1|1936|0|}}
{2010501005|XXGpvertex|496|0|1304|0|{Applies a transform to the corresponding records from each input flow. The transform is first applied to the first record on each flow, then to the second, and so on. The result of the transform is sent out of the out port.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|fuse-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of inputs to fuse function|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
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
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(4) out::select(in[*])|3|2|H$|If this returns 0, the input records are discarded.|{0|}}
{30001002|XXparameter|operation1_analysis|integer(4) select_out::select(in[*])|3|2|H$||{0|}}
{30001002|XXparameter|operation2|out::fuse(in[*])|3|2|H$|Function combining one record from each input to produce one record on the output.|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in*; error*=^error|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|error_port_type error <parameter error0_metadata>|3|2|H$|Type for make_error output|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, in[*])|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, in[*])|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, in[*])|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1430423878|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|497|0|1306|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|498|0|1309|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|499|0|1312|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|500|0|1315|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|501|0|1318|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|502|0|1321|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|503|0|1324|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|504|0|1327|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010501005|XXGpvertex|505|0|1330|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
}}@0|@881001|383000|891000|377000|50000|71000|16|Gather|Ab Initio Software|Built-in 1.0:|1|10|-1||6||36865|1|{1|0|}}}
{2010203004|XXGoport|506|0|1332|0|{@{}@940000|409000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|507|0|1334|0|{@{}@881000|389000|11000|51000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|508|0|1341|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1430423877|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|509|0|1343|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|510|0|1346|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|511|0|1349|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.detail::in.response_data;
  out.faultstring:: "Error parsing response";
  out.faultcode:: "SERVER";
  out.requestdata:: in.request_data;
end;|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@697635|205061|718000|225000|90000|109000|17|Not Expected Response|Ab Initio Software|Built-in 1.0:|1|10|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|512|0|1351|0|{@{}@759000|333000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|513|0|1354|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|514|0|1356|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|515|0|1358|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|516|0|1360|0|{@{}@759000|215000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|517|0|1363|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1430423878|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|518|0|1365|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|519|0|1369|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|520|0|1372|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|521|0|1375|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|522|0|1378|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|523|0|1381|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|out::reformat(in) =
begin
  out.faultcode:: "SERVER";
  out.faultstring:: "500 status but not a SOAPFault";
  out.detail:: in.response_data;
  out.requestdata:: in.request_data;
end;|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@430883|377000|451000|397000|121000|107000|87|Not a SOAP Fault|Ab Initio Software|Built-in 1.0:|1|10|-1||6||36865|1|{1|0|}}}
{2010203004|XXGoport|524|0|1383|0|{@{}@571000|444000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|525|0|1386|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|526|0|1388|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|527|0|1390|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|528|0|1392|0|{@{}@441000|444000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|529|0|1395|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1430423878|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|530|0|1397|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|531|0|1401|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|532|0|1404|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|533|0|1407|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|534|0|1410|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|535|0|1413|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin

 out.event_text :: if ( in.event_type == "SFDC") reinterpret_as (utf8 string (int), (string (int)) (in.event_text )) else in.event_text;
  out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@532000|281500|552000|302000|133000|107000|91|Put data back to full utf8|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|536|0|1415|0|{@{}@684000|349000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|537|0|1418|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|538|0|1420|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|539|0|1422|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|540|0|1424|0|{@{}@542000|349000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|541|0|1427|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1430423878|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|542|0|1429|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|543|0|1433|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|544|0|1436|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|545|0|1439|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|546|0|1442|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|547|0|1445|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Deprecated/XML/Read_XML_Transform.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|package|type document_type = utf8 string(integer(4));

/* Information returned by web service on Soap Fault */
type Fault_type_t = record
  utf8 string('\\0') faultcode;
  utf8 string('\\0') faultstring;
  utf8 string('\\0') faultactor = NULL;
  utf8 string('\\0') detail;
end;

/* Soap Body information for Soap Fault */
type Body_type_t = record
 utf8 string('\\0') requestdata;
 Fault_type_t soap_Fault;
 ascii string('\\0') XML_namespace_mappings() = 'soap,=http://schemas.xmlsoap.org/soap/envelope/;';
end;

/* Soap Envelope for Soap Fault */
type Envelope_t = record
 Body_type_t soap_Body;
 ascii string('\\0') XML_namespace_mappings() = 'soap,=http://schemas.xmlsoap.org/soap/envelope/;';
 ascii string('\\0') XML_base_element() = 'http://schemas.xmlsoap.org/soap/envelope/:Envelope';
end;

type parsed_xml_type = Envelope_t;

/*Called to prepare a message*/
xml_doc::prepare_document(in)=
begin
 xml_doc::in.response_data;
end;

/*Called to create an output record*/
out::create_output(in,parsed_record)=
begin
  out.requestdata:: in.request_data;
  out.faultcode :: parsed_record.soap_Body.soap_Fault.faultcode;
  out.faultstring :: parsed_record.soap_Body.soap_Fault.faultstring;
  out.detail :: parsed_record.soap_Body.soap_Fault.detail;
  out.faultactor :: parsed_record.soap_Body.soap_Fault.faultactor;
end;|3|1|l|@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata|record
 utf8 string('\\0') request_data;
 utf8 string('\\0') response_data;
end|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|record
  utf8 string('\\0') requestdata;
  utf8 string('\\0') faultcode;
  utf8 string('\\0') faultstring;
  utf8 string('\\0') faultactor = NULL;
  utf8 string('\\0') detail;
end|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@321702|234520|342000|255000|119000|107000|18|Read Fault XML Transform|Ab Initio Software|Built-in 2.14.19:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|548|0|1447|0|{@{}@460000|304000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|549|0|1450|0|{@{}@394000|361000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|550|0|1453|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|551|0|1455|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|552|0|1457|0|{@{}@332000|304000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|553|0|1460|0|{Reads a string, translates the XML data into DML-described records, and sends these records to its out port.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|read-xml-xfr|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/read-xml-xfr|3|2|H$||{0|}}
{30001002|XXparameter|package||8|1|RFOl|Functions for message creation|{0|}}
{30001002|XXparameter|num_includes|0|1|2|H$|Number of includes in package|{0|}}
{30001002|XXparameter|num_variables|2|1|2|H$|Number of intermediate types|{0|}}
{30001002|XXparameter|variable1|document_type xml_doc "utf8 string(integer(4))"|3|2|H$|Type for xml document|{0|}}
{30001002|XXparameter|variable2|parsed_xml_type parsed_record "record end"|3|2|H$|type generated by xml-to-dml|{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|xml_doc::prepare_document(in)|3|2|H$|Called to prepare a message|{0|}}
{30001002|XXparameter|operation2|out::create_output(in, parsed_record, string('') parse_error optional)|3|2|H$|Called to create an output record|{0|}}
{30001002|XXparameter|parser|expat|15|1|FKl|XML Parser to use|{2|expat|xerces|}}
{30001002|XXparameter|parser.condition|version 2.11:|3|15|P?|@{0|}}
{30001002|XXparameter|output_count|any number|15|1|FKl|Force an error if the number of output records for a parsed document does not meet this constraint.|{4|any number|exactly one|one or more|zero or one|}}
{30001002|XXparameter|output_count.display_name|output-count|3|9|P|@{0|}}
{30001002|XXparameter|output_count.keyword|output-count|3|9|P|@{0|}}
{30001002|XXparameter|missing_fields|ignore|15|1|FKl|What should be done if an element or attribute is missing in the input document.|{2|ignore|error|}}
{30001002|XXparameter|missing_fields.display_name|missing-fields|3|9|P|@{0|}}
{30001002|XXparameter|missing_fields.keyword|missing-fields|3|9|P|@{0|}}
{30001002|XXparameter|missing_fields.condition|version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_unknown_attributes|False|13|1|FKl|Ignore unknown attributes in the input XML|{0|}}
{30001002|XXparameter|ignore_unknown_attributes.display_name|ignore-unknown-attributes|3|9|P|@{0|}}
{30001002|XXparameter|ignore_unknown_attributes.keyword|ignore-unknown-attributes|3|9|P|@{0|}}
{30001002|XXparameter|ignore_unknown_elements|False|13|1|FKl|Ignore unknown elements in the input XML|{0|}}
{30001002|XXparameter|ignore_unknown_elements.display_name|ignore-unknown-elements|3|9|P|@{0|}}
{30001002|XXparameter|ignore_unknown_elements.keyword|ignore-unknown-elements|3|9|P|@{0|}}
{30001002|XXparameter|ignore_blank_cdata|False|13|1|FKl|Suppress records corresponding to all-whitespace character data|{0|}}
{30001002|XXparameter|ignore_blank_cdata.display_name|ignore-blank-cdata|3|9|P|@{0|}}
{30001002|XXparameter|ignore_blank_cdata.keyword|ignore-blank-cdata|3|9|P|@{0|}}
{30001002|XXparameter|ignore_namespaces|True|13|1|FKl|Ignore namespaces except to disambiguate elements or attributes|{0|}}
{30001002|XXparameter|ignore_namespaces.display_name|ignore-namespaces|3|9|P|@{0|}}
{30001002|XXparameter|ignore_namespaces.keyword|ignore-namespaces|3|9|P|@{0|}}
{30001002|XXparameter|ignore_namespaces.condition|param custom-format False version 2.16.0:|3|15|P?|@{0|}}
{30001002|XXparameter|custom_format|False|13|1|FKl|Use arbitrary type for parsed_xml_type instead of one generated by xml-to-dml.|{0|}}
{30001002|XXparameter|custom_format.display_name|custom-format|3|9|P|@{0|}}
{30001002|XXparameter|custom_format.keyword|custom-format|3|9|P|@{0|}}
{30001002|XXparameter|custom_format.condition|version 2.14.23:|3|15|P?|@{0|}}
{30001002|XXparameter|base_element||3|2|RFK$|Name of the element which will be used to fill the parsed_xml_type record.|{0|}}
{30001002|XXparameter|base_element.display_name|base-element|3|9|P|@{0|}}
{30001002|XXparameter|base_element.keyword|base-element|3|9|P|@{0|}}
{30001002|XXparameter|base_element.condition|param custom-format True version 2.14.23:|3|15|P?|@{0|}}
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
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|version 2.14.46:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1430423877|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"
metadata type: reject = in|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|554|0|1462|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|555|0|1465|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|556|0|1468|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|557|0|1471|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|558|0|1474|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|559|0|1477|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Deprecated/XML/Read_XML_Transform.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|package||3|8|=|@{0|}}
{30001002|XXparameter|ignore_unknown_attributes|True|3|1|l|@{0|}}
{30001002|XXparameter|ignore_unknown_elements|True|3|1|l|@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@697225|29276|717000|49000|134000|126000|19|Read Response XML Transform|Ab Initio Software|Built-in 2.14.19:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|560|0|1479|0|{@{}@850000|109000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|561|0|1481|0|{@{}@779000|174000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|562|0|1484|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|563|0|1486|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|564|0|1488|0|{@{}@707000|109000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|565|0|1491|0|{Reads a string, translates the XML data into DML-described records, and sends these records to its out port.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|read-xml-xfr|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/read-xml-xfr|3|2|H$||{0|}}
{30001002|XXparameter|package||8|1|RFOl|Functions for message creation|{0|}}
{30001002|XXparameter|num_includes|0|1|2|H$|Number of includes in package|{0|}}
{30001002|XXparameter|num_variables|2|1|2|H$|Number of intermediate types|{0|}}
{30001002|XXparameter|variable1|document_type xml_doc "utf8 string(integer(4))"|3|2|H$|Type for xml document|{0|}}
{30001002|XXparameter|variable2|parsed_xml_type parsed_record "record end"|3|2|H$|type generated by xml-to-dml|{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|xml_doc::prepare_document(in)|3|2|H$|Called to prepare a message|{0|}}
{30001002|XXparameter|operation2|out::create_output(in, parsed_record, string('') parse_error optional)|3|2|H$|Called to create an output record|{0|}}
{30001002|XXparameter|parser|expat|15|1|FKl|XML Parser to use|{2|expat|xerces|}}
{30001002|XXparameter|parser.condition|version 2.11:|3|15|P?|@{0|}}
{30001002|XXparameter|output_count|any number|15|1|FKl|Force an error if the number of output records for a parsed document does not meet this constraint.|{4|any number|exactly one|one or more|zero or one|}}
{30001002|XXparameter|output_count.display_name|output-count|3|9|P|@{0|}}
{30001002|XXparameter|output_count.keyword|output-count|3|9|P|@{0|}}
{30001002|XXparameter|missing_fields|ignore|15|1|FKl|What should be done if an element or attribute is missing in the input document.|{2|ignore|error|}}
{30001002|XXparameter|missing_fields.display_name|missing-fields|3|9|P|@{0|}}
{30001002|XXparameter|missing_fields.keyword|missing-fields|3|9|P|@{0|}}
{30001002|XXparameter|missing_fields.condition|version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_unknown_attributes|False|13|1|FKl|Ignore unknown attributes in the input XML|{0|}}
{30001002|XXparameter|ignore_unknown_attributes.display_name|ignore-unknown-attributes|3|9|P|@{0|}}
{30001002|XXparameter|ignore_unknown_attributes.keyword|ignore-unknown-attributes|3|9|P|@{0|}}
{30001002|XXparameter|ignore_unknown_elements|False|13|1|FKl|Ignore unknown elements in the input XML|{0|}}
{30001002|XXparameter|ignore_unknown_elements.display_name|ignore-unknown-elements|3|9|P|@{0|}}
{30001002|XXparameter|ignore_unknown_elements.keyword|ignore-unknown-elements|3|9|P|@{0|}}
{30001002|XXparameter|ignore_blank_cdata|False|13|1|FKl|Suppress records corresponding to all-whitespace character data|{0|}}
{30001002|XXparameter|ignore_blank_cdata.display_name|ignore-blank-cdata|3|9|P|@{0|}}
{30001002|XXparameter|ignore_blank_cdata.keyword|ignore-blank-cdata|3|9|P|@{0|}}
{30001002|XXparameter|ignore_namespaces|True|13|1|FKl|Ignore namespaces except to disambiguate elements or attributes|{0|}}
{30001002|XXparameter|ignore_namespaces.display_name|ignore-namespaces|3|9|P|@{0|}}
{30001002|XXparameter|ignore_namespaces.keyword|ignore-namespaces|3|9|P|@{0|}}
{30001002|XXparameter|ignore_namespaces.condition|param custom-format False version 2.16.0:|3|15|P?|@{0|}}
{30001002|XXparameter|custom_format|False|13|1|FKl|Use arbitrary type for parsed_xml_type instead of one generated by xml-to-dml.|{0|}}
{30001002|XXparameter|custom_format.display_name|custom-format|3|9|P|@{0|}}
{30001002|XXparameter|custom_format.keyword|custom-format|3|9|P|@{0|}}
{30001002|XXparameter|custom_format.condition|version 2.14.23:|3|15|P?|@{0|}}
{30001002|XXparameter|base_element||3|2|RFK$|Name of the element which will be used to fill the parsed_xml_type record.|{0|}}
{30001002|XXparameter|base_element.display_name|base-element|3|9|P|@{0|}}
{30001002|XXparameter|base_element.keyword|base-element|3|9|P|@{0|}}
{30001002|XXparameter|base_element.condition|param custom-format True version 2.14.23:|3|15|P?|@{0|}}
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
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|version 2.14.46:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1430423877|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"
metadata type: reject = in|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|566|0|1493|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|567|0|1496|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|568|0|1499|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|569|0|1502|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|570|0|1505|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|571|0|1510|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@651000|515000|666000|521000|40000|47000|88|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|572|0|1512|0|{@{}@679000|567000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|573|0|1514|0|{@{}@679000|511000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|574|0|1517|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1430423875|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|575|0|1519|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|576|0|1522|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010203004|XXGoport|577|0|1525|0|{@{}@0|0|0|0|fault|.25|@@@13712|0|}}
{2010203004|XXGoport|578|0|1528|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010203004|XXGoport|579|0|1531|0|{@{}@0|0|0|0|log|.6723790322580645|@@@13336|0|}}
{2010202004|XXGiport|580|0|1534|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|581|0|1537|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|next_in_sequence() == 1|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@857739|88212|738000|98000|189000|127000|138|Separate query from queryMore results|Ab Initio Software|Built-in 1.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|582|0|1539|0|{@{}@926000|124000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|583|0|1542|0|{@{}@926000|184000|11000|11000|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|584|0|1545|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|585|0|1547|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|586|0|1549|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|587|0|1551|0|{@{}@728000|154000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|588|0|1554|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1442863192|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|Filter by Expression|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|589|0|1556|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|590|0|1559|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|591|0|1562|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|592|0|1565|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|593|0|1568|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|594|0|1571|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|595|0|1574|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
   let long temp = if(next_in_sequence()==1) 0 else (sleep_for_microseconds(1000000*$\{continuous_subscribe_interval\}));
   out::in;
end;|3|3|c|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@118658|94231|99000|299000|142000|107000|130|Sleep when continuous|Ab Initio Software|Built-in 1.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|596|0|1576|0|{@{}@240000|349000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|597|0|1579|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|598|0|1581|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|599|0|1583|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|600|0|1585|0|{@{}@89000|349000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|601|0|1588|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1442863192|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|602|0|1590|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|603|0|1594|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|604|0|1597|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|605|0|1600|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|606|0|1603|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|607|0|1606|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Deprecated/XML/Write_XML_Transform.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|package|////////////////////////////////////////////////////////////////////////
// This file was automatically generated by xml-to-dml
// with the command line arguments:
// -base-element Envelope query.xml
////////////////////////////////////////////////////////////////////////
type SessionHeader_t = record
 utf8 string('\\0') m_sessionId;
 utf8 string('\\0') XML_namespace_mappings() = 'm,=urn:partner.soap.sforce.com;';
end;

type QueryOptions_t = record
 utf8 string('\\0') m_batchSize;
 utf8 string('\\0') XML_namespace_mappings() = 'm,=urn:partner.soap.sforce.com;';
end;

type Header_t = record
 SessionHeader_t m_SessionHeader;
 QueryOptions_t m_QueryOptions;
 utf8 string('\\0') XML_namespace_mappings() = 'm,=urn:partner.soap.sforce.com;';
end;

type query_t = record
 utf8 string('\\0') m_queryString;
 utf8 string('\\0') XML_namespace_mappings() = 'm,=urn:partner.soap.sforce.com;';
end;

type queryAll_t = record
 utf8 string('\\0') m_queryString;
 utf8 string('\\0') XML_namespace_mappings() = 'm,=urn:partner.soap.sforce.com;';
end;

type Body_t = record
 $[SFDC_FUNCTION]_t m_$[SFDC_FUNCTION];
 utf8 string('\\0') XML_namespace_mappings() = 'm,=urn:partner.soap.sforce.com;';
end;

type Envelope_t = record
 Header_t SOAPENV_Header;
 Body_t SOAPENV_Body;
 utf8 string('\\0') XML_namespace_mappings() = 'SOAPENV,=http://schemas.xmlsoap.org/soap/envelope/;';
 utf8 string('\\0') XML_base_element() = 'http://schemas.xmlsoap.org/soap/envelope/:Envelope';
end;

metadata type = Envelope_t;

type parsed_xml_type = Envelope_t;

type document_type = utf8 string(integer(4));

/*Called to prepare a specially formatted record for writing xml*/
xml_rec::prepare_xml_record(in)=
begin
  xml_rec::in;
end;

/*Called to create an output record*/
out::create_output(in,xml_doc)=
begin
  out.request:: string_replace(xml_doc, "</m:SessionHeader>", "</m:SessionHeader>\\n");
  out.other_payload::[vector];
end;|3|9||@{0|}}
{30001002|XXparameter|document_header|on|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata|////////////////////////////////////////////////////////////////////////
// This file was automatically generated by xml-to-dml
// with the command line arguments:
// -base-element Envelope query.xml
////////////////////////////////////////////////////////////////////////
type SessionHeader_t = record
 utf8 string('\\0') m_sessionId;
 string('\\0') XML_namespace_mappings() = 'm,=urn:partner.soap.sforce.com;';
end;

type QueryOptions_t = record
 utf8 string('\\0') m_batchSize;
 utf8 string('\\0') XML_namespace_mappings() = 'm,=urn:partner.soap.sforce.com;';
end;

type Header_t = record
 SessionHeader_t m_SessionHeader;
 QueryOptions_t m_QueryOptions;
 utf8 string('\\0') XML_namespace_mappings() = 'm,=urn:partner.soap.sforce.com;';
end;

type query_t = record
 utf8 string('\\0') m_queryString;
 utf8 string('\\0') XML_namespace_mappings() = 'm,=urn:partner.soap.sforce.com;';
end;

type queryAll_t = record
 utf8 string('\\0') m_queryString;
 utf8 string('\\0') XML_namespace_mappings() = 'm,=urn:partner.soap.sforce.com;';
end;

type Body_t = record
 $[SFDC_FUNCTION]_t m_$[SFDC_FUNCTION];
 utf8 string('\\0') XML_namespace_mappings() = 'm,=urn:partner.soap.sforce.com;';
end;

type Envelope_t = record
 Header_t SOAPENV_Header;
 Body_t SOAPENV_Body;
 utf8 string('\\0') XML_namespace_mappings() = 'SOAPENV,=http://schemas.xmlsoap.org/soap/envelope/;';
 utf8 string('\\0') XML_base_element() = 'http://schemas.xmlsoap.org/soap/envelope/:Envelope';
end;

metadata type = Envelope_t;|3|9||@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@491666|93500|207000|104000|125000|107000|135|Write XML Transform|Ab Initio Software|Built-in 2.14.19:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|608|0|1608|0|{@{}@331000|154000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|609|0|1611|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|610|0|1613|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|611|0|1615|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|612|0|1617|0|{@{}@197000|154000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|613|0|1620|0|{Reads records from its in port, transforms them, and writes an XML document to its out port.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-xml-xfr|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/write-xml-xfr|3|2|H$||{0|}}
{30001002|XXparameter|package||8|1|RFOl|Functions for message creation|{0|}}
{30001002|XXparameter|num_includes|0|1|2|H$|Number of includes in package|{0|}}
{30001002|XXparameter|num_variables|2|1|2|H$|Number of intermediate types|{0|}}
{30001002|XXparameter|variable1|parsed_xml_type xml_rec "record end"|3|2|H$|type generated by xml-to-dml|{0|}}
{30001002|XXparameter|variable2|document_type xml_doc "utf8 string(integer(4))"|3|2|H$|Type for xml document|{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|xml_rec::prepare_xml_record(in)|3|2|H$|Called to prepare a specially formatted record for writing xml|{0|}}
{30001002|XXparameter|operation2|out::create_output(in, xml_doc)|3|2|H$|Called to create an output record|{0|}}
{30001002|XXparameter|pretty_formatting|on|15|1|FKl|Format the XML with line breaks and indentation to make it easier to read.|{2|on|off|}}
{30001002|XXparameter|pretty_formatting.display_name|pretty-formatting|3|9|P|@{0|}}
{30001002|XXparameter|pretty_formatting.keyword|pretty-formatting|3|9|P|@{0|}}
{30001002|XXparameter|indent_size|0|1|2|FK$|Number of spaces in each indent|{0|}}
{30001002|XXparameter|indent_size.display_name|indent-size|3|9|P|@{0|}}
{30001002|XXparameter|indent_size.keyword|indent-size|3|9|P|@{0|}}
{30001002|XXparameter|indent_size.condition|param pretty-formatting on|3|15|P?|@{0|}}
{30001002|XXparameter|document_header|off|15|1|FKl|Print the header <?xml version... ?> at the beginning of the XML document|{2|off|on|}}
{30001002|XXparameter|document_header.display_name|document-header|3|9|P|@{0|}}
{30001002|XXparameter|document_header.keyword|document-header|3|9|P|@{0|}}
{30001002|XXparameter|add_bom|False|13|1|FKl|Add a byte-order-mark at the start of each output document.|{0|}}
{30001002|XXparameter|add_bom.display_name|add-bom|3|9|P|@{0|}}
{30001002|XXparameter|add_bom.keyword|add-bom|3|9|P|@{0|}}
{30001002|XXparameter|add_bom.condition|version 2.15.4.r1:|3|15|P?|@{0|}}
{30001002|XXparameter|cdata_section_elements||3|2|FK$|Space-separated list of elements for which CDATA sections will be used for element content. Use * for all elements.|{0|}}
{30001002|XXparameter|cdata_section_elements.display_name|cdata-section-elements|3|9|P|@{0|}}
{30001002|XXparameter|cdata_section_elements.keyword|cdata-section-elements|3|9|P|@{0|}}
{30001002|XXparameter|cdata_section_elements.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|schema_location||3|2|FK$|One or more pairs of space-separated URIs. Each pair consists of a namespace name and its corresponding schema document location.|{0|}}
{30001002|XXparameter|schema_location.display_name|schema-location|3|9|P|@{0|}}
{30001002|XXparameter|schema_location.keyword|schema-location|3|9|P|@{0|}}
{30001002|XXparameter|schema_location.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|no_namespace_schema_location||3|2|FK$|URI for the location of schema documents with no target namespace.|{0|}}
{30001002|XXparameter|no_namespace_schema_location.display_name|no-namespace-schema-location|3|9|P|@{0|}}
{30001002|XXparameter|no_namespace_schema_location.keyword|no-namespace-schema-location|3|9|P|@{0|}}
{30001002|XXparameter|no_namespace_schema_location.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|escape_optional_special_characters|False|13|1|FKl|Substitutes each XML optional special character (>, ", ') with its corresponding escape sequence.|{0|}}
{30001002|XXparameter|escape_optional_special_characters.display_name|escape-optional-special-characters|3|9|P|@{0|}}
{30001002|XXparameter|escape_optional_special_characters.keyword|escape-optional-special-characters|3|9|P|@{0|}}
{30001002|XXparameter|escape_optional_special_characters.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
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
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|version 2.14.46:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1442863192|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"
metadata type: reject = in|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Write XML Transform|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|614|0|1622|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|615|0|1625|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|616|0|1628|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|617|0|1631|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|618|0|1634|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|619|0|1637|0|{@{}@0|0|0|0|out|.5|@@@14736|0|}}
{2010203004|XXGoport|620|0|1640|0|{@{}@0|0|0|0|error|.25|@@@13720|0|}}
{2010203004|XXGoport|621|0|1643|0|{@{}@0|0|0|0|log|.75|@@@13336|0|}}
{2010501005|XXGpvertex|622|0|1646|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin

if (string_index(in.faultstring,"timed out") > 0) force_error("Not Able to Connect to salesforce for $\{SOURCE_NAME\} at this time: Please rerun the job again in some time.");
if (string_index(in.detail,"ERROR") > 0) force_error("Bad data in source, please investigate");

out.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|236000|580000|0|0|0|0|12102|RFT - Abort - no connection|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|623|0|1648|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|624|0|1651|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|625|0|1653|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|626|0|1655|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|627|0|1657|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|628|0|1660|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|629|0|1662|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|630|0|1666|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|631|0|1669|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|632|0|1672|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|633|0|1675|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|634|0|1682|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|$\{MAP_SOURCE_CLEAN_XFR\}|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|431000|310000|0|0|0|0|12064|RFT \{map source to clean\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|635|0|1684|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|636|0|1687|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|637|0|1689|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|638|0|1691|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|639|0|1693|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|640|0|1696|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|641|0|1698|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|642|0|1702|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|643|0|1705|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|644|0|1708|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|645|0|1711|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|646|0|1718|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{event_type\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|include "/~$PUB_DXF_DML/dxf_job_event_text.dml";


let long task_start_time = now();
let long task_end_time = 0;


/* Only roll up job logs. */
out :: input_select(in) =
begin
  out :: starts_with(in.event_type, "dxf Job Log: ");
end;


/* Roll up all the job log entries for a given dataset. */
out :: rollup(in) =
begin
  let dxf_job_event_text_t job_info = reinterpret(in.event_text);
  let start_time = min(job_info.dataset_start_dttm);
  let min_end_time = min(job_info.dataset_end_dttm);
  let max_end_time = max(job_info.dataset_end_dttm);
  if ( task_end_time == 0 )
    task_end_time = now();  // This works because we are in an unsorted rollup, so we only see records after the last one arrives.

  out.* :: job_info.*;
  out.dxf_src_dataset_id :: max(job_info.dxf_src_dataset_id);  // Use the value from partition 0.
  out.run_id :: $"RUN_ID";
  out.task_name :: $"AB_PSET_NAME";
  out.task_start_dttm :: task_start_time;
  out.task_end_dttm :: task_end_time;
  out.dataset_name :: $"DATASET_NAME";
  out.dxf_src_rec_cnt :: max(job_info.dxf_src_rec_cnt);
  out.type_of_input :: 'table'; /* Or 'file' or 'ftp' */
  out.dataset_start_dttm :: start_time;
  out.dataset_min_end_dttm :: min_end_time;
  out.dataset_max_end_dttm :: max_end_time;
  out.file_size :: NULL;
  out.file_modified_dttm :: NULL;
  out.sql_script :: $"SQL_SCRIPT";
end;|3|9||@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|max_core|$AI_GRAPH_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|819000|514000|0|0|0|0|12058|Rollup Job Info|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|647|0|1720|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|648|0|1723|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|649|0|1725|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|650|0|1727|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|651|0|1729|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|652|0|1732|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not ordered or grouped. In this case, ROLLUP processes the data in-memory without sorting it.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.update_clauses|retain_old_default|3|9|P|@{0|}}
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
{30001002|XXparameter|output_without_input|Never|15|1|FKl|When to invoke the output_without_input transform function to produce an output record not corresponding to an input record.|{4|Never|At each computepoint|At each checkpoint|At component shutdown|}}
{30001002|XXparameter|output_without_input.condition|version 3.2.2.r15:|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|12|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of public variables in rollup|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|temp ? temp::rollup(temp, in) : out::rollup(in)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation4|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation5|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6|optional integer(8) out::key_change(in in1, in in2)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|operation7|optional out::output_without_input()|3|2|H$|Output when there are no input records|{0|}}
{30001002|XXparameter|operation7.condition|version 3.2.2.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation5_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
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
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|653|0|1734|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|654|0|1737|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|655|0|1740|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|656|0|1743|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|657|0|1746|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010110002|XXGconstant|658|0|1753|0|{@{}@{1|8377260|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010605001|XXGgraph_legend_legend|6|0|12|0|{1|}1|7|}
{2010241001|XXGlegend_face_face|7|0|14|0|{}7|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_1|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_10|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_11|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_2|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_3|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_4|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_5|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_6|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_7|}1|17|}
{2010244001|XXGflow_watcher_watcher|17|0|34|0|{}17|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_8|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_9|}1|20|}
{2010601001|XXGgraph_vertex_vertex|20|0|40|0|{Clean_File|}1|21|}
{2010211001|XXGvertex_iport_iport|21|0|42|0|{0|write|}21|22|}
{2010214001|XXGiport_src_flow|22|0|44|0|{0|}22|10|}
{2010007001|XXGobject_proto_object|23|0|45|0|{}21|23|}
{2010211001|XXGvertex_iport_iport|24|0|47|0|{0|write|}23|24|}
{2010006001|XXGobject_psameas_object|25|0|49|0|{metadata|write_metadata|1|0|}24|23|}
{2010601001|XXGgraph_vertex_vertex|26|0|50|0|{Error|}1|25|}
{2010211001|XXGvertex_iport_iport|27|0|52|0|{0|write|}25|26|}
{2010214001|XXGiport_src_flow|28|0|54|0|{0|}26|11|}
{2010007001|XXGobject_proto_object|29|0|55|0|{}25|27|}
{2010211001|XXGvertex_iport_iport|30|0|57|0|{0|write|}27|28|}
{2010006001|XXGobject_psameas_object|31|0|59|0|{metadata|write_metadata|1|0|}28|27|}
{2010006001|XXGobject_psameas_object|32|0|60|0|{write_metadata|out0_metadata|0|0|}25|29|}
{2010212001|XXGvertex_oport_oport|33|0|62|0|{0|out0|}29|30|}
{2010212001|XXGvertex_oport_oport|34|0|64|0|{1|reject0|}29|31|}
{2010212001|XXGvertex_oport_oport|35|0|66|0|{2|error0|}29|32|}
{2010212001|XXGvertex_oport_oport|36|0|68|0|{3|log|}29|33|}
{2010211001|XXGvertex_iport_iport|37|0|70|0|{0|in|}29|34|}
{2010214001|XXGiport_src_flow|38|0|72|0|{0|}34|35|}
{2010214001|XXGiport_src_flow|39|0|74|0|{1|}34|36|}
{2010006001|XXGobject_psameas_object|40|0|76|0|{Layout|Layout|0|0|}29|37|}
{2010212001|XXGvertex_oport_oport|41|0|78|0|{0|out0|}37|38|}
{2010213001|XXGoport_dst_flow|42|0|80|0|{0|}38|39|}
{2010212001|XXGvertex_oport_oport|43|0|82|0|{1|reject0|}37|40|}
{2010212001|XXGvertex_oport_oport|44|0|84|0|{2|error0|}37|41|}
{2010212001|XXGvertex_oport_oport|45|0|86|0|{3|log|}37|42|}
{2010211001|XXGvertex_iport_iport|46|0|88|0|{0|in|}37|43|}
{2010214001|XXGiport_src_flow|47|0|90|0|{0|}43|44|}
{2010006001|XXGobject_psameas_object|48|0|92|0|{in_metadata|out_metadata|0|0|}37|45|}
{2010212001|XXGvertex_oport_oport|49|0|94|0|{0|out|}45|46|}
{2010213001|XXGoport_dst_flow|50|0|96|0|{0|}46|47|}
{2010212001|XXGvertex_oport_oport|51|0|98|0|{1|error|}45|48|}
{2010212001|XXGvertex_oport_oport|52|0|100|0|{2|log|}45|49|}
{2010006001|XXGobject_psameas_object|53|0|102|0|{Layout|Layout|0|0|}45|37|}
{2010006001|XXGobject_psameas_object|54|0|103|0|{out0_metadata|in_metadata|0|0|}37|50|}
{2010212001|XXGvertex_oport_oport|55|0|105|0|{0|out|}50|51|}
{2010213001|XXGoport_dst_flow|56|0|107|0|{0|}51|52|}
{2010212001|XXGvertex_oport_oport|57|0|109|0|{1|reject|}50|53|}
{2010212001|XXGvertex_oport_oport|58|0|111|0|{2|error|}50|54|}
{2010212001|XXGvertex_oport_oport|59|0|113|0|{3|log|}50|55|}
{2010211001|XXGvertex_iport_iport|60|0|115|0|{0|in|}50|56|}
{2010214001|XXGiport_src_flow|61|0|117|0|{0|}56|39|}
{2010006001|XXGobject_psameas_object|62|0|118|0|{Layout|Layout|0|0|}50|37|}
{2010006001|XXGobject_psameas_object|63|0|119|0|{out_metadata|in_metadata|0|0|}50|57|}
{2010212001|XXGvertex_oport_oport|64|0|121|0|{0|out|}57|58|}
{2010213001|XXGoport_dst_flow|65|0|123|0|{0|}58|59|}
{2010212001|XXGvertex_oport_oport|66|0|125|0|{1|reject|}57|60|}
{2010213001|XXGoport_dst_flow|67|0|127|0|{0|}60|61|}
{2010212001|XXGvertex_oport_oport|68|0|129|0|{2|error|}57|62|}
{2010213001|XXGoport_dst_flow|69|0|131|0|{0|}62|63|}
{2010212001|XXGvertex_oport_oport|70|0|133|0|{3|log|}57|64|}
{2010213001|XXGoport_dst_flow|71|0|135|0|{0|}64|65|}
{2010211001|XXGvertex_iport_iport|72|0|137|0|{0|in|}57|66|}
{2010006001|XXGobject_psameas_object|73|0|139|0|{Layout|Layout|0|0|}57|37|}
{2010006001|XXGobject_psameas_object|74|0|140|0|{reject_metadata|in_metadata|0|0|}57|57|}
{2010006001|XXGobject_psameas_object|75|0|141|0|{reject_metadata|in_metadata|0|0|}50|50|}
{2010006001|XXGobject_psameas_object|76|0|142|0|{reject0_metadata|out_metadata|0|0|}37|45|}
{2010006001|XXGobject_psameas_object|77|0|143|0|{in_metadata|out_metadata|0|0|}29|67|}
{2010212001|XXGvertex_oport_oport|78|0|145|0|{0|out|}67|68|}
{2010213001|XXGoport_dst_flow|79|0|147|0|{0|}68|69|}
{2010212001|XXGvertex_oport_oport|80|0|149|0|{1|reject|}67|70|}
{2010213001|XXGoport_dst_flow|81|0|151|0|{0|}70|71|}
{2010212001|XXGvertex_oport_oport|82|0|153|0|{2|error|}67|72|}
{2010212001|XXGvertex_oport_oport|83|0|155|0|{3|log|}67|73|}
{2010211001|XXGvertex_iport_iport|84|0|157|0|{0|in|}67|74|}
{2010214001|XXGiport_src_flow|85|0|159|0|{0|}74|75|}
{2010006001|XXGobject_psameas_object|86|0|161|0|{Layout|Layout|0|0|}67|37|}
{2010006001|XXGobject_psameas_object|87|0|162|0|{reject_metadata|in_metadata|0|0|}67|67|}
{2010006001|XXGobject_psameas_object|88|0|163|0|{reject0_metadata|out_metadata|0|0|}29|67|}
{2010601001|XXGgraph_vertex_vertex|89|0|164|0|{Gather|}1|76|}
{2010212001|XXGvertex_oport_oport|90|0|166|0|{0|out|}76|77|}
{2010213001|XXGoport_dst_flow|91|0|168|0|{0|}77|12|}
{2010211001|XXGvertex_iport_iport|92|0|169|0|{0|in|}76|78|}
{2010214001|XXGiport_src_flow|93|0|171|0|{0|}78|9|}
{2010007001|XXGobject_proto_object|94|0|172|0|{}76|79|}
{2010212001|XXGvertex_oport_oport|95|0|174|0|{0|out|}79|80|}
{2010006001|XXGobject_psameas_object|96|0|176|0|{metadata|out_metadata|1|0|}80|79|}
{2010211001|XXGvertex_iport_iport|97|0|177|0|{0|in|}79|81|}
{2010006001|XXGobject_psameas_object|98|0|179|0|{metadata|in_metadata|1|0|}81|79|}
{2010006001|XXGobject_psameas_object|99|0|180|0|{Layout|Layout|0|0|}76|25|}
{2010006001|XXGobject_psameas_object|100|0|181|0|{in_metadata|out0_metadata|0|0|}76|29|}
{2010006001|XXGobject_psameas_object|101|0|182|0|{out_metadata|out0_metadata|0|0|}76|29|}
{2010601001|XXGgraph_vertex_vertex|102|0|183|0|{Gather_1|}1|82|}
{2010212001|XXGvertex_oport_oport|103|0|185|0|{0|out|}82|83|}
{2010213001|XXGoport_dst_flow|104|0|187|0|{0|}83|15|}
{2010211001|XXGvertex_iport_iport|105|0|188|0|{0|in|}82|84|}
{2010214001|XXGiport_src_flow|106|0|190|0|{0|}84|14|}
{2010007001|XXGobject_proto_object|107|0|191|0|{}82|85|}
{2010212001|XXGvertex_oport_oport|108|0|193|0|{0|out|}85|86|}
{2010006001|XXGobject_psameas_object|109|0|195|0|{metadata|out_metadata|1|0|}86|85|}
{2010211001|XXGvertex_iport_iport|110|0|196|0|{0|in|}85|87|}
{2010006001|XXGobject_psameas_object|111|0|198|0|{metadata|in_metadata|1|0|}87|85|}
{2010006001|XXGobject_psameas_object|112|0|199|0|{Layout|Layout|0|0|}82|88|}
{2010211001|XXGvertex_iport_iport|113|0|201|0|{0|write|}88|89|}
{2010214001|XXGiport_src_flow|114|0|203|0|{0|}89|15|}
{2010007001|XXGobject_proto_object|115|0|204|0|{}88|90|}
{2010211001|XXGvertex_iport_iport|116|0|206|0|{0|write|}90|91|}
{2010006001|XXGobject_psameas_object|117|0|208|0|{metadata|write_metadata|1|0|}91|90|}
{2010006001|XXGobject_psameas_object|118|0|209|0|{write_metadata|out_metadata|0|0|}88|92|}
{2010212001|XXGvertex_oport_oport|119|0|211|0|{0|out|}92|93|}
{2010211001|XXGvertex_iport_iport|120|0|213|0|{0|in|}92|94|}
{2010214001|XXGiport_src_flow|121|0|215|0|{0|}94|95|}
{2010006001|XXGobject_psameas_object|122|0|217|0|{Layout|Layout|0|0|}92|37|}
{2010006001|XXGobject_psameas_object|123|0|218|0|{in_metadata|out_metadata|0|0|}92|92|}
{2010006001|XXGobject_psameas_object|124|0|219|0|{in_metadata|out_metadata|0|0|}82|92|}
{2010006001|XXGobject_psameas_object|125|0|220|0|{out_metadata|out_metadata|0|0|}82|92|}
{2010601001|XXGgraph_vertex_vertex|126|0|221|0|{Get_Job_Log|}1|96|}
{2010211001|XXGvertex_iport_iport|127|0|223|0|{0|write|}96|97|}
{2010214001|XXGiport_src_flow|128|0|225|0|{0|}97|19|}
{2010007001|XXGobject_proto_object|129|0|226|0|{}96|98|}
{2010211001|XXGvertex_iport_iport|130|0|228|0|{0|write|}98|99|}
{2010006001|XXGobject_psameas_object|131|0|230|0|{metadata|write_metadata|1|0|}99|98|}
{2010601001|XXGgraph_vertex_vertex|132|0|231|0|{Log|}1|88|}
{2010601001|XXGgraph_vertex_vertex|133|0|232|0|{Normalize_Add_Job_ID_Record_Count|}1|100|}
{2010212001|XXGvertex_oport_oport|134|0|234|0|{0|out|}100|101|}
{2010213001|XXGoport_dst_flow|135|0|236|0|{0|}101|10|}
{2010212001|XXGvertex_oport_oport|136|0|237|0|{1|reject|}100|102|}
{2010212001|XXGvertex_oport_oport|137|0|239|0|{2|error|}100|103|}
{2010212001|XXGvertex_oport_oport|138|0|241|0|{3|log|}100|104|}
{2010213001|XXGoport_dst_flow|139|0|243|0|{0|}104|17|}
{2010211001|XXGvertex_iport_iport|140|0|244|0|{0|in|}100|105|}
{2010214001|XXGiport_src_flow|141|0|246|0|{0|}105|20|}
{2010007001|XXGobject_proto_object|142|0|247|0|{}100|106|}
{2010212001|XXGvertex_oport_oport|143|0|249|0|{0|out|}106|107|}
{2010006001|XXGobject_psameas_object|144|0|251|0|{metadata|out_metadata|1|0|}107|106|}
{2010212001|XXGvertex_oport_oport|145|0|252|0|{1|reject|}106|108|}
{2010006001|XXGobject_psameas_object|146|0|254|0|{metadata|reject_metadata|1|0|}108|106|}
{2010212001|XXGvertex_oport_oport|147|0|255|0|{2|error|}106|109|}
{2010006001|XXGobject_psameas_object|148|0|257|0|{metadata|error_metadata|1|0|}109|106|}
{2010212001|XXGvertex_oport_oport|149|0|258|0|{3|log|}106|110|}
{2010006001|XXGobject_psameas_object|150|0|260|0|{metadata|log_metadata|1|0|}110|106|}
{2010211001|XXGvertex_iport_iport|151|0|261|0|{0|in|}106|111|}
{2010006001|XXGobject_psameas_object|152|0|263|0|{metadata|in_metadata|1|0|}111|106|}
{2010006001|XXGobject_psameas_object|153|0|264|0|{Layout|Layout|0|0|}100|21|}
{2010006001|XXGobject_psameas_object|154|0|265|0|{in_metadata|write_metadata|0|0|}100|21|}
{2010006001|XXGobject_psameas_object|155|0|266|0|{out_metadata|write_metadata|0|0|}100|21|}
{2010006001|XXGobject_psameas_object|156|0|267|0|{reject_metadata|write_metadata|0|0|}100|21|}
{2010601001|XXGgraph_vertex_vertex|157|0|268|0|{Partition_by_Round_robin|}1|112|}
{2010212001|XXGvertex_oport_oport|158|0|270|0|{0|out|}112|113|}
{2010213001|XXGoport_dst_flow|159|0|272|0|{0|}113|16|}
{2010211001|XXGvertex_iport_iport|160|0|273|0|{0|in|}112|114|}
{2010214001|XXGiport_src_flow|161|0|275|0|{0|}114|13|}
{2010007001|XXGobject_proto_object|162|0|276|0|{}112|115|}
{2010212001|XXGvertex_oport_oport|163|0|278|0|{0|out|}115|116|}
{2010006001|XXGobject_psameas_object|164|0|280|0|{metadata|out_metadata|1|0|}116|115|}
{2010211001|XXGvertex_iport_iport|165|0|281|0|{0|in|}115|117|}
{2010006001|XXGobject_psameas_object|166|0|283|0|{metadata|in_metadata|1|0|}117|115|}
{2010006001|XXGobject_psameas_object|167|0|284|0|{Layout|Layout|0|0|}112|37|}
{2010006001|XXGobject_psameas_object|168|0|285|0|{in_metadata|out_metadata|0|0|}112|118|}
{2010212001|XXGvertex_oport_oport|169|0|287|0|{0|out|}118|119|}
{2010212001|XXGvertex_oport_oport|170|0|289|0|{1|reject|}118|120|}
{2010212001|XXGvertex_oport_oport|171|0|291|0|{2|error|}118|121|}
{2010212001|XXGvertex_oport_oport|172|0|293|0|{3|log|}118|122|}
{2010211001|XXGvertex_iport_iport|173|0|295|0|{0|in|}118|123|}
{2010214001|XXGiport_src_flow|174|0|297|0|{0|}123|124|}
{2010214001|XXGiport_src_flow|175|0|299|0|{1|}123|125|}
{2010006001|XXGobject_psameas_object|176|0|301|0|{Layout|Layout|0|0|}118|37|}
{2010006001|XXGobject_psameas_object|177|0|302|0|{in_metadata|out_metadata|0|0|}118|126|}
{2010212001|XXGvertex_oport_oport|178|0|304|0|{0|out|}126|127|}
{2010213001|XXGoport_dst_flow|179|0|306|0|{0|}127|125|}
{2010212001|XXGvertex_oport_oport|180|0|307|0|{1|reject|}126|128|}
{2010213001|XXGoport_dst_flow|181|0|309|0|{0|}128|129|}
{2010212001|XXGvertex_oport_oport|182|0|311|0|{2|error|}126|130|}
{2010212001|XXGvertex_oport_oport|183|0|313|0|{3|log|}126|131|}
{2010211001|XXGvertex_iport_iport|184|0|315|0|{0|in|}126|132|}
{2010214001|XXGiport_src_flow|185|0|317|0|{0|}132|133|}
{2010006001|XXGobject_psameas_object|186|0|319|0|{Layout|Layout|0|0|}126|37|}
{2010006001|XXGobject_psameas_object|187|0|320|0|{in_metadata|out_metadata|0|0|}126|134|}
{2010212001|XXGvertex_oport_oport|188|0|322|0|{0|out|}134|135|}
{2010212001|XXGvertex_oport_oport|189|0|324|0|{1|reject|}134|136|}
{2010213001|XXGoport_dst_flow|190|0|326|0|{0|}136|137|}
{2010212001|XXGvertex_oport_oport|191|0|328|0|{2|error|}134|138|}
{2010212001|XXGvertex_oport_oport|192|0|330|0|{3|log|}134|139|}
{2010211001|XXGvertex_iport_iport|193|0|332|0|{0|in|}134|140|}
{2010214001|XXGiport_src_flow|194|0|334|0|{0|}140|141|}
{2010006001|XXGobject_psameas_object|195|0|336|0|{Layout|Layout|0|0|}134|37|}
{2010006001|XXGobject_psameas_object|196|0|337|0|{in_metadata|out0_metadata|0|0|}134|142|}
{2010212001|XXGvertex_oport_oport|197|0|339|0|{0|_2xx|}142|143|}
{2010213001|XXGoport_dst_flow|198|0|341|0|{0|}143|141|}
{2010212001|XXGvertex_oport_oport|199|0|342|0|{1|Other|}142|144|}
{2010213001|XXGoport_dst_flow|200|0|344|0|{0|}144|145|}
{2010212001|XXGvertex_oport_oport|201|0|346|0|{2|_5xx|}142|146|}
{2010213001|XXGoport_dst_flow|202|0|348|0|{0|}146|75|}
{2010212001|XXGvertex_oport_oport|203|0|349|0|{3|reject0|}142|147|}
{2010212001|XXGvertex_oport_oport|204|0|351|0|{4|reject1|}142|148|}
{2010212001|XXGvertex_oport_oport|205|0|353|0|{5|reject2|}142|149|}
{2010212001|XXGvertex_oport_oport|206|0|355|0|{6|error0|}142|150|}
{2010212001|XXGvertex_oport_oport|207|0|357|0|{7|error1|}142|151|}
{2010212001|XXGvertex_oport_oport|208|0|359|0|{8|error2|}142|152|}
{2010212001|XXGvertex_oport_oport|209|0|361|0|{9|log|}142|153|}
{2010211001|XXGvertex_iport_iport|210|0|363|0|{0|in|}142|154|}
{2010214001|XXGiport_src_flow|211|0|365|0|{0|}154|59|}
{2010006001|XXGobject_psameas_object|212|0|366|0|{Layout|Layout|0|0|}142|37|}
{2010006001|XXGobject_psameas_object|213|0|367|0|{in_metadata|out_metadata|0|0|}142|57|}
{2010006001|XXGobject_psameas_object|214|0|368|0|{out1_metadata|out_metadata|0|0|}142|67|}
{2010006001|XXGobject_psameas_object|215|0|369|0|{out2_metadata|in_metadata|0|0|}142|67|}
{2010006001|XXGobject_psameas_object|216|0|370|0|{reject0_metadata|out_metadata|0|0|}142|57|}
{2010006001|XXGobject_psameas_object|217|0|371|0|{reject1_metadata|out_metadata|0|0|}142|57|}
{2010006001|XXGobject_psameas_object|218|0|372|0|{reject_metadata|out0_metadata|0|0|}134|142|}
{2010006001|XXGobject_psameas_object|219|0|373|0|{reject_metadata|out_metadata|0|0|}126|134|}
{2010006001|XXGobject_psameas_object|220|0|374|0|{reject_metadata|out_metadata|0|0|}118|126|}
{2010006001|XXGobject_psameas_object|221|0|375|0|{out_metadata|out_metadata|0|0|}112|118|}
{2010601001|XXGgraph_vertex_vertex|222|0|376|0|{Query_Salesforce_Objects|}1|155|}
{2010605001|XXGgraph_legend_legend|223|0|378|0|{0|}155|156|}
{2010241001|XXGlegend_face_face|224|0|380|0|{}156|157|}
{2010605001|XXGgraph_legend_legend|225|0|382|0|{1|}155|158|}
{2010241001|XXGlegend_face_face|226|0|384|0|{}158|159|}
{2010604001|XXGgraph_flow_flow|227|0|386|0|{Flow_1|}155|52|}
{2010604001|XXGgraph_flow_flow|228|0|387|0|{Flow_10|}155|129|}
{2010604001|XXGgraph_flow_flow|229|0|388|0|{Flow_11|}155|160|}
{2010604001|XXGgraph_flow_flow|230|0|390|0|{Flow_12|}155|35|}
{2010604001|XXGgraph_flow_flow|231|0|391|0|{Flow_14|}155|47|}
{2010604001|XXGgraph_flow_flow|232|0|392|0|{Flow_2|}155|44|}
{2010604001|XXGgraph_flow_flow|233|0|393|0|{Flow_3|}155|161|}
{2010604001|XXGgraph_flow_flow|234|0|395|0|{Flow_4|}155|36|}
{2010604001|XXGgraph_flow_flow|235|0|396|0|{Flow_5|}155|124|}
{2010604001|XXGgraph_flow_flow|236|0|397|0|{Flow_6|}155|39|}
{2010604001|XXGgraph_flow_flow|237|0|398|0|{Flow_7|}155|133|}
{2010604001|XXGgraph_flow_flow|238|0|399|0|{Flow_8|}155|125|}
{2010604001|XXGgraph_flow_flow|239|0|400|0|{Flow_9|}155|162|}
{2010601001|XXGgraph_vertex_vertex|240|0|402|0|{Create_Data|}155|45|}
{2010601001|XXGgraph_vertex_vertex|241|0|403|0|{Normalize_to_get_1_object_per_record|}155|118|}
{2010601001|XXGgraph_vertex_vertex|242|0|404|0|{Not_Expected_Response|}155|163|}
{2010212001|XXGvertex_oport_oport|243|0|406|0|{0|out0|}163|164|}
{2010213001|XXGoport_dst_flow|244|0|408|0|{0|}164|36|}
{2010212001|XXGvertex_oport_oport|245|0|409|0|{1|reject0|}163|165|}
{2010212001|XXGvertex_oport_oport|246|0|411|0|{2|error0|}163|166|}
{2010212001|XXGvertex_oport_oport|247|0|413|0|{3|log|}163|167|}
{2010211001|XXGvertex_iport_iport|248|0|415|0|{0|in|}163|168|}
{2010214001|XXGiport_src_flow|249|0|417|0|{0|}168|160|}
{2010214001|XXGiport_src_flow|250|0|418|0|{1|}168|129|}
{2010006001|XXGobject_psameas_object|251|0|419|0|{Layout|Layout|0|0|}163|37|}
{2010006001|XXGobject_psameas_object|252|0|420|0|{in_metadata|out_metadata|0|0|}163|134|}
{2010006001|XXGobject_psameas_object|253|0|421|0|{out0_metadata|out_metadata|0|0|}163|67|}
{2010006001|XXGobject_psameas_object|254|0|422|0|{reject0_metadata|out_metadata|0|0|}163|134|}
{2010601001|XXGgraph_vertex_vertex|255|0|423|0|{R_to_insert_request_parameters|}155|37|}
{2010601001|XXGgraph_vertex_vertex|256|0|424|0|{Read_queryMore_results|}155|126|}
{2010601001|XXGgraph_vertex_vertex|257|0|425|0|{Read_query_results|}155|169|}
{2010212001|XXGvertex_oport_oport|258|0|427|0|{0|out|}169|170|}
{2010213001|XXGoport_dst_flow|259|0|429|0|{0|}170|124|}
{2010212001|XXGvertex_oport_oport|260|0|430|0|{1|reject|}169|171|}
{2010213001|XXGoport_dst_flow|261|0|432|0|{0|}171|160|}
{2010212001|XXGvertex_oport_oport|262|0|433|0|{2|error|}169|172|}
{2010212001|XXGvertex_oport_oport|263|0|435|0|{3|log|}169|173|}
{2010211001|XXGvertex_iport_iport|264|0|437|0|{0|in|}169|174|}
{2010214001|XXGiport_src_flow|265|0|439|0|{0|}174|162|}
{2010006001|XXGobject_psameas_object|266|0|440|0|{Layout|Layout|0|0|}169|37|}
{2010006001|XXGobject_psameas_object|267|0|441|0|{in_metadata|out_metadata|0|0|}169|134|}
{2010006001|XXGobject_psameas_object|268|0|442|0|{reject_metadata|out_metadata|0|0|}169|134|}
{2010601001|XXGgraph_vertex_vertex|269|0|443|0|{Reformat|}155|29|}
{2010601001|XXGgraph_vertex_vertex|270|0|444|0|{Salesforce_CWS_and_Fault_Handling|}155|175|}
{2010604001|XXGgraph_flow_flow|271|0|446|0|{Flow_1|}175|59|}
{2010604001|XXGgraph_flow_flow|272|0|447|0|{Flow_10|}175|69|}
{2010604001|XXGgraph_flow_flow|273|0|448|0|{Flow_11|}175|63|}
{2010604001|XXGgraph_flow_flow|274|0|449|0|{Flow_12|}175|65|}
{2010604001|XXGgraph_flow_flow|275|0|450|0|{Flow_13|}175|95|}
{2010604001|XXGgraph_flow_flow|276|0|451|0|{Flow_15|}175|176|}
{2010604001|XXGgraph_flow_flow|277|0|453|0|{Flow_16|}175|177|}
{2010604001|XXGgraph_flow_flow|278|0|455|0|{Flow_2|}175|145|}
{2010604001|XXGgraph_flow_flow|279|0|456|0|{Flow_3|}175|137|}
{2010604001|XXGgraph_flow_flow|280|0|457|0|{Flow_4|}175|141|}
{2010604001|XXGgraph_flow_flow|281|0|458|0|{Flow_5|}175|75|}
{2010604001|XXGgraph_flow_flow|282|0|459|0|{Flow_6|}175|178|}
{2010604001|XXGgraph_flow_flow|283|0|461|0|{Flow_7|}175|179|}
{2010604001|XXGgraph_flow_flow|284|0|463|0|{Flow_8|}175|71|}
{2010604001|XXGgraph_flow_flow|285|0|464|0|{Flow_9|}175|61|}
{2010601001|XXGgraph_vertex_vertex|286|0|465|0|{Call_Web_Service|}175|57|}
{2010601001|XXGgraph_vertex_vertex|287|0|466|0|{Dispatch_by_HTTP_Response_Code|}175|142|}
{2010601001|XXGgraph_vertex_vertex|288|0|467|0|{Error_as_Fault|}175|180|}
{2010212001|XXGvertex_oport_oport|289|0|469|0|{0|out0|}180|181|}
{2010213001|XXGoport_dst_flow|290|0|471|0|{0|}181|176|}
{2010212001|XXGvertex_oport_oport|291|0|472|0|{1|reject0|}180|182|}
{2010212001|XXGvertex_oport_oport|292|0|474|0|{2|error0|}180|183|}
{2010212001|XXGvertex_oport_oport|293|0|476|0|{3|log|}180|184|}
{2010211001|XXGvertex_iport_iport|294|0|478|0|{0|in|}180|185|}
{2010214001|XXGiport_src_flow|295|0|480|0|{0|}185|177|}
{2010006001|XXGobject_psameas_object|296|0|481|0|{Layout|Layout|0|0|}180|37|}
{2010006001|XXGobject_psameas_object|297|0|482|0|{in_metadata|out_metadata|0|0|}180|186|}
{2010212001|XXGvertex_oport_oport|298|0|484|0|{0|out|}186|187|}
{2010213001|XXGoport_dst_flow|299|0|486|0|{0|}187|177|}
{2010212001|XXGvertex_oport_oport|300|0|487|0|{1|reject0|}186|188|}
{2010212001|XXGvertex_oport_oport|301|0|489|0|{2|reject1|}186|189|}
{2010212001|XXGvertex_oport_oport|302|0|491|0|{3|error0|}186|190|}
{2010212001|XXGvertex_oport_oport|303|0|493|0|{4|error1|}186|191|}
{2010212001|XXGvertex_oport_oport|304|0|495|0|{5|log|}186|192|}
{2010211001|XXGvertex_iport_iport|305|0|497|0|{0|in0|}186|193|}
{2010214001|XXGiport_src_flow|306|0|499|0|{0|}193|61|}
{2010211001|XXGvertex_iport_iport|307|0|500|0|{1|in1|}186|194|}
{2010214001|XXGiport_src_flow|308|0|502|0|{0|}194|63|}
{2010006001|XXGobject_psameas_object|309|0|503|0|{Layout|Layout|0|0|}186|37|}
{2010006001|XXGobject_psameas_object|310|0|504|0|{in0_metadata|in_metadata|0|0|}186|57|}
{2010006001|XXGobject_psameas_object|311|0|505|0|{in1_metadata|error_metadata|0|0|}186|57|}
{2010006001|XXGobject_psameas_object|312|0|506|0|{reject0_metadata|in_metadata|0|0|}186|57|}
{2010006001|XXGobject_psameas_object|313|0|507|0|{reject1_metadata|error_metadata|0|0|}186|57|}
{2010006001|XXGobject_psameas_object|314|0|508|0|{out0_metadata|out_metadata|0|0|}180|67|}
{2010006001|XXGobject_psameas_object|315|0|509|0|{reject0_metadata|out_metadata|0|0|}180|186|}
{2010601001|XXGgraph_vertex_vertex|316|0|510|0|{Fuse|}175|186|}
{2010601001|XXGgraph_vertex_vertex|317|0|511|0|{Gather|}175|195|}
{2010212001|XXGvertex_oport_oport|318|0|513|0|{0|out|}195|196|}
{2010211001|XXGvertex_iport_iport|319|0|515|0|{0|in|}195|197|}
{2010214001|XXGiport_src_flow|320|0|517|0|{0|}197|179|}
{2010214001|XXGiport_src_flow|321|0|518|0|{1|}197|145|}
{2010214001|XXGiport_src_flow|322|0|519|0|{2|}197|69|}
{2010214001|XXGiport_src_flow|323|0|520|0|{3|}197|178|}
{2010214001|XXGiport_src_flow|324|0|521|0|{4|}197|176|}
{2010006001|XXGobject_psameas_object|325|0|522|0|{Layout|Layout|0|0|}195|37|}
{2010006001|XXGobject_psameas_object|326|0|523|0|{in_metadata|out_metadata|0|0|}195|67|}
{2010006001|XXGobject_psameas_object|327|0|524|0|{out_metadata|out_metadata|0|0|}195|67|}
{2010601001|XXGgraph_vertex_vertex|328|0|525|0|{Not_Expected_Response|}175|198|}
{2010212001|XXGvertex_oport_oport|329|0|527|0|{0|out0|}198|199|}
{2010213001|XXGoport_dst_flow|330|0|529|0|{0|}199|179|}
{2010212001|XXGvertex_oport_oport|331|0|530|0|{1|reject0|}198|200|}
{2010212001|XXGvertex_oport_oport|332|0|532|0|{2|error0|}198|201|}
{2010212001|XXGvertex_oport_oport|333|0|534|0|{3|log|}198|202|}
{2010211001|XXGvertex_iport_iport|334|0|536|0|{0|in|}198|203|}
{2010214001|XXGiport_src_flow|335|0|538|0|{0|}203|137|}
{2010006001|XXGobject_psameas_object|336|0|539|0|{Layout|Layout|0|0|}198|37|}
{2010006001|XXGobject_psameas_object|337|0|540|0|{in_metadata|out0_metadata|0|0|}198|142|}
{2010006001|XXGobject_psameas_object|338|0|541|0|{out0_metadata|out_metadata|0|0|}198|67|}
{2010006001|XXGobject_psameas_object|339|0|542|0|{reject0_metadata|out0_metadata|0|0|}198|142|}
{2010601001|XXGgraph_vertex_vertex|340|0|543|0|{Not_a_SOAP_Fault|}175|204|}
{2010212001|XXGvertex_oport_oport|341|0|545|0|{0|out0|}204|205|}
{2010213001|XXGoport_dst_flow|342|0|547|0|{0|}205|178|}
{2010212001|XXGvertex_oport_oport|343|0|548|0|{1|reject0|}204|206|}
{2010212001|XXGvertex_oport_oport|344|0|550|0|{2|error0|}204|207|}
{2010212001|XXGvertex_oport_oport|345|0|552|0|{3|log|}204|208|}
{2010211001|XXGvertex_iport_iport|346|0|554|0|{0|in|}204|209|}
{2010214001|XXGiport_src_flow|347|0|556|0|{0|}209|71|}
{2010006001|XXGobject_psameas_object|348|0|557|0|{Layout|Layout|0|0|}204|37|}
{2010006001|XXGobject_psameas_object|349|0|558|0|{in_metadata|in_metadata|0|0|}204|67|}
{2010006001|XXGobject_psameas_object|350|0|559|0|{out0_metadata|out_metadata|0|0|}204|67|}
{2010006001|XXGobject_psameas_object|351|0|560|0|{reject0_metadata|in_metadata|0|0|}204|67|}
{2010601001|XXGgraph_vertex_vertex|352|0|561|0|{Put_data_back_to_full_utf8|}175|210|}
{2010212001|XXGvertex_oport_oport|353|0|563|0|{0|out0|}210|211|}
{2010213001|XXGoport_dst_flow|354|0|565|0|{0|}211|95|}
{2010212001|XXGvertex_oport_oport|355|0|566|0|{1|reject0|}210|212|}
{2010212001|XXGvertex_oport_oport|356|0|568|0|{2|error0|}210|213|}
{2010212001|XXGvertex_oport_oport|357|0|570|0|{3|log|}210|214|}
{2010211001|XXGvertex_iport_iport|358|0|572|0|{0|in|}210|215|}
{2010214001|XXGiport_src_flow|359|0|574|0|{0|}215|65|}
{2010006001|XXGobject_psameas_object|360|0|575|0|{Layout|Layout|0|0|}210|37|}
{2010006001|XXGobject_psameas_object|361|0|576|0|{in_metadata|log_metadata|0|0|}210|57|}
{2010006001|XXGobject_psameas_object|362|0|577|0|{out0_metadata|out_metadata|0|0|}210|92|}
{2010006001|XXGobject_psameas_object|363|0|578|0|{reject0_metadata|log_metadata|0|0|}210|57|}
{2010601001|XXGgraph_vertex_vertex|364|0|579|0|{Read_Fault_XML_Transform|}175|67|}
{2010601001|XXGgraph_vertex_vertex|365|0|580|0|{Read_Response_XML_Transform|}175|134|}
{2010601001|XXGgraph_vertex_vertex|366|0|581|0|{Replicate|}175|92|}
{2010212001|XXGvertex_oport_oport|367|0|582|0|{0|fault|}175|216|}
{2010216002|XXGoport_binding_oport|368|0|584|0|{.8122270703315735|.5|{12|950000|414000|970000|414000|970000|526000|269000|526000|269000|639000|269000|659000|}93|}216|196|}
{2010213001|XXGoport_dst_flow|369|0|585|0|{0|}216|35|}
{2010212001|XXGvertex_oport_oport|370|0|586|0|{1|out0|}175|217|}
{2010216002|XXGoport_binding_oport|371|0|588|0|{.5|.5|{12|860000|114000|880000|114000|935000|114000|935000|339000|990000|339000|1010000|339000|}94|}217|135|}
{2010213001|XXGoport_dst_flow|372|0|589|0|{0|}217|161|}
{2010212001|XXGvertex_oport_oport|373|0|590|0|{2|log|}175|218|}
{2010216002|XXGoport_binding_oport|374|0|592|0|{.5|.5|{8|684000|577000|684000|597000|684000|639000|684000|659000|}95|}218|93|}
{2010211001|XXGvertex_iport_iport|375|0|593|0|{0|in0|}175|219|}
{2010215002|XXGiport_binding_iport|376|0|595|0|{.5|.5|{12|116000|229000|96000|229000|68000|229000|68000|339000|39000|339000|19000|339000|}92|}219|66|}
{2010214001|XXGiport_src_flow|377|0|596|0|{0|}219|52|}
{2010601001|XXGgraph_vertex_vertex|378|0|597|0|{Separate_query_from_queryMore_results|}155|220|}
{2010212001|XXGvertex_oport_oport|379|0|599|0|{0|out|}220|221|}
{2010213001|XXGoport_dst_flow|380|0|601|0|{0|}221|162|}
{2010212001|XXGvertex_oport_oport|381|0|602|0|{1|deselect|}220|222|}
{2010213001|XXGoport_dst_flow|382|0|604|0|{0|}222|133|}
{2010212001|XXGvertex_oport_oport|383|0|605|0|{2|reject|}220|223|}
{2010212001|XXGvertex_oport_oport|384|0|607|0|{3|error|}220|224|}
{2010212001|XXGvertex_oport_oport|385|0|609|0|{4|log|}220|225|}
{2010211001|XXGvertex_iport_iport|386|0|611|0|{0|in|}220|226|}
{2010214001|XXGiport_src_flow|387|0|613|0|{0|}226|161|}
{2010006001|XXGobject_psameas_object|388|0|614|0|{Layout|Layout|0|0|}220|37|}
{2010006001|XXGobject_psameas_object|389|0|615|0|{deselect_metadata|out_metadata|0|0|}220|134|}
{2010006001|XXGobject_psameas_object|390|0|616|0|{in_metadata|out_metadata|0|0|}220|134|}
{2010006001|XXGobject_psameas_object|391|0|617|0|{out_metadata|out_metadata|0|0|}220|134|}
{2010006001|XXGobject_psameas_object|392|0|618|0|{reject_metadata|out_metadata|0|0|}220|134|}
{2010601001|XXGgraph_vertex_vertex|393|0|619|0|{Sleep_when_continuous|}155|227|}
{2010212001|XXGvertex_oport_oport|394|0|621|0|{0|out0|}227|228|}
{2010213001|XXGoport_dst_flow|395|0|623|0|{0|}228|44|}
{2010212001|XXGvertex_oport_oport|396|0|624|0|{1|reject0|}227|229|}
{2010212001|XXGvertex_oport_oport|397|0|626|0|{2|error0|}227|230|}
{2010212001|XXGvertex_oport_oport|398|0|628|0|{3|log|}227|231|}
{2010211001|XXGvertex_iport_iport|399|0|630|0|{0|in|}227|232|}
{2010214001|XXGiport_src_flow|400|0|632|0|{0|}232|47|}
{2010006001|XXGobject_psameas_object|401|0|633|0|{Layout|Layout|0|0|}227|37|}
{2010006001|XXGobject_psameas_object|402|0|634|0|{in_metadata|out_metadata|0|0|}227|45|}
{2010006001|XXGobject_psameas_object|403|0|635|0|{out0_metadata|out_metadata|0|0|}227|45|}
{2010006001|XXGobject_psameas_object|404|0|636|0|{reject0_metadata|out_metadata|0|0|}227|45|}
{2010601001|XXGgraph_vertex_vertex|405|0|637|0|{Write_XML_Transform|}155|50|}
{2010212001|XXGvertex_oport_oport|406|0|638|0|{0|out|}155|233|}
{2010216002|XXGoport_binding_oport|407|0|640|0|{.5|.5|{12|1616000|474000|1636000|474000|1658000|474000|1658000|454000|1680000|454000|1700000|454000|}175|}233|119|}
{2010213001|XXGoport_dst_flow|408|0|641|0|{0|}233|13|}
{2010212001|XXGvertex_oport_oport|409|0|642|0|{1|error|}155|234|}
{2010216002|XXGoport_binding_oport|410|0|644|0|{.5|.5|{10|388000|739000|408000|739000|439000|739000|439000|870000|439000|890000|}176|}234|30|}
{2010213001|XXGoport_dst_flow|411|0|645|0|{0|}234|9|}
{2010212001|XXGvertex_oport_oport|412|0|646|0|{2|log|}155|235|}
{2010216002|XXGoport_binding_oport|413|0|648|0|{.5|.5|{12|569000|226000|569000|246000|569000|558000|1279000|558000|1279000|870000|1279000|890000|}177|}235|218|}
{2010213001|XXGoport_dst_flow|414|0|649|0|{0|}235|14|}
{2010007001|XXGobject_proto_object|415|0|650|0|{}155|236|}
{2010605001|XXGgraph_legend_legend|416|0|652|0|{0|}236|237|}
{2010241001|XXGlegend_face_face|417|0|654|0|{}237|238|}
{2010605001|XXGgraph_legend_legend|418|0|656|0|{1|}236|239|}
{2010241001|XXGlegend_face_face|419|0|658|0|{}239|240|}
{2010604001|XXGgraph_flow_flow|420|0|660|0|{Flow_1|}236|241|}
{2010604001|XXGgraph_flow_flow|421|0|662|0|{Flow_10|}236|242|}
{2010604001|XXGgraph_flow_flow|422|0|664|0|{Flow_11|}236|243|}
{2010604001|XXGgraph_flow_flow|423|0|666|0|{Flow_12|}236|244|}
{2010604001|XXGgraph_flow_flow|424|0|668|0|{Flow_14|}236|245|}
{2010604001|XXGgraph_flow_flow|425|0|670|0|{Flow_2|}236|246|}
{2010604001|XXGgraph_flow_flow|426|0|672|0|{Flow_3|}236|247|}
{2010604001|XXGgraph_flow_flow|427|0|674|0|{Flow_4|}236|248|}
{2010604001|XXGgraph_flow_flow|428|0|676|0|{Flow_5|}236|249|}
{2010604001|XXGgraph_flow_flow|429|0|678|0|{Flow_6|}236|250|}
{2010604001|XXGgraph_flow_flow|430|0|680|0|{Flow_7|}236|251|}
{2010604001|XXGgraph_flow_flow|431|0|682|0|{Flow_8|}236|252|}
{2010604001|XXGgraph_flow_flow|432|0|684|0|{Flow_9|}236|253|}
{2010601001|XXGgraph_vertex_vertex|433|0|686|0|{Create_Data|}236|254|}
{2010212001|XXGvertex_oport_oport|434|0|688|0|{0|out|}254|255|}
{2010213001|XXGoport_dst_flow|435|0|690|0|{0|}255|245|}
{2010212001|XXGvertex_oport_oport|436|0|691|0|{1|error|}254|256|}
{2010212001|XXGvertex_oport_oport|437|0|693|0|{2|log|}254|257|}
{2010007001|XXGobject_proto_object|438|0|695|0|{}254|258|}
{2010212001|XXGvertex_oport_oport|439|0|697|0|{0|out|}258|259|}
{2010006001|XXGobject_psameas_object|440|0|699|0|{metadata|out_metadata|1|0|}259|258|}
{2010212001|XXGvertex_oport_oport|441|0|700|0|{1|error|}258|260|}
{2010006001|XXGobject_psameas_object|442|0|702|0|{metadata|error_metadata|1|0|}260|258|}
{2010212001|XXGvertex_oport_oport|443|0|703|0|{2|log|}258|261|}
{2010006001|XXGobject_psameas_object|444|0|705|0|{metadata|log_metadata|1|0|}261|258|}
{2010006001|XXGobject_psameas_object|445|0|706|0|{continuous|is_continuous|1|0|}254|236|}
{2010601001|XXGgraph_vertex_vertex|446|0|707|0|{Normalize_to_get_1_object_per_record|}236|262|}
{2010212001|XXGvertex_oport_oport|447|0|709|0|{0|out|}262|263|}
{2010212001|XXGvertex_oport_oport|448|0|711|0|{1|reject|}262|264|}
{2010212001|XXGvertex_oport_oport|449|0|713|0|{2|error|}262|265|}
{2010212001|XXGvertex_oport_oport|450|0|715|0|{3|log|}262|266|}
{2010211001|XXGvertex_iport_iport|451|0|717|0|{0|in|}262|267|}
{2010214001|XXGiport_src_flow|452|0|719|0|{0|}267|249|}
{2010214001|XXGiport_src_flow|453|0|720|0|{1|}267|252|}
{2010007001|XXGobject_proto_object|454|0|721|0|{}262|268|}
{2010212001|XXGvertex_oport_oport|455|0|723|0|{0|out|}268|269|}
{2010006001|XXGobject_psameas_object|456|0|725|0|{metadata|out_metadata|1|0|}269|268|}
{2010212001|XXGvertex_oport_oport|457|0|726|0|{1|reject|}268|270|}
{2010006001|XXGobject_psameas_object|458|0|728|0|{metadata|reject_metadata|1|0|}270|268|}
{2010212001|XXGvertex_oport_oport|459|0|729|0|{2|error|}268|271|}
{2010006001|XXGobject_psameas_object|460|0|731|0|{metadata|error_metadata|1|0|}271|268|}
{2010212001|XXGvertex_oport_oport|461|0|732|0|{3|log|}268|272|}
{2010006001|XXGobject_psameas_object|462|0|734|0|{metadata|log_metadata|1|0|}272|268|}
{2010211001|XXGvertex_iport_iport|463|0|735|0|{0|in|}268|273|}
{2010006001|XXGobject_psameas_object|464|0|737|0|{metadata|in_metadata|1|0|}273|268|}
{2010006001|XXGobject_psameas_object|465|0|738|0|{out_metadata|out_record_format|1|0|}262|236|}
{2010601001|XXGgraph_vertex_vertex|466|0|739|0|{Not_Expected_Response|}236|274|}
{2010212001|XXGvertex_oport_oport|467|0|741|0|{0|out0|}274|275|}
{2010213001|XXGoport_dst_flow|468|0|743|0|{0|}275|248|}
{2010212001|XXGvertex_oport_oport|469|0|744|0|{1|reject0|}274|276|}
{2010212001|XXGvertex_oport_oport|470|0|746|0|{2|error0|}274|277|}
{2010212001|XXGvertex_oport_oport|471|0|748|0|{3|log|}274|278|}
{2010211001|XXGvertex_iport_iport|472|0|750|0|{0|in|}274|279|}
{2010214001|XXGiport_src_flow|473|0|752|0|{0|}279|243|}
{2010214001|XXGiport_src_flow|474|0|753|0|{1|}279|242|}
{2010007001|XXGobject_proto_object|475|0|754|0|{}274|280|}
{2010212001|XXGvertex_oport_oport|476|0|756|0|{0|out0|}280|281|}
{2010006001|XXGobject_psameas_object|477|0|758|0|{metadata|out0_metadata|1|0|}281|280|}
{2010006001|XXGobject_psameas_object|478|0|759|0|{transform0|transform0|1|0|}281|280|}
{2010212001|XXGvertex_oport_oport|479|0|760|0|{1|reject0|}280|282|}
{2010006001|XXGobject_psameas_object|480|0|762|0|{metadata|reject0_metadata|1|0|}282|280|}
{2010212001|XXGvertex_oport_oport|481|0|763|0|{2|error0|}280|283|}
{2010006001|XXGobject_psameas_object|482|0|765|0|{metadata|error0_metadata|1|0|}283|280|}
{2010212001|XXGvertex_oport_oport|483|0|766|0|{3|log|}280|284|}
{2010006001|XXGobject_psameas_object|484|0|768|0|{metadata|log_metadata|1|0|}284|280|}
{2010211001|XXGvertex_iport_iport|485|0|769|0|{0|in|}280|285|}
{2010006001|XXGobject_psameas_object|486|0|771|0|{metadata|in_metadata|1|0|}285|280|}
{2010601001|XXGgraph_vertex_vertex|487|0|772|0|{R_to_insert_request_parameters|}236|286|}
{2010212001|XXGvertex_oport_oport|488|0|774|0|{0|out0|}286|287|}
{2010213001|XXGoport_dst_flow|489|0|776|0|{0|}287|250|}
{2010212001|XXGvertex_oport_oport|490|0|777|0|{1|reject0|}286|288|}
{2010212001|XXGvertex_oport_oport|491|0|779|0|{2|error0|}286|289|}
{2010212001|XXGvertex_oport_oport|492|0|781|0|{3|log|}286|290|}
{2010211001|XXGvertex_iport_iport|493|0|783|0|{0|in|}286|291|}
{2010214001|XXGiport_src_flow|494|0|785|0|{0|}291|246|}
{2010007001|XXGobject_proto_object|495|0|786|0|{}286|292|}
{2010212001|XXGvertex_oport_oport|496|0|788|0|{0|out0|}292|293|}
{2010006001|XXGobject_psameas_object|497|0|790|0|{metadata|out0_metadata|1|0|}293|292|}
{2010006001|XXGobject_psameas_object|498|0|791|0|{transform0|transform0|1|0|}293|292|}
{2010212001|XXGvertex_oport_oport|499|0|792|0|{1|reject0|}292|294|}
{2010006001|XXGobject_psameas_object|500|0|794|0|{metadata|reject0_metadata|1|0|}294|292|}
{2010212001|XXGvertex_oport_oport|501|0|795|0|{2|error0|}292|295|}
{2010006001|XXGobject_psameas_object|502|0|797|0|{metadata|error0_metadata|1|0|}295|292|}
{2010212001|XXGvertex_oport_oport|503|0|798|0|{3|log|}292|296|}
{2010006001|XXGobject_psameas_object|504|0|800|0|{metadata|log_metadata|1|0|}296|292|}
{2010211001|XXGvertex_iport_iport|505|0|801|0|{0|in|}292|297|}
{2010006001|XXGobject_psameas_object|506|0|803|0|{metadata|in_metadata|1|0|}297|292|}
{2010601001|XXGgraph_vertex_vertex|507|0|804|0|{Read_queryMore_results|}236|298|}
{2010212001|XXGvertex_oport_oport|508|0|806|0|{0|out|}298|299|}
{2010213001|XXGoport_dst_flow|509|0|808|0|{0|}299|252|}
{2010212001|XXGvertex_oport_oport|510|0|809|0|{1|reject|}298|300|}
{2010213001|XXGoport_dst_flow|511|0|811|0|{0|}300|242|}
{2010212001|XXGvertex_oport_oport|512|0|812|0|{2|error|}298|301|}
{2010212001|XXGvertex_oport_oport|513|0|814|0|{3|log|}298|302|}
{2010211001|XXGvertex_iport_iport|514|0|816|0|{0|in|}298|303|}
{2010214001|XXGiport_src_flow|515|0|818|0|{0|}303|251|}
{2010007001|XXGobject_proto_object|516|0|819|0|{}298|304|}
{2010212001|XXGvertex_oport_oport|517|0|821|0|{0|out|}304|305|}
{2010006001|XXGobject_psameas_object|518|0|823|0|{metadata|out_metadata|1|0|}305|304|}
{2010212001|XXGvertex_oport_oport|519|0|824|0|{1|reject|}304|306|}
{2010006001|XXGobject_psameas_object|520|0|826|0|{metadata|reject_metadata|1|0|}306|304|}
{2010212001|XXGvertex_oport_oport|521|0|827|0|{2|error|}304|307|}
{2010006001|XXGobject_psameas_object|522|0|829|0|{metadata|error_metadata|1|0|}307|304|}
{2010212001|XXGvertex_oport_oport|523|0|830|0|{3|log|}304|308|}
{2010006001|XXGobject_psameas_object|524|0|832|0|{metadata|log_metadata|1|0|}308|304|}
{2010211001|XXGvertex_iport_iport|525|0|833|0|{0|in|}304|309|}
{2010006001|XXGobject_psameas_object|526|0|835|0|{metadata|in_metadata|1|0|}309|304|}
{2010006001|XXGobject_psameas_object|527|0|836|0|{out_metadata|read_xml_record_format|1|0|}298|236|}
{2010006001|XXGobject_psameas_object|528|0|837|0|{package|read_xml_transform|1|0|}298|236|}
{2010601001|XXGgraph_vertex_vertex|529|0|838|0|{Read_query_results|}236|310|}
{2010212001|XXGvertex_oport_oport|530|0|840|0|{0|out|}310|311|}
{2010213001|XXGoport_dst_flow|531|0|842|0|{0|}311|249|}
{2010212001|XXGvertex_oport_oport|532|0|843|0|{1|reject|}310|312|}
{2010213001|XXGoport_dst_flow|533|0|845|0|{0|}312|243|}
{2010212001|XXGvertex_oport_oport|534|0|846|0|{2|error|}310|313|}
{2010212001|XXGvertex_oport_oport|535|0|848|0|{3|log|}310|314|}
{2010211001|XXGvertex_iport_iport|536|0|850|0|{0|in|}310|315|}
{2010214001|XXGiport_src_flow|537|0|852|0|{0|}315|253|}
{2010007001|XXGobject_proto_object|538|0|853|0|{}310|316|}
{2010212001|XXGvertex_oport_oport|539|0|855|0|{0|out|}316|317|}
{2010006001|XXGobject_psameas_object|540|0|857|0|{metadata|out_metadata|1|0|}317|316|}
{2010212001|XXGvertex_oport_oport|541|0|858|0|{1|reject|}316|318|}
{2010006001|XXGobject_psameas_object|542|0|860|0|{metadata|reject_metadata|1|0|}318|316|}
{2010212001|XXGvertex_oport_oport|543|0|861|0|{2|error|}316|319|}
{2010006001|XXGobject_psameas_object|544|0|863|0|{metadata|error_metadata|1|0|}319|316|}
{2010212001|XXGvertex_oport_oport|545|0|864|0|{3|log|}316|320|}
{2010006001|XXGobject_psameas_object|546|0|866|0|{metadata|log_metadata|1|0|}320|316|}
{2010211001|XXGvertex_iport_iport|547|0|867|0|{0|in|}316|321|}
{2010006001|XXGobject_psameas_object|548|0|869|0|{metadata|in_metadata|1|0|}321|316|}
{2010006001|XXGobject_psameas_object|549|0|870|0|{out_metadata|read_xml_record_format|1|0|}310|236|}
{2010006001|XXGobject_psameas_object|550|0|871|0|{package|read_xml_transform|1|0|}310|236|}
{2010601001|XXGgraph_vertex_vertex|551|0|872|0|{Reformat|}236|322|}
{2010212001|XXGvertex_oport_oport|552|0|874|0|{0|out0|}322|323|}
{2010212001|XXGvertex_oport_oport|553|0|876|0|{1|reject0|}322|324|}
{2010212001|XXGvertex_oport_oport|554|0|878|0|{2|error0|}322|325|}
{2010212001|XXGvertex_oport_oport|555|0|880|0|{3|log|}322|326|}
{2010211001|XXGvertex_iport_iport|556|0|882|0|{0|in|}322|327|}
{2010214001|XXGiport_src_flow|557|0|884|0|{0|}327|244|}
{2010214001|XXGiport_src_flow|558|0|885|0|{1|}327|248|}
{2010007001|XXGobject_proto_object|559|0|886|0|{}322|328|}
{2010212001|XXGvertex_oport_oport|560|0|888|0|{0|out0|}328|329|}
{2010006001|XXGobject_psameas_object|561|0|890|0|{metadata|out0_metadata|1|0|}329|328|}
{2010006001|XXGobject_psameas_object|562|0|891|0|{transform0|transform0|1|0|}329|328|}
{2010212001|XXGvertex_oport_oport|563|0|892|0|{1|reject0|}328|330|}
{2010006001|XXGobject_psameas_object|564|0|894|0|{metadata|reject0_metadata|1|0|}330|328|}
{2010212001|XXGvertex_oport_oport|565|0|895|0|{2|error0|}328|331|}
{2010006001|XXGobject_psameas_object|566|0|897|0|{metadata|error0_metadata|1|0|}331|328|}
{2010212001|XXGvertex_oport_oport|567|0|898|0|{3|log|}328|332|}
{2010006001|XXGobject_psameas_object|568|0|900|0|{metadata|log_metadata|1|0|}332|328|}
{2010211001|XXGvertex_iport_iport|569|0|901|0|{0|in|}328|333|}
{2010006001|XXGobject_psameas_object|570|0|903|0|{metadata|in_metadata|1|0|}333|328|}
{2010601001|XXGgraph_vertex_vertex|571|0|904|0|{Salesforce_CWS_and_Fault_Handling|}236|334|}
{2010604001|XXGgraph_flow_flow|572|0|906|0|{Flow_1|}334|335|}
{2010604001|XXGgraph_flow_flow|573|0|908|0|{Flow_10|}334|336|}
{2010604001|XXGgraph_flow_flow|574|0|910|0|{Flow_11|}334|337|}
{2010604001|XXGgraph_flow_flow|575|0|912|0|{Flow_12|}334|338|}
{2010604001|XXGgraph_flow_flow|576|0|914|0|{Flow_13|}334|339|}
{2010604001|XXGgraph_flow_flow|577|0|916|0|{Flow_15|}334|340|}
{2010604001|XXGgraph_flow_flow|578|0|918|0|{Flow_16|}334|341|}
{2010604001|XXGgraph_flow_flow|579|0|920|0|{Flow_2|}334|342|}
{2010604001|XXGgraph_flow_flow|580|0|922|0|{Flow_3|}334|343|}
{2010604001|XXGgraph_flow_flow|581|0|924|0|{Flow_4|}334|344|}
{2010604001|XXGgraph_flow_flow|582|0|926|0|{Flow_5|}334|345|}
{2010604001|XXGgraph_flow_flow|583|0|928|0|{Flow_6|}334|346|}
{2010604001|XXGgraph_flow_flow|584|0|930|0|{Flow_7|}334|347|}
{2010604001|XXGgraph_flow_flow|585|0|932|0|{Flow_8|}334|348|}
{2010604001|XXGgraph_flow_flow|586|0|934|0|{Flow_9|}334|349|}
{2010601001|XXGgraph_vertex_vertex|587|0|936|0|{Call_Web_Service|}334|350|}
{2010212001|XXGvertex_oport_oport|588|0|938|0|{0|out|}350|351|}
{2010213001|XXGoport_dst_flow|589|0|940|0|{0|}351|335|}
{2010212001|XXGvertex_oport_oport|590|0|941|0|{1|reject|}350|352|}
{2010213001|XXGoport_dst_flow|591|0|943|0|{0|}352|349|}
{2010212001|XXGvertex_oport_oport|592|0|944|0|{2|error|}350|353|}
{2010213001|XXGoport_dst_flow|593|0|946|0|{0|}353|337|}
{2010212001|XXGvertex_oport_oport|594|0|947|0|{3|log|}350|354|}
{2010213001|XXGoport_dst_flow|595|0|949|0|{0|}354|338|}
{2010211001|XXGvertex_iport_iport|596|0|950|0|{0|in|}350|355|}
{2010601001|XXGgraph_vertex_vertex|597|0|952|0|{Dispatch_by_HTTP_Response_Code|}334|356|}
{2010212001|XXGvertex_oport_oport|598|0|954|0|{0|_2xx|}356|357|}
{2010213001|XXGoport_dst_flow|599|0|956|0|{0|}357|344|}
{2010212001|XXGvertex_oport_oport|600|0|957|0|{1|Other|}356|358|}
{2010213001|XXGoport_dst_flow|601|0|959|0|{0|}358|342|}
{2010212001|XXGvertex_oport_oport|602|0|960|0|{2|_5xx|}356|359|}
{2010213001|XXGoport_dst_flow|603|0|962|0|{0|}359|345|}
{2010212001|XXGvertex_oport_oport|604|0|963|0|{3|reject0|}356|360|}
{2010212001|XXGvertex_oport_oport|605|0|965|0|{4|reject1|}356|361|}
{2010212001|XXGvertex_oport_oport|606|0|967|0|{5|reject2|}356|362|}
{2010212001|XXGvertex_oport_oport|607|0|969|0|{6|error0|}356|363|}
{2010212001|XXGvertex_oport_oport|608|0|971|0|{7|error1|}356|364|}
{2010212001|XXGvertex_oport_oport|609|0|973|0|{8|error2|}356|365|}
{2010212001|XXGvertex_oport_oport|610|0|975|0|{9|log|}356|366|}
{2010211001|XXGvertex_iport_iport|611|0|977|0|{0|in|}356|367|}
{2010214001|XXGiport_src_flow|612|0|979|0|{0|}367|335|}
{2010601001|XXGgraph_vertex_vertex|613|0|980|0|{Error_as_Fault|}334|368|}
{2010212001|XXGvertex_oport_oport|614|0|982|0|{0|out0|}368|369|}
{2010213001|XXGoport_dst_flow|615|0|984|0|{0|}369|340|}
{2010212001|XXGvertex_oport_oport|616|0|985|0|{1|reject0|}368|370|}
{2010212001|XXGvertex_oport_oport|617|0|987|0|{2|error0|}368|371|}
{2010212001|XXGvertex_oport_oport|618|0|989|0|{3|log|}368|372|}
{2010211001|XXGvertex_iport_iport|619|0|991|0|{0|in|}368|373|}
{2010214001|XXGiport_src_flow|620|0|993|0|{0|}373|341|}
{2010601001|XXGgraph_vertex_vertex|621|0|994|0|{Fuse|}334|374|}
{2010212001|XXGvertex_oport_oport|622|0|996|0|{0|out|}374|375|}
{2010213001|XXGoport_dst_flow|623|0|998|0|{0|}375|341|}
{2010212001|XXGvertex_oport_oport|624|0|999|0|{1|reject0|}374|376|}
{2010212001|XXGvertex_oport_oport|625|0|1001|0|{2|reject1|}374|377|}
{2010212001|XXGvertex_oport_oport|626|0|1003|0|{3|error0|}374|378|}
{2010212001|XXGvertex_oport_oport|627|0|1005|0|{4|error1|}374|379|}
{2010212001|XXGvertex_oport_oport|628|0|1007|0|{5|log|}374|380|}
{2010211001|XXGvertex_iport_iport|629|0|1009|0|{0|in0|}374|381|}
{2010214001|XXGiport_src_flow|630|0|1011|0|{0|}381|349|}
{2010211001|XXGvertex_iport_iport|631|0|1012|0|{1|in1|}374|382|}
{2010214001|XXGiport_src_flow|632|0|1014|0|{0|}382|337|}
{2010601001|XXGgraph_vertex_vertex|633|0|1015|0|{Gather|}334|383|}
{2010212001|XXGvertex_oport_oport|634|0|1017|0|{0|out|}383|384|}
{2010211001|XXGvertex_iport_iport|635|0|1019|0|{0|in|}383|385|}
{2010214001|XXGiport_src_flow|636|0|1021|0|{0|}385|347|}
{2010214001|XXGiport_src_flow|637|0|1022|0|{1|}385|342|}
{2010214001|XXGiport_src_flow|638|0|1023|0|{2|}385|336|}
{2010214001|XXGiport_src_flow|639|0|1024|0|{3|}385|346|}
{2010214001|XXGiport_src_flow|640|0|1025|0|{4|}385|340|}
{2010601001|XXGgraph_vertex_vertex|641|0|1026|0|{Not_Expected_Response|}334|386|}
{2010212001|XXGvertex_oport_oport|642|0|1028|0|{0|out0|}386|387|}
{2010213001|XXGoport_dst_flow|643|0|1030|0|{0|}387|347|}
{2010212001|XXGvertex_oport_oport|644|0|1031|0|{1|reject0|}386|388|}
{2010212001|XXGvertex_oport_oport|645|0|1033|0|{2|error0|}386|389|}
{2010212001|XXGvertex_oport_oport|646|0|1035|0|{3|log|}386|390|}
{2010211001|XXGvertex_iport_iport|647|0|1037|0|{0|in|}386|391|}
{2010214001|XXGiport_src_flow|648|0|1039|0|{0|}391|343|}
{2010601001|XXGgraph_vertex_vertex|649|0|1040|0|{Not_a_SOAP_Fault|}334|392|}
{2010212001|XXGvertex_oport_oport|650|0|1042|0|{0|out0|}392|393|}
{2010213001|XXGoport_dst_flow|651|0|1044|0|{0|}393|346|}
{2010212001|XXGvertex_oport_oport|652|0|1045|0|{1|reject0|}392|394|}
{2010212001|XXGvertex_oport_oport|653|0|1047|0|{2|error0|}392|395|}
{2010212001|XXGvertex_oport_oport|654|0|1049|0|{3|log|}392|396|}
{2010211001|XXGvertex_iport_iport|655|0|1051|0|{0|in|}392|397|}
{2010214001|XXGiport_src_flow|656|0|1053|0|{0|}397|348|}
{2010601001|XXGgraph_vertex_vertex|657|0|1054|0|{Put_data_back_to_full_utf8|}334|398|}
{2010212001|XXGvertex_oport_oport|658|0|1056|0|{0|out0|}398|399|}
{2010213001|XXGoport_dst_flow|659|0|1058|0|{0|}399|339|}
{2010212001|XXGvertex_oport_oport|660|0|1059|0|{1|reject0|}398|400|}
{2010212001|XXGvertex_oport_oport|661|0|1061|0|{2|error0|}398|401|}
{2010212001|XXGvertex_oport_oport|662|0|1063|0|{3|log|}398|402|}
{2010211001|XXGvertex_iport_iport|663|0|1065|0|{0|in|}398|403|}
{2010214001|XXGiport_src_flow|664|0|1067|0|{0|}403|338|}
{2010601001|XXGgraph_vertex_vertex|665|0|1068|0|{Read_Fault_XML_Transform|}334|404|}
{2010212001|XXGvertex_oport_oport|666|0|1070|0|{0|out|}404|405|}
{2010213001|XXGoport_dst_flow|667|0|1072|0|{0|}405|336|}
{2010212001|XXGvertex_oport_oport|668|0|1073|0|{1|reject|}404|406|}
{2010213001|XXGoport_dst_flow|669|0|1075|0|{0|}406|348|}
{2010212001|XXGvertex_oport_oport|670|0|1076|0|{2|error|}404|407|}
{2010212001|XXGvertex_oport_oport|671|0|1078|0|{3|log|}404|408|}
{2010211001|XXGvertex_iport_iport|672|0|1080|0|{0|in|}404|409|}
{2010214001|XXGiport_src_flow|673|0|1082|0|{0|}409|345|}
{2010601001|XXGgraph_vertex_vertex|674|0|1083|0|{Read_Response_XML_Transform|}334|410|}
{2010212001|XXGvertex_oport_oport|675|0|1085|0|{0|out|}410|411|}
{2010212001|XXGvertex_oport_oport|676|0|1087|0|{1|reject|}410|412|}
{2010213001|XXGoport_dst_flow|677|0|1089|0|{0|}412|343|}
{2010212001|XXGvertex_oport_oport|678|0|1090|0|{2|error|}410|413|}
{2010212001|XXGvertex_oport_oport|679|0|1092|0|{3|log|}410|414|}
{2010211001|XXGvertex_iport_iport|680|0|1094|0|{0|in|}410|415|}
{2010214001|XXGiport_src_flow|681|0|1096|0|{0|}415|344|}
{2010601001|XXGgraph_vertex_vertex|682|0|1097|0|{Replicate|}334|416|}
{2010212001|XXGvertex_oport_oport|683|0|1099|0|{0|out|}416|417|}
{2010211001|XXGvertex_iport_iport|684|0|1101|0|{0|in|}416|418|}
{2010214001|XXGiport_src_flow|685|0|1103|0|{0|}418|339|}
{2010212001|XXGvertex_oport_oport|686|0|1104|0|{0|fault|}334|419|}
{2010216002|XXGoport_binding_oport|687|0|1106|0|{.8122270703315735|.5|{12|950000|414000|970000|414000|970000|526000|269000|526000|269000|639000|269000|659000|}0|}419|384|}
{2010213001|XXGoport_dst_flow|688|0|1107|0|{0|}419|244|}
{2010212001|XXGvertex_oport_oport|689|0|1108|0|{1|out0|}334|420|}
{2010216002|XXGoport_binding_oport|690|0|1110|0|{.5|.5|{12|860000|114000|880000|114000|935000|114000|935000|339000|990000|339000|1010000|339000|}0|}420|411|}
{2010213001|XXGoport_dst_flow|691|0|1111|0|{0|}420|247|}
{2010212001|XXGvertex_oport_oport|692|0|1112|0|{2|log|}334|421|}
{2010216002|XXGoport_binding_oport|693|0|1114|0|{.5|.5|{8|684000|577000|684000|597000|684000|639000|684000|659000|}0|}421|417|}
{2010211001|XXGvertex_iport_iport|694|0|1115|0|{0|in0|}334|422|}
{2010215002|XXGiport_binding_iport|695|0|1117|0|{.5|.5|{12|116000|229000|96000|229000|68000|229000|68000|339000|39000|339000|19000|339000|}0|}422|355|}
{2010214001|XXGiport_src_flow|696|0|1118|0|{0|}422|241|}
{2010007001|XXGobject_proto_object|697|0|1119|0|{}334|423|}
{2010604001|XXGgraph_flow_flow|698|0|1121|0|{Flow_1|}423|424|}
{2010604001|XXGgraph_flow_flow|699|0|1123|0|{Flow_10|}423|425|}
{2010604001|XXGgraph_flow_flow|700|0|1125|0|{Flow_11|}423|426|}
{2010604001|XXGgraph_flow_flow|701|0|1127|0|{Flow_12|}423|427|}
{2010604001|XXGgraph_flow_flow|702|0|1129|0|{Flow_13|}423|428|}
{2010604001|XXGgraph_flow_flow|703|0|1131|0|{Flow_15|}423|429|}
{2010604001|XXGgraph_flow_flow|704|0|1133|0|{Flow_16|}423|430|}
{2010604001|XXGgraph_flow_flow|705|0|1135|0|{Flow_2|}423|431|}
{2010604001|XXGgraph_flow_flow|706|0|1137|0|{Flow_3|}423|432|}
{2010604001|XXGgraph_flow_flow|707|0|1139|0|{Flow_4|}423|433|}
{2010604001|XXGgraph_flow_flow|708|0|1141|0|{Flow_5|}423|434|}
{2010604001|XXGgraph_flow_flow|709|0|1143|0|{Flow_6|}423|435|}
{2010604001|XXGgraph_flow_flow|710|0|1145|0|{Flow_7|}423|436|}
{2010604001|XXGgraph_flow_flow|711|0|1147|0|{Flow_8|}423|437|}
{2010604001|XXGgraph_flow_flow|712|0|1149|0|{Flow_9|}423|438|}
{2010601001|XXGgraph_vertex_vertex|713|0|1151|0|{Call_Web_Service|}423|439|}
{2010212001|XXGvertex_oport_oport|714|0|1153|0|{0|out|}439|440|}
{2010213001|XXGoport_dst_flow|715|0|1155|0|{0|}440|424|}
{2010212001|XXGvertex_oport_oport|716|0|1156|0|{1|reject|}439|441|}
{2010213001|XXGoport_dst_flow|717|0|1158|0|{0|}441|438|}
{2010212001|XXGvertex_oport_oport|718|0|1159|0|{2|error|}439|442|}
{2010213001|XXGoport_dst_flow|719|0|1161|0|{0|}442|426|}
{2010212001|XXGvertex_oport_oport|720|0|1162|0|{3|log|}439|443|}
{2010213001|XXGoport_dst_flow|721|0|1164|0|{0|}443|427|}
{2010211001|XXGvertex_iport_iport|722|0|1165|0|{0|in|}439|444|}
{2010007001|XXGobject_proto_object|723|0|1167|0|{}439|445|}
{2010212001|XXGvertex_oport_oport|724|0|1169|0|{0|out|}445|446|}
{2010006001|XXGobject_psameas_object|725|0|1171|0|{metadata|out_metadata|1|0|}446|445|}
{2010212001|XXGvertex_oport_oport|726|0|1172|0|{1|reject|}445|447|}
{2010006001|XXGobject_psameas_object|727|0|1174|0|{metadata|reject_metadata|1|0|}447|445|}
{2010212001|XXGvertex_oport_oport|728|0|1175|0|{2|error|}445|448|}
{2010006001|XXGobject_psameas_object|729|0|1177|0|{metadata|error_metadata|1|0|}448|445|}
{2010212001|XXGvertex_oport_oport|730|0|1178|0|{3|log|}445|449|}
{2010006001|XXGobject_psameas_object|731|0|1180|0|{metadata|log_metadata|1|0|}449|445|}
{2010211001|XXGvertex_iport_iport|732|0|1181|0|{0|in|}445|450|}
{2010006001|XXGobject_psameas_object|733|0|1183|0|{metadata|in_metadata|1|0|}450|445|}
{2010601001|XXGgraph_vertex_vertex|734|0|1184|0|{Dispatch_by_HTTP_Response_Code|}423|451|}
{2010212001|XXGvertex_oport_oport|735|0|1186|0|{0|_2xx|}451|452|}
{2010213001|XXGoport_dst_flow|736|0|1188|0|{0|}452|433|}
{2010212001|XXGvertex_oport_oport|737|0|1189|0|{1|Other|}451|453|}
{2010213001|XXGoport_dst_flow|738|0|1191|0|{0|}453|431|}
{2010212001|XXGvertex_oport_oport|739|0|1192|0|{2|_5xx|}451|454|}
{2010213001|XXGoport_dst_flow|740|0|1194|0|{0|}454|434|}
{2010212001|XXGvertex_oport_oport|741|0|1195|0|{3|reject0|}451|455|}
{2010212001|XXGvertex_oport_oport|742|0|1197|0|{4|reject1|}451|456|}
{2010212001|XXGvertex_oport_oport|743|0|1199|0|{5|reject2|}451|457|}
{2010212001|XXGvertex_oport_oport|744|0|1201|0|{6|error0|}451|458|}
{2010212001|XXGvertex_oport_oport|745|0|1203|0|{7|error1|}451|459|}
{2010212001|XXGvertex_oport_oport|746|0|1205|0|{8|error2|}451|460|}
{2010212001|XXGvertex_oport_oport|747|0|1207|0|{9|log|}451|461|}
{2010211001|XXGvertex_iport_iport|748|0|1209|0|{0|in|}451|462|}
{2010214001|XXGiport_src_flow|749|0|1211|0|{0|}462|424|}
{2010007001|XXGobject_proto_object|750|0|1212|0|{}451|463|}
{2010212001|XXGvertex_oport_oport|751|0|1214|0|{0|_2xx|}463|464|}
{2010006001|XXGobject_psameas_object|752|0|1216|0|{metadata|out0_metadata|1|0|}464|463|}
{2010006001|XXGobject_psameas_object|753|0|1217|0|{transform0|transform0|1|0|}464|463|}
{2010212001|XXGvertex_oport_oport|754|0|1218|0|{1|Other|}463|465|}
{2010006001|XXGobject_psameas_object|755|0|1220|0|{metadata|out1_metadata|1|0|}465|463|}
{2010006001|XXGobject_psameas_object|756|0|1221|0|{transform1|transform1|1|0|}465|463|}
{2010212001|XXGvertex_oport_oport|757|0|1222|0|{2|_5xx|}463|466|}
{2010006001|XXGobject_psameas_object|758|0|1224|0|{metadata|out2_metadata|1|0|}466|463|}
{2010006001|XXGobject_psameas_object|759|0|1225|0|{transform2|transform2|1|0|}466|463|}
{2010212001|XXGvertex_oport_oport|760|0|1226|0|{3|reject0|}463|467|}
{2010006001|XXGobject_psameas_object|761|0|1228|0|{metadata|reject0_metadata|1|0|}467|463|}
{2010212001|XXGvertex_oport_oport|762|0|1229|0|{4|reject1|}463|468|}
{2010006001|XXGobject_psameas_object|763|0|1231|0|{metadata|reject1_metadata|1|0|}468|463|}
{2010212001|XXGvertex_oport_oport|764|0|1232|0|{5|reject2|}463|469|}
{2010006001|XXGobject_psameas_object|765|0|1234|0|{metadata|reject2_metadata|1|0|}469|463|}
{2010212001|XXGvertex_oport_oport|766|0|1235|0|{6|error0|}463|470|}
{2010006001|XXGobject_psameas_object|767|0|1237|0|{metadata|error0_metadata|1|0|}470|463|}
{2010212001|XXGvertex_oport_oport|768|0|1238|0|{7|error1|}463|471|}
{2010006001|XXGobject_psameas_object|769|0|1240|0|{metadata|error1_metadata|1|0|}471|463|}
{2010212001|XXGvertex_oport_oport|770|0|1241|0|{8|error2|}463|472|}
{2010006001|XXGobject_psameas_object|771|0|1243|0|{metadata|error2_metadata|1|0|}472|463|}
{2010212001|XXGvertex_oport_oport|772|0|1244|0|{9|log|}463|473|}
{2010006001|XXGobject_psameas_object|773|0|1246|0|{metadata|log_metadata|1|0|}473|463|}
{2010211001|XXGvertex_iport_iport|774|0|1247|0|{0|in|}463|474|}
{2010006001|XXGobject_psameas_object|775|0|1249|0|{metadata|in_metadata|1|0|}474|463|}
{2010601001|XXGgraph_vertex_vertex|776|0|1250|0|{Error_as_Fault|}423|475|}
{2010212001|XXGvertex_oport_oport|777|0|1252|0|{0|out0|}475|476|}
{2010213001|XXGoport_dst_flow|778|0|1254|0|{0|}476|429|}
{2010212001|XXGvertex_oport_oport|779|0|1255|0|{1|reject0|}475|477|}
{2010212001|XXGvertex_oport_oport|780|0|1257|0|{2|error0|}475|478|}
{2010212001|XXGvertex_oport_oport|781|0|1259|0|{3|log|}475|479|}
{2010211001|XXGvertex_iport_iport|782|0|1261|0|{0|in|}475|480|}
{2010214001|XXGiport_src_flow|783|0|1263|0|{0|}480|430|}
{2010007001|XXGobject_proto_object|784|0|1264|0|{}475|481|}
{2010212001|XXGvertex_oport_oport|785|0|1266|0|{0|out0|}481|482|}
{2010006001|XXGobject_psameas_object|786|0|1268|0|{metadata|out0_metadata|1|0|}482|481|}
{2010006001|XXGobject_psameas_object|787|0|1269|0|{transform0|transform0|1|0|}482|481|}
{2010212001|XXGvertex_oport_oport|788|0|1270|0|{1|reject0|}481|483|}
{2010006001|XXGobject_psameas_object|789|0|1272|0|{metadata|reject0_metadata|1|0|}483|481|}
{2010212001|XXGvertex_oport_oport|790|0|1273|0|{2|error0|}481|484|}
{2010006001|XXGobject_psameas_object|791|0|1275|0|{metadata|error0_metadata|1|0|}484|481|}
{2010212001|XXGvertex_oport_oport|792|0|1276|0|{3|log|}481|485|}
{2010006001|XXGobject_psameas_object|793|0|1278|0|{metadata|log_metadata|1|0|}485|481|}
{2010211001|XXGvertex_iport_iport|794|0|1279|0|{0|in|}481|486|}
{2010006001|XXGobject_psameas_object|795|0|1281|0|{metadata|in_metadata|1|0|}486|481|}
{2010601001|XXGgraph_vertex_vertex|796|0|1282|0|{Fuse|}423|487|}
{2010212001|XXGvertex_oport_oport|797|0|1284|0|{0|out|}487|488|}
{2010213001|XXGoport_dst_flow|798|0|1286|0|{0|}488|430|}
{2010212001|XXGvertex_oport_oport|799|0|1287|0|{1|reject0|}487|489|}
{2010212001|XXGvertex_oport_oport|800|0|1289|0|{2|reject1|}487|490|}
{2010212001|XXGvertex_oport_oport|801|0|1291|0|{3|error0|}487|491|}
{2010212001|XXGvertex_oport_oport|802|0|1293|0|{4|error1|}487|492|}
{2010212001|XXGvertex_oport_oport|803|0|1295|0|{5|log|}487|493|}
{2010211001|XXGvertex_iport_iport|804|0|1297|0|{0|in0|}487|494|}
{2010214001|XXGiport_src_flow|805|0|1299|0|{0|}494|438|}
{2010211001|XXGvertex_iport_iport|806|0|1300|0|{1|in1|}487|495|}
{2010214001|XXGiport_src_flow|807|0|1302|0|{0|}495|426|}
{2010007001|XXGobject_proto_object|808|0|1303|0|{}487|496|}
{2010212001|XXGvertex_oport_oport|809|0|1305|0|{0|out|}496|497|}
{2010006001|XXGobject_psameas_object|810|0|1307|0|{metadata|out_metadata|1|0|}497|496|}
{2010212001|XXGvertex_oport_oport|811|0|1308|0|{1|reject0|}496|498|}
{2010006001|XXGobject_psameas_object|812|0|1310|0|{metadata|reject0_metadata|1|0|}498|496|}
{2010212001|XXGvertex_oport_oport|813|0|1311|0|{2|reject1|}496|499|}
{2010006001|XXGobject_psameas_object|814|0|1313|0|{metadata|reject1_metadata|1|0|}499|496|}
{2010212001|XXGvertex_oport_oport|815|0|1314|0|{3|error0|}496|500|}
{2010006001|XXGobject_psameas_object|816|0|1316|0|{metadata|error0_metadata|1|0|}500|496|}
{2010212001|XXGvertex_oport_oport|817|0|1317|0|{4|error1|}496|501|}
{2010006001|XXGobject_psameas_object|818|0|1319|0|{metadata|error1_metadata|1|0|}501|496|}
{2010212001|XXGvertex_oport_oport|819|0|1320|0|{5|log|}496|502|}
{2010006001|XXGobject_psameas_object|820|0|1322|0|{metadata|log_metadata|1|0|}502|496|}
{2010211001|XXGvertex_iport_iport|821|0|1323|0|{0|in0|}496|503|}
{2010006001|XXGobject_psameas_object|822|0|1325|0|{metadata|in0_metadata|1|0|}503|496|}
{2010211001|XXGvertex_iport_iport|823|0|1326|0|{1|in1|}496|504|}
{2010006001|XXGobject_psameas_object|824|0|1328|0|{metadata|in1_metadata|1|0|}504|496|}
{2010601001|XXGgraph_vertex_vertex|825|0|1329|0|{Gather|}423|505|}
{2010212001|XXGvertex_oport_oport|826|0|1331|0|{0|out|}505|506|}
{2010211001|XXGvertex_iport_iport|827|0|1333|0|{0|in|}505|507|}
{2010214001|XXGiport_src_flow|828|0|1335|0|{0|}507|436|}
{2010214001|XXGiport_src_flow|829|0|1336|0|{1|}507|431|}
{2010214001|XXGiport_src_flow|830|0|1337|0|{2|}507|425|}
{2010214001|XXGiport_src_flow|831|0|1338|0|{3|}507|435|}
{2010214001|XXGiport_src_flow|832|0|1339|0|{4|}507|429|}
{2010007001|XXGobject_proto_object|833|0|1340|0|{}505|508|}
{2010212001|XXGvertex_oport_oport|834|0|1342|0|{0|out|}508|509|}
{2010006001|XXGobject_psameas_object|835|0|1344|0|{metadata|out_metadata|1|0|}509|508|}
{2010211001|XXGvertex_iport_iport|836|0|1345|0|{0|in|}508|510|}
{2010006001|XXGobject_psameas_object|837|0|1347|0|{metadata|in_metadata|1|0|}510|508|}
{2010601001|XXGgraph_vertex_vertex|838|0|1348|0|{Not_Expected_Response|}423|511|}
{2010212001|XXGvertex_oport_oport|839|0|1350|0|{0|out0|}511|512|}
{2010213001|XXGoport_dst_flow|840|0|1352|0|{0|}512|436|}
{2010212001|XXGvertex_oport_oport|841|0|1353|0|{1|reject0|}511|513|}
{2010212001|XXGvertex_oport_oport|842|0|1355|0|{2|error0|}511|514|}
{2010212001|XXGvertex_oport_oport|843|0|1357|0|{3|log|}511|515|}
{2010211001|XXGvertex_iport_iport|844|0|1359|0|{0|in|}511|516|}
{2010214001|XXGiport_src_flow|845|0|1361|0|{0|}516|432|}
{2010007001|XXGobject_proto_object|846|0|1362|0|{}511|517|}
{2010212001|XXGvertex_oport_oport|847|0|1364|0|{0|out0|}517|518|}
{2010006001|XXGobject_psameas_object|848|0|1366|0|{metadata|out0_metadata|1|0|}518|517|}
{2010006001|XXGobject_psameas_object|849|0|1367|0|{transform0|transform0|1|0|}518|517|}
{2010212001|XXGvertex_oport_oport|850|0|1368|0|{1|reject0|}517|519|}
{2010006001|XXGobject_psameas_object|851|0|1370|0|{metadata|reject0_metadata|1|0|}519|517|}
{2010212001|XXGvertex_oport_oport|852|0|1371|0|{2|error0|}517|520|}
{2010006001|XXGobject_psameas_object|853|0|1373|0|{metadata|error0_metadata|1|0|}520|517|}
{2010212001|XXGvertex_oport_oport|854|0|1374|0|{3|log|}517|521|}
{2010006001|XXGobject_psameas_object|855|0|1376|0|{metadata|log_metadata|1|0|}521|517|}
{2010211001|XXGvertex_iport_iport|856|0|1377|0|{0|in|}517|522|}
{2010006001|XXGobject_psameas_object|857|0|1379|0|{metadata|in_metadata|1|0|}522|517|}
{2010601001|XXGgraph_vertex_vertex|858|0|1380|0|{Not_a_SOAP_Fault|}423|523|}
{2010212001|XXGvertex_oport_oport|859|0|1382|0|{0|out0|}523|524|}
{2010213001|XXGoport_dst_flow|860|0|1384|0|{0|}524|435|}
{2010212001|XXGvertex_oport_oport|861|0|1385|0|{1|reject0|}523|525|}
{2010212001|XXGvertex_oport_oport|862|0|1387|0|{2|error0|}523|526|}
{2010212001|XXGvertex_oport_oport|863|0|1389|0|{3|log|}523|527|}
{2010211001|XXGvertex_iport_iport|864|0|1391|0|{0|in|}523|528|}
{2010214001|XXGiport_src_flow|865|0|1393|0|{0|}528|437|}
{2010007001|XXGobject_proto_object|866|0|1394|0|{}523|529|}
{2010212001|XXGvertex_oport_oport|867|0|1396|0|{0|out0|}529|530|}
{2010006001|XXGobject_psameas_object|868|0|1398|0|{metadata|out0_metadata|1|0|}530|529|}
{2010006001|XXGobject_psameas_object|869|0|1399|0|{transform0|transform0|1|0|}530|529|}
{2010212001|XXGvertex_oport_oport|870|0|1400|0|{1|reject0|}529|531|}
{2010006001|XXGobject_psameas_object|871|0|1402|0|{metadata|reject0_metadata|1|0|}531|529|}
{2010212001|XXGvertex_oport_oport|872|0|1403|0|{2|error0|}529|532|}
{2010006001|XXGobject_psameas_object|873|0|1405|0|{metadata|error0_metadata|1|0|}532|529|}
{2010212001|XXGvertex_oport_oport|874|0|1406|0|{3|log|}529|533|}
{2010006001|XXGobject_psameas_object|875|0|1408|0|{metadata|log_metadata|1|0|}533|529|}
{2010211001|XXGvertex_iport_iport|876|0|1409|0|{0|in|}529|534|}
{2010006001|XXGobject_psameas_object|877|0|1411|0|{metadata|in_metadata|1|0|}534|529|}
{2010601001|XXGgraph_vertex_vertex|878|0|1412|0|{Put_data_back_to_full_utf8|}423|535|}
{2010212001|XXGvertex_oport_oport|879|0|1414|0|{0|out0|}535|536|}
{2010213001|XXGoport_dst_flow|880|0|1416|0|{0|}536|428|}
{2010212001|XXGvertex_oport_oport|881|0|1417|0|{1|reject0|}535|537|}
{2010212001|XXGvertex_oport_oport|882|0|1419|0|{2|error0|}535|538|}
{2010212001|XXGvertex_oport_oport|883|0|1421|0|{3|log|}535|539|}
{2010211001|XXGvertex_iport_iport|884|0|1423|0|{0|in|}535|540|}
{2010214001|XXGiport_src_flow|885|0|1425|0|{0|}540|427|}
{2010007001|XXGobject_proto_object|886|0|1426|0|{}535|541|}
{2010212001|XXGvertex_oport_oport|887|0|1428|0|{0|out0|}541|542|}
{2010006001|XXGobject_psameas_object|888|0|1430|0|{metadata|out0_metadata|1|0|}542|541|}
{2010006001|XXGobject_psameas_object|889|0|1431|0|{transform0|transform0|1|0|}542|541|}
{2010212001|XXGvertex_oport_oport|890|0|1432|0|{1|reject0|}541|543|}
{2010006001|XXGobject_psameas_object|891|0|1434|0|{metadata|reject0_metadata|1|0|}543|541|}
{2010212001|XXGvertex_oport_oport|892|0|1435|0|{2|error0|}541|544|}
{2010006001|XXGobject_psameas_object|893|0|1437|0|{metadata|error0_metadata|1|0|}544|541|}
{2010212001|XXGvertex_oport_oport|894|0|1438|0|{3|log|}541|545|}
{2010006001|XXGobject_psameas_object|895|0|1440|0|{metadata|log_metadata|1|0|}545|541|}
{2010211001|XXGvertex_iport_iport|896|0|1441|0|{0|in|}541|546|}
{2010006001|XXGobject_psameas_object|897|0|1443|0|{metadata|in_metadata|1|0|}546|541|}
{2010601001|XXGgraph_vertex_vertex|898|0|1444|0|{Read_Fault_XML_Transform|}423|547|}
{2010212001|XXGvertex_oport_oport|899|0|1446|0|{0|out|}547|548|}
{2010213001|XXGoport_dst_flow|900|0|1448|0|{0|}548|425|}
{2010212001|XXGvertex_oport_oport|901|0|1449|0|{1|reject|}547|549|}
{2010213001|XXGoport_dst_flow|902|0|1451|0|{0|}549|437|}
{2010212001|XXGvertex_oport_oport|903|0|1452|0|{2|error|}547|550|}
{2010212001|XXGvertex_oport_oport|904|0|1454|0|{3|log|}547|551|}
{2010211001|XXGvertex_iport_iport|905|0|1456|0|{0|in|}547|552|}
{2010214001|XXGiport_src_flow|906|0|1458|0|{0|}552|434|}
{2010007001|XXGobject_proto_object|907|0|1459|0|{}547|553|}
{2010212001|XXGvertex_oport_oport|908|0|1461|0|{0|out|}553|554|}
{2010006001|XXGobject_psameas_object|909|0|1463|0|{metadata|out_metadata|1|0|}554|553|}
{2010212001|XXGvertex_oport_oport|910|0|1464|0|{1|reject|}553|555|}
{2010006001|XXGobject_psameas_object|911|0|1466|0|{metadata|reject_metadata|1|0|}555|553|}
{2010212001|XXGvertex_oport_oport|912|0|1467|0|{2|error|}553|556|}
{2010006001|XXGobject_psameas_object|913|0|1469|0|{metadata|error_metadata|1|0|}556|553|}
{2010212001|XXGvertex_oport_oport|914|0|1470|0|{3|log|}553|557|}
{2010006001|XXGobject_psameas_object|915|0|1472|0|{metadata|log_metadata|1|0|}557|553|}
{2010211001|XXGvertex_iport_iport|916|0|1473|0|{0|in|}553|558|}
{2010006001|XXGobject_psameas_object|917|0|1475|0|{metadata|in_metadata|1|0|}558|553|}
{2010601001|XXGgraph_vertex_vertex|918|0|1476|0|{Read_Response_XML_Transform|}423|559|}
{2010212001|XXGvertex_oport_oport|919|0|1478|0|{0|out|}559|560|}
{2010212001|XXGvertex_oport_oport|920|0|1480|0|{1|reject|}559|561|}
{2010213001|XXGoport_dst_flow|921|0|1482|0|{0|}561|432|}
{2010212001|XXGvertex_oport_oport|922|0|1483|0|{2|error|}559|562|}
{2010212001|XXGvertex_oport_oport|923|0|1485|0|{3|log|}559|563|}
{2010211001|XXGvertex_iport_iport|924|0|1487|0|{0|in|}559|564|}
{2010214001|XXGiport_src_flow|925|0|1489|0|{0|}564|433|}
{2010007001|XXGobject_proto_object|926|0|1490|0|{}559|565|}
{2010212001|XXGvertex_oport_oport|927|0|1492|0|{0|out|}565|566|}
{2010006001|XXGobject_psameas_object|928|0|1494|0|{metadata|out_metadata|1|0|}566|565|}
{2010212001|XXGvertex_oport_oport|929|0|1495|0|{1|reject|}565|567|}
{2010006001|XXGobject_psameas_object|930|0|1497|0|{metadata|reject_metadata|1|0|}567|565|}
{2010212001|XXGvertex_oport_oport|931|0|1498|0|{2|error|}565|568|}
{2010006001|XXGobject_psameas_object|932|0|1500|0|{metadata|error_metadata|1|0|}568|565|}
{2010212001|XXGvertex_oport_oport|933|0|1501|0|{3|log|}565|569|}
{2010006001|XXGobject_psameas_object|934|0|1503|0|{metadata|log_metadata|1|0|}569|565|}
{2010211001|XXGvertex_iport_iport|935|0|1504|0|{0|in|}565|570|}
{2010006001|XXGobject_psameas_object|936|0|1506|0|{metadata|in_metadata|1|0|}570|565|}
{2010006001|XXGobject_psameas_object|937|0|1507|0|{out_metadata|read_xml_output_record_format|1|0|}559|423|}
{2010006001|XXGobject_psameas_object|938|0|1508|0|{package|read_xml_transform|1|0|}559|423|}
{2010601001|XXGgraph_vertex_vertex|939|0|1509|0|{Replicate|}423|571|}
{2010212001|XXGvertex_oport_oport|940|0|1511|0|{0|out|}571|572|}
{2010211001|XXGvertex_iport_iport|941|0|1513|0|{0|in|}571|573|}
{2010214001|XXGiport_src_flow|942|0|1515|0|{0|}573|428|}
{2010007001|XXGobject_proto_object|943|0|1516|0|{}571|574|}
{2010212001|XXGvertex_oport_oport|944|0|1518|0|{0|out|}574|575|}
{2010006001|XXGobject_psameas_object|945|0|1520|0|{metadata|out_metadata|1|0|}575|574|}
{2010211001|XXGvertex_iport_iport|946|0|1521|0|{0|in|}574|576|}
{2010006001|XXGobject_psameas_object|947|0|1523|0|{metadata|in_metadata|1|0|}576|574|}
{2010212001|XXGvertex_oport_oport|948|0|1524|0|{0|fault|}423|577|}
{2010216002|XXGoport_binding_oport|949|0|1526|0|{.8122270703315735|.5|{12|950000|414000|970000|414000|970000|526000|269000|526000|269000|639000|269000|659000|}0|}577|506|}
{2010212001|XXGvertex_oport_oport|950|0|1527|0|{1|out0|}423|578|}
{2010216002|XXGoport_binding_oport|951|0|1529|0|{.5|.5|{12|860000|114000|880000|114000|935000|114000|935000|339000|990000|339000|1010000|339000|}0|}578|560|}
{2010212001|XXGvertex_oport_oport|952|0|1530|0|{2|log|}423|579|}
{2010216002|XXGoport_binding_oport|953|0|1532|0|{.5|.5|{8|684000|577000|684000|597000|684000|639000|684000|659000|}0|}579|572|}
{2010211001|XXGvertex_iport_iport|954|0|1533|0|{0|in0|}423|580|}
{2010215002|XXGiport_binding_iport|955|0|1535|0|{.5|.5|{12|116000|229000|96000|229000|68000|229000|68000|339000|39000|339000|19000|339000|}0|}580|444|}
{2010601001|XXGgraph_vertex_vertex|956|0|1536|0|{Separate_query_from_queryMore_results|}236|581|}
{2010212001|XXGvertex_oport_oport|957|0|1538|0|{0|out|}581|582|}
{2010213001|XXGoport_dst_flow|958|0|1540|0|{0|}582|253|}
{2010212001|XXGvertex_oport_oport|959|0|1541|0|{1|deselect|}581|583|}
{2010213001|XXGoport_dst_flow|960|0|1543|0|{0|}583|251|}
{2010212001|XXGvertex_oport_oport|961|0|1544|0|{2|reject|}581|584|}
{2010212001|XXGvertex_oport_oport|962|0|1546|0|{3|error|}581|585|}
{2010212001|XXGvertex_oport_oport|963|0|1548|0|{4|log|}581|586|}
{2010211001|XXGvertex_iport_iport|964|0|1550|0|{0|in|}581|587|}
{2010214001|XXGiport_src_flow|965|0|1552|0|{0|}587|247|}
{2010007001|XXGobject_proto_object|966|0|1553|0|{}581|588|}
{2010212001|XXGvertex_oport_oport|967|0|1555|0|{0|out|}588|589|}
{2010006001|XXGobject_psameas_object|968|0|1557|0|{metadata|out_metadata|1|0|}589|588|}
{2010212001|XXGvertex_oport_oport|969|0|1558|0|{1|deselect|}588|590|}
{2010006001|XXGobject_psameas_object|970|0|1560|0|{metadata|deselect_metadata|1|0|}590|588|}
{2010212001|XXGvertex_oport_oport|971|0|1561|0|{2|reject|}588|591|}
{2010006001|XXGobject_psameas_object|972|0|1563|0|{metadata|reject_metadata|1|0|}591|588|}
{2010212001|XXGvertex_oport_oport|973|0|1564|0|{3|error|}588|592|}
{2010006001|XXGobject_psameas_object|974|0|1566|0|{metadata|error_metadata|1|0|}592|588|}
{2010212001|XXGvertex_oport_oport|975|0|1567|0|{4|log|}588|593|}
{2010006001|XXGobject_psameas_object|976|0|1569|0|{metadata|log_metadata|1|0|}593|588|}
{2010211001|XXGvertex_iport_iport|977|0|1570|0|{0|in|}588|594|}
{2010006001|XXGobject_psameas_object|978|0|1572|0|{metadata|in_metadata|1|0|}594|588|}
{2010601001|XXGgraph_vertex_vertex|979|0|1573|0|{Sleep_when_continuous|}236|595|}
{2010212001|XXGvertex_oport_oport|980|0|1575|0|{0|out0|}595|596|}
{2010213001|XXGoport_dst_flow|981|0|1577|0|{0|}596|246|}
{2010212001|XXGvertex_oport_oport|982|0|1578|0|{1|reject0|}595|597|}
{2010212001|XXGvertex_oport_oport|983|0|1580|0|{2|error0|}595|598|}
{2010212001|XXGvertex_oport_oport|984|0|1582|0|{3|log|}595|599|}
{2010211001|XXGvertex_iport_iport|985|0|1584|0|{0|in|}595|600|}
{2010214001|XXGiport_src_flow|986|0|1586|0|{0|}600|245|}
{2010007001|XXGobject_proto_object|987|0|1587|0|{}595|601|}
{2010212001|XXGvertex_oport_oport|988|0|1589|0|{0|out0|}601|602|}
{2010006001|XXGobject_psameas_object|989|0|1591|0|{metadata|out0_metadata|1|0|}602|601|}
{2010006001|XXGobject_psameas_object|990|0|1592|0|{transform0|transform0|1|0|}602|601|}
{2010212001|XXGvertex_oport_oport|991|0|1593|0|{1|reject0|}601|603|}
{2010006001|XXGobject_psameas_object|992|0|1595|0|{metadata|reject0_metadata|1|0|}603|601|}
{2010212001|XXGvertex_oport_oport|993|0|1596|0|{2|error0|}601|604|}
{2010006001|XXGobject_psameas_object|994|0|1598|0|{metadata|error0_metadata|1|0|}604|601|}
{2010212001|XXGvertex_oport_oport|995|0|1599|0|{3|log|}601|605|}
{2010006001|XXGobject_psameas_object|996|0|1601|0|{metadata|log_metadata|1|0|}605|601|}
{2010211001|XXGvertex_iport_iport|997|0|1602|0|{0|in|}601|606|}
{2010006001|XXGobject_psameas_object|998|0|1604|0|{metadata|in_metadata|1|0|}606|601|}
{2010601001|XXGgraph_vertex_vertex|999|0|1605|0|{Write_XML_Transform|}236|607|}
{2010212001|XXGvertex_oport_oport|1000|0|1607|0|{0|out|}607|608|}
{2010213001|XXGoport_dst_flow|1001|0|1609|0|{0|}608|241|}
{2010212001|XXGvertex_oport_oport|1002|0|1610|0|{1|reject|}607|609|}
{2010212001|XXGvertex_oport_oport|1003|0|1612|0|{2|error|}607|610|}
{2010212001|XXGvertex_oport_oport|1004|0|1614|0|{3|log|}607|611|}
{2010211001|XXGvertex_iport_iport|1005|0|1616|0|{0|in|}607|612|}
{2010214001|XXGiport_src_flow|1006|0|1618|0|{0|}612|250|}
{2010007001|XXGobject_proto_object|1007|0|1619|0|{}607|613|}
{2010212001|XXGvertex_oport_oport|1008|0|1621|0|{0|out|}613|614|}
{2010006001|XXGobject_psameas_object|1009|0|1623|0|{metadata|out_metadata|1|0|}614|613|}
{2010212001|XXGvertex_oport_oport|1010|0|1624|0|{1|reject|}613|615|}
{2010006001|XXGobject_psameas_object|1011|0|1626|0|{metadata|reject_metadata|1|0|}615|613|}
{2010212001|XXGvertex_oport_oport|1012|0|1627|0|{2|error|}613|616|}
{2010006001|XXGobject_psameas_object|1013|0|1629|0|{metadata|error_metadata|1|0|}616|613|}
{2010212001|XXGvertex_oport_oport|1014|0|1630|0|{3|log|}613|617|}
{2010006001|XXGobject_psameas_object|1015|0|1632|0|{metadata|log_metadata|1|0|}617|613|}
{2010211001|XXGvertex_iport_iport|1016|0|1633|0|{0|in|}613|618|}
{2010006001|XXGobject_psameas_object|1017|0|1635|0|{metadata|in_metadata|1|0|}618|613|}
{2010212001|XXGvertex_oport_oport|1018|0|1636|0|{0|out|}236|619|}
{2010216002|XXGoport_binding_oport|1019|0|1638|0|{.5|.5|{12|1616000|474000|1636000|474000|1658000|474000|1658000|454000|1680000|454000|1700000|454000|}175|}619|263|}
{2010212001|XXGvertex_oport_oport|1020|0|1639|0|{1|error|}236|620|}
{2010216002|XXGoport_binding_oport|1021|0|1641|0|{.5|.5|{10|388000|739000|408000|739000|439000|739000|439000|870000|439000|890000|}176|}620|323|}
{2010212001|XXGvertex_oport_oport|1022|0|1642|0|{2|log|}236|621|}
{2010216002|XXGoport_binding_oport|1023|0|1644|0|{.5|.5|{12|569000|226000|569000|246000|569000|558000|1279000|558000|1279000|870000|1279000|890000|}177|}621|421|}
{2010601001|XXGgraph_vertex_vertex|1024|0|1645|0|{RFT_Abort_no_connection|}1|622|}
{2010212001|XXGvertex_oport_oport|1025|0|1647|0|{0|out0|}622|623|}
{2010213001|XXGoport_dst_flow|1026|0|1649|0|{0|}623|11|}
{2010212001|XXGvertex_oport_oport|1027|0|1650|0|{1|reject0|}622|624|}
{2010212001|XXGvertex_oport_oport|1028|0|1652|0|{2|error0|}622|625|}
{2010212001|XXGvertex_oport_oport|1029|0|1654|0|{3|log|}622|626|}
{2010211001|XXGvertex_iport_iport|1030|0|1656|0|{0|in|}622|627|}
{2010214001|XXGiport_src_flow|1031|0|1658|0|{0|}627|12|}
{2010007001|XXGobject_proto_object|1032|0|1659|0|{}622|628|}
{2010212001|XXGvertex_oport_oport|1033|0|1661|0|{0|out0|}628|629|}
{2010006001|XXGobject_psameas_object|1034|0|1663|0|{metadata|out0_metadata|1|0|}629|628|}
{2010006001|XXGobject_psameas_object|1035|0|1664|0|{transform0|transform0|1|0|}629|628|}
{2010212001|XXGvertex_oport_oport|1036|0|1665|0|{1|reject0|}628|630|}
{2010006001|XXGobject_psameas_object|1037|0|1667|0|{metadata|reject0_metadata|1|0|}630|628|}
{2010212001|XXGvertex_oport_oport|1038|0|1668|0|{2|error0|}628|631|}
{2010006001|XXGobject_psameas_object|1039|0|1670|0|{metadata|error0_metadata|1|0|}631|628|}
{2010212001|XXGvertex_oport_oport|1040|0|1671|0|{3|log|}628|632|}
{2010006001|XXGobject_psameas_object|1041|0|1673|0|{metadata|log_metadata|1|0|}632|628|}
{2010211001|XXGvertex_iport_iport|1042|0|1674|0|{0|in|}628|633|}
{2010006001|XXGobject_psameas_object|1043|0|1676|0|{metadata|in_metadata|1|0|}633|628|}
{2010006001|XXGobject_psameas_object|1044|0|1677|0|{Layout|Layout|0|0|}622|25|}
{2010006001|XXGobject_psameas_object|1045|0|1678|0|{in_metadata|out0_metadata|0|0|}622|29|}
{2010006001|XXGobject_psameas_object|1046|0|1679|0|{out0_metadata|out0_metadata|0|0|}622|29|}
{2010006001|XXGobject_psameas_object|1047|0|1680|0|{reject0_metadata|out0_metadata|0|0|}622|29|}
{2010601001|XXGgraph_vertex_vertex|1048|0|1681|0|{RFT_map_source_to_clean_|}1|634|}
{2010212001|XXGvertex_oport_oport|1049|0|1683|0|{0|out0|}634|635|}
{2010213001|XXGoport_dst_flow|1050|0|1685|0|{0|}635|20|}
{2010212001|XXGvertex_oport_oport|1051|0|1686|0|{1|reject0|}634|636|}
{2010212001|XXGvertex_oport_oport|1052|0|1688|0|{2|error0|}634|637|}
{2010212001|XXGvertex_oport_oport|1053|0|1690|0|{3|log|}634|638|}
{2010211001|XXGvertex_iport_iport|1054|0|1692|0|{0|in|}634|639|}
{2010214001|XXGiport_src_flow|1055|0|1694|0|{0|}639|16|}
{2010007001|XXGobject_proto_object|1056|0|1695|0|{}634|640|}
{2010212001|XXGvertex_oport_oport|1057|0|1697|0|{0|out0|}640|641|}
{2010006001|XXGobject_psameas_object|1058|0|1699|0|{metadata|out0_metadata|1|0|}641|640|}
{2010006001|XXGobject_psameas_object|1059|0|1700|0|{transform0|transform0|1|0|}641|640|}
{2010212001|XXGvertex_oport_oport|1060|0|1701|0|{1|reject0|}640|642|}
{2010006001|XXGobject_psameas_object|1061|0|1703|0|{metadata|reject0_metadata|1|0|}642|640|}
{2010212001|XXGvertex_oport_oport|1062|0|1704|0|{2|error0|}640|643|}
{2010006001|XXGobject_psameas_object|1063|0|1706|0|{metadata|error0_metadata|1|0|}643|640|}
{2010212001|XXGvertex_oport_oport|1064|0|1707|0|{3|log|}640|644|}
{2010006001|XXGobject_psameas_object|1065|0|1709|0|{metadata|log_metadata|1|0|}644|640|}
{2010211001|XXGvertex_iport_iport|1066|0|1710|0|{0|in|}640|645|}
{2010006001|XXGobject_psameas_object|1067|0|1712|0|{metadata|in_metadata|1|0|}645|640|}
{2010006001|XXGobject_psameas_object|1068|0|1713|0|{Layout|Layout|0|0|}634|21|}
{2010006001|XXGobject_psameas_object|1069|0|1714|0|{in_metadata|out_metadata|0|0|}634|118|}
{2010006001|XXGobject_psameas_object|1070|0|1715|0|{out0_metadata|write_metadata|0|0|}634|21|}
{2010006001|XXGobject_psameas_object|1071|0|1716|0|{reject0_metadata|out_metadata|0|0|}634|118|}
{2010601001|XXGgraph_vertex_vertex|1072|0|1717|0|{Rollup_Job_Info|}1|646|}
{2010212001|XXGvertex_oport_oport|1073|0|1719|0|{0|out|}646|647|}
{2010213001|XXGoport_dst_flow|1074|0|1721|0|{0|}647|19|}
{2010212001|XXGvertex_oport_oport|1075|0|1722|0|{1|reject|}646|648|}
{2010212001|XXGvertex_oport_oport|1076|0|1724|0|{2|error|}646|649|}
{2010212001|XXGvertex_oport_oport|1077|0|1726|0|{3|log|}646|650|}
{2010211001|XXGvertex_iport_iport|1078|0|1728|0|{0|in|}646|651|}
{2010214001|XXGiport_src_flow|1079|0|1730|0|{0|}651|17|}
{2010007001|XXGobject_proto_object|1080|0|1731|0|{}646|652|}
{2010212001|XXGvertex_oport_oport|1081|0|1733|0|{0|out|}652|653|}
{2010006001|XXGobject_psameas_object|1082|0|1735|0|{metadata|out_metadata|1|0|}653|652|}
{2010212001|XXGvertex_oport_oport|1083|0|1736|0|{1|reject|}652|654|}
{2010006001|XXGobject_psameas_object|1084|0|1738|0|{metadata|reject_metadata|1|0|}654|652|}
{2010212001|XXGvertex_oport_oport|1085|0|1739|0|{2|error|}652|655|}
{2010006001|XXGobject_psameas_object|1086|0|1741|0|{metadata|error_metadata|1|0|}655|652|}
{2010212001|XXGvertex_oport_oport|1087|0|1742|0|{3|log|}652|656|}
{2010006001|XXGobject_psameas_object|1088|0|1744|0|{metadata|log_metadata|1|0|}656|652|}
{2010211001|XXGvertex_iport_iport|1089|0|1745|0|{0|in|}652|657|}
{2010006001|XXGobject_psameas_object|1090|0|1747|0|{metadata|in_metadata|1|0|}657|652|}
{2010006001|XXGobject_psameas_object|1091|0|1748|0|{Layout|Layout|0|0|}646|96|}
{2010006001|XXGobject_psameas_object|1092|0|1749|0|{in_metadata|log_metadata|0|0|}646|100|}
{2010006001|XXGobject_psameas_object|1093|0|1750|0|{out_metadata|write_metadata|0|0|}646|96|}
{2010006001|XXGobject_psameas_object|1094|0|1751|0|{reject_metadata|log_metadata|0|0|}646|100|}
{2010109001|XXGobject_property_value|1095|0|1752|0|{0|TrackingThumbprint|72|}1|658|}
