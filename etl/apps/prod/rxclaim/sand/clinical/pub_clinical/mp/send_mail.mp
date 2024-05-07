@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|377|rel_count|624|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|BIZ_DT|$DEFAULT_BIZ_DT|3|9|RFK|@{0|}}
{30001002|XXparameter|TO|$SUCCESS_EMAIL_TO|3|9|RFK|@{0|}}
{30001002|XXparameter|FROM|$SUCCESS_EMAIL_FROM|3|9|RFK|@{0|}}
{30001002|XXparameter|SMTP_SERVER|localhost|3|9|RK|@{0|}}
{30001002|XXparameter|SUBJECT||3|9|FK|@{0|}}
{30001002|XXparameter|ATTACHMENTS||3|9|FK|Semicolon seperated List of Attachments file URL|{0|}}
{30001002|XXparameter|MAIL_BODY||3|9|FK|@{0|}}
{30001002|XXparameter|!ab_compatibility|3.2.6.4|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|send_mail|hnarvala|Created 9/14/2017 9:22:56 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|590000|301000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{1|1|}Job 'send_mail' Execution Status Report

Job completed successfully at Thursday, September 14, 2017 09:20:38
Run performed by user hnarvala
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Dev||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010600005|XXGgraph|5|0|9|0|{Sends one e-mail message with attachments.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/Mail/Send_Message.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|to_list|$TO|3|2|$|@{0|}}
{30001002|XXparameter|from|$FROM|3|2|$|@{0|}}
{30001002|XXparameter|subject|$SUBJECT|3|2|$|@{0|}}
{30001002|XXparameter|attachment_url_list|$ATTACHMENTS|3|9||@{0|}}
{30001002|XXparameter|layout|$PUB_CLINICAL_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|smtp_server_host|$SMTP_SERVER|3|2|$|@{0|}}
{30001002|XXparameter|tcp_connect_timeout|60|3|2|$|@{0|}}
{30001002|XXparameter|text|$MAIL_BODY|3|2|$|@{0|}}
}}@0|@430000|150000|0|0|842000|350000|7076|Send Message :with attachment as file|Ab Initio|Created 09/17/04 13:08:21|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|842000|350000|0|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{8|180000|152000|200000|152000|204000|152000|224000|152000|}7|17|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{8|382000|152000|382000|152000|404000|152000|411000|152000|}16|17|}}
{2010501005|XXGpvertex|8|0|15|0|{|{}@0|@64500|136250|47000|119000|123000|68000|5|Generate Records|Ab Initio Software|Built-in 2.0:|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|9|0|17|0|{@{}@169000|147000|11000|11000|out|0.0|@@@2448|0|}}
{2010501005|XXGpvertex|10|0|20|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
}}@0|@219500|96500|235000|117000|137000|72000|9|Prepare Message|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|11|0|22|0|{@{}@371000|147000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|12|0|25|0|{@{}@252000|188000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|13|0|27|0|{@{}@297000|188000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|14|0|29|0|{@{}@342000|188000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|15|0|31|0|{@{}@225000|147000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|16|0|35|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@79182|174318|94000|194000|123000|72000|12|Add Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|17|0|37|0|{@{}@216000|224000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|18|0|39|0|{@{}@384|.5|.5|{12|227000|229000|247000|229000|247000|298000|127000|298000|127000|368000|147000|368000|}4|17|}}
{2010203004|XXGoport|19|0|41|0|{@{}@109000|265000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|20|0|43|0|{@{}@150000|265000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|21|0|45|0|{@{}@191000|265000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|22|0|47|0|{@{}@84000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|23|0|52|0|{Reads input records and sends e-mail messages.|{}@0|@402000|41000|422000|61000|1206000|867000|17|Send_Multiple_Messages|Ab Initio|Created 09/17/04 13:06:09|1|10|-1||6||1|{0|}0|0|{0|}{0|}{0|}{0|}.21061359345912933|1206000|867000|0|}}
{2010240003|XXGlegend|24|0|54|0|{@{}@Each input message could 
contain multiple URLs of
the attachments that need
to be retrieved one by one.

A unique key is added to
ensure that attachments
can be linked with proper
messages.|32000|412000|52000|432000|158000|144000|1|}}
{2010242002|XXGface|25|0|56|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|26|0|58|0|{@{}@384|.8006756901741028|.5|{12|492000|132000|512000|132000|512000|332000|380000|332000|380000|382000|400000|382000|}22|17|}}
{2010210004|XXGflow|27|0|60|0|{@{}@384|.5|.5|{12|299000|363000|319000|363000|319000|239000|246000|239000|246000|114000|266000|114000|}2|17|}}
{2010210004|XXGflow|28|0|62|0|{@{}@384|.5|.5|{12|685000|696000|685000|696000|700000|696000|700000|690000|715000|690000|722000|690000|}3|17|}}
{2010210004|XXGflow|29|0|65|0|{@{}@384|.20945945382118225|.5|{12|805000|382000|825000|382000|825000|330000|609000|330000|609000|132000|629000|132000|}5|1041|}}
{2010210004|XXGflow|30|0|67|0|{@{}@384|.5|.5|{8|492000|96000|522000|96000|599000|96000|629000|96000|}6|1041|}}
{2010210004|XXGflow|31|0|69|0|{@{}@384|.5|.5|{12|937000|114000|957000|114000|957000|189000|845000|189000|845000|265000|865000|265000|}7|17|}}
{2010210004|XXGflow|32|0|71|0|{@{}@384|.8117647171020508|.5|{12|896000|312000|896000|332000|896000|612000|357000|612000|357000|678000|377000|678000|}8|1041|}}
{2010210004|XXGflow|33|0|73|0|{@{}@384|.5|.013513513840734959|{12|299000|373000|319000|373000|319000|373000|319000|712000|347000|712000|377000|712000|}9|1041|}}
{2010210004|XXGflow|34|0|75|0|{@{}@384|.5|.5|{12|726000|531000|746000|531000|746000|457000|614000|457000|614000|382000|634000|382000|}10|17|}}
{2010210004|XXGflow|35|0|77|0|{@{}@384|.5|.5|{12|552000|382000|572000|382000|572000|456000|480000|456000|480000|531000|500000|531000|}11|17|}}
{2010501005|XXGpvertex|36|0|80|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@630250|327861|645000|348000|150000|69000|13|Denormalize|Ab Initio Software|Built-in 2.0:|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|37|0|82|0|{@{}@794000|377000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|38|0|85|0|{@{}@664000|416000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|39|0|87|0|{@{}@714000|416000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|40|0|89|0|{@{}@764000|416000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|41|0|91|0|{@{}@635000|377000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|42|0|95|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@488000|468000|511000|496000|205000|72000|18|Read Attachments|Ab Initio Software|Built-in 2.11.8:|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|43|0|97|0|{@{}@715000|526000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|44|0|100|0|{@{}@526000|567000|11000|11000|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|45|0|102|0|{@{}@567000|567000|11000|11000|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|46|0|104|0|{@{}@608000|567000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|47|0|106|0|{@{}@649000|567000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|48|0|108|0|{@{}@690000|567000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|49|0|110|0|{@{}@501000|526000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|50|0|114|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@396472|328111|411000|348000|131000|69000|17|Normalize|Ab Initio Software|Built-in 2.0:|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|51|0|116|0|{@{}@541000|377000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|52|0|119|0|{@{}@427000|416000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|53|0|121|0|{@{}@470000|416000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|54|0|123|0|{@{}@513000|416000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|55|0|125|0|{@{}@401000|377000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|56|0|129|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@261579|58676|277000|79000|205000|72000|21|Split Record|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|57|0|131|0|{@{}@481000|91000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|58|0|134|0|{@{}@481000|127000|11000|11000|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|59|0|137|0|{@{}@292000|150000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|60|0|139|0|{@{}@333000|150000|11000|11000|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|61|0|141|0|{@{}@374000|150000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|62|0|143|0|{@{}@415000|150000|11000|11000|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|63|0|145|0|{@{}@456000|150000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|64|0|147|0|{@{}@267000|109000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|65|0|157|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@373136|641682|388000|662000|287000|69000|14|Join|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|66|0|159|0|{@{}@674000|691000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|67|0|162|0|{@{}@403000|730000|11000|11000|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|68|0|164|0|{@{}@444000|730000|11000|11000|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|69|0|166|0|{@{}@485000|730000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|70|0|168|0|{@{}@526000|730000|11000|11000|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|71|0|170|0|{@{}@567000|730000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|72|0|172|0|{@{}@608000|730000|11000|11000|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|73|0|174|0|{@{}@649000|730000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|74|0|176|0|{@{}@378000|673000|11000|11000|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|75|0|179|0|{@{}@378000|707000|11000|11000|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|76|0|183|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@625000|59000|640000|79000|287000|72000|15|Join With Attachments|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|77|0|185|0|{@{}@926000|109000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|78|0|188|0|{@{}@655000|150000|11000|11000|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|79|0|190|0|{@{}@696000|150000|11000|11000|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|80|0|192|0|{@{}@737000|150000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|81|0|194|0|{@{}@778000|150000|11000|11000|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|82|0|196|0|{@{}@819000|150000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|83|0|198|0|{@{}@860000|150000|11000|11000|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|84|0|200|0|{@{}@901000|150000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|85|0|202|0|{@{}@630000|91000|11000|11000|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|86|0|205|0|{@{}@630000|127000|11000|11000|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|87|0|221|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@764000|674000|733000|638000|135000|106000|16|Make port reject optional|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|88|0|223|0|{@{}@867000|685000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|89|0|225|0|{@{}@723000|685000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|90|0|233|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@184500|345910|158000|336000|131000|65000|19|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|91|0|235|0|{@{}@288000|358000|11000|21000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|92|0|239|0|{@{}@148000|363000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|93|0|245|0|{Reads input records and sends e-mail messages.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@870250|246611|876000|230000|123000|72000|20|Send Mail|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|94|0|247|0|{@{}@998000|260000|11000|11000|out|0.0|@@@2064|0|}}
{2010203004|XXGoport|95|0|249|0|{@{}@891000|301000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|96|0|252|0|{@{}@932000|301000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|97|0|254|0|{@{}@973000|301000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|98|0|256|0|{@{}@866000|260000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|99|0|263|0|{@{}@544000|243000|11000|11000|error|.5|@@@13464|0|}}
{2010203004|XXGoport|100|0|266|0|{@{}@628000|243000|11000|11000|log|.8333333333333333|@@@13464|0|}}
{2010203004|XXGoport|101|0|269|0|{@{}@459000|243000|11000|11000|reject|.16666666666666666|@@@13328|0|}}
{2010203004|XXGoport|102|0|272|0|{@{}@675000|147000|11000|11000|out|.5|@@@14352|0|}}
{2010202004|XXGiport|103|0|275|0|{@{}@412000|147000|11000|11000|in|.5|@@@14096|0|}}
{2010203004|XXGoport|104|0|279|0|{@{}@0|0|0|0|reject|.16666666666666666|@@@13328|0|}}
{2010203004|XXGoport|105|0|282|0|{@{}@0|0|0|0|error|.5|@@@13464|0|}}
{2010203004|XXGoport|106|0|285|0|{@{}@0|0|0|0|log|.8333333333333333|@@@13464|0|}}
{2010203004|XXGoport|107|0|288|0|{@{}@0|0|0|0|out|.5|@@@14352|0|}}
{2010600005|XXGgraph|108|0|291|0|{Sends one e-mail message with attachments.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|smtp_server_host||3|2|RFK$|Host name or IP address of the host running SMTP server.|{0|}}
{30001002|XXparameter|smtp_server_port|25|1|2|FK$|Port number SMTP server listens on.|{0|}}
{30001002|XXparameter|to_list||3|2|RFK$|List of e-mail addresses of recipients separated by semicolons.|{0|}}
{30001002|XXparameter|from||3|2|RFK$|e-mail address the message is sent from|{0|}}
{30001002|XXparameter|subject||3|2|RFK$|Subject of the message.|{0|}}
{30001002|XXparameter|text||3|2|FK$|Text of the message.|{0|}}
{30001002|XXparameter|attachment_url_list||3|2|FK$|List of absolute file names of attachment files separated by semicolons.|{0|}}
{30001002|XXparameter|attachment_charset|utf8|3|2|FK$|attachment files must be in this character set|{0|}}
{30001002|XXparameter|unix2dos|False|13|2|FK$|Convert attachments from Unix to DOS.|{0|}}
{30001002|XXparameter|attachment_includes_full_path|False|13|2|FK$|Include full path in the filename parameter of the attachment|{0|}}
{30001002|XXparameter|tcp_connect_timeout|1|3|2|RFK$||{0|}}
{30001002|XXparameter|tcp_read_timeout|0|3|2|RFK$||{0|}}
{30001002|XXparameter|tcp_write_timeout|0|3|2|RFK$||{0|}}
{30001002|XXparameter|reconnect_limit|1|3|2|RFK$||{0|}}
{30001002|XXparameter|layout|@9|2|RFK$|Layout|{0|}}
{30001002|XXparameter|mpcmodtime|1461375653|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@874000|227000|0|0|842000|350000|0|Send_Message|||1|10|-1||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|842000|350000|2|}}
{2010210004|XXGflow|109|0|293|0|{@{}@384|.5|.5|{8|180000|152000|200000|152000|204000|152000|224000|152000|}7|17|}}
{2010210004|XXGflow|110|0|295|0|{@{}@384|.5|.5|{8|382000|152000|382000|152000|404000|152000|411000|152000|}10|17|}}
{2010501005|XXGpvertex|111|0|297|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|void(1)|3|1|l|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 67 subkind 87 parts [vector _interp_("$layout", "dollar_substitution")]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|C:\\Program Files\\Ab Initio\\Ab Initio GDE\\Components\\Validate\\Generate Records.mpc|3|2|Pw$|@{0|}}
}}@0|@26500|99250|47000|119000|123000|68000|5|Generate Records|Ab Initio Software|Built-in 2.0:|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|112|0|299|0|{@{}@169000|147000|11000|11000|out|0.0|@@@2448|0|}}
{2010501005|XXGpvertex|113|0|302|0|{Generates a specified number of data records with fields of specified lengths and types.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|generate|3|1|Hl|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|114|0|304|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010501005|XXGpvertex|115|0|307|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in) =
begin
  out.to_list             :: "$\{to_list\}";
  out.from                :: "$\{from\}";
  out.subject             :: "$\{subject\}";
  out.text                :: "$\{text\}";
  out.attachment_url_list :: "$\{attachment_url_list\}";
end;|3|3|c|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 67 subkind 0 parts [vector _interp_("$layout", "dollar_substitution")]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|C:\\Program Files\\Ab Initio\\Ab Initio GDE\\Components\\Transform\\Reformat.mpc|3|2|Pw$|@{0|}}
}}@0|@214500|96500|235000|117000|137000|72000|9|Prepare Message|Ab Initio Software|Built-in|1|10|-1||6||36865|1|{1|0|}}}
{2010203004|XXGoport|116|0|309|0|{@{}@371000|147000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|117|0|312|0|{@{}@252000|188000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|118|0|314|0|{@{}@297000|188000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|119|0|316|0|{@{}@342000|188000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|120|0|318|0|{@{}@225000|147000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|121|0|321|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl|The name used on the mp command line for this component|{0|}}
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
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
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
{2010203004|XXGoport|122|0|323|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|123|0|327|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|124|0|330|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|125|0|333|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|126|0|336|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|127|0|339|0|{Reads input records and sends e-mail messages.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|smtp_server_host|$smtp_server_host|3|2|$|@{0|}}
{30001002|XXparameter|smtp_server_port|$smtp_server_port|3|2|$|@{0|}}
{30001002|XXparameter|unix2dos|$unix2dos|3|2|$|@{0|}}
{30001002|XXparameter|attachment_charset|$attachment_charset|3|2|$|@{0|}}
{30001002|XXparameter|attachment_includes_full_path|$attachment_includes_full_path|3|2|$|@{0|}}
{30001002|XXparameter|tcp_connect_timeout|$tcp_connect_timeout|3|2|$|@{0|}}
{30001002|XXparameter|tcp_read_timeout|$tcp_read_timeout|3|2|$|@{0|}}
{30001002|XXparameter|tcp_write_timeout|$tcp_write_timeout|3|2|$|@{0|}}
{30001002|XXparameter|reconnect_limit|$reconnect_limit|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/Mail/Send_Multiple_Messages.mp|3|2|Pf$|@{0|}}
}}@0|@402000|41000|422000|61000|1206000|867000|11|Send_Multiple_Messages|Ab Initio|Created 09/17/04 13:06:09|1|10|-1||6||1|{0|}0|0|{0|}{0|}{0|}{0|}.21061359345912933|1206000|867000|0|}}
{2010240003|XXGlegend|128|0|341|0|{@{}@Each input message could 
contain multiple URLs of
the attachments that need
to be retrieved one by one.

A unique key is added to
ensure that attachments
can be linked with proper
messages.|32000|412000|52000|432000|158000|144000|0|}}
{2010242002|XXGface|129|0|343|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|130|0|345|0|{@{}@384|.8006756901741028|.5|{12|492000|132000|512000|132000|512000|332000|380000|332000|380000|382000|400000|382000|}0|17|}}
{2010210004|XXGflow|131|0|347|0|{@{}@384|.5|.5|{12|299000|363000|319000|363000|319000|239000|246000|239000|246000|114000|266000|114000|}0|17|}}
{2010210004|XXGflow|132|0|349|0|{@{}@384|.5|.5|{12|685000|696000|685000|696000|700000|696000|700000|690000|715000|690000|722000|690000|}0|17|}}
{2010210004|XXGflow|133|0|351|0|{@{}@384|.5|.5|{12|227000|229000|247000|229000|247000|298000|127000|298000|127000|368000|147000|368000|}0|17|}}
{2010210004|XXGflow|134|0|353|0|{@{}@384|.20945945382118225|.5|{12|805000|382000|825000|382000|825000|330000|609000|330000|609000|132000|629000|132000|}0|1041|}}
{2010210004|XXGflow|135|0|355|0|{@{}@384|.5|.5|{8|492000|96000|522000|96000|599000|96000|629000|96000|}0|1041|}}
{2010210004|XXGflow|136|0|357|0|{@{}@384|.5|.5|{12|937000|114000|957000|114000|957000|189000|845000|189000|845000|265000|865000|265000|}0|17|}}
{2010210004|XXGflow|137|0|359|0|{@{}@384|.8117647171020508|.5|{12|896000|312000|896000|332000|896000|612000|357000|612000|357000|678000|377000|678000|}0|1041|}}
{2010210004|XXGflow|138|0|361|0|{@{}@384|.5|.013513513840734959|{12|299000|373000|319000|373000|319000|373000|319000|712000|347000|712000|377000|712000|}0|1041|}}
{2010210004|XXGflow|139|0|363|0|{@{}@384|.5|.5|{12|726000|531000|746000|531000|746000|457000|614000|457000|614000|382000|634000|382000|}0|17|}}
{2010210004|XXGflow|140|0|365|0|{@{}@384|.5|.5|{12|552000|382000|572000|382000|572000|456000|480000|456000|480000|531000|500000|531000|}0|17|}}
{2010501005|XXGpvertex|141|0|367|0|{|{}@0|@74182|174318|94000|194000|123000|72000|0|Add Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|142|0|369|0|{@{}@216000|224000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|143|0|372|0|{@{}@109000|265000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|144|0|374|0|{@{}@150000|265000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|145|0|376|0|{@{}@191000|265000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|146|0|378|0|{@{}@84000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|147|0|380|0|{|{}@0|@625250|327861|645000|348000|150000|69000|0|Denormalize|Ab Initio Software|Built-in 2.0:|1|10|-1||6||36865|1|{1|0|}}}
{2010203004|XXGoport|148|0|382|0|{@{}@794000|377000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|149|0|385|0|{@{}@664000|416000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|150|0|387|0|{@{}@714000|416000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|151|0|389|0|{@{}@764000|416000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|152|0|391|0|{@{}@635000|377000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|153|0|394|0|{|{}@0|@368136|641682|388000|662000|287000|69000|0|Join|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|154|0|396|0|{@{}@674000|691000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|155|0|399|0|{@{}@403000|730000|11000|11000|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|156|0|401|0|{@{}@444000|730000|11000|11000|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|157|0|403|0|{@{}@485000|730000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|158|0|405|0|{@{}@526000|730000|11000|11000|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|159|0|407|0|{@{}@567000|730000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|160|0|409|0|{@{}@608000|730000|11000|11000|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|161|0|411|0|{@{}@649000|730000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|162|0|413|0|{@{}@378000|673000|11000|11000|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|163|0|416|0|{@{}@378000|707000|11000|11000|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|164|0|419|0|{|{}@0|@620000|59000|640000|79000|287000|72000|0|Join With Attachments|Ab Initio Software|Built-in|1|10|-1||6||36865|1|{1|0|}}}
{2010203004|XXGoport|165|0|421|0|{@{}@926000|109000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|166|0|424|0|{@{}@655000|150000|11000|11000|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|167|0|426|0|{@{}@696000|150000|11000|11000|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|168|0|428|0|{@{}@737000|150000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|169|0|430|0|{@{}@778000|150000|11000|11000|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|170|0|432|0|{@{}@819000|150000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|171|0|434|0|{@{}@860000|150000|11000|11000|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|172|0|436|0|{@{}@901000|150000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|173|0|438|0|{@{}@630000|91000|11000|11000|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|174|0|441|0|{@{}@630000|127000|11000|11000|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|175|0|444|0|{|{}@0|@713000|618000|733000|638000|135000|106000|0|Make port reject optional|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|176|0|446|0|{@{}@867000|685000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|177|0|448|0|{@{}@723000|685000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|178|0|451|0|{|{}@0|@391472|328111|411000|348000|131000|69000|0|Normalize|Ab Initio Software|Built-in 2.0:|1|10|-1||6||36865|1|{1|0|}}}
{2010203004|XXGoport|179|0|453|0|{@{}@541000|377000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|180|0|456|0|{@{}@427000|416000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|181|0|458|0|{@{}@470000|416000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|182|0|460|0|{@{}@513000|416000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|183|0|462|0|{@{}@401000|377000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|184|0|465|0|{|{}@0|@491000|476000|511000|496000|205000|72000|0|Read Attachments|Ab Initio Software|Built-in 2.11.8:|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|185|0|467|0|{@{}@715000|526000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|186|0|470|0|{@{}@526000|567000|11000|11000|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|187|0|472|0|{@{}@567000|567000|11000|11000|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|188|0|474|0|{@{}@608000|567000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|189|0|476|0|{@{}@649000|567000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|190|0|478|0|{@{}@690000|567000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|191|0|480|0|{@{}@501000|526000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|192|0|483|0|{|{}@0|@137500|315910|158000|336000|131000|65000|0|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|193|0|485|0|{@{}@288000|358000|11000|21000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|194|0|489|0|{@{}@148000|363000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|195|0|492|0|{Reads input records and sends e-mail messages.|{}@0|@856250|209611|876000|230000|123000|72000|0|Send Mail|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|196|0|494|0|{@{}@998000|260000|11000|11000|out|0.0|@@@2064|0|}}
{2010203004|XXGoport|197|0|496|0|{@{}@891000|301000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|198|0|499|0|{@{}@932000|301000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|199|0|501|0|{@{}@973000|301000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|200|0|503|0|{@{}@866000|260000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|201|0|506|0|{|{}@0|@256579|58676|277000|79000|205000|72000|0|Split Record|Ab Initio Software|Built-in|1|10|-1||6||36865|1|{1|0|}}}
{2010203004|XXGoport|202|0|508|0|{@{}@481000|91000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|203|0|511|0|{@{}@481000|127000|11000|11000|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|204|0|514|0|{@{}@292000|150000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|205|0|516|0|{@{}@333000|150000|11000|11000|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|206|0|518|0|{@{}@374000|150000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|207|0|520|0|{@{}@415000|150000|11000|11000|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|208|0|522|0|{@{}@456000|150000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|209|0|524|0|{@{}@267000|109000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|210|0|527|0|{@{}@544000|243000|11000|11000|error|.5|@@@13464|0|}}
{2010203004|XXGoport|211|0|530|0|{@{}@628000|243000|11000|11000|log|.8333333333333333|@@@13464|0|}}
{2010203004|XXGoport|212|0|533|0|{@{}@459000|243000|11000|11000|reject|.16666666666666666|@@@13328|0|}}
{2010203004|XXGoport|213|0|536|0|{@{}@675000|147000|11000|11000|out|.5|@@@14352|0|}}
{2010202004|XXGiport|214|0|539|0|{@{}@412000|147000|11000|11000|in|.5|@@@14096|0|}}
{2010600005|XXGgraph|215|0|543|0|{Reads input records and sends e-mail messages with attachments.
COPYRIGHT <See COPYRIGHT.TXT in this directory for applicable year(s)> AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|smtp_server_host||3|2|RFK$|Host name or IP address of the host running SMTP server.|{0|}}
{30001002|XXparameter|smtp_server_port|25|1|2|RFK$|Port number SMTP server listens on|{0|}}
{30001002|XXparameter|unix2dos|False|13|2|RFK$|Convert attachments from Unix to DOS.|{0|}}
{30001002|XXparameter|attachment_charset|utf8|3|2|RFK$|Attachments must be in this character set|{0|}}
{30001002|XXparameter|attachment_includes_full_path|False|13|2|RFK$|Include full path in the filename parameter of the attachment|{0|}}
{30001002|XXparameter|tcp_connect_timeout|1|3|2|RFK$||{0|}}
{30001002|XXparameter|tcp_read_timeout|0|3|2|RFK$||{0|}}
{30001002|XXparameter|tcp_write_timeout|0|3|2|RFK$||{0|}}
{30001002|XXparameter|reconnect_limit|1|3|2|RFK$||{0|}}
{30001002|XXparameter|continuous|False|13|1|FKl|This component can be used in continuous flows graphs|{0|}}
{30001002|XXparameter|mpcmodtime|0|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|7|}}
{2010240003|XXGlegend|216|0|545|0|{@{}@Each input message could 
contain multiple URLs of
the attachments that need
to be retrieved one by one.

A unique key is added to
ensure that attachments
can be linked with proper
messages.|32000|412000|52000|432000|158000|144000|0|}}
{2010242002|XXGface|217|0|547|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|218|0|549|0|{@{}@384|.8006756901741028|.5|{12|492000|132000|512000|132000|512000|332000|380000|332000|380000|382000|400000|382000|}0|17|}}
{2010210004|XXGflow|219|0|551|0|{@{}@384|.5|.5|{12|299000|363000|319000|363000|319000|239000|246000|239000|246000|114000|266000|114000|}0|17|}}
{2010210004|XXGflow|220|0|553|0|{@{}@384|.5|.5|{12|685000|696000|685000|696000|700000|696000|700000|690000|715000|690000|722000|690000|}0|17|}}
{2010210004|XXGflow|221|0|555|0|{@{}@384|.5|.5|{12|227000|229000|247000|229000|247000|298000|127000|298000|127000|368000|147000|368000|}0|17|}}
{2010210004|XXGflow|222|0|557|0|{@{}@384|.20945945382118225|.5|{12|805000|382000|825000|382000|825000|330000|609000|330000|609000|132000|629000|132000|}0|1041|}}
{2010210004|XXGflow|223|0|559|0|{@{}@384|.5|.5|{8|492000|96000|522000|96000|599000|96000|629000|96000|}0|1041|}}
{2010210004|XXGflow|224|0|561|0|{@{}@384|.5|.5|{12|937000|114000|957000|114000|957000|189000|845000|189000|845000|265000|865000|265000|}0|17|}}
{2010210004|XXGflow|225|0|563|0|{@{}@384|.8117647171020508|.5|{12|896000|312000|896000|332000|896000|612000|357000|612000|357000|678000|377000|678000|}0|1041|}}
{2010210004|XXGflow|226|0|565|0|{@{}@384|.5|.013513513840734959|{12|299000|373000|319000|373000|319000|373000|319000|712000|347000|712000|377000|712000|}0|1041|}}
{2010210004|XXGflow|227|0|567|0|{@{}@384|.5|.5|{12|726000|531000|746000|531000|746000|457000|614000|457000|614000|382000|634000|382000|}0|17|}}
{2010210004|XXGflow|228|0|569|0|{@{}@384|.5|.5|{12|552000|382000|572000|382000|572000|456000|480000|456000|480000|531000|500000|531000|}0|17|}}
{2010501005|XXGpvertex|229|0|571|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in) =
begin
  out.key :: next_in_sequence();
  out.*   :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata|include "~$AB_HOME/include/mail.dml";

metadata type = file_message_t;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata|include "~$AB_HOME/include/mail.dml";

metadata type = file_message_t;|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\Program Files\\Ab Initio\\Ab Initio GDE\\Components\\Transform\\Reformat.mpc|3|2|Pw$|@{0|}}
}}@0|@74182|174318|94000|194000|123000|72000|0|Add Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|230|0|573|0|{@{}@216000|224000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|231|0|576|0|{@{}@109000|265000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|232|0|578|0|{@{}@150000|265000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|233|0|580|0|{@{}@191000|265000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|234|0|582|0|{@{}@84000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|235|0|584|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl|The name used on the mp command line for this component|{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$|The custom transformation|{0|}}
{30001002|XXparameter|mpcmodtime|1093461294|1|1|Hl|The last modification time of this component's template|{0|}}
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
{2010203004|XXGoport|236|0|586|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|237|0|590|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|238|0|593|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|239|0|596|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|240|0|599|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|241|0|602|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|\{key\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|include "~$AB_HOME/include/mail.dml";

type element_type = file_t;
type denormalization_type = file_t[1000];

out::initial_denormalization() =
begin  
  out :: init_file();
end;

denorm_out::denormalize(denorm, in, count) =
begin
  denorm_out.index  :: count;
  denorm_out.elt    :: in.file;
  denorm_out.update :: 1;
end;

out::finalize(denorm, in) =
begin
  out.key      :: in.key;
  out.file_vec :: trim_file_vec(denorm);
end;|3|1|l|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|include "~$AB_HOME/include/mail.dml";

metadata type = 
record 
  key_t       key;        // Message key. Internally used by graphs.
  file_vec_t  file_vec;   // vector of attachements
end;|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\Program Files\\Ab Initio\\Ab Initio GDE\\Components\\Transform\\Denormalize Sorted.mpc|3|2|Pw$|@{0|}}
}}@0|@625250|327861|645000|348000|150000|69000|0|Denormalize|Ab Initio Software|Built-in 2.0:|1|10|-1||6||36865|1|{1|0|}}}
{2010203004|XXGoport|242|0|604|0|{@{}@794000|377000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|243|0|607|0|{@{}@664000|416000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|244|0|609|0|{@{}@714000|416000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|245|0|611|0|{@{}@764000|416000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|246|0|613|0|{@{}@635000|377000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|247|0|616|0|{Consolidates groups of related records in the input to a single data record with a vector field for each group, and optionally computes summary fields for each group.

It's the inverse of Normalize.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|denormalize|3|1|Hl|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|key_method|True|13|1|Fl|How groups are specified|{0|}}
{30001002|XXparameter|key_method.display_name|key-method|3|9|P|@{0|}}
{30001002|XXparameter|key_method_display_values|Usekey_changefunction Usekeyspecifier|3|2|H$||{0|}}
{30001002|XXparameter|key_method_display_values.display_name|key-method-display-values|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key to define denormalization groups|{0|}}
{30001002|XXparameter|key.condition|param key-method True|3|15|P?|@{0|}}
{30001002|XXparameter|positional_key|value key-method False "" sameas key|19|13|Ov|Key to define denormalization groups|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Filename containing denormalize functions|{0|}}
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
{30001002|XXparameter|check_sort|True|13|1|FKl|Abort on first record that is out of sorted order|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|param key-method True version 2.11.1:|3|15|P?|@{0|}}
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
{30001002|XXparameter|log_intermediate||15|1|Fl|Frequency of intermediate records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_intermediate.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$|The custom transformation|{0|}}
{30001002|XXparameter|mpcmodtime|1093461294|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|num_variables|3|1|2|H$|Number of intermediate types|{0|}}
{30001002|XXparameter|variable1|element_type elt "__null__"|3|2|H$|Element Type|{0|}}
{30001002|XXparameter|variable2|denormalization_type denorm "element_type[0]"|3|2|H$|Denorm vector|{0|}}
{30001002|XXparameter|variable3|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|num_types|1|1|2|H$|Number of private types|{0|}}
{30001002|XXparameter|type1|denorm_result_type denorm_out "record integer(4) index; element_type elt; integer(4) update = 1; end"|3|2|H$|Type of output from denormalize operation|{0|}}
{30001002|XXparameter|num_operations|8|1|2|H$|Number of steps in denorm|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|elt out::initial_denormalization()|3|2|H$|Initialize vector element|{0|}}
{30001002|XXparameter|operation4|temp ? temp::rollup(temp, in) : NULL|3|2|H$|Rollup on normalize|{0|}}
{30001002|XXparameter|operation5|temp ? denorm_out::denormalize(temp, denorm, in, integer(8) count) : denorm_out::denormalize(denorm, in, integer(8) count)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation6|temp ? out::finalize(temp, denorm, in) : out::finalize(denorm, in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation7|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation8|optional integer(8) out::key_change(in in1, in in2)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation3_analysis|elt::initial_denormalization()|3|2|H$||{0|}}
{30001002|XXparameter|operation7_analysis|integer(8) output_select_out::output_select(out)|3|2|H$||{0|}}
{30001002|XXparameter|operation8_analysis|integer(8) key_change_out::key_change(in in, in in)|3|2|H$||{0|}}
{30001002|XXparameter|operation9_analysis|denorm::move_data(elt,denorm_out)|3|2|H$||{0|}}
{30001002|XXparameter|extra_transforms_analysis|denorm::move_data(elt,denorm_out) = begin denorm:1:elt; denorm:2:denorm_out.elt; end;|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|248|0|618|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|249|0|621|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|250|0|624|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|251|0|627|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|252|0|630|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|253|0|633|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|\{text_message.key\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|out::join(in0, in1) =
begin
  out :: in1;  /*package mail;

* Once GDE understands contstants we'll swith back to their use
*
constant ascii string("\\0") MIME_TYPE_TEXT            = "text";
constant ascii string("\\0") MIME_TYPE_MULTIPART       = "multipart";

constant ascii string("\\0") MIME_SUBTYPE_PLAIN        = "plain";
constant ascii string("\\0") MIME_SUBTYPE_MIXED        = "mixed";

constant ascii string("\\0") ENCODING_Q                = "q";      // quoted-printable
constant ascii string("\\0") ENCODING_B                = "b";      // base64
constant ascii string("\\0") ENCODING_NONE             = "n";      // this is not an IANA token
*/
end;|3|1|l|@{0|}}
{30001002|XXparameter|override_key1|\{key\}|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|include "~$AB_HOME/include/mail.dml";

metadata type = file_message_t;|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|error1_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\Program Files\\Ab Initio\\Ab Initio GDE\\Components\\Transform\\Join.mpc|3|2|Pw$|@{0|}}
}}@0|@368136|641682|388000|662000|287000|69000|0|Join|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|254|0|635|0|{@{}@674000|691000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|255|0|638|0|{@{}@403000|730000|11000|11000|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|256|0|640|0|{@{}@444000|730000|11000|11000|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|257|0|642|0|{@{}@485000|730000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|258|0|644|0|{@{}@526000|730000|11000|11000|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|259|0|646|0|{@{}@567000|730000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|260|0|648|0|{@{}@608000|730000|11000|11000|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|261|0|650|0|{@{}@649000|730000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|262|0|652|0|{@{}@378000|673000|11000|11000|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|263|0|655|0|{@{}@378000|707000|11000|11000|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|264|0|658|0|{Performs inner, outer, and semi-joins with multiple flows of data records.  It maximizes performance by loading input data records into main memory.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?join|3|1|Hl|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of inputs to join function|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Ordering of input data|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|_min_count|2|1|2|FH$|Minimum number of inputs to join|{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field(s) on which to join|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Filename containing join function|{0|}}
{30001002|XXparameter|join_type|Inner Join (matching records required on all inputs)|15|1|Fl|Handling for duplicate and missing key values|{3|Inner Join (matching records required on all inputs)|Full Outer Join (use null for missing records)|Explicit|}}
{30001002|XXparameter|join_type.display_name|join-type|3|9|P|@{0|}}
{30001002|XXparameter|record_required0|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param join-type Explicit|3|15|P?|@{0|}}
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
{30001002|XXparameter|sorted_input_display_values|In-memory;Inputsneednotbesorted Inputsmustbesorted|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input_display_values.display_name|sorted-input-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_required_display_values|True(recordrequiredonthisinput) False(usenullformissingrecord)|3|2|H$||{0|}}
{30001002|XXparameter|record_required_display_values.display_name|record-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|dedup_display_values|Donotdedupthisinput Dedupthisinputbeforejoining|3|2|H$||{0|}}
{30001002|XXparameter|dedup_display_values.display_name|dedup-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0|sameas record-required|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_positional1|sameas record-required|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0|sameas dedup|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1|sameas dedup|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
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
{30001002|XXparameter|record_required_keyword0|sameas record-required|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1|sameas record-required|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0|sameas dedup|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1|sameas dedup|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
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
{30001002|XXparameter|sorted_mpname|merge-join|3|2|H$||{0|}}
{30001002|XXparameter|sorted_mpname.display_name|sorted-mpname|3|9|P|@{0|}}
{30001002|XXparameter|memory_mpname|hash-join|3|2|H$||{0|}}
{30001002|XXparameter|memory_mpname.display_name|memory-mpname|3|9|P|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp max-memory max-core dedup singlematch dedup-keyword singlematch record-required matchoptional record-required-keyword matchoptional select-keyword select record-required-positional matchoptional dedup-positional singlematch|3|2|H$||{0|}}
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
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|unused0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|unused1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,unused[*],reject[*],error[*],log::document(in[*])|3|2|RH$|The custom transformation|{0|}}
{30001002|XXparameter|mpcmodtime|1093461294|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|num_operations|1|1|2|H$|Number of join steps|{0|}}
{30001002|XXparameter|operation1|out::join(in[*])|3|2|H$|Join transform|{0|}}
{30001002|XXparameter|port_analysis|reject*=in*; unused*=in*|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: unused = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|265|0|660|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|266|0|663|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|267|0|666|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|268|0|669|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|269|0|672|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|270|0|675|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|271|0|678|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|272|0|681|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|273|0|684|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|record_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select0||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|274|0|697|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|record_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup1||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select1||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|275|0|710|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|\{key\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|/*Join transform*/
out::join(in0, in1) =
begin
  out.text_message :: in0;
  out.file_vec :: in1.file_vec;
end;|3|1|l|@{0|}}
{30001002|XXparameter|join_type|Full Outer Join (use null for missing records)|3|1|l|@{0|}}
{30001002|XXparameter|record_required0|True|3|1|l|@{0|}}
{30001002|XXparameter|record_required1|True|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|include "~$AB_HOME/include/mail.dml";

metadata type = text_message_with_files_t;|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|error1_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\Program Files\\Ab Initio\\Ab Initio GDE\\Components\\Transform\\Join.mpc|3|2|Pw$|@{0|}}
}}@0|@620000|59000|640000|79000|287000|72000|0|Join With Attachments|Ab Initio Software|Built-in|1|10|-1||6||36865|1|{1|0|}}}
{2010203004|XXGoport|276|0|712|0|{@{}@926000|109000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|277|0|715|0|{@{}@655000|150000|11000|11000|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|278|0|717|0|{@{}@696000|150000|11000|11000|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|279|0|719|0|{@{}@737000|150000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|280|0|721|0|{@{}@778000|150000|11000|11000|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|281|0|723|0|{@{}@819000|150000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|282|0|725|0|{@{}@860000|150000|11000|11000|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|283|0|727|0|{@{}@901000|150000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|284|0|729|0|{@{}@630000|91000|11000|11000|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|285|0|732|0|{@{}@630000|127000|11000|11000|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|286|0|735|0|{Performs inner, outer, and semi-joins with multiple flows of data records.  It maximizes performance by loading input data records into main memory.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?join|3|1|Hl|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of inputs to join function|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Ordering of input data|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|_min_count|2|1|2|FH$|Minimum number of inputs to join|{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field(s) on which to join|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Filename containing join function|{0|}}
{30001002|XXparameter|join_type|Inner Join (matching records required on all inputs)|15|1|Fl|Handling for duplicate and missing key values|{3|Inner Join (matching records required on all inputs)|Full Outer Join (use null for missing records)|Explicit|}}
{30001002|XXparameter|join_type.display_name|join-type|3|9|P|@{0|}}
{30001002|XXparameter|record_required0|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param join-type Explicit|3|15|P?|@{0|}}
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
{30001002|XXparameter|sorted_input_display_values|In-memory;Inputsneednotbesorted Inputsmustbesorted|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input_display_values.display_name|sorted-input-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_required_display_values|True(recordrequiredonthisinput) False(usenullformissingrecord)|3|2|H$||{0|}}
{30001002|XXparameter|record_required_display_values.display_name|record-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|dedup_display_values|Donotdedupthisinput Dedupthisinputbeforejoining|3|2|H$||{0|}}
{30001002|XXparameter|dedup_display_values.display_name|dedup-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0|sameas record-required|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_positional1|sameas record-required|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0|sameas dedup|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1|sameas dedup|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
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
{30001002|XXparameter|record_required_keyword0|sameas record-required|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1|sameas record-required|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0|sameas dedup|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1|sameas dedup|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
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
{30001002|XXparameter|sorted_mpname|merge-join|3|2|H$||{0|}}
{30001002|XXparameter|sorted_mpname.display_name|sorted-mpname|3|9|P|@{0|}}
{30001002|XXparameter|memory_mpname|hash-join|3|2|H$||{0|}}
{30001002|XXparameter|memory_mpname.display_name|memory-mpname|3|9|P|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp max-memory max-core dedup singlematch dedup-keyword singlematch record-required matchoptional record-required-keyword matchoptional select-keyword select record-required-positional matchoptional dedup-positional singlematch|3|2|H$||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|unused0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|unused1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,unused[*],reject[*],error[*],log::document(in[*])|3|2|RH$|The custom transformation|{0|}}
{30001002|XXparameter|mpcmodtime|1093461294|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|num_operations|1|1|2|H$|Number of join steps|{0|}}
{30001002|XXparameter|operation1|out::join(in[*])|3|2|H$|Join transform|{0|}}
{30001002|XXparameter|port_analysis|reject*=in*; unused*=in*|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: unused = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|287|0|737|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|288|0|740|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|289|0|743|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|290|0|746|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|291|0|749|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|292|0|752|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|293|0|755|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|294|0|758|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|295|0|761|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|record_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select0||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|296|0|774|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|record_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup1||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select1||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|297|0|787|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|C:\\Program Files\\Ab Initio\\Ab Initio GDE\\Components\\Miscellaneous\\Replicate.mpc|3|2|Pw$|@{0|}}
}}@0|@713000|618000|733000|638000|135000|106000|0|Make port reject optional|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|298|0|789|0|{@{}@867000|685000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|299|0|791|0|{@{}@723000|685000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|300|0|794|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$|The custom transformation|{0|}}
{30001002|XXparameter|mpcmodtime|1056406024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|301|0|796|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|302|0|799|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|303|0|802|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|include "~$AB_HOME/include/mail.dml";

/*Number of records to output*/
out::length(in) =
begin
  out::length_of(in.url_list);
end;

/*Do computation*/
string_t out::normalize(string_vec_t in, index) =
begin
  let string_vec_t vec = in.url_list;

  out.key :: in.key;
  out.url :: vec[index];
end;|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|include "~$AB_HOME/include/mail.dml";

metadata type = 
record 
  key_t     key; // Message key. Internally used by graphs.
  string_t  url;
end;|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\Program Files\\Ab Initio\\Ab Initio GDE\\Components\\Transform\\Normalize.mpc|3|2|Pw$|@{0|}}
}}@0|@391472|328111|411000|348000|131000|69000|0|Normalize|Ab Initio Software|Built-in 2.0:|1|10|-1||6||36865|1|{1|0|}}}
{2010203004|XXGoport|304|0|804|0|{@{}@541000|377000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|305|0|807|0|{@{}@427000|416000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|306|0|809|0|{@{}@470000|416000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|307|0|811|0|{@{}@513000|416000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|308|0|813|0|{@{}@401000|377000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|309|0|816|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Filename containing normalize functions|{0|}}
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
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$|The custom transformation|{0|}}
{30001002|XXparameter|mpcmodtime|1093461294|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate types in scan|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of steps in scan|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|integer(8) out::length(in)|3|2|H$|Number of records to output|{0|}}
{30001002|XXparameter|operation4|temp ? temp::normalize(temp, in, integer(8) index) : out::normalize(in, integer(8) index)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation5|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation6|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation3_analysis|integer(8) length_out::length(in)|3|2|H$|Number of records to output|{0|}}
{30001002|XXparameter|operation6_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|310|0|818|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|311|0|821|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|312|0|824|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|313|0|827|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|314|0|830|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|315|0|833|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|include "~$AB_HOME/include/mail.dml";

type input_type = 
void(big endian integer(8));

let integer(8) key = 0;

/*extract filename from input record*/
filename::get_filename(in) =
begin
  key = in.key;

  filename      :: in.url;
end;

/* Create output record*/
out::reformat(read, filename) =
begin
  let input_type                          data;
  let utf8 string(big endian integer(8))  str;
  let string_t                            fname;
  let int                                 index;
  let int                                 length; 

  if (string_compare("$\{unix2dos\}", "True"))
    data = read;
  else
    begin
      str = reinterpret_as(string(big endian integer(8), charset="$\{attachment_charset\}"),read);

      if (string_index(str, "\\r\\n") > 0)
        data = str;
      else
        begin
          str  = string_replace(str, "\\n", "\\r\\n");
          data = str;
        end
    end

  if (string_compare("$\{attachment_includes_full_path\}", "True"))
    begin
      length = string_length(filename);
      index  = string_rindex(filename, "/");
    
      if (index > 0)
        fname = string_suffix(filename, length - index); 
      else
        begin
          index = string_rindex(filename, "\\\\");
          if (index > 0)
            fname = string_suffix(filename, length - index); 
          else
            fname = filename;
        end
    end
  else
    fname = filename;

  out.key       :: key;
  out.file.data :: data;                     
  out.file.url  :: fname;
end;|3|3|c|@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|file_missing|Ignore (continue with no reject or error)|3|1|l|@{0|}}
{30001002|XXparameter|filename_error|Ignore (continue with no reject or error)|3|1|l|@{0|}}
{30001002|XXparameter|read_as_single_record|True|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|include "~$AB_HOME/include/mail.dml";

metadata type = 
record
  key_t    key;        // Message key. Internally used by graphs.
  file_t   file;       // File data.
end;|3|1|l|@{0|}}
{30001002|XXparameter|fileerror_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\Program Files\\Ab Initio\\Ab Initio GDE\\Components\\Datasets\\Read Multiple Files.mpc|3|2|Pw$|@{0|}}
}}@0|@491000|476000|511000|496000|205000|72000|0|Read Attachments|Ab Initio Software|Built-in 2.11.8:|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|316|0|835|0|{@{}@715000|526000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|317|0|838|0|{@{}@526000|567000|11000|11000|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|318|0|840|0|{@{}@567000|567000|11000|11000|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|319|0|842|0|{@{}@608000|567000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|320|0|844|0|{@{}@649000|567000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|321|0|846|0|{@{}@690000|567000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|322|0|848|0|{@{}@501000|526000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|323|0|851|0|{Sequentially reads from a list of input files|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/readfiles|3|2|H$|The image used if this component was a custom component|{0|}}
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
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if the reformat transform rejects records read from input files|{3|Abort on first reject|Never abort|Use limit/ramp|}}
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
{30001002|XXparameter|file_empty|Ignore (continue with no reject or error)|15|1|Fl|What to do if an input file is empty|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|file_empty.display_name|file-empty|3|9|P|@{0|}}
{30001002|XXparameter|file_empty.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_empty_keyword|value file-empty F* Fail value file-empty N* Notify value file-empty I* Ignore|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|file_empty_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_missing|Fail (Stop processing)|15|1|Fl|What to do if an input file is missing|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|file_missing.display_name|file-missing|3|9|P|@{0|}}
{30001002|XXparameter|file_missing.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_missing_keyword|value file-missing F* Fail value file-missing N* Notify value file-missing I* Ignore|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|file_missing_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|filename_error|Fail (Stop processing)|15|1|Fl|What to do with an input record when get_filename() fails|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|filename_error.display_name|filename-error|3|9|P|@{0|}}
{30001002|XXparameter|filename_error.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|filename_error_keyword|value filename-error F* Fail value filename-error N* Notify value filename-error I* Ignore|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|filename_error_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, reads compressed input files|{0|}}
{30001002|XXparameter|compressed.condition|version 2.12.2.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|read_as_single_record|False|13|1|FKl|If True, reads each file as one record, adding an initial 8-byte size|{0|}}
{30001002|XXparameter|read_as_single_record.condition|version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp file_empty_keyword file-empty file_missing_keyword file-missing filename_error_keyword filename-error|3|2|$||{0|}}
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
{30001002|XXparameter|empty_type|record
end;|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|filereject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|fileerror_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,filereject,fileerror,reject,error,log::document(in)|3|2|RH$|The custom transformation|{0|}}
{30001002|XXparameter|mpcmodtime|0|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional input_type read <parameter out_metadata>|3|2|H$|Metadata for records read from input files|{0|}}
{30001002|XXparameter|num_types|1|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|num_operations|3|1|2|H$|Number of steps in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation2|optional out::reformat(read, filename)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation2_analysis|out::reformat(read, filename)|3|2|H$||{0|}}
{30001002|XXparameter|operation3|optional read::repair_input(rawbytes, filename)|3|2|H$|Repair malformed input record from file|{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional input_type read <parameter out_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=^read ; out=^read; filereject=in|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=read,r|3|2|H$||{0|}}
{30001002|XXparameter|_propagation|metadata type: filereject = in
metadata type: fileerror = "string('\\\\n')"
metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|324|0|853|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|325|0|856|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|326|0|859|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|327|0|862|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|328|0|865|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|329|0|868|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|330|0|871|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|331|0|874|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|c:\\program files\\ab initio\\Ab Initio GDE 1.15.6.2\\Components\\Miscellaneous\\Replicate.mpc|3|2|Pw$|@{0|}}
}}@0|@137500|315910|158000|336000|131000|65000|0|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|332|0|876|0|{@{}@288000|358000|11000|21000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|333|0|880|0|{@{}@148000|363000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|334|0|883|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1214240220|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|335|0|885|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|336|0|888|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|337|0|891|0|{Reads input records and sends e-mail messages.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|include "~$AB_HOME/include/mail.dml";

// Metadata for records containing message information
type _message_t = record
  envelope_t envelope;
  content_t content = NULL;
end;

// Metadata for records containing server_log information
type _server_log_t = ascii string("\\0");

/*Prepare message information*/
message::prepare_message(in) =
begin
  message :: create_message_using_text_message_with_files(in);
end;

/*Create output record*/
out::create_output(in, server_log) =
begin
  out.message    :: in;
  out.server_log :: server_log;
end;|3|1|l|@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|smtp_server_host|$smtp_server_host|3|2|$|@{0|}}
{30001002|XXparameter|smtp_server_port|$smtp_server_port|3|2|$|@{0|}}
{30001002|XXparameter|tcp_connect_timeout|$tcp_connect_timeout|3|2|$|@{0|}}
{30001002|XXparameter|tcp_read_timeout|$tcp_read_timeout|3|2|$|@{0|}}
{30001002|XXparameter|tcp_write_timeout|$tcp_write_timeout|3|2|$|@{0|}}
{30001002|XXparameter|reconnect_limit|$reconnect_limit|3|2|$|@{0|}}
{30001002|XXparameter|continuous||3|8|=|@{0|}}
{30001002|XXparameter|out_metadata|include "~$AB_HOME/include/mail.dml";

metadata type = record 
  text_message_with_files_t message;
  server_log_t              server_log;
end;|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/Mail/Send_Mail.mpc|3|2|Pf$|@{0|}}
}}@0|@856250|209611|876000|230000|123000|72000|0|Send Mail|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|338|0|893|0|{@{}@998000|260000|11000|11000|out|0.0|@@@2064|0|}}
{2010203004|XXGoport|339|0|895|0|{@{}@891000|301000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|340|0|898|0|{@{}@932000|301000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|341|0|900|0|{@{}@973000|301000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|342|0|902|0|{@{}@866000|260000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|343|0|905|0|{Send Mail component provides control over low-level details of sending an email message.  For most applications, the SEND MESSAGE and SEND MULTIPLE MESSAGES components provide all of the functionality that is required and they are much simpler to use.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|send-mail|3|1|Hl||{0|}}
{30001002|XXparameter|image__|send-mail|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16.0.r2:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16.0.r2:|3|15|P?|@{0|}}
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
{30001002|XXparameter|smtp_server_host||3|2|RFK$|Host name or IP address of the host running SMTP server.|{0|}}
{30001002|XXparameter|smtp_server_host.display_name|smtp-server-host|3|9|P|@{0|}}
{30001002|XXparameter|smtp_server_host.keyword|smtp-server-host|3|9|P|@{0|}}
{30001002|XXparameter|smtp_server_port|25|1|2|FK$|SMTP server port.|{0|}}
{30001002|XXparameter|smtp_server_port.display_name|smtp-server-port|3|9|P|@{0|}}
{30001002|XXparameter|smtp_server_port.keyword|smtp-server-port|3|9|P|@{0|}}
{30001002|XXparameter|tcp_connect_timeout|1|1|2|FK$|TCP connection timeout.|{0|}}
{30001002|XXparameter|tcp_connect_timeout.display_name|tcp-connect-timeout|3|9|P|@{0|}}
{30001002|XXparameter|tcp_connect_timeout.keyword|tcp-connect-timeout|3|9|P|@{0|}}
{30001002|XXparameter|tcp_read_timeout|0|1|2|FK$|Timeout for reading from TCP buffer.|{0|}}
{30001002|XXparameter|tcp_read_timeout.display_name|tcp-read-timeout|3|9|P|@{0|}}
{30001002|XXparameter|tcp_read_timeout.keyword|tcp-read-timeout|3|9|P|@{0|}}
{30001002|XXparameter|tcp_write_timeout|0|1|2|FK$|Timeout for writing to TCP buffer.|{0|}}
{30001002|XXparameter|tcp_write_timeout.display_name|tcp-write-timeout|3|9|P|@{0|}}
{30001002|XXparameter|tcp_write_timeout.keyword|tcp-write-timeout|3|9|P|@{0|}}
{30001002|XXparameter|validate_addresses|True|13|1|FKl|Instructs component to validate syntax of addresses.|{0|}}
{30001002|XXparameter|validate_addresses.display_name|validate-addresses|3|9|P|@{0|}}
{30001002|XXparameter|validate_addresses.keyword|validate-addresses|3|9|P|@{0|}}
{30001002|XXparameter|on_address_error|Reject|15|1|FKl|What to do with the input record on address error|{3|Reject|Log|Ignore|}}
{30001002|XXparameter|on_address_error.display_name|on-address-error|3|9|P|@{0|}}
{30001002|XXparameter|on_address_error.keyword|on-address-error|3|9|P|@{0|}}
{30001002|XXparameter|reconnect_limit|10|1|2|FK$|Number of attempts to re-establish connection dropped by server, per record.|{0|}}
{30001002|XXparameter|reconnect_limit.display_name|reconnect-limit|3|9|P|@{0|}}
{30001002|XXparameter|reconnect_limit.keyword|reconnect-limit|3|9|P|@{0|}}
{30001002|XXparameter|reconnect_limit.update_clauses|retain_old_default|3|9|P|@{0|}}
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
{30001002|XXparameter|debug_file_name|debug|3|2|FK$|Name of the debug file|{0|}}
{30001002|XXparameter|debug_file_name.display_name|debug-file-name|3|9|P|@{0|}}
{30001002|XXparameter|debug_file_name.keyword|debug-file-name|3|9|P|@{0|}}
{30001002|XXparameter|debug_file_name.condition|param debug True|3|15|P?|@{0|}}
{30001002|XXparameter|continuous|False|13|1|FKl|This component can be used in continuous flows graphs|{0|}}
{30001002|XXparameter|continuous.condition|version 2.15.5.r32:|3|15|P?|@{0|}}
{30001002|XXparameter|num_includes|1|1|2|H$|Number of includes in package|{0|}}
{30001002|XXparameter|include1|~ab_home/include/mail.dml|3|2|H$|DML types for sending mail|{0|}}
{30001002|XXparameter|num_variables|2|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|_message_t message "record
  envelope_t envelope;
  content_t content=NULL;
end"|3|2|H$|Metadata for records containing message information|{0|}}
{30001002|XXparameter|variable2|_server_log_t server_log "string('\\0')"|3|2|H$|Metadata for records containing server_log information|{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|message::prepare_message(in)|3|2|H$|Prepare message information|{0|}}
{30001002|XXparameter|operation2|out::create_output(in, server_log)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? publisher : nonrecoverable|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|0|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|344|0|907|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2064|0|}}
{2010203004|XXGoport|345|0|910|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|346|0|913|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|347|0|916|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|348|0|919|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|349|0|923|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|include "~$AB_HOME/include/mail.dml";


out::reformat(in) =
begin
  out :: create_text_message_using_file_message(in);
end;|3|1|l|@{0|}}
{30001002|XXparameter|transform1|include "~$AB_HOME/include/mail.dml";

out::reformat(in) =
begin
  let string_t     url_list_str = in.attachment_url_list;
  let string_vec_t url_list     = string_to_vector(url_list_str);

  out.key      :: in.key;
  out.url_list :: url_list;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata|include "~$AB_HOME/include/mail.dml";

metadata type = text_message_t;|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|out1_metadata|include "~$AB_HOME/include/mail.dml";

metadata type = 
record
  key_t         key;                  // Message key. Internally used by graphs.
  string_vec_t  url_list = NULL;      // Vector of URLs for a particular message.
end;|3|1|l|@{0|}}
{30001002|XXparameter|error1_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\Program Files\\Ab Initio\\Ab Initio GDE\\Components\\Transform\\Reformat.mpc|3|2|Pw$|@{0|}}
}}@0|@256579|58676|277000|79000|205000|72000|0|Split Record|Ab Initio Software|Built-in|1|10|-1||6||36865|1|{1|0|}}}
{2010203004|XXGoport|350|0|925|0|{@{}@481000|91000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|351|0|928|0|{@{}@481000|127000|11000|11000|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|352|0|931|0|{@{}@292000|150000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|353|0|933|0|{@{}@333000|150000|11000|11000|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|354|0|935|0|{@{}@374000|150000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|355|0|937|0|{@{}@415000|150000|11000|11000|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|356|0|939|0|{@{}@456000|150000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|357|0|941|0|{@{}@267000|109000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|358|0|944|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
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
{30001002|XXparameter|out0_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$|The custom transformation|{0|}}
{30001002|XXparameter|mpcmodtime|0|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|output_index_signature|int out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|num_operations|1|1|2|H$|Number of operations per reformat|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|port_analysis|reject*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|359|0|946|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|360|0|950|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|361|0|954|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|362|0|957|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|363|0|960|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|364|0|963|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|365|0|966|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|366|0|969|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|367|0|972|0|{@{}@0|0|0|0|error|.5|@@@13464|0|}}
{2010203004|XXGoport|368|0|975|0|{@{}@0|0|0|0|log|.8333333333333333|@@@13464|0|}}
{2010203004|XXGoport|369|0|978|0|{@{}@0|0|0|0|reject|.16666666666666666|@@@13328|0|}}
{2010203004|XXGoport|370|0|981|0|{@{}@0|0|0|0|out|.5|@@@14352|0|}}
{2010202004|XXGiport|371|0|984|0|{@{}@0|0|0|0|in|.5|@@@14096|0|}}
{2010203004|XXGoport|372|0|987|0|{@{}@0|0|0|0|reject|.16666666666666666|@@@13328|0|}}
{2010203004|XXGoport|373|0|990|0|{@{}@0|0|0|0|error|.5|@@@13464|0|}}
{2010203004|XXGoport|374|0|993|0|{@{}@0|0|0|0|log|.8333333333333333|@@@13464|0|}}
{2010203004|XXGoport|375|0|996|0|{@{}@0|0|0|0|out|.5|@@@14352|0|}}
{2010110002|XXGconstant|376|0|999|0|{@{}@{1|7784093|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010601001|XXGgraph_vertex_vertex|4|0|8|0|{Send_Message_with_attachment_as_file|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_1|}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_2|}5|7|}
{2010601001|XXGgraph_vertex_vertex|7|0|14|0|{Generate_Records|}5|8|}
{2010212001|XXGvertex_oport_oport|8|0|16|0|{0|out|}8|9|}
{2010213001|XXGoport_dst_flow|9|0|18|0|{0|}9|6|}
{2010601001|XXGgraph_vertex_vertex|10|0|19|0|{Prepare_Message|}5|10|}
{2010212001|XXGvertex_oport_oport|11|0|21|0|{0|out0|}10|11|}
{2010213001|XXGoport_dst_flow|12|0|23|0|{0|}11|7|}
{2010212001|XXGvertex_oport_oport|13|0|24|0|{1|reject0|}10|12|}
{2010212001|XXGvertex_oport_oport|14|0|26|0|{2|error0|}10|13|}
{2010212001|XXGvertex_oport_oport|15|0|28|0|{3|log|}10|14|}
{2010211001|XXGvertex_iport_iport|16|0|30|0|{0|in|}10|15|}
{2010214001|XXGiport_src_flow|17|0|32|0|{0|}15|6|}
{2010006001|XXGobject_psameas_object|18|0|33|0|{in_metadata|out_metadata|0|0|}10|8|}
{2010006001|XXGobject_psameas_object|19|0|34|0|{out0_metadata|in_metadata|0|0|}10|16|}
{2010212001|XXGvertex_oport_oport|20|0|36|0|{0|out0|}16|17|}
{2010213001|XXGoport_dst_flow|21|0|38|0|{0|}17|18|}
{2010212001|XXGvertex_oport_oport|22|0|40|0|{1|reject0|}16|19|}
{2010212001|XXGvertex_oport_oport|23|0|42|0|{2|error0|}16|20|}
{2010212001|XXGvertex_oport_oport|24|0|44|0|{3|log|}16|21|}
{2010211001|XXGvertex_iport_iport|25|0|46|0|{0|in|}16|22|}
{2010006001|XXGobject_psameas_object|26|0|48|0|{Layout|Layout|0|0|}16|10|}
{2010006001|XXGobject_psameas_object|27|0|49|0|{reject0_metadata|in_metadata|0|0|}16|16|}
{2010006001|XXGobject_psameas_object|28|0|50|0|{reject0_metadata|out_metadata|0|0|}10|8|}
{2010601001|XXGgraph_vertex_vertex|29|0|51|0|{Send_Multiple_Messages|}5|23|}
{2010605001|XXGgraph_legend_legend|30|0|53|0|{0|}23|24|}
{2010241001|XXGlegend_face_face|31|0|55|0|{}24|25|}
{2010604001|XXGgraph_flow_flow|32|0|57|0|{Flow_1|}23|26|}
{2010604001|XXGgraph_flow_flow|33|0|59|0|{Flow_10|}23|27|}
{2010604001|XXGgraph_flow_flow|34|0|61|0|{Flow_11|}23|28|}
{2010604001|XXGgraph_flow_flow|35|0|63|0|{Flow_2|}23|18|}
{2010604001|XXGgraph_flow_flow|36|0|64|0|{Flow_3|}23|29|}
{2010604001|XXGgraph_flow_flow|37|0|66|0|{Flow_4|}23|30|}
{2010604001|XXGgraph_flow_flow|38|0|68|0|{Flow_5|}23|31|}
{2010604001|XXGgraph_flow_flow|39|0|70|0|{Flow_6|}23|32|}
{2010604001|XXGgraph_flow_flow|40|0|72|0|{Flow_7|}23|33|}
{2010604001|XXGgraph_flow_flow|41|0|74|0|{Flow_8|}23|34|}
{2010604001|XXGgraph_flow_flow|42|0|76|0|{Flow_9|}23|35|}
{2010601001|XXGgraph_vertex_vertex|43|0|78|0|{Add_Key|}23|16|}
{2010601001|XXGgraph_vertex_vertex|44|0|79|0|{Denormalize|}23|36|}
{2010212001|XXGvertex_oport_oport|45|0|81|0|{0|out|}36|37|}
{2010213001|XXGoport_dst_flow|46|0|83|0|{0|}37|29|}
{2010212001|XXGvertex_oport_oport|47|0|84|0|{1|reject|}36|38|}
{2010212001|XXGvertex_oport_oport|48|0|86|0|{2|error|}36|39|}
{2010212001|XXGvertex_oport_oport|49|0|88|0|{3|log|}36|40|}
{2010211001|XXGvertex_iport_iport|50|0|90|0|{0|in|}36|41|}
{2010214001|XXGiport_src_flow|51|0|92|0|{0|}41|34|}
{2010006001|XXGobject_psameas_object|52|0|93|0|{Layout|Layout|0|0|}36|10|}
{2010006001|XXGobject_psameas_object|53|0|94|0|{in_metadata|out_metadata|0|0|}36|42|}
{2010212001|XXGvertex_oport_oport|54|0|96|0|{0|out|}42|43|}
{2010213001|XXGoport_dst_flow|55|0|98|0|{0|}43|34|}
{2010212001|XXGvertex_oport_oport|56|0|99|0|{1|filereject|}42|44|}
{2010212001|XXGvertex_oport_oport|57|0|101|0|{2|fileerror|}42|45|}
{2010212001|XXGvertex_oport_oport|58|0|103|0|{3|reject|}42|46|}
{2010212001|XXGvertex_oport_oport|59|0|105|0|{4|error|}42|47|}
{2010212001|XXGvertex_oport_oport|60|0|107|0|{5|log|}42|48|}
{2010211001|XXGvertex_iport_iport|61|0|109|0|{0|in|}42|49|}
{2010214001|XXGiport_src_flow|62|0|111|0|{0|}49|35|}
{2010006001|XXGobject_psameas_object|63|0|112|0|{Layout|Layout|0|0|}42|10|}
{2010006001|XXGobject_psameas_object|64|0|113|0|{filereject_metadata|out_metadata|0|0|}42|50|}
{2010212001|XXGvertex_oport_oport|65|0|115|0|{0|out|}50|51|}
{2010213001|XXGoport_dst_flow|66|0|117|0|{0|}51|35|}
{2010212001|XXGvertex_oport_oport|67|0|118|0|{1|reject|}50|52|}
{2010212001|XXGvertex_oport_oport|68|0|120|0|{2|error|}50|53|}
{2010212001|XXGvertex_oport_oport|69|0|122|0|{3|log|}50|54|}
{2010211001|XXGvertex_iport_iport|70|0|124|0|{0|in|}50|55|}
{2010214001|XXGiport_src_flow|71|0|126|0|{0|}55|26|}
{2010006001|XXGobject_psameas_object|72|0|127|0|{Layout|Layout|0|0|}50|10|}
{2010006001|XXGobject_psameas_object|73|0|128|0|{in_metadata|out1_metadata|0|0|}50|56|}
{2010212001|XXGvertex_oport_oport|74|0|130|0|{0|out0|}56|57|}
{2010213001|XXGoport_dst_flow|75|0|132|0|{0|}57|30|}
{2010212001|XXGvertex_oport_oport|76|0|133|0|{1|out1|}56|58|}
{2010213001|XXGoport_dst_flow|77|0|135|0|{0|}58|26|}
{2010212001|XXGvertex_oport_oport|78|0|136|0|{2|reject0|}56|59|}
{2010212001|XXGvertex_oport_oport|79|0|138|0|{3|reject1|}56|60|}
{2010212001|XXGvertex_oport_oport|80|0|140|0|{4|error0|}56|61|}
{2010212001|XXGvertex_oport_oport|81|0|142|0|{5|error1|}56|62|}
{2010212001|XXGvertex_oport_oport|82|0|144|0|{6|log|}56|63|}
{2010211001|XXGvertex_iport_iport|83|0|146|0|{0|in|}56|64|}
{2010214001|XXGiport_src_flow|84|0|148|0|{0|}64|27|}
{2010006001|XXGobject_psameas_object|85|0|149|0|{Layout|Layout|0|0|}56|10|}
{2010006001|XXGobject_psameas_object|86|0|150|0|{in_metadata|out0_metadata|0|0|}56|16|}
{2010006001|XXGobject_psameas_object|87|0|151|0|{reject0_metadata|out0_metadata|0|0|}56|16|}
{2010006001|XXGobject_psameas_object|88|0|152|0|{reject1_metadata|out0_metadata|0|0|}56|16|}
{2010006001|XXGobject_psameas_object|89|0|153|0|{reject_metadata|out1_metadata|0|0|}50|56|}
{2010006001|XXGobject_psameas_object|90|0|154|0|{in_metadata|out_metadata|0|0|}42|50|}
{2010006001|XXGobject_psameas_object|91|0|155|0|{reject_metadata|out_metadata|0|0|}36|42|}
{2010601001|XXGgraph_vertex_vertex|92|0|156|0|{Join|}23|65|}
{2010212001|XXGvertex_oport_oport|93|0|158|0|{0|out|}65|66|}
{2010213001|XXGoport_dst_flow|94|0|160|0|{0|}66|28|}
{2010212001|XXGvertex_oport_oport|95|0|161|0|{1|unused0|}65|67|}
{2010212001|XXGvertex_oport_oport|96|0|163|0|{2|unused1|}65|68|}
{2010212001|XXGvertex_oport_oport|97|0|165|0|{3|reject0|}65|69|}
{2010212001|XXGvertex_oport_oport|98|0|167|0|{4|reject1|}65|70|}
{2010212001|XXGvertex_oport_oport|99|0|169|0|{5|error0|}65|71|}
{2010212001|XXGvertex_oport_oport|100|0|171|0|{6|error1|}65|72|}
{2010212001|XXGvertex_oport_oport|101|0|173|0|{7|log|}65|73|}
{2010211001|XXGvertex_iport_iport|102|0|175|0|{0|in0|}65|74|}
{2010214001|XXGiport_src_flow|103|0|177|0|{0|}74|32|}
{2010211001|XXGvertex_iport_iport|104|0|178|0|{1|in1|}65|75|}
{2010214001|XXGiport_src_flow|105|0|180|0|{0|}75|33|}
{2010006001|XXGobject_psameas_object|106|0|181|0|{Layout|Layout|0|0|}65|10|}
{2010006001|XXGobject_psameas_object|107|0|182|0|{in0_metadata|out_metadata|0|0|}65|76|}
{2010212001|XXGvertex_oport_oport|108|0|184|0|{0|out|}76|77|}
{2010213001|XXGoport_dst_flow|109|0|186|0|{0|}77|31|}
{2010212001|XXGvertex_oport_oport|110|0|187|0|{1|unused0|}76|78|}
{2010212001|XXGvertex_oport_oport|111|0|189|0|{2|unused1|}76|79|}
{2010212001|XXGvertex_oport_oport|112|0|191|0|{3|reject0|}76|80|}
{2010212001|XXGvertex_oport_oport|113|0|193|0|{4|reject1|}76|81|}
{2010212001|XXGvertex_oport_oport|114|0|195|0|{5|error0|}76|82|}
{2010212001|XXGvertex_oport_oport|115|0|197|0|{6|error1|}76|83|}
{2010212001|XXGvertex_oport_oport|116|0|199|0|{7|log|}76|84|}
{2010211001|XXGvertex_iport_iport|117|0|201|0|{0|in0|}76|85|}
{2010214001|XXGiport_src_flow|118|0|203|0|{0|}85|30|}
{2010211001|XXGvertex_iport_iport|119|0|204|0|{1|in1|}76|86|}
{2010214001|XXGiport_src_flow|120|0|206|0|{0|}86|29|}
{2010006001|XXGobject_psameas_object|121|0|207|0|{Layout|Layout|0|0|}76|10|}
{2010006001|XXGobject_psameas_object|122|0|208|0|{in0_metadata|out0_metadata|0|0|}76|56|}
{2010006001|XXGobject_psameas_object|123|0|209|0|{in1_metadata|out_metadata|0|0|}76|36|}
{2010006001|XXGobject_psameas_object|124|0|210|0|{reject0_metadata|out0_metadata|0|0|}76|56|}
{2010006001|XXGobject_psameas_object|125|0|211|0|{reject1_metadata|out_metadata|0|0|}76|36|}
{2010006001|XXGobject_psameas_object|126|0|212|0|{unused0_metadata|out0_metadata|0|0|}76|56|}
{2010006001|XXGobject_psameas_object|127|0|213|0|{unused1_metadata|out_metadata|0|0|}76|36|}
{2010006001|XXGobject_psameas_object|128|0|214|0|{in1_metadata|out0_metadata|0|0|}65|16|}
{2010006001|XXGobject_psameas_object|129|0|215|0|{reject0_metadata|out_metadata|0|0|}65|76|}
{2010006001|XXGobject_psameas_object|130|0|216|0|{reject1_metadata|out0_metadata|0|0|}65|16|}
{2010006001|XXGobject_psameas_object|131|0|217|0|{unused0_metadata|out_metadata|0|0|}65|76|}
{2010006001|XXGobject_psameas_object|132|0|218|0|{unused1_metadata|out0_metadata|0|0|}65|16|}
{2010601001|XXGgraph_vertex_vertex|133|0|219|0|{Join_With_Attachments|}23|76|}
{2010601001|XXGgraph_vertex_vertex|134|0|220|0|{Make_port_reject_optional|}23|87|}
{2010212001|XXGvertex_oport_oport|135|0|222|0|{0|out|}87|88|}
{2010211001|XXGvertex_iport_iport|136|0|224|0|{0|in|}87|89|}
{2010214001|XXGiport_src_flow|137|0|226|0|{0|}89|28|}
{2010006001|XXGobject_psameas_object|138|0|227|0|{Layout|Layout|0|0|}87|10|}
{2010006001|XXGobject_psameas_object|139|0|228|0|{in_metadata|out_metadata|0|0|}87|65|}
{2010006001|XXGobject_psameas_object|140|0|229|0|{out_metadata|out_metadata|0|0|}87|65|}
{2010601001|XXGgraph_vertex_vertex|141|0|230|0|{Normalize|}23|50|}
{2010601001|XXGgraph_vertex_vertex|142|0|231|0|{Read_Attachments|}23|42|}
{2010601001|XXGgraph_vertex_vertex|143|0|232|0|{Replicate|}23|90|}
{2010212001|XXGvertex_oport_oport|144|0|234|0|{0|out|}90|91|}
{2010213001|XXGoport_dst_flow|145|0|236|0|{0|}91|27|}
{2010213001|XXGoport_dst_flow|146|0|237|0|{1|}91|33|}
{2010211001|XXGvertex_iport_iport|147|0|238|0|{0|in|}90|92|}
{2010214001|XXGiport_src_flow|148|0|240|0|{0|}92|18|}
{2010006001|XXGobject_psameas_object|149|0|241|0|{Layout|Layout|0|0|}90|10|}
{2010006001|XXGobject_psameas_object|150|0|242|0|{in_metadata|out0_metadata|0|0|}90|16|}
{2010006001|XXGobject_psameas_object|151|0|243|0|{out_metadata|out0_metadata|0|0|}90|16|}
{2010601001|XXGgraph_vertex_vertex|152|0|244|0|{Send_Mail|}23|93|}
{2010212001|XXGvertex_oport_oport|153|0|246|0|{0|out|}93|94|}
{2010212001|XXGvertex_oport_oport|154|0|248|0|{1|reject|}93|95|}
{2010213001|XXGoport_dst_flow|155|0|250|0|{0|}95|32|}
{2010212001|XXGvertex_oport_oport|156|0|251|0|{2|error|}93|96|}
{2010212001|XXGvertex_oport_oport|157|0|253|0|{3|log|}93|97|}
{2010211001|XXGvertex_iport_iport|158|0|255|0|{0|in|}93|98|}
{2010214001|XXGiport_src_flow|159|0|257|0|{0|}98|31|}
{2010006001|XXGobject_psameas_object|160|0|258|0|{Layout|Layout|0|0|}93|10|}
{2010006001|XXGobject_psameas_object|161|0|259|0|{in_metadata|out_metadata|0|0|}93|76|}
{2010006001|XXGobject_psameas_object|162|0|260|0|{reject_metadata|out_metadata|0|0|}93|76|}
{2010601001|XXGgraph_vertex_vertex|163|0|261|0|{Split_Record|}23|56|}
{2010212001|XXGvertex_oport_oport|164|0|262|0|{0|error|}23|99|}
{2010216002|XXGoport_binding_oport|165|0|264|0|{.8973880410194397|.5|{12|937000|311000|937000|331000|937000|811000|623000|811000|623000|866000|623000|886000|}24|}99|96|}
{2010212001|XXGvertex_oport_oport|166|0|265|0|{1|log|}23|100|}
{2010216002|XXGoport_binding_oport|167|0|267|0|{.5|.5|{12|978000|311000|978000|331000|978000|598000|1024000|598000|1024000|866000|1024000|886000|}25|}100|97|}
{2010212001|XXGvertex_oport_oport|168|0|268|0|{2|reject|}23|101|}
{2010216002|XXGoport_binding_oport|169|0|270|0|{.5|.5|{12|877000|690000|897000|690000|897000|778000|221000|778000|221000|866000|221000|886000|}26|}101|88|}
{2010212001|XXGvertex_oport_oport|170|0|271|0|{3|out|}23|102|}
{2010216002|XXGoport_binding_oport|171|0|273|0|{.5|.5|{12|1008000|265000|1028000|265000|1116000|265000|1116000|453000|1205000|453000|1225000|453000|}27|}102|94|}
{2010211001|XXGvertex_iport_iport|172|0|274|0|{0|in|}23|103|}
{2010215002|XXGiport_binding_iport|173|0|276|0|{.5|.5|{12|84000|229000|64000|229000|52000|229000|52000|453000|40000|453000|20000|453000|}23|}103|22|}
{2010214001|XXGiport_src_flow|174|0|277|0|{0|}103|7|}
{2010212001|XXGvertex_oport_oport|175|0|278|0|{0|reject|}5|104|}
{2010216002|XXGoport_binding_oport|176|0|280|0|{.1666666716337204|.5|{12|464000|253000|464000|273000|464000|285000|160000|285000|160000|349000|160000|369000|}18|}104|101|}
{2010212001|XXGvertex_oport_oport|177|0|281|0|{1|error|}5|105|}
{2010216002|XXGoport_binding_oport|178|0|283|0|{.5|.5|{12|549000|253000|549000|273000|549000|311000|441000|311000|441000|349000|441000|369000|}19|}105|99|}
{2010212001|XXGvertex_oport_oport|179|0|284|0|{2|log|}5|106|}
{2010216002|XXGoport_binding_oport|180|0|286|0|{.5|.5|{12|633000|253000|633000|273000|633000|311000|721000|311000|721000|349000|721000|369000|}20|}106|100|}
{2010212001|XXGvertex_oport_oport|181|0|287|0|{3|out|}5|107|}
{2010216002|XXGoport_binding_oport|182|0|289|0|{.5|.5|{12|685000|152000|705000|152000|773000|152000|773000|195000|841000|195000|861000|195000|}21|}107|102|}
{2010007001|XXGobject_proto_object|183|0|290|0|{}5|108|}
{2010604001|XXGgraph_flow_flow|184|0|292|0|{Flow_1|}108|109|}
{2010604001|XXGgraph_flow_flow|185|0|294|0|{Flow_2|}108|110|}
{2010601001|XXGgraph_vertex_vertex|186|0|296|0|{Generate_Records|}108|111|}
{2010212001|XXGvertex_oport_oport|187|0|298|0|{0|out|}111|112|}
{2010213001|XXGoport_dst_flow|188|0|300|0|{0|}112|109|}
{2010007001|XXGobject_proto_object|189|0|301|0|{}111|113|}
{2010212001|XXGvertex_oport_oport|190|0|303|0|{0|out|}113|114|}
{2010006001|XXGobject_psameas_object|191|0|305|0|{metadata|out_metadata|1|0|}114|113|}
{2010601001|XXGgraph_vertex_vertex|192|0|306|0|{Prepare_Message|}108|115|}
{2010212001|XXGvertex_oport_oport|193|0|308|0|{0|out0|}115|116|}
{2010213001|XXGoport_dst_flow|194|0|310|0|{0|}116|110|}
{2010212001|XXGvertex_oport_oport|195|0|311|0|{1|reject0|}115|117|}
{2010212001|XXGvertex_oport_oport|196|0|313|0|{2|error0|}115|118|}
{2010212001|XXGvertex_oport_oport|197|0|315|0|{3|log|}115|119|}
{2010211001|XXGvertex_iport_iport|198|0|317|0|{0|in|}115|120|}
{2010214001|XXGiport_src_flow|199|0|319|0|{0|}120|109|}
{2010007001|XXGobject_proto_object|200|0|320|0|{}115|121|}
{2010212001|XXGvertex_oport_oport|201|0|322|0|{0|out0|}121|122|}
{2010006001|XXGobject_psameas_object|202|0|324|0|{metadata|out0_metadata|1|0|}122|121|}
{2010006001|XXGobject_psameas_object|203|0|325|0|{transform0|transform0|1|0|}122|121|}
{2010212001|XXGvertex_oport_oport|204|0|326|0|{1|reject0|}121|123|}
{2010006001|XXGobject_psameas_object|205|0|328|0|{metadata|reject0_metadata|1|0|}123|121|}
{2010212001|XXGvertex_oport_oport|206|0|329|0|{2|error0|}121|124|}
{2010006001|XXGobject_psameas_object|207|0|331|0|{metadata|error0_metadata|1|0|}124|121|}
{2010212001|XXGvertex_oport_oport|208|0|332|0|{3|log|}121|125|}
{2010006001|XXGobject_psameas_object|209|0|334|0|{metadata|log_metadata|1|0|}125|121|}
{2010211001|XXGvertex_iport_iport|210|0|335|0|{0|in|}121|126|}
{2010006001|XXGobject_psameas_object|211|0|337|0|{metadata|in_metadata|1|0|}126|121|}
{2010601001|XXGgraph_vertex_vertex|212|0|338|0|{Send_Multiple_Messages|}108|127|}
{2010605001|XXGgraph_legend_legend|213|0|340|0|{0|}127|128|}
{2010241001|XXGlegend_face_face|214|0|342|0|{}128|129|}
{2010604001|XXGgraph_flow_flow|215|0|344|0|{Flow_1|}127|130|}
{2010604001|XXGgraph_flow_flow|216|0|346|0|{Flow_10|}127|131|}
{2010604001|XXGgraph_flow_flow|217|0|348|0|{Flow_11|}127|132|}
{2010604001|XXGgraph_flow_flow|218|0|350|0|{Flow_2|}127|133|}
{2010604001|XXGgraph_flow_flow|219|0|352|0|{Flow_3|}127|134|}
{2010604001|XXGgraph_flow_flow|220|0|354|0|{Flow_4|}127|135|}
{2010604001|XXGgraph_flow_flow|221|0|356|0|{Flow_5|}127|136|}
{2010604001|XXGgraph_flow_flow|222|0|358|0|{Flow_6|}127|137|}
{2010604001|XXGgraph_flow_flow|223|0|360|0|{Flow_7|}127|138|}
{2010604001|XXGgraph_flow_flow|224|0|362|0|{Flow_8|}127|139|}
{2010604001|XXGgraph_flow_flow|225|0|364|0|{Flow_9|}127|140|}
{2010601001|XXGgraph_vertex_vertex|226|0|366|0|{Add_Key|}127|141|}
{2010212001|XXGvertex_oport_oport|227|0|368|0|{0|out0|}141|142|}
{2010213001|XXGoport_dst_flow|228|0|370|0|{0|}142|133|}
{2010212001|XXGvertex_oport_oport|229|0|371|0|{1|reject0|}141|143|}
{2010212001|XXGvertex_oport_oport|230|0|373|0|{2|error0|}141|144|}
{2010212001|XXGvertex_oport_oport|231|0|375|0|{3|log|}141|145|}
{2010211001|XXGvertex_iport_iport|232|0|377|0|{0|in|}141|146|}
{2010601001|XXGgraph_vertex_vertex|233|0|379|0|{Denormalize|}127|147|}
{2010212001|XXGvertex_oport_oport|234|0|381|0|{0|out|}147|148|}
{2010213001|XXGoport_dst_flow|235|0|383|0|{0|}148|134|}
{2010212001|XXGvertex_oport_oport|236|0|384|0|{1|reject|}147|149|}
{2010212001|XXGvertex_oport_oport|237|0|386|0|{2|error|}147|150|}
{2010212001|XXGvertex_oport_oport|238|0|388|0|{3|log|}147|151|}
{2010211001|XXGvertex_iport_iport|239|0|390|0|{0|in|}147|152|}
{2010214001|XXGiport_src_flow|240|0|392|0|{0|}152|139|}
{2010601001|XXGgraph_vertex_vertex|241|0|393|0|{Join|}127|153|}
{2010212001|XXGvertex_oport_oport|242|0|395|0|{0|out|}153|154|}
{2010213001|XXGoport_dst_flow|243|0|397|0|{0|}154|132|}
{2010212001|XXGvertex_oport_oport|244|0|398|0|{1|unused0|}153|155|}
{2010212001|XXGvertex_oport_oport|245|0|400|0|{2|unused1|}153|156|}
{2010212001|XXGvertex_oport_oport|246|0|402|0|{3|reject0|}153|157|}
{2010212001|XXGvertex_oport_oport|247|0|404|0|{4|reject1|}153|158|}
{2010212001|XXGvertex_oport_oport|248|0|406|0|{5|error0|}153|159|}
{2010212001|XXGvertex_oport_oport|249|0|408|0|{6|error1|}153|160|}
{2010212001|XXGvertex_oport_oport|250|0|410|0|{7|log|}153|161|}
{2010211001|XXGvertex_iport_iport|251|0|412|0|{0|in0|}153|162|}
{2010214001|XXGiport_src_flow|252|0|414|0|{0|}162|137|}
{2010211001|XXGvertex_iport_iport|253|0|415|0|{1|in1|}153|163|}
{2010214001|XXGiport_src_flow|254|0|417|0|{0|}163|138|}
{2010601001|XXGgraph_vertex_vertex|255|0|418|0|{Join_With_Attachments|}127|164|}
{2010212001|XXGvertex_oport_oport|256|0|420|0|{0|out|}164|165|}
{2010213001|XXGoport_dst_flow|257|0|422|0|{0|}165|136|}
{2010212001|XXGvertex_oport_oport|258|0|423|0|{1|unused0|}164|166|}
{2010212001|XXGvertex_oport_oport|259|0|425|0|{2|unused1|}164|167|}
{2010212001|XXGvertex_oport_oport|260|0|427|0|{3|reject0|}164|168|}
{2010212001|XXGvertex_oport_oport|261|0|429|0|{4|reject1|}164|169|}
{2010212001|XXGvertex_oport_oport|262|0|431|0|{5|error0|}164|170|}
{2010212001|XXGvertex_oport_oport|263|0|433|0|{6|error1|}164|171|}
{2010212001|XXGvertex_oport_oport|264|0|435|0|{7|log|}164|172|}
{2010211001|XXGvertex_iport_iport|265|0|437|0|{0|in0|}164|173|}
{2010214001|XXGiport_src_flow|266|0|439|0|{0|}173|135|}
{2010211001|XXGvertex_iport_iport|267|0|440|0|{1|in1|}164|174|}
{2010214001|XXGiport_src_flow|268|0|442|0|{0|}174|134|}
{2010601001|XXGgraph_vertex_vertex|269|0|443|0|{Make_port_reject_optional|}127|175|}
{2010212001|XXGvertex_oport_oport|270|0|445|0|{0|out|}175|176|}
{2010211001|XXGvertex_iport_iport|271|0|447|0|{0|in|}175|177|}
{2010214001|XXGiport_src_flow|272|0|449|0|{0|}177|132|}
{2010601001|XXGgraph_vertex_vertex|273|0|450|0|{Normalize|}127|178|}
{2010212001|XXGvertex_oport_oport|274|0|452|0|{0|out|}178|179|}
{2010213001|XXGoport_dst_flow|275|0|454|0|{0|}179|140|}
{2010212001|XXGvertex_oport_oport|276|0|455|0|{1|reject|}178|180|}
{2010212001|XXGvertex_oport_oport|277|0|457|0|{2|error|}178|181|}
{2010212001|XXGvertex_oport_oport|278|0|459|0|{3|log|}178|182|}
{2010211001|XXGvertex_iport_iport|279|0|461|0|{0|in|}178|183|}
{2010214001|XXGiport_src_flow|280|0|463|0|{0|}183|130|}
{2010601001|XXGgraph_vertex_vertex|281|0|464|0|{Read_Attachments|}127|184|}
{2010212001|XXGvertex_oport_oport|282|0|466|0|{0|out|}184|185|}
{2010213001|XXGoport_dst_flow|283|0|468|0|{0|}185|139|}
{2010212001|XXGvertex_oport_oport|284|0|469|0|{1|filereject|}184|186|}
{2010212001|XXGvertex_oport_oport|285|0|471|0|{2|fileerror|}184|187|}
{2010212001|XXGvertex_oport_oport|286|0|473|0|{3|reject|}184|188|}
{2010212001|XXGvertex_oport_oport|287|0|475|0|{4|error|}184|189|}
{2010212001|XXGvertex_oport_oport|288|0|477|0|{5|log|}184|190|}
{2010211001|XXGvertex_iport_iport|289|0|479|0|{0|in|}184|191|}
{2010214001|XXGiport_src_flow|290|0|481|0|{0|}191|140|}
{2010601001|XXGgraph_vertex_vertex|291|0|482|0|{Replicate|}127|192|}
{2010212001|XXGvertex_oport_oport|292|0|484|0|{0|out|}192|193|}
{2010213001|XXGoport_dst_flow|293|0|486|0|{0|}193|131|}
{2010213001|XXGoport_dst_flow|294|0|487|0|{1|}193|138|}
{2010211001|XXGvertex_iport_iport|295|0|488|0|{0|in|}192|194|}
{2010214001|XXGiport_src_flow|296|0|490|0|{0|}194|133|}
{2010601001|XXGgraph_vertex_vertex|297|0|491|0|{Send_Mail|}127|195|}
{2010212001|XXGvertex_oport_oport|298|0|493|0|{0|out|}195|196|}
{2010212001|XXGvertex_oport_oport|299|0|495|0|{1|reject|}195|197|}
{2010213001|XXGoport_dst_flow|300|0|497|0|{0|}197|137|}
{2010212001|XXGvertex_oport_oport|301|0|498|0|{2|error|}195|198|}
{2010212001|XXGvertex_oport_oport|302|0|500|0|{3|log|}195|199|}
{2010211001|XXGvertex_iport_iport|303|0|502|0|{0|in|}195|200|}
{2010214001|XXGiport_src_flow|304|0|504|0|{0|}200|136|}
{2010601001|XXGgraph_vertex_vertex|305|0|505|0|{Split_Record|}127|201|}
{2010212001|XXGvertex_oport_oport|306|0|507|0|{0|out0|}201|202|}
{2010213001|XXGoport_dst_flow|307|0|509|0|{0|}202|135|}
{2010212001|XXGvertex_oport_oport|308|0|510|0|{1|out1|}201|203|}
{2010213001|XXGoport_dst_flow|309|0|512|0|{0|}203|130|}
{2010212001|XXGvertex_oport_oport|310|0|513|0|{2|reject0|}201|204|}
{2010212001|XXGvertex_oport_oport|311|0|515|0|{3|reject1|}201|205|}
{2010212001|XXGvertex_oport_oport|312|0|517|0|{4|error0|}201|206|}
{2010212001|XXGvertex_oport_oport|313|0|519|0|{5|error1|}201|207|}
{2010212001|XXGvertex_oport_oport|314|0|521|0|{6|log|}201|208|}
{2010211001|XXGvertex_iport_iport|315|0|523|0|{0|in|}201|209|}
{2010214001|XXGiport_src_flow|316|0|525|0|{0|}209|131|}
{2010212001|XXGvertex_oport_oport|317|0|526|0|{0|error|}127|210|}
{2010216002|XXGoport_binding_oport|318|0|528|0|{.8973880410194397|.5|{12|937000|311000|937000|331000|937000|811000|623000|811000|623000|866000|623000|886000|}0|}210|198|}
{2010212001|XXGvertex_oport_oport|319|0|529|0|{1|log|}127|211|}
{2010216002|XXGoport_binding_oport|320|0|531|0|{.5|.5|{12|978000|311000|978000|331000|978000|598000|1024000|598000|1024000|866000|1024000|886000|}0|}211|199|}
{2010212001|XXGvertex_oport_oport|321|0|532|0|{2|reject|}127|212|}
{2010216002|XXGoport_binding_oport|322|0|534|0|{.5|.5|{12|877000|690000|897000|690000|897000|778000|221000|778000|221000|866000|221000|886000|}0|}212|176|}
{2010212001|XXGvertex_oport_oport|323|0|535|0|{3|out|}127|213|}
{2010216002|XXGoport_binding_oport|324|0|537|0|{.5|.5|{12|1008000|265000|1028000|265000|1116000|265000|1116000|453000|1205000|453000|1225000|453000|}0|}213|196|}
{2010211001|XXGvertex_iport_iport|325|0|538|0|{0|in|}127|214|}
{2010215002|XXGiport_binding_iport|326|0|540|0|{.5|.5|{12|84000|229000|64000|229000|52000|229000|52000|453000|40000|453000|20000|453000|}0|}214|146|}
{2010214001|XXGiport_src_flow|327|0|541|0|{0|}214|110|}
{2010007001|XXGobject_proto_object|328|0|542|0|{}127|215|}
{2010605001|XXGgraph_legend_legend|329|0|544|0|{0|}215|216|}
{2010241001|XXGlegend_face_face|330|0|546|0|{}216|217|}
{2010604001|XXGgraph_flow_flow|331|0|548|0|{Flow_1|}215|218|}
{2010604001|XXGgraph_flow_flow|332|0|550|0|{Flow_10|}215|219|}
{2010604001|XXGgraph_flow_flow|333|0|552|0|{Flow_11|}215|220|}
{2010604001|XXGgraph_flow_flow|334|0|554|0|{Flow_2|}215|221|}
{2010604001|XXGgraph_flow_flow|335|0|556|0|{Flow_3|}215|222|}
{2010604001|XXGgraph_flow_flow|336|0|558|0|{Flow_4|}215|223|}
{2010604001|XXGgraph_flow_flow|337|0|560|0|{Flow_5|}215|224|}
{2010604001|XXGgraph_flow_flow|338|0|562|0|{Flow_6|}215|225|}
{2010604001|XXGgraph_flow_flow|339|0|564|0|{Flow_7|}215|226|}
{2010604001|XXGgraph_flow_flow|340|0|566|0|{Flow_8|}215|227|}
{2010604001|XXGgraph_flow_flow|341|0|568|0|{Flow_9|}215|228|}
{2010601001|XXGgraph_vertex_vertex|342|0|570|0|{Add_Key|}215|229|}
{2010212001|XXGvertex_oport_oport|343|0|572|0|{0|out0|}229|230|}
{2010213001|XXGoport_dst_flow|344|0|574|0|{0|}230|221|}
{2010212001|XXGvertex_oport_oport|345|0|575|0|{1|reject0|}229|231|}
{2010212001|XXGvertex_oport_oport|346|0|577|0|{2|error0|}229|232|}
{2010212001|XXGvertex_oport_oport|347|0|579|0|{3|log|}229|233|}
{2010211001|XXGvertex_iport_iport|348|0|581|0|{0|in|}229|234|}
{2010007001|XXGobject_proto_object|349|0|583|0|{}229|235|}
{2010212001|XXGvertex_oport_oport|350|0|585|0|{0|out0|}235|236|}
{2010006001|XXGobject_psameas_object|351|0|587|0|{metadata|out0_metadata|1|0|}236|235|}
{2010006001|XXGobject_psameas_object|352|0|588|0|{transform0|transform0|1|0|}236|235|}
{2010212001|XXGvertex_oport_oport|353|0|589|0|{1|reject0|}235|237|}
{2010006001|XXGobject_psameas_object|354|0|591|0|{metadata|reject0_metadata|1|0|}237|235|}
{2010212001|XXGvertex_oport_oport|355|0|592|0|{2|error0|}235|238|}
{2010006001|XXGobject_psameas_object|356|0|594|0|{metadata|error0_metadata|1|0|}238|235|}
{2010212001|XXGvertex_oport_oport|357|0|595|0|{3|log|}235|239|}
{2010006001|XXGobject_psameas_object|358|0|597|0|{metadata|log_metadata|1|0|}239|235|}
{2010211001|XXGvertex_iport_iport|359|0|598|0|{0|in|}235|240|}
{2010006001|XXGobject_psameas_object|360|0|600|0|{metadata|in_metadata|1|0|}240|235|}
{2010601001|XXGgraph_vertex_vertex|361|0|601|0|{Denormalize|}215|241|}
{2010212001|XXGvertex_oport_oport|362|0|603|0|{0|out|}241|242|}
{2010213001|XXGoport_dst_flow|363|0|605|0|{0|}242|222|}
{2010212001|XXGvertex_oport_oport|364|0|606|0|{1|reject|}241|243|}
{2010212001|XXGvertex_oport_oport|365|0|608|0|{2|error|}241|244|}
{2010212001|XXGvertex_oport_oport|366|0|610|0|{3|log|}241|245|}
{2010211001|XXGvertex_iport_iport|367|0|612|0|{0|in|}241|246|}
{2010214001|XXGiport_src_flow|368|0|614|0|{0|}246|227|}
{2010007001|XXGobject_proto_object|369|0|615|0|{}241|247|}
{2010212001|XXGvertex_oport_oport|370|0|617|0|{0|out|}247|248|}
{2010006001|XXGobject_psameas_object|371|0|619|0|{metadata|out_metadata|1|0|}248|247|}
{2010212001|XXGvertex_oport_oport|372|0|620|0|{1|reject|}247|249|}
{2010006001|XXGobject_psameas_object|373|0|622|0|{metadata|reject_metadata|1|0|}249|247|}
{2010212001|XXGvertex_oport_oport|374|0|623|0|{2|error|}247|250|}
{2010006001|XXGobject_psameas_object|375|0|625|0|{metadata|error_metadata|1|0|}250|247|}
{2010212001|XXGvertex_oport_oport|376|0|626|0|{3|log|}247|251|}
{2010006001|XXGobject_psameas_object|377|0|628|0|{metadata|log_metadata|1|0|}251|247|}
{2010211001|XXGvertex_iport_iport|378|0|629|0|{0|in|}247|252|}
{2010006001|XXGobject_psameas_object|379|0|631|0|{metadata|in_metadata|1|0|}252|247|}
{2010601001|XXGgraph_vertex_vertex|380|0|632|0|{Join|}215|253|}
{2010212001|XXGvertex_oport_oport|381|0|634|0|{0|out|}253|254|}
{2010213001|XXGoport_dst_flow|382|0|636|0|{0|}254|220|}
{2010212001|XXGvertex_oport_oport|383|0|637|0|{1|unused0|}253|255|}
{2010212001|XXGvertex_oport_oport|384|0|639|0|{2|unused1|}253|256|}
{2010212001|XXGvertex_oport_oport|385|0|641|0|{3|reject0|}253|257|}
{2010212001|XXGvertex_oport_oport|386|0|643|0|{4|reject1|}253|258|}
{2010212001|XXGvertex_oport_oport|387|0|645|0|{5|error0|}253|259|}
{2010212001|XXGvertex_oport_oport|388|0|647|0|{6|error1|}253|260|}
{2010212001|XXGvertex_oport_oport|389|0|649|0|{7|log|}253|261|}
{2010211001|XXGvertex_iport_iport|390|0|651|0|{0|in0|}253|262|}
{2010214001|XXGiport_src_flow|391|0|653|0|{0|}262|225|}
{2010211001|XXGvertex_iport_iport|392|0|654|0|{1|in1|}253|263|}
{2010214001|XXGiport_src_flow|393|0|656|0|{0|}263|226|}
{2010007001|XXGobject_proto_object|394|0|657|0|{}253|264|}
{2010212001|XXGvertex_oport_oport|395|0|659|0|{0|out|}264|265|}
{2010006001|XXGobject_psameas_object|396|0|661|0|{metadata|out_metadata|1|0|}265|264|}
{2010212001|XXGvertex_oport_oport|397|0|662|0|{1|unused0|}264|266|}
{2010006001|XXGobject_psameas_object|398|0|664|0|{metadata|unused0_metadata|1|0|}266|264|}
{2010212001|XXGvertex_oport_oport|399|0|665|0|{2|unused1|}264|267|}
{2010006001|XXGobject_psameas_object|400|0|667|0|{metadata|unused1_metadata|1|0|}267|264|}
{2010212001|XXGvertex_oport_oport|401|0|668|0|{3|reject0|}264|268|}
{2010006001|XXGobject_psameas_object|402|0|670|0|{metadata|reject0_metadata|1|0|}268|264|}
{2010212001|XXGvertex_oport_oport|403|0|671|0|{4|reject1|}264|269|}
{2010006001|XXGobject_psameas_object|404|0|673|0|{metadata|reject1_metadata|1|0|}269|264|}
{2010212001|XXGvertex_oport_oport|405|0|674|0|{5|error0|}264|270|}
{2010006001|XXGobject_psameas_object|406|0|676|0|{metadata|error0_metadata|1|0|}270|264|}
{2010212001|XXGvertex_oport_oport|407|0|677|0|{6|error1|}264|271|}
{2010006001|XXGobject_psameas_object|408|0|679|0|{metadata|error1_metadata|1|0|}271|264|}
{2010212001|XXGvertex_oport_oport|409|0|680|0|{7|log|}264|272|}
{2010006001|XXGobject_psameas_object|410|0|682|0|{metadata|log_metadata|1|0|}272|264|}
{2010211001|XXGvertex_iport_iport|411|0|683|0|{0|in0|}264|273|}
{2010006001|XXGobject_psameas_object|412|0|685|0|{dedup0|dedup0|1|0|}273|264|}
{2010006001|XXGobject_psameas_object|413|0|686|0|{dedup_keyword0|dedup_keyword0|1|0|}273|264|}
{2010006001|XXGobject_psameas_object|414|0|687|0|{dedup_positional0|dedup_positional0|1|0|}273|264|}
{2010006001|XXGobject_psameas_object|415|0|688|0|{metadata|in0_metadata|1|0|}273|264|}
{2010006001|XXGobject_psameas_object|416|0|689|0|{override_key0|override_key0|1|0|}273|264|}
{2010006001|XXGobject_psameas_object|417|0|690|0|{record_required0|record_required0|1|0|}273|264|}
{2010006001|XXGobject_psameas_object|418|0|691|0|{record_required_keyword0|record_required_keyword0|1|0|}273|264|}
{2010006001|XXGobject_psameas_object|419|0|692|0|{record_required_positional0|record_required_positional0|1|0|}273|264|}
{2010006001|XXGobject_psameas_object|420|0|693|0|{select0|select0|1|0|}273|264|}
{2010006001|XXGobject_psameas_object|421|0|694|0|{select_keyword0|select_keyword0|1|0|}273|264|}
{2010006001|XXGobject_psameas_object|422|0|695|0|{select_positional0|select_positional0|1|0|}273|264|}
{2010211001|XXGvertex_iport_iport|423|0|696|0|{1|in1|}264|274|}
{2010006001|XXGobject_psameas_object|424|0|698|0|{dedup1|dedup1|1|0|}274|264|}
{2010006001|XXGobject_psameas_object|425|0|699|0|{dedup_keyword1|dedup_keyword1|1|0|}274|264|}
{2010006001|XXGobject_psameas_object|426|0|700|0|{dedup_positional1|dedup_positional1|1|0|}274|264|}
{2010006001|XXGobject_psameas_object|427|0|701|0|{metadata|in1_metadata|1|0|}274|264|}
{2010006001|XXGobject_psameas_object|428|0|702|0|{override_key1|override_key1|1|0|}274|264|}
{2010006001|XXGobject_psameas_object|429|0|703|0|{record_required1|record_required1|1|0|}274|264|}
{2010006001|XXGobject_psameas_object|430|0|704|0|{record_required_keyword1|record_required_keyword1|1|0|}274|264|}
{2010006001|XXGobject_psameas_object|431|0|705|0|{record_required_positional1|record_required_positional1|1|0|}274|264|}
{2010006001|XXGobject_psameas_object|432|0|706|0|{select1|select1|1|0|}274|264|}
{2010006001|XXGobject_psameas_object|433|0|707|0|{select_keyword1|select_keyword1|1|0|}274|264|}
{2010006001|XXGobject_psameas_object|434|0|708|0|{select_positional1|select_positional1|1|0|}274|264|}
{2010601001|XXGgraph_vertex_vertex|435|0|709|0|{Join_With_Attachments|}215|275|}
{2010212001|XXGvertex_oport_oport|436|0|711|0|{0|out|}275|276|}
{2010213001|XXGoport_dst_flow|437|0|713|0|{0|}276|224|}
{2010212001|XXGvertex_oport_oport|438|0|714|0|{1|unused0|}275|277|}
{2010212001|XXGvertex_oport_oport|439|0|716|0|{2|unused1|}275|278|}
{2010212001|XXGvertex_oport_oport|440|0|718|0|{3|reject0|}275|279|}
{2010212001|XXGvertex_oport_oport|441|0|720|0|{4|reject1|}275|280|}
{2010212001|XXGvertex_oport_oport|442|0|722|0|{5|error0|}275|281|}
{2010212001|XXGvertex_oport_oport|443|0|724|0|{6|error1|}275|282|}
{2010212001|XXGvertex_oport_oport|444|0|726|0|{7|log|}275|283|}
{2010211001|XXGvertex_iport_iport|445|0|728|0|{0|in0|}275|284|}
{2010214001|XXGiport_src_flow|446|0|730|0|{0|}284|223|}
{2010211001|XXGvertex_iport_iport|447|0|731|0|{1|in1|}275|285|}
{2010214001|XXGiport_src_flow|448|0|733|0|{0|}285|222|}
{2010007001|XXGobject_proto_object|449|0|734|0|{}275|286|}
{2010212001|XXGvertex_oport_oport|450|0|736|0|{0|out|}286|287|}
{2010006001|XXGobject_psameas_object|451|0|738|0|{metadata|out_metadata|1|0|}287|286|}
{2010212001|XXGvertex_oport_oport|452|0|739|0|{1|unused0|}286|288|}
{2010006001|XXGobject_psameas_object|453|0|741|0|{metadata|unused0_metadata|1|0|}288|286|}
{2010212001|XXGvertex_oport_oport|454|0|742|0|{2|unused1|}286|289|}
{2010006001|XXGobject_psameas_object|455|0|744|0|{metadata|unused1_metadata|1|0|}289|286|}
{2010212001|XXGvertex_oport_oport|456|0|745|0|{3|reject0|}286|290|}
{2010006001|XXGobject_psameas_object|457|0|747|0|{metadata|reject0_metadata|1|0|}290|286|}
{2010212001|XXGvertex_oport_oport|458|0|748|0|{4|reject1|}286|291|}
{2010006001|XXGobject_psameas_object|459|0|750|0|{metadata|reject1_metadata|1|0|}291|286|}
{2010212001|XXGvertex_oport_oport|460|0|751|0|{5|error0|}286|292|}
{2010006001|XXGobject_psameas_object|461|0|753|0|{metadata|error0_metadata|1|0|}292|286|}
{2010212001|XXGvertex_oport_oport|462|0|754|0|{6|error1|}286|293|}
{2010006001|XXGobject_psameas_object|463|0|756|0|{metadata|error1_metadata|1|0|}293|286|}
{2010212001|XXGvertex_oport_oport|464|0|757|0|{7|log|}286|294|}
{2010006001|XXGobject_psameas_object|465|0|759|0|{metadata|log_metadata|1|0|}294|286|}
{2010211001|XXGvertex_iport_iport|466|0|760|0|{0|in0|}286|295|}
{2010006001|XXGobject_psameas_object|467|0|762|0|{dedup0|dedup0|1|0|}295|286|}
{2010006001|XXGobject_psameas_object|468|0|763|0|{dedup_keyword0|dedup_keyword0|1|0|}295|286|}
{2010006001|XXGobject_psameas_object|469|0|764|0|{dedup_positional0|dedup_positional0|1|0|}295|286|}
{2010006001|XXGobject_psameas_object|470|0|765|0|{metadata|in0_metadata|1|0|}295|286|}
{2010006001|XXGobject_psameas_object|471|0|766|0|{override_key0|override_key0|1|0|}295|286|}
{2010006001|XXGobject_psameas_object|472|0|767|0|{record_required0|record_required0|1|0|}295|286|}
{2010006001|XXGobject_psameas_object|473|0|768|0|{record_required_keyword0|record_required_keyword0|1|0|}295|286|}
{2010006001|XXGobject_psameas_object|474|0|769|0|{record_required_positional0|record_required_positional0|1|0|}295|286|}
{2010006001|XXGobject_psameas_object|475|0|770|0|{select0|select0|1|0|}295|286|}
{2010006001|XXGobject_psameas_object|476|0|771|0|{select_keyword0|select_keyword0|1|0|}295|286|}
{2010006001|XXGobject_psameas_object|477|0|772|0|{select_positional0|select_positional0|1|0|}295|286|}
{2010211001|XXGvertex_iport_iport|478|0|773|0|{1|in1|}286|296|}
{2010006001|XXGobject_psameas_object|479|0|775|0|{dedup1|dedup1|1|0|}296|286|}
{2010006001|XXGobject_psameas_object|480|0|776|0|{dedup_keyword1|dedup_keyword1|1|0|}296|286|}
{2010006001|XXGobject_psameas_object|481|0|777|0|{dedup_positional1|dedup_positional1|1|0|}296|286|}
{2010006001|XXGobject_psameas_object|482|0|778|0|{metadata|in1_metadata|1|0|}296|286|}
{2010006001|XXGobject_psameas_object|483|0|779|0|{override_key1|override_key1|1|0|}296|286|}
{2010006001|XXGobject_psameas_object|484|0|780|0|{record_required1|record_required1|1|0|}296|286|}
{2010006001|XXGobject_psameas_object|485|0|781|0|{record_required_keyword1|record_required_keyword1|1|0|}296|286|}
{2010006001|XXGobject_psameas_object|486|0|782|0|{record_required_positional1|record_required_positional1|1|0|}296|286|}
{2010006001|XXGobject_psameas_object|487|0|783|0|{select1|select1|1|0|}296|286|}
{2010006001|XXGobject_psameas_object|488|0|784|0|{select_keyword1|select_keyword1|1|0|}296|286|}
{2010006001|XXGobject_psameas_object|489|0|785|0|{select_positional1|select_positional1|1|0|}296|286|}
{2010601001|XXGgraph_vertex_vertex|490|0|786|0|{Make_port_reject_optional|}215|297|}
{2010212001|XXGvertex_oport_oport|491|0|788|0|{0|out|}297|298|}
{2010211001|XXGvertex_iport_iport|492|0|790|0|{0|in|}297|299|}
{2010214001|XXGiport_src_flow|493|0|792|0|{0|}299|220|}
{2010007001|XXGobject_proto_object|494|0|793|0|{}297|300|}
{2010212001|XXGvertex_oport_oport|495|0|795|0|{0|out|}300|301|}
{2010006001|XXGobject_psameas_object|496|0|797|0|{metadata|out_metadata|1|0|}301|300|}
{2010211001|XXGvertex_iport_iport|497|0|798|0|{0|in|}300|302|}
{2010006001|XXGobject_psameas_object|498|0|800|0|{metadata|in_metadata|1|0|}302|300|}
{2010601001|XXGgraph_vertex_vertex|499|0|801|0|{Normalize|}215|303|}
{2010212001|XXGvertex_oport_oport|500|0|803|0|{0|out|}303|304|}
{2010213001|XXGoport_dst_flow|501|0|805|0|{0|}304|228|}
{2010212001|XXGvertex_oport_oport|502|0|806|0|{1|reject|}303|305|}
{2010212001|XXGvertex_oport_oport|503|0|808|0|{2|error|}303|306|}
{2010212001|XXGvertex_oport_oport|504|0|810|0|{3|log|}303|307|}
{2010211001|XXGvertex_iport_iport|505|0|812|0|{0|in|}303|308|}
{2010214001|XXGiport_src_flow|506|0|814|0|{0|}308|218|}
{2010007001|XXGobject_proto_object|507|0|815|0|{}303|309|}
{2010212001|XXGvertex_oport_oport|508|0|817|0|{0|out|}309|310|}
{2010006001|XXGobject_psameas_object|509|0|819|0|{metadata|out_metadata|1|0|}310|309|}
{2010212001|XXGvertex_oport_oport|510|0|820|0|{1|reject|}309|311|}
{2010006001|XXGobject_psameas_object|511|0|822|0|{metadata|reject_metadata|1|0|}311|309|}
{2010212001|XXGvertex_oport_oport|512|0|823|0|{2|error|}309|312|}
{2010006001|XXGobject_psameas_object|513|0|825|0|{metadata|error_metadata|1|0|}312|309|}
{2010212001|XXGvertex_oport_oport|514|0|826|0|{3|log|}309|313|}
{2010006001|XXGobject_psameas_object|515|0|828|0|{metadata|log_metadata|1|0|}313|309|}
{2010211001|XXGvertex_iport_iport|516|0|829|0|{0|in|}309|314|}
{2010006001|XXGobject_psameas_object|517|0|831|0|{metadata|in_metadata|1|0|}314|309|}
{2010601001|XXGgraph_vertex_vertex|518|0|832|0|{Read_Attachments|}215|315|}
{2010212001|XXGvertex_oport_oport|519|0|834|0|{0|out|}315|316|}
{2010213001|XXGoport_dst_flow|520|0|836|0|{0|}316|227|}
{2010212001|XXGvertex_oport_oport|521|0|837|0|{1|filereject|}315|317|}
{2010212001|XXGvertex_oport_oport|522|0|839|0|{2|fileerror|}315|318|}
{2010212001|XXGvertex_oport_oport|523|0|841|0|{3|reject|}315|319|}
{2010212001|XXGvertex_oport_oport|524|0|843|0|{4|error|}315|320|}
{2010212001|XXGvertex_oport_oport|525|0|845|0|{5|log|}315|321|}
{2010211001|XXGvertex_iport_iport|526|0|847|0|{0|in|}315|322|}
{2010214001|XXGiport_src_flow|527|0|849|0|{0|}322|228|}
{2010007001|XXGobject_proto_object|528|0|850|0|{}315|323|}
{2010212001|XXGvertex_oport_oport|529|0|852|0|{0|out|}323|324|}
{2010006001|XXGobject_psameas_object|530|0|854|0|{metadata|out_metadata|1|0|}324|323|}
{2010212001|XXGvertex_oport_oport|531|0|855|0|{1|filereject|}323|325|}
{2010006001|XXGobject_psameas_object|532|0|857|0|{metadata|filereject_metadata|1|0|}325|323|}
{2010212001|XXGvertex_oport_oport|533|0|858|0|{2|fileerror|}323|326|}
{2010006001|XXGobject_psameas_object|534|0|860|0|{metadata|fileerror_metadata|1|0|}326|323|}
{2010212001|XXGvertex_oport_oport|535|0|861|0|{3|reject|}323|327|}
{2010006001|XXGobject_psameas_object|536|0|863|0|{metadata|reject_metadata|1|0|}327|323|}
{2010212001|XXGvertex_oport_oport|537|0|864|0|{4|error|}323|328|}
{2010006001|XXGobject_psameas_object|538|0|866|0|{metadata|error_metadata|1|0|}328|323|}
{2010212001|XXGvertex_oport_oport|539|0|867|0|{5|log|}323|329|}
{2010006001|XXGobject_psameas_object|540|0|869|0|{metadata|log_metadata|1|0|}329|323|}
{2010211001|XXGvertex_iport_iport|541|0|870|0|{0|in|}323|330|}
{2010006001|XXGobject_psameas_object|542|0|872|0|{metadata|in_metadata|1|0|}330|323|}
{2010601001|XXGgraph_vertex_vertex|543|0|873|0|{Replicate|}215|331|}
{2010212001|XXGvertex_oport_oport|544|0|875|0|{0|out|}331|332|}
{2010213001|XXGoport_dst_flow|545|0|877|0|{0|}332|219|}
{2010213001|XXGoport_dst_flow|546|0|878|0|{1|}332|226|}
{2010211001|XXGvertex_iport_iport|547|0|879|0|{0|in|}331|333|}
{2010214001|XXGiport_src_flow|548|0|881|0|{0|}333|221|}
{2010007001|XXGobject_proto_object|549|0|882|0|{}331|334|}
{2010212001|XXGvertex_oport_oport|550|0|884|0|{0|out|}334|335|}
{2010006001|XXGobject_psameas_object|551|0|886|0|{metadata|out_metadata|1|0|}335|334|}
{2010211001|XXGvertex_iport_iport|552|0|887|0|{0|in|}334|336|}
{2010006001|XXGobject_psameas_object|553|0|889|0|{metadata|in_metadata|1|0|}336|334|}
{2010601001|XXGgraph_vertex_vertex|554|0|890|0|{Send_Mail|}215|337|}
{2010212001|XXGvertex_oport_oport|555|0|892|0|{0|out|}337|338|}
{2010212001|XXGvertex_oport_oport|556|0|894|0|{1|reject|}337|339|}
{2010213001|XXGoport_dst_flow|557|0|896|0|{0|}339|225|}
{2010212001|XXGvertex_oport_oport|558|0|897|0|{2|error|}337|340|}
{2010212001|XXGvertex_oport_oport|559|0|899|0|{3|log|}337|341|}
{2010211001|XXGvertex_iport_iport|560|0|901|0|{0|in|}337|342|}
{2010214001|XXGiport_src_flow|561|0|903|0|{0|}342|224|}
{2010007001|XXGobject_proto_object|562|0|904|0|{}337|343|}
{2010212001|XXGvertex_oport_oport|563|0|906|0|{0|out|}343|344|}
{2010006001|XXGobject_psameas_object|564|0|908|0|{metadata|out_metadata|1|0|}344|343|}
{2010212001|XXGvertex_oport_oport|565|0|909|0|{1|reject|}343|345|}
{2010006001|XXGobject_psameas_object|566|0|911|0|{metadata|reject_metadata|1|0|}345|343|}
{2010212001|XXGvertex_oport_oport|567|0|912|0|{2|error|}343|346|}
{2010006001|XXGobject_psameas_object|568|0|914|0|{metadata|error_metadata|1|0|}346|343|}
{2010212001|XXGvertex_oport_oport|569|0|915|0|{3|log|}343|347|}
{2010006001|XXGobject_psameas_object|570|0|917|0|{metadata|log_metadata|1|0|}347|343|}
{2010211001|XXGvertex_iport_iport|571|0|918|0|{0|in|}343|348|}
{2010006001|XXGobject_psameas_object|572|0|920|0|{metadata|in_metadata|1|0|}348|343|}
{2010006001|XXGobject_psameas_object|573|0|921|0|{continuous|continuous|1|0|}337|215|}
{2010601001|XXGgraph_vertex_vertex|574|0|922|0|{Split_Record|}215|349|}
{2010212001|XXGvertex_oport_oport|575|0|924|0|{0|out0|}349|350|}
{2010213001|XXGoport_dst_flow|576|0|926|0|{0|}350|223|}
{2010212001|XXGvertex_oport_oport|577|0|927|0|{1|out1|}349|351|}
{2010213001|XXGoport_dst_flow|578|0|929|0|{0|}351|218|}
{2010212001|XXGvertex_oport_oport|579|0|930|0|{2|reject0|}349|352|}
{2010212001|XXGvertex_oport_oport|580|0|932|0|{3|reject1|}349|353|}
{2010212001|XXGvertex_oport_oport|581|0|934|0|{4|error0|}349|354|}
{2010212001|XXGvertex_oport_oport|582|0|936|0|{5|error1|}349|355|}
{2010212001|XXGvertex_oport_oport|583|0|938|0|{6|log|}349|356|}
{2010211001|XXGvertex_iport_iport|584|0|940|0|{0|in|}349|357|}
{2010214001|XXGiport_src_flow|585|0|942|0|{0|}357|219|}
{2010007001|XXGobject_proto_object|586|0|943|0|{}349|358|}
{2010212001|XXGvertex_oport_oport|587|0|945|0|{0|out0|}358|359|}
{2010006001|XXGobject_psameas_object|588|0|947|0|{metadata|out0_metadata|1|0|}359|358|}
{2010006001|XXGobject_psameas_object|589|0|948|0|{transform0|transform0|1|0|}359|358|}
{2010212001|XXGvertex_oport_oport|590|0|949|0|{1|out1|}358|360|}
{2010006001|XXGobject_psameas_object|591|0|951|0|{metadata|out1_metadata|1|0|}360|358|}
{2010006001|XXGobject_psameas_object|592|0|952|0|{transform1|transform1|1|0|}360|358|}
{2010212001|XXGvertex_oport_oport|593|0|953|0|{2|reject0|}358|361|}
{2010006001|XXGobject_psameas_object|594|0|955|0|{metadata|reject0_metadata|1|0|}361|358|}
{2010212001|XXGvertex_oport_oport|595|0|956|0|{3|reject1|}358|362|}
{2010006001|XXGobject_psameas_object|596|0|958|0|{metadata|reject1_metadata|1|0|}362|358|}
{2010212001|XXGvertex_oport_oport|597|0|959|0|{4|error0|}358|363|}
{2010006001|XXGobject_psameas_object|598|0|961|0|{metadata|error0_metadata|1|0|}363|358|}
{2010212001|XXGvertex_oport_oport|599|0|962|0|{5|error1|}358|364|}
{2010006001|XXGobject_psameas_object|600|0|964|0|{metadata|error1_metadata|1|0|}364|358|}
{2010212001|XXGvertex_oport_oport|601|0|965|0|{6|log|}358|365|}
{2010006001|XXGobject_psameas_object|602|0|967|0|{metadata|log_metadata|1|0|}365|358|}
{2010211001|XXGvertex_iport_iport|603|0|968|0|{0|in|}358|366|}
{2010006001|XXGobject_psameas_object|604|0|970|0|{metadata|in_metadata|1|0|}366|358|}
{2010212001|XXGvertex_oport_oport|605|0|971|0|{0|error|}215|367|}
{2010216002|XXGoport_binding_oport|606|0|973|0|{.8973880410194397|.5|{12|937000|311000|937000|331000|937000|811000|623000|811000|623000|866000|623000|886000|}0|}367|340|}
{2010212001|XXGvertex_oport_oport|607|0|974|0|{1|log|}215|368|}
{2010216002|XXGoport_binding_oport|608|0|976|0|{.5|.5|{12|978000|311000|978000|331000|978000|598000|1024000|598000|1024000|866000|1024000|886000|}0|}368|341|}
{2010212001|XXGvertex_oport_oport|609|0|977|0|{2|reject|}215|369|}
{2010216002|XXGoport_binding_oport|610|0|979|0|{.5|.5|{12|877000|690000|897000|690000|897000|778000|221000|778000|221000|866000|221000|886000|}0|}369|298|}
{2010212001|XXGvertex_oport_oport|611|0|980|0|{3|out|}215|370|}
{2010216002|XXGoport_binding_oport|612|0|982|0|{.5|.5|{12|1008000|265000|1028000|265000|1116000|265000|1116000|453000|1205000|453000|1225000|453000|}0|}370|338|}
{2010211001|XXGvertex_iport_iport|613|0|983|0|{0|in|}215|371|}
{2010215002|XXGiport_binding_iport|614|0|985|0|{.5|.5|{12|84000|229000|64000|229000|52000|229000|52000|453000|40000|453000|20000|453000|}0|}371|234|}
{2010212001|XXGvertex_oport_oport|615|0|986|0|{0|reject|}108|372|}
{2010216002|XXGoport_binding_oport|616|0|988|0|{.1666666716337204|.5|{12|464000|253000|464000|273000|464000|285000|160000|285000|160000|349000|160000|369000|}0|}372|212|}
{2010212001|XXGvertex_oport_oport|617|0|989|0|{1|error|}108|373|}
{2010216002|XXGoport_binding_oport|618|0|991|0|{.5|.5|{12|549000|253000|549000|273000|549000|311000|441000|311000|441000|349000|441000|369000|}0|}373|210|}
{2010212001|XXGvertex_oport_oport|619|0|992|0|{2|log|}108|374|}
{2010216002|XXGoport_binding_oport|620|0|994|0|{.5|.5|{12|633000|253000|633000|273000|633000|311000|721000|311000|721000|349000|721000|369000|}0|}374|211|}
{2010212001|XXGvertex_oport_oport|621|0|995|0|{3|out|}108|375|}
{2010216002|XXGoport_binding_oport|622|0|997|0|{.5|.5|{12|685000|152000|705000|152000|773000|152000|773000|195000|841000|195000|861000|195000|}0|}375|213|}
{2010109001|XXGobject_property_value|623|0|998|0|{0|TrackingThumbprint|72|}1|376|}
