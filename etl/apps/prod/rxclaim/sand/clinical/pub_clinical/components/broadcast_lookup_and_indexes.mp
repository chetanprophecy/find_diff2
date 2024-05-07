@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|335|rel_count|608|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_CLINICAL_LKUP_XFR/lkup_parsing_functions.xfr";|3|1|Kl|@{0|}}
{30001002|XXparameter|LKUP_TYPE|$LKUP_TYPE|3|9|FK|@{0|}}
{30001002|XXparameter|LKUP_NM|$LKUP_NM|3|9|RFK||{0|}}
{30001002|XXparameter|LKUP_FUNCTIONS_FILE|$PUB_CLINICAL_LKUP_XFR/$\{LKUP_TYPE\}/$\{LKUP_NM\}_lkup_functions.xfr|3|9|RFK|@{0|}}
{30001002|XXparameter|SERIAL_LOOKUP_DIR|$PUB_CLINICAL_SERIAL_LOOKUP|26|9|RFK||{0|}}
{30001002|XXparameter|MFS_LOOKUP_DIR|$PUB_CLINICAL_MFS_LOOKUP|41|9|RFK||{0|}}
{30001002|XXparameter|LOOKUP_FILENAME|$LKUP_NM.dat|3|9|RFK||{0|}}
{30001002|XXparameter|WRITE_SERIAL_LOOKUP|True|13|9|RFK||{0|}}
{30001002|XXparameter|___cmt_no_edits_below_here_1___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_no_edits_below_here_2___|# Please do not edit parameters below these comments|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_no_edits_below_here_3___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|LKUP_DTL_VEC|$[get_lkup_dtl_vec(LKUP_FUNCTIONS_FILE)]|3|9|RK|@{0|}}
{30001002|XXparameter|LKUP_DTL_VEC_EXPANDED|$[string_representation(LKUP_DTL_VEC)]|3|9|RK|@{0|}}
{30001002|XXparameter|LKUP_DTL_CNT|$[length_of(LKUP_DTL_VEC)]|3|9|RK|@{0|}}
{30001002|XXparameter|INDEX_NM_VEC|$[for (let x in LKUP_DTL_VEC) : x.lkup_nm]|3|9|RK|@{0|}}
{30001002|XXparameter|INDEX_NM_LIST|$[string_join(INDEX_NM_VEC, ', ')]|19|9|RK|@{0|}}
{30001002|XXparameter|___cmt_lkup_index_1_1___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_lkup_index_1_2___|# Lookup Index #1|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_lkup_index_1_3___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|LKUP_INDEX_NM_1|$[ LKUP_DTL_CNT > 0 ? LKUP_DTL_VEC[0].lkup_nm : '' ]|3|9|RK|@{0|}}
{30001002|XXparameter|LKUP_INDEX_KEY_1|$[ LKUP_DTL_CNT > 0 ? LKUP_DTL_VEC[0].key : '\{\}' ]|19|9|RK|@{0|}}
{30001002|XXparameter|___cmt_lkup_index_2_1___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_lkup_index_2_2___|# Lookup Index #2|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_lkup_index_2_3___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|LKUP_INDEX_NM_2|$[ LKUP_DTL_CNT > 1 ? LKUP_DTL_VEC[1].lkup_nm : '' ]|3|9|K|@{0|}}
{30001002|XXparameter|LKUP_INDEX_KEY_2|$[ LKUP_DTL_CNT > 1 ? LKUP_DTL_VEC[1].key : '\{\}' ]|19|9|RK|@{0|}}
{30001002|XXparameter|___cmt_lkup_index_3_1___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_lkup_index_3_2___|# Lookup Index #3|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_lkup_index_3_3___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|LKUP_INDEX_NM_3|$[ LKUP_DTL_CNT > 2 ? LKUP_DTL_VEC[2].lkup_nm : '' ]|3|9|K|@{0|}}
{30001002|XXparameter|LKUP_INDEX_KEY_3|$[ LKUP_DTL_CNT > 2 ? LKUP_DTL_VEC[2].key : '\{\}' ]|19|9|RK|@{0|}}
{30001002|XXparameter|___cmt_lkup_index_4_1___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_lkup_index_4_2___|# Lookup Index #4|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_lkup_index_4_3___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|LKUP_INDEX_NM_4|$[ LKUP_DTL_CNT > 3 ? LKUP_DTL_VEC[3].lkup_nm : '' ]|3|9|K|@{0|}}
{30001002|XXparameter|LKUP_INDEX_KEY_4|$[ LKUP_DTL_CNT > 3 ? LKUP_DTL_VEC[3].key : '\{\}' ]|19|9|RK|@{0|}}
{30001002|XXparameter|___cmt_lkup_index_5_1___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_lkup_index_5_2___|# Lookup Index #5|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_lkup_index_5_3___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|LKUP_INDEX_NM_5|$[ LKUP_DTL_CNT > 4 ? LKUP_DTL_VEC[4].lkup_nm : '' ]|3|9|K|@{0|}}
{30001002|XXparameter|LKUP_INDEX_KEY_5|$[ LKUP_DTL_CNT > 4 ? LKUP_DTL_VEC[4].key : '\{\}' ]|19|9|RK|@{0|}}
{30001002|XXparameter|!ab_compatibility|3.2.6.4|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|test|Paul Thompson|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1074000|901000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{1|1|}Job 'broadcast_lookup_and_indexes' Execution Status Report

Job completed successfully at Wednesday, November 02, 2016 17:46:56
Run performed by user Paul Thompson
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@apsrs4064 [3.2]||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Courier New|8421376|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Project & Title    : pub_clinical -> components -> Broadcast Lookup & Indexes
Initial Developers : Paul Thompson
Date Created       : November 1, 2016

Input Parameters   :
  LKUP_TYPE           = Lookup type (cfg, refdata, etc)
  LKUP_NM             = Lookup name (carrier, carrier_acct, cag, gpi, etc)
  LKUP_FUNCTIONS_FILE = Transform file containing lookup template types and functions
  SERIAL_LOOKUP_DIR   = Serial directory to write lookup index into (defaults to $PUB_CLINICAL_SERIAL_LOOKUP)
  MFS_LOOKUP_DIR      = MFS directory to write lookup index into (defaults to $PUB_MFS_SERIAL_LOOKUP)
  LOOKUP_FILENAME     = Lookup filename (defaults the $LKUP_NM.dat)
  WRITE_SERIAL_LOOKUP = Should we write the lookup the Serial node as well?

Description :

Broadcasts the lookup to the MFS nodes. Also, if WRITE_SERIAL_LOOKUP is True, then also write it to the Serial node.
Only set WRITE_SERIAL_LOOKUP to False if the file is already available in the serial node.

Also, create indexes and broadcast them to the Serial and MFS nodes. Indexes names and keys are read from the lookup
functions transform file.|33000|560000|0|0|0|0|8152|}}
{2010242002|XXGface|6|0|11|0|{@{}@Courier New|8421376|100|0|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5215053558349609|{0|}8168|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.341207355260849|{0|}8167|529|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.16209475696086884|{0|}8169|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.16019417345523834|{0|}8170|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|0.0|{0|}8171|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.341207355260849|{0|}8166|17|}}
{2010600005|XXGgraph|13|0|25|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_CLINICAL_COMPONENTS/broadcast_lookup.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|LKUP_NM||3|8|=|@{0|}}
{30001002|XXparameter|SERIAL_LOOKUP_DIR||3|8|=|@{0|}}
{30001002|XXparameter|MFS_LOOKUP_DIR||3|8|=|@{0|}}
{30001002|XXparameter|LOOKUP_FILENAME||3|8|=|@{0|}}
{30001002|XXparameter|WRITE_SERIAL_LOOKUP||3|8|=|@{0|}}
}}@0|@552000|34000|0|0|0|0|8174|Broadcast Lookup||@1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|718000|636000|5|}}
{2010240003|XXGlegend|14|0|27|0|{@{}@Project & Title    : pub_clinical -> components -> Broadcast Lookup
Initial Developers : Paul Thompson
Date Created       : November 1, 2016

Input Parameters   :
  LKUP_NM             = Lookup Name
  SERIAL_LOOKUP_DIR   = Serial directory to write lookup index into
  MFS_LOOKUP_DIR      = MFS directory to write lookup index into
  LOOKUP_FILENAME     = Lookup filename (defaults the $LKUP_NM.dat)
  WRITE_SERIAL_LOOKUP = Should we write the lookup into the Serial node as well?

Description :

Broadcasts the lookup to the MFS nodes. Also, if WRITE_SERIAL_LOOKUP is True,
then also write it to the Serial node. Only set WRITE_SERIAL_LOOKUP to False
if the file is already available in the serial node.|28000|360000|0|0|0|0|8132|}}
{2010242002|XXGface|15|0|29|0|{@{}@Courier New|8421376|100|0|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.6617646813392639|{0|}8138|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.6617646813392639|{0|}8127|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.6617646813392639|{0|}8140|18|}}
{2010501005|XXGpvertex|19|0|37|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Broadcast|330000|278000|0|0|0|0|8128|Broadcast Lookup to Parallel Nodes|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|20|0|39|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|21|0|42|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|22|0|45|0|{|{}@0|Replicate|131000|103000|0|0|0|0|8124|Replicate Lookup|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|23|0|47|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|24|0|51|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|25|0|53|0|{|{}@0|@516000|271000|0|0|0|0|8141|Parallel Node Lookups|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|26|0|55|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|27|0|59|0|{|{}@0|@516000|87000|0|0|0|0|8139|Serial Node Lookup|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|28|0|61|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|29|0|64|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|30|0|68|0|{Subgraph created from graph "test"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LKUP_NM|$LKUP_NM|3|9|RFK|@{0|}}
{30001002|XXparameter|SERIAL_LOOKUP_DIR|$PUB_CLINICAL_SERIAL_LOOKUP|26|9|RFK|@{0|}}
{30001002|XXparameter|MFS_LOOKUP_DIR|$PUB_CLINICAL_MFS_LOOKUP|41|9|RFK|@{0|}}
{30001002|XXparameter|LOOKUP_FILENAME|$LKUP_NM.dat|3|9|RFK|@{0|}}
{30001002|XXparameter|WRITE_SERIAL_LOOKUP|True|13|9|RFK||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|mpcmodtime|1479868112|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@555000|310500|0|0|0|0|251|Broadcast Lookup Index||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|718000|636000|7|}}
{2010240003|XXGlegend|31|0|70|0|{@{}@Project & Title    : pub_clinical -> components -> Broadcast Lookup
Initial Developers : Paul Thompson
Date Created       : November 1, 2016

Input Parameters   :
  LKUP_NM             = Lookup Name
  SERIAL_LOOKUP_DIR   = Serial directory to write lookup index into
  MFS_LOOKUP_DIR      = MFS directory to write lookup index into
  LOOKUP_FILENAME     = Lookup filename (defaults the $LKUP_NM.dat)
  WRITE_SERIAL_LOOKUP = Should we write the lookup into the Serial node as well?

Description :

Broadcasts the lookup to the MFS nodes. Also, if WRITE_SERIAL_LOOKUP is True,
then also write it to the Serial node. Only set WRITE_SERIAL_LOOKUP to False
if the file is already available in the serial node.|28000|360000|0|0|0|0|8132|}}
{2010242002|XXGface|32|0|72|0|{@{}@Courier New|8421376|100|0|}}
{2010210004|XXGflow|33|0|74|0|{@{}@384|.5|.6617646813392639|{0|}8138|17|}}
{2010210004|XXGflow|34|0|76|0|{@{}@384|.5|.6617646813392639|{0|}8127|17|}}
{2010210004|XXGflow|35|0|78|0|{@{}@384|.5|.6617646813392639|{0|}8140|18|}}
{2010501005|XXGpvertex|36|0|80|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|out_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
}}@0|Broadcast|330000|278000|0|0|0|0|8128|Broadcast Lookup to Parallel Nodes|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|37|0|82|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|38|0|85|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|39|0|88|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
}}@0|Broadcast|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|40|0|90|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|41|0|93|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|42|0|96|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$MFS_LOOKUP_DIR/$LOOKUP_FILENAME|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@516000|271000|0|0|0|0|8141|Parallel Node Lookups|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|43|0|98|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|44|0|101|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|45|0|103|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|46|0|106|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|out_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
}}@0|Replicate|131000|103000|0|0|0|0|8124|Replicate Lookup|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|47|0|108|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|48|0|112|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|49|0|114|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|50|0|116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|51|0|119|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|52|0|123|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$SERIAL_LOOKUP_DIR/$LOOKUP_FILENAME|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@516000|87000|0|0|0|0|8139|Serial Node Lookup|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|53|0|125|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|54|0|128|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|55|0|130|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|56|0|134|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|57|0|142|0|{Subgraph created from graph "test"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_CLINICAL_COMPONENTS/broadcast_lookup_index.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|LKUP_NM||3|8|=|@{0|}}
{30001002|XXparameter|INDEX_NM||3|8|=|@{0|}}
{30001002|XXparameter|SERIAL_LOOKUP_DIR||3|8|=|@{0|}}
{30001002|XXparameter|MFS_LOOKUP_DIR||3|8|=|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|@755000|120500|0|0|0|0|8175|Broadcast Lookup Index 1||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|732000|685000|5|}}
{2010240003|XXGlegend|58|0|144|0|{@{}@Project & Title    : pub_clinical -> components -> Broadcast Lookup Index
Initial Developers : Paul Thompson
Date Created       : November 1, 2016

Input Parameters   :
  LKUP_NM           = Lookup Name
  INDEX_NM          = Index name (optional)
  SERIAL_LOOKUP_DIR = Serial directory to write lookup index into
  MFS_LOOKUP_DIR    = MFS directory to write lookup index into

Description :

If INDEX_NM is provided (i.e. not blank) then write the index into the serial
directory and broadcast to the MFS directory nodes. Otherwise, just write the
index to the trash.|43000|415000|0|0|0|0|8094|}}
{2010242002|XXGface|59|0|146|0|{@{}@Courier New|8421376|100|0|}}
{2010210004|XXGflow|60|0|148|0|{@{}@384|.5|.6617646813392639|{0|}8111|17|}}
{2010210004|XXGflow|61|0|150|0|{@{}@384|.5|.6617646813392639|{0|}8101|17|}}
{2010210004|XXGflow|62|0|152|0|{@{}@384|.5|.6617646813392639|{0|}8113|18|}}
{2010210004|XXGflow|63|0|154|0|{@{}@384|.5|.6617646813392639|{0|}8108|17|}}
{2010501005|XXGpvertex|64|0|156|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Broadcast|330000|343000|0|0|0|0|8087|Broadcast Index to Parallel Nodes|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|65|0|158|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|66|0|161|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|67|0|164|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Replicate|131000|168000|0|0|0|0|8102|Replicate Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|68|0|166|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|69|0|171|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|70|0|173|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|index1_metadata|void(1)|3|1|l|@{0|}}
{30001002|XXparameter|index2_metadata|void(1)|3|1|l|@{0|}}
{30001002|XXparameter|index3_metadata|void(1)|3|1|l|@{0|}}
{30001002|XXparameter|index4_metadata|void(1)|3|1|l|@{0|}}
{30001002|XXparameter|key0||3|8|=|@{0|}}
{30001002|XXparameter|key1||3|8|=|@{0|}}
{30001002|XXparameter|key2||3|8|=|@{0|}}
{30001002|XXparameter|key3||3|8|=|@{0|}}
{30001002|XXparameter|key4||3|8|=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Write Lookup|145000|46000|0|0|0|0|8172|Write Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|71|0|175|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|72|0|178|0|{@{}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010203004|XXGoport|73|0|181|0|{@{}@0|0|0|0|index1|0.0|count|index|1|2448|0|}}
{2010203004|XXGoport|74|0|184|0|{@{}@0|0|0|0|index2|0.0|count|index|2|2448|0|}}
{2010203004|XXGoport|75|0|187|0|{@{}@0|0|0|0|index3|0.0|count|index|3|2448|0|}}
{2010203004|XXGoport|76|0|190|0|{@{}@0|0|0|0|index4|0.0|count|index|4|2448|0|}}
{2010202004|XXGiport|77|0|193|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|78|0|195|0|{Passes through lookup data and generates one or more indexes.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup-indexes|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|5|1|1|Fl|Number of indexes|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|key0||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key1||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key2||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key3||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key4||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count index|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index0_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|index1_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|index2_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|index3_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|index4_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index[*]::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|key1.index_name|key|3|9|P|@{0|}}
{30001002|XXparameter|key2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|key2.index_name|key|3|9|P|@{0|}}
{30001002|XXparameter|key3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|key3.index_name|key|3|9|P|@{0|}}
{30001002|XXparameter|key4.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key4.index_value|4|3|9|P|@{0|}}
{30001002|XXparameter|key4.index_name|key|3|9|P|@{0|}}
}}@0|Write Lookup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|79|0|197|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|80|0|200|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key0||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010203004|XXGoport|81|0|204|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key1||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|key1.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index1|0.0|count|index|1|2448|0|}}
{2010203004|XXGoport|82|0|208|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key2||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|key2.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index2|0.0|count|index|2|2448|0|}}
{2010203004|XXGoport|83|0|212|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key3||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|key3.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index3|0.0|count|index|3|2448|0|}}
{2010203004|XXGoport|84|0|216|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key4||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key4.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key4.index_value|4|3|9|P|@{0|}}
{30001002|XXparameter|key4.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index4|0.0|count|index|4|2448|0|}}
{2010202004|XXGiport|85|0|220|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|86|0|223|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Replicate|131000|168000|0|0|0|0|8102|Replicate Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|87|0|225|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010210004|XXGflow|88|0|227|0|{@{}@384|.5|.6617646813392639|{0|}8108|17|}}
{2010210004|XXGflow|89|0|229|0|{@{}@384|.5|.6617646813392639|{0|}8111|17|}}
{2010210004|XXGflow|90|0|231|0|{@{}@384|.5|.6617646813392639|{0|}8101|17|}}
{2010202004|XXGiport|91|0|233|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|92|0|245|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@516000|336000|0|0|0|0|8114|Parallel Node Indexes|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|93|0|247|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|94|0|252|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@516000|157000|0|0|0|0|8112|Serial Node Index|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|95|0|254|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|96|0|258|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|Trash|253000|47000|0|0|0|0|8109|Trash Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010202004|XXGiport|97|0|260|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|98|0|265|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|99|0|269|0|{Subgraph created from graph "test"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LKUP_NM|$LKUP_NM|3|9|RFK|@{0|}}
{30001002|XXparameter|INDEX_NM||3|9|FK|@{0|}}
{30001002|XXparameter|SERIAL_LOOKUP_DIR|$PUB_CLINICAL_SERIAL_LOOKUP|26|9|RFK|@{0|}}
{30001002|XXparameter|MFS_LOOKUP_DIR|$PUB_CLINICAL_MFS_LOOKUP|41|9|RFK|@{0|}}
{30001002|XXparameter|___cmt_derived_params_1___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_derived_params_2___|# Derived Parameters|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_derived_params_3___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|INDEX_FILENAME|$LKUP_NM.$INDEX_NM.idx|3|9|RK|@{0|}}
{30001002|XXparameter|ENABLE_TRASH|$[ is_blank(INDEX_NM) ? 'True' : 'False' ]|3|9|RK||{0|}}
{30001002|XXparameter|ENABLE_FILES|$[ not is_blank(INDEX_NM) ? 'True' : 'False' ]|3|9|RK||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|mpcmodtime|1479868146|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@555000|310500|0|0|0|0|251|Broadcast Lookup Index||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|732000|685000|7|}}
{2010240003|XXGlegend|100|0|271|0|{@{}@Project & Title    : pub_clinical -> components -> Broadcast Lookup Index
Initial Developers : Paul Thompson
Date Created       : November 1, 2016

Input Parameters   :
  LKUP_NM           = Lookup Name
  INDEX_NM          = Index name (optional)
  SERIAL_LOOKUP_DIR = Serial directory to write lookup index into
  MFS_LOOKUP_DIR    = MFS directory to write lookup index into

Description :

If INDEX_NM is provided (i.e. not blank) then write the index into the serial
directory and broadcast to the MFS directory nodes. Otherwise, just write the
index to the trash.|43000|415000|0|0|0|0|8094|}}
{2010242002|XXGface|101|0|273|0|{@{}@Courier New|8421376|100|0|}}
{2010210004|XXGflow|102|0|275|0|{@{}@384|.5|.6617646813392639|{0|}8111|17|}}
{2010210004|XXGflow|103|0|277|0|{@{}@384|.5|.6617646813392639|{0|}8101|17|}}
{2010210004|XXGflow|104|0|279|0|{@{}@384|.5|.6617646813392639|{0|}8113|18|}}
{2010210004|XXGflow|105|0|281|0|{@{}@384|.5|.6617646813392639|{0|}8108|17|}}
{2010501005|XXGpvertex|106|0|283|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
}}@0|Broadcast|330000|343000|0|0|0|0|8087|Broadcast Index to Parallel Nodes|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|107|0|285|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|108|0|288|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|109|0|291|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
}}@0|Broadcast|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|110|0|293|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|111|0|296|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|112|0|300|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$MFS_LOOKUP_DIR/$INDEX_FILENAME|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@516000|336000|0|0|0|0|8114|Parallel Node Indexes|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|113|0|302|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|114|0|305|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|115|0|307|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|116|0|311|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
}}@0|Replicate|131000|168000|0|0|0|0|8102|Replicate Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|117|0|313|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|118|0|318|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|119|0|320|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|120|0|322|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|121|0|325|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|122|0|329|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$SERIAL_LOOKUP_DIR/$INDEX_FILENAME|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@516000|157000|0|0|0|0|8112|Serial Node Index|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|123|0|331|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|124|0|334|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|125|0|336|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|126|0|340|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
}}@0|Trash|253000|47000|0|0|0|0|8109|Trash Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010202004|XXGiport|127|0|342|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|128|0|345|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|129|0|347|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|130|0|351|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|131|0|358|0|{Subgraph created from graph "test"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_CLINICAL_COMPONENTS/broadcast_lookup_index.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|LKUP_NM||3|8|=|@{0|}}
{30001002|XXparameter|INDEX_NM||3|8|=|@{0|}}
{30001002|XXparameter|SERIAL_LOOKUP_DIR||3|8|=|@{0|}}
{30001002|XXparameter|MFS_LOOKUP_DIR||3|8|=|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|@550000|195500|0|0|0|0|8176|Broadcast Lookup Index 2||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|732000|685000|5|}}
{2010240003|XXGlegend|132|0|360|0|{@{}@Project & Title    : pub_clinical -> components -> Broadcast Lookup Index
Initial Developers : Paul Thompson
Date Created       : November 1, 2016

Input Parameters   :
  LKUP_NM           = Lookup Name
  INDEX_NM          = Index name (optional)
  SERIAL_LOOKUP_DIR = Serial directory to write lookup index into
  MFS_LOOKUP_DIR    = MFS directory to write lookup index into

Description :

If INDEX_NM is provided (i.e. not blank) then write the index into the serial
directory and broadcast to the MFS directory nodes. Otherwise, just write the
index to the trash.|43000|415000|0|0|0|0|8094|}}
{2010242002|XXGface|133|0|362|0|{@{}@Courier New|8421376|100|0|}}
{2010210004|XXGflow|134|0|364|0|{@{}@384|.5|.6617646813392639|{0|}8111|17|}}
{2010210004|XXGflow|135|0|366|0|{@{}@384|.5|.6617646813392639|{0|}8101|17|}}
{2010210004|XXGflow|136|0|368|0|{@{}@384|.5|.6617646813392639|{0|}8113|18|}}
{2010210004|XXGflow|137|0|370|0|{@{}@384|.5|.6617646813392639|{0|}8108|17|}}
{2010501005|XXGpvertex|138|0|372|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Broadcast|330000|343000|0|0|0|0|8087|Broadcast Index to Parallel Nodes|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|139|0|374|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|140|0|377|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|141|0|380|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Replicate|131000|168000|0|0|0|0|8102|Replicate Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|142|0|382|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|143|0|387|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|144|0|393|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@516000|336000|0|0|0|0|8114|Parallel Node Indexes|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|145|0|395|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|146|0|400|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@516000|157000|0|0|0|0|8112|Serial Node Index|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|147|0|402|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|148|0|406|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|Trash|253000|47000|0|0|0|0|8109|Trash Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010202004|XXGiport|149|0|408|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|150|0|413|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|151|0|417|0|{Subgraph created from graph "test"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LKUP_NM|$LKUP_NM|3|9|RFK|@{0|}}
{30001002|XXparameter|INDEX_NM||3|9|FK|@{0|}}
{30001002|XXparameter|SERIAL_LOOKUP_DIR|$PUB_CLINICAL_SERIAL_LOOKUP|26|9|RFK|@{0|}}
{30001002|XXparameter|MFS_LOOKUP_DIR|$PUB_CLINICAL_MFS_LOOKUP|41|9|RFK|@{0|}}
{30001002|XXparameter|___cmt_derived_params_1___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_derived_params_2___|# Derived Parameters|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_derived_params_3___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|INDEX_FILENAME|$LKUP_NM.$INDEX_NM.idx|3|9|RK|@{0|}}
{30001002|XXparameter|ENABLE_TRASH|$[ is_blank(INDEX_NM) ? 'True' : 'False' ]|3|9|RK||{0|}}
{30001002|XXparameter|ENABLE_FILES|$[ not is_blank(INDEX_NM) ? 'True' : 'False' ]|3|9|RK||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|mpcmodtime|1479868146|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@555000|310500|0|0|0|0|251|Broadcast Lookup Index||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|732000|685000|7|}}
{2010240003|XXGlegend|152|0|419|0|{@{}@Project & Title    : pub_clinical -> components -> Broadcast Lookup Index
Initial Developers : Paul Thompson
Date Created       : November 1, 2016

Input Parameters   :
  LKUP_NM           = Lookup Name
  INDEX_NM          = Index name (optional)
  SERIAL_LOOKUP_DIR = Serial directory to write lookup index into
  MFS_LOOKUP_DIR    = MFS directory to write lookup index into

Description :

If INDEX_NM is provided (i.e. not blank) then write the index into the serial
directory and broadcast to the MFS directory nodes. Otherwise, just write the
index to the trash.|43000|415000|0|0|0|0|8094|}}
{2010242002|XXGface|153|0|421|0|{@{}@Courier New|8421376|100|0|}}
{2010210004|XXGflow|154|0|423|0|{@{}@384|.5|.6617646813392639|{0|}8111|17|}}
{2010210004|XXGflow|155|0|425|0|{@{}@384|.5|.6617646813392639|{0|}8101|17|}}
{2010210004|XXGflow|156|0|427|0|{@{}@384|.5|.6617646813392639|{0|}8113|18|}}
{2010210004|XXGflow|157|0|429|0|{@{}@384|.5|.6617646813392639|{0|}8108|17|}}
{2010501005|XXGpvertex|158|0|431|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
}}@0|Broadcast|330000|343000|0|0|0|0|8087|Broadcast Index to Parallel Nodes|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|159|0|433|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|160|0|436|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|161|0|439|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
}}@0|Broadcast|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|162|0|441|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|163|0|444|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|164|0|448|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$MFS_LOOKUP_DIR/$INDEX_FILENAME|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@516000|336000|0|0|0|0|8114|Parallel Node Indexes|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|165|0|450|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|166|0|453|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|167|0|455|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|168|0|459|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
}}@0|Replicate|131000|168000|0|0|0|0|8102|Replicate Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|169|0|461|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|170|0|466|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|171|0|468|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|172|0|470|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|173|0|473|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|174|0|477|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$SERIAL_LOOKUP_DIR/$INDEX_FILENAME|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@516000|157000|0|0|0|0|8112|Serial Node Index|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|175|0|479|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|176|0|482|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|177|0|484|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|178|0|488|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
}}@0|Trash|253000|47000|0|0|0|0|8109|Trash Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010202004|XXGiport|179|0|490|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|180|0|493|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|181|0|495|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|182|0|499|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|183|0|506|0|{Subgraph created from graph "test"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_CLINICAL_COMPONENTS/broadcast_lookup_index.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|LKUP_NM||3|8|=|@{0|}}
{30001002|XXparameter|INDEX_NM||3|8|=|@{0|}}
{30001002|XXparameter|SERIAL_LOOKUP_DIR||3|8|=|@{0|}}
{30001002|XXparameter|MFS_LOOKUP_DIR||3|8|=|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|@755000|300500|0|0|0|0|8177|Broadcast Lookup Index 3||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|732000|685000|5|}}
{2010240003|XXGlegend|184|0|508|0|{@{}@Project & Title    : pub_clinical -> components -> Broadcast Lookup Index
Initial Developers : Paul Thompson
Date Created       : November 1, 2016

Input Parameters   :
  LKUP_NM           = Lookup Name
  INDEX_NM          = Index name (optional)
  SERIAL_LOOKUP_DIR = Serial directory to write lookup index into
  MFS_LOOKUP_DIR    = MFS directory to write lookup index into

Description :

If INDEX_NM is provided (i.e. not blank) then write the index into the serial
directory and broadcast to the MFS directory nodes. Otherwise, just write the
index to the trash.|43000|415000|0|0|0|0|8094|}}
{2010242002|XXGface|185|0|510|0|{@{}@Courier New|8421376|100|0|}}
{2010210004|XXGflow|186|0|512|0|{@{}@384|.5|.6617646813392639|{0|}8111|17|}}
{2010210004|XXGflow|187|0|514|0|{@{}@384|.5|.6617646813392639|{0|}8101|17|}}
{2010210004|XXGflow|188|0|516|0|{@{}@384|.5|.6617646813392639|{0|}8113|18|}}
{2010210004|XXGflow|189|0|518|0|{@{}@384|.5|.6617646813392639|{0|}8108|17|}}
{2010501005|XXGpvertex|190|0|520|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Broadcast|330000|343000|0|0|0|0|8087|Broadcast Index to Parallel Nodes|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|191|0|522|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|192|0|525|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|193|0|528|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Replicate|131000|168000|0|0|0|0|8102|Replicate Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|194|0|530|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|195|0|535|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|196|0|541|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@516000|336000|0|0|0|0|8114|Parallel Node Indexes|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|197|0|543|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|198|0|548|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@516000|157000|0|0|0|0|8112|Serial Node Index|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|199|0|550|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|200|0|554|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|Trash|253000|47000|0|0|0|0|8109|Trash Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010202004|XXGiport|201|0|556|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|202|0|561|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|203|0|565|0|{Subgraph created from graph "test"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LKUP_NM|$LKUP_NM|3|9|RFK|@{0|}}
{30001002|XXparameter|INDEX_NM||3|9|FK|@{0|}}
{30001002|XXparameter|SERIAL_LOOKUP_DIR|$PUB_CLINICAL_SERIAL_LOOKUP|26|9|RFK|@{0|}}
{30001002|XXparameter|MFS_LOOKUP_DIR|$PUB_CLINICAL_MFS_LOOKUP|41|9|RFK|@{0|}}
{30001002|XXparameter|___cmt_derived_params_1___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_derived_params_2___|# Derived Parameters|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_derived_params_3___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|INDEX_FILENAME|$LKUP_NM.$INDEX_NM.idx|3|9|RK|@{0|}}
{30001002|XXparameter|ENABLE_TRASH|$[ is_blank(INDEX_NM) ? 'True' : 'False' ]|3|9|RK||{0|}}
{30001002|XXparameter|ENABLE_FILES|$[ not is_blank(INDEX_NM) ? 'True' : 'False' ]|3|9|RK||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|mpcmodtime|1479868146|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@555000|310500|0|0|0|0|251|Broadcast Lookup Index||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|732000|685000|7|}}
{2010240003|XXGlegend|204|0|567|0|{@{}@Project & Title    : pub_clinical -> components -> Broadcast Lookup Index
Initial Developers : Paul Thompson
Date Created       : November 1, 2016

Input Parameters   :
  LKUP_NM           = Lookup Name
  INDEX_NM          = Index name (optional)
  SERIAL_LOOKUP_DIR = Serial directory to write lookup index into
  MFS_LOOKUP_DIR    = MFS directory to write lookup index into

Description :

If INDEX_NM is provided (i.e. not blank) then write the index into the serial
directory and broadcast to the MFS directory nodes. Otherwise, just write the
index to the trash.|43000|415000|0|0|0|0|8094|}}
{2010242002|XXGface|205|0|569|0|{@{}@Courier New|8421376|100|0|}}
{2010210004|XXGflow|206|0|571|0|{@{}@384|.5|.6617646813392639|{0|}8111|17|}}
{2010210004|XXGflow|207|0|573|0|{@{}@384|.5|.6617646813392639|{0|}8101|17|}}
{2010210004|XXGflow|208|0|575|0|{@{}@384|.5|.6617646813392639|{0|}8113|18|}}
{2010210004|XXGflow|209|0|577|0|{@{}@384|.5|.6617646813392639|{0|}8108|17|}}
{2010501005|XXGpvertex|210|0|579|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
}}@0|Broadcast|330000|343000|0|0|0|0|8087|Broadcast Index to Parallel Nodes|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|211|0|581|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|212|0|584|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|213|0|587|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
}}@0|Broadcast|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|214|0|589|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|215|0|592|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|216|0|596|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$MFS_LOOKUP_DIR/$INDEX_FILENAME|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@516000|336000|0|0|0|0|8114|Parallel Node Indexes|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|217|0|598|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|218|0|601|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|219|0|603|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|220|0|607|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
}}@0|Replicate|131000|168000|0|0|0|0|8102|Replicate Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|221|0|609|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|222|0|614|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|223|0|616|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|224|0|618|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|225|0|621|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|226|0|625|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$SERIAL_LOOKUP_DIR/$INDEX_FILENAME|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@516000|157000|0|0|0|0|8112|Serial Node Index|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|227|0|627|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|228|0|630|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|229|0|632|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|230|0|636|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
}}@0|Trash|253000|47000|0|0|0|0|8109|Trash Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010202004|XXGiport|231|0|638|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|232|0|641|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|233|0|643|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|234|0|647|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|235|0|654|0|{Subgraph created from graph "test"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_CLINICAL_COMPONENTS/broadcast_lookup_index.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|LKUP_NM||3|8|=|@{0|}}
{30001002|XXparameter|INDEX_NM||3|8|=|@{0|}}
{30001002|XXparameter|SERIAL_LOOKUP_DIR||3|8|=|@{0|}}
{30001002|XXparameter|MFS_LOOKUP_DIR||3|8|=|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|@550000|375500|0|0|0|0|8178|Broadcast Lookup Index 4||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|732000|685000|5|}}
{2010240003|XXGlegend|236|0|656|0|{@{}@Project & Title    : pub_clinical -> components -> Broadcast Lookup Index
Initial Developers : Paul Thompson
Date Created       : November 1, 2016

Input Parameters   :
  LKUP_NM           = Lookup Name
  INDEX_NM          = Index name (optional)
  SERIAL_LOOKUP_DIR = Serial directory to write lookup index into
  MFS_LOOKUP_DIR    = MFS directory to write lookup index into

Description :

If INDEX_NM is provided (i.e. not blank) then write the index into the serial
directory and broadcast to the MFS directory nodes. Otherwise, just write the
index to the trash.|43000|415000|0|0|0|0|8094|}}
{2010242002|XXGface|237|0|658|0|{@{}@Courier New|8421376|100|0|}}
{2010210004|XXGflow|238|0|660|0|{@{}@384|.5|.6617646813392639|{0|}8111|17|}}
{2010210004|XXGflow|239|0|662|0|{@{}@384|.5|.6617646813392639|{0|}8101|17|}}
{2010210004|XXGflow|240|0|664|0|{@{}@384|.5|.6617646813392639|{0|}8113|18|}}
{2010210004|XXGflow|241|0|666|0|{@{}@384|.5|.6617646813392639|{0|}8108|17|}}
{2010501005|XXGpvertex|242|0|668|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Broadcast|330000|343000|0|0|0|0|8087|Broadcast Index to Parallel Nodes|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|243|0|670|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|244|0|673|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|245|0|676|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Replicate|131000|168000|0|0|0|0|8102|Replicate Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|246|0|678|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|247|0|683|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|248|0|689|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@516000|336000|0|0|0|0|8114|Parallel Node Indexes|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|249|0|691|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|250|0|696|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@516000|157000|0|0|0|0|8112|Serial Node Index|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|251|0|698|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|252|0|702|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|Trash|253000|47000|0|0|0|0|8109|Trash Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010202004|XXGiport|253|0|704|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|254|0|709|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|255|0|713|0|{Subgraph created from graph "test"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LKUP_NM|$LKUP_NM|3|9|RFK|@{0|}}
{30001002|XXparameter|INDEX_NM||3|9|FK|@{0|}}
{30001002|XXparameter|SERIAL_LOOKUP_DIR|$PUB_CLINICAL_SERIAL_LOOKUP|26|9|RFK|@{0|}}
{30001002|XXparameter|MFS_LOOKUP_DIR|$PUB_CLINICAL_MFS_LOOKUP|41|9|RFK|@{0|}}
{30001002|XXparameter|___cmt_derived_params_1___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_derived_params_2___|# Derived Parameters|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_derived_params_3___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|INDEX_FILENAME|$LKUP_NM.$INDEX_NM.idx|3|9|RK|@{0|}}
{30001002|XXparameter|ENABLE_TRASH|$[ is_blank(INDEX_NM) ? 'True' : 'False' ]|3|9|RK||{0|}}
{30001002|XXparameter|ENABLE_FILES|$[ not is_blank(INDEX_NM) ? 'True' : 'False' ]|3|9|RK||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|mpcmodtime|1479868146|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@555000|310500|0|0|0|0|251|Broadcast Lookup Index||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|732000|685000|7|}}
{2010240003|XXGlegend|256|0|715|0|{@{}@Project & Title    : pub_clinical -> components -> Broadcast Lookup Index
Initial Developers : Paul Thompson
Date Created       : November 1, 2016

Input Parameters   :
  LKUP_NM           = Lookup Name
  INDEX_NM          = Index name (optional)
  SERIAL_LOOKUP_DIR = Serial directory to write lookup index into
  MFS_LOOKUP_DIR    = MFS directory to write lookup index into

Description :

If INDEX_NM is provided (i.e. not blank) then write the index into the serial
directory and broadcast to the MFS directory nodes. Otherwise, just write the
index to the trash.|43000|415000|0|0|0|0|8094|}}
{2010242002|XXGface|257|0|717|0|{@{}@Courier New|8421376|100|0|}}
{2010210004|XXGflow|258|0|719|0|{@{}@384|.5|.6617646813392639|{0|}8111|17|}}
{2010210004|XXGflow|259|0|721|0|{@{}@384|.5|.6617646813392639|{0|}8101|17|}}
{2010210004|XXGflow|260|0|723|0|{@{}@384|.5|.6617646813392639|{0|}8113|18|}}
{2010210004|XXGflow|261|0|725|0|{@{}@384|.5|.6617646813392639|{0|}8108|17|}}
{2010501005|XXGpvertex|262|0|727|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
}}@0|Broadcast|330000|343000|0|0|0|0|8087|Broadcast Index to Parallel Nodes|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|263|0|729|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|264|0|732|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|265|0|735|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
}}@0|Broadcast|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|266|0|737|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|267|0|740|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|268|0|744|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$MFS_LOOKUP_DIR/$INDEX_FILENAME|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@516000|336000|0|0|0|0|8114|Parallel Node Indexes|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|269|0|746|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|270|0|749|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|271|0|751|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|272|0|755|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
}}@0|Replicate|131000|168000|0|0|0|0|8102|Replicate Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|273|0|757|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|274|0|762|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|275|0|764|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|276|0|766|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|277|0|769|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|278|0|773|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$SERIAL_LOOKUP_DIR/$INDEX_FILENAME|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@516000|157000|0|0|0|0|8112|Serial Node Index|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|279|0|775|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|280|0|778|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|281|0|780|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|282|0|784|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
}}@0|Trash|253000|47000|0|0|0|0|8109|Trash Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010202004|XXGiport|283|0|786|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|284|0|789|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|285|0|791|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|286|0|795|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|287|0|802|0|{Subgraph created from graph "test"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_CLINICAL_COMPONENTS/broadcast_lookup_index.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|LKUP_NM||3|8|=|@{0|}}
{30001002|XXparameter|INDEX_NM||3|8|=|@{0|}}
{30001002|XXparameter|SERIAL_LOOKUP_DIR||3|8|=|@{0|}}
{30001002|XXparameter|MFS_LOOKUP_DIR||3|8|=|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|@755000|480500|0|0|0|0|8179|Broadcast Lookup Index 5||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|732000|685000|5|}}
{2010240003|XXGlegend|288|0|804|0|{@{}@Project & Title    : pub_clinical -> components -> Broadcast Lookup Index
Initial Developers : Paul Thompson
Date Created       : November 1, 2016

Input Parameters   :
  LKUP_NM           = Lookup Name
  INDEX_NM          = Index name (optional)
  SERIAL_LOOKUP_DIR = Serial directory to write lookup index into
  MFS_LOOKUP_DIR    = MFS directory to write lookup index into

Description :

If INDEX_NM is provided (i.e. not blank) then write the index into the serial
directory and broadcast to the MFS directory nodes. Otherwise, just write the
index to the trash.|43000|415000|0|0|0|0|8094|}}
{2010242002|XXGface|289|0|806|0|{@{}@Courier New|8421376|100|0|}}
{2010210004|XXGflow|290|0|810|0|{@{}@384|.5|.6617646813392639|{0|}8113|18|}}
{2010501005|XXGpvertex|291|0|813|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Broadcast|330000|343000|0|0|0|0|8087|Broadcast Index to Parallel Nodes|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|292|0|815|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|293|0|818|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|294|0|824|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@516000|336000|0|0|0|0|8114|Parallel Node Indexes|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|295|0|826|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|296|0|831|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@516000|157000|0|0|0|0|8112|Serial Node Index|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|297|0|833|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|298|0|837|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|Trash|253000|47000|0|0|0|0|8109|Trash Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010202004|XXGiport|299|0|839|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|300|0|844|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|301|0|848|0|{Subgraph created from graph "test"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LKUP_NM|$LKUP_NM|3|9|RFK|@{0|}}
{30001002|XXparameter|INDEX_NM||3|9|FK|@{0|}}
{30001002|XXparameter|SERIAL_LOOKUP_DIR|$PUB_CLINICAL_SERIAL_LOOKUP|26|9|RFK|@{0|}}
{30001002|XXparameter|MFS_LOOKUP_DIR|$PUB_CLINICAL_MFS_LOOKUP|41|9|RFK|@{0|}}
{30001002|XXparameter|___cmt_derived_params_1___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_derived_params_2___|# Derived Parameters|3|1|Kl|@{0|}}
{30001002|XXparameter|___cmt_derived_params_3___|############################################################|3|1|Kl|@{0|}}
{30001002|XXparameter|INDEX_FILENAME|$LKUP_NM.$INDEX_NM.idx|3|9|RK|@{0|}}
{30001002|XXparameter|ENABLE_TRASH|$[ is_blank(INDEX_NM) ? 'True' : 'False' ]|3|9|RK||{0|}}
{30001002|XXparameter|ENABLE_FILES|$[ not is_blank(INDEX_NM) ? 'True' : 'False' ]|3|9|RK||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|mpcmodtime|1479868146|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@555000|310500|0|0|0|0|251|Broadcast Lookup Index||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|732000|685000|7|}}
{2010240003|XXGlegend|302|0|850|0|{@{}@Project & Title    : pub_clinical -> components -> Broadcast Lookup Index
Initial Developers : Paul Thompson
Date Created       : November 1, 2016

Input Parameters   :
  LKUP_NM           = Lookup Name
  INDEX_NM          = Index name (optional)
  SERIAL_LOOKUP_DIR = Serial directory to write lookup index into
  MFS_LOOKUP_DIR    = MFS directory to write lookup index into

Description :

If INDEX_NM is provided (i.e. not blank) then write the index into the serial
directory and broadcast to the MFS directory nodes. Otherwise, just write the
index to the trash.|43000|415000|0|0|0|0|8094|}}
{2010242002|XXGface|303|0|852|0|{@{}@Courier New|8421376|100|0|}}
{2010210004|XXGflow|304|0|854|0|{@{}@384|.5|.6617646813392639|{0|}8111|17|}}
{2010210004|XXGflow|305|0|856|0|{@{}@384|.5|.6617646813392639|{0|}8101|17|}}
{2010210004|XXGflow|306|0|858|0|{@{}@384|.5|.6617646813392639|{0|}8113|18|}}
{2010210004|XXGflow|307|0|860|0|{@{}@384|.5|.6617646813392639|{0|}8108|17|}}
{2010501005|XXGpvertex|308|0|862|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
}}@0|Broadcast|330000|343000|0|0|0|0|8087|Broadcast Index to Parallel Nodes|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|309|0|864|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|310|0|867|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|311|0|870|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
}}@0|Broadcast|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|312|0|872|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|313|0|875|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|314|0|879|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$MFS_LOOKUP_DIR/$INDEX_FILENAME|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@516000|336000|0|0|0|0|8114|Parallel Node Indexes|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|315|0|881|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|316|0|884|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|317|0|886|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|318|0|890|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
}}@0|Replicate|131000|168000|0|0|0|0|8102|Replicate Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|319|0|892|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|320|0|897|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|321|0|899|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|322|0|901|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|323|0|904|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|324|0|908|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$SERIAL_LOOKUP_DIR/$INDEX_FILENAME|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@516000|157000|0|0|0|0|8112|Serial Node Index|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|325|0|910|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|326|0|913|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|327|0|915|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|328|0|919|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
}}@0|Trash|253000|47000|0|0|0|0|8109|Trash Index|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010202004|XXGiport|329|0|921|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|330|0|924|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|331|0|926|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|332|0|930|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010202004|XXGiport|333|0|938|0|{@{}@0|0|0|0|in0|.27734375|@@@13840|0|}}
{2010110002|XXGconstant|334|0|941|0|{@{}@{1|6815297|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_1|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_14|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_2|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_3|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_4|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_5|}1|12|}
{2010601001|XXGgraph_vertex_vertex|12|0|24|0|{Broadcast_Lookup|}1|13|}
{2010605001|XXGgraph_legend_legend|13|0|26|0|{0|}13|14|}
{2010241001|XXGlegend_face_face|14|0|28|0|{}14|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_10|}13|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_11|}13|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_12|}13|18|}
{2010601001|XXGgraph_vertex_vertex|18|0|36|0|{Broadcast_Lookup_to_Parallel_Nodes|}13|19|}
{2010212001|XXGvertex_oport_oport|19|0|38|0|{0|out|}19|20|}
{2010213001|XXGoport_dst_flow|20|0|40|0|{0|}20|18|}
{2010211001|XXGvertex_iport_iport|21|0|41|0|{0|in|}19|21|}
{2010214001|XXGiport_src_flow|22|0|43|0|{0|}21|17|}
{2010006001|XXGobject_psameas_object|23|0|44|0|{Layout|Layout|0|0|}19|22|}
{2010212001|XXGvertex_oport_oport|24|0|46|0|{0|out|}22|23|}
{2010213001|XXGoport_dst_flow|25|0|48|0|{0|}23|16|}
{2010213001|XXGoport_dst_flow|26|0|49|0|{1|}23|17|}
{2010211001|XXGvertex_iport_iport|27|0|50|0|{0|in|}22|24|}
{2010601001|XXGgraph_vertex_vertex|28|0|52|0|{Parallel_Node_Lookups|}13|25|}
{2010211001|XXGvertex_iport_iport|29|0|54|0|{0|write|}25|26|}
{2010214001|XXGiport_src_flow|30|0|56|0|{0|}26|18|}
{2010601001|XXGgraph_vertex_vertex|31|0|57|0|{Replicate_Lookup|}13|22|}
{2010601001|XXGgraph_vertex_vertex|32|0|58|0|{Serial_Node_Lookup|}13|27|}
{2010211001|XXGvertex_iport_iport|33|0|60|0|{0|write|}27|28|}
{2010214001|XXGiport_src_flow|34|0|62|0|{0|}28|16|}
{2010211001|XXGvertex_iport_iport|35|0|63|0|{0|in0|}13|29|}
{2010215002|XXGiport_binding_iport|36|0|65|0|{.5|.5|{0|}8142|}29|24|}
{2010214001|XXGiport_src_flow|37|0|66|0|{0|}29|12|}
{2010007001|XXGobject_proto_object|38|0|67|0|{}13|30|}
{2010605001|XXGgraph_legend_legend|39|0|69|0|{0|}30|31|}
{2010241001|XXGlegend_face_face|40|0|71|0|{}31|32|}
{2010604001|XXGgraph_flow_flow|41|0|73|0|{Flow_10|}30|33|}
{2010604001|XXGgraph_flow_flow|42|0|75|0|{Flow_11|}30|34|}
{2010604001|XXGgraph_flow_flow|43|0|77|0|{Flow_12|}30|35|}
{2010601001|XXGgraph_vertex_vertex|44|0|79|0|{Broadcast_Lookup_to_Parallel_Nodes|}30|36|}
{2010212001|XXGvertex_oport_oport|45|0|81|0|{0|out|}36|37|}
{2010213001|XXGoport_dst_flow|46|0|83|0|{0|}37|35|}
{2010211001|XXGvertex_iport_iport|47|0|84|0|{0|in|}36|38|}
{2010214001|XXGiport_src_flow|48|0|86|0|{0|}38|34|}
{2010007001|XXGobject_proto_object|49|0|87|0|{}36|39|}
{2010212001|XXGvertex_oport_oport|50|0|89|0|{0|out|}39|40|}
{2010006001|XXGobject_psameas_object|51|0|91|0|{metadata|out_metadata|1|0|}40|39|}
{2010211001|XXGvertex_iport_iport|52|0|92|0|{0|in|}39|41|}
{2010006001|XXGobject_psameas_object|53|0|94|0|{metadata|in_metadata|1|0|}41|39|}
{2010601001|XXGgraph_vertex_vertex|54|0|95|0|{Parallel_Node_Lookups|}30|42|}
{2010211001|XXGvertex_iport_iport|55|0|97|0|{0|write|}42|43|}
{2010214001|XXGiport_src_flow|56|0|99|0|{0|}43|35|}
{2010007001|XXGobject_proto_object|57|0|100|0|{}42|44|}
{2010211001|XXGvertex_iport_iport|58|0|102|0|{0|write|}44|45|}
{2010006001|XXGobject_psameas_object|59|0|104|0|{metadata|write_metadata|1|0|}45|44|}
{2010601001|XXGgraph_vertex_vertex|60|0|105|0|{Replicate_Lookup|}30|46|}
{2010212001|XXGvertex_oport_oport|61|0|107|0|{0|out|}46|47|}
{2010213001|XXGoport_dst_flow|62|0|109|0|{0|}47|33|}
{2010213001|XXGoport_dst_flow|63|0|110|0|{1|}47|34|}
{2010211001|XXGvertex_iport_iport|64|0|111|0|{0|in|}46|48|}
{2010007001|XXGobject_proto_object|65|0|113|0|{}46|49|}
{2010212001|XXGvertex_oport_oport|66|0|115|0|{0|out|}49|50|}
{2010006001|XXGobject_psameas_object|67|0|117|0|{metadata|out_metadata|1|0|}50|49|}
{2010211001|XXGvertex_iport_iport|68|0|118|0|{0|in|}49|51|}
{2010006001|XXGobject_psameas_object|69|0|120|0|{metadata|in_metadata|1|0|}51|49|}
{2010006001|XXGobject_psameas_object|70|0|121|0|{condition|WRITE_SERIAL_LOOKUP|1|0|}46|30|}
{2010601001|XXGgraph_vertex_vertex|71|0|122|0|{Serial_Node_Lookup|}30|52|}
{2010211001|XXGvertex_iport_iport|72|0|124|0|{0|write|}52|53|}
{2010214001|XXGiport_src_flow|73|0|126|0|{0|}53|33|}
{2010007001|XXGobject_proto_object|74|0|127|0|{}52|54|}
{2010211001|XXGvertex_iport_iport|75|0|129|0|{0|write|}54|55|}
{2010006001|XXGobject_psameas_object|76|0|131|0|{metadata|write_metadata|1|0|}55|54|}
{2010006001|XXGobject_psameas_object|77|0|132|0|{condition|WRITE_SERIAL_LOOKUP|1|0|}52|30|}
{2010211001|XXGvertex_iport_iport|78|0|133|0|{0|in0|}30|56|}
{2010215002|XXGiport_binding_iport|79|0|135|0|{.5|.5|{0|}8133|}56|48|}
{2010006001|XXGobject_psameas_object|80|0|136|0|{LKUP_NM|LKUP_NM|1|0|}13|1|}
{2010006001|XXGobject_psameas_object|81|0|137|0|{LOOKUP_FILENAME|LOOKUP_FILENAME|1|0|}13|1|}
{2010006001|XXGobject_psameas_object|82|0|138|0|{MFS_LOOKUP_DIR|MFS_LOOKUP_DIR|1|0|}13|1|}
{2010006001|XXGobject_psameas_object|83|0|139|0|{SERIAL_LOOKUP_DIR|SERIAL_LOOKUP_DIR|1|0|}13|1|}
{2010006001|XXGobject_psameas_object|84|0|140|0|{WRITE_SERIAL_LOOKUP|WRITE_SERIAL_LOOKUP|1|0|}13|1|}
{2010601001|XXGgraph_vertex_vertex|85|0|141|0|{Broadcast_Lookup_Index_1|}1|57|}
{2010605001|XXGgraph_legend_legend|86|0|143|0|{0|}57|58|}
{2010241001|XXGlegend_face_face|87|0|145|0|{}58|59|}
{2010604001|XXGgraph_flow_flow|88|0|147|0|{Flow_10|}57|60|}
{2010604001|XXGgraph_flow_flow|89|0|149|0|{Flow_11|}57|61|}
{2010604001|XXGgraph_flow_flow|90|0|151|0|{Flow_12|}57|62|}
{2010604001|XXGgraph_flow_flow|91|0|153|0|{Flow_13|}57|63|}
{2010601001|XXGgraph_vertex_vertex|92|0|155|0|{Broadcast_Index_to_Parallel_Nodes|}57|64|}
{2010212001|XXGvertex_oport_oport|93|0|157|0|{0|out|}64|65|}
{2010213001|XXGoport_dst_flow|94|0|159|0|{0|}65|62|}
{2010211001|XXGvertex_iport_iport|95|0|160|0|{0|in|}64|66|}
{2010214001|XXGiport_src_flow|96|0|162|0|{0|}66|61|}
{2010006001|XXGobject_psameas_object|97|0|163|0|{Layout|Layout|0|0|}64|67|}
{2010212001|XXGvertex_oport_oport|98|0|165|0|{0|out|}67|68|}
{2010213001|XXGoport_dst_flow|99|0|167|0|{0|}68|63|}
{2010213001|XXGoport_dst_flow|100|0|168|0|{1|}68|60|}
{2010213001|XXGoport_dst_flow|101|0|169|0|{2|}68|61|}
{2010211001|XXGvertex_iport_iport|102|0|170|0|{0|in|}67|69|}
{2010006001|XXGobject_psameas_object|103|0|172|0|{in_metadata|index0_metadata|0|0|}67|70|}
{2010212001|XXGvertex_oport_oport|104|0|174|0|{0|out|}70|71|}
{2010213001|XXGoport_dst_flow|105|0|176|0|{0|}71|12|}
{2010212001|XXGvertex_oport_oport|106|0|177|0|{1|index0|}70|72|}
{2010213001|XXGoport_dst_flow|107|0|179|0|{0|}72|8|}
{2010212001|XXGvertex_oport_oport|108|0|180|0|{2|index1|}70|73|}
{2010213001|XXGoport_dst_flow|109|0|182|0|{0|}73|7|}
{2010212001|XXGvertex_oport_oport|110|0|183|0|{3|index2|}70|74|}
{2010213001|XXGoport_dst_flow|111|0|185|0|{0|}74|9|}
{2010212001|XXGvertex_oport_oport|112|0|186|0|{4|index3|}70|75|}
{2010213001|XXGoport_dst_flow|113|0|188|0|{0|}75|10|}
{2010212001|XXGvertex_oport_oport|114|0|189|0|{5|index4|}70|76|}
{2010213001|XXGoport_dst_flow|115|0|191|0|{0|}76|11|}
{2010211001|XXGvertex_iport_iport|116|0|192|0|{0|in|}70|77|}
{2010007001|XXGobject_proto_object|117|0|194|0|{}70|78|}
{2010212001|XXGvertex_oport_oport|118|0|196|0|{0|out|}78|79|}
{2010006001|XXGobject_psameas_object|119|0|198|0|{metadata|out_metadata|1|0|}79|78|}
{2010212001|XXGvertex_oport_oport|120|0|199|0|{1|index0|}78|80|}
{2010006001|XXGobject_psameas_object|121|0|201|0|{key0|key0|1|0|}80|78|}
{2010006001|XXGobject_psameas_object|122|0|202|0|{metadata|index0_metadata|1|0|}80|78|}
{2010212001|XXGvertex_oport_oport|123|0|203|0|{2|index1|}78|81|}
{2010006001|XXGobject_psameas_object|124|0|205|0|{key1|key1|1|0|}81|78|}
{2010006001|XXGobject_psameas_object|125|0|206|0|{metadata|index1_metadata|1|0|}81|78|}
{2010212001|XXGvertex_oport_oport|126|0|207|0|{3|index2|}78|82|}
{2010006001|XXGobject_psameas_object|127|0|209|0|{key2|key2|1|0|}82|78|}
{2010006001|XXGobject_psameas_object|128|0|210|0|{metadata|index2_metadata|1|0|}82|78|}
{2010212001|XXGvertex_oport_oport|129|0|211|0|{4|index3|}78|83|}
{2010006001|XXGobject_psameas_object|130|0|213|0|{key3|key3|1|0|}83|78|}
{2010006001|XXGobject_psameas_object|131|0|214|0|{metadata|index3_metadata|1|0|}83|78|}
{2010212001|XXGvertex_oport_oport|132|0|215|0|{5|index4|}78|84|}
{2010006001|XXGobject_psameas_object|133|0|217|0|{key4|key4|1|0|}84|78|}
{2010006001|XXGobject_psameas_object|134|0|218|0|{metadata|index4_metadata|1|0|}84|78|}
{2010211001|XXGvertex_iport_iport|135|0|219|0|{0|in|}78|85|}
{2010006001|XXGobject_psameas_object|136|0|221|0|{metadata|in_metadata|1|0|}85|78|}
{2010006001|XXGobject_psameas_object|137|0|222|0|{Layout|Layout|0|0|}70|86|}
{2010212001|XXGvertex_oport_oport|138|0|224|0|{0|out|}86|87|}
{2010213001|XXGoport_dst_flow|139|0|226|0|{0|}87|88|}
{2010213001|XXGoport_dst_flow|140|0|228|0|{1|}87|89|}
{2010213001|XXGoport_dst_flow|141|0|230|0|{2|}87|90|}
{2010211001|XXGvertex_iport_iport|142|0|232|0|{0|in|}86|91|}
{2010006001|XXGobject_psameas_object|143|0|234|0|{in_metadata|index4_metadata|0|0|}86|70|}
{2010006001|XXGobject_psameas_object|144|0|235|0|{out_metadata|index4_metadata|0|0|}86|70|}
{2010006001|XXGobject_psameas_object|145|0|236|0|{key0|LKUP_INDEX_KEY_1|1|0|}70|1|}
{2010006001|XXGobject_psameas_object|146|0|237|0|{key1|LKUP_INDEX_KEY_2|1|0|}70|1|}
{2010006001|XXGobject_psameas_object|147|0|238|0|{key2|LKUP_INDEX_KEY_3|1|0|}70|1|}
{2010006001|XXGobject_psameas_object|148|0|239|0|{key3|LKUP_INDEX_KEY_4|1|0|}70|1|}
{2010006001|XXGobject_psameas_object|149|0|240|0|{key4|LKUP_INDEX_KEY_5|1|0|}70|1|}
{2010006001|XXGobject_psameas_object|150|0|241|0|{out_metadata|index0_metadata|0|0|}67|70|}
{2010006001|XXGobject_psameas_object|151|0|242|0|{in_metadata|index0_metadata|0|0|}64|70|}
{2010006001|XXGobject_psameas_object|152|0|243|0|{out_metadata|index0_metadata|0|0|}64|70|}
{2010601001|XXGgraph_vertex_vertex|153|0|244|0|{Parallel_Node_Indexes|}57|92|}
{2010211001|XXGvertex_iport_iport|154|0|246|0|{0|write|}92|93|}
{2010214001|XXGiport_src_flow|155|0|248|0|{0|}93|62|}
{2010006001|XXGobject_psameas_object|156|0|249|0|{write_metadata|index0_metadata|0|0|}92|70|}
{2010601001|XXGgraph_vertex_vertex|157|0|250|0|{Replicate_Index|}57|67|}
{2010601001|XXGgraph_vertex_vertex|158|0|251|0|{Serial_Node_Index|}57|94|}
{2010211001|XXGvertex_iport_iport|159|0|253|0|{0|write|}94|95|}
{2010214001|XXGiport_src_flow|160|0|255|0|{0|}95|60|}
{2010006001|XXGobject_psameas_object|161|0|256|0|{write_metadata|index0_metadata|0|0|}94|70|}
{2010601001|XXGgraph_vertex_vertex|162|0|257|0|{Trash_Index|}57|96|}
{2010211001|XXGvertex_iport_iport|163|0|259|0|{0|in|}96|97|}
{2010214001|XXGiport_src_flow|164|0|261|0|{0|}97|63|}
{2010006001|XXGobject_psameas_object|165|0|262|0|{Layout|Layout|0|0|}96|67|}
{2010006001|XXGobject_psameas_object|166|0|263|0|{in_metadata|index0_metadata|0|0|}96|70|}
{2010211001|XXGvertex_iport_iport|167|0|264|0|{0|in0|}57|98|}
{2010215002|XXGiport_binding_iport|168|0|266|0|{.5|.5|{0|}8115|}98|69|}
{2010214001|XXGiport_src_flow|169|0|267|0|{0|}98|8|}
{2010007001|XXGobject_proto_object|170|0|268|0|{}57|99|}
{2010605001|XXGgraph_legend_legend|171|0|270|0|{0|}99|100|}
{2010241001|XXGlegend_face_face|172|0|272|0|{}100|101|}
{2010604001|XXGgraph_flow_flow|173|0|274|0|{Flow_10|}99|102|}
{2010604001|XXGgraph_flow_flow|174|0|276|0|{Flow_11|}99|103|}
{2010604001|XXGgraph_flow_flow|175|0|278|0|{Flow_12|}99|104|}
{2010604001|XXGgraph_flow_flow|176|0|280|0|{Flow_13|}99|105|}
{2010601001|XXGgraph_vertex_vertex|177|0|282|0|{Broadcast_Index_to_Parallel_Nodes|}99|106|}
{2010212001|XXGvertex_oport_oport|178|0|284|0|{0|out|}106|107|}
{2010213001|XXGoport_dst_flow|179|0|286|0|{0|}107|104|}
{2010211001|XXGvertex_iport_iport|180|0|287|0|{0|in|}106|108|}
{2010214001|XXGiport_src_flow|181|0|289|0|{0|}108|103|}
{2010007001|XXGobject_proto_object|182|0|290|0|{}106|109|}
{2010212001|XXGvertex_oport_oport|183|0|292|0|{0|out|}109|110|}
{2010006001|XXGobject_psameas_object|184|0|294|0|{metadata|out_metadata|1|0|}110|109|}
{2010211001|XXGvertex_iport_iport|185|0|295|0|{0|in|}109|111|}
{2010006001|XXGobject_psameas_object|186|0|297|0|{metadata|in_metadata|1|0|}111|109|}
{2010006001|XXGobject_psameas_object|187|0|298|0|{condition|ENABLE_FILES|1|0|}106|99|}
{2010601001|XXGgraph_vertex_vertex|188|0|299|0|{Parallel_Node_Indexes|}99|112|}
{2010211001|XXGvertex_iport_iport|189|0|301|0|{0|write|}112|113|}
{2010214001|XXGiport_src_flow|190|0|303|0|{0|}113|104|}
{2010007001|XXGobject_proto_object|191|0|304|0|{}112|114|}
{2010211001|XXGvertex_iport_iport|192|0|306|0|{0|write|}114|115|}
{2010006001|XXGobject_psameas_object|193|0|308|0|{metadata|write_metadata|1|0|}115|114|}
{2010006001|XXGobject_psameas_object|194|0|309|0|{condition|ENABLE_FILES|1|0|}112|99|}
{2010601001|XXGgraph_vertex_vertex|195|0|310|0|{Replicate_Index|}99|116|}
{2010212001|XXGvertex_oport_oport|196|0|312|0|{0|out|}116|117|}
{2010213001|XXGoport_dst_flow|197|0|314|0|{0|}117|105|}
{2010213001|XXGoport_dst_flow|198|0|315|0|{1|}117|102|}
{2010213001|XXGoport_dst_flow|199|0|316|0|{2|}117|103|}
{2010211001|XXGvertex_iport_iport|200|0|317|0|{0|in|}116|118|}
{2010007001|XXGobject_proto_object|201|0|319|0|{}116|119|}
{2010212001|XXGvertex_oport_oport|202|0|321|0|{0|out|}119|120|}
{2010006001|XXGobject_psameas_object|203|0|323|0|{metadata|out_metadata|1|0|}120|119|}
{2010211001|XXGvertex_iport_iport|204|0|324|0|{0|in|}119|121|}
{2010006001|XXGobject_psameas_object|205|0|326|0|{metadata|in_metadata|1|0|}121|119|}
{2010006001|XXGobject_psameas_object|206|0|327|0|{condition|ENABLE_FILES|1|0|}116|99|}
{2010601001|XXGgraph_vertex_vertex|207|0|328|0|{Serial_Node_Index|}99|122|}
{2010211001|XXGvertex_iport_iport|208|0|330|0|{0|write|}122|123|}
{2010214001|XXGiport_src_flow|209|0|332|0|{0|}123|102|}
{2010007001|XXGobject_proto_object|210|0|333|0|{}122|124|}
{2010211001|XXGvertex_iport_iport|211|0|335|0|{0|write|}124|125|}
{2010006001|XXGobject_psameas_object|212|0|337|0|{metadata|write_metadata|1|0|}125|124|}
{2010006001|XXGobject_psameas_object|213|0|338|0|{condition|ENABLE_FILES|1|0|}122|99|}
{2010601001|XXGgraph_vertex_vertex|214|0|339|0|{Trash_Index|}99|126|}
{2010211001|XXGvertex_iport_iport|215|0|341|0|{0|in|}126|127|}
{2010214001|XXGiport_src_flow|216|0|343|0|{0|}127|105|}
{2010007001|XXGobject_proto_object|217|0|344|0|{}126|128|}
{2010211001|XXGvertex_iport_iport|218|0|346|0|{0|in|}128|129|}
{2010006001|XXGobject_psameas_object|219|0|348|0|{metadata|in_metadata|1|0|}129|128|}
{2010006001|XXGobject_psameas_object|220|0|349|0|{condition|ENABLE_TRASH|1|0|}126|99|}
{2010211001|XXGvertex_iport_iport|221|0|350|0|{0|in0|}99|130|}
{2010215002|XXGiport_binding_iport|222|0|352|0|{.5|.5|{0|}8110|}130|118|}
{2010006001|XXGobject_psameas_object|223|0|353|0|{INDEX_NM|LKUP_INDEX_NM_1|1|0|}57|1|}
{2010006001|XXGobject_psameas_object|224|0|354|0|{LKUP_NM|LKUP_NM|1|0|}57|1|}
{2010006001|XXGobject_psameas_object|225|0|355|0|{MFS_LOOKUP_DIR|MFS_LOOKUP_DIR|1|0|}57|1|}
{2010006001|XXGobject_psameas_object|226|0|356|0|{SERIAL_LOOKUP_DIR|SERIAL_LOOKUP_DIR|1|0|}57|1|}
{2010601001|XXGgraph_vertex_vertex|227|0|357|0|{Broadcast_Lookup_Index_2|}1|131|}
{2010605001|XXGgraph_legend_legend|228|0|359|0|{0|}131|132|}
{2010241001|XXGlegend_face_face|229|0|361|0|{}132|133|}
{2010604001|XXGgraph_flow_flow|230|0|363|0|{Flow_10|}131|134|}
{2010604001|XXGgraph_flow_flow|231|0|365|0|{Flow_11|}131|135|}
{2010604001|XXGgraph_flow_flow|232|0|367|0|{Flow_12|}131|136|}
{2010604001|XXGgraph_flow_flow|233|0|369|0|{Flow_13|}131|137|}
{2010601001|XXGgraph_vertex_vertex|234|0|371|0|{Broadcast_Index_to_Parallel_Nodes|}131|138|}
{2010212001|XXGvertex_oport_oport|235|0|373|0|{0|out|}138|139|}
{2010213001|XXGoport_dst_flow|236|0|375|0|{0|}139|136|}
{2010211001|XXGvertex_iport_iport|237|0|376|0|{0|in|}138|140|}
{2010214001|XXGiport_src_flow|238|0|378|0|{0|}140|135|}
{2010006001|XXGobject_psameas_object|239|0|379|0|{Layout|Layout|0|0|}138|141|}
{2010212001|XXGvertex_oport_oport|240|0|381|0|{0|out|}141|142|}
{2010213001|XXGoport_dst_flow|241|0|383|0|{0|}142|137|}
{2010213001|XXGoport_dst_flow|242|0|384|0|{1|}142|134|}
{2010213001|XXGoport_dst_flow|243|0|385|0|{2|}142|135|}
{2010211001|XXGvertex_iport_iport|244|0|386|0|{0|in|}141|143|}
{2010006001|XXGobject_psameas_object|245|0|388|0|{in_metadata|index1_metadata|0|0|}141|70|}
{2010006001|XXGobject_psameas_object|246|0|389|0|{out_metadata|index1_metadata|0|0|}141|70|}
{2010006001|XXGobject_psameas_object|247|0|390|0|{in_metadata|index1_metadata|0|0|}138|70|}
{2010006001|XXGobject_psameas_object|248|0|391|0|{out_metadata|index1_metadata|0|0|}138|70|}
{2010601001|XXGgraph_vertex_vertex|249|0|392|0|{Parallel_Node_Indexes|}131|144|}
{2010211001|XXGvertex_iport_iport|250|0|394|0|{0|write|}144|145|}
{2010214001|XXGiport_src_flow|251|0|396|0|{0|}145|136|}
{2010006001|XXGobject_psameas_object|252|0|397|0|{write_metadata|index1_metadata|0|0|}144|70|}
{2010601001|XXGgraph_vertex_vertex|253|0|398|0|{Replicate_Index|}131|141|}
{2010601001|XXGgraph_vertex_vertex|254|0|399|0|{Serial_Node_Index|}131|146|}
{2010211001|XXGvertex_iport_iport|255|0|401|0|{0|write|}146|147|}
{2010214001|XXGiport_src_flow|256|0|403|0|{0|}147|134|}
{2010006001|XXGobject_psameas_object|257|0|404|0|{write_metadata|index1_metadata|0|0|}146|70|}
{2010601001|XXGgraph_vertex_vertex|258|0|405|0|{Trash_Index|}131|148|}
{2010211001|XXGvertex_iport_iport|259|0|407|0|{0|in|}148|149|}
{2010214001|XXGiport_src_flow|260|0|409|0|{0|}149|137|}
{2010006001|XXGobject_psameas_object|261|0|410|0|{Layout|Layout|0|0|}148|141|}
{2010006001|XXGobject_psameas_object|262|0|411|0|{in_metadata|index1_metadata|0|0|}148|70|}
{2010211001|XXGvertex_iport_iport|263|0|412|0|{0|in0|}131|150|}
{2010215002|XXGiport_binding_iport|264|0|414|0|{.5|.5|{0|}8115|}150|143|}
{2010214001|XXGiport_src_flow|265|0|415|0|{0|}150|7|}
{2010007001|XXGobject_proto_object|266|0|416|0|{}131|151|}
{2010605001|XXGgraph_legend_legend|267|0|418|0|{0|}151|152|}
{2010241001|XXGlegend_face_face|268|0|420|0|{}152|153|}
{2010604001|XXGgraph_flow_flow|269|0|422|0|{Flow_10|}151|154|}
{2010604001|XXGgraph_flow_flow|270|0|424|0|{Flow_11|}151|155|}
{2010604001|XXGgraph_flow_flow|271|0|426|0|{Flow_12|}151|156|}
{2010604001|XXGgraph_flow_flow|272|0|428|0|{Flow_13|}151|157|}
{2010601001|XXGgraph_vertex_vertex|273|0|430|0|{Broadcast_Index_to_Parallel_Nodes|}151|158|}
{2010212001|XXGvertex_oport_oport|274|0|432|0|{0|out|}158|159|}
{2010213001|XXGoport_dst_flow|275|0|434|0|{0|}159|156|}
{2010211001|XXGvertex_iport_iport|276|0|435|0|{0|in|}158|160|}
{2010214001|XXGiport_src_flow|277|0|437|0|{0|}160|155|}
{2010007001|XXGobject_proto_object|278|0|438|0|{}158|161|}
{2010212001|XXGvertex_oport_oport|279|0|440|0|{0|out|}161|162|}
{2010006001|XXGobject_psameas_object|280|0|442|0|{metadata|out_metadata|1|0|}162|161|}
{2010211001|XXGvertex_iport_iport|281|0|443|0|{0|in|}161|163|}
{2010006001|XXGobject_psameas_object|282|0|445|0|{metadata|in_metadata|1|0|}163|161|}
{2010006001|XXGobject_psameas_object|283|0|446|0|{condition|ENABLE_FILES|1|0|}158|151|}
{2010601001|XXGgraph_vertex_vertex|284|0|447|0|{Parallel_Node_Indexes|}151|164|}
{2010211001|XXGvertex_iport_iport|285|0|449|0|{0|write|}164|165|}
{2010214001|XXGiport_src_flow|286|0|451|0|{0|}165|156|}
{2010007001|XXGobject_proto_object|287|0|452|0|{}164|166|}
{2010211001|XXGvertex_iport_iport|288|0|454|0|{0|write|}166|167|}
{2010006001|XXGobject_psameas_object|289|0|456|0|{metadata|write_metadata|1|0|}167|166|}
{2010006001|XXGobject_psameas_object|290|0|457|0|{condition|ENABLE_FILES|1|0|}164|151|}
{2010601001|XXGgraph_vertex_vertex|291|0|458|0|{Replicate_Index|}151|168|}
{2010212001|XXGvertex_oport_oport|292|0|460|0|{0|out|}168|169|}
{2010213001|XXGoport_dst_flow|293|0|462|0|{0|}169|157|}
{2010213001|XXGoport_dst_flow|294|0|463|0|{1|}169|154|}
{2010213001|XXGoport_dst_flow|295|0|464|0|{2|}169|155|}
{2010211001|XXGvertex_iport_iport|296|0|465|0|{0|in|}168|170|}
{2010007001|XXGobject_proto_object|297|0|467|0|{}168|171|}
{2010212001|XXGvertex_oport_oport|298|0|469|0|{0|out|}171|172|}
{2010006001|XXGobject_psameas_object|299|0|471|0|{metadata|out_metadata|1|0|}172|171|}
{2010211001|XXGvertex_iport_iport|300|0|472|0|{0|in|}171|173|}
{2010006001|XXGobject_psameas_object|301|0|474|0|{metadata|in_metadata|1|0|}173|171|}
{2010006001|XXGobject_psameas_object|302|0|475|0|{condition|ENABLE_FILES|1|0|}168|151|}
{2010601001|XXGgraph_vertex_vertex|303|0|476|0|{Serial_Node_Index|}151|174|}
{2010211001|XXGvertex_iport_iport|304|0|478|0|{0|write|}174|175|}
{2010214001|XXGiport_src_flow|305|0|480|0|{0|}175|154|}
{2010007001|XXGobject_proto_object|306|0|481|0|{}174|176|}
{2010211001|XXGvertex_iport_iport|307|0|483|0|{0|write|}176|177|}
{2010006001|XXGobject_psameas_object|308|0|485|0|{metadata|write_metadata|1|0|}177|176|}
{2010006001|XXGobject_psameas_object|309|0|486|0|{condition|ENABLE_FILES|1|0|}174|151|}
{2010601001|XXGgraph_vertex_vertex|310|0|487|0|{Trash_Index|}151|178|}
{2010211001|XXGvertex_iport_iport|311|0|489|0|{0|in|}178|179|}
{2010214001|XXGiport_src_flow|312|0|491|0|{0|}179|157|}
{2010007001|XXGobject_proto_object|313|0|492|0|{}178|180|}
{2010211001|XXGvertex_iport_iport|314|0|494|0|{0|in|}180|181|}
{2010006001|XXGobject_psameas_object|315|0|496|0|{metadata|in_metadata|1|0|}181|180|}
{2010006001|XXGobject_psameas_object|316|0|497|0|{condition|ENABLE_TRASH|1|0|}178|151|}
{2010211001|XXGvertex_iport_iport|317|0|498|0|{0|in0|}151|182|}
{2010215002|XXGiport_binding_iport|318|0|500|0|{.5|.5|{0|}8110|}182|170|}
{2010006001|XXGobject_psameas_object|319|0|501|0|{INDEX_NM|LKUP_INDEX_NM_2|1|0|}131|1|}
{2010006001|XXGobject_psameas_object|320|0|502|0|{LKUP_NM|LKUP_NM|1|0|}131|1|}
{2010006001|XXGobject_psameas_object|321|0|503|0|{MFS_LOOKUP_DIR|MFS_LOOKUP_DIR|1|0|}131|1|}
{2010006001|XXGobject_psameas_object|322|0|504|0|{SERIAL_LOOKUP_DIR|SERIAL_LOOKUP_DIR|1|0|}131|1|}
{2010601001|XXGgraph_vertex_vertex|323|0|505|0|{Broadcast_Lookup_Index_3|}1|183|}
{2010605001|XXGgraph_legend_legend|324|0|507|0|{0|}183|184|}
{2010241001|XXGlegend_face_face|325|0|509|0|{}184|185|}
{2010604001|XXGgraph_flow_flow|326|0|511|0|{Flow_10|}183|186|}
{2010604001|XXGgraph_flow_flow|327|0|513|0|{Flow_11|}183|187|}
{2010604001|XXGgraph_flow_flow|328|0|515|0|{Flow_12|}183|188|}
{2010604001|XXGgraph_flow_flow|329|0|517|0|{Flow_13|}183|189|}
{2010601001|XXGgraph_vertex_vertex|330|0|519|0|{Broadcast_Index_to_Parallel_Nodes|}183|190|}
{2010212001|XXGvertex_oport_oport|331|0|521|0|{0|out|}190|191|}
{2010213001|XXGoport_dst_flow|332|0|523|0|{0|}191|188|}
{2010211001|XXGvertex_iport_iport|333|0|524|0|{0|in|}190|192|}
{2010214001|XXGiport_src_flow|334|0|526|0|{0|}192|187|}
{2010006001|XXGobject_psameas_object|335|0|527|0|{Layout|Layout|0|0|}190|193|}
{2010212001|XXGvertex_oport_oport|336|0|529|0|{0|out|}193|194|}
{2010213001|XXGoport_dst_flow|337|0|531|0|{0|}194|189|}
{2010213001|XXGoport_dst_flow|338|0|532|0|{1|}194|186|}
{2010213001|XXGoport_dst_flow|339|0|533|0|{2|}194|187|}
{2010211001|XXGvertex_iport_iport|340|0|534|0|{0|in|}193|195|}
{2010006001|XXGobject_psameas_object|341|0|536|0|{in_metadata|index2_metadata|0|0|}193|70|}
{2010006001|XXGobject_psameas_object|342|0|537|0|{out_metadata|index2_metadata|0|0|}193|70|}
{2010006001|XXGobject_psameas_object|343|0|538|0|{in_metadata|index2_metadata|0|0|}190|70|}
{2010006001|XXGobject_psameas_object|344|0|539|0|{out_metadata|index2_metadata|0|0|}190|70|}
{2010601001|XXGgraph_vertex_vertex|345|0|540|0|{Parallel_Node_Indexes|}183|196|}
{2010211001|XXGvertex_iport_iport|346|0|542|0|{0|write|}196|197|}
{2010214001|XXGiport_src_flow|347|0|544|0|{0|}197|188|}
{2010006001|XXGobject_psameas_object|348|0|545|0|{write_metadata|index2_metadata|0|0|}196|70|}
{2010601001|XXGgraph_vertex_vertex|349|0|546|0|{Replicate_Index|}183|193|}
{2010601001|XXGgraph_vertex_vertex|350|0|547|0|{Serial_Node_Index|}183|198|}
{2010211001|XXGvertex_iport_iport|351|0|549|0|{0|write|}198|199|}
{2010214001|XXGiport_src_flow|352|0|551|0|{0|}199|186|}
{2010006001|XXGobject_psameas_object|353|0|552|0|{write_metadata|index2_metadata|0|0|}198|70|}
{2010601001|XXGgraph_vertex_vertex|354|0|553|0|{Trash_Index|}183|200|}
{2010211001|XXGvertex_iport_iport|355|0|555|0|{0|in|}200|201|}
{2010214001|XXGiport_src_flow|356|0|557|0|{0|}201|189|}
{2010006001|XXGobject_psameas_object|357|0|558|0|{Layout|Layout|0|0|}200|193|}
{2010006001|XXGobject_psameas_object|358|0|559|0|{in_metadata|index2_metadata|0|0|}200|70|}
{2010211001|XXGvertex_iport_iport|359|0|560|0|{0|in0|}183|202|}
{2010215002|XXGiport_binding_iport|360|0|562|0|{.5|.5|{0|}8115|}202|195|}
{2010214001|XXGiport_src_flow|361|0|563|0|{0|}202|9|}
{2010007001|XXGobject_proto_object|362|0|564|0|{}183|203|}
{2010605001|XXGgraph_legend_legend|363|0|566|0|{0|}203|204|}
{2010241001|XXGlegend_face_face|364|0|568|0|{}204|205|}
{2010604001|XXGgraph_flow_flow|365|0|570|0|{Flow_10|}203|206|}
{2010604001|XXGgraph_flow_flow|366|0|572|0|{Flow_11|}203|207|}
{2010604001|XXGgraph_flow_flow|367|0|574|0|{Flow_12|}203|208|}
{2010604001|XXGgraph_flow_flow|368|0|576|0|{Flow_13|}203|209|}
{2010601001|XXGgraph_vertex_vertex|369|0|578|0|{Broadcast_Index_to_Parallel_Nodes|}203|210|}
{2010212001|XXGvertex_oport_oport|370|0|580|0|{0|out|}210|211|}
{2010213001|XXGoport_dst_flow|371|0|582|0|{0|}211|208|}
{2010211001|XXGvertex_iport_iport|372|0|583|0|{0|in|}210|212|}
{2010214001|XXGiport_src_flow|373|0|585|0|{0|}212|207|}
{2010007001|XXGobject_proto_object|374|0|586|0|{}210|213|}
{2010212001|XXGvertex_oport_oport|375|0|588|0|{0|out|}213|214|}
{2010006001|XXGobject_psameas_object|376|0|590|0|{metadata|out_metadata|1|0|}214|213|}
{2010211001|XXGvertex_iport_iport|377|0|591|0|{0|in|}213|215|}
{2010006001|XXGobject_psameas_object|378|0|593|0|{metadata|in_metadata|1|0|}215|213|}
{2010006001|XXGobject_psameas_object|379|0|594|0|{condition|ENABLE_FILES|1|0|}210|203|}
{2010601001|XXGgraph_vertex_vertex|380|0|595|0|{Parallel_Node_Indexes|}203|216|}
{2010211001|XXGvertex_iport_iport|381|0|597|0|{0|write|}216|217|}
{2010214001|XXGiport_src_flow|382|0|599|0|{0|}217|208|}
{2010007001|XXGobject_proto_object|383|0|600|0|{}216|218|}
{2010211001|XXGvertex_iport_iport|384|0|602|0|{0|write|}218|219|}
{2010006001|XXGobject_psameas_object|385|0|604|0|{metadata|write_metadata|1|0|}219|218|}
{2010006001|XXGobject_psameas_object|386|0|605|0|{condition|ENABLE_FILES|1|0|}216|203|}
{2010601001|XXGgraph_vertex_vertex|387|0|606|0|{Replicate_Index|}203|220|}
{2010212001|XXGvertex_oport_oport|388|0|608|0|{0|out|}220|221|}
{2010213001|XXGoport_dst_flow|389|0|610|0|{0|}221|209|}
{2010213001|XXGoport_dst_flow|390|0|611|0|{1|}221|206|}
{2010213001|XXGoport_dst_flow|391|0|612|0|{2|}221|207|}
{2010211001|XXGvertex_iport_iport|392|0|613|0|{0|in|}220|222|}
{2010007001|XXGobject_proto_object|393|0|615|0|{}220|223|}
{2010212001|XXGvertex_oport_oport|394|0|617|0|{0|out|}223|224|}
{2010006001|XXGobject_psameas_object|395|0|619|0|{metadata|out_metadata|1|0|}224|223|}
{2010211001|XXGvertex_iport_iport|396|0|620|0|{0|in|}223|225|}
{2010006001|XXGobject_psameas_object|397|0|622|0|{metadata|in_metadata|1|0|}225|223|}
{2010006001|XXGobject_psameas_object|398|0|623|0|{condition|ENABLE_FILES|1|0|}220|203|}
{2010601001|XXGgraph_vertex_vertex|399|0|624|0|{Serial_Node_Index|}203|226|}
{2010211001|XXGvertex_iport_iport|400|0|626|0|{0|write|}226|227|}
{2010214001|XXGiport_src_flow|401|0|628|0|{0|}227|206|}
{2010007001|XXGobject_proto_object|402|0|629|0|{}226|228|}
{2010211001|XXGvertex_iport_iport|403|0|631|0|{0|write|}228|229|}
{2010006001|XXGobject_psameas_object|404|0|633|0|{metadata|write_metadata|1|0|}229|228|}
{2010006001|XXGobject_psameas_object|405|0|634|0|{condition|ENABLE_FILES|1|0|}226|203|}
{2010601001|XXGgraph_vertex_vertex|406|0|635|0|{Trash_Index|}203|230|}
{2010211001|XXGvertex_iport_iport|407|0|637|0|{0|in|}230|231|}
{2010214001|XXGiport_src_flow|408|0|639|0|{0|}231|209|}
{2010007001|XXGobject_proto_object|409|0|640|0|{}230|232|}
{2010211001|XXGvertex_iport_iport|410|0|642|0|{0|in|}232|233|}
{2010006001|XXGobject_psameas_object|411|0|644|0|{metadata|in_metadata|1|0|}233|232|}
{2010006001|XXGobject_psameas_object|412|0|645|0|{condition|ENABLE_TRASH|1|0|}230|203|}
{2010211001|XXGvertex_iport_iport|413|0|646|0|{0|in0|}203|234|}
{2010215002|XXGiport_binding_iport|414|0|648|0|{.5|.5|{0|}8110|}234|222|}
{2010006001|XXGobject_psameas_object|415|0|649|0|{INDEX_NM|LKUP_INDEX_NM_3|1|0|}183|1|}
{2010006001|XXGobject_psameas_object|416|0|650|0|{LKUP_NM|LKUP_NM|1|0|}183|1|}
{2010006001|XXGobject_psameas_object|417|0|651|0|{MFS_LOOKUP_DIR|MFS_LOOKUP_DIR|1|0|}183|1|}
{2010006001|XXGobject_psameas_object|418|0|652|0|{SERIAL_LOOKUP_DIR|SERIAL_LOOKUP_DIR|1|0|}183|1|}
{2010601001|XXGgraph_vertex_vertex|419|0|653|0|{Broadcast_Lookup_Index_4|}1|235|}
{2010605001|XXGgraph_legend_legend|420|0|655|0|{0|}235|236|}
{2010241001|XXGlegend_face_face|421|0|657|0|{}236|237|}
{2010604001|XXGgraph_flow_flow|422|0|659|0|{Flow_10|}235|238|}
{2010604001|XXGgraph_flow_flow|423|0|661|0|{Flow_11|}235|239|}
{2010604001|XXGgraph_flow_flow|424|0|663|0|{Flow_12|}235|240|}
{2010604001|XXGgraph_flow_flow|425|0|665|0|{Flow_13|}235|241|}
{2010601001|XXGgraph_vertex_vertex|426|0|667|0|{Broadcast_Index_to_Parallel_Nodes|}235|242|}
{2010212001|XXGvertex_oport_oport|427|0|669|0|{0|out|}242|243|}
{2010213001|XXGoport_dst_flow|428|0|671|0|{0|}243|240|}
{2010211001|XXGvertex_iport_iport|429|0|672|0|{0|in|}242|244|}
{2010214001|XXGiport_src_flow|430|0|674|0|{0|}244|239|}
{2010006001|XXGobject_psameas_object|431|0|675|0|{Layout|Layout|0|0|}242|245|}
{2010212001|XXGvertex_oport_oport|432|0|677|0|{0|out|}245|246|}
{2010213001|XXGoport_dst_flow|433|0|679|0|{0|}246|241|}
{2010213001|XXGoport_dst_flow|434|0|680|0|{1|}246|238|}
{2010213001|XXGoport_dst_flow|435|0|681|0|{2|}246|239|}
{2010211001|XXGvertex_iport_iport|436|0|682|0|{0|in|}245|247|}
{2010006001|XXGobject_psameas_object|437|0|684|0|{in_metadata|index3_metadata|0|0|}245|70|}
{2010006001|XXGobject_psameas_object|438|0|685|0|{out_metadata|index3_metadata|0|0|}245|70|}
{2010006001|XXGobject_psameas_object|439|0|686|0|{in_metadata|index3_metadata|0|0|}242|70|}
{2010006001|XXGobject_psameas_object|440|0|687|0|{out_metadata|index3_metadata|0|0|}242|70|}
{2010601001|XXGgraph_vertex_vertex|441|0|688|0|{Parallel_Node_Indexes|}235|248|}
{2010211001|XXGvertex_iport_iport|442|0|690|0|{0|write|}248|249|}
{2010214001|XXGiport_src_flow|443|0|692|0|{0|}249|240|}
{2010006001|XXGobject_psameas_object|444|0|693|0|{write_metadata|index3_metadata|0|0|}248|70|}
{2010601001|XXGgraph_vertex_vertex|445|0|694|0|{Replicate_Index|}235|245|}
{2010601001|XXGgraph_vertex_vertex|446|0|695|0|{Serial_Node_Index|}235|250|}
{2010211001|XXGvertex_iport_iport|447|0|697|0|{0|write|}250|251|}
{2010214001|XXGiport_src_flow|448|0|699|0|{0|}251|238|}
{2010006001|XXGobject_psameas_object|449|0|700|0|{write_metadata|index3_metadata|0|0|}250|70|}
{2010601001|XXGgraph_vertex_vertex|450|0|701|0|{Trash_Index|}235|252|}
{2010211001|XXGvertex_iport_iport|451|0|703|0|{0|in|}252|253|}
{2010214001|XXGiport_src_flow|452|0|705|0|{0|}253|241|}
{2010006001|XXGobject_psameas_object|453|0|706|0|{Layout|Layout|0|0|}252|245|}
{2010006001|XXGobject_psameas_object|454|0|707|0|{in_metadata|index3_metadata|0|0|}252|70|}
{2010211001|XXGvertex_iport_iport|455|0|708|0|{0|in0|}235|254|}
{2010215002|XXGiport_binding_iport|456|0|710|0|{.5|.5|{0|}8115|}254|247|}
{2010214001|XXGiport_src_flow|457|0|711|0|{0|}254|10|}
{2010007001|XXGobject_proto_object|458|0|712|0|{}235|255|}
{2010605001|XXGgraph_legend_legend|459|0|714|0|{0|}255|256|}
{2010241001|XXGlegend_face_face|460|0|716|0|{}256|257|}
{2010604001|XXGgraph_flow_flow|461|0|718|0|{Flow_10|}255|258|}
{2010604001|XXGgraph_flow_flow|462|0|720|0|{Flow_11|}255|259|}
{2010604001|XXGgraph_flow_flow|463|0|722|0|{Flow_12|}255|260|}
{2010604001|XXGgraph_flow_flow|464|0|724|0|{Flow_13|}255|261|}
{2010601001|XXGgraph_vertex_vertex|465|0|726|0|{Broadcast_Index_to_Parallel_Nodes|}255|262|}
{2010212001|XXGvertex_oport_oport|466|0|728|0|{0|out|}262|263|}
{2010213001|XXGoport_dst_flow|467|0|730|0|{0|}263|260|}
{2010211001|XXGvertex_iport_iport|468|0|731|0|{0|in|}262|264|}
{2010214001|XXGiport_src_flow|469|0|733|0|{0|}264|259|}
{2010007001|XXGobject_proto_object|470|0|734|0|{}262|265|}
{2010212001|XXGvertex_oport_oport|471|0|736|0|{0|out|}265|266|}
{2010006001|XXGobject_psameas_object|472|0|738|0|{metadata|out_metadata|1|0|}266|265|}
{2010211001|XXGvertex_iport_iport|473|0|739|0|{0|in|}265|267|}
{2010006001|XXGobject_psameas_object|474|0|741|0|{metadata|in_metadata|1|0|}267|265|}
{2010006001|XXGobject_psameas_object|475|0|742|0|{condition|ENABLE_FILES|1|0|}262|255|}
{2010601001|XXGgraph_vertex_vertex|476|0|743|0|{Parallel_Node_Indexes|}255|268|}
{2010211001|XXGvertex_iport_iport|477|0|745|0|{0|write|}268|269|}
{2010214001|XXGiport_src_flow|478|0|747|0|{0|}269|260|}
{2010007001|XXGobject_proto_object|479|0|748|0|{}268|270|}
{2010211001|XXGvertex_iport_iport|480|0|750|0|{0|write|}270|271|}
{2010006001|XXGobject_psameas_object|481|0|752|0|{metadata|write_metadata|1|0|}271|270|}
{2010006001|XXGobject_psameas_object|482|0|753|0|{condition|ENABLE_FILES|1|0|}268|255|}
{2010601001|XXGgraph_vertex_vertex|483|0|754|0|{Replicate_Index|}255|272|}
{2010212001|XXGvertex_oport_oport|484|0|756|0|{0|out|}272|273|}
{2010213001|XXGoport_dst_flow|485|0|758|0|{0|}273|261|}
{2010213001|XXGoport_dst_flow|486|0|759|0|{1|}273|258|}
{2010213001|XXGoport_dst_flow|487|0|760|0|{2|}273|259|}
{2010211001|XXGvertex_iport_iport|488|0|761|0|{0|in|}272|274|}
{2010007001|XXGobject_proto_object|489|0|763|0|{}272|275|}
{2010212001|XXGvertex_oport_oport|490|0|765|0|{0|out|}275|276|}
{2010006001|XXGobject_psameas_object|491|0|767|0|{metadata|out_metadata|1|0|}276|275|}
{2010211001|XXGvertex_iport_iport|492|0|768|0|{0|in|}275|277|}
{2010006001|XXGobject_psameas_object|493|0|770|0|{metadata|in_metadata|1|0|}277|275|}
{2010006001|XXGobject_psameas_object|494|0|771|0|{condition|ENABLE_FILES|1|0|}272|255|}
{2010601001|XXGgraph_vertex_vertex|495|0|772|0|{Serial_Node_Index|}255|278|}
{2010211001|XXGvertex_iport_iport|496|0|774|0|{0|write|}278|279|}
{2010214001|XXGiport_src_flow|497|0|776|0|{0|}279|258|}
{2010007001|XXGobject_proto_object|498|0|777|0|{}278|280|}
{2010211001|XXGvertex_iport_iport|499|0|779|0|{0|write|}280|281|}
{2010006001|XXGobject_psameas_object|500|0|781|0|{metadata|write_metadata|1|0|}281|280|}
{2010006001|XXGobject_psameas_object|501|0|782|0|{condition|ENABLE_FILES|1|0|}278|255|}
{2010601001|XXGgraph_vertex_vertex|502|0|783|0|{Trash_Index|}255|282|}
{2010211001|XXGvertex_iport_iport|503|0|785|0|{0|in|}282|283|}
{2010214001|XXGiport_src_flow|504|0|787|0|{0|}283|261|}
{2010007001|XXGobject_proto_object|505|0|788|0|{}282|284|}
{2010211001|XXGvertex_iport_iport|506|0|790|0|{0|in|}284|285|}
{2010006001|XXGobject_psameas_object|507|0|792|0|{metadata|in_metadata|1|0|}285|284|}
{2010006001|XXGobject_psameas_object|508|0|793|0|{condition|ENABLE_TRASH|1|0|}282|255|}
{2010211001|XXGvertex_iport_iport|509|0|794|0|{0|in0|}255|286|}
{2010215002|XXGiport_binding_iport|510|0|796|0|{.5|.5|{0|}8110|}286|274|}
{2010006001|XXGobject_psameas_object|511|0|797|0|{INDEX_NM|LKUP_INDEX_NM_4|1|0|}235|1|}
{2010006001|XXGobject_psameas_object|512|0|798|0|{LKUP_NM|LKUP_NM|1|0|}235|1|}
{2010006001|XXGobject_psameas_object|513|0|799|0|{MFS_LOOKUP_DIR|MFS_LOOKUP_DIR|1|0|}235|1|}
{2010006001|XXGobject_psameas_object|514|0|800|0|{SERIAL_LOOKUP_DIR|SERIAL_LOOKUP_DIR|1|0|}235|1|}
{2010601001|XXGgraph_vertex_vertex|515|0|801|0|{Broadcast_Lookup_Index_5|}1|287|}
{2010605001|XXGgraph_legend_legend|516|0|803|0|{0|}287|288|}
{2010241001|XXGlegend_face_face|517|0|805|0|{}288|289|}
{2010604001|XXGgraph_flow_flow|518|0|807|0|{Flow_10|}287|89|}
{2010604001|XXGgraph_flow_flow|519|0|808|0|{Flow_11|}287|90|}
{2010604001|XXGgraph_flow_flow|520|0|809|0|{Flow_12|}287|290|}
{2010604001|XXGgraph_flow_flow|521|0|811|0|{Flow_13|}287|88|}
{2010601001|XXGgraph_vertex_vertex|522|0|812|0|{Broadcast_Index_to_Parallel_Nodes|}287|291|}
{2010212001|XXGvertex_oport_oport|523|0|814|0|{0|out|}291|292|}
{2010213001|XXGoport_dst_flow|524|0|816|0|{0|}292|290|}
{2010211001|XXGvertex_iport_iport|525|0|817|0|{0|in|}291|293|}
{2010214001|XXGiport_src_flow|526|0|819|0|{0|}293|90|}
{2010006001|XXGobject_psameas_object|527|0|820|0|{Layout|Layout|0|0|}291|86|}
{2010006001|XXGobject_psameas_object|528|0|821|0|{in_metadata|index4_metadata|0|0|}291|70|}
{2010006001|XXGobject_psameas_object|529|0|822|0|{out_metadata|index4_metadata|0|0|}291|70|}
{2010601001|XXGgraph_vertex_vertex|530|0|823|0|{Parallel_Node_Indexes|}287|294|}
{2010211001|XXGvertex_iport_iport|531|0|825|0|{0|write|}294|295|}
{2010214001|XXGiport_src_flow|532|0|827|0|{0|}295|290|}
{2010006001|XXGobject_psameas_object|533|0|828|0|{write_metadata|index4_metadata|0|0|}294|70|}
{2010601001|XXGgraph_vertex_vertex|534|0|829|0|{Replicate_Index|}287|86|}
{2010601001|XXGgraph_vertex_vertex|535|0|830|0|{Serial_Node_Index|}287|296|}
{2010211001|XXGvertex_iport_iport|536|0|832|0|{0|write|}296|297|}
{2010214001|XXGiport_src_flow|537|0|834|0|{0|}297|89|}
{2010006001|XXGobject_psameas_object|538|0|835|0|{write_metadata|index4_metadata|0|0|}296|70|}
{2010601001|XXGgraph_vertex_vertex|539|0|836|0|{Trash_Index|}287|298|}
{2010211001|XXGvertex_iport_iport|540|0|838|0|{0|in|}298|299|}
{2010214001|XXGiport_src_flow|541|0|840|0|{0|}299|88|}
{2010006001|XXGobject_psameas_object|542|0|841|0|{Layout|Layout|0|0|}298|86|}
{2010006001|XXGobject_psameas_object|543|0|842|0|{in_metadata|index4_metadata|0|0|}298|70|}
{2010211001|XXGvertex_iport_iport|544|0|843|0|{0|in0|}287|300|}
{2010215002|XXGiport_binding_iport|545|0|845|0|{.5|.5|{0|}8115|}300|91|}
{2010214001|XXGiport_src_flow|546|0|846|0|{0|}300|11|}
{2010007001|XXGobject_proto_object|547|0|847|0|{}287|301|}
{2010605001|XXGgraph_legend_legend|548|0|849|0|{0|}301|302|}
{2010241001|XXGlegend_face_face|549|0|851|0|{}302|303|}
{2010604001|XXGgraph_flow_flow|550|0|853|0|{Flow_10|}301|304|}
{2010604001|XXGgraph_flow_flow|551|0|855|0|{Flow_11|}301|305|}
{2010604001|XXGgraph_flow_flow|552|0|857|0|{Flow_12|}301|306|}
{2010604001|XXGgraph_flow_flow|553|0|859|0|{Flow_13|}301|307|}
{2010601001|XXGgraph_vertex_vertex|554|0|861|0|{Broadcast_Index_to_Parallel_Nodes|}301|308|}
{2010212001|XXGvertex_oport_oport|555|0|863|0|{0|out|}308|309|}
{2010213001|XXGoport_dst_flow|556|0|865|0|{0|}309|306|}
{2010211001|XXGvertex_iport_iport|557|0|866|0|{0|in|}308|310|}
{2010214001|XXGiport_src_flow|558|0|868|0|{0|}310|305|}
{2010007001|XXGobject_proto_object|559|0|869|0|{}308|311|}
{2010212001|XXGvertex_oport_oport|560|0|871|0|{0|out|}311|312|}
{2010006001|XXGobject_psameas_object|561|0|873|0|{metadata|out_metadata|1|0|}312|311|}
{2010211001|XXGvertex_iport_iport|562|0|874|0|{0|in|}311|313|}
{2010006001|XXGobject_psameas_object|563|0|876|0|{metadata|in_metadata|1|0|}313|311|}
{2010006001|XXGobject_psameas_object|564|0|877|0|{condition|ENABLE_FILES|1|0|}308|301|}
{2010601001|XXGgraph_vertex_vertex|565|0|878|0|{Parallel_Node_Indexes|}301|314|}
{2010211001|XXGvertex_iport_iport|566|0|880|0|{0|write|}314|315|}
{2010214001|XXGiport_src_flow|567|0|882|0|{0|}315|306|}
{2010007001|XXGobject_proto_object|568|0|883|0|{}314|316|}
{2010211001|XXGvertex_iport_iport|569|0|885|0|{0|write|}316|317|}
{2010006001|XXGobject_psameas_object|570|0|887|0|{metadata|write_metadata|1|0|}317|316|}
{2010006001|XXGobject_psameas_object|571|0|888|0|{condition|ENABLE_FILES|1|0|}314|301|}
{2010601001|XXGgraph_vertex_vertex|572|0|889|0|{Replicate_Index|}301|318|}
{2010212001|XXGvertex_oport_oport|573|0|891|0|{0|out|}318|319|}
{2010213001|XXGoport_dst_flow|574|0|893|0|{0|}319|307|}
{2010213001|XXGoport_dst_flow|575|0|894|0|{1|}319|304|}
{2010213001|XXGoport_dst_flow|576|0|895|0|{2|}319|305|}
{2010211001|XXGvertex_iport_iport|577|0|896|0|{0|in|}318|320|}
{2010007001|XXGobject_proto_object|578|0|898|0|{}318|321|}
{2010212001|XXGvertex_oport_oport|579|0|900|0|{0|out|}321|322|}
{2010006001|XXGobject_psameas_object|580|0|902|0|{metadata|out_metadata|1|0|}322|321|}
{2010211001|XXGvertex_iport_iport|581|0|903|0|{0|in|}321|323|}
{2010006001|XXGobject_psameas_object|582|0|905|0|{metadata|in_metadata|1|0|}323|321|}
{2010006001|XXGobject_psameas_object|583|0|906|0|{condition|ENABLE_FILES|1|0|}318|301|}
{2010601001|XXGgraph_vertex_vertex|584|0|907|0|{Serial_Node_Index|}301|324|}
{2010211001|XXGvertex_iport_iport|585|0|909|0|{0|write|}324|325|}
{2010214001|XXGiport_src_flow|586|0|911|0|{0|}325|304|}
{2010007001|XXGobject_proto_object|587|0|912|0|{}324|326|}
{2010211001|XXGvertex_iport_iport|588|0|914|0|{0|write|}326|327|}
{2010006001|XXGobject_psameas_object|589|0|916|0|{metadata|write_metadata|1|0|}327|326|}
{2010006001|XXGobject_psameas_object|590|0|917|0|{condition|ENABLE_FILES|1|0|}324|301|}
{2010601001|XXGgraph_vertex_vertex|591|0|918|0|{Trash_Index|}301|328|}
{2010211001|XXGvertex_iport_iport|592|0|920|0|{0|in|}328|329|}
{2010214001|XXGiport_src_flow|593|0|922|0|{0|}329|307|}
{2010007001|XXGobject_proto_object|594|0|923|0|{}328|330|}
{2010211001|XXGvertex_iport_iport|595|0|925|0|{0|in|}330|331|}
{2010006001|XXGobject_psameas_object|596|0|927|0|{metadata|in_metadata|1|0|}331|330|}
{2010006001|XXGobject_psameas_object|597|0|928|0|{condition|ENABLE_TRASH|1|0|}328|301|}
{2010211001|XXGvertex_iport_iport|598|0|929|0|{0|in0|}301|332|}
{2010215002|XXGiport_binding_iport|599|0|931|0|{.5|.5|{0|}8110|}332|320|}
{2010006001|XXGobject_psameas_object|600|0|932|0|{INDEX_NM|LKUP_INDEX_NM_5|1|0|}287|1|}
{2010006001|XXGobject_psameas_object|601|0|933|0|{LKUP_NM|LKUP_NM|1|0|}287|1|}
{2010006001|XXGobject_psameas_object|602|0|934|0|{MFS_LOOKUP_DIR|MFS_LOOKUP_DIR|1|0|}287|1|}
{2010006001|XXGobject_psameas_object|603|0|935|0|{SERIAL_LOOKUP_DIR|SERIAL_LOOKUP_DIR|1|0|}287|1|}
{2010601001|XXGgraph_vertex_vertex|604|0|936|0|{Write_Lookup|}1|70|}
{2010211001|XXGvertex_iport_iport|605|0|937|0|{0|in0|}1|333|}
{2010215002|XXGiport_binding_iport|606|0|939|0|{.5|.5|{0|}8173|}333|77|}
{2010109001|XXGobject_property_value|607|0|940|0|{0|TrackingThumbprint|72|}1|334|}
