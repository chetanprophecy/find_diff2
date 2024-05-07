@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|66|rel_count|110|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{Subgraph created from graph "publish.ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|PARTITIONING_SCHEME|PBRR|15|9|RFK|The Partitioning Scheme to use : for layout depth changes and required partitioning : valid choices : SORT, NBNS [ No Sort No partitioning], PBKS, PBK, PBRR : default PBRR or NBNS|{6|PBRR|NPNS|PBK|PBKS|SORT|GTHR|}}
{30001002|XXparameter|PBK_KEY||3|9|FK|PBK_KEY : Key for partitioning|{0|}}
{30001002|XXparameter|SRT_KEY||3|9|FK|Key For Sort|{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
}}@0|@353500|150000|0|0|0|0|12392|Partition And/Or Sort|ajrambar.kad|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1080000|567000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.2.0|{1|0|}Job 'optional_partitioning' Execution Status Report

Job completed successfully at Monday, August 22, 2016 08:01:15
Run performed by user ajrambar.kad
||# Make sure the serial directories exist.
mkdir -m 2775 -p \\
  "$AI_SERIAL_LOG/get.$SOURCE_SYSTEM" \\
  "$AI_SERIAL_LOOKUP/lookup.$SOURCE_SYSTEM" \\
  "$AI_SERIAL_TEMP/get.$SOURCE_SYSTEM"

# Make sure the multifile directories exist.
for d in "$AI_MFS/source.$SOURCE_SYSTEM" \\
         "$AI_MFS/clean.$SOURCE_SYSTEM" \\
         "$AI_MFS_REJECT/get.$SOURCE_SYSTEM"; do
  d="$(echo $d \| sed 's/mfile://')"
  p="$(dirname "$d ")"
  [[ -d "$p" ]] \|\| m_mkdir -mode 2775 "$p"
  [[ -d "$d" ]] \|\| m_mkdir -mode 2775 "$d"
done

# Make sure the Dataset ID Lookup exists.
touch "$DATASET_ID_LOOKUP_PATH"

# Write the summary tracking info.
export AB_REPORT="summary=$AI_SERIAL_LOG/get.$SOURCE_SYSTEM/get.ids.$SOURCE_LOWER.summary.log $AB_REPORT"

||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@IDW PLM Dev 1 4.0||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|255|160|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.43525180220603943|{0|}12425|20|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{0|}12443|17|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}12433|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}12434|532|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}12439|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}12444|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5507692098617554|{0|}12426|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}12438|20|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}12404|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}12422|532|}}
{2010501005|XXGpvertex|15|0|29|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[PARTITIONING_SCHEME == "GTHR"]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Gather|495000|504000|0|0|0|0|12449|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|16|0|31|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|17|0|34|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|18|0|37|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Gather|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|19|0|39|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|20|0|42|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|21|0|45|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|in_metadata|@3|9|s|@{0|}}
{30001002|XXparameter|out_metadata|@3|9|s|@{0|}}
}}@0|Replicate|101000|181000|0|0|0|0|12455|Rplct: Input Layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|22|0|47|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|23|0|53|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|24|0|55|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|25|0|57|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|26|0|60|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|27|0|63|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME == "NPNS"]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Gather|522000|390000|0|0|0|0|12450|Gather-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|28|0|65|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|29|0|68|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|30|0|71|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Gather|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|31|0|73|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|32|0|76|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|33|0|80|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$PBK_KEY|3|9||@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME member [vector "PBK", "PBKS"]]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata|@3|9|s|@{0|}}
{30001002|XXparameter|out_metadata|@3|9|s|@{0|}}
}}@0|Partition by Key|307000|116000|0|0|0|0|12451|PBK : \{PBK_KEY\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|34|0|82|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|35|0|85|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|36|0|88|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to partition on|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Partition by Key|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|37|0|90|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|38|0|93|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|39|0|97|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME == "PBRR"]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata|@3|9|s|@{0|}}
{30001002|XXparameter|out_metadata|@3|9|s|@{0|}}
}}@0|Partition by Round-robin|521000|231000|0|0|0|0|12452|PBRR|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|40|0|99|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|41|0|102|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|42|0|105|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Partition by Round-robin|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|43|0|107|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|44|0|110|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|45|0|114|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME member [vector "PBK", "PBKS", "SORT"]]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata|@3|9|s|@{0|}}
{30001002|XXparameter|out_metadata|@3|9|s|@{0|}}
}}@0|Replicate|514000|114000|0|0|0|0|12453|Rplct|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|46|0|116|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|47|0|119|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|48|0|122|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|49|0|124|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|50|0|127|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|51|0|130|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata|@3|9|s|@{0|}}
{30001002|XXparameter|out_metadata|@3|9|s|@{0|}}
}}@0|Replicate|932000|225000|0|0|0|0|12457|Rplct : Ouput Layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|52|0|132|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|53|0|134|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|54|0|140|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|55|0|142|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|56|0|145|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|57|0|151|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$SRT_KEY|3|9||@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME member [vector "SORT", "PBKS"]]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata|@3|9|s|@{0|}}
{30001002|XXparameter|out_metadata|@3|9|s|@{0|}}
}}@0|Sort|654000|83000|0|0|0|0|12458|Srt : \{SRT_KEY\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|58|0|153|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|59|0|156|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|60|0|159|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|61|0|161|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|62|0|164|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|63|0|168|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|64|0|171|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010110002|XXGconstant|65|0|174|0|{@{}@{1|9243723|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_14|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_15|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_17|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_18|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_19|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_2|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_3|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_6|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_7|}1|14|}
{2010601001|XXGgraph_vertex_vertex|14|0|28|0|{Gather|}1|15|}
{2010212001|XXGvertex_oport_oport|15|0|30|0|{0|out|}15|16|}
{2010213001|XXGoport_dst_flow|16|0|32|0|{0|}16|11|}
{2010211001|XXGvertex_iport_iport|17|0|33|0|{0|in|}15|17|}
{2010214001|XXGiport_src_flow|18|0|35|0|{0|}17|5|}
{2010007001|XXGobject_proto_object|19|0|36|0|{}15|18|}
{2010212001|XXGvertex_oport_oport|20|0|38|0|{0|out|}18|19|}
{2010006001|XXGobject_psameas_object|21|0|40|0|{metadata|out_metadata|1|0|}19|18|}
{2010211001|XXGvertex_iport_iport|22|0|41|0|{0|in|}18|20|}
{2010006001|XXGobject_psameas_object|23|0|43|0|{metadata|in_metadata|1|0|}20|18|}
{2010006001|XXGobject_psameas_object|24|0|44|0|{Layout|Layout|0|0|}15|21|}
{2010212001|XXGvertex_oport_oport|25|0|46|0|{0|out|}21|22|}
{2010213001|XXGoport_dst_flow|26|0|48|0|{0|}22|13|}
{2010213001|XXGoport_dst_flow|27|0|49|0|{1|}22|7|}
{2010213001|XXGoport_dst_flow|28|0|50|0|{2|}22|12|}
{2010213001|XXGoport_dst_flow|29|0|51|0|{3|}22|5|}
{2010211001|XXGvertex_iport_iport|30|0|52|0|{0|in|}21|23|}
{2010007001|XXGobject_proto_object|31|0|54|0|{}21|24|}
{2010212001|XXGvertex_oport_oport|32|0|56|0|{0|out|}24|25|}
{2010006001|XXGobject_psameas_object|33|0|58|0|{metadata|out_metadata|1|0|}25|24|}
{2010211001|XXGvertex_iport_iport|34|0|59|0|{0|in|}24|26|}
{2010006001|XXGobject_psameas_object|35|0|61|0|{metadata|in_metadata|1|0|}26|24|}
{2010601001|XXGgraph_vertex_vertex|36|0|62|0|{Gather_1|}1|27|}
{2010212001|XXGvertex_oport_oport|37|0|64|0|{0|out|}27|28|}
{2010213001|XXGoport_dst_flow|38|0|66|0|{0|}28|9|}
{2010211001|XXGvertex_iport_iport|39|0|67|0|{0|in|}27|29|}
{2010214001|XXGiport_src_flow|40|0|69|0|{0|}29|12|}
{2010007001|XXGobject_proto_object|41|0|70|0|{}27|30|}
{2010212001|XXGvertex_oport_oport|42|0|72|0|{0|out|}30|31|}
{2010006001|XXGobject_psameas_object|43|0|74|0|{metadata|out_metadata|1|0|}31|30|}
{2010211001|XXGvertex_iport_iport|44|0|75|0|{0|in|}30|32|}
{2010006001|XXGobject_psameas_object|45|0|77|0|{metadata|in_metadata|1|0|}32|30|}
{2010006001|XXGobject_psameas_object|46|0|78|0|{Layout|Layout|0|0|}27|21|}
{2010601001|XXGgraph_vertex_vertex|47|0|79|0|{PBK_PBK_KEY_|}1|33|}
{2010212001|XXGvertex_oport_oport|48|0|81|0|{0|out|}33|34|}
{2010213001|XXGoport_dst_flow|49|0|83|0|{0|}34|14|}
{2010211001|XXGvertex_iport_iport|50|0|84|0|{0|in|}33|35|}
{2010214001|XXGiport_src_flow|51|0|86|0|{0|}35|13|}
{2010007001|XXGobject_proto_object|52|0|87|0|{}33|36|}
{2010212001|XXGvertex_oport_oport|53|0|89|0|{0|out|}36|37|}
{2010006001|XXGobject_psameas_object|54|0|91|0|{metadata|out_metadata|1|0|}37|36|}
{2010211001|XXGvertex_iport_iport|55|0|92|0|{0|in|}36|38|}
{2010006001|XXGobject_psameas_object|56|0|94|0|{metadata|in_metadata|1|0|}38|36|}
{2010006001|XXGobject_psameas_object|57|0|95|0|{Layout|Layout|0|0|}33|21|}
{2010601001|XXGgraph_vertex_vertex|58|0|96|0|{PBRR|}1|39|}
{2010212001|XXGvertex_oport_oport|59|0|98|0|{0|out|}39|40|}
{2010213001|XXGoport_dst_flow|60|0|100|0|{0|}40|8|}
{2010211001|XXGvertex_iport_iport|61|0|101|0|{0|in|}39|41|}
{2010214001|XXGiport_src_flow|62|0|103|0|{0|}41|7|}
{2010007001|XXGobject_proto_object|63|0|104|0|{}39|42|}
{2010212001|XXGvertex_oport_oport|64|0|106|0|{0|out|}42|43|}
{2010006001|XXGobject_psameas_object|65|0|108|0|{metadata|out_metadata|1|0|}43|42|}
{2010211001|XXGvertex_iport_iport|66|0|109|0|{0|in|}42|44|}
{2010006001|XXGobject_psameas_object|67|0|111|0|{metadata|in_metadata|1|0|}44|42|}
{2010006001|XXGobject_psameas_object|68|0|112|0|{Layout|Layout|0|0|}39|21|}
{2010601001|XXGgraph_vertex_vertex|69|0|113|0|{Rplct|}1|45|}
{2010212001|XXGvertex_oport_oport|70|0|115|0|{0|out|}45|46|}
{2010213001|XXGoport_dst_flow|71|0|117|0|{0|}46|6|}
{2010211001|XXGvertex_iport_iport|72|0|118|0|{0|in|}45|47|}
{2010214001|XXGiport_src_flow|73|0|120|0|{0|}47|14|}
{2010007001|XXGobject_proto_object|74|0|121|0|{}45|48|}
{2010212001|XXGvertex_oport_oport|75|0|123|0|{0|out|}48|49|}
{2010006001|XXGobject_psameas_object|76|0|125|0|{metadata|out_metadata|1|0|}49|48|}
{2010211001|XXGvertex_iport_iport|77|0|126|0|{0|in|}48|50|}
{2010006001|XXGobject_psameas_object|78|0|128|0|{metadata|in_metadata|1|0|}50|48|}
{2010006001|XXGobject_psameas_object|79|0|129|0|{Layout|Layout|0|0|}45|51|}
{2010212001|XXGvertex_oport_oport|80|0|131|0|{0|out|}51|52|}
{2010211001|XXGvertex_iport_iport|81|0|133|0|{0|in|}51|53|}
{2010214001|XXGiport_src_flow|82|0|135|0|{0|}53|10|}
{2010214001|XXGiport_src_flow|83|0|136|0|{1|}53|8|}
{2010214001|XXGiport_src_flow|84|0|137|0|{2|}53|9|}
{2010214001|XXGiport_src_flow|85|0|138|0|{3|}53|11|}
{2010007001|XXGobject_proto_object|86|0|139|0|{}51|54|}
{2010212001|XXGvertex_oport_oport|87|0|141|0|{0|out|}54|55|}
{2010006001|XXGobject_psameas_object|88|0|143|0|{metadata|out_metadata|1|0|}55|54|}
{2010211001|XXGvertex_iport_iport|89|0|144|0|{0|in|}54|56|}
{2010006001|XXGobject_psameas_object|90|0|146|0|{metadata|in_metadata|1|0|}56|54|}
{2010006001|XXGobject_psameas_object|91|0|147|0|{Layout|Layout|0|0|}51|21|}
{2010601001|XXGgraph_vertex_vertex|92|0|148|0|{Rplct_Input_Layout|}1|21|}
{2010601001|XXGgraph_vertex_vertex|93|0|149|0|{Rplct_Ouput_Layout|}1|51|}
{2010601001|XXGgraph_vertex_vertex|94|0|150|0|{Srt_SRT_KEY_|}1|57|}
{2010212001|XXGvertex_oport_oport|95|0|152|0|{0|out|}57|58|}
{2010213001|XXGoport_dst_flow|96|0|154|0|{0|}58|10|}
{2010211001|XXGvertex_iport_iport|97|0|155|0|{0|in|}57|59|}
{2010214001|XXGiport_src_flow|98|0|157|0|{0|}59|6|}
{2010007001|XXGobject_proto_object|99|0|158|0|{}57|60|}
{2010212001|XXGvertex_oport_oport|100|0|160|0|{0|out|}60|61|}
{2010006001|XXGobject_psameas_object|101|0|162|0|{metadata|out_metadata|1|0|}61|60|}
{2010211001|XXGvertex_iport_iport|102|0|163|0|{0|in|}60|62|}
{2010006001|XXGobject_psameas_object|103|0|165|0|{metadata|in_metadata|1|0|}62|60|}
{2010006001|XXGobject_psameas_object|104|0|166|0|{Layout|Layout|0|0|}57|21|}
{2010212001|XXGvertex_oport_oport|105|0|167|0|{0|out0|}1|63|}
{2010216002|XXGoport_binding_oport|106|0|169|0|{.5|.5|{0|}12456|}63|52|}
{2010211001|XXGvertex_iport_iport|107|0|170|0|{0|in0|}1|64|}
{2010215002|XXGiport_binding_iport|108|0|172|0|{.5|.5|{0|}12454|}64|23|}
{2010109001|XXGobject_property_value|109|0|173|0|{0|TrackingThumbprint|72|}1|65|}
