@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|12|rel_count|13|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|PROCESS_DATE|$[ (string(""))(date("YYYYMMDD"))(today()-4) ]|3|9|RFK|@{0|}}
{30001002|XXparameter|SIG_DIR|$AI_SERIAL_PENDING/plan_trigger/opioid/$PROCESS_DATE|3|9|REFK|@{0|}}
{30001002|XXparameter|MAIL_TO|srikant.sunkara\@optum.com|3|9|REFK|@{0|}}
{30001002|XXparameter|FLAG|1|3|9|REFK|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|Check_Verions|ssunkar2|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|459000|312000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{1|1|}Job 'opioid_source_file_verions_check' Execution Status Report


Job "opioid_source_file_verions_check" Execution started at Monday, May 29, 2017 08:12:19
Job completed successfully at Monday, May 29, 2017 08:12:28

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:00:09
Run performed by user ssunkar2
Total data moved through all flows: 0 records (-1 bytes)
Total CPU time (all processes): 1 seconds
Average CPU utilization across all nodes: 0.00 percent
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Opi_QA||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010501005|XXGpvertex|5|0|9|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Run_Program.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|commandline|ksh -x $AI_BIN/validate.datalake.opioid.file.versions.ksh -S $SIG_DIR -E $MAIL_TO -F $FLAG|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
}}@0|Run Program|50000|50000|0|0|0|0|1|Run Program|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|6|0|11|0|{@{}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|7|0|13|0|{@{}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|8|0|15|0|{Executes a standard UNIX or Windows program.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|filter|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|commandline||16|2|RFO$|Command line of UNIX or Windows program to execute|{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Run Program|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|9|0|17|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|10|0|20|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010110002|XXGconstant|11|0|23|0|{@{}@{1|643978|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010601001|XXGgraph_vertex_vertex|4|0|8|0|{Run_Program|}1|5|}
{2010212001|XXGvertex_oport_oport|5|0|10|0|{0|out|}5|6|}
{2010211001|XXGvertex_iport_iport|6|0|12|0|{0|in|}5|7|}
{2010007001|XXGobject_proto_object|7|0|14|0|{}5|8|}
{2010212001|XXGvertex_oport_oport|8|0|16|0|{0|out|}8|9|}
{2010006001|XXGobject_psameas_object|9|0|18|0|{metadata|out_metadata|1|0|}9|8|}
{2010211001|XXGvertex_iport_iport|10|0|19|0|{0|in|}8|10|}
{2010006001|XXGobject_psameas_object|11|0|21|0|{metadata|in_metadata|1|0|}10|8|}
{2010109001|XXGobject_property_value|12|0|22|0|{0|TrackingThumbprint|72|}1|11|}
