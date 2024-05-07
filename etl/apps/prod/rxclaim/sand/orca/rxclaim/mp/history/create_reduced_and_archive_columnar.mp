@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|191|rel_count|313|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";|8|1|FKl|Provides functions and types to use in PDL.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|LOAD_FRQUENCY|Daily|15|9|FK|@{2|Daily|Adhoc|}}
{30001002|XXparameter|RUN_ID|$[(datetime("YYYYMMDDHH24MISS")) now()]|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_DATASET|ids_rxclaim.f_claim_transaction.c1|3|9|FK|@{0|}}
{30001002|XXparameter|NATURAL_KEY|\{claim_nbr; claim_seq_nbr; claim_stat_id; src_env_sk\}|3|9|FK|\{field_1; ...; field_n\}: The natural key for the target table, without any effective date fields.|{0|}}
{30001002|XXparameter|DO_TWO_STEP_LOOKUP|$[if(file_information(PUB_DXF_META + "/two_step_lookup_list.dat").found) IDS_DATASET member string_split(string_filter_out(read_file(PUB_DXF_META + "/two_step_lookup_list.dat"),"\\r"),"\\n") else 0 ]|1|9|K|This list provide two step lookup flag|{0|}}
{30001002|XXparameter|IDS_PATH|$PUB_DATAHUB_MFS_LOOKUP|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_SERIAL_PATH|$PUB_DATAHUB_SERIAL_LOOKUP|3|9|EFK|@{0|}}
{30001002|XXparameter|INPUT_DML_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
let string("") v_target_nk_dml= PUB_DATAHUB_DML + "/nk/" + v_sub_area + "/" + IDS_DATASET + ".dml" ;
result:: if(file_information(v_target_nk_dml).found) v_target_nk_dml else  PUB_DATAHUB_DML + "/" + v_sub_area + "/" + IDS_DATASET + ".dml" ;
end ]|3|9|FK|@{0|}}
{30001002|XXparameter|DML_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: if(file_information(PUB_DATAHUB_DML + "/" + v_sub_area + "/" + IDS_DATASET + ".new.dml").found) PUB_DATAHUB_DML + "/" + v_sub_area + "/" + IDS_DATASET + ".new.dml" else INPUT_DML_FL ;
end ]|3|9|REFK|@{0|}}
{30001002|XXparameter|INPUT_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let is_columnar = re_index(IDS_DATASET,"[.]c([0-9]+)$");
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
let int v_len_ids=length_of(string_split(IDS_DATASET,"."));
let string("") v_columnar_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;
let string("") v_reduced_fl_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;
result:: 
        if(is_columnar) IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + "." + v_columnar_nm + ".dat.gz"
        else if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm +"." +  v_reduced_fl_nm + ".dat.gz"
        else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".dat.gz" ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|INPUT_IDX_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
let is_columnar = re_index(IDS_DATASET,"[.]c([0-9]+)$");
let int v_len_ids=length_of(string_split(IDS_DATASET,"."));
let string("") v_columnar_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;
let string("") v_reduced_fl_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;

result::  if(is_columnar) IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + "." + v_columnar_nm + ".idx"
          else if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + "." +  v_reduced_fl_nm + ".idx"
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".idx" ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|INPUT_ARCHIVE_FILE|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
let is_columnar = re_index(IDS_DATASET,"[.]c([0-9]+)$");
let int v_len_ids=length_of(string_split(IDS_DATASET,"."));
let string("") v_columnar_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;
let string("") v_reduced_fl_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;


result::   if(is_columnar) IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + "." + v_columnar_nm + ".archive.dat.gz"
          else if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + "." +  v_reduced_fl_nm + ".archive.dat.gz"
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".archive.dat.gz" ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|INPUT_ARCHIVE_IDX_FILE|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
let is_columnar = re_index(IDS_DATASET,"[.]c([0-9]+)$");
let int v_len_ids=length_of(string_split(IDS_DATASET,"."));
let string("") v_columnar_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;
let string("") v_reduced_fl_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;

result::  if(is_columnar) IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + "." + v_columnar_nm + ".archive.idx"
          else if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + "." +  v_reduced_fl_nm + ".archive.idx"
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".archive.idx" ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|INPUT_BKP_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
let is_columnar = re_index(IDS_DATASET,"[.]c([0-9]+)$");
let int v_len_ids=length_of(string_split(IDS_DATASET,"."));
let string("") v_columnar_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;
let string("") v_reduced_fl_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;

result::  if(is_columnar) IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + "." + v_columnar_nm + ".bkp.dat.gz"
          else if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + "." +  v_reduced_fl_nm + ".bkp.dat.gz"
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".bkp.dat.gz" ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|INPUT_BKP_IDX_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
let is_columnar = re_index(IDS_DATASET,"[.]c([0-9]+)$");
let int v_len_ids=length_of(string_split(IDS_DATASET,"."));
let string("") v_columnar_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;
let string("") v_reduced_fl_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;

result::  if(is_columnar) IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + "." + v_columnar_nm + ".bkp.idx"
          else if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + "." +  v_reduced_fl_nm + ".bkp.idx"
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".bkp.idx" ;
end ]|3|9|EK|@{0|}}
{30001002|XXparameter|INPUT_ARCHIVE_BKP_FILE|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
let is_columnar = re_index(IDS_DATASET,"[.]c([0-9]+)$");
let int v_len_ids=length_of(string_split(IDS_DATASET,"."));
let string("") v_columnar_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;
let string("") v_reduced_fl_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;

  
result::  if(is_columnar) IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + "." + v_columnar_nm + ".archive.bkp.dat.gz"
          else if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + "." +  v_reduced_fl_nm + ".archive.bkp.dat.gz"
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".archive.bkp.dat.gz" ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|INPUT_ARCHIVE_IDX_BKP_FILE|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
let is_columnar = re_index(IDS_DATASET,"[.]c([0-9]+)$");
let int v_len_ids=length_of(string_split(IDS_DATASET,"."));
let string("") v_columnar_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;
let string("") v_reduced_fl_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;

  
result::  if(is_columnar) IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + "." + v_columnar_nm + ".archive.bkp.idx"
          else if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + "." +  v_reduced_fl_nm + ".archive.bkp.idx"
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".archive.bkp.idx" ;
end ]|3|9|EK|@{0|}}
{30001002|XXparameter|ICFF_FILE_NEW|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
let is_columnar = re_index(IDS_DATASET,"[.]c([0-9]+)$");
let int v_len_ids=length_of(string_split(IDS_DATASET,"."));
let string("") v_columnar_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;
let string("") v_reduced_fl_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;

result::  if(is_columnar) IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + "." + v_columnar_nm + ".new.dat.gz"
          else if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + "." +  v_reduced_fl_nm + ".new.dat.gz"   
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".new.dat.gz"   ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|ICFF_INDEX_FILE_NEW|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
let is_columnar = re_index(IDS_DATASET,"[.]c([0-9]+)$");
let int v_len_ids=length_of(string_split(IDS_DATASET,"."));
let string("") v_columnar_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;
let string("") v_reduced_fl_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;

result::  if(is_columnar) IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + "." + v_columnar_nm + ".new.idx"
          else if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + "." +  v_reduced_fl_nm + ".new.idx"   
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".new.idx"   ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|ICFF_FILE_NEW_ARCHIVE|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
let is_columnar = re_index(IDS_DATASET,"[.]c([0-9]+)$");
let int v_len_ids=length_of(string_split(IDS_DATASET,"."));
let string("") v_columnar_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;
let string("") v_reduced_fl_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;

result::  if(is_columnar) IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + "." + v_columnar_nm + ".archive.new.dat.gz"
          else if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + "." +  v_reduced_fl_nm + ".archive.new.dat.gz"   
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".archive.new.dat.gz"   ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|ICFF_INDEX_FILE_NEW_ARCHIVE|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
let is_columnar = re_index(IDS_DATASET,"[.]c([0-9]+)$");
let int v_len_ids=length_of(string_split(IDS_DATASET,"."));
let string("") v_columnar_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;
let string("") v_reduced_fl_nm=if(v_len_ids >=3) string_split(IDS_DATASET,".")[2] else "" ;

result::  if(is_columnar) IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + "." + v_columnar_nm + ".archive.new.idx"
          else if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + "." +  v_reduced_fl_nm + ".archive.new.idx"   
          else  IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.new.idx"   ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|IS_INPUT_ARCHIVE_FILE_EXIST|$[file_information(INPUT_ARCHIVE_FILE).found and LOAD_FRQUENCY !='Daily' ]|3|9|FK|@{0|}}
{30001002|XXparameter|RECREATE_HASH_KEYS|False|13|9|FK|@{0|}}
{30001002|XXparameter|MAPPING_XFR||3|9|FK|@{0|}}
{30001002|XXparameter|FILTER_EXPR|d3bmdt > (date("YYYYMMDD")) '20151231'|3|9|RFK|@{0|}}
{30001002|XXparameter|SELECT_EXPR|$[if(LOAD_FRQUENCY !='Daily')(string(""))FILTER_EXPR else(string(""))(decimal("")) 1]|3|9|FK|@{0|}}
{30001002|XXparameter|ARCHIVE_PURGE_FILTER|1|3|9|FK|@{0|}}
{30001002|XXparameter|ICFF_KEY|dxf_hk_part1|3|9|RFK|@{0|}}
{30001002|XXparameter|DELETE_FILE|$AI_MFS/delete.$IDS_DATASET.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|icff.maintenence|Mukesh.Singh|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1473000|914000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.2.0|{2|1|1|}Job 'create_reduced_and_archive_columnar' Execution Status Report


Job "create_reduced_and_archive_columnar" Execution started at Tuesday, November 02, 2021 12:28:36
***** Job execution failed at Tuesday, November 02, 2021 12:58:13 *****
(Application Output may contain additional information describing the failure)

------------------------------
Job Statistics:

Job status at termination: Failed
Run time (wall clock): 0:29:36
Run performed by user bdigumar
Total data moved through all flows: 1973419409 records (267701300274 bytes)
Total CPU time (all processes): 35721 seconds
Average CPU utilization across all nodes: 98.18 percent
||
|#!/bin/ksh -ex

#1. Take backup of existing files 
if [ $mpjret -eq 0 ]
then
        echo " Renaming INPUT_FILE :$INPUT_FL to Backup file :-$INPUT_BKP_FL "
        m_mv $INPUT_FL $INPUT_BKP_FL
                if [ $? -ne 0 ];then
                    echo " failed to rename INPUT_FILE :$INPUT_FL to Backup file :-$INPUT_BKP_FL "
                    exit 12
                fi 

        m_mv $INPUT_IDX_FL $INPUT_BKP_IDX_FL
     if [ $? -ne 0 ];then
          echo " failed to rename INPUT_IDX_FL :$INPUT_IDX_FL to Backup INPUT_IDX_FL :-$INPUT_BKP_IDX_FL "
          exit 12
       fi
        
#2. Rename New files to backup files 

  m_mv $ICFF_FILE_NEW $INPUT_FL
      if [ $? -ne 0 ];then
            echo " failed to rename ICFF_FILE_NEW :$ICFF_FILE_NEW to Backup INPUT_FL :-$INPUT_FL "
            exit 12
       fi 
  m_mv $ICFF_INDEX_FILE_NEW $INPUT_IDX_FL
     if [ $? -ne 0 ];then
          echo " failed to rename ICFF_INDEX_FILE_NEW :$ICFF_INDEX_FILE_NEW to Backup INPUT_IDX_FL :-$INPUT_IDX_FL "
          exit 12
       fi 

else
        echo "Graph Failed"
fi

|@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@PLM QA||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial Rounded MT Bold|128|140|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Create reduced and archive file
as well as Apply Purge Filter|413794|80155|109000|35000|927000|56000|13789|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|32768|360|1|}}
{2010240003|XXGlegend|7|0|13|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!is_dynamic|true|3|9|P|@{0|}}
}}@$IDS_DATASET  |127000|214000|0|0|0|0|13802|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|9|0|17|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!is_dynamic|true|3|9|P|@{0|}}
}}@ICFF_KEY: $ICFF_KEY  |438000|358000|0|0|0|0|13805|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|11|0|21|0|{@{}@Hash needs to be created , if NK is changing|367000|597000|0|0|0|0|13799|}}
{2010242002|XXGface|12|0|23|0|{@{}@Arial Rounded MT Bold|128|100|0|}}
{2010240003|XXGlegend|13|0|25|0|{@{}@This Graph has an end Script which does following things :

1.Take backup of existing files to bkp files .
2.Renames file created with New suffix as main files|18000|790000|0|0|0|0|13877|}}
{2010242002|XXGface|14|0|27|0|{@{}@Arial Rounded MT Bold|128|140|0|}}
{2010210004|XXGflow|15|0|29|0|{@{}@0|.5|.5|{0|}13944|2065|}}
{2010243001|XXGwatcher|16|0|31|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|17|0|33|0|{@{}@0|.5|.5|{0|}13948|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@0|.5|.5|{0|}13941|17|}}
{2010243001|XXGwatcher|19|0|37|0|{@{}@1|200|-1||2|}}
{2010210004|XXGflow|20|0|39|0|{@{}@0|.5|.5|{0|}13934|20|}}
{2010210004|XXGflow|21|0|41|0|{@{}@0|.5|.5|{0|}13946|17|}}
{2010210004|XXGflow|22|0|43|0|{@{}@0|.5|.5|{0|}13936|17|}}
{2010600005|XXGgraph|23|0|45|0|{Subgraph created from graph "create_reduced_and_archive"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[IS_INPUT_ARCHIVE_FILE_EXIST]|3|9|F||{0|}}
}}@0|@1246250|488750|0|0|0|0|13949|Archive IDS|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1037000|489000|7|}}
{2010210004|XXGflow|24|0|47|0|{@{}@384|.5|.5|{0|}13827|17|}}
{2010210004|XXGflow|25|0|49|0|{@{}@384|.5|.5|{0|}13825|17|}}
{2010210004|XXGflow|26|0|51|0|{@{}@384|.5|.5|{0|}13829|17|}}
{2010600005|XXGgraph|27|0|53|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@107000|191250|0|0|481000|303000|13826|Partition by Key and Sort|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|28|0|55|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|29|0|57|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|30|0|59|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|31|0|62|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|32|0|64|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_FL|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$INPUT_DML_FL|3|2|f$|@{0|}}
}}@0|@320000|415000|0|0|0|0|13945|Input Ids File|Ab Initio Software|@1|200|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|33|0|66|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|34|0|69|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|35|0|71|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|36|0|75|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|37|0|77|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|38|0|79|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|39|0|84|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|40|0|88|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|41|0|91|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|42|0|93|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|43|0|95|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|44|0|97|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|45|0|100|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|46|0|102|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|47|0|104|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|48|0|107|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|49|0|112|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|50|0|114|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|51|0|116|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|52|0|119|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|53|0|121|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|54|0|124|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|55|0|130|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|56|0|133|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010503005|XXGfvertex|57|0|137|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_ARCHIVE_FILE|3|2|$|@{0|}}
}}@1|@894500|104000|0|0|0|0|13828|REDUCED ICFF-ARCHIVE|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|58|0|139|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|59|0|142|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|60|0|144|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|61|0|148|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_ARCHIVE_IDX_FILE|3|2|$|@{0|}}
}}@1|@900500|304000|0|0|0|0|13830|REDUCED Index ARCHIVE|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|62|0|150|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|63|0|153|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|64|0|155|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|65|0|158|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|9||@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@395500|184000|0|0|0|0|13824|WBCL: To reduced IDS-1|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|66|0|160|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|67|0|163|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|68|0|166|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|69|0|168|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|70|0|171|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False|3|15|P?|@{0|}}
{30001002|XXparameter|key_index||19|2|FK$|Field used for index key|{0|}}
{30001002|XXparameter|key_index.condition|param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|key_index key|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|block_size|32768|1|2|FK$|Block size for data compression|{0|}}
{30001002|XXparameter|bitmap_size|0|1|2|FK$|Size of the screening bitmap. Set miss_rate instead for automatic sizing.|{0|}}
{30001002|XXparameter|miss_rate|0|1|2|FK$|Specify a value from - 0: No bitmap, 1: Very Low(1 in 10000), 2: Low(1 in 1000), 3: Medium(1 in 100), 4: High(1 in 10). Bitmap is sized automatically to achieve this miss rate.|{0|}}
{30001002|XXparameter|miss_rate.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|RFKl|Package containing the create_output_address transform function.|{0|}}
{30001002|XXparameter|package.condition|version 2.15.5.r34: param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|flags|+block_compressed|3|2|K$||{0|}}
{30001002|XXparameter|compression_level||1|2|FK$|Compression (0 = none, 1 = least, 9 = most, unset = AB_DEFAULT_COMPRESSION_LEVEL)|{0|}}
{30001002|XXparameter|compression_level.condition|version 3.1.2.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if block compressed lookup to be written is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=in,w|3|2|H$||{0|}}
{30001002|XXparameter|num_operations|1|1|2|H$|Number of steps in package|{0|}}
{30001002|XXparameter|operation1|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$|Create address port output record from input record and its direct address|{0|}}
{30001002|XXparameter|operation1_analysis|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|71|0|173|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|72|0|176|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|73|0|179|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|74|0|182|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|75|0|188|0|{@{}@0|0|0|0|in0|.49897750511247446|@@@13840|0|}}
{2010501005|XXGpvertex|76|0|192|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|$NATURAL_KEY|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|1030000|370000|0|0|0|0|13937|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|77|0|194|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|78|0|197|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|79|0|199|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|80|0|201|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|81|0|203|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|82|0|205|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|83|0|208|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|dup_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,dup,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|84|0|210|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|85|0|213|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|86|0|216|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|87|0|219|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|88|0|222|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|89|0|225|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010503005|XXGfvertex|90|0|228|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_FILE_NEW|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
}}@1|@759500|85000|0|0|0|0|13790|REDUCED ICFF New|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|91|0|230|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|92|0|232|0|{@{}@384|.5|.5|{0|}13816|17|}}
{2010503005|XXGfvertex|93|0|234|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|94|0|236|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|95|0|243|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|$SELECT_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|520000|385000|0|0|0|0|13943|Filter- Main and Archive|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|96|0|245|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|97|0|248|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|98|0|251|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|99|0|253|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|100|0|255|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|101|0|257|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|102|0|260|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|deselect_metadata||7|1|RFsl||{0|}}
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
{2010203004|XXGoport|103|0|262|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|104|0|265|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|105|0|268|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|106|0|271|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|107|0|274|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|108|0|277|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|109|0|286|0|{Subgraph created from graph "create_reduced_and_archive"|{}@0|@1244250|345250|0|0|0|0|13947|Main IDS|Mukesh.Singh|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|884000|443000|7|}}
{2010210004|XXGflow|110|0|288|0|{@{}@384|.5|.5|{0|}13819|17|}}
{2010210004|XXGflow|111|0|290|0|{@{}@384|.5|.5|{0|}13817|17|}}
{2010600005|XXGgraph|112|0|293|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@267000|117250|0|0|481000|303000|13820|Partition by Key and Sort-1|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||36865|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|113|0|295|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|114|0|297|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|115|0|299|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|116|0|302|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|117|0|306|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|118|0|308|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|119|0|310|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|120|0|315|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|121|0|319|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|122|0|322|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|123|0|324|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|124|0|326|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|125|0|328|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|126|0|331|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|127|0|333|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|128|0|335|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|129|0|338|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|130|0|343|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|131|0|345|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|132|0|347|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|133|0|350|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|134|0|352|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|135|0|355|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|136|0|361|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|137|0|364|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010503005|XXGfvertex|138|0|370|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_INDEX_FILE_NEW|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1)|7|1|RFl||{0|}}
}}@1|@765500|270000|0|0|0|0|13713|REDUCED Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|139|0|372|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|140|0|375|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|141|0|377|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|142|0|380|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|9||@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@495500|110000|0|0|0|0|13818|WBCL: To reduced IDS|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|143|0|382|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|144|0|385|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|145|0|388|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|146|0|390|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|147|0|393|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False|3|15|P?|@{0|}}
{30001002|XXparameter|key_index||19|2|FK$|Field used for index key|{0|}}
{30001002|XXparameter|key_index.condition|param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|key_index key|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|block_size|32768|1|2|FK$|Block size for data compression|{0|}}
{30001002|XXparameter|bitmap_size|0|1|2|FK$|Size of the screening bitmap. Set miss_rate instead for automatic sizing.|{0|}}
{30001002|XXparameter|miss_rate|0|1|2|FK$|Specify a value from - 0: No bitmap, 1: Very Low(1 in 10000), 2: Low(1 in 1000), 3: Medium(1 in 100), 4: High(1 in 10). Bitmap is sized automatically to achieve this miss rate.|{0|}}
{30001002|XXparameter|miss_rate.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|RFKl|Package containing the create_output_address transform function.|{0|}}
{30001002|XXparameter|package.condition|version 2.15.5.r34: param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|flags|+block_compressed|3|2|K$||{0|}}
{30001002|XXparameter|compression_level||1|2|FK$|Compression (0 = none, 1 = least, 9 = most, unset = AB_DEFAULT_COMPRESSION_LEVEL)|{0|}}
{30001002|XXparameter|compression_level.condition|version 3.1.2.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if block compressed lookup to be written is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=in,w|3|2|H$||{0|}}
{30001002|XXparameter|num_operations|1|1|2|H$|Number of steps in package|{0|}}
{30001002|XXparameter|operation1|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$|Create address port output record from input record and its direct address|{0|}}
{30001002|XXparameter|operation1_analysis|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|148|0|395|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|149|0|398|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|150|0|401|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|151|0|404|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|152|0|410|0|{@{}@0|0|0|0|in0|.49435665914221216|@@@13840|0|}}
{2010501005|XXGpvertex|153|0|414|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|$NATURAL_KEY|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Partition by Key|773000|400000|0|0|0|0|13935|Partition by Key|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|154|0|416|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|155|0|419|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|156|0|422|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to partition on|{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Partition by Key|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|157|0|424|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|158|0|427|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|159|0|433|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|$NATURAL_KEY|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|886000|380000|0|0|0|0|13933|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|160|0|435|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|161|0|438|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|162|0|441|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|163|0|443|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|164|0|446|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|165|0|452|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@15000|75000|0|0|0|0|13718|Version Log|Mukesh.singh|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|821000|470000|3|}}
{2010240003|XXGlegend|166|0|454|0|{@{}@Date|92000|66000|0|0|0|0|7|}}
{2010242002|XXGface|167|0|456|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|168|0|458|0|{@{}@Author|217000|66000|0|0|0|0|99|}}
{2010242002|XXGface|169|0|460|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|170|0|462|0|{@{}@Description|417000|66000|0|0|0|0|28|}}
{2010242002|XXGface|171|0|464|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|172|0|466|0|{@{}@Version|17000|66000|0|0|0|0|4|}}
{2010242002|XXGface|173|0|468|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|174|0|470|0|{@{}@1.0|17000|88000|0|0|0|0|105|}}
{2010242002|XXGface|175|0|472|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|176|0|474|0|{@{}@Jan 11 2017|82000|88000|0|0|0|0|107|}}
{2010242002|XXGface|177|0|476|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|178|0|478|0|{@{}@Mukesh.Singh (Exusia)|187000|88000|0|0|0|0|109|}}
{2010242002|XXGface|179|0|480|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|180|0|482|0|{@{}@Initial version - This version only support Data and Index consolidation in 
IDS dimensions
|412000|83000|0|0|0|0|112|}}
{2010242002|XXGface|181|0|484|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|182|0|486|0|{@{}@1.0|17000|123000|0|0|0|0|106|}}
{2010242002|XXGface|183|0|488|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|184|0|490|0|{@{}@July 11 2017|77000|123000|0|0|0|0|114|}}
{2010242002|XXGface|185|0|492|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|186|0|494|0|{@{}@Mukesh.Singh (Exusia)|187000|123000|0|0|0|0|110|}}
{2010242002|XXGface|187|0|496|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|188|0|498|0|{@{}@Xref Consolidation functionality is added|412000|123000|0|0|0|0|113|}}
{2010242002|XXGface|189|0|500|0|{@{}@Arial Narrow|0|100|0|}}
{2010110002|XXGconstant|190|0|502|0|{@{}@{1|7609021|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010605001|XXGgraph_legend_legend|6|0|12|0|{1|}1|7|}
{2010241001|XXGlegend_face_face|7|0|14|0|{}7|8|}
{2010605001|XXGgraph_legend_legend|8|0|16|0|{2|}1|9|}
{2010241001|XXGlegend_face_face|9|0|18|0|{}9|10|}
{2010605001|XXGgraph_legend_legend|10|0|20|0|{3|}1|11|}
{2010241001|XXGlegend_face_face|11|0|22|0|{}11|12|}
{2010605001|XXGgraph_legend_legend|12|0|24|0|{4|}1|13|}
{2010241001|XXGlegend_face_face|13|0|26|0|{}13|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_1|}1|15|}
{2010244001|XXGflow_watcher_watcher|15|0|30|0|{}15|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_3|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_4|}1|18|}
{2010244001|XXGflow_watcher_watcher|18|0|36|0|{}18|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_5|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_6|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_7|}1|22|}
{2010601001|XXGgraph_vertex_vertex|22|0|44|0|{Archive_IDS|}1|23|}
{2010604001|XXGgraph_flow_flow|23|0|46|0|{Flow_10|}23|24|}
{2010604001|XXGgraph_flow_flow|24|0|48|0|{Flow_5|}23|25|}
{2010604001|XXGgraph_flow_flow|25|0|50|0|{Flow_7|}23|26|}
{2010601001|XXGgraph_vertex_vertex|26|0|52|0|{Partition_by_Key_and_Sort|}23|27|}
{2010604001|XXGgraph_flow_flow|27|0|54|0|{Flow_1|}27|28|}
{2010601001|XXGgraph_vertex_vertex|28|0|56|0|{Partition_by_Key|}27|29|}
{2010212001|XXGvertex_oport_oport|29|0|58|0|{0|out|}29|30|}
{2010213001|XXGoport_dst_flow|30|0|60|0|{0|}30|28|}
{2010211001|XXGvertex_iport_iport|31|0|61|0|{0|in|}29|31|}
{2010006001|XXGobject_psameas_object|32|0|63|0|{in_metadata|read_metadata|0|0|}29|32|}
{2010212001|XXGvertex_oport_oport|33|0|65|0|{0|read|}32|33|}
{2010213001|XXGoport_dst_flow|34|0|67|0|{0|}33|15|}
{2010007001|XXGobject_proto_object|35|0|68|0|{}32|34|}
{2010212001|XXGvertex_oport_oport|36|0|70|0|{0|read|}34|35|}
{2010006001|XXGobject_psameas_object|37|0|72|0|{metadata|read_metadata|1|0|}35|34|}
{2010006001|XXGobject_psameas_object|38|0|73|0|{out_metadata|read_metadata|0|0|}29|32|}
{2010601001|XXGgraph_vertex_vertex|39|0|74|0|{Sort|}27|36|}
{2010212001|XXGvertex_oport_oport|40|0|76|0|{0|out|}36|37|}
{2010211001|XXGvertex_iport_iport|41|0|78|0|{0|in|}36|38|}
{2010214001|XXGiport_src_flow|42|0|80|0|{0|}38|28|}
{2010006001|XXGobject_psameas_object|43|0|81|0|{in_metadata|read_metadata|0|0|}36|32|}
{2010006001|XXGobject_psameas_object|44|0|82|0|{out_metadata|read_metadata|0|0|}36|32|}
{2010212001|XXGvertex_oport_oport|45|0|83|0|{0|out0|}27|39|}
{2010216002|XXGoport_binding_oport|46|0|85|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}39|37|}
{2010213001|XXGoport_dst_flow|47|0|86|0|{0|}39|25|}
{2010211001|XXGvertex_iport_iport|48|0|87|0|{0|in0|}27|40|}
{2010215002|XXGiport_binding_iport|49|0|89|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}40|31|}
{2010007001|XXGobject_proto_object|50|0|90|0|{}27|41|}
{2010604001|XXGgraph_flow_flow|51|0|92|0|{Flow_1|}41|42|}
{2010601001|XXGgraph_vertex_vertex|52|0|94|0|{Partition_by_Key|}41|43|}
{2010212001|XXGvertex_oport_oport|53|0|96|0|{0|out|}43|44|}
{2010213001|XXGoport_dst_flow|54|0|98|0|{0|}44|42|}
{2010211001|XXGvertex_iport_iport|55|0|99|0|{0|in|}43|45|}
{2010007001|XXGobject_proto_object|56|0|101|0|{}43|46|}
{2010212001|XXGvertex_oport_oport|57|0|103|0|{0|out|}46|47|}
{2010006001|XXGobject_psameas_object|58|0|105|0|{metadata|out_metadata|1|0|}47|46|}
{2010211001|XXGvertex_iport_iport|59|0|106|0|{0|in|}46|48|}
{2010006001|XXGobject_psameas_object|60|0|108|0|{metadata|in_metadata|1|0|}48|46|}
{2010006001|XXGobject_psameas_object|61|0|109|0|{Layout|InputLayout|1|0|}43|41|}
{2010006001|XXGobject_psameas_object|62|0|110|0|{key|Key|1|0|}43|41|}
{2010601001|XXGgraph_vertex_vertex|63|0|111|0|{Sort|}41|49|}
{2010212001|XXGvertex_oport_oport|64|0|113|0|{0|out|}49|50|}
{2010211001|XXGvertex_iport_iport|65|0|115|0|{0|in|}49|51|}
{2010214001|XXGiport_src_flow|66|0|117|0|{0|}51|42|}
{2010007001|XXGobject_proto_object|67|0|118|0|{}49|52|}
{2010212001|XXGvertex_oport_oport|68|0|120|0|{0|out|}52|53|}
{2010006001|XXGobject_psameas_object|69|0|122|0|{metadata|out_metadata|1|0|}53|52|}
{2010211001|XXGvertex_iport_iport|70|0|123|0|{0|in|}52|54|}
{2010006001|XXGobject_psameas_object|71|0|125|0|{metadata|in_metadata|1|0|}54|52|}
{2010006001|XXGobject_psameas_object|72|0|126|0|{Layout|OutputLayout|1|0|}49|41|}
{2010006001|XXGobject_psameas_object|73|0|127|0|{key|Key|1|0|}49|41|}
{2010006001|XXGobject_psameas_object|74|0|128|0|{max_core|Max_core|1|0|}49|41|}
{2010212001|XXGvertex_oport_oport|75|0|129|0|{0|out0|}41|55|}
{2010216002|XXGoport_binding_oport|76|0|131|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}55|50|}
{2010211001|XXGvertex_iport_iport|77|0|132|0|{0|in0|}41|56|}
{2010215002|XXGiport_binding_iport|78|0|134|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}56|45|}
{2010006001|XXGobject_psameas_object|79|0|135|0|{InputLayout|Layout|0|0|}27|32|}
{2010006001|XXGobject_psameas_object|80|0|136|0|{OutputLayout|Layout|0|0|}27|57|}
{2010211001|XXGvertex_iport_iport|81|0|138|0|{0|write|}57|58|}
{2010214001|XXGiport_src_flow|82|0|140|0|{0|}58|24|}
{2010007001|XXGobject_proto_object|83|0|141|0|{}57|59|}
{2010211001|XXGvertex_iport_iport|84|0|143|0|{0|write|}59|60|}
{2010006001|XXGobject_psameas_object|85|0|145|0|{metadata|write_metadata|1|0|}60|59|}
{2010601001|XXGgraph_vertex_vertex|86|0|146|0|{REDUCED_ICFF_ARCHIVE|}23|57|}
{2010601001|XXGgraph_vertex_vertex|87|0|147|0|{REDUCED_Index_ARCHIVE|}23|61|}
{2010211001|XXGvertex_iport_iport|88|0|149|0|{0|write|}61|62|}
{2010214001|XXGiport_src_flow|89|0|151|0|{0|}62|26|}
{2010007001|XXGobject_proto_object|90|0|152|0|{}61|63|}
{2010211001|XXGvertex_iport_iport|91|0|154|0|{0|write|}63|64|}
{2010006001|XXGobject_psameas_object|92|0|156|0|{metadata|write_metadata|1|0|}64|63|}
{2010601001|XXGgraph_vertex_vertex|93|0|157|0|{WBCL_To_reduced_IDS_1|}23|65|}
{2010212001|XXGvertex_oport_oport|94|0|159|0|{0|out|}65|66|}
{2010213001|XXGoport_dst_flow|95|0|161|0|{0|}66|24|}
{2010212001|XXGvertex_oport_oport|96|0|162|0|{1|index|}65|67|}
{2010213001|XXGoport_dst_flow|97|0|164|0|{0|}67|26|}
{2010212001|XXGvertex_oport_oport|98|0|165|0|{2|address|}65|68|}
{2010211001|XXGvertex_iport_iport|99|0|167|0|{0|in|}65|69|}
{2010214001|XXGiport_src_flow|100|0|169|0|{0|}69|25|}
{2010007001|XXGobject_proto_object|101|0|170|0|{}65|70|}
{2010212001|XXGvertex_oport_oport|102|0|172|0|{0|out|}70|71|}
{2010006001|XXGobject_psameas_object|103|0|174|0|{metadata|out_metadata|1|0|}71|70|}
{2010212001|XXGvertex_oport_oport|104|0|175|0|{1|index|}70|72|}
{2010006001|XXGobject_psameas_object|105|0|177|0|{metadata|index_metadata|1|0|}72|70|}
{2010212001|XXGvertex_oport_oport|106|0|178|0|{2|address|}70|73|}
{2010006001|XXGobject_psameas_object|107|0|180|0|{metadata|address_metadata|1|0|}73|70|}
{2010211001|XXGvertex_iport_iport|108|0|181|0|{0|in|}70|74|}
{2010006001|XXGobject_psameas_object|109|0|183|0|{metadata|in_metadata|1|0|}74|70|}
{2010006001|XXGobject_psameas_object|110|0|184|0|{Layout|Layout|0|0|}65|57|}
{2010006001|XXGobject_psameas_object|111|0|185|0|{in_metadata|read_metadata|0|0|}65|32|}
{2010006001|XXGobject_psameas_object|112|0|186|0|{out_metadata|write_metadata|0|0|}65|57|}
{2010211001|XXGvertex_iport_iport|113|0|187|0|{0|in0|}23|75|}
{2010215002|XXGiport_binding_iport|114|0|189|0|{.5|.5|{0|}13810|}75|40|}
{2010214001|XXGiport_src_flow|115|0|190|0|{0|}75|17|}
{2010601001|XXGgraph_vertex_vertex|116|0|191|0|{Dedup_Sorted|}1|76|}
{2010212001|XXGvertex_oport_oport|117|0|193|0|{0|out|}76|77|}
{2010213001|XXGoport_dst_flow|118|0|195|0|{0|}77|21|}
{2010212001|XXGvertex_oport_oport|119|0|196|0|{1|dup|}76|78|}
{2010212001|XXGvertex_oport_oport|120|0|198|0|{2|reject|}76|79|}
{2010212001|XXGvertex_oport_oport|121|0|200|0|{3|error|}76|80|}
{2010212001|XXGvertex_oport_oport|122|0|202|0|{4|log|}76|81|}
{2010211001|XXGvertex_iport_iport|123|0|204|0|{0|in|}76|82|}
{2010214001|XXGiport_src_flow|124|0|206|0|{0|}82|22|}
{2010007001|XXGobject_proto_object|125|0|207|0|{}76|83|}
{2010212001|XXGvertex_oport_oport|126|0|209|0|{0|out|}83|84|}
{2010006001|XXGobject_psameas_object|127|0|211|0|{metadata|out_metadata|1|0|}84|83|}
{2010212001|XXGvertex_oport_oport|128|0|212|0|{1|dup|}83|85|}
{2010006001|XXGobject_psameas_object|129|0|214|0|{metadata|dup_metadata|1|0|}85|83|}
{2010212001|XXGvertex_oport_oport|130|0|215|0|{2|reject|}83|86|}
{2010006001|XXGobject_psameas_object|131|0|217|0|{metadata|reject_metadata|1|0|}86|83|}
{2010212001|XXGvertex_oport_oport|132|0|218|0|{3|error|}83|87|}
{2010006001|XXGobject_psameas_object|133|0|220|0|{metadata|error_metadata|1|0|}87|83|}
{2010212001|XXGvertex_oport_oport|134|0|221|0|{4|log|}83|88|}
{2010006001|XXGobject_psameas_object|135|0|223|0|{metadata|log_metadata|1|0|}88|83|}
{2010211001|XXGvertex_iport_iport|136|0|224|0|{0|in|}83|89|}
{2010006001|XXGobject_psameas_object|137|0|226|0|{metadata|in_metadata|1|0|}89|83|}
{2010006001|XXGobject_psameas_object|138|0|227|0|{Layout|Layout|0|0|}76|90|}
{2010211001|XXGvertex_iport_iport|139|0|229|0|{0|write|}90|91|}
{2010214001|XXGiport_src_flow|140|0|231|0|{0|}91|92|}
{2010007001|XXGobject_proto_object|141|0|233|0|{}90|93|}
{2010211001|XXGvertex_iport_iport|142|0|235|0|{0|write|}93|94|}
{2010006001|XXGobject_psameas_object|143|0|237|0|{metadata|write_metadata|1|0|}94|93|}
{2010006001|XXGobject_psameas_object|144|0|238|0|{dup_metadata|read_metadata|0|0|}76|32|}
{2010006001|XXGobject_psameas_object|145|0|239|0|{in_metadata|read_metadata|0|0|}76|32|}
{2010006001|XXGobject_psameas_object|146|0|240|0|{out_metadata|read_metadata|0|0|}76|32|}
{2010006001|XXGobject_psameas_object|147|0|241|0|{reject_metadata|read_metadata|0|0|}76|32|}
{2010601001|XXGgraph_vertex_vertex|148|0|242|0|{Filter_Main_and_Archive|}1|95|}
{2010212001|XXGvertex_oport_oport|149|0|244|0|{0|out|}95|96|}
{2010213001|XXGoport_dst_flow|150|0|246|0|{0|}96|18|}
{2010212001|XXGvertex_oport_oport|151|0|247|0|{1|deselect|}95|97|}
{2010213001|XXGoport_dst_flow|152|0|249|0|{0|}97|17|}
{2010212001|XXGvertex_oport_oport|153|0|250|0|{2|reject|}95|98|}
{2010212001|XXGvertex_oport_oport|154|0|252|0|{3|error|}95|99|}
{2010212001|XXGvertex_oport_oport|155|0|254|0|{4|log|}95|100|}
{2010211001|XXGvertex_iport_iport|156|0|256|0|{0|in|}95|101|}
{2010214001|XXGiport_src_flow|157|0|258|0|{0|}101|15|}
{2010007001|XXGobject_proto_object|158|0|259|0|{}95|102|}
{2010212001|XXGvertex_oport_oport|159|0|261|0|{0|out|}102|103|}
{2010006001|XXGobject_psameas_object|160|0|263|0|{metadata|out_metadata|1|0|}103|102|}
{2010212001|XXGvertex_oport_oport|161|0|264|0|{1|deselect|}102|104|}
{2010006001|XXGobject_psameas_object|162|0|266|0|{metadata|deselect_metadata|1|0|}104|102|}
{2010212001|XXGvertex_oport_oport|163|0|267|0|{2|reject|}102|105|}
{2010006001|XXGobject_psameas_object|164|0|269|0|{metadata|reject_metadata|1|0|}105|102|}
{2010212001|XXGvertex_oport_oport|165|0|270|0|{3|error|}102|106|}
{2010006001|XXGobject_psameas_object|166|0|272|0|{metadata|error_metadata|1|0|}106|102|}
{2010212001|XXGvertex_oport_oport|167|0|273|0|{4|log|}102|107|}
{2010006001|XXGobject_psameas_object|168|0|275|0|{metadata|log_metadata|1|0|}107|102|}
{2010211001|XXGvertex_iport_iport|169|0|276|0|{0|in|}102|108|}
{2010006001|XXGobject_psameas_object|170|0|278|0|{metadata|in_metadata|1|0|}108|102|}
{2010006001|XXGobject_psameas_object|171|0|279|0|{Layout|Layout|0|0|}95|32|}
{2010006001|XXGobject_psameas_object|172|0|280|0|{deselect_metadata|read_metadata|0|0|}95|32|}
{2010006001|XXGobject_psameas_object|173|0|281|0|{in_metadata|read_metadata|0|0|}95|32|}
{2010006001|XXGobject_psameas_object|174|0|282|0|{out_metadata|read_metadata|0|0|}95|32|}
{2010006001|XXGobject_psameas_object|175|0|283|0|{reject_metadata|read_metadata|0|0|}95|32|}
{2010601001|XXGgraph_vertex_vertex|176|0|284|0|{Input_Ids_File|}1|32|}
{2010601001|XXGgraph_vertex_vertex|177|0|285|0|{Main_IDS|}1|109|}
{2010604001|XXGgraph_flow_flow|178|0|287|0|{Flow_3|}109|110|}
{2010604001|XXGgraph_flow_flow|179|0|289|0|{Flow_4|}109|111|}
{2010604001|XXGgraph_flow_flow|180|0|291|0|{Flow_8|}109|92|}
{2010601001|XXGgraph_vertex_vertex|181|0|292|0|{Partition_by_Key_and_Sort_1|}109|112|}
{2010604001|XXGgraph_flow_flow|182|0|294|0|{Flow_1|}112|113|}
{2010601001|XXGgraph_vertex_vertex|183|0|296|0|{Partition_by_Key|}112|114|}
{2010212001|XXGvertex_oport_oport|184|0|298|0|{0|out|}114|115|}
{2010213001|XXGoport_dst_flow|185|0|300|0|{0|}115|113|}
{2010211001|XXGvertex_iport_iport|186|0|301|0|{0|in|}114|116|}
{2010006001|XXGobject_psameas_object|187|0|303|0|{in_metadata|read_metadata|0|0|}114|32|}
{2010006001|XXGobject_psameas_object|188|0|304|0|{out_metadata|read_metadata|0|0|}114|32|}
{2010601001|XXGgraph_vertex_vertex|189|0|305|0|{Sort|}112|117|}
{2010212001|XXGvertex_oport_oport|190|0|307|0|{0|out|}117|118|}
{2010211001|XXGvertex_iport_iport|191|0|309|0|{0|in|}117|119|}
{2010214001|XXGiport_src_flow|192|0|311|0|{0|}119|113|}
{2010006001|XXGobject_psameas_object|193|0|312|0|{in_metadata|read_metadata|0|0|}117|32|}
{2010006001|XXGobject_psameas_object|194|0|313|0|{out_metadata|read_metadata|0|0|}117|32|}
{2010212001|XXGvertex_oport_oport|195|0|314|0|{0|out0|}112|120|}
{2010216002|XXGoport_binding_oport|196|0|316|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}120|118|}
{2010213001|XXGoport_dst_flow|197|0|317|0|{0|}120|110|}
{2010211001|XXGvertex_iport_iport|198|0|318|0|{0|in0|}112|121|}
{2010215002|XXGiport_binding_iport|199|0|320|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}121|116|}
{2010007001|XXGobject_proto_object|200|0|321|0|{}112|122|}
{2010604001|XXGgraph_flow_flow|201|0|323|0|{Flow_1|}122|123|}
{2010601001|XXGgraph_vertex_vertex|202|0|325|0|{Partition_by_Key|}122|124|}
{2010212001|XXGvertex_oport_oport|203|0|327|0|{0|out|}124|125|}
{2010213001|XXGoport_dst_flow|204|0|329|0|{0|}125|123|}
{2010211001|XXGvertex_iport_iport|205|0|330|0|{0|in|}124|126|}
{2010007001|XXGobject_proto_object|206|0|332|0|{}124|127|}
{2010212001|XXGvertex_oport_oport|207|0|334|0|{0|out|}127|128|}
{2010006001|XXGobject_psameas_object|208|0|336|0|{metadata|out_metadata|1|0|}128|127|}
{2010211001|XXGvertex_iport_iport|209|0|337|0|{0|in|}127|129|}
{2010006001|XXGobject_psameas_object|210|0|339|0|{metadata|in_metadata|1|0|}129|127|}
{2010006001|XXGobject_psameas_object|211|0|340|0|{Layout|InputLayout|1|0|}124|122|}
{2010006001|XXGobject_psameas_object|212|0|341|0|{key|Key|1|0|}124|122|}
{2010601001|XXGgraph_vertex_vertex|213|0|342|0|{Sort|}122|130|}
{2010212001|XXGvertex_oport_oport|214|0|344|0|{0|out|}130|131|}
{2010211001|XXGvertex_iport_iport|215|0|346|0|{0|in|}130|132|}
{2010214001|XXGiport_src_flow|216|0|348|0|{0|}132|123|}
{2010007001|XXGobject_proto_object|217|0|349|0|{}130|133|}
{2010212001|XXGvertex_oport_oport|218|0|351|0|{0|out|}133|134|}
{2010006001|XXGobject_psameas_object|219|0|353|0|{metadata|out_metadata|1|0|}134|133|}
{2010211001|XXGvertex_iport_iport|220|0|354|0|{0|in|}133|135|}
{2010006001|XXGobject_psameas_object|221|0|356|0|{metadata|in_metadata|1|0|}135|133|}
{2010006001|XXGobject_psameas_object|222|0|357|0|{Layout|OutputLayout|1|0|}130|122|}
{2010006001|XXGobject_psameas_object|223|0|358|0|{key|Key|1|0|}130|122|}
{2010006001|XXGobject_psameas_object|224|0|359|0|{max_core|Max_core|1|0|}130|122|}
{2010212001|XXGvertex_oport_oport|225|0|360|0|{0|out0|}122|136|}
{2010216002|XXGoport_binding_oport|226|0|362|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}136|131|}
{2010211001|XXGvertex_iport_iport|227|0|363|0|{0|in0|}122|137|}
{2010215002|XXGiport_binding_iport|228|0|365|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}137|126|}
{2010006001|XXGobject_psameas_object|229|0|366|0|{InputLayout|Layout|0|0|}112|90|}
{2010006001|XXGobject_psameas_object|230|0|367|0|{OutputLayout|Layout|0|0|}112|90|}
{2010601001|XXGgraph_vertex_vertex|231|0|368|0|{REDUCED_ICFF_New|}109|90|}
{2010601001|XXGgraph_vertex_vertex|232|0|369|0|{REDUCED_Index_File|}109|138|}
{2010211001|XXGvertex_iport_iport|233|0|371|0|{0|write|}138|139|}
{2010214001|XXGiport_src_flow|234|0|373|0|{0|}139|111|}
{2010007001|XXGobject_proto_object|235|0|374|0|{}138|140|}
{2010211001|XXGvertex_iport_iport|236|0|376|0|{0|write|}140|141|}
{2010006001|XXGobject_psameas_object|237|0|378|0|{metadata|write_metadata|1|0|}141|140|}
{2010601001|XXGgraph_vertex_vertex|238|0|379|0|{WBCL_To_reduced_IDS|}109|142|}
{2010212001|XXGvertex_oport_oport|239|0|381|0|{0|out|}142|143|}
{2010213001|XXGoport_dst_flow|240|0|383|0|{0|}143|92|}
{2010212001|XXGvertex_oport_oport|241|0|384|0|{1|index|}142|144|}
{2010213001|XXGoport_dst_flow|242|0|386|0|{0|}144|111|}
{2010212001|XXGvertex_oport_oport|243|0|387|0|{2|address|}142|145|}
{2010211001|XXGvertex_iport_iport|244|0|389|0|{0|in|}142|146|}
{2010214001|XXGiport_src_flow|245|0|391|0|{0|}146|110|}
{2010007001|XXGobject_proto_object|246|0|392|0|{}142|147|}
{2010212001|XXGvertex_oport_oport|247|0|394|0|{0|out|}147|148|}
{2010006001|XXGobject_psameas_object|248|0|396|0|{metadata|out_metadata|1|0|}148|147|}
{2010212001|XXGvertex_oport_oport|249|0|397|0|{1|index|}147|149|}
{2010006001|XXGobject_psameas_object|250|0|399|0|{metadata|index_metadata|1|0|}149|147|}
{2010212001|XXGvertex_oport_oport|251|0|400|0|{2|address|}147|150|}
{2010006001|XXGobject_psameas_object|252|0|402|0|{metadata|address_metadata|1|0|}150|147|}
{2010211001|XXGvertex_iport_iport|253|0|403|0|{0|in|}147|151|}
{2010006001|XXGobject_psameas_object|254|0|405|0|{metadata|in_metadata|1|0|}151|147|}
{2010006001|XXGobject_psameas_object|255|0|406|0|{Layout|Layout|0|0|}142|90|}
{2010006001|XXGobject_psameas_object|256|0|407|0|{in_metadata|read_metadata|0|0|}142|32|}
{2010006001|XXGobject_psameas_object|257|0|408|0|{out_metadata|write_metadata|0|0|}142|90|}
{2010211001|XXGvertex_iport_iport|258|0|409|0|{0|in0|}109|152|}
{2010215002|XXGiport_binding_iport|259|0|411|0|{.5|.5|{0|}13813|}152|121|}
{2010214001|XXGiport_src_flow|260|0|412|0|{0|}152|21|}
{2010601001|XXGgraph_vertex_vertex|261|0|413|0|{Partition_by_Key|}1|153|}
{2010212001|XXGvertex_oport_oport|262|0|415|0|{0|out|}153|154|}
{2010213001|XXGoport_dst_flow|263|0|417|0|{0|}154|20|}
{2010211001|XXGvertex_iport_iport|264|0|418|0|{0|in|}153|155|}
{2010214001|XXGiport_src_flow|265|0|420|0|{0|}155|18|}
{2010007001|XXGobject_proto_object|266|0|421|0|{}153|156|}
{2010212001|XXGvertex_oport_oport|267|0|423|0|{0|out|}156|157|}
{2010006001|XXGobject_psameas_object|268|0|425|0|{metadata|out_metadata|1|0|}157|156|}
{2010211001|XXGvertex_iport_iport|269|0|426|0|{0|in|}156|158|}
{2010006001|XXGobject_psameas_object|270|0|428|0|{metadata|in_metadata|1|0|}158|156|}
{2010006001|XXGobject_psameas_object|271|0|429|0|{Layout|Layout|0|0|}153|32|}
{2010006001|XXGobject_psameas_object|272|0|430|0|{in_metadata|read_metadata|0|0|}153|32|}
{2010006001|XXGobject_psameas_object|273|0|431|0|{out_metadata|read_metadata|0|0|}153|32|}
{2010601001|XXGgraph_vertex_vertex|274|0|432|0|{Sort|}1|159|}
{2010212001|XXGvertex_oport_oport|275|0|434|0|{0|out|}159|160|}
{2010213001|XXGoport_dst_flow|276|0|436|0|{0|}160|22|}
{2010211001|XXGvertex_iport_iport|277|0|437|0|{0|in|}159|161|}
{2010214001|XXGiport_src_flow|278|0|439|0|{0|}161|20|}
{2010007001|XXGobject_proto_object|279|0|440|0|{}159|162|}
{2010212001|XXGvertex_oport_oport|280|0|442|0|{0|out|}162|163|}
{2010006001|XXGobject_psameas_object|281|0|444|0|{metadata|out_metadata|1|0|}163|162|}
{2010211001|XXGvertex_iport_iport|282|0|445|0|{0|in|}162|164|}
{2010006001|XXGobject_psameas_object|283|0|447|0|{metadata|in_metadata|1|0|}164|162|}
{2010006001|XXGobject_psameas_object|284|0|448|0|{Layout|Layout|0|0|}159|90|}
{2010006001|XXGobject_psameas_object|285|0|449|0|{in_metadata|read_metadata|0|0|}159|32|}
{2010006001|XXGobject_psameas_object|286|0|450|0|{out_metadata|read_metadata|0|0|}159|32|}
{2010601001|XXGgraph_vertex_vertex|287|0|451|0|{Version_Log|}1|165|}
{2010605001|XXGgraph_legend_legend|288|0|453|0|{0|}165|166|}
{2010241001|XXGlegend_face_face|289|0|455|0|{}166|167|}
{2010605001|XXGgraph_legend_legend|290|0|457|0|{1|}165|168|}
{2010241001|XXGlegend_face_face|291|0|459|0|{}168|169|}
{2010605001|XXGgraph_legend_legend|292|0|461|0|{2|}165|170|}
{2010241001|XXGlegend_face_face|293|0|463|0|{}170|171|}
{2010605001|XXGgraph_legend_legend|294|0|465|0|{3|}165|172|}
{2010241001|XXGlegend_face_face|295|0|467|0|{}172|173|}
{2010605001|XXGgraph_legend_legend|296|0|469|0|{4|}165|174|}
{2010241001|XXGlegend_face_face|297|0|471|0|{}174|175|}
{2010605001|XXGgraph_legend_legend|298|0|473|0|{5|}165|176|}
{2010241001|XXGlegend_face_face|299|0|475|0|{}176|177|}
{2010605001|XXGgraph_legend_legend|300|0|477|0|{6|}165|178|}
{2010241001|XXGlegend_face_face|301|0|479|0|{}178|179|}
{2010605001|XXGgraph_legend_legend|302|0|481|0|{7|}165|180|}
{2010241001|XXGlegend_face_face|303|0|483|0|{}180|181|}
{2010605001|XXGgraph_legend_legend|304|0|485|0|{8|}165|182|}
{2010241001|XXGlegend_face_face|305|0|487|0|{}182|183|}
{2010605001|XXGgraph_legend_legend|306|0|489|0|{9|}165|184|}
{2010241001|XXGlegend_face_face|307|0|491|0|{}184|185|}
{2010605001|XXGgraph_legend_legend|308|0|493|0|{10|}165|186|}
{2010241001|XXGlegend_face_face|309|0|495|0|{}186|187|}
{2010605001|XXGgraph_legend_legend|310|0|497|0|{11|}165|188|}
{2010241001|XXGlegend_face_face|311|0|499|0|{}188|189|}
{2010109001|XXGobject_property_value|312|0|501|0|{0|TrackingThumbprint|72|}1|190|}
