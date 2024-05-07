@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|8|rel_count|7|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|AB_DML_DEFS|out :: get_channel_assignments(channel_assignment_file)=
begin
  let string("\\x01") file_contents = if(file_information(channel_assignment_file).found) read_file(channel_assignment_file) else "";

  out :: string_split_no_empty(file_contents, "\\n");  
end;|3|9|K|@{0|}}
{30001002|XXparameter|SOURCE|abcd|3|9|RFK|@{0|}}
{30001002|XXparameter|TABLE_LIST_PATH|$AI_DML|3|9|RK|@{0|}}
{30001002|XXparameter|CHANNEL_ASSIGNMENTS_FILE|$PUB_DXF_META/channel_assign.$SOURCE.dat|3|9|RK|@{0|}}
{30001002|XXparameter|ALL_CHANNEL_ASSIGNMENTS||3|9|RFK|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|assign_channel|Anwar.Parvez|@1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|392000|186000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.2.0|{1|1|}@|||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Dev-4||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@No components in this graph.
The template writes directly to the meta folder.|108000|138000|0|0|0|0|1|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|0|100|0|}}
{2010110002|XXGconstant|7|0|13|0|{@{}@{1|9549202|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010109001|XXGobject_property_value|6|0|12|0|{0|TrackingThumbprint|72|}1|7|}
