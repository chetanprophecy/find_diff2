@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|148|rel_count|264|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|AB_DML_DEFS||24|3|Kc||{0|}}
{30001002|XXparameter|AB_CATALOG||3|2|EK$|Catalog file containing all the lookups that will be used in the XFR|{0|}}
{30001002|XXparameter|TARGET_NAME||3|9|FK|@{0|}}
{30001002|XXparameter|INPUT_CLEAN_NAME|$[ re_replace(TARGET_NAME,"_d_mbr_f_clm","")]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_SYSTEM|$[ re_replace(TARGET_NAME, "[.].*", "") ]|3|9|RK|@{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|EFK||{0|}}
{30001002|XXparameter|INPUT_CLEAN_DML|$[AI_DML + "/clean." + TARGET_SYSTEM + "/clean." + INPUT_CLEAN_NAME + ".dml" ]|3|9|RK|@{0|}}
{30001002|XXparameter|INPUT_CLEAN_FILE|$[ AI_MFS + "/clean." + TARGET_SYSTEM + "/clean." + INPUT_CLEAN_NAME + "." + RUN_ID + ".dat.gz" ]|3|9|RFK|@{0|}}
{30001002|XXparameter|MAPPING_XFR|@3|9|RFK|@{0|}}
{30001002|XXparameter|OUTPUT_CLEAN_FILE_PATH|$[AI_MFS+"/clean."+TARGET_SYSTEM+"/clean."+TARGET_NAME+"."+RUN_ID+".dat.gz"]|3|9|RK|Ful path of the input file to be transformed. This supports file patterns also, e.g. $AI_SERIAL_PENDING/source.*.YYYYMMDD.dat|{0|}}
{30001002|XXparameter|OUTPUT_CLEAN_FILE_DML|$[AI_DML+"/clean."+TARGET_SYSTEM+"/clean."+TARGET_NAME+".dml"]|18|9|RK|File containing the record format of the input file.|{0|}}
{30001002|XXparameter|LOOKUP_KEY_D_MBR|\{carrier_id; account_id; employer_group_id; mbr_id\}|18|9|K|@{0|}}
{30001002|XXparameter|LOOKUP_ICFF_FILE_D_MBR|$PUB_DATAHUB_MFS_LOOKUP/ids/ids_common/one/d_member.dat.gz|3|9|K|@{0|}}
{30001002|XXparameter|LOOKUP_ICFF_FILE_DML_D_MBR|$PUB_DATAHUB_DML/ids_common/ids_common.d_member.dml|3|9|K|@{0|}}
{30001002|XXparameter|IDS_LOOKUP_DATASET_DML_D_MBR|$[read_type(LOOKUP_ICFF_FILE_DML_D_MBR)]|3|9|K|@{0|}}
{30001002|XXparameter|LOOKUP_ICFF_FILE_RCEX1P|$PUB_DATAHUB_MFS_LOOKUP/ids/ids_rxclaim/one/f_claim_transaction.reduced.dat.gz|3|9|K|@{0|}}
{30001002|XXparameter|LOOKUP_ICFF_FILE_DML_RCEX1P|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.f_claim_transaction.reduced.dml|3|9|K|@{0|}}
{30001002|XXparameter|IDS_LOOKUP_DATASET_DML_RCEX1P|$[read_type(LOOKUP_ICFF_FILE_DML_RCEX1P)]|3|9|K|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|PBSK_MAX_CORE_VALUE|$[if(string_like(INPUT_CLEAN_NAME,"%rcex4p%")) 1610612736 else AI_SORT_MAX_CORE]|3|9|FK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|f_mpd_claim_transaction|sbugade|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1353000|587000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{2|1|1|}Job 'get.join_icff.f_mpd' Execution Status Report

Job completed successfully at Thursday, August 17, 2017 09:01:12
Run performed by user sbugade
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{0|}16469|2065|}}
{2010243001|XXGwatcher|6|0|11|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}16462|17|}}
{2010243001|XXGwatcher|8|0|15|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}16451|17|}}
{2010243001|XXGwatcher|10|0|19|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}16463|17|}}
{2010243001|XXGwatcher|12|0|23|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}16471|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}16472|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}16467|2065|}}
{2010243001|XXGwatcher|16|0|31|0|{@{}@1|100|-1||0|}}
{2010503005|XXGfvertex|17|0|33|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Block-Compressed_Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|$IDS_LOOKUP_DATASET_DML_D_MBR|3|9|j|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|1|l|@{0|}}
}}@0|@412000|93000|0|0|0|0|16188|IDS_D_MBR_LKP_TPL|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|18|0|35|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|True|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|block_compressed|True|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010503005|XXGfvertex|19|0|37|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Block-Compressed_Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|1|l|@{0|}}
{30001002|XXparameter|RecordFormat|$IDS_LOOKUP_DATASET_DML_RCEX1P|3|9||@{0|}}
}}@0|@637000|98000|0|0|0|0|16372|IDS_F_CLM_LKP_TPL|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|20|0|39|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|True|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|block_compressed|True|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010501005|XXGpvertex|21|0|41|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "$\{PUB_DXF_DML\}/generic_data_types.dml" ;

let lookup_identifier_type current_lookup = lookup_not_loaded();
let string("") datafile="$\{LOOKUP_ICFF_FILE_D_MBR\}";
let string("") indexfile=this_partition_path(string_replace("$\{LOOKUP_ICFF_FILE_D_MBR\}",".dat.gz", ".idx"));

type lookup_record_type = $\{IDS_LOOKUP_DATASET_DML_D_MBR\};

out::reformat(in)=
begin 
  let lookup_record_type lookup_record_value = allocate_with_nulls();
  let lookup_record_type exact_record_value=allocate_with_defaults();
  let lookup_record_type exact_next_record_value=allocate_with_nulls();
  
  let unsigned integer(8) dxf_hk_part1 = in.dxf_hk_part1;
  let unsigned integer(8) dxf_hk_part2 = in.dxf_hk_part2;

  let decimal("") match_count = 0 ;
  if (current_lookup == lookup_not_loaded()) 
  current_lookup = lookup_load(this_partition_path(datafile) ,indexfile, "IDS_D_MBR_LKP_TPL"); 

  lookup_record_value = if (current_lookup != lookup_not_loaded() ) lookup_last(current_lookup, "IDS_D_MBR_LKP_TPL", dxf_hk_part1) else allocate_with_defaults() ;
  exact_record_value=allocate_with_defaults();
  exact_record_value = if (lookup_record_value.dxf_hk_part1 ==0 ) lookup_record_value               // No Match found on half hash key , So this is insert record.
                      else if  ( dxf_hk_part2 == lookup_record_value.dxf_hk_part2 ) lookup_record_value  //A match is found on dxf part1 as well as dxf part2 keys , this is an exact match in first inetration itself 
                      else                                                                        //A Match is found on half hash key but not on full hash key, find exact match inside iteration  .
                      begin
                        match_count=lookup_count(current_lookup, "IDS_D_MBR_LKP_TPL", dxf_hk_part1);
                          begin block exact_record_match
                             for (let int k, k < match_count)
                               begin 
                                exact_next_record_value = if( k == 0 ) lookup_last(current_lookup, "IDS_D_MBR_LKP_TPL", dxf_hk_part1) else lookup_previous(current_lookup,"IDS_D_MBR_LKP_TPL");
                                 if ( dxf_hk_part2 == exact_next_record_value.dxf_hk_part2 ) 
                                  begin
                                        exact_record_value = exact_next_record_value;
                                        exit  exact_record_match;
                                  end
                                                                                                 
                             end
                          end block exact_record_match
                       result :: exact_record_value ;
                       end;
 // out.is_match :: if( exact_record_value.dxf_hk_part1 == 0 and exact_record_value.dxf_hk_part2==0 ) 0 else 1 ;  
  //out.dxf_hk_part1 :1: in.dxf_hk_part1;
  //out.dxf_hk_part2 :2: in.dxf_hk_part2;
  out.mbr_hic_cd :: exact_record_value.mbr_hic_cd;
  //out.src_env_sk :: exact_record_value.src_env_sk;
  out.* :4: in.* ;
end ;|3|3|c|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|1105000|200000|0|0|0|0|16456|LOOKUP         On D_MEMBER IDS|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|22|0|43|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|23|0|46|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|24|0|48|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|25|0|50|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|26|0|52|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|27|0|55|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|28|0|57|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|29|0|61|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|30|0|64|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|31|0|67|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|32|0|70|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|33|0|73|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_CLEAN_FILE_PATH|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/clean.$TARGET_SYSTEM/clean.$TARGET_NAME.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$OUTPUT_CLEAN_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@1|@1264961|477000|1153000|334000|56000|50000|16468|final clean file|Ab Initio Software||1|2370|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|34|0|75|0|{@{}@1143000|354000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|35|0|78|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|36|0|80|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|37|0|83|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|doc_transform|out0,reject0,error0,log :: document(in) =
begin
out0.* :: in.*;
end;|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|$\{MAPPING_XFR\}|3|3|c|@{0|}}
{30001002|XXparameter|out0_metadata|$[join_types('record   
  unsigned integer(8)  dxf_hk_part1 =  0;
  unsigned integer(8)  dxf_hk_part2 =  0;  
  unsigned integer(8)  f_clm_dxf_hk_part1 =  0;
  unsigned integer(8)  f_clm_dxf_hk_part2 =  0; end;', read_file("$OUTPUT_CLEAN_FILE_DML")) ]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|242000|209000|0|0|0|0|16450|RFMT: Transform Driver|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|38|0|85|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|39|0|88|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|40|0|90|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|41|0|92|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|42|0|94|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|43|0|97|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|44|0|99|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|45|0|103|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|46|0|106|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|47|0|109|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|48|0|112|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|49|0|115|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|file:$INPUT_CLEAN_DML|3|2|f$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_CLEAN_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$INPUT_CLEAN_FILE|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
}}@0|@41000|240000|0|0|0|0|16470|input file|Ab Initio Software|@1|2370|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|50|0|117|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|51|0|120|0|{Represents one file, many files, or a multifile of intermediate results that your graph writes and saves for review.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|52|0|122|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|53|0|129|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "$\{PUB_DXF_DML\}/generic_data_types.dml" ;

let lookup_identifier_type current_lookup = lookup_not_loaded();
let string("") datafile="$\{LOOKUP_ICFF_FILE_RCEX1P\}";
let string("") indexfile=this_partition_path(string_replace("$\{LOOKUP_ICFF_FILE_RCEX1P\}",".dat.gz", ".idx"));

type lookup_record_type = $\{IDS_LOOKUP_DATASET_DML_RCEX1P\};

out::reformat(in)=
begin 
  let lookup_record_type lookup_record_value = allocate_with_nulls();
  let lookup_record_type exact_record_value=allocate_with_defaults();
  let lookup_record_type exact_next_record_value=allocate_with_nulls();
  
  let unsigned integer(8) dxf_hk_part1 = in.f_clm_dxf_hk_part1;
  let unsigned integer(8) dxf_hk_part2 = in.f_clm_dxf_hk_part2;

  let decimal("") match_count = 0 ;
  if (current_lookup == lookup_not_loaded()) 
  current_lookup = lookup_load(this_partition_path(datafile) ,indexfile, "IDS_F_CLM_LKP_TPL"); 

  lookup_record_value = if (current_lookup != lookup_not_loaded() ) lookup_last(current_lookup, "IDS_F_CLM_LKP_TPL", dxf_hk_part1) else allocate_with_defaults() ;
  exact_record_value=allocate_with_defaults();
  exact_record_value = if (lookup_record_value.dxf_hk_part1 ==0 ) lookup_record_value               // No Match found on half hash key , So this is insert record.
                      else if  ( dxf_hk_part2 == lookup_record_value.dxf_hk_part2 ) lookup_record_value  //A match is found on dxf part1 as well as dxf part2 keys , this is an exact match in first inetration itself 
                      else                                                                        //A Match is found on half hash key but not on full hash key, find exact match inside iteration  .
                      begin
                        match_count=lookup_count(current_lookup, "IDS_F_CLM_LKP_TPL", dxf_hk_part1);
                          begin block exact_record_match
                             for (let int k, k < match_count)
                               begin 
                                exact_next_record_value = if( k == 0 ) lookup_last(current_lookup, "IDS_F_CLM_LKP_TPL", dxf_hk_part1) else lookup_previous(current_lookup,"IDS_F_CLM_LKP_TPL");
                                 if ( dxf_hk_part2 == exact_next_record_value.dxf_hk_part2 ) 
                                  begin
                                        exact_record_value = exact_next_record_value;
                                        exit  exact_record_match;
                                  end
                                                                                                 
                             end
                          end block exact_record_match
                       result :: exact_record_value ;
                       end;
  //out.is_match :: if( exact_record_value.dxf_hk_part1 == 0 and exact_record_value.dxf_hk_part2==0 ) 0 else 1 ;  
  out.prod_sk :: if( exact_record_value.dxf_hk_part1 == 0 and exact_record_value.dxf_hk_part2==0 ) -1 else exact_record_value.prod_sk;
  out.compound_sk :: if( exact_record_value.dxf_hk_part1 == 0 and exact_record_value.dxf_hk_part2==0 ) -1 else exact_record_value.compound_sk;
  out.app_due_amt :: if( exact_record_value.dxf_hk_part1 == 0 and exact_record_value.dxf_hk_part2==0 ) 0 else exact_record_value.app_due_amt;
  out.clt_due_amt :: if( exact_record_value.dxf_hk_part1 == 0 and exact_record_value.dxf_hk_part2==0 ) 0 else exact_record_value.clt_due_amt;
  out.filled_dt :: if( exact_record_value.dxf_hk_part1 == 0 and exact_record_value.dxf_hk_part2==0 ) "19000101" else exact_record_value.filled_dt;
  out.filled_dt_sk :: if( exact_record_value.dxf_hk_part1 == 0 and exact_record_value.dxf_hk_part2==0 ) -1 else exact_record_value.filled_dt_sk;
  out.* :4: in.* ;
end ;|3|3|c|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|685000|440000|0|0|0|0|16466|LOOKUP                                                           On F_CLAIM_TRANSACTION_REDUCED IDS|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|54|0|131|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|55|0|134|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|56|0|136|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|57|0|138|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|58|0|140|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|59|0|143|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|60|0|145|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|61|0|149|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|62|0|152|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|63|0|155|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|64|0|158|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|65|0|165|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|Key|\{dxf_hk_part1\}|19|1|FKl|@{0|}}
{30001002|XXparameter|Max_core|$PBSK_MAX_CORE_VALUE|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@781000|221000|0|0|481000|303000|16464|PBKS:D_MBR          \{dxf_hk_part1\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|66|0|167|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|67|0|169|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|68|0|171|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|69|0|174|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|70|0|178|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|71|0|180|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|72|0|182|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|73|0|187|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|74|0|191|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|75|0|195|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|76|0|197|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|77|0|199|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|78|0|201|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|79|0|204|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|80|0|206|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|81|0|208|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|82|0|211|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|83|0|216|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|84|0|218|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|85|0|220|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|86|0|223|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|87|0|225|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|88|0|228|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|89|0|234|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|90|0|237|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|91|0|242|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Key|\{f_clm_dxf_hk_part1\}|19|2|RF$|Field to partition on|{0|}}
{30001002|XXparameter|InputLayout||9|8|RFs=||{0|}}
{30001002|XXparameter|Max_core|$PBSK_MAX_CORE_VALUE|1|2|F$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|OutputLayout||9|8|RFs=||{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@247500|458500|0|0|481000|303000|16473|PBKS:F_CLM             \{dxf_hk_part1\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|666000|364000|3|}}
{2010210004|XXGflow|92|0|244|0|{@{}@384|.5|.5|{0|}10|36|}}
{2010600005|XXGgraph|93|0|246|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Checkpointed_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{f_clm_dxf_hk_part1\}|3|2|$|@{0|}}
}}@0|@286609|119022|0|0|454000|278000|11|Checkpointed Sort|Ab Initio|Built-in 2.1:|1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|454000|278000|5|}}
{2010210004|XXGflow|94|0|248|0|{@{}@384|.5|.5|{8|196000|140000|226000|140000|231000|140000|261000|140000|}4|17|}}
{2010210004|XXGflow|95|0|250|0|{@{}@384|.5|.5|{8|196000|174000|216000|174000|241000|174000|261000|174000|}5|17|}}
{2010501005|XXGpvertex|96|0|252|0|{Strings read from the 'irun' port are interpreted as the names of files which are read, merged, and written to the 'out' port.  The files must already have been sorted by the PartialSort component, and MergeRuns must be have the same layout as the PartialSort.   Ordering of records is specified by parameter 'collator'.  The 'out' port of PartialSort should be connected to the 'in' port of MergeRuns for propagation of record type information.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@291000|151000|272000|124000|124000|68000|3|Merge Runs|Ab Initio Software|Base system version 2.1 and later|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|97|0|254|0|{@{}@395000|152000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|98|0|256|0|{@{}@262000|135000|11000|11000|in|0.0|@@@1936|0|}}
{2010202004|XXGiport|99|0|259|0|{@{}@262000|169000|11000|11000|irun|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|100|0|265|0|{The flows connected to the 'in' port are read, sorted, and written to one or more temporary files.  The names of the temporary files are written to the 'orun' port for later use by the MergeRuns component.  Ordering of records is specified by parameter 'collator'.  The 'out' port of PartialSort should be connected to the 'in' port of MergeRuns for propagation of record type information.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@82000|151000|63000|124000|123000|68000|6|Partial Sort|Ab Initio Software|Base system version 2.1 and later|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|101|0|267|0|{@{}@185000|135000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|102|0|270|0|{@{}@185000|169000|11000|11000|orun|0.0|@@@2448|0|}}
{2010202004|XXGiport|103|0|273|0|{@{}@53000|152000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|104|0|278|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|105|0|281|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|106|0|285|0|{Use this subgraph component instead of a  Sort component to add a checkpoint between the sorting and merging phases of a two-pass sort.

COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|checksort|3|2|RH$||{0|}}
{30001002|XXparameter|key||19|2|RFs$|Field(s) to merge on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|F$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@382609|224022|0|0|454000|278000|0|Checkpointed Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|454000|278000|7|}}
{2010210004|XXGflow|107|0|287|0|{@{}@384|.5|.5|{8|196000|140000|226000|140000|231000|140000|261000|140000|}4|17|}}
{2010210004|XXGflow|108|0|289|0|{@{}@384|.5|.5|{8|196000|174000|216000|174000|241000|174000|261000|174000|}5|17|}}
{2010501005|XXGpvertex|109|0|291|0|{Strings read from the 'irun' port are interpreted as the names of files which are read, merged, and written to the 'out' port.  The files must already have been sorted by the PartialSort component, and MergeRuns must be have the same layout as the PartialSort.   Ordering of records is specified by parameter 'collator'.  The 'out' port of PartialSort should be connected to the 'in' port of MergeRuns for propagation of record type information.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\MergeRuns.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|irun_metadata|string('\\n')|3|1|l|@{0|}}
}}@1|@252000|104000|272000|124000|124000|68000|3|Merge Runs|Ab Initio Software|Base system version 2.1 and later|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|110|0|293|0|{@{}@395000|152000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|111|0|295|0|{@{}@262000|135000|11000|11000|in|0.0|@@@1936|0|}}
{2010202004|XXGiport|112|0|298|0|{@{}@262000|169000|11000|11000|irun|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|113|0|301|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|merge-runs|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field(s) to merge on|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|irun_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in,irun)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|_propagation|metadata type: irun = "string('\\\\n')"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|114|0|303|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|115|0|306|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010202004|XXGiport|116|0|309|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|irun|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|117|0|313|0|{The flows connected to the 'in' port are read, sorted, and written to one or more temporary files.  The names of the temporary files are written to the 'orun' port for later use by the MergeRuns component.  Ordering of records is specified by parameter 'collator'.  The 'out' port of PartialSort should be connected to the 'in' port of MergeRuns for propagation of record type information.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\PartialSort.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|orun_metadata|string('\\n')|3|1|l|@{0|}}
}}@0|@43000|104000|63000|124000|123000|68000|6|Partial Sort|Ab Initio Software|Base system version 2.1 and later|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|118|0|315|0|{@{}@185000|135000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|119|0|318|0|{@{}@185000|169000|11000|11000|orun|0.0|@@@2448|0|}}
{2010202004|XXGiport|120|0|321|0|{@{}@53000|152000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|121|0|323|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|partial-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field(s) to sort on|{0|}}
{30001002|XXparameter|max_core||1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|orun_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,orun::document(in)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|_propagation|metadata type: orun = "string('\\\\n')"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|122|0|325|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|123|0|328|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|orun|0.0|@@@2448|0|}}
{2010202004|XXGiport|124|0|331|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|125|0|336|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|126|0|339|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|127|0|342|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@156000|141000|81000|138000|136000|68000|7|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|128|0|344|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|129|0|347|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|130|0|349|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|131|0|351|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|132|0|354|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|133|0|361|0|{@{}@0|0|0|0|out0|.45054945054945056|@@@14352|0|}}
{2010202004|XXGiport|134|0|365|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|135|0|371|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";

out::reformat(in)=
begin
  let hash_key_combine_type dxf_hk = reinterpret(hash_value(in, $LOOKUP_KEY_D_MBR, "murmur"));
  let hash_key_combine_type dxf_hk_f_clm = reinterpret(hash_value(in, \{claim_nbr; claim_seq_nbr; claim_stat_id; src_env_sk\}, "murmur"));
  
  out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
  out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
  
  out.f_clm_dxf_hk_part1 :: dxf_hk_f_clm.dxf_hk_part1;
  out.f_clm_dxf_hk_part2 :: dxf_hk_f_clm.dxf_hk_part2;
  out.* :: in.*;   
end;|3|9||@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|504000|200000|0|0|0|0|16453|RFMT: Calculate Hash On CAGM Fields|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|136|0|373|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|137|0|376|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|138|0|378|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|139|0|380|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|140|0|382|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|141|0|385|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|142|0|387|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|143|0|391|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|144|0|394|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|145|0|397|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|146|0|400|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010110002|XXGconstant|147|0|410|0|{@{}@{1|6152821|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010244001|XXGflow_watcher_watcher|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_2|}1|7|}
{2010244001|XXGflow_watcher_watcher|7|0|14|0|{}7|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_3|}1|9|}
{2010244001|XXGflow_watcher_watcher|9|0|18|0|{}9|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_4|}1|11|}
{2010244001|XXGflow_watcher_watcher|11|0|22|0|{}11|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_5|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_6|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_8|}1|15|}
{2010244001|XXGflow_watcher_watcher|15|0|30|0|{}15|16|}
{2010601001|XXGgraph_vertex_vertex|16|0|32|0|{IDS_D_MBR_LKP_TPL|}1|17|}
{2010007001|XXGobject_proto_object|17|0|34|0|{}17|18|}
{2010601001|XXGgraph_vertex_vertex|18|0|36|0|{IDS_F_CLM_LKP_TPL|}1|19|}
{2010007001|XXGobject_proto_object|19|0|38|0|{}19|20|}
{2010601001|XXGgraph_vertex_vertex|20|0|40|0|{LOOKUP_On_D_MEMBER_IDS|}1|21|}
{2010212001|XXGvertex_oport_oport|21|0|42|0|{0|out0|}21|22|}
{2010213001|XXGoport_dst_flow|22|0|44|0|{0|}22|13|}
{2010212001|XXGvertex_oport_oport|23|0|45|0|{1|reject0|}21|23|}
{2010212001|XXGvertex_oport_oport|24|0|47|0|{2|error0|}21|24|}
{2010212001|XXGvertex_oport_oport|25|0|49|0|{3|log|}21|25|}
{2010211001|XXGvertex_iport_iport|26|0|51|0|{0|in|}21|26|}
{2010214001|XXGiport_src_flow|27|0|53|0|{0|}26|11|}
{2010007001|XXGobject_proto_object|28|0|54|0|{}21|27|}
{2010212001|XXGvertex_oport_oport|29|0|56|0|{0|out0|}27|28|}
{2010006001|XXGobject_psameas_object|30|0|58|0|{metadata|out0_metadata|1|0|}28|27|}
{2010006001|XXGobject_psameas_object|31|0|59|0|{transform0|transform0|1|0|}28|27|}
{2010212001|XXGvertex_oport_oport|32|0|60|0|{1|reject0|}27|29|}
{2010006001|XXGobject_psameas_object|33|0|62|0|{metadata|reject0_metadata|1|0|}29|27|}
{2010212001|XXGvertex_oport_oport|34|0|63|0|{2|error0|}27|30|}
{2010006001|XXGobject_psameas_object|35|0|65|0|{metadata|error0_metadata|1|0|}30|27|}
{2010212001|XXGvertex_oport_oport|36|0|66|0|{3|log|}27|31|}
{2010006001|XXGobject_psameas_object|37|0|68|0|{metadata|log_metadata|1|0|}31|27|}
{2010211001|XXGvertex_iport_iport|38|0|69|0|{0|in|}27|32|}
{2010006001|XXGobject_psameas_object|39|0|71|0|{metadata|in_metadata|1|0|}32|27|}
{2010006001|XXGobject_psameas_object|40|0|72|0|{Layout|Layout|0|0|}21|33|}
{2010211001|XXGvertex_iport_iport|41|0|74|0|{0|write|}33|34|}
{2010214001|XXGiport_src_flow|42|0|76|0|{0|}34|15|}
{2010007001|XXGobject_proto_object|43|0|77|0|{}33|35|}
{2010211001|XXGvertex_iport_iport|44|0|79|0|{0|write|}35|36|}
{2010006001|XXGobject_psameas_object|45|0|81|0|{metadata|write_metadata|1|0|}36|35|}
{2010006001|XXGobject_psameas_object|46|0|82|0|{in_metadata|out0_metadata|0|0|}21|37|}
{2010212001|XXGvertex_oport_oport|47|0|84|0|{0|out0|}37|38|}
{2010213001|XXGoport_dst_flow|48|0|86|0|{0|}38|9|}
{2010212001|XXGvertex_oport_oport|49|0|87|0|{1|reject0|}37|39|}
{2010212001|XXGvertex_oport_oport|50|0|89|0|{2|error0|}37|40|}
{2010212001|XXGvertex_oport_oport|51|0|91|0|{3|log|}37|41|}
{2010211001|XXGvertex_iport_iport|52|0|93|0|{0|in|}37|42|}
{2010214001|XXGiport_src_flow|53|0|95|0|{0|}42|5|}
{2010007001|XXGobject_proto_object|54|0|96|0|{}37|43|}
{2010212001|XXGvertex_oport_oport|55|0|98|0|{0|out0|}43|44|}
{2010006001|XXGobject_psameas_object|56|0|100|0|{metadata|out0_metadata|1|0|}44|43|}
{2010006001|XXGobject_psameas_object|57|0|101|0|{transform0|transform0|1|0|}44|43|}
{2010212001|XXGvertex_oport_oport|58|0|102|0|{1|reject0|}43|45|}
{2010006001|XXGobject_psameas_object|59|0|104|0|{metadata|reject0_metadata|1|0|}45|43|}
{2010212001|XXGvertex_oport_oport|60|0|105|0|{2|error0|}43|46|}
{2010006001|XXGobject_psameas_object|61|0|107|0|{metadata|error0_metadata|1|0|}46|43|}
{2010212001|XXGvertex_oport_oport|62|0|108|0|{3|log|}43|47|}
{2010006001|XXGobject_psameas_object|63|0|110|0|{metadata|log_metadata|1|0|}47|43|}
{2010211001|XXGvertex_iport_iport|64|0|111|0|{0|in|}43|48|}
{2010006001|XXGobject_psameas_object|65|0|113|0|{metadata|in_metadata|1|0|}48|43|}
{2010006001|XXGobject_psameas_object|66|0|114|0|{Layout|Layout|0|0|}37|49|}
{2010212001|XXGvertex_oport_oport|67|0|116|0|{0|read|}49|50|}
{2010213001|XXGoport_dst_flow|68|0|118|0|{0|}50|5|}
{2010007001|XXGobject_proto_object|69|0|119|0|{}49|51|}
{2010212001|XXGvertex_oport_oport|70|0|121|0|{0|read|}51|52|}
{2010006001|XXGobject_psameas_object|71|0|123|0|{metadata|read_metadata|1|0|}52|51|}
{2010006001|XXGobject_psameas_object|72|0|124|0|{in_metadata|read_metadata|0|0|}37|49|}
{2010006001|XXGobject_psameas_object|73|0|125|0|{reject0_metadata|read_metadata|0|0|}37|49|}
{2010006001|XXGobject_psameas_object|74|0|126|0|{out0_metadata|out0_metadata|0|0|}21|37|}
{2010006001|XXGobject_psameas_object|75|0|127|0|{reject0_metadata|out0_metadata|0|0|}21|37|}
{2010601001|XXGgraph_vertex_vertex|76|0|128|0|{LOOKUP_On_F_CLAIM_TRANSACTION_REDUCED_IDS|}1|53|}
{2010212001|XXGvertex_oport_oport|77|0|130|0|{0|out0|}53|54|}
{2010213001|XXGoport_dst_flow|78|0|132|0|{0|}54|15|}
{2010212001|XXGvertex_oport_oport|79|0|133|0|{1|reject0|}53|55|}
{2010212001|XXGvertex_oport_oport|80|0|135|0|{2|error0|}53|56|}
{2010212001|XXGvertex_oport_oport|81|0|137|0|{3|log|}53|57|}
{2010211001|XXGvertex_iport_iport|82|0|139|0|{0|in|}53|58|}
{2010214001|XXGiport_src_flow|83|0|141|0|{0|}58|14|}
{2010007001|XXGobject_proto_object|84|0|142|0|{}53|59|}
{2010212001|XXGvertex_oport_oport|85|0|144|0|{0|out0|}59|60|}
{2010006001|XXGobject_psameas_object|86|0|146|0|{metadata|out0_metadata|1|0|}60|59|}
{2010006001|XXGobject_psameas_object|87|0|147|0|{transform0|transform0|1|0|}60|59|}
{2010212001|XXGvertex_oport_oport|88|0|148|0|{1|reject0|}59|61|}
{2010006001|XXGobject_psameas_object|89|0|150|0|{metadata|reject0_metadata|1|0|}61|59|}
{2010212001|XXGvertex_oport_oport|90|0|151|0|{2|error0|}59|62|}
{2010006001|XXGobject_psameas_object|91|0|153|0|{metadata|error0_metadata|1|0|}62|59|}
{2010212001|XXGvertex_oport_oport|92|0|154|0|{3|log|}59|63|}
{2010006001|XXGobject_psameas_object|93|0|156|0|{metadata|log_metadata|1|0|}63|59|}
{2010211001|XXGvertex_iport_iport|94|0|157|0|{0|in|}59|64|}
{2010006001|XXGobject_psameas_object|95|0|159|0|{metadata|in_metadata|1|0|}64|59|}
{2010006001|XXGobject_psameas_object|96|0|160|0|{Layout|Layout|0|0|}53|33|}
{2010006001|XXGobject_psameas_object|97|0|161|0|{in_metadata|out0_metadata|0|0|}53|37|}
{2010006001|XXGobject_psameas_object|98|0|162|0|{out0_metadata|write_metadata|0|0|}53|33|}
{2010006001|XXGobject_psameas_object|99|0|163|0|{reject0_metadata|out0_metadata|0|0|}53|37|}
{2010601001|XXGgraph_vertex_vertex|100|0|164|0|{PBKS_D_MBR_dxf_hk_part1_|}1|65|}
{2010604001|XXGgraph_flow_flow|101|0|166|0|{Flow_1|}65|66|}
{2010601001|XXGgraph_vertex_vertex|102|0|168|0|{Partition_by_Key|}65|67|}
{2010212001|XXGvertex_oport_oport|103|0|170|0|{0|out|}67|68|}
{2010213001|XXGoport_dst_flow|104|0|172|0|{0|}68|66|}
{2010211001|XXGvertex_iport_iport|105|0|173|0|{0|in|}67|69|}
{2010006001|XXGobject_psameas_object|106|0|175|0|{in_metadata|out0_metadata|0|0|}67|37|}
{2010006001|XXGobject_psameas_object|107|0|176|0|{out_metadata|out0_metadata|0|0|}67|37|}
{2010601001|XXGgraph_vertex_vertex|108|0|177|0|{Sort|}65|70|}
{2010212001|XXGvertex_oport_oport|109|0|179|0|{0|out|}70|71|}
{2010211001|XXGvertex_iport_iport|110|0|181|0|{0|in|}70|72|}
{2010214001|XXGiport_src_flow|111|0|183|0|{0|}72|66|}
{2010006001|XXGobject_psameas_object|112|0|184|0|{in_metadata|out0_metadata|0|0|}70|37|}
{2010006001|XXGobject_psameas_object|113|0|185|0|{out_metadata|out0_metadata|0|0|}70|37|}
{2010212001|XXGvertex_oport_oport|114|0|186|0|{0|out0|}65|73|}
{2010216002|XXGoport_binding_oport|115|0|188|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}73|71|}
{2010213001|XXGoport_dst_flow|116|0|189|0|{0|}73|11|}
{2010211001|XXGvertex_iport_iport|117|0|190|0|{0|in0|}65|74|}
{2010215002|XXGiport_binding_iport|118|0|192|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}74|69|}
{2010214001|XXGiport_src_flow|119|0|193|0|{0|}74|7|}
{2010007001|XXGobject_proto_object|120|0|194|0|{}65|75|}
{2010604001|XXGgraph_flow_flow|121|0|196|0|{Flow_1|}75|76|}
{2010601001|XXGgraph_vertex_vertex|122|0|198|0|{Partition_by_Key|}75|77|}
{2010212001|XXGvertex_oport_oport|123|0|200|0|{0|out|}77|78|}
{2010213001|XXGoport_dst_flow|124|0|202|0|{0|}78|76|}
{2010211001|XXGvertex_iport_iport|125|0|203|0|{0|in|}77|79|}
{2010007001|XXGobject_proto_object|126|0|205|0|{}77|80|}
{2010212001|XXGvertex_oport_oport|127|0|207|0|{0|out|}80|81|}
{2010006001|XXGobject_psameas_object|128|0|209|0|{metadata|out_metadata|1|0|}81|80|}
{2010211001|XXGvertex_iport_iport|129|0|210|0|{0|in|}80|82|}
{2010006001|XXGobject_psameas_object|130|0|212|0|{metadata|in_metadata|1|0|}82|80|}
{2010006001|XXGobject_psameas_object|131|0|213|0|{Layout|InputLayout|1|0|}77|75|}
{2010006001|XXGobject_psameas_object|132|0|214|0|{key|Key|1|0|}77|75|}
{2010601001|XXGgraph_vertex_vertex|133|0|215|0|{Sort|}75|83|}
{2010212001|XXGvertex_oport_oport|134|0|217|0|{0|out|}83|84|}
{2010211001|XXGvertex_iport_iport|135|0|219|0|{0|in|}83|85|}
{2010214001|XXGiport_src_flow|136|0|221|0|{0|}85|76|}
{2010007001|XXGobject_proto_object|137|0|222|0|{}83|86|}
{2010212001|XXGvertex_oport_oport|138|0|224|0|{0|out|}86|87|}
{2010006001|XXGobject_psameas_object|139|0|226|0|{metadata|out_metadata|1|0|}87|86|}
{2010211001|XXGvertex_iport_iport|140|0|227|0|{0|in|}86|88|}
{2010006001|XXGobject_psameas_object|141|0|229|0|{metadata|in_metadata|1|0|}88|86|}
{2010006001|XXGobject_psameas_object|142|0|230|0|{Layout|OutputLayout|1|0|}83|75|}
{2010006001|XXGobject_psameas_object|143|0|231|0|{key|Key|1|0|}83|75|}
{2010006001|XXGobject_psameas_object|144|0|232|0|{max_core|Max_core|1|0|}83|75|}
{2010212001|XXGvertex_oport_oport|145|0|233|0|{0|out0|}75|89|}
{2010216002|XXGoport_binding_oport|146|0|235|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}89|84|}
{2010211001|XXGvertex_iport_iport|147|0|236|0|{0|in0|}75|90|}
{2010215002|XXGiport_binding_iport|148|0|238|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}90|79|}
{2010006001|XXGobject_psameas_object|149|0|239|0|{InputLayout|Layout|0|0|}65|49|}
{2010006001|XXGobject_psameas_object|150|0|240|0|{OutputLayout|Layout|0|0|}65|33|}
{2010601001|XXGgraph_vertex_vertex|151|0|241|0|{PBKS_F_CLM_dxf_hk_part1_|}1|91|}
{2010604001|XXGgraph_flow_flow|152|0|243|0|{Flow_2|}91|92|}
{2010601001|XXGgraph_vertex_vertex|153|0|245|0|{Checkpointed_Sort|}91|93|}
{2010604001|XXGgraph_flow_flow|154|0|247|0|{Flow_1|}93|94|}
{2010604001|XXGgraph_flow_flow|155|0|249|0|{Flow_2|}93|95|}
{2010601001|XXGgraph_vertex_vertex|156|0|251|0|{Merge_Runs|}93|96|}
{2010212001|XXGvertex_oport_oport|157|0|253|0|{0|out|}96|97|}
{2010211001|XXGvertex_iport_iport|158|0|255|0|{0|in|}96|98|}
{2010214001|XXGiport_src_flow|159|0|257|0|{0|}98|94|}
{2010211001|XXGvertex_iport_iport|160|0|258|0|{1|irun|}96|99|}
{2010214001|XXGiport_src_flow|161|0|260|0|{0|}99|95|}
{2010006001|XXGobject_psameas_object|162|0|261|0|{Layout|Layout|0|0|}96|33|}
{2010006001|XXGobject_psameas_object|163|0|262|0|{in_metadata|out0_metadata|0|0|}96|37|}
{2010006001|XXGobject_psameas_object|164|0|263|0|{out_metadata|out0_metadata|0|0|}96|37|}
{2010601001|XXGgraph_vertex_vertex|165|0|264|0|{Partial_Sort|}93|100|}
{2010212001|XXGvertex_oport_oport|166|0|266|0|{0|out|}100|101|}
{2010213001|XXGoport_dst_flow|167|0|268|0|{0|}101|94|}
{2010212001|XXGvertex_oport_oport|168|0|269|0|{1|orun|}100|102|}
{2010213001|XXGoport_dst_flow|169|0|271|0|{0|}102|95|}
{2010211001|XXGvertex_iport_iport|170|0|272|0|{0|in|}100|103|}
{2010006001|XXGobject_psameas_object|171|0|274|0|{Layout|Layout|0|0|}100|33|}
{2010006001|XXGobject_psameas_object|172|0|275|0|{in_metadata|out0_metadata|0|0|}100|37|}
{2010006001|XXGobject_psameas_object|173|0|276|0|{out_metadata|out0_metadata|0|0|}100|37|}
{2010212001|XXGvertex_oport_oport|174|0|277|0|{0|out0|}93|104|}
{2010216002|XXGoport_binding_oport|175|0|279|0|{.5|.5|{12|405000|157000|425000|157000|439000|157000|439000|159000|453000|159000|473000|159000|}8|}104|97|}
{2010211001|XXGvertex_iport_iport|176|0|280|0|{0|in0|}93|105|}
{2010215002|XXGiport_binding_iport|177|0|282|0|{.5|.5|{12|53000|157000|33000|157000|33000|158000|40000|158000|40000|159000|20000|159000|}7|}105|103|}
{2010214001|XXGiport_src_flow|178|0|283|0|{0|}105|92|}
{2010007001|XXGobject_proto_object|179|0|284|0|{}93|106|}
{2010604001|XXGgraph_flow_flow|180|0|286|0|{Flow_1|}106|107|}
{2010604001|XXGgraph_flow_flow|181|0|288|0|{Flow_2|}106|108|}
{2010601001|XXGgraph_vertex_vertex|182|0|290|0|{Merge_Runs|}106|109|}
{2010212001|XXGvertex_oport_oport|183|0|292|0|{0|out|}109|110|}
{2010211001|XXGvertex_iport_iport|184|0|294|0|{0|in|}109|111|}
{2010214001|XXGiport_src_flow|185|0|296|0|{0|}111|107|}
{2010211001|XXGvertex_iport_iport|186|0|297|0|{1|irun|}109|112|}
{2010214001|XXGiport_src_flow|187|0|299|0|{0|}112|108|}
{2010007001|XXGobject_proto_object|188|0|300|0|{}109|113|}
{2010212001|XXGvertex_oport_oport|189|0|302|0|{0|out|}113|114|}
{2010006001|XXGobject_psameas_object|190|0|304|0|{metadata|out_metadata|1|0|}114|113|}
{2010211001|XXGvertex_iport_iport|191|0|305|0|{0|in|}113|115|}
{2010006001|XXGobject_psameas_object|192|0|307|0|{metadata|in_metadata|1|0|}115|113|}
{2010211001|XXGvertex_iport_iport|193|0|308|0|{1|irun|}113|116|}
{2010006001|XXGobject_psameas_object|194|0|310|0|{metadata|irun_metadata|1|0|}116|113|}
{2010006001|XXGobject_psameas_object|195|0|311|0|{key|key|1|0|}109|106|}
{2010601001|XXGgraph_vertex_vertex|196|0|312|0|{Partial_Sort|}106|117|}
{2010212001|XXGvertex_oport_oport|197|0|314|0|{0|out|}117|118|}
{2010213001|XXGoport_dst_flow|198|0|316|0|{0|}118|107|}
{2010212001|XXGvertex_oport_oport|199|0|317|0|{1|orun|}117|119|}
{2010213001|XXGoport_dst_flow|200|0|319|0|{0|}119|108|}
{2010211001|XXGvertex_iport_iport|201|0|320|0|{0|in|}117|120|}
{2010007001|XXGobject_proto_object|202|0|322|0|{}117|121|}
{2010212001|XXGvertex_oport_oport|203|0|324|0|{0|out|}121|122|}
{2010006001|XXGobject_psameas_object|204|0|326|0|{metadata|out_metadata|1|0|}122|121|}
{2010212001|XXGvertex_oport_oport|205|0|327|0|{1|orun|}121|123|}
{2010006001|XXGobject_psameas_object|206|0|329|0|{metadata|orun_metadata|1|0|}123|121|}
{2010211001|XXGvertex_iport_iport|207|0|330|0|{0|in|}121|124|}
{2010006001|XXGobject_psameas_object|208|0|332|0|{metadata|in_metadata|1|0|}124|121|}
{2010006001|XXGobject_psameas_object|209|0|333|0|{key|key|1|0|}117|106|}
{2010006001|XXGobject_psameas_object|210|0|334|0|{max_core|max_core|1|0|}117|106|}
{2010212001|XXGvertex_oport_oport|211|0|335|0|{0|out0|}106|125|}
{2010216002|XXGoport_binding_oport|212|0|337|0|{.5|.5|{12|405000|157000|425000|157000|439000|157000|439000|159000|453000|159000|473000|159000|}0|}125|110|}
{2010211001|XXGvertex_iport_iport|213|0|338|0|{0|in0|}106|126|}
{2010215002|XXGiport_binding_iport|214|0|340|0|{.5|.5|{12|53000|157000|33000|157000|33000|158000|40000|158000|40000|159000|20000|159000|}0|}126|120|}
{2010601001|XXGgraph_vertex_vertex|215|0|341|0|{Partition_by_Key|}91|127|}
{2010212001|XXGvertex_oport_oport|216|0|343|0|{0|out|}127|128|}
{2010213001|XXGoport_dst_flow|217|0|345|0|{0|}128|92|}
{2010211001|XXGvertex_iport_iport|218|0|346|0|{0|in|}127|129|}
{2010007001|XXGobject_proto_object|219|0|348|0|{}127|130|}
{2010212001|XXGvertex_oport_oport|220|0|350|0|{0|out|}130|131|}
{2010006001|XXGobject_psameas_object|221|0|352|0|{metadata|out_metadata|1|0|}131|130|}
{2010211001|XXGvertex_iport_iport|222|0|353|0|{0|in|}130|132|}
{2010006001|XXGobject_psameas_object|223|0|355|0|{metadata|in_metadata|1|0|}132|130|}
{2010006001|XXGobject_psameas_object|224|0|356|0|{Layout|InputLayout|1|0|}127|91|}
{2010006001|XXGobject_psameas_object|225|0|357|0|{in_metadata|out0_metadata|0|0|}127|37|}
{2010006001|XXGobject_psameas_object|226|0|358|0|{key|Key|1|0|}127|91|}
{2010006001|XXGobject_psameas_object|227|0|359|0|{out_metadata|out0_metadata|0|0|}127|37|}
{2010212001|XXGvertex_oport_oport|228|0|360|0|{0|out0|}91|133|}
{2010216002|XXGoport_binding_oport|229|0|362|0|{.5|.5|{0|}9|}133|104|}
{2010213001|XXGoport_dst_flow|230|0|363|0|{0|}133|14|}
{2010211001|XXGvertex_iport_iport|231|0|364|0|{0|in0|}91|134|}
{2010215002|XXGiport_binding_iport|232|0|366|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}8|}134|129|}
{2010214001|XXGiport_src_flow|233|0|367|0|{0|}134|13|}
{2010006001|XXGobject_psameas_object|234|0|368|0|{InputLayout|Layout|0|0|}91|33|}
{2010006001|XXGobject_psameas_object|235|0|369|0|{OutputLayout|Layout|0|0|}91|33|}
{2010601001|XXGgraph_vertex_vertex|236|0|370|0|{RFMT_Calculate_Hash_On_CAGM_Fields|}1|135|}
{2010212001|XXGvertex_oport_oport|237|0|372|0|{0|out0|}135|136|}
{2010213001|XXGoport_dst_flow|238|0|374|0|{0|}136|7|}
{2010212001|XXGvertex_oport_oport|239|0|375|0|{1|reject0|}135|137|}
{2010212001|XXGvertex_oport_oport|240|0|377|0|{2|error0|}135|138|}
{2010212001|XXGvertex_oport_oport|241|0|379|0|{3|log|}135|139|}
{2010211001|XXGvertex_iport_iport|242|0|381|0|{0|in|}135|140|}
{2010214001|XXGiport_src_flow|243|0|383|0|{0|}140|9|}
{2010007001|XXGobject_proto_object|244|0|384|0|{}135|141|}
{2010212001|XXGvertex_oport_oport|245|0|386|0|{0|out0|}141|142|}
{2010006001|XXGobject_psameas_object|246|0|388|0|{metadata|out0_metadata|1|0|}142|141|}
{2010006001|XXGobject_psameas_object|247|0|389|0|{transform0|transform0|1|0|}142|141|}
{2010212001|XXGvertex_oport_oport|248|0|390|0|{1|reject0|}141|143|}
{2010006001|XXGobject_psameas_object|249|0|392|0|{metadata|reject0_metadata|1|0|}143|141|}
{2010212001|XXGvertex_oport_oport|250|0|393|0|{2|error0|}141|144|}
{2010006001|XXGobject_psameas_object|251|0|395|0|{metadata|error0_metadata|1|0|}144|141|}
{2010212001|XXGvertex_oport_oport|252|0|396|0|{3|log|}141|145|}
{2010006001|XXGobject_psameas_object|253|0|398|0|{metadata|log_metadata|1|0|}145|141|}
{2010211001|XXGvertex_iport_iport|254|0|399|0|{0|in|}141|146|}
{2010006001|XXGobject_psameas_object|255|0|401|0|{metadata|in_metadata|1|0|}146|141|}
{2010006001|XXGobject_psameas_object|256|0|402|0|{Layout|Layout|0|0|}135|49|}
{2010006001|XXGobject_psameas_object|257|0|403|0|{in_metadata|out0_metadata|0|0|}135|37|}
{2010006001|XXGobject_psameas_object|258|0|404|0|{out0_metadata|out0_metadata|0|0|}135|37|}
{2010006001|XXGobject_psameas_object|259|0|405|0|{reject0_metadata|out0_metadata|0|0|}135|37|}
{2010601001|XXGgraph_vertex_vertex|260|0|406|0|{RFMT_Transform_Driver|}1|37|}
{2010601001|XXGgraph_vertex_vertex|261|0|407|0|{final_clean_file|}1|33|}
{2010601001|XXGgraph_vertex_vertex|262|0|408|0|{input_file|}1|49|}
{2010109001|XXGobject_property_value|263|0|409|0|{0|TrackingThumbprint|72|}1|147|}
