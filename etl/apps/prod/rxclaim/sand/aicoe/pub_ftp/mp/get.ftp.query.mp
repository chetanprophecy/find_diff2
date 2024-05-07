@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|5|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|171|rel_count|300|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|GET_PHASE||15|9|FK||{4|dev|qa|uat|prod|}}
{30001002|XXparameter|PROTOCOL||3|9|RFK||{0|}}
{30001002|XXparameter|FTP_HOST||3|9|RFK||{0|}}
{30001002|XXparameter|FTP_USER||3|9|RFK||{0|}}
{30001002|XXparameter|FTP_EPW||3|9|RFK||{0|}}
{30001002|XXparameter|FTP_FILE_LOCATIONS||3|9|RFK||{0|}}
{30001002|XXparameter|SFTP_FILE_LOCATIONS|$[string_join(for (let loc in re_split(FTP_FILE_LOCATIONS, "[\\r\\n]+")): 'ls  '+ loc, '\\n')]|3|9|RK||{0|}}
{30001002|XXparameter|SFTP_FILE_LOCATIONS_LONG|$[string_join(for (let loc in re_split(FTP_FILE_LOCATIONS, "[\\r\\n]+")): 'ls -l '+ loc, '\\n')]|3|9|RK||{0|}}
{30001002|XXparameter|PGP_PASS_PHRASE||3|9|FK||{0|}}
{30001002|XXparameter|ZIP_PASS_PHRASE||3|2|FK$||{0|}}
{30001002|XXparameter|FTP_FUSE_XFR|$PUB_FTP_XFR/get.ftp.fuse.default.xfr|3|2|RFK$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|_parameters_of_Gather|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_FTP_file_list|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_SFTP_file_list|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Create_ACE_lookup_files_for_list_conversion_format|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_File_Info|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Filenames_Trimmed|@34|9|FHK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|3.1.5.2|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|5|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|798000|262000|0|get.ftp.query|lpuskas||1|100|0||6||2049|{0|}0|0|{0|}{0|}{0|}{0|}1.0|797000|262000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.1.5|{1|1|}Job 'get.ftp.query' Execution Status Report

||||@|33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Normal - 3.5||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{12|158000|129000|178000|129000|209000|129000|209000|154000|240000|154000|261000|154000|}6584|529|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{8|332000|159000|352000|159000|358000|159000|379000|159000|}6602|17|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{12|168000|219000|188000|219000|214000|219000|214000|164000|240000|164000|261000|164000|}6585|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{8|625000|129000|655000|129000|694000|129000|715000|129000|}6603|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{12|625000|189000|645000|189000|672000|189000|672000|239000|699000|239000|720000|239000|}6606|17|}}
{2010501005|XXGpvertex|10|0|19|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|out :: reformat(in) =
begin
      let string("")[int] my_vector = allocate(); 
      let int i; 
      
      for ( i, i < length_of(in.filenames))
      begin  
           my_vector = vector_append(my_vector, re_replace(in.filenames[i].filename, "_20[0-9][0-9].*", "")); 
      end

      out:: string_join(vector_sort_dedup_first(my_vector), ","); 
end;|3|1|l|@{0|}}
{30001002|XXparameter|transform1|out :: reformat(in) =
begin
      let string("")[int] my_vector = allocate();
      let string("")[int] my_vector2 = allocate(); 
      let string("")[int] my_vector3 = allocate(); 
      let string("")[int] my_vector4 = allocate(); 
      let int i; 
      
      for ( i, i < length_of(in.filenames))
      begin  
           my_vector = vector_append(my_vector, in.filenames[i].filename); 
           my_vector2 = vector_append(my_vector2, in.filenames[i].file_size); 
           my_vector3 = vector_append(my_vector3, in.filenames[i].last_modified); 
           my_vector4 = vector_append(my_vector4, in.filenames[i].path); 
      end

      out.filename:: string_join(my_vector, ","); 
      out.file_size :: string_join(my_vector2, ","); 
      out.last_modified :: string_join(my_vector3, ","); 
      out.path :: string_join(my_vector4, ","); 
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata|string("\\n")|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|out1_metadata|record 
    string(int) path;
    string(int) filename;
    string(int) last_modified;
    string(int) file_size;
end|3|1|l|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
}}@0|@370000|76000|390000|96000|225000|127000|6605|Create ACE lookup files for list_conversion_format|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|11|0|21|0|{@{}@614000|124000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|12|0|24|0|{@{}@614000|184000|11000|11000|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|13|0|27|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|14|0|29|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|15|0|31|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|16|0|33|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|17|0|35|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|18|0|37|0|{@{}@380000|154000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|19|0|40|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1364510557|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|20|0|42|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|21|0|46|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|22|0|50|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|23|0|53|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|24|0|56|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|25|0|59|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|26|0|62|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|27|0|65|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|28|0|68|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:$PUB_FTP_SERIAL/ftp_listing_file_info.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PUB_FTP_SERIAL/ftp_listing_file_info.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@709000|192000|731000|212000|56000|50000|6607|File Info|Ab Initio Software||1|100|0||6||33025|-1|-1|}}
{2010202004|XXGiport|29|0|70|0|{@{}@721000|234000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|30|0|73|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1364510553|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|31|0|75|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|32|0|79|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|$FTP_FUSE_XFR|3|9|fj|@{0|}}
{30001002|XXparameter|out_metadata|record
  record
    string(int) path;
    string(int) filename;
    datetime('YYYY-MM-DD HH24:MI') last_modified;
    decimal('') file_size;
  end[int] filenames;
end|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Fuse.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
}}@0|@738000|250000|758000|270000|90000|69000|6249|Fuse|Ab Initio Software|Built-in 2.10:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|33|0|81|0|{@{}@847000|299000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|34|0|83|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|35|0|85|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|36|0|87|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|37|0|89|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|38|0|91|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|39|0|93|0|{@{}@748000|284000|11000|11000|in0|0.0|count|in|0|1936|0|}}
{2010210004|XXGflow|40|0|95|0|{@{}@384|.5|.5|{12|552000|279000|572000|279000|649000|279000|649000|289000|726000|289000|747000|289000|}6247|1041|}}
{2010202004|XXGiport|41|0|97|0|{@{}@748000|314000|11000|11000|in1|0.0|count|in|1|1936|0|}}
{2010210004|XXGflow|42|0|99|0|{@{}@384|.5|0.0|{12|281000|289000|301000|289000|301000|289000|301000|319000|716000|319000|747000|319000|}6248|1041|}}
{2010501005|XXGpvertex|43|0|101|0|{Applies a transform to the corresponding records from each input flow. The transform is first applied to the first record on each flow, then to the second, and so on. The result of the transform is sent out of the out port.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|fuse-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|error_port_type error <parameter error0_metadata>|3|2|H$|Type for make_error output|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, in[*])|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, in[*])|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, in[*])|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655976|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|44|0|103|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|45|0|106|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|46|0|109|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|47|0|112|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|48|0|115|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|49|0|118|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|50|0|121|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|51|0|124|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010501005|XXGpvertex|52|0|128|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|filename :: get_filename(in) =
begin
  filename :: in.file_name;
end;|3|1|l|@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|file_unavailable|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|filename_error|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|input_error|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|read_as_single_record|True|3|1|l|@{0|}}
{30001002|XXparameter|rhost|$FTP_HOST|3|2|$|@{0|}}
{30001002|XXparameter|user|$FTP_USER|3|2|$|@{0|}}
{30001002|XXparameter|epw|$FTP_EPW|3|2|$|@{0|}}
{30001002|XXparameter|options|-longlist -tolerate-error-codes 450|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|string(big endian integer(8))|3|1|l|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/FTP/FTP_Multiple_From.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
}}@0|@422000|230000|442000|250000|100000|60000|6246|Get Directory Listing|Ab Initio Software|Built-in 2.15.2.r24:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|53|0|130|0|{@{}@541000|274000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|54|0|133|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|55|0|135|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|56|0|137|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|57|0|139|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|58|0|141|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|59|0|143|0|{@{}@432000|274000|11000|11000|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|60|0|145|0|{@{}@384|.5|.5|{8|281000|279000|311000|279000|410000|279000|431000|279000|}6244|17|}}
{2010501005|XXGpvertex|61|0|147|0|{Transfers multiple files with data records from a computer not running the Co>Operating System.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|ftp-multiple-from|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|filter|None (Read all records)|15|1|Fl|Limits the number of records read from each file|{2|None (Read all records)|Range (Read a subset of records from each file)|}}
{30001002|XXparameter|skip_count|0|1|2|FK$|Number of initial records to skip|{0|}}
{30001002|XXparameter|skip_count.display_name|skip-count|3|9|P|@{0|}}
{30001002|XXparameter|skip_count.keyword|skip-count|3|9|P|@{0|}}
{30001002|XXparameter|skip_count.condition|param filter Range*|3|15|P?|@{0|}}
{30001002|XXparameter|read_count|0|1|2|FK$|Number of records to read from each file|{0|}}
{30001002|XXparameter|read_count.display_name|read-count|3|9|P|@{0|}}
{30001002|XXparameter|read_count.keyword|read-count|3|9|P|@{0|}}
{30001002|XXparameter|read_count.condition|param filter Range*|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if the reformat transform rejects records read from input files|{3|Abort on first reject|Never abort|Use limit/ramp|}}
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
{30001002|XXparameter|file_empty|Ignore (continue with no reject or error)|15|1|Fl|What to do if an input file is empty|{4|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|Accept (If reading as single record, produce length-only record with no data)|}}
{30001002|XXparameter|file_empty.display_name|file-empty|3|9|P|@{0|}}
{30001002|XXparameter|file_empty.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_empty_keyword|value file-empty F* Fail value file-empty N* Notify value file-empty I* Ignore value file-empty A* Accept default dollar_substitution Ignore|3|13|Kv|What to do if an input file is empty|{0|}}
{30001002|XXparameter|file_empty_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_unavailable|Fail (Stop processing)|15|1|Fl|What to do if FTP can not initiate the transfer (connected but the input file is missing, not readable or otherwise unavailable)|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|file_unavailable.display_name|file-unavailable|3|9|P|@{0|}}
{30001002|XXparameter|file_unavailable_keyword|value file-unavailable F* Fail value file-unavailable N* Notify value file-unavailable I* Ignore value file-unavailable A* Accept default dollar_substitution Ignore|3|13|Kv|What to do if FTP can not initiate the transfer (connected but file is missing, not readable or otherwise unavailable)|{0|}}
{30001002|XXparameter|filename_error|Fail (Stop processing)|15|1|Fl|What to do with an input record when get_filename() fails|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|filename_error.display_name|filename-error|3|9|P|@{0|}}
{30001002|XXparameter|filename_error_keyword|value filename-error F* Fail value filename-error N* Notify value filename-error I* Ignore default dollar_substitution Fail|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|filename_error_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|input_error|Fail (Stop processing)|15|1|Fl|What to do in case of error reading an input file|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|input_error.display_name|input-error|3|9|P|@{0|}}
{30001002|XXparameter|input_error.condition|version 2.14.70:|3|15|P?|@{0|}}
{30001002|XXparameter|input_error_keyword|value input-error F* Fail value input-error N* Notify value input-error I* Ignore default dollar_substitution Fail|3|13|Kv|What to do in case of error reading records from the input file (FTP transfer successful, but the contents have have errors)|{0|}}
{30001002|XXparameter|input_error_keyword.condition|version 2.14.70:|3|15|P?|@{0|}}
{30001002|XXparameter|read_as_single_record|False|13|1|FKl|If True, reads each file as one record, adding an initial 8-byte size|{0|}}
{30001002|XXparameter|read_as_single_record.condition|param_exact read-blocks False|3|15|P?|@{0|}}
{30001002|XXparameter|read_blocks|False|13|1|FKl|If True, reads each file as a series of blocks, adding an initial 8-byte size to each block|{0|}}
{30001002|XXparameter|read_blocks.display_name|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.keyword|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.condition|param_exact read_as_single_record False|3|15|P?|@{0|}}
{30001002|XXparameter|maximum_block_bytes|-1|1|2|FK$|Block size when read-blocks is True. A value of -1 reads the entire file.|{0|}}
{30001002|XXparameter|maximum_block_bytes.display_name|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.keyword|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.condition|param_exact read-blocks True|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp file_empty_keyword file-empty file_unavailable_keyword file-unavailable filename_error_keyword filename-error input_error_keyword input-error|3|2|$||{0|}}
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
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional input_type read <parameter out_metadata>|3|2|H$|Metadata for records read from input files|{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|num_operations|7|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation2|optional out::reformat(read, filename, in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation2_analysis|optional out::reformat(read, filename, in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation3|optional read::repair_input(rawbytes, filename)|3|2|H$|Repair malformed input record from file|{0|}}
{30001002|XXparameter|operation3_analysis|NULL|3|2|H$||{0|}}
{30001002|XXparameter|rhost||3|2|RFK$|Remote host name|{0|}}
{30001002|XXparameter|type|-binary|15|1|RFOl|Type of file transfer, use -ascii or -binary|{2|-binary|-ascii|}}
{30001002|XXparameter|user||3|2|FK$|Remote username|{0|}}
{30001002|XXparameter|pw||3|2|FK$|Remote password|{0|}}
{30001002|XXparameter|epw||3|2|FK$|Encrypted remote password|{0|}}
{30001002|XXparameter|acct||3|2|FK$|Remote account password|{0|}}
{30001002|XXparameter|passive|True|13|1|FKl|Connect to FTP server in passive mode|{0|}}
{30001002|XXparameter|port||1|2|FK$|FTP server port if non-default|{0|}}
{30001002|XXparameter|ssl|False|13|1|Fl|Use SSL/TLS to secure FTP|{0|}}
{30001002|XXparameter|ssl.condition|version 2.15.4.r31:|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_control_protection|explicit-ssl|15|1|FKl|Whether and how to protect the control channel (including login) with SSL/TLS|{3|no-ssl|explicit-ssl|implicit-ssl|}}
{30001002|XXparameter|ssl_control_protection.display_name|ssl-control-protection|3|9|P|@{0|}}
{30001002|XXparameter|ssl_control_protection.keyword|ssl-control-protection|3|9|P|@{0|}}
{30001002|XXparameter|ssl_control_protection.condition|param ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_data_protection|no-ssl|15|1|FKl|Whether and how to protect FTP data transfers with SSL/TLS|{3|no-ssl|explicit-ssl|implicit-ssl|}}
{30001002|XXparameter|ssl_data_protection.display_name|ssl-data-protection|3|9|P|@{0|}}
{30001002|XXparameter|ssl_data_protection.keyword|ssl-data-protection|3|9|P|@{0|}}
{30001002|XXparameter|ssl_data_protection.condition|param ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|options||16|2|FO$|Additional component options|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=read,r|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=^read ; out=^read; filereject=in|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional input_type read <parameter out_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|type2|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation4|optional out::output_for_error(error_info, read)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation5|optional error::make_error(error_info, read)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::log_error(error_info, read)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|filereject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|fileerror_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,filereject,fileerror,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655964|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: filereject = in
metadata type: fileerror = remote("$AB_HOME/include/error-info.dml")
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|62|0|149|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|63|0|152|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|64|0|155|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|65|0|158|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|66|0|161|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|67|0|164|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|68|0|167|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|69|0|171|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|num_records|$[ length_of(re_split(FTP_FILE_LOCATIONS, "[\\r\\n]+")) ]|3|9||@{0|}}
{30001002|XXparameter|transform|let string(int)[int] file_name_vec = re_split("$\{FTP_FILE_LOCATIONS\}", "[\\r\\n]+");

out :: create(index) =
begin
  out.file_name :: file_name_vec[index - 1];
end;|3|3|c|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record
  string("\\n") file_name;
end|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
}}@0|@35000|236023|55000|256000|60000|60000|6228|Enumerate Locations|Ab Initio Software|Built-in 2.15.2:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|70|0|173|0|{@{}@114000|279000|11000|11000|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|71|0|175|0|{@{}@384|.5|.5|{8|125000|284000|145000|284000|189000|284000|210000|284000|}6227|17|}}
{2010203004|XXGoport|72|0|177|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|73|0|179|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|74|0|181|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|num_records.display_name|num-records|3|9|P|@{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required DML function|{0|}}
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
{30001002|XXparameter|condition||3|2|FHO$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|FHO$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|FHO$||{0|}}
{30001002|XXparameter|condition_interpretation|1|1|2|FHO$||{0|}}
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
{30001002|XXparameter|operation1|out::create(integer(8) index)|3|2|H$|Function taking integer index counting 1,2,3,4... to produce records on the output.|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? subscriber :|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655977|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|75|0|183|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|76|0|186|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|77|0|189|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010600005|XXGgraph|78|0|198|0|{Subgraph created from graph "get.ftp.ftp_list"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_parameters_of_Get_Directory_Listing|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Fuse|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Enumerate_Locations|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Replicate|@34|9|FHK|@{0|}}
{30001002|XXparameter|condition|$[PROTOCOL == 'ftp']|3|9|F||{0|}}
}}@0|@10000|75000|32000|93000|934000|586000|6531|FTP file list|davidmiller||1|100|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}.12433011829853058|933000|586000|7|}}
{2010501005|XXGpvertex|79|0|207|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@211000|253000|221000|262000|50000|41000|6226|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|80|0|209|0|{@{}@270000|274000|11000|21000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|81|0|213|0|{@{}@211000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|82|0|216|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1314655971|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|83|0|218|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|84|0|221|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010203004|XXGoport|85|0|227|0|{@{}@147000|124000|11000|11000|out0|.5|@@@14736|0|}}
{2010503005|XXGfvertex|86|0|232|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:$PUB_FTP_SERIAL/ftp_listing_output_filenames_trimmed.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PUB_FTP_SERIAL/ftp_listing_output_filenames_trimmed.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@704000|82000|726000|102000|56000|50000|6599|Filenames Trimmed|Ab Initio Software||1|100|0||6||33025|-1|-1|}}
{2010202004|XXGiport|87|0|234|0|{@{}@716000|124000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|88|0|237|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1364510553|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|89|0|239|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|90|0|243|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@262000|129000|272000|138000|50000|41000|6587|Gather|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|91|0|245|0|{@{}@321000|154000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|92|0|248|0|{@{}@262000|149000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|93|0|252|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|94|0|254|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|95|0|257|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010600005|XXGgraph|96|0|263|0|{Subgraph created from graph "get.ftp.ftp_list"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_parameters_of_Filter_by_Expression|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_SFTP_From_short_list_|@34|9|FHK|@{0|}}
{30001002|XXparameter|condition|$[PROTOCOL == 'sftp']|3|9|F||{0|}}
{30001002|XXparameter|_parameters_of__dev_null|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of__dev_null_1|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_SFTP_From_long_list_|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Filter_by_Expression_1|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Fuse|@34|9|FHK|@{0|}}
}}@0|@10000|156500|32000|179000|1068000|690000|6533|SFTP file list|davidmiller||1|100|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}.11808809638023376|1067000|689000|7|}}
{2010210004|XXGflow|97|0|265|0|{@{}@384|.5|.5|{8|165000|114000|185000|114000|304000|114000|325000|114000|}6307|17|}}
{2010210004|XXGflow|98|0|267|0|{@{}@384|.5|.5|{8|150000|364000|170000|364000|279000|364000|300000|364000|}6310|17|}}
{2010210004|XXGflow|99|0|269|0|{@{}@384|.5|.5|{12|345000|484000|365000|484000|465000|484000|465000|269000|565000|269000|586000|269000|}6305|17|}}
{2010210004|XXGflow|100|0|271|0|{@{}@384|.5|.5|{12|345000|244000|365000|244000|460000|244000|460000|239000|555000|239000|586000|239000|}6304|17|}}
{2010210004|XXGflow|101|0|273|0|{@{}@384|.5|.5|{10|104000|156000|104000|176000|104000|244000|171000|244000|192000|244000|}6308|17|}}
{2010210004|XXGflow|102|0|275|0|{@{}@384|.5|.5|{10|89000|406000|89000|426000|89000|484000|156000|484000|177000|484000|}6311|17|}}
{2010501005|XXGpvertex|103|0|277|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|select_expr|event_type == 'reply'|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@183000|181000|203000|201000|132000|89000|6285|Filter by Expression|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|104|0|279|0|{@{}@334000|239000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|105|0|282|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|106|0|284|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|107|0|286|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|108|0|288|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|109|0|290|0|{@{}@193000|239000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|110|0|293|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
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
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
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
{2010203004|XXGoport|111|0|295|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|112|0|298|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|113|0|301|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|114|0|304|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|115|0|307|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|116|0|310|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|117|0|314|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|host|$FTP_HOST|3|2|$|@{0|}}
{30001002|XXparameter|source_file|$SFTP_FILE_LOCATIONS|3|2|$|@{0|}}
{30001002|XXparameter|encrypted_passphrase|$FTP_EPW|3|2|$|@{0|}}
{30001002|XXparameter|user|$FTP_USER|3|2|$|@{0|}}
{30001002|XXparameter|program|$AI_BIN/sftp.ksh|3|2|$|@{0|}}
{30001002|XXparameter|sftp_script|$AI_BIN/sftp-get-ls.script|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/SFTP/SFTP_From.mpc|3|2|Pf$|@{0|}}
}}@0|@35000|66000|55000|86000|100000|60000|6309|SFTP From (short list)|Ab Initio Software|Built-in 2.13.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|118|0|316|0|{@{}@154000|109000|11000|11000|out|0.0|@@@2464|0|}}
{2010203004|XXGoport|119|0|319|0|{@{}@99000|145000|11000|11000|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|120|0|322|0|{Transfers files of data records from a computer not running the Co>Operating® System using sftp.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sftp-from|3|1|Hl||{0|}}
{30001002|XXparameter|image__|ab_sftp|3|2|H$||{0|}}
{30001002|XXparameter|host||3|2|RFK$|Remote host name|{0|}}
{30001002|XXparameter|source_file||3|2|RFK$|Remote file name|{0|}}
{30001002|XXparameter|source_file.display_name|source-file|3|9|P|@{0|}}
{30001002|XXparameter|source_file.keyword|source-file|3|9|P|@{0|}}
{30001002|XXparameter|transfer_method|-sftp|15|1|RFOl|Method to use, choose -sftp or -scp|{2|-sftp|-scp|}}
{30001002|XXparameter|transfer_method.display_name|transfer-method|3|9|P|@{0|}}
{30001002|XXparameter|passphrase_required|unspecified|15|1|Fl|Does ssh require a password or passphrase|{3|unspecified|need passphrase|no passphrase|}}
{30001002|XXparameter|passphrase_required.display_name|passphrase-required|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase|True|13|1|Kl|SSH requires a password or passphrase|{0|}}
{30001002|XXparameter|need_passphrase.display_name|need-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase.keyword|need-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase.condition|param passphrase-required need*|3|15|P?|@{0|}}
{30001002|XXparameter|no_passphrase|True|13|1|Kl|SSH does not require a password or passphrase|{0|}}
{30001002|XXparameter|no_passphrase.display_name|no-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|no_passphrase.keyword|no-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|no_passphrase.condition|param passphrase-required no*|3|15|P?|@{0|}}
{30001002|XXparameter|passphrase||3|2|FK$|Password or passphrase|{0|}}
{30001002|XXparameter|encrypted_passphrase||3|2|FK$|Encrypted password or passphrase|{0|}}
{30001002|XXparameter|encrypted_passphrase.display_name|encrypted-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|encrypted_passphrase.keyword|encrypted-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|user||3|2|FK$|Remote username|{0|}}
{30001002|XXparameter|program||3|2|FK$|sftp/scp program to run|{0|}}
{30001002|XXparameter|sftp_batch_flag||3|2|FK$|Batch flag for your sftp client|{0|}}
{30001002|XXparameter|sftp_batch_flag.display_name|sftp-batch-flag|3|9|P|@{0|}}
{30001002|XXparameter|sftp_batch_flag.keyword|sftp-batch-flag|3|9|P|@{0|}}
{30001002|XXparameter|sftp_batch_flag.condition|param transfer-method -sftp version 2.14.18:|3|15|P?|@{0|}}
{30001002|XXparameter|extra_args||3|2|FK$|Extra arguments to pass to sftp|{0|}}
{30001002|XXparameter|extra_args.display_name|extra-args|3|9|P|@{0|}}
{30001002|XXparameter|extra_args.keyword|extra-args|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script||3|2|FK$|Template script containing sftp commands to run|{0|}}
{30001002|XXparameter|sftp_script.display_name|sftp-script|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script.keyword|sftp-script|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script.condition|param transfer-method -sftp|3|15|P?|@{0|}}
{30001002|XXparameter|output_tolerated|unspecified|15|1|Fl|Does sftp/scp generate output even when successful?|{3|unspecified|tolerate output|dont tolerate output|}}
{30001002|XXparameter|output_tolerated.display_name|output-tolerated|3|9|P|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|tolerate_output|True|13|1|Kl|sftp/scp generates output when successful|{0|}}
{30001002|XXparameter|tolerate_output.display_name|tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_output.keyword|tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_output.condition|param output-tolerated tol*|3|15|P?|@{0|}}
{30001002|XXparameter|dont_tolerate_output|True|13|1|Kl|sftp/scp does not generate output when successful|{0|}}
{30001002|XXparameter|dont_tolerate_output.display_name|dont-tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|dont_tolerate_output.keyword|dont-tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|dont_tolerate_output.condition|param output-tolerated dont*|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|file:.|9|2|F$|sftp runs serially|{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=out,r|3|2|H$||{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|121|0|324|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2464|0|}}
{2010203004|XXGoport|122|0|327|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|123|0|333|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|select_expr|event_type == 'reply'|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@168000|421000|188000|441000|147000|89000|6292|Filter by Expression-1|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|124|0|335|0|{@{}@334000|479000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|125|0|338|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|126|0|340|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|127|0|342|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|128|0|344|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|129|0|346|0|{@{}@178000|479000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|130|0|349|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
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
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
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
{2010203004|XXGoport|131|0|351|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|132|0|354|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|133|0|357|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|134|0|360|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|135|0|363|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|136|0|366|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|137|0|370|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|host|$FTP_HOST|3|2|$|@{0|}}
{30001002|XXparameter|source_file|$SFTP_FILE_LOCATIONS_LONG|3|2|$|@{0|}}
{30001002|XXparameter|encrypted_passphrase|$FTP_EPW|3|2|$|@{0|}}
{30001002|XXparameter|user|$FTP_USER|3|2|$|@{0|}}
{30001002|XXparameter|program|$AI_BIN/sftp.ksh|3|2|$|@{0|}}
{30001002|XXparameter|sftp_script|$AI_BIN/sftp-get-ls.script|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/SFTP/SFTP_From.mpc|3|2|Pf$|@{0|}}
}}@0|@20000|316000|40000|336000|100000|60000|6312|SFTP From (long list)|Ab Initio Software|Built-in 2.13.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|138|0|372|0|{@{}@139000|359000|11000|11000|out|0.0|@@@2464|0|}}
{2010203004|XXGoport|139|0|375|0|{@{}@84000|395000|11000|11000|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|140|0|378|0|{Transfers files of data records from a computer not running the Co>Operating® System using sftp.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sftp-from|3|1|Hl||{0|}}
{30001002|XXparameter|image__|ab_sftp|3|2|H$||{0|}}
{30001002|XXparameter|host||3|2|RFK$|Remote host name|{0|}}
{30001002|XXparameter|source_file||3|2|RFK$|Remote file name|{0|}}
{30001002|XXparameter|source_file.display_name|source-file|3|9|P|@{0|}}
{30001002|XXparameter|source_file.keyword|source-file|3|9|P|@{0|}}
{30001002|XXparameter|transfer_method|-sftp|15|1|RFOl|Method to use, choose -sftp or -scp|{2|-sftp|-scp|}}
{30001002|XXparameter|transfer_method.display_name|transfer-method|3|9|P|@{0|}}
{30001002|XXparameter|passphrase_required|unspecified|15|1|Fl|Does ssh require a password or passphrase|{3|unspecified|need passphrase|no passphrase|}}
{30001002|XXparameter|passphrase_required.display_name|passphrase-required|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase|True|13|1|Kl|SSH requires a password or passphrase|{0|}}
{30001002|XXparameter|need_passphrase.display_name|need-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase.keyword|need-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase.condition|param passphrase-required need*|3|15|P?|@{0|}}
{30001002|XXparameter|no_passphrase|True|13|1|Kl|SSH does not require a password or passphrase|{0|}}
{30001002|XXparameter|no_passphrase.display_name|no-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|no_passphrase.keyword|no-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|no_passphrase.condition|param passphrase-required no*|3|15|P?|@{0|}}
{30001002|XXparameter|passphrase||3|2|FK$|Password or passphrase|{0|}}
{30001002|XXparameter|encrypted_passphrase||3|2|FK$|Encrypted password or passphrase|{0|}}
{30001002|XXparameter|encrypted_passphrase.display_name|encrypted-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|encrypted_passphrase.keyword|encrypted-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|user||3|2|FK$|Remote username|{0|}}
{30001002|XXparameter|program||3|2|FK$|sftp/scp program to run|{0|}}
{30001002|XXparameter|sftp_batch_flag||3|2|FK$|Batch flag for your sftp client|{0|}}
{30001002|XXparameter|sftp_batch_flag.display_name|sftp-batch-flag|3|9|P|@{0|}}
{30001002|XXparameter|sftp_batch_flag.keyword|sftp-batch-flag|3|9|P|@{0|}}
{30001002|XXparameter|sftp_batch_flag.condition|param transfer-method -sftp version 2.14.18:|3|15|P?|@{0|}}
{30001002|XXparameter|extra_args||3|2|FK$|Extra arguments to pass to sftp|{0|}}
{30001002|XXparameter|extra_args.display_name|extra-args|3|9|P|@{0|}}
{30001002|XXparameter|extra_args.keyword|extra-args|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script||3|2|FK$|Template script containing sftp commands to run|{0|}}
{30001002|XXparameter|sftp_script.display_name|sftp-script|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script.keyword|sftp-script|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script.condition|param transfer-method -sftp|3|15|P?|@{0|}}
{30001002|XXparameter|output_tolerated|unspecified|15|1|Fl|Does sftp/scp generate output even when successful?|{3|unspecified|tolerate output|dont tolerate output|}}
{30001002|XXparameter|output_tolerated.display_name|output-tolerated|3|9|P|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|tolerate_output|True|13|1|Kl|sftp/scp generates output when successful|{0|}}
{30001002|XXparameter|tolerate_output.display_name|tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_output.keyword|tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_output.condition|param output-tolerated tol*|3|15|P?|@{0|}}
{30001002|XXparameter|dont_tolerate_output|True|13|1|Kl|sftp/scp does not generate output when successful|{0|}}
{30001002|XXparameter|dont_tolerate_output.display_name|dont-tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|dont_tolerate_output.keyword|dont-tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|dont_tolerate_output.condition|param output-tolerated dont*|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|file:.|9|2|F$|sftp runs serially|{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=out,r|3|2|H$||{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|141|0|380|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2464|0|}}
{2010203004|XXGoport|142|0|383|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|143|0|389|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|/*Function combining one record from each input to produce one record on the output.*/
out::fuse(in0,in1)=
begin
  let string(int)[int] short_reply = if (is_defined(in0)) string_split(in0.event_text, '\\r\\n') else [vector];
  let string(int)[int] short_filenames = if (is_defined(in0)) vector_slice(for (let line in short_reply): if (!starts_with(line, 'sftp> ls')) line, 1, length_of(short_reply)) else [vector];
  let string(int)[int] long_reply = if (is_defined(in1)) string_split(in1.event_text, '\\r\\n') else [vector];
  let string(int)[int] long_filenames = if (is_defined(in1)) vector_slice(for (let line in long_reply): if (!starts_with(line, 'sftp> ls')) line, 1, length_of(long_reply)) else [vector];
  let   record
    string(int) path;
    string(int) filename;
    datetime('YYYY-MM-DD HH24:MI') last_modified;
    decimal('') file_size;
  end[int] filenames = allocate();
  
  for (let int i, i < length_of(short_filenames))
    if (!is_blank(short_filenames[i]))
    begin
      let string(int)[int] matches = re_get_matches(long_filenames[i], '.\{10\}[[:space:]]+[[:digit:]]+[[:space:]]+[[:alnum:]]+[[:space:]]+[[:alnum:]]+[[:space:]]+([[:digit:]]+)[[:space:]]+([[:alpha:]]\{3\}[[:space:]]+[[:digit:]]\{1,2\}[[:space:]]+(?:[[:digit:]]\{4\}\|(?:[[:digit:]]\{2\}:[[:digit:]]\{2\})))[[:space:]]+(.+)');
      let decimal('') size = (decimal(''))matches[1];
      let string(int) filename = matches[3];
      let string(int)[int] last_modified_matches = re_get_matches(matches[2], '([[:alpha:]]\{3\})[[:space:]]+([[:digit:]]\{1,2\})[[:space:]]+([[:digit:]]\{4\}\|(?:([[:digit:]]\{2\}):([[:digit:]]\{2\})))');
      let long last_modified_month = date_month((date('MMM'))last_modified_matches[1]);
      let long last_modified_day = (decimal(''))last_modified_matches[2];
      let long last_modified_year = if (length_of(last_modified_matches) == 4) (decimal(''))last_modified_matches[3] else date_year(today1());
      let long last_modified_hour = if (length_of(last_modified_matches) == 6) (decimal(''))last_modified_matches[4] else 0;
      let long last_modified_minute = if (length_of(last_modified_matches) == 6) (decimal(''))last_modified_matches[5] else 0;
      let datetime('YYYY-MM-DD HH24:MI') last_modified = encode_datetime(last_modified_year, last_modified_month, last_modified_day, last_modified_hour, last_modified_minute);
    
      filenames = vector_append(filenames, [record path re_match_replace(short_filenames[i], '(.*/)(.*)', '$1' ), filename filename, last_modified last_modified, file_size size]);
    end
  
  out.filenames :: filenames;
end;|3|9||@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Fuse.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
}}@0|@577000|198000|597000|218000|90000|69000|6306|Fuse|Ab Initio Software|Built-in 2.10:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|144|0|391|0|{@{}@686000|249000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|145|0|393|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|146|0|395|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|147|0|397|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|148|0|399|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|149|0|401|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|150|0|403|0|{@{}@587000|234000|11000|11000|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|151|0|406|0|{@{}@587000|264000|11000|11000|in1|0.0|count|in|1|1936|0|}}
{2010501005|XXGpvertex|152|0|409|0|{Applies a transform to the corresponding records from each input flow. The transform is first applied to the first record on each flow, then to the second, and so on. The result of the transform is sent out of the out port.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|fuse-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|error_port_type error <parameter error0_metadata>|3|2|H$|Type for make_error output|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, in[*])|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, in[*])|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, in[*])|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|153|0|411|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|154|0|414|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|155|0|417|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|156|0|420|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|157|0|423|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|158|0|426|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|159|0|429|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|160|0|432|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010503005|XXGfvertex|161|0|443|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:/dev/null|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/dev/null", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@314000|68000|336000|88000|56000|50000|6266|/dev/null|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|162|0|445|0|{@{}@326000|109000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|163|0|448|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1332536923|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|164|0|450|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|165|0|454|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:/dev/null|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/dev/null", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@289000|318000|311000|338000|56000|50000|6289|/dev/null-1|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|166|0|456|0|{@{}@301000|359000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|167|0|459|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1332536923|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|168|0|461|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010203004|XXGoport|169|0|465|0|{@{}@157000|214000|11000|11000|out0|.5|@@@14736|0|}}
{2010110002|XXGconstant|170|0|469|0|{@{}@{1|7628064|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_2|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_3|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_4|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_5|}1|9|}
{2010601001|XXGgraph_vertex_vertex|9|0|18|0|{Create_ACE_lookup_files_for_list_conversion_format|}1|10|}
{2010212001|XXGvertex_oport_oport|10|0|20|0|{0|out0|}10|11|}
{2010213001|XXGoport_dst_flow|11|0|22|0|{0|}11|8|}
{2010212001|XXGvertex_oport_oport|12|0|23|0|{1|out1|}10|12|}
{2010213001|XXGoport_dst_flow|13|0|25|0|{0|}12|9|}
{2010212001|XXGvertex_oport_oport|14|0|26|0|{2|reject0|}10|13|}
{2010212001|XXGvertex_oport_oport|15|0|28|0|{3|reject1|}10|14|}
{2010212001|XXGvertex_oport_oport|16|0|30|0|{4|error0|}10|15|}
{2010212001|XXGvertex_oport_oport|17|0|32|0|{5|error1|}10|16|}
{2010212001|XXGvertex_oport_oport|18|0|34|0|{6|log|}10|17|}
{2010211001|XXGvertex_iport_iport|19|0|36|0|{0|in|}10|18|}
{2010214001|XXGiport_src_flow|20|0|38|0|{0|}18|6|}
{2010007001|XXGobject_proto_object|21|0|39|0|{}10|19|}
{2010212001|XXGvertex_oport_oport|22|0|41|0|{0|out0|}19|20|}
{2010006001|XXGobject_psameas_object|23|0|43|0|{metadata|out0_metadata|1|0|}20|19|}
{2010006001|XXGobject_psameas_object|24|0|44|0|{transform0|transform0|1|0|}20|19|}
{2010212001|XXGvertex_oport_oport|25|0|45|0|{1|out1|}19|21|}
{2010006001|XXGobject_psameas_object|26|0|47|0|{metadata|out1_metadata|1|0|}21|19|}
{2010006001|XXGobject_psameas_object|27|0|48|0|{transform1|transform1|1|0|}21|19|}
{2010212001|XXGvertex_oport_oport|28|0|49|0|{2|reject0|}19|22|}
{2010006001|XXGobject_psameas_object|29|0|51|0|{metadata|reject0_metadata|1|0|}22|19|}
{2010212001|XXGvertex_oport_oport|30|0|52|0|{3|reject1|}19|23|}
{2010006001|XXGobject_psameas_object|31|0|54|0|{metadata|reject1_metadata|1|0|}23|19|}
{2010212001|XXGvertex_oport_oport|32|0|55|0|{4|error0|}19|24|}
{2010006001|XXGobject_psameas_object|33|0|57|0|{metadata|error0_metadata|1|0|}24|19|}
{2010212001|XXGvertex_oport_oport|34|0|58|0|{5|error1|}19|25|}
{2010006001|XXGobject_psameas_object|35|0|60|0|{metadata|error1_metadata|1|0|}25|19|}
{2010212001|XXGvertex_oport_oport|36|0|61|0|{6|log|}19|26|}
{2010006001|XXGobject_psameas_object|37|0|63|0|{metadata|log_metadata|1|0|}26|19|}
{2010211001|XXGvertex_iport_iport|38|0|64|0|{0|in|}19|27|}
{2010006001|XXGobject_psameas_object|39|0|66|0|{metadata|in_metadata|1|0|}27|19|}
{2010006001|XXGobject_psameas_object|40|0|67|0|{Layout|Layout|0|0|}10|28|}
{2010211001|XXGvertex_iport_iport|41|0|69|0|{0|write|}28|29|}
{2010214001|XXGiport_src_flow|42|0|71|0|{0|}29|9|}
{2010007001|XXGobject_proto_object|43|0|72|0|{}28|30|}
{2010211001|XXGvertex_iport_iport|44|0|74|0|{0|write|}30|31|}
{2010006001|XXGobject_psameas_object|45|0|76|0|{metadata|write_metadata|1|0|}31|30|}
{2010006001|XXGobject_psameas_object|46|0|77|0|{write_metadata|out1_metadata|0|0|}28|10|}
{2010006001|XXGobject_psameas_object|47|0|78|0|{in_metadata|out_metadata|0|0|}10|32|}
{2010212001|XXGvertex_oport_oport|48|0|80|0|{0|out|}32|33|}
{2010212001|XXGvertex_oport_oport|49|0|82|0|{1|reject0|}32|34|}
{2010212001|XXGvertex_oport_oport|50|0|84|0|{2|reject1|}32|35|}
{2010212001|XXGvertex_oport_oport|51|0|86|0|{3|error0|}32|36|}
{2010212001|XXGvertex_oport_oport|52|0|88|0|{4|error1|}32|37|}
{2010212001|XXGvertex_oport_oport|53|0|90|0|{5|log|}32|38|}
{2010211001|XXGvertex_iport_iport|54|0|92|0|{0|in0|}32|39|}
{2010214001|XXGiport_src_flow|55|0|94|0|{0|}39|40|}
{2010211001|XXGvertex_iport_iport|56|0|96|0|{1|in1|}32|41|}
{2010214001|XXGiport_src_flow|57|0|98|0|{0|}41|42|}
{2010007001|XXGobject_proto_object|58|0|100|0|{}32|43|}
{2010212001|XXGvertex_oport_oport|59|0|102|0|{0|out|}43|44|}
{2010006001|XXGobject_psameas_object|60|0|104|0|{metadata|out_metadata|1|0|}44|43|}
{2010212001|XXGvertex_oport_oport|61|0|105|0|{1|reject0|}43|45|}
{2010006001|XXGobject_psameas_object|62|0|107|0|{metadata|reject0_metadata|1|0|}45|43|}
{2010212001|XXGvertex_oport_oport|63|0|108|0|{2|reject1|}43|46|}
{2010006001|XXGobject_psameas_object|64|0|110|0|{metadata|reject1_metadata|1|0|}46|43|}
{2010212001|XXGvertex_oport_oport|65|0|111|0|{3|error0|}43|47|}
{2010006001|XXGobject_psameas_object|66|0|113|0|{metadata|error0_metadata|1|0|}47|43|}
{2010212001|XXGvertex_oport_oport|67|0|114|0|{4|error1|}43|48|}
{2010006001|XXGobject_psameas_object|68|0|116|0|{metadata|error1_metadata|1|0|}48|43|}
{2010212001|XXGvertex_oport_oport|69|0|117|0|{5|log|}43|49|}
{2010006001|XXGobject_psameas_object|70|0|119|0|{metadata|log_metadata|1|0|}49|43|}
{2010211001|XXGvertex_iport_iport|71|0|120|0|{0|in0|}43|50|}
{2010006001|XXGobject_psameas_object|72|0|122|0|{metadata|in0_metadata|1|0|}50|43|}
{2010211001|XXGvertex_iport_iport|73|0|123|0|{1|in1|}43|51|}
{2010006001|XXGobject_psameas_object|74|0|125|0|{metadata|in1_metadata|1|0|}51|43|}
{2010006001|XXGobject_psameas_object|75|0|126|0|{Layout|Layout|0|0|}32|28|}
{2010006001|XXGobject_psameas_object|76|0|127|0|{in0_metadata|out_metadata|0|0|}32|52|}
{2010212001|XXGvertex_oport_oport|77|0|129|0|{0|out|}52|53|}
{2010213001|XXGoport_dst_flow|78|0|131|0|{0|}53|40|}
{2010212001|XXGvertex_oport_oport|79|0|132|0|{1|filereject|}52|54|}
{2010212001|XXGvertex_oport_oport|80|0|134|0|{2|fileerror|}52|55|}
{2010212001|XXGvertex_oport_oport|81|0|136|0|{3|reject|}52|56|}
{2010212001|XXGvertex_oport_oport|82|0|138|0|{4|error|}52|57|}
{2010212001|XXGvertex_oport_oport|83|0|140|0|{5|log|}52|58|}
{2010211001|XXGvertex_iport_iport|84|0|142|0|{0|in|}52|59|}
{2010214001|XXGiport_src_flow|85|0|144|0|{0|}59|60|}
{2010007001|XXGobject_proto_object|86|0|146|0|{}52|61|}
{2010212001|XXGvertex_oport_oport|87|0|148|0|{0|out|}61|62|}
{2010006001|XXGobject_psameas_object|88|0|150|0|{metadata|out_metadata|1|0|}62|61|}
{2010212001|XXGvertex_oport_oport|89|0|151|0|{1|filereject|}61|63|}
{2010006001|XXGobject_psameas_object|90|0|153|0|{metadata|filereject_metadata|1|0|}63|61|}
{2010212001|XXGvertex_oport_oport|91|0|154|0|{2|fileerror|}61|64|}
{2010006001|XXGobject_psameas_object|92|0|156|0|{metadata|fileerror_metadata|1|0|}64|61|}
{2010212001|XXGvertex_oport_oport|93|0|157|0|{3|reject|}61|65|}
{2010006001|XXGobject_psameas_object|94|0|159|0|{metadata|reject_metadata|1|0|}65|61|}
{2010212001|XXGvertex_oport_oport|95|0|160|0|{4|error|}61|66|}
{2010006001|XXGobject_psameas_object|96|0|162|0|{metadata|error_metadata|1|0|}66|61|}
{2010212001|XXGvertex_oport_oport|97|0|163|0|{5|log|}61|67|}
{2010006001|XXGobject_psameas_object|98|0|165|0|{metadata|log_metadata|1|0|}67|61|}
{2010211001|XXGvertex_iport_iport|99|0|166|0|{0|in|}61|68|}
{2010006001|XXGobject_psameas_object|100|0|168|0|{metadata|in_metadata|1|0|}68|61|}
{2010006001|XXGobject_psameas_object|101|0|169|0|{Layout|Layout|0|0|}52|28|}
{2010006001|XXGobject_psameas_object|102|0|170|0|{filereject_metadata|out_metadata|0|0|}52|69|}
{2010212001|XXGvertex_oport_oport|103|0|172|0|{0|out|}69|70|}
{2010213001|XXGoport_dst_flow|104|0|174|0|{0|}70|71|}
{2010212001|XXGvertex_oport_oport|105|0|176|0|{1|error|}69|72|}
{2010212001|XXGvertex_oport_oport|106|0|178|0|{2|log|}69|73|}
{2010007001|XXGobject_proto_object|107|0|180|0|{}69|74|}
{2010212001|XXGvertex_oport_oport|108|0|182|0|{0|out|}74|75|}
{2010006001|XXGobject_psameas_object|109|0|184|0|{metadata|out_metadata|1|0|}75|74|}
{2010212001|XXGvertex_oport_oport|110|0|185|0|{1|error|}74|76|}
{2010006001|XXGobject_psameas_object|111|0|187|0|{metadata|error_metadata|1|0|}76|74|}
{2010212001|XXGvertex_oport_oport|112|0|188|0|{2|log|}74|77|}
{2010006001|XXGobject_psameas_object|113|0|190|0|{metadata|log_metadata|1|0|}77|74|}
{2010006001|XXGobject_psameas_object|114|0|191|0|{in_metadata|out_metadata|0|0|}52|69|}
{2010006001|XXGobject_psameas_object|115|0|192|0|{in1_metadata|out_metadata|0|0|}32|69|}
{2010006001|XXGobject_psameas_object|116|0|193|0|{reject0_metadata|out_metadata|0|0|}32|52|}
{2010006001|XXGobject_psameas_object|117|0|194|0|{reject1_metadata|out_metadata|0|0|}32|69|}
{2010006001|XXGobject_psameas_object|118|0|195|0|{reject0_metadata|out_metadata|0|0|}10|32|}
{2010006001|XXGobject_psameas_object|119|0|196|0|{reject1_metadata|out_metadata|0|0|}10|32|}
{2010601001|XXGgraph_vertex_vertex|120|0|197|0|{FTP_file_list|}1|78|}
{2010604001|XXGgraph_flow_flow|121|0|199|0|{Flow_3|}78|40|}
{2010604001|XXGgraph_flow_flow|122|0|200|0|{Flow_5|}78|71|}
{2010604001|XXGgraph_flow_flow|123|0|201|0|{Flow_6|}78|60|}
{2010604001|XXGgraph_flow_flow|124|0|202|0|{Flow_7|}78|42|}
{2010601001|XXGgraph_vertex_vertex|125|0|203|0|{Enumerate_Locations|}78|69|}
{2010601001|XXGgraph_vertex_vertex|126|0|204|0|{Fuse|}78|32|}
{2010601001|XXGgraph_vertex_vertex|127|0|205|0|{Get_Directory_Listing|}78|52|}
{2010601001|XXGgraph_vertex_vertex|128|0|206|0|{Replicate|}78|79|}
{2010212001|XXGvertex_oport_oport|129|0|208|0|{0|out|}79|80|}
{2010213001|XXGoport_dst_flow|130|0|210|0|{0|}80|60|}
{2010213001|XXGoport_dst_flow|131|0|211|0|{1|}80|42|}
{2010211001|XXGvertex_iport_iport|132|0|212|0|{0|in|}79|81|}
{2010214001|XXGiport_src_flow|133|0|214|0|{0|}81|71|}
{2010007001|XXGobject_proto_object|134|0|215|0|{}79|82|}
{2010212001|XXGvertex_oport_oport|135|0|217|0|{0|out|}82|83|}
{2010006001|XXGobject_psameas_object|136|0|219|0|{metadata|out_metadata|1|0|}83|82|}
{2010211001|XXGvertex_iport_iport|137|0|220|0|{0|in|}82|84|}
{2010006001|XXGobject_psameas_object|138|0|222|0|{metadata|in_metadata|1|0|}84|82|}
{2010006001|XXGobject_psameas_object|139|0|223|0|{Layout|Layout|0|0|}79|28|}
{2010006001|XXGobject_psameas_object|140|0|224|0|{in_metadata|out_metadata|0|0|}79|69|}
{2010006001|XXGobject_psameas_object|141|0|225|0|{out_metadata|out_metadata|0|0|}79|69|}
{2010212001|XXGvertex_oport_oport|142|0|226|0|{0|out0|}78|85|}
{2010216002|XXGoport_binding_oport|143|0|228|0|{.5|.5|{12|857000|304000|877000|304000|904000|304000|904000|314000|931000|314000|951000|314000|}0|}85|33|}
{2010213001|XXGoport_dst_flow|144|0|229|0|{0|}85|5|}
{2010601001|XXGgraph_vertex_vertex|145|0|230|0|{File_Info|}1|28|}
{2010601001|XXGgraph_vertex_vertex|146|0|231|0|{Filenames_Trimmed|}1|86|}
{2010211001|XXGvertex_iport_iport|147|0|233|0|{0|write|}86|87|}
{2010214001|XXGiport_src_flow|148|0|235|0|{0|}87|8|}
{2010007001|XXGobject_proto_object|149|0|236|0|{}86|88|}
{2010211001|XXGvertex_iport_iport|150|0|238|0|{0|write|}88|89|}
{2010006001|XXGobject_psameas_object|151|0|240|0|{metadata|write_metadata|1|0|}89|88|}
{2010006001|XXGobject_psameas_object|152|0|241|0|{write_metadata|out0_metadata|0|0|}86|10|}
{2010601001|XXGgraph_vertex_vertex|153|0|242|0|{Gather|}1|90|}
{2010212001|XXGvertex_oport_oport|154|0|244|0|{0|out|}90|91|}
{2010213001|XXGoport_dst_flow|155|0|246|0|{0|}91|6|}
{2010211001|XXGvertex_iport_iport|156|0|247|0|{0|in|}90|92|}
{2010214001|XXGiport_src_flow|157|0|249|0|{0|}92|5|}
{2010214001|XXGiport_src_flow|158|0|250|0|{1|}92|7|}
{2010007001|XXGobject_proto_object|159|0|251|0|{}90|93|}
{2010212001|XXGvertex_oport_oport|160|0|253|0|{0|out|}93|94|}
{2010006001|XXGobject_psameas_object|161|0|255|0|{metadata|out_metadata|1|0|}94|93|}
{2010211001|XXGvertex_iport_iport|162|0|256|0|{0|in|}93|95|}
{2010006001|XXGobject_psameas_object|163|0|258|0|{metadata|in_metadata|1|0|}95|93|}
{2010006001|XXGobject_psameas_object|164|0|259|0|{Layout|Layout|0|0|}90|28|}
{2010006001|XXGobject_psameas_object|165|0|260|0|{in_metadata|out_metadata|0|0|}90|32|}
{2010006001|XXGobject_psameas_object|166|0|261|0|{out_metadata|out_metadata|0|0|}90|32|}
{2010601001|XXGgraph_vertex_vertex|167|0|262|0|{SFTP_file_list|}1|96|}
{2010604001|XXGgraph_flow_flow|168|0|264|0|{Flow_1|}96|97|}
{2010604001|XXGgraph_flow_flow|169|0|266|0|{Flow_2|}96|98|}
{2010604001|XXGgraph_flow_flow|170|0|268|0|{Flow_3|}96|99|}
{2010604001|XXGgraph_flow_flow|171|0|270|0|{Flow_4|}96|100|}
{2010604001|XXGgraph_flow_flow|172|0|272|0|{Flow_5|}96|101|}
{2010604001|XXGgraph_flow_flow|173|0|274|0|{Flow_7|}96|102|}
{2010601001|XXGgraph_vertex_vertex|174|0|276|0|{Filter_by_Expression|}96|103|}
{2010212001|XXGvertex_oport_oport|175|0|278|0|{0|out|}103|104|}
{2010213001|XXGoport_dst_flow|176|0|280|0|{0|}104|100|}
{2010212001|XXGvertex_oport_oport|177|0|281|0|{1|deselect|}103|105|}
{2010212001|XXGvertex_oport_oport|178|0|283|0|{2|reject|}103|106|}
{2010212001|XXGvertex_oport_oport|179|0|285|0|{3|error|}103|107|}
{2010212001|XXGvertex_oport_oport|180|0|287|0|{4|log|}103|108|}
{2010211001|XXGvertex_iport_iport|181|0|289|0|{0|in|}103|109|}
{2010214001|XXGiport_src_flow|182|0|291|0|{0|}109|101|}
{2010007001|XXGobject_proto_object|183|0|292|0|{}103|110|}
{2010212001|XXGvertex_oport_oport|184|0|294|0|{0|out|}110|111|}
{2010006001|XXGobject_psameas_object|185|0|296|0|{metadata|out_metadata|1|0|}111|110|}
{2010212001|XXGvertex_oport_oport|186|0|297|0|{1|deselect|}110|112|}
{2010006001|XXGobject_psameas_object|187|0|299|0|{metadata|deselect_metadata|1|0|}112|110|}
{2010212001|XXGvertex_oport_oport|188|0|300|0|{2|reject|}110|113|}
{2010006001|XXGobject_psameas_object|189|0|302|0|{metadata|reject_metadata|1|0|}113|110|}
{2010212001|XXGvertex_oport_oport|190|0|303|0|{3|error|}110|114|}
{2010006001|XXGobject_psameas_object|191|0|305|0|{metadata|error_metadata|1|0|}114|110|}
{2010212001|XXGvertex_oport_oport|192|0|306|0|{4|log|}110|115|}
{2010006001|XXGobject_psameas_object|193|0|308|0|{metadata|log_metadata|1|0|}115|110|}
{2010211001|XXGvertex_iport_iport|194|0|309|0|{0|in|}110|116|}
{2010006001|XXGobject_psameas_object|195|0|311|0|{metadata|in_metadata|1|0|}116|110|}
{2010006001|XXGobject_psameas_object|196|0|312|0|{Layout|Layout|0|0|}103|28|}
{2010006001|XXGobject_psameas_object|197|0|313|0|{deselect_metadata|log_metadata|0|0|}103|117|}
{2010212001|XXGvertex_oport_oport|198|0|315|0|{0|out|}117|118|}
{2010213001|XXGoport_dst_flow|199|0|317|0|{0|}118|97|}
{2010212001|XXGvertex_oport_oport|200|0|318|0|{1|log|}117|119|}
{2010213001|XXGoport_dst_flow|201|0|320|0|{0|}119|101|}
{2010007001|XXGobject_proto_object|202|0|321|0|{}117|120|}
{2010212001|XXGvertex_oport_oport|203|0|323|0|{0|out|}120|121|}
{2010006001|XXGobject_psameas_object|204|0|325|0|{metadata|out_metadata|1|0|}121|120|}
{2010212001|XXGvertex_oport_oport|205|0|326|0|{1|log|}120|122|}
{2010006001|XXGobject_psameas_object|206|0|328|0|{metadata|log_metadata|1|0|}122|120|}
{2010006001|XXGobject_psameas_object|207|0|329|0|{in_metadata|log_metadata|0|0|}103|117|}
{2010006001|XXGobject_psameas_object|208|0|330|0|{out_metadata|log_metadata|0|0|}103|117|}
{2010006001|XXGobject_psameas_object|209|0|331|0|{reject_metadata|log_metadata|0|0|}103|117|}
{2010601001|XXGgraph_vertex_vertex|210|0|332|0|{Filter_by_Expression_1|}96|123|}
{2010212001|XXGvertex_oport_oport|211|0|334|0|{0|out|}123|124|}
{2010213001|XXGoport_dst_flow|212|0|336|0|{0|}124|99|}
{2010212001|XXGvertex_oport_oport|213|0|337|0|{1|deselect|}123|125|}
{2010212001|XXGvertex_oport_oport|214|0|339|0|{2|reject|}123|126|}
{2010212001|XXGvertex_oport_oport|215|0|341|0|{3|error|}123|127|}
{2010212001|XXGvertex_oport_oport|216|0|343|0|{4|log|}123|128|}
{2010211001|XXGvertex_iport_iport|217|0|345|0|{0|in|}123|129|}
{2010214001|XXGiport_src_flow|218|0|347|0|{0|}129|102|}
{2010007001|XXGobject_proto_object|219|0|348|0|{}123|130|}
{2010212001|XXGvertex_oport_oport|220|0|350|0|{0|out|}130|131|}
{2010006001|XXGobject_psameas_object|221|0|352|0|{metadata|out_metadata|1|0|}131|130|}
{2010212001|XXGvertex_oport_oport|222|0|353|0|{1|deselect|}130|132|}
{2010006001|XXGobject_psameas_object|223|0|355|0|{metadata|deselect_metadata|1|0|}132|130|}
{2010212001|XXGvertex_oport_oport|224|0|356|0|{2|reject|}130|133|}
{2010006001|XXGobject_psameas_object|225|0|358|0|{metadata|reject_metadata|1|0|}133|130|}
{2010212001|XXGvertex_oport_oport|226|0|359|0|{3|error|}130|134|}
{2010006001|XXGobject_psameas_object|227|0|361|0|{metadata|error_metadata|1|0|}134|130|}
{2010212001|XXGvertex_oport_oport|228|0|362|0|{4|log|}130|135|}
{2010006001|XXGobject_psameas_object|229|0|364|0|{metadata|log_metadata|1|0|}135|130|}
{2010211001|XXGvertex_iport_iport|230|0|365|0|{0|in|}130|136|}
{2010006001|XXGobject_psameas_object|231|0|367|0|{metadata|in_metadata|1|0|}136|130|}
{2010006001|XXGobject_psameas_object|232|0|368|0|{Layout|Layout|0|0|}123|28|}
{2010006001|XXGobject_psameas_object|233|0|369|0|{deselect_metadata|log_metadata|0|0|}123|137|}
{2010212001|XXGvertex_oport_oport|234|0|371|0|{0|out|}137|138|}
{2010213001|XXGoport_dst_flow|235|0|373|0|{0|}138|98|}
{2010212001|XXGvertex_oport_oport|236|0|374|0|{1|log|}137|139|}
{2010213001|XXGoport_dst_flow|237|0|376|0|{0|}139|102|}
{2010007001|XXGobject_proto_object|238|0|377|0|{}137|140|}
{2010212001|XXGvertex_oport_oport|239|0|379|0|{0|out|}140|141|}
{2010006001|XXGobject_psameas_object|240|0|381|0|{metadata|out_metadata|1|0|}141|140|}
{2010212001|XXGvertex_oport_oport|241|0|382|0|{1|log|}140|142|}
{2010006001|XXGobject_psameas_object|242|0|384|0|{metadata|log_metadata|1|0|}142|140|}
{2010006001|XXGobject_psameas_object|243|0|385|0|{in_metadata|log_metadata|0|0|}123|137|}
{2010006001|XXGobject_psameas_object|244|0|386|0|{out_metadata|log_metadata|0|0|}123|137|}
{2010006001|XXGobject_psameas_object|245|0|387|0|{reject_metadata|log_metadata|0|0|}123|137|}
{2010601001|XXGgraph_vertex_vertex|246|0|388|0|{Fuse|}96|143|}
{2010212001|XXGvertex_oport_oport|247|0|390|0|{0|out|}143|144|}
{2010212001|XXGvertex_oport_oport|248|0|392|0|{1|reject0|}143|145|}
{2010212001|XXGvertex_oport_oport|249|0|394|0|{2|reject1|}143|146|}
{2010212001|XXGvertex_oport_oport|250|0|396|0|{3|error0|}143|147|}
{2010212001|XXGvertex_oport_oport|251|0|398|0|{4|error1|}143|148|}
{2010212001|XXGvertex_oport_oport|252|0|400|0|{5|log|}143|149|}
{2010211001|XXGvertex_iport_iport|253|0|402|0|{0|in0|}143|150|}
{2010214001|XXGiport_src_flow|254|0|404|0|{0|}150|100|}
{2010211001|XXGvertex_iport_iport|255|0|405|0|{1|in1|}143|151|}
{2010214001|XXGiport_src_flow|256|0|407|0|{0|}151|99|}
{2010007001|XXGobject_proto_object|257|0|408|0|{}143|152|}
{2010212001|XXGvertex_oport_oport|258|0|410|0|{0|out|}152|153|}
{2010006001|XXGobject_psameas_object|259|0|412|0|{metadata|out_metadata|1|0|}153|152|}
{2010212001|XXGvertex_oport_oport|260|0|413|0|{1|reject0|}152|154|}
{2010006001|XXGobject_psameas_object|261|0|415|0|{metadata|reject0_metadata|1|0|}154|152|}
{2010212001|XXGvertex_oport_oport|262|0|416|0|{2|reject1|}152|155|}
{2010006001|XXGobject_psameas_object|263|0|418|0|{metadata|reject1_metadata|1|0|}155|152|}
{2010212001|XXGvertex_oport_oport|264|0|419|0|{3|error0|}152|156|}
{2010006001|XXGobject_psameas_object|265|0|421|0|{metadata|error0_metadata|1|0|}156|152|}
{2010212001|XXGvertex_oport_oport|266|0|422|0|{4|error1|}152|157|}
{2010006001|XXGobject_psameas_object|267|0|424|0|{metadata|error1_metadata|1|0|}157|152|}
{2010212001|XXGvertex_oport_oport|268|0|425|0|{5|log|}152|158|}
{2010006001|XXGobject_psameas_object|269|0|427|0|{metadata|log_metadata|1|0|}158|152|}
{2010211001|XXGvertex_iport_iport|270|0|428|0|{0|in0|}152|159|}
{2010006001|XXGobject_psameas_object|271|0|430|0|{metadata|in0_metadata|1|0|}159|152|}
{2010211001|XXGvertex_iport_iport|272|0|431|0|{1|in1|}152|160|}
{2010006001|XXGobject_psameas_object|273|0|433|0|{metadata|in1_metadata|1|0|}160|152|}
{2010006001|XXGobject_psameas_object|274|0|434|0|{Layout|Layout|0|0|}143|28|}
{2010006001|XXGobject_psameas_object|275|0|435|0|{in0_metadata|log_metadata|0|0|}143|117|}
{2010006001|XXGobject_psameas_object|276|0|436|0|{in1_metadata|log_metadata|0|0|}143|137|}
{2010006001|XXGobject_psameas_object|277|0|437|0|{out_metadata|out_metadata|0|0|}143|32|}
{2010006001|XXGobject_psameas_object|278|0|438|0|{reject0_metadata|log_metadata|0|0|}143|117|}
{2010006001|XXGobject_psameas_object|279|0|439|0|{reject1_metadata|log_metadata|0|0|}143|137|}
{2010601001|XXGgraph_vertex_vertex|280|0|440|0|{SFTP_From_long_list_|}96|137|}
{2010601001|XXGgraph_vertex_vertex|281|0|441|0|{SFTP_From_short_list_|}96|117|}
{2010601001|XXGgraph_vertex_vertex|282|0|442|0|{_dev_null|}96|161|}
{2010211001|XXGvertex_iport_iport|283|0|444|0|{0|write|}161|162|}
{2010214001|XXGiport_src_flow|284|0|446|0|{0|}162|97|}
{2010007001|XXGobject_proto_object|285|0|447|0|{}161|163|}
{2010211001|XXGvertex_iport_iport|286|0|449|0|{0|write|}163|164|}
{2010006001|XXGobject_psameas_object|287|0|451|0|{metadata|write_metadata|1|0|}164|163|}
{2010006001|XXGobject_psameas_object|288|0|452|0|{write_metadata|out_metadata|0|0|}161|117|}
{2010601001|XXGgraph_vertex_vertex|289|0|453|0|{_dev_null_1|}96|165|}
{2010211001|XXGvertex_iport_iport|290|0|455|0|{0|write|}165|166|}
{2010214001|XXGiport_src_flow|291|0|457|0|{0|}166|98|}
{2010007001|XXGobject_proto_object|292|0|458|0|{}165|167|}
{2010211001|XXGvertex_iport_iport|293|0|460|0|{0|write|}167|168|}
{2010006001|XXGobject_psameas_object|294|0|462|0|{metadata|write_metadata|1|0|}168|167|}
{2010006001|XXGobject_psameas_object|295|0|463|0|{write_metadata|out_metadata|0|0|}165|137|}
{2010212001|XXGvertex_oport_oport|296|0|464|0|{0|out0|}96|169|}
{2010216002|XXGoport_binding_oport|297|0|466|0|{.5|.5|{12|696000|254000|716000|254000|892000|254000|892000|364000|1068000|364000|1088000|364000|}0|}169|144|}
{2010213001|XXGoport_dst_flow|298|0|467|0|{0|}169|7|}
{2010109001|XXGobject_property_value|299|0|468|0|{0|TrackingThumbprint|72|}1|170|}
