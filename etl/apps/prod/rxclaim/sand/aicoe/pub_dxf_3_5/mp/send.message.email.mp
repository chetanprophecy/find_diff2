@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|40|rel_count|60|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|PROCESS_DT|$[ (date("YYYY-MM-DD"))(now()) ]|3|9|FK|Process Date: Write your own logic to populate the process date: Default is today's date in YYYY-MM-DD format|{0|}}
{30001002|XXparameter|CREATE_DATA||3|9|FK|Create Data needed for Mail Body: Example: Use inline Korn shell computation using PDL Interpretation like $(m_db gendml|{0|}}
{30001002|XXparameter|MAIL_TO_LIST|<<To be set in Private Project>>|3|9|FK|To Email List; seperate with semicolon ';'|{0|}}
{30001002|XXparameter|MAIL_FROM|<<To be set in Private Project>>|3|9|FK|From Email|{0|}}
{30001002|XXparameter|MAIL_ATTACH|<<To be set in Private Project>>|3|9|FK|Include email attachments , seperate with semicolon ';'|{0|}}
{30001002|XXparameter|CHARSET_ATTACHMENT|utf8|3|9|FK|By default charset is set as utf8 , set charset accordingly per attachement type|{0|}}
{30001002|XXparameter|IMPLEMENTATION|$PUB_DXF_COMPONENTS/send_message_text_html.mp|3|9|RK|@{0|}}
{30001002|XXparameter|MAIL_SUBJ|$[string_concat( string_upcase(AI_PHASE) , ": ", "Process Date" , ": " , PROCESS_DT , " Sample Email Subject")]|3|9|FK|Subject of Email should have AI_PHASE , Process date and meaningful subject line|{0|}}
{30001002|XXparameter|MAIL_BODY|$[ 
begin
let string("")[int] str = string_split_no_empty(CREATE_DATA, '\\r\\n') ;
let string("") var1=""; 
let string("") var2=""; 
let string("")  res= "<font face='verdana' color='#000000' size='2'> 
<br> Hello, <br>
<br> This is a Test email: <br>
<br><br>
<table style='width:75%' align='center' border='1' cellspacing=4 cellpadding=4 >
<tr BGCOLOR='#808080' >
<th> Col1. </th>
<th> Col2 </th>
<th> Col3. </th>
<th> Col4. </th>
"
+ 


string_join(for(let i=0, i<length_of(str)) begin
var2="";
for(let j=0, j< length_of(string_split(str[i],'\|'))) begin  

var1=  '<td>' + string_split_no_empty(str[i],'\|')[j] +'</td>' +  " ";
var2 =  var2 + var1;

end;
end: '<tr>' + var2 + '</tr>' , '\\n')


+ "
</table>
<br><br>
<br><br>
<font face=verdana' color='#000000' size='2'>
Thanks, <br>
Support Team <br>
<br> PS: This is an auto generated email,please do not reply to this email<br>
<br><br>" ;

result :: res;
end;]|3|9|FK|Email Body: Supports Plain Text and HTML Formatting|{0|}}
{30001002|XXparameter|!ab_compatibility|3.5.4.0|3|9|P|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|process.claim.history.mapping|mbachu|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|720000|465000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|1|}Job 'send.message.email' Execution Status Report


Job "send.message.email" Execution started at Friday, June 15, 2018 06:00:09
Job completed successfully at Friday, June 15, 2018 06:00:31

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:00:22
Run performed by user bmolgi1
Total data moved through all flows: 1 records (1 bytes)
Total CPU time (all processes): 1 seconds
Average CPU utilization across all nodes: 0.00 percent
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@RHEL7-dev||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial Narrow|8421504|100|1|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{0|}177|17|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{8|180000|152000|200000|152000|204000|152000|224000|152000|}173|17|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}178|17|}}
{2010600005|XXGgraph|8|0|15|0|{|{}@0|@189000|12500|0|0|0|0|150|Documentation||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|759000|400000|7|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@No    Version      Developed By        Comments
-------     ----------      --------------------     ------------------
1            1.0         AICOE DXF        Intial graph development. This graph supports both Text and HTML format in Email Body. 
|19000|55000|0|0|0|0|3|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|11|0|21|0|{@{}@Purpose :
 This genric graph can send any type of attachment with user defined body,subject and to_list.|17000|243000|0|0|0|0|2|}}
{2010242002|XXGface|12|0|23|0|{@{}@Arial Narrow|8421504|100|1|}}
{2010501005|XXGpvertex|13|0|25|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|void(1)|3|1|l|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\Program Files\\Ab Initio\\Ab Initio GDE\\Components\\Validate\\Generate Records.mpc|3|2|Pw$|@{0|}}
}}@0|@104500|201250|47000|119000|123000|68000|172|Generate Records|Ab Initio Software|Built-in 2.0:|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|14|0|27|0|{@{}@169000|147000|11000|11000|out|0.0|@@@2448|0|}}
{2010501005|XXGpvertex|15|0|30|0|{Generates a specified number of data records with fields of specified lengths and types.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|generate|3|1|Hl|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|command_line||16|2|FO$|Field-specific options|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document()|3|2|RH$|The custom transformation|{0|}}
{30001002|XXparameter|mpcmodtime|0|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|16|0|32|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010501005|XXGpvertex|17|0|35|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in) =
begin
  out.to_list             :: "$\{MAIL_TO_LIST\}";
  out.from                :: "$\{MAIL_FROM\}";
  out.subject             :: "$\{MAIL_SUBJ\}";
  out.text                :: "$\{MAIL_BODY\}";
  out.attachment_url_list :: "$\{MAIL_ATTACH\}";
end;|3|3|c|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\Program Files\\Ab Initio\\Ab Initio GDE\\Components\\Transform\\Reformat.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|include "~$AB_HOME/include/mail.dml";

metadata type = file_message_t;|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@269500|186500|235000|117000|137000|72000|175|Prepare Message|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|18|0|37|0|{@{}@371000|147000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|19|0|40|0|{@{}@252000|188000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|20|0|42|0|{@{}@297000|188000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|21|0|44|0|{@{}@342000|188000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|22|0|46|0|{@{}@225000|147000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|23|0|49|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.m|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
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
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$|The custom transformation|{0|}}
{30001002|XXparameter|mpcmodtime|0|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|output_index_signature|int out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|num_operations|1|1|2|H$|Number of operations per reformat|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|port_analysis|reject*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|24|0|51|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|25|0|55|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|26|0|58|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|27|0|61|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|28|0|64|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|29|0|67|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|1|3|9|P|@{0|}}
{30001002|XXparameter|!prototype|$PUB_DXF_COMPONENTS/send_message_text_html.mgi|3|9|Pf|@{0|}}
{30001002|XXparameter|implementation|$IMPLEMENTATION|3|9|f|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|9||@{0|}}
{30001002|XXparameter|in0_metadata|include "~$AB_HOME/include/mail.dml";

metadata type = file_message_t;|3|9||@{0|}}
{30001002|XXparameter|out1_metadata|include "~$AB_HOME/include/mail.dml";

metadata type = file_message_t;|3|9||@{0|}}
{30001002|XXparameter|attachment_includes_full_path|False|3|9||@{0|}}
{30001002|XXparameter|attachment_charset|$CHARSET_ATTACHMENT|3|9||@{0|}}
{30001002|XXparameter|unix2dos|False|3|9||@{0|}}
{30001002|XXparameter|smtp_server_host|localhost|3|2|$|@{0|}}
{30001002|XXparameter|smtp_server_port|25|3|9||@{0|}}
{30001002|XXparameter|tcp_connect_timeout|1|3|9||@{0|}}
{30001002|XXparameter|tcp_read_timeout|0|3|9||@{0|}}
{30001002|XXparameter|tcp_write_timeout|0|3|9||@{0|}}
{30001002|XXparameter|reconnect_limit|1|3|9||@{0|}}
{30001002|XXparameter|continuous|False|3|9||@{0|}}
}}@0|@507000|185000|0|0|0|0|192|send message text html|bmolgi1|@1|100|0|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|1|}}
{2010600005|XXGgraph|30|0|69|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|implementation|$PUB_DXF_COMPONENTS/send_message_text_html.mp|44|2|RFf$|A target subgraph that implements this interface, or a pset for one.|{0|}}
{30001002|XXparameter|!_ab_graph_interface|1|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
{30001002|XXparameter|condition.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|condition_interpretation.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|conditionOutputPort.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|implementation.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|error_group|@3|9|F|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|log_group|@3|9|F|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|_ab_graph_is_handler|False|13|1|Hl|Optional graph_is_handler.|{0|}}
{30001002|XXparameter|Layout||9|2|RF$||{0|}}
{30001002|XXparameter|in0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|out1_metadata||7|9|RF||{0|}}
{30001002|XXparameter|attachment_includes_full_path||3|9|RFK|@{0|}}
{30001002|XXparameter|attachment_charset||3|9|RFK|@{0|}}
{30001002|XXparameter|unix2dos||3|9|RFK|@{0|}}
{30001002|XXparameter|smtp_server_host|localhost|3|9|RFK|@{0|}}
{30001002|XXparameter|Layout.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|Layout.layout_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|in0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|out1_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|smtp_server_port||3|9|RFK|@{0|}}
{30001002|XXparameter|tcp_connect_timeout||3|9|RFK|@{0|}}
{30001002|XXparameter|tcp_read_timeout||3|9|RFK|@{0|}}
{30001002|XXparameter|tcp_write_timeout||3|9|RFK|@{0|}}
{30001002|XXparameter|reconnect_limit||3|9|RFK|@{0|}}
{30001002|XXparameter|continuous||3|9|RFK|@{0|}}
{30001002|XXparameter|mpcmodtime|1528454019|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|@3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|Graph Interface||@1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|600000|400000|5|}}
{2010203004|XXGoport|31|0|71|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|outward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out1|0.0|@@@13456|0|}}
{2010202004|XXGiport|32|0|74|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|outward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010203004|XXGoport|33|0|77|0|{@{}@0|0|0|0|out1|0.0|@@@13456|0|}}
{2010202004|XXGiport|34|0|80|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010501005|XXGpvertex|35|0|85|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|622000|381000|0|0|0|0|176|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010202004|XXGiport|36|0|87|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|37|0|90|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|38|0|92|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010110002|XXGconstant|39|0|98|0|{@{}@{1|2728441|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_2|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_3|}1|7|}
{2010601001|XXGgraph_vertex_vertex|7|0|14|0|{Documentation|}1|8|}
{2010605001|XXGgraph_legend_legend|8|0|16|0|{0|}8|9|}
{2010241001|XXGlegend_face_face|9|0|18|0|{}9|10|}
{2010605001|XXGgraph_legend_legend|10|0|20|0|{1|}8|11|}
{2010241001|XXGlegend_face_face|11|0|22|0|{}11|12|}
{2010601001|XXGgraph_vertex_vertex|12|0|24|0|{Generate_Records|}1|13|}
{2010212001|XXGvertex_oport_oport|13|0|26|0|{0|out|}13|14|}
{2010213001|XXGoport_dst_flow|14|0|28|0|{0|}14|6|}
{2010007001|XXGobject_proto_object|15|0|29|0|{}13|15|}
{2010212001|XXGvertex_oport_oport|16|0|31|0|{0|out|}15|16|}
{2010006001|XXGobject_psameas_object|17|0|33|0|{metadata|out_metadata|1|0|}16|15|}
{2010601001|XXGgraph_vertex_vertex|18|0|34|0|{Prepare_Message|}1|17|}
{2010212001|XXGvertex_oport_oport|19|0|36|0|{0|out0|}17|18|}
{2010213001|XXGoport_dst_flow|20|0|38|0|{0|}18|5|}
{2010212001|XXGvertex_oport_oport|21|0|39|0|{1|reject0|}17|19|}
{2010212001|XXGvertex_oport_oport|22|0|41|0|{2|error0|}17|20|}
{2010212001|XXGvertex_oport_oport|23|0|43|0|{3|log|}17|21|}
{2010211001|XXGvertex_iport_iport|24|0|45|0|{0|in|}17|22|}
{2010214001|XXGiport_src_flow|25|0|47|0|{0|}22|6|}
{2010007001|XXGobject_proto_object|26|0|48|0|{}17|23|}
{2010212001|XXGvertex_oport_oport|27|0|50|0|{0|out0|}23|24|}
{2010006001|XXGobject_psameas_object|28|0|52|0|{metadata|out0_metadata|1|0|}24|23|}
{2010006001|XXGobject_psameas_object|29|0|53|0|{transform0|transform0|1|0|}24|23|}
{2010212001|XXGvertex_oport_oport|30|0|54|0|{1|reject0|}23|25|}
{2010006001|XXGobject_psameas_object|31|0|56|0|{metadata|reject0_metadata|1|0|}25|23|}
{2010212001|XXGvertex_oport_oport|32|0|57|0|{2|error0|}23|26|}
{2010006001|XXGobject_psameas_object|33|0|59|0|{metadata|error0_metadata|1|0|}26|23|}
{2010212001|XXGvertex_oport_oport|34|0|60|0|{3|log|}23|27|}
{2010006001|XXGobject_psameas_object|35|0|62|0|{metadata|log_metadata|1|0|}27|23|}
{2010211001|XXGvertex_iport_iport|36|0|63|0|{0|in|}23|28|}
{2010006001|XXGobject_psameas_object|37|0|65|0|{metadata|in_metadata|1|0|}28|23|}
{2010006001|XXGobject_psameas_object|38|0|66|0|{Layout|Layout|0|0|}17|29|}
{2010401001|XXGvertex_prototype_vertex|39|0|68|0|{}29|30|}
{2010212001|XXGvertex_oport_oport|40|0|70|0|{0|out1|}30|31|}
{2010006001|XXGobject_psameas_object|41|0|72|0|{metadata|out1_metadata|1|0|}31|30|}
{2010211001|XXGvertex_iport_iport|42|0|73|0|{0|in0|}30|32|}
{2010006001|XXGobject_psameas_object|43|0|75|0|{metadata|in0_metadata|1|0|}32|30|}
{2010212001|XXGvertex_oport_oport|44|0|76|0|{0|out1|}29|33|}
{2010213001|XXGoport_dst_flow|45|0|78|0|{0|}33|7|}
{2010211001|XXGvertex_iport_iport|46|0|79|0|{0|in0|}29|34|}
{2010214001|XXGiport_src_flow|47|0|81|0|{0|}34|5|}
{2010006001|XXGobject_psameas_object|48|0|82|0|{in_metadata|out_metadata|0|0|}17|13|}
{2010006001|XXGobject_psameas_object|49|0|83|0|{reject0_metadata|out_metadata|0|0|}17|13|}
{2010601001|XXGgraph_vertex_vertex|50|0|84|0|{Trash|}1|35|}
{2010211001|XXGvertex_iport_iport|51|0|86|0|{0|in|}35|36|}
{2010214001|XXGiport_src_flow|52|0|88|0|{0|}36|7|}
{2010007001|XXGobject_proto_object|53|0|89|0|{}35|37|}
{2010211001|XXGvertex_iport_iport|54|0|91|0|{0|in|}37|38|}
{2010006001|XXGobject_psameas_object|55|0|93|0|{metadata|in_metadata|1|0|}38|37|}
{2010006001|XXGobject_psameas_object|56|0|94|0|{Layout|Layout|0|0|}35|29|}
{2010006001|XXGobject_psameas_object|57|0|95|0|{in_metadata|out1_metadata|0|0|}35|29|}
{2010601001|XXGgraph_vertex_vertex|58|0|96|0|{send_message_text_html|}1|29|}
{2010109001|XXGobject_property_value|59|0|97|0|{0|TrackingThumbprint|72|}1|39|}
