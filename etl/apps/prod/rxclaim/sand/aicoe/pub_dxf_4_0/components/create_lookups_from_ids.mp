@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|106|rel_count|176|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{Subgraph created from graph "Create Pre LookUps for BRE Using IDS"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|ICFF_LKP_TEMPLATE_NAME|IDS_Lkp0|3|9|RFK|Provide ICFF Template name|{0|}}
{30001002|XXparameter|IDS_ICFF_DATASET|$[string_split(BRE_ICFF_LOOKUP_LIST,",")[0]]|3|9|RFK|Provide ICFF Dataset for which lookup has to be done|{0|}}
{30001002|XXparameter|ICFF_LOOKUP_RECORD_TYPE|$[read_type(LOOKUP_RECORD_VECTOR[0])]|3|9|RFK|$[read_type(LOOKUP_RECORD_VECTOR[0]]|{0|}}
{30001002|XXparameter|IDS_LKP_XFR|include '~$PUB_DXF_DML/generic_data_types.dml';
include '~$PUB_DXF_XFR/common_functions.xfr'; 

type lookup_record_type = $[read_type(LOOKUP_RECORD_VECTOR[0])];
let string("") v_icff_file_nm=string_concat($"PUB_DATAHUB_MFS_LOOKUP","/ids/",string_split($"IDS_ICFF_DATASET",".")[0],"/one/",string_split($"IDS_ICFF_DATASET",".")[1],".dat.gz");
let string("") v_icff_idx_nm=string_concat($"PUB_DATAHUB_MFS_LOOKUP","/ids/",string_split($"IDS_ICFF_DATASET",".")[0],"/one/",string_split($"IDS_ICFF_DATASET",".")[1],".idx");
let string("") v_icff_template_nm=$"ICFF_LKP_TEMPLATE_NAME";

let hash_key_type v_hash_key_full= [vector 0 ,0 ];
let  unsigned integer(8) v_hash_key_half=0;
let lookup_identifier_type current_lookup = lookup_not_loaded();
let lookup_record_type lookup_record_value = allocate_with_nulls();
let lookup_record_type exact_record_value=allocate_with_defaults();
let lookup_record_type exact_next_record_value=allocate_with_nulls();


out::reformat(in) =
begin
 let integer(2) match_count=0;
 exact_record_value=allocate_with_defaults();
 if (current_lookup == lookup_not_loaded()) 
     current_lookup = lookup_load(this_partition_path(v_icff_file_nm),this_partition_path(v_icff_file_nm),$"ICFF_LKP_TEMPLATE_NAME" );  
 lookup_record_value = first_defined(lookup_last(current_lookup, $"ICFF_LKP_TEMPLATE_NAME", in.dxf_hk_part1),allocate_with_defaults() );
 exact_record_value=allocate_with_defaults();
 exact_record_value = if (lookup_record_value.dxf_hk_part1 ==0 ) lookup_record_value               // No Match found on half hash key , So this is insert record.
                      else if  ( in.dxf_hk_part2 == lookup_record_value.dxf_hk_part2 ) lookup_record_value  //A match is found on dxf part1 as well as dxf part2 keys , this is an exact match in first iteration itself 
                      else                                                                        //A Match is found on half hash key but not on full hash key, find exact match inside iteration  .
                      begin
                        match_count=lookup_count(current_lookup, $"ICFF_LKP_TEMPLATE_NAME", in.dxf_hk_part1);
                          begin block exact_record_match
                             for (let int k, k < match_count)
                               begin 
                                exact_next_record_value = if( k == 0 ) lookup_last(current_lookup, $"ICFF_LKP_TEMPLATE_NAME", in.dxf_hk_part1) else lookup_previous(current_lookup,$"ICFF_LKP_TEMPLATE_NAME");
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
     
  
//Asign Flags to identify change records 
      //Asign Flags to identify change records 
      out.* :1:   if (exact_record_value.dxf_hk_part1 == 0 or exact_record_value.dxf_hk_part2 ==0  )   in.* ;
      out.* :2:   if (exact_record_value.dxf_hk_part1 == 0 or exact_record_value.dxf_hk_part2 ==0  )   exact_record_value.* ;
      
                 

end|3|9|RFK|MAPPING XFR that will be used |{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|!ab_compatibility|3.2.6.4|3|9|P|@{0|}}
{30001002|XXparameter|SRC_NATURAL_KEY||3|9|RFK|@{0|}}
{30001002|XXparameter|IS_ENABLE|1|1|9|RFK|@{0|}}
}}@0|@385000|325750|0|0|0|0|7171|Lookup with IDS-1|msing114|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1363000|424000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{1|1|}Job 'create_lookups_from_ids' Execution Status Report

Job completed successfully at Tuesday, September 20, 2016 17:17:13
Run performed by user msing114
||# Make sure the serial directories exist.
mkdir -m 2775 -p \\
  "$AI_SERIAL_LOG/map.$SOURCE_SYSTEM" \\
  "$AI_SERIAL_REJECT/map.$SOURCE_SYSTEM"

# Make sure the multifile directories exist.
for d in "$AI_MFS/ilm" "$AI_MFS_REJECT/map.$SOURCE_SYSTEM"; do
  d="$(echo $d \| sed 's/mfile://')"
  p="$(dirname "$d ")"
  [[ -d "$p" ]] \|\| m_mkdir -mode 2775 "$p"
  [[ -d "$d" ]] \|\| m_mkdir -mode 2775 "$d"
done

export AB_REPORT="summary=$AI_SERIAL_LOG/map.$SOURCE_SYSTEM/map.$SOURCE_LOWER.$ILM_NAME.summary.log $AB_REPORT"

# This is a hack to make sure that all *_LOOKUP parameters are exported to the environment so that AB_CATALOG works as expected.
eval "$(set \| sed -n '/_LOOKUP=/s/\\(^[^=]*\\).*/export \\1="$\\1"/p')"
|if [[ ( x"$AB_APPCONF_EXECUTION" = x"true" \|\| x"$AB_APPCONF_EXECUTION" = x"True" ) && -f "$AI_RAW_TRACKING_FILE" ]]; then
  # These grep patterns need tweaking.
  AB_REPORT="monitor,flows totals" m_report_tracking -phase-end "$AI_RAW_TRACKING_FILE" \| egrep '_Filter * out\|Map_.** out0$\| dup\| [out0%]*reject\| second' 1>&2
fi


|@CLAIM_DW_SBOXSt|33206783|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@dev-apsrd6487- 3.2.6||||1|60|0|1|1|0|0|0|0|0|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|32768|120|1|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@There is a possibilty of 
duplicate records in smaller lookups|913000|210000|0|0|0|0|6995|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|32768|120|1|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}6989|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}6987|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}6986|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}6992|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}6993|19|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}6976|17|}}
{2010501005|XXGpvertex|13|0|25|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
}}@0|Dedup Sorted|1076000|60000|0|0|0|0|6994|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|14|0|27|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|15|0|30|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|16|0|32|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|17|0|34|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|18|0|36|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|19|0|38|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|20|0|41|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
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
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|21|0|43|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|22|0|46|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|23|0|49|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|24|0|52|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|25|0|55|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|26|0|58|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|27|0|61|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
 let decimal("") v_dxf_src_env_rank_input_record=0;
out :: reformat(in) =
begin
   let hash_key_combine_type dxf_hk = reinterpret(get_hash(in,"$\{LOOKUP_KEYS_3_IN_CLEAN_FILE\}"));
  out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
  out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   //out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
  // out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
end;|3|3|c|@{0|}}
{30001002|XXparameter|out0_metadata|record
  unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
 end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|reject0_metadata||3|1|sl|@{0|}}
}}@0|Reformat|50000|50000|0|0|0|0|6959|Get Hash on SRC NK|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|28|0|63|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|29|0|66|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|30|0|68|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|31|0|70|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|32|0|72|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|33|0|74|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|34|0|76|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|35|0|80|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|36|0|83|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|37|0|86|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|38|0|89|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|39|0|92|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|select_expr|ids_create_run_id !=0|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|in_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|out_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|reject_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Filter by Expression|710000|51500|0|0|0|0|6978|FBE: filter matching lkp record|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|40|0|94|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|41|0|97|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|42|0|99|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|43|0|101|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|44|0|103|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|45|0|105|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|46|0|108|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|47|0|110|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|48|0|113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|49|0|116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|50|0|119|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|51|0|122|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|52|0|125|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|53|0|129|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|out_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|Gather|1247000|83500|0|0|0|0|6985|Gather|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|54|0|131|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|55|0|133|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|56|0|136|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|57|0|138|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|58|0|141|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010600005|XXGgraph|59|0|145|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@246000|58500|0|0|481000|303000|6988|PBKS:\{dxf_hk_part1\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|60|0|147|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|61|0|149|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@196000|259000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|62|0|151|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|63|0|154|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|64|0|158|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@322000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|65|0|160|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|66|0|162|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|67|0|167|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|68|0|171|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|69|0|175|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|70|0|177|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|71|0|179|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|72|0|181|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|73|0|184|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|74|0|186|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|75|0|188|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|76|0|191|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|77|0|196|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|78|0|198|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|79|0|200|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|80|0|203|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|81|0|205|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|82|0|208|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|83|0|214|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|84|0|217|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|85|0|222|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|$\{IDS_LKP_XFR\}|3|3|c|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|515000|51500|0|0|0|0|6973|RFMT: Lookup with IDS|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|86|0|224|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|87|0|227|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|88|0|229|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|89|0|231|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|90|0|233|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|91|0|236|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|92|0|238|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|93|0|242|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|94|0|245|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|95|0|248|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|96|0|251|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|97|0|257|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2\}|3|2|$|@{0|}}
}}@0|Sort within Groups|906000|49500|0|0|0|0|6991|Sort within Groups|Ab Initio Software|Built-in 2.1.7:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|98|0|259|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|99|0|262|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|100|0|265|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|101|0|267|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|102|0|270|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|103|0|274|0|{@{}@0|0|0|0|out0|.29376854599406527|@@@14352|0|}}
{2010202004|XXGiport|104|0|277|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010110002|XXGconstant|105|0|280|0|{@{}@{1|983021|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_1|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_10|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_18|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_2|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_3|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_5|}1|12|}
{2010601001|XXGgraph_vertex_vertex|12|0|24|0|{Dedup_Sorted|}1|13|}
{2010212001|XXGvertex_oport_oport|13|0|26|0|{0|out|}13|14|}
{2010213001|XXGoport_dst_flow|14|0|28|0|{0|}14|11|}
{2010212001|XXGvertex_oport_oport|15|0|29|0|{1|dup|}13|15|}
{2010212001|XXGvertex_oport_oport|16|0|31|0|{2|reject|}13|16|}
{2010212001|XXGvertex_oport_oport|17|0|33|0|{3|error|}13|17|}
{2010212001|XXGvertex_oport_oport|18|0|35|0|{4|log|}13|18|}
{2010211001|XXGvertex_iport_iport|19|0|37|0|{0|in|}13|19|}
{2010214001|XXGiport_src_flow|20|0|39|0|{0|}19|10|}
{2010007001|XXGobject_proto_object|21|0|40|0|{}13|20|}
{2010212001|XXGvertex_oport_oport|22|0|42|0|{0|out|}20|21|}
{2010006001|XXGobject_psameas_object|23|0|44|0|{metadata|out_metadata|1|0|}21|20|}
{2010212001|XXGvertex_oport_oport|24|0|45|0|{1|dup|}20|22|}
{2010006001|XXGobject_psameas_object|25|0|47|0|{metadata|dup_metadata|1|0|}22|20|}
{2010212001|XXGvertex_oport_oport|26|0|48|0|{2|reject|}20|23|}
{2010006001|XXGobject_psameas_object|27|0|50|0|{metadata|reject_metadata|1|0|}23|20|}
{2010212001|XXGvertex_oport_oport|28|0|51|0|{3|error|}20|24|}
{2010006001|XXGobject_psameas_object|29|0|53|0|{metadata|error_metadata|1|0|}24|20|}
{2010212001|XXGvertex_oport_oport|30|0|54|0|{4|log|}20|25|}
{2010006001|XXGobject_psameas_object|31|0|56|0|{metadata|log_metadata|1|0|}25|20|}
{2010211001|XXGvertex_iport_iport|32|0|57|0|{0|in|}20|26|}
{2010006001|XXGobject_psameas_object|33|0|59|0|{metadata|in_metadata|1|0|}26|20|}
{2010006001|XXGobject_psameas_object|34|0|60|0|{Layout|Layout|0|0|}13|27|}
{2010212001|XXGvertex_oport_oport|35|0|62|0|{0|out0|}27|28|}
{2010213001|XXGoport_dst_flow|36|0|64|0|{0|}28|9|}
{2010212001|XXGvertex_oport_oport|37|0|65|0|{1|reject0|}27|29|}
{2010212001|XXGvertex_oport_oport|38|0|67|0|{2|error0|}27|30|}
{2010212001|XXGvertex_oport_oport|39|0|69|0|{3|log|}27|31|}
{2010211001|XXGvertex_iport_iport|40|0|71|0|{0|in|}27|32|}
{2010007001|XXGobject_proto_object|41|0|73|0|{}27|33|}
{2010212001|XXGvertex_oport_oport|42|0|75|0|{0|out0|}33|34|}
{2010006001|XXGobject_psameas_object|43|0|77|0|{metadata|out0_metadata|1|0|}34|33|}
{2010006001|XXGobject_psameas_object|44|0|78|0|{transform0|transform0|1|0|}34|33|}
{2010212001|XXGvertex_oport_oport|45|0|79|0|{1|reject0|}33|35|}
{2010006001|XXGobject_psameas_object|46|0|81|0|{metadata|reject0_metadata|1|0|}35|33|}
{2010212001|XXGvertex_oport_oport|47|0|82|0|{2|error0|}33|36|}
{2010006001|XXGobject_psameas_object|48|0|84|0|{metadata|error0_metadata|1|0|}36|33|}
{2010212001|XXGvertex_oport_oport|49|0|85|0|{3|log|}33|37|}
{2010006001|XXGobject_psameas_object|50|0|87|0|{metadata|log_metadata|1|0|}37|33|}
{2010211001|XXGvertex_iport_iport|51|0|88|0|{0|in|}33|38|}
{2010006001|XXGobject_psameas_object|52|0|90|0|{metadata|in_metadata|1|0|}38|33|}
{2010601001|XXGgraph_vertex_vertex|53|0|91|0|{FBE_filter_matching_lkp_record|}1|39|}
{2010212001|XXGvertex_oport_oport|54|0|93|0|{0|out|}39|40|}
{2010213001|XXGoport_dst_flow|55|0|95|0|{0|}40|7|}
{2010212001|XXGvertex_oport_oport|56|0|96|0|{1|deselect|}39|41|}
{2010212001|XXGvertex_oport_oport|57|0|98|0|{2|reject|}39|42|}
{2010212001|XXGvertex_oport_oport|58|0|100|0|{3|error|}39|43|}
{2010212001|XXGvertex_oport_oport|59|0|102|0|{4|log|}39|44|}
{2010211001|XXGvertex_iport_iport|60|0|104|0|{0|in|}39|45|}
{2010214001|XXGiport_src_flow|61|0|106|0|{0|}45|12|}
{2010007001|XXGobject_proto_object|62|0|107|0|{}39|46|}
{2010212001|XXGvertex_oport_oport|63|0|109|0|{0|out|}46|47|}
{2010006001|XXGobject_psameas_object|64|0|111|0|{metadata|out_metadata|1|0|}47|46|}
{2010212001|XXGvertex_oport_oport|65|0|112|0|{1|deselect|}46|48|}
{2010006001|XXGobject_psameas_object|66|0|114|0|{metadata|deselect_metadata|1|0|}48|46|}
{2010212001|XXGvertex_oport_oport|67|0|115|0|{2|reject|}46|49|}
{2010006001|XXGobject_psameas_object|68|0|117|0|{metadata|reject_metadata|1|0|}49|46|}
{2010212001|XXGvertex_oport_oport|69|0|118|0|{3|error|}46|50|}
{2010006001|XXGobject_psameas_object|70|0|120|0|{metadata|error_metadata|1|0|}50|46|}
{2010212001|XXGvertex_oport_oport|71|0|121|0|{4|log|}46|51|}
{2010006001|XXGobject_psameas_object|72|0|123|0|{metadata|log_metadata|1|0|}51|46|}
{2010211001|XXGvertex_iport_iport|73|0|124|0|{0|in|}46|52|}
{2010006001|XXGobject_psameas_object|74|0|126|0|{metadata|in_metadata|1|0|}52|46|}
{2010006001|XXGobject_psameas_object|75|0|127|0|{Layout|Layout|0|0|}39|27|}
{2010601001|XXGgraph_vertex_vertex|76|0|128|0|{Gather|}1|53|}
{2010212001|XXGvertex_oport_oport|77|0|130|0|{0|out|}53|54|}
{2010211001|XXGvertex_iport_iport|78|0|132|0|{0|in|}53|55|}
{2010214001|XXGiport_src_flow|79|0|134|0|{0|}55|11|}
{2010007001|XXGobject_proto_object|80|0|135|0|{}53|56|}
{2010212001|XXGvertex_oport_oport|81|0|137|0|{0|out|}56|57|}
{2010006001|XXGobject_psameas_object|82|0|139|0|{metadata|out_metadata|1|0|}57|56|}
{2010211001|XXGvertex_iport_iport|83|0|140|0|{0|in|}56|58|}
{2010006001|XXGobject_psameas_object|84|0|142|0|{metadata|in_metadata|1|0|}58|56|}
{2010601001|XXGgraph_vertex_vertex|85|0|143|0|{Get_Hash_on_SRC_NK|}1|27|}
{2010601001|XXGgraph_vertex_vertex|86|0|144|0|{PBKS_dxf_hk_part1_|}1|59|}
{2010604001|XXGgraph_flow_flow|87|0|146|0|{Flow_1|}59|60|}
{2010601001|XXGgraph_vertex_vertex|88|0|148|0|{Partition_by_Key|}59|61|}
{2010212001|XXGvertex_oport_oport|89|0|150|0|{0|out|}61|62|}
{2010213001|XXGoport_dst_flow|90|0|152|0|{0|}62|60|}
{2010211001|XXGvertex_iport_iport|91|0|153|0|{0|in|}61|63|}
{2010006001|XXGobject_psameas_object|92|0|155|0|{in_metadata|out0_metadata|0|0|}61|27|}
{2010006001|XXGobject_psameas_object|93|0|156|0|{out_metadata|out0_metadata|0|0|}61|27|}
{2010601001|XXGgraph_vertex_vertex|94|0|157|0|{Sort|}59|64|}
{2010212001|XXGvertex_oport_oport|95|0|159|0|{0|out|}64|65|}
{2010211001|XXGvertex_iport_iport|96|0|161|0|{0|in|}64|66|}
{2010214001|XXGiport_src_flow|97|0|163|0|{0|}66|60|}
{2010006001|XXGobject_psameas_object|98|0|164|0|{in_metadata|out0_metadata|0|0|}64|27|}
{2010006001|XXGobject_psameas_object|99|0|165|0|{out_metadata|out0_metadata|0|0|}64|27|}
{2010212001|XXGvertex_oport_oport|100|0|166|0|{0|out0|}59|67|}
{2010216002|XXGoport_binding_oport|101|0|168|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}67|65|}
{2010213001|XXGoport_dst_flow|102|0|169|0|{0|}67|8|}
{2010211001|XXGvertex_iport_iport|103|0|170|0|{0|in0|}59|68|}
{2010215002|XXGiport_binding_iport|104|0|172|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}68|63|}
{2010214001|XXGiport_src_flow|105|0|173|0|{0|}68|9|}
{2010007001|XXGobject_proto_object|106|0|174|0|{}59|69|}
{2010604001|XXGgraph_flow_flow|107|0|176|0|{Flow_1|}69|70|}
{2010601001|XXGgraph_vertex_vertex|108|0|178|0|{Partition_by_Key|}69|71|}
{2010212001|XXGvertex_oport_oport|109|0|180|0|{0|out|}71|72|}
{2010213001|XXGoport_dst_flow|110|0|182|0|{0|}72|70|}
{2010211001|XXGvertex_iport_iport|111|0|183|0|{0|in|}71|73|}
{2010007001|XXGobject_proto_object|112|0|185|0|{}71|74|}
{2010212001|XXGvertex_oport_oport|113|0|187|0|{0|out|}74|75|}
{2010006001|XXGobject_psameas_object|114|0|189|0|{metadata|out_metadata|1|0|}75|74|}
{2010211001|XXGvertex_iport_iport|115|0|190|0|{0|in|}74|76|}
{2010006001|XXGobject_psameas_object|116|0|192|0|{metadata|in_metadata|1|0|}76|74|}
{2010006001|XXGobject_psameas_object|117|0|193|0|{Layout|InputLayout|1|0|}71|69|}
{2010006001|XXGobject_psameas_object|118|0|194|0|{key|Key|1|0|}71|69|}
{2010601001|XXGgraph_vertex_vertex|119|0|195|0|{Sort|}69|77|}
{2010212001|XXGvertex_oport_oport|120|0|197|0|{0|out|}77|78|}
{2010211001|XXGvertex_iport_iport|121|0|199|0|{0|in|}77|79|}
{2010214001|XXGiport_src_flow|122|0|201|0|{0|}79|70|}
{2010007001|XXGobject_proto_object|123|0|202|0|{}77|80|}
{2010212001|XXGvertex_oport_oport|124|0|204|0|{0|out|}80|81|}
{2010006001|XXGobject_psameas_object|125|0|206|0|{metadata|out_metadata|1|0|}81|80|}
{2010211001|XXGvertex_iport_iport|126|0|207|0|{0|in|}80|82|}
{2010006001|XXGobject_psameas_object|127|0|209|0|{metadata|in_metadata|1|0|}82|80|}
{2010006001|XXGobject_psameas_object|128|0|210|0|{Layout|OutputLayout|1|0|}77|69|}
{2010006001|XXGobject_psameas_object|129|0|211|0|{key|Key|1|0|}77|69|}
{2010006001|XXGobject_psameas_object|130|0|212|0|{max_core|Max_core|1|0|}77|69|}
{2010212001|XXGvertex_oport_oport|131|0|213|0|{0|out0|}69|83|}
{2010216002|XXGoport_binding_oport|132|0|215|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}83|78|}
{2010211001|XXGvertex_iport_iport|133|0|216|0|{0|in0|}69|84|}
{2010215002|XXGiport_binding_iport|134|0|218|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}84|73|}
{2010006001|XXGobject_psameas_object|135|0|219|0|{InputLayout|Layout|0|0|}59|27|}
{2010006001|XXGobject_psameas_object|136|0|220|0|{OutputLayout|Layout|0|0|}59|27|}
{2010601001|XXGgraph_vertex_vertex|137|0|221|0|{RFMT_Lookup_with_IDS|}1|85|}
{2010212001|XXGvertex_oport_oport|138|0|223|0|{0|out0|}85|86|}
{2010213001|XXGoport_dst_flow|139|0|225|0|{0|}86|12|}
{2010212001|XXGvertex_oport_oport|140|0|226|0|{1|reject0|}85|87|}
{2010212001|XXGvertex_oport_oport|141|0|228|0|{2|error0|}85|88|}
{2010212001|XXGvertex_oport_oport|142|0|230|0|{3|log|}85|89|}
{2010211001|XXGvertex_iport_iport|143|0|232|0|{0|in|}85|90|}
{2010214001|XXGiport_src_flow|144|0|234|0|{0|}90|8|}
{2010007001|XXGobject_proto_object|145|0|235|0|{}85|91|}
{2010212001|XXGvertex_oport_oport|146|0|237|0|{0|out0|}91|92|}
{2010006001|XXGobject_psameas_object|147|0|239|0|{metadata|out0_metadata|1|0|}92|91|}
{2010006001|XXGobject_psameas_object|148|0|240|0|{transform0|transform0|1|0|}92|91|}
{2010212001|XXGvertex_oport_oport|149|0|241|0|{1|reject0|}91|93|}
{2010006001|XXGobject_psameas_object|150|0|243|0|{metadata|reject0_metadata|1|0|}93|91|}
{2010212001|XXGvertex_oport_oport|151|0|244|0|{2|error0|}91|94|}
{2010006001|XXGobject_psameas_object|152|0|246|0|{metadata|error0_metadata|1|0|}94|91|}
{2010212001|XXGvertex_oport_oport|153|0|247|0|{3|log|}91|95|}
{2010006001|XXGobject_psameas_object|154|0|249|0|{metadata|log_metadata|1|0|}95|91|}
{2010211001|XXGvertex_iport_iport|155|0|250|0|{0|in|}91|96|}
{2010006001|XXGobject_psameas_object|156|0|252|0|{metadata|in_metadata|1|0|}96|91|}
{2010006001|XXGobject_psameas_object|157|0|253|0|{Layout|Layout|0|0|}85|27|}
{2010006001|XXGobject_psameas_object|158|0|254|0|{in_metadata|out0_metadata|0|0|}85|27|}
{2010006001|XXGobject_psameas_object|159|0|255|0|{reject0_metadata|out0_metadata|0|0|}85|27|}
{2010601001|XXGgraph_vertex_vertex|160|0|256|0|{Sort_within_Groups|}1|97|}
{2010212001|XXGvertex_oport_oport|161|0|258|0|{0|out|}97|98|}
{2010213001|XXGoport_dst_flow|162|0|260|0|{0|}98|10|}
{2010211001|XXGvertex_iport_iport|163|0|261|0|{0|in|}97|99|}
{2010214001|XXGiport_src_flow|164|0|263|0|{0|}99|7|}
{2010007001|XXGobject_proto_object|165|0|264|0|{}97|100|}
{2010212001|XXGvertex_oport_oport|166|0|266|0|{0|out|}100|101|}
{2010006001|XXGobject_psameas_object|167|0|268|0|{metadata|out_metadata|1|0|}101|100|}
{2010211001|XXGvertex_iport_iport|168|0|269|0|{0|in|}100|102|}
{2010006001|XXGobject_psameas_object|169|0|271|0|{metadata|in_metadata|1|0|}102|100|}
{2010006001|XXGobject_psameas_object|170|0|272|0|{Layout|Layout|0|0|}97|27|}
{2010212001|XXGvertex_oport_oport|171|0|273|0|{0|out0|}1|103|}
{2010216002|XXGoport_binding_oport|172|0|275|0|{.5|.5|{0|}6980|}103|54|}
{2010211001|XXGvertex_iport_iport|173|0|276|0|{0|in0|}1|104|}
{2010215002|XXGiport_binding_iport|174|0|278|0|{.5|.5|{0|}6979|}104|32|}
{2010109001|XXGobject_property_value|175|0|279|0|{0|TrackingThumbprint|72|}1|105|}
