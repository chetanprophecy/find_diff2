@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|237|rel_count|394|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";|8|1|FKl|Provides functions and types to use in PDL.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|LOAD_FRQUENCY|Daily|15|9|FK|@{2|Daily|Adhoc|}}
{30001002|XXparameter|RUN_ID|$[(datetime("YYYYMMDDHH24MISS")) now()]|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_DATASET||3|9|FK|@{0|}}
{30001002|XXparameter|NATURAL_KEY|$[get_ids_table_nk(IDS_DATASET)]|3|9|FK|\{field_1; ...; field_n\}: The natural key for the target table, without any effective date fields.|{0|}}
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
{30001002|XXparameter|_ab_graph_is_handler|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|create_reduced_and_archive_p90|Mukesh.Singh|Created 9/10/2022 11:36:17 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1326000|914000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.2.0|{2|1|1|}Job 'create_reduced_and_archive_p90' Execution Status Report

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
        if [[ $IS_INPUT_ARCHIVE_FILE_EXIST == 1  ]];then
        echo " Renaming  :$INPUT_ARCHIVE_FILE to Backup  file :-$INPUT_ARCHIVE_BKP_FILE "
        m_mv $INPUT_ARCHIVE_FILE $INPUT_ARCHIVE_BKP_FILE
                        if [ $? -ne 0 ];then
                                        echo " failed to rename INPUT_ARCHIVE_FILE :$INPUT_ARCHIVE_FILE to Backup INPUT_ARCHIVE_BKP_FILE :-$INPUT_ARCHIVE_BKP_FILE "
                                exit 12
                         fi 
 m_mv $INPUT_ARCHIVE_IDX_FILE $INPUT_ARCHIVE_IDX_BKP_FILE
                        if [ $? -ne 0 ];then
                                        echo " failed to rename INPUT_ARCHIVE_IDX_FILE :$INPUT_ARCHIVE_IDX_FILE to Backup INPUT_ARCHIVE_BKP_IDX_FILE :-$INPUT_ARCHIVE_BKP_IDX_FILE "
                                exit 12
                         fi

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
if [[ $IS_INPUT_ARCHIVE_FILE_EXIST == 1  ]];then
echo " Renaming  ICFF_FILE_NEW_ARCHIVE :$ICFF_FILE_NEW_ARCHIVE to Backup INPUT_ARCHIVE_FILE :-$INPUT_ARCHIVE_FILE "

  m_mv $ICFF_FILE_NEW_ARCHIVE $INPUT_ARCHIVE_FILE
     if [ $? -ne 0 ];then
             echo " failed to rename ICFF_FILE_NEW_ARCHIVE :$ICFF_FILE_NEW_ARCHIVE to Backup INPUT_ARCHIVE_FILE :-$INPUT_ARCHIVE_FILE "
              exit 12
      fi 

  m_mv $ICFF_INDEX_FILE_NEW_ARCHIVE $INPUT_ARCHIVE_IDX_FILE

      if [ $? -ne 0 ];then
             echo " failed to rename ICFF_INDEX_FILE_NEW_ARCHIVE :$ICFF_INDEX_FILE_NEW_ARCHIVE to Backup INPUT_ARCHIVE_IDX_FILE :-$INPUT_ARCHIVE_IDX_FILE "
              exit 12
      fi 
fi


else
        echo "Graph Failed"
fi

|@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@PLM dev - ndeotarse||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
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
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}14055|2065|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}14176|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}14057|2065|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{0|}14167|17|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.5|{0|}14169|2065|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{0|}14173|529|}}
{2010210004|XXGflow|21|0|41|0|{@{}@0|.5|.5|{0|}14175|17|}}
{2010210004|XXGflow|22|0|43|0|{@{}@0|.5|.5|{0|}14171|17|}}
{2010503005|XXGfvertex|23|0|45|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_ARCHIVE_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_ARCHIVE_FILE|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[IS_INPUT_ARCHIVE_FILE_EXIST]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|record
unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
integer(8)  dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
decimal("\\x01",0)   claim_nbr = NULL("") /*BIGINT NOT NULL*/;
decimal("\\x01",0)   claim_seq_nbr = NULL("") /*INTEGER NOT NULL*/;
string("\\x01",charset="iso-8859-15", maximum_length=1)   claim_stat_id = NULL("") /*CHAR(1) NOT NULL*/;
decimal("\\x01",0)   cag_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0)   mbr_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0) prod_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0) ntwk_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0) final_pln_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0) gnrc_mdspn_ind_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0) super_ntwk_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0) claim_stat_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0) days_of_supply_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0) gpi_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0)   prod_adjud_sk = NULL("") /*BIGINT*/;
string("\\x01",charset="iso-8859-15", maximum_length=30) orig_carrier_id = NULL("") /*VARCHAR(30)*/;
string("\\x01",charset="iso-8859-15", maximum_length=40) orig_account_id = NULL("") /*VARCHAR(40)*/;
string("\\x01",charset="iso-8859-15", maximum_length=30) orig_employer_group_id = NULL("") /*VARCHAR(30)*/;
string("\\x01",charset="iso-8859-15", maximum_length=20) orig_member_id = NULL("") /*VARCHAR(20)*/;
date("YYYYMMDD")("\\x01")   sbm_dt = NULL("") /*DATE*/;
date("YYYYMMDD")("\\x01")   filled_dt = NULL("") /*DATE*/;
decimal("\\x01",0)   days_sply = NULL("") /*SMALLINT*/;
decimal("\\x01",0) prorated_days_supply = NULL("") /*SMALLINT*/;
string("\\x01",charset="iso-8859-15", maximum_length=12) rx_nbr = NULL("") /*VARCHAR(12)*/;
string("\\x01",charset="iso-8859-15", maximum_length=1) day_90_prog_type = NULL("") /*CHAR(1)*/;
string("\\x01",charset="iso-8859-15", maximum_length=1) day_90_retail_prog_ind = NULL("") /*CHAR(1)*/;
string("\\x01",charset="iso-8859-15", maximum_length=1) day_90_retail_grace_fill = NULL("") /*CHAR(1)*/;
decimal("\\x01",0) src_env_sk = NULL("") /*BIGINT*/;
decimal("\\x01", maximum_length=5)   dxf_src_sys_id =   0;
datetime("YYYYMMDDHH24MISS")("\\x01")   ids_create_dttm = NULL("");
string("\\x01", maximum_length=20)   ids_create_uid = NULL("");
decimal("\\x01",maximum_length=20)   ids_create_run_id =   0;
datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
string("\\x01", maximum_length=20)   ids_updt_uid = NULL("");
decimal("\\x01",maximum_length=20)   ids_updt_run_id =   0;
string("\\x01",maximum_length=2)   ids_rec_stat_cd = NULL("");
if ( ids_create_run_id == 20220909010904 )
begin
decimal("\\x01",0) claim_nbr_encrp = NULL("") /*BIGINT*/;
end;
string(1) newline = "\\n";
end;|3|1|l|@{0|}}
}}@0|@20000|590000|0|0|0|0|14058|Archive File|Ab Initio Software|@1|10000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|24|0|47|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|25|0|50|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|26|0|52|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|27|0|55|0|{Subgraph created from graph "create_reduced_and_archive"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[IS_INPUT_ARCHIVE_FILE_EXIST]|3|9|F||{0|}}
}}@0|@1171250|498750|0|0|0|0|14172|Archive IDS|Mukesh.Singh|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1037000|573000|7|}}
{2010210004|XXGflow|28|0|57|0|{@{}@384|.5|.5|{0|}13820|17|}}
{2010210004|XXGflow|29|0|59|0|{@{}@384|.5|.5|{0|}13822|17|}}
{2010210004|XXGflow|30|0|61|0|{@{}@384|.5|.5|{0|}13805|17|}}
{2010600005|XXGgraph|31|0|63|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@252000|176250|0|0|481000|303000|13823|Partition by Key and Sort|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||4097|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|32|0|65|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|33|0|67|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|34|0|69|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|35|0|72|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|36|0|74|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|/*   Do not edit. Generated file - BRE 4.0.2.18;;Default deployment;   */
//include '~$AI_XFR/bre_helper.map.xfr';

out :: reformat(in) =
begin
//out.claim_nbr_encrp :1:  if(in.claim_nbr>0) (decimal(''))(string_concat(string_substring((decimal(''))in.claim_nbr,1,2),ff3_encrypt_idwdata((decimal(''))in.claim_nbr)))
//else  (decimal(''))(string_concat(string_substring((decimal(''))in.claim_nbr,1,3),ff3_encrypt_idwdata(decimal_strip(math_abs((decimal(''))in.claim_nbr)))));
 
out.*:: in.*;

end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata|$DML_FL|3|9|fj|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|590000|480500|0|0|0|0|14177|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|37|0|76|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|38|0|79|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|39|0|81|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|40|0|83|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|41|0|85|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|42|0|88|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|output_indexes_signature|int[int] output_indexes_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
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
{30001002|XXparameter|num_operations|7|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|legacy_xfr;reject*=in;out*=in|3|2|H$||{0|}}
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
{30001002|XXparameter|operation7|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|43|0|90|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|44|0|94|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|45|0|97|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|46|0|100|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|47|0|103|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|48|0|106|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$DELETE_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|=|@{0|}}
}}@0|@509500|674000|0|0|0|0|14166|DELETE THIS FILE|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|49|0|108|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|50|0|111|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|51|0|113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|52|0|116|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_FL|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|record
unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
integer(8)  dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
decimal("\\x01",0)   claim_nbr = NULL("") /*BIGINT NOT NULL*/;
decimal("\\x01",0)   claim_seq_nbr = NULL("") /*INTEGER NOT NULL*/;
string("\\x01",charset="iso-8859-15", maximum_length=1)   claim_stat_id = NULL("") /*CHAR(1) NOT NULL*/;
decimal("\\x01",0)   cag_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0)   mbr_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0) prod_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0) ntwk_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0) final_pln_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0) gnrc_mdspn_ind_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0) super_ntwk_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0) claim_stat_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0) days_of_supply_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0) gpi_sk = NULL("") /*BIGINT*/;
decimal("\\x01",0)   prod_adjud_sk = NULL("") /*BIGINT*/;
string("\\x01",charset="iso-8859-15", maximum_length=30) orig_carrier_id = NULL("") /*VARCHAR(30)*/;
string("\\x01",charset="iso-8859-15", maximum_length=40) orig_account_id = NULL("") /*VARCHAR(40)*/;
string("\\x01",charset="iso-8859-15", maximum_length=30) orig_employer_group_id = NULL("") /*VARCHAR(30)*/;
string("\\x01",charset="iso-8859-15", maximum_length=20) orig_member_id = NULL("") /*VARCHAR(20)*/;
date("YYYYMMDD")("\\x01")   sbm_dt = NULL("") /*DATE*/;
date("YYYYMMDD")("\\x01")   filled_dt = NULL("") /*DATE*/;
decimal("\\x01",0)   days_sply = NULL("") /*SMALLINT*/;
decimal("\\x01",0) prorated_days_supply = NULL("") /*SMALLINT*/;
string("\\x01",charset="iso-8859-15", maximum_length=12) rx_nbr = NULL("") /*VARCHAR(12)*/;
string("\\x01",charset="iso-8859-15", maximum_length=1) day_90_prog_type = NULL("") /*CHAR(1)*/;
string("\\x01",charset="iso-8859-15", maximum_length=1) day_90_retail_prog_ind = NULL("") /*CHAR(1)*/;
string("\\x01",charset="iso-8859-15", maximum_length=1) day_90_retail_grace_fill = NULL("") /*CHAR(1)*/;
decimal("\\x01",0) src_env_sk = NULL("") /*BIGINT*/;
decimal("\\x01", maximum_length=5)   dxf_src_sys_id =   0;
datetime("YYYYMMDDHH24MISS")("\\x01")   ids_create_dttm = NULL("");
string("\\x01", maximum_length=20)   ids_create_uid = NULL("");
decimal("\\x01",maximum_length=20)   ids_create_run_id =   0;
datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
string("\\x01", maximum_length=20)   ids_updt_uid = NULL("");
decimal("\\x01",maximum_length=20)   ids_updt_run_id =   0;
string("\\x01",maximum_length=2)   ids_rec_stat_cd = NULL("");
if ( ids_create_run_id == 20220909010904 )
begin
decimal("\\x01",0) claim_nbr_encrp = NULL("") /*BIGINT*/;
end;
string(1) newline = "\\n";
end;|3|1|l|@{0|}}
}}@0|@20000|275000|0|0|0|0|14056|Input Ids File|Ab Initio Software|@1|10000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|53|0|118|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|54|0|121|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|55|0|123|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|56|0|129|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|57|0|131|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|58|0|133|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|59|0|138|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|60|0|142|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|61|0|145|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|62|0|147|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|63|0|149|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|64|0|151|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|65|0|154|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|66|0|156|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|67|0|158|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|68|0|161|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|69|0|166|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|70|0|168|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|71|0|170|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|72|0|173|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|73|0|175|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|74|0|178|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|75|0|184|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|76|0|187|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010503005|XXGfvertex|77|0|191|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_FILE_NEW_ARCHIVE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
}}@1|@894500|104000|0|0|0|0|13821|REDUCED ICFF-ARCHIVE|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|78|0|193|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|79|0|196|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|80|0|198|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|81|0|202|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_INDEX_FILE_NEW_ARCHIVE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1)|7|1|RFl||{0|}}
}}@1|@900500|304000|0|0|0|0|13725|REDUCED Index ARCHIVE|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|82|0|204|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|83|0|207|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|84|0|209|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|85|0|212|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|9||@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@1|@490500|169000|0|0|0|0|13806|WBCL: To reduced IDS-1|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|86|0|214|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|87|0|217|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|88|0|220|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|89|0|222|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|90|0|225|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|91|0|227|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|92|0|230|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|93|0|233|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|94|0|236|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|95|0|242|0|{@{}@0|0|0|0|in0|.39092495636998253|@@@13840|0|}}
{2010501005|XXGpvertex|96|0|247|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|$SELECT_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|785000|380000|0|0|0|0|14165|Filter- Main and Archive|Ab Initio Software|Built-in 1.0:|1|100|0||6||36865|1|{1|0|}}}
{2010203004|XXGoport|97|0|249|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|98|0|252|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|99|0|255|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|100|0|257|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|101|0|259|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|102|0|261|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|103|0|264|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|104|0|266|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|105|0|269|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|106|0|272|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|107|0|275|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|108|0|278|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|109|0|281|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|110|0|289|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Gather|155000|420000|0|0|0|0|13815|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|111|0|291|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|112|0|294|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|113|0|298|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|114|0|300|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|115|0|303|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010600005|XXGgraph|116|0|310|0|{Subgraph created from graph "create_reduced_and_archive"|{}@0|@1159250|330250|0|0|0|0|14174|Main IDS|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|884000|544000|7|}}
{2010210004|XXGflow|117|0|312|0|{@{}@384|.5|.5|{0|}13817|17|}}
{2010210004|XXGflow|118|0|314|0|{@{}@0|.5|.5|{0|}13816|17|}}
{2010210004|XXGflow|119|0|316|0|{@{}@384|.5|.5|{0|}13811|17|}}
{2010210004|XXGflow|120|0|318|0|{@{}@384|.5|.5|{0|}13808|17|}}
{2010210004|XXGflow|121|0|320|0|{@{}@384|.5|.5|{0|}13814|17|}}
{2010600005|XXGgraph|122|0|322|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@267000|117250|0|0|481000|303000|13812|Partition by Key and Sort-1|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|123|0|324|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|124|0|326|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|125|0|328|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|126|0|331|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|127|0|335|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|128|0|337|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|129|0|339|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|130|0|344|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|131|0|348|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|132|0|352|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|133|0|354|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|134|0|356|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|135|0|358|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|136|0|361|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|137|0|363|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|138|0|365|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|139|0|368|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|140|0|373|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|141|0|375|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|142|0|377|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|143|0|380|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|144|0|382|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|145|0|385|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|146|0|391|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|147|0|394|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010503005|XXGfvertex|148|0|398|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_FILE_NEW|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
}}@1|@759500|85000|0|0|0|0|13815|REDUCED ICFF New|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|149|0|400|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|150|0|403|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|151|0|405|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|152|0|408|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|1|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|40000|142250|0|0|0|0|13818|Purge Filter- Latest|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|153|0|410|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|154|0|413|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|155|0|416|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|156|0|418|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|157|0|420|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|158|0|422|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|159|0|424|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|160|0|426|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|161|0|429|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|162|0|432|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|163|0|435|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|164|0|438|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|165|0|441|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|166|0|450|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_INDEX_FILE_NEW|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1)|7|1|RFl||{0|}}
}}@1|@765500|270000|0|0|0|0|13713|REDUCED Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|167|0|452|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|168|0|455|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|169|0|457|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|170|0|460|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|183000|300000|0|0|0|0|13791|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010202004|XXGiport|171|0|462|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|172|0|465|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|173|0|467|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|174|0|472|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|9||@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@495500|110000|0|0|0|0|13809|WBCL: To reduced IDS|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|175|0|474|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|176|0|477|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|177|0|480|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|178|0|482|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|179|0|485|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|180|0|487|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|181|0|490|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|182|0|493|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|183|0|496|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|184|0|502|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|185|0|506|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|$ARCHIVE_PURGE_FILTER|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|280000|481250|0|0|0|0|14170|Purge Filter- Archive|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|186|0|508|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|187|0|511|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|188|0|514|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|189|0|516|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|190|0|518|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|191|0|520|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|192|0|523|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|193|0|525|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|194|0|528|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|195|0|531|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|196|0|534|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|197|0|537|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|198|0|540|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|199|0|549|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$DML_FL|3|2|f$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
let decimal("") v_dxf_src_env_rank_input_record=0;
out :: reformat(in) =
begin

   let hash_key_combine_type dxf_hk = reinterpret(get_hash(in, "$\{NATURAL_KEY\}")) ;
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   //Get src env rank for input record
   //out.src_env_rank ::first_defined(lookup("SRC_ENVRT_ID",in.dxf_src_sys_id).src_env_rnk , 9999 ) ; // Assign default value for sources where rank is not defined 
   out.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|condition|$[RECREATE_HASH_KEYS]|3|9||@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|430000|375000|0|0|0|0|14053|Reformat-Re-Calculate Hash|Ab Initio Software|Built-in 1.0:|1|100|0||6||36929|1|{1|0|}}}
{2010203004|XXGoport|200|0|551|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|201|0|553|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|202|0|555|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|203|0|557|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|204|0|559|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|205|0|561|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|206|0|563|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|207|0|567|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|208|0|570|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|209|0|573|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|210|0|576|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|211|0|579|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@15000|75000|0|0|0|0|13718|Version Log|Mukesh.singh|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|821000|470000|3|}}
{2010240003|XXGlegend|212|0|581|0|{@{}@Date|92000|66000|0|0|0|0|7|}}
{2010242002|XXGface|213|0|583|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|214|0|585|0|{@{}@Author|217000|66000|0|0|0|0|99|}}
{2010242002|XXGface|215|0|587|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|216|0|589|0|{@{}@Description|417000|66000|0|0|0|0|28|}}
{2010242002|XXGface|217|0|591|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|218|0|593|0|{@{}@Version|17000|66000|0|0|0|0|4|}}
{2010242002|XXGface|219|0|595|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|220|0|597|0|{@{}@1.0|17000|88000|0|0|0|0|105|}}
{2010242002|XXGface|221|0|599|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|222|0|601|0|{@{}@Jan 11 2017|82000|88000|0|0|0|0|107|}}
{2010242002|XXGface|223|0|603|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|224|0|605|0|{@{}@Mukesh.Singh (Exusia)|187000|88000|0|0|0|0|109|}}
{2010242002|XXGface|225|0|607|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|226|0|609|0|{@{}@Initial version - This version only support Data and Index consolidation in 
IDS dimensions
|412000|83000|0|0|0|0|112|}}
{2010242002|XXGface|227|0|611|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|228|0|613|0|{@{}@1.0|17000|123000|0|0|0|0|106|}}
{2010242002|XXGface|229|0|615|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|230|0|617|0|{@{}@July 11 2017|77000|123000|0|0|0|0|114|}}
{2010242002|XXGface|231|0|619|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|232|0|621|0|{@{}@Mukesh.Singh (Exusia)|187000|123000|0|0|0|0|110|}}
{2010242002|XXGface|233|0|623|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|234|0|625|0|{@{}@Xref Consolidation functionality is added|412000|123000|0|0|0|0|113|}}
{2010242002|XXGface|235|0|627|0|{@{}@Arial Narrow|0|100|0|}}
{2010110002|XXGconstant|236|0|629|0|{@{}@{1|330273|}}}
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
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_2|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_3|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_4|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_5|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_6|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_7|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_8|}1|22|}
{2010601001|XXGgraph_vertex_vertex|22|0|44|0|{Archive_File|}1|23|}
{2010212001|XXGvertex_oport_oport|23|0|46|0|{0|read|}23|24|}
{2010213001|XXGoport_dst_flow|24|0|48|0|{0|}24|17|}
{2010007001|XXGobject_proto_object|25|0|49|0|{}23|25|}
{2010212001|XXGvertex_oport_oport|26|0|51|0|{0|read|}25|26|}
{2010006001|XXGobject_psameas_object|27|0|53|0|{metadata|read_metadata|1|0|}26|25|}
{2010601001|XXGgraph_vertex_vertex|28|0|54|0|{Archive_IDS|}1|27|}
{2010604001|XXGgraph_flow_flow|29|0|56|0|{Flow_10|}27|28|}
{2010604001|XXGgraph_flow_flow|30|0|58|0|{Flow_5|}27|29|}
{2010604001|XXGgraph_flow_flow|31|0|60|0|{Flow_7|}27|30|}
{2010601001|XXGgraph_vertex_vertex|32|0|62|0|{Partition_by_Key_and_Sort|}27|31|}
{2010604001|XXGgraph_flow_flow|33|0|64|0|{Flow_1|}31|32|}
{2010601001|XXGgraph_vertex_vertex|34|0|66|0|{Partition_by_Key|}31|33|}
{2010212001|XXGvertex_oport_oport|35|0|68|0|{0|out|}33|34|}
{2010213001|XXGoport_dst_flow|36|0|70|0|{0|}34|32|}
{2010211001|XXGvertex_iport_iport|37|0|71|0|{0|in|}33|35|}
{2010006001|XXGobject_psameas_object|38|0|73|0|{in_metadata|out0_metadata|0|0|}33|36|}
{2010212001|XXGvertex_oport_oport|39|0|75|0|{0|out0|}36|37|}
{2010213001|XXGoport_dst_flow|40|0|77|0|{0|}37|16|}
{2010212001|XXGvertex_oport_oport|41|0|78|0|{1|reject0|}36|38|}
{2010212001|XXGvertex_oport_oport|42|0|80|0|{2|error0|}36|39|}
{2010212001|XXGvertex_oport_oport|43|0|82|0|{3|log|}36|40|}
{2010211001|XXGvertex_iport_iport|44|0|84|0|{0|in|}36|41|}
{2010214001|XXGiport_src_flow|45|0|86|0|{0|}41|21|}
{2010007001|XXGobject_proto_object|46|0|87|0|{}36|42|}
{2010212001|XXGvertex_oport_oport|47|0|89|0|{0|out0|}42|43|}
{2010006001|XXGobject_psameas_object|48|0|91|0|{metadata|out0_metadata|1|0|}43|42|}
{2010006001|XXGobject_psameas_object|49|0|92|0|{transform0|transform0|1|0|}43|42|}
{2010212001|XXGvertex_oport_oport|50|0|93|0|{1|reject0|}42|44|}
{2010006001|XXGobject_psameas_object|51|0|95|0|{metadata|reject0_metadata|1|0|}44|42|}
{2010212001|XXGvertex_oport_oport|52|0|96|0|{2|error0|}42|45|}
{2010006001|XXGobject_psameas_object|53|0|98|0|{metadata|error0_metadata|1|0|}45|42|}
{2010212001|XXGvertex_oport_oport|54|0|99|0|{3|log|}42|46|}
{2010006001|XXGobject_psameas_object|55|0|101|0|{metadata|log_metadata|1|0|}46|42|}
{2010211001|XXGvertex_iport_iport|56|0|102|0|{0|in|}42|47|}
{2010006001|XXGobject_psameas_object|57|0|104|0|{metadata|in_metadata|1|0|}47|42|}
{2010006001|XXGobject_psameas_object|58|0|105|0|{Layout|Layout|0|0|}36|48|}
{2010211001|XXGvertex_iport_iport|59|0|107|0|{0|write|}48|49|}
{2010214001|XXGiport_src_flow|60|0|109|0|{0|}49|19|}
{2010007001|XXGobject_proto_object|61|0|110|0|{}48|50|}
{2010211001|XXGvertex_iport_iport|62|0|112|0|{0|write|}50|51|}
{2010006001|XXGobject_psameas_object|63|0|114|0|{metadata|write_metadata|1|0|}51|50|}
{2010006001|XXGobject_psameas_object|64|0|115|0|{write_metadata|read_metadata|0|0|}48|52|}
{2010212001|XXGvertex_oport_oport|65|0|117|0|{0|read|}52|53|}
{2010213001|XXGoport_dst_flow|66|0|119|0|{0|}53|15|}
{2010007001|XXGobject_proto_object|67|0|120|0|{}52|54|}
{2010212001|XXGvertex_oport_oport|68|0|122|0|{0|read|}54|55|}
{2010006001|XXGobject_psameas_object|69|0|124|0|{metadata|read_metadata|1|0|}55|54|}
{2010006001|XXGobject_psameas_object|70|0|125|0|{in_metadata|read_metadata|0|0|}36|52|}
{2010006001|XXGobject_psameas_object|71|0|126|0|{reject0_metadata|read_metadata|0|0|}36|52|}
{2010006001|XXGobject_psameas_object|72|0|127|0|{out_metadata|out0_metadata|0|0|}33|36|}
{2010601001|XXGgraph_vertex_vertex|73|0|128|0|{Sort|}31|56|}
{2010212001|XXGvertex_oport_oport|74|0|130|0|{0|out|}56|57|}
{2010211001|XXGvertex_iport_iport|75|0|132|0|{0|in|}56|58|}
{2010214001|XXGiport_src_flow|76|0|134|0|{0|}58|32|}
{2010006001|XXGobject_psameas_object|77|0|135|0|{in_metadata|out0_metadata|0|0|}56|36|}
{2010006001|XXGobject_psameas_object|78|0|136|0|{out_metadata|out0_metadata|0|0|}56|36|}
{2010212001|XXGvertex_oport_oport|79|0|137|0|{0|out0|}31|59|}
{2010216002|XXGoport_binding_oport|80|0|139|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}59|57|}
{2010213001|XXGoport_dst_flow|81|0|140|0|{0|}59|29|}
{2010211001|XXGvertex_iport_iport|82|0|141|0|{0|in0|}31|60|}
{2010215002|XXGiport_binding_iport|83|0|143|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}60|35|}
{2010007001|XXGobject_proto_object|84|0|144|0|{}31|61|}
{2010604001|XXGgraph_flow_flow|85|0|146|0|{Flow_1|}61|62|}
{2010601001|XXGgraph_vertex_vertex|86|0|148|0|{Partition_by_Key|}61|63|}
{2010212001|XXGvertex_oport_oport|87|0|150|0|{0|out|}63|64|}
{2010213001|XXGoport_dst_flow|88|0|152|0|{0|}64|62|}
{2010211001|XXGvertex_iport_iport|89|0|153|0|{0|in|}63|65|}
{2010007001|XXGobject_proto_object|90|0|155|0|{}63|66|}
{2010212001|XXGvertex_oport_oport|91|0|157|0|{0|out|}66|67|}
{2010006001|XXGobject_psameas_object|92|0|159|0|{metadata|out_metadata|1|0|}67|66|}
{2010211001|XXGvertex_iport_iport|93|0|160|0|{0|in|}66|68|}
{2010006001|XXGobject_psameas_object|94|0|162|0|{metadata|in_metadata|1|0|}68|66|}
{2010006001|XXGobject_psameas_object|95|0|163|0|{Layout|InputLayout|1|0|}63|61|}
{2010006001|XXGobject_psameas_object|96|0|164|0|{key|Key|1|0|}63|61|}
{2010601001|XXGgraph_vertex_vertex|97|0|165|0|{Sort|}61|69|}
{2010212001|XXGvertex_oport_oport|98|0|167|0|{0|out|}69|70|}
{2010211001|XXGvertex_iport_iport|99|0|169|0|{0|in|}69|71|}
{2010214001|XXGiport_src_flow|100|0|171|0|{0|}71|62|}
{2010007001|XXGobject_proto_object|101|0|172|0|{}69|72|}
{2010212001|XXGvertex_oport_oport|102|0|174|0|{0|out|}72|73|}
{2010006001|XXGobject_psameas_object|103|0|176|0|{metadata|out_metadata|1|0|}73|72|}
{2010211001|XXGvertex_iport_iport|104|0|177|0|{0|in|}72|74|}
{2010006001|XXGobject_psameas_object|105|0|179|0|{metadata|in_metadata|1|0|}74|72|}
{2010006001|XXGobject_psameas_object|106|0|180|0|{Layout|OutputLayout|1|0|}69|61|}
{2010006001|XXGobject_psameas_object|107|0|181|0|{key|Key|1|0|}69|61|}
{2010006001|XXGobject_psameas_object|108|0|182|0|{max_core|Max_core|1|0|}69|61|}
{2010212001|XXGvertex_oport_oport|109|0|183|0|{0|out0|}61|75|}
{2010216002|XXGoport_binding_oport|110|0|185|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}75|70|}
{2010211001|XXGvertex_iport_iport|111|0|186|0|{0|in0|}61|76|}
{2010215002|XXGiport_binding_iport|112|0|188|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}76|65|}
{2010006001|XXGobject_psameas_object|113|0|189|0|{InputLayout|Layout|0|0|}31|48|}
{2010006001|XXGobject_psameas_object|114|0|190|0|{OutputLayout|Layout|0|0|}31|77|}
{2010211001|XXGvertex_iport_iport|115|0|192|0|{0|write|}77|78|}
{2010214001|XXGiport_src_flow|116|0|194|0|{0|}78|28|}
{2010007001|XXGobject_proto_object|117|0|195|0|{}77|79|}
{2010211001|XXGvertex_iport_iport|118|0|197|0|{0|write|}79|80|}
{2010006001|XXGobject_psameas_object|119|0|199|0|{metadata|write_metadata|1|0|}80|79|}
{2010601001|XXGgraph_vertex_vertex|120|0|200|0|{REDUCED_ICFF_ARCHIVE|}27|77|}
{2010601001|XXGgraph_vertex_vertex|121|0|201|0|{REDUCED_Index_ARCHIVE|}27|81|}
{2010211001|XXGvertex_iport_iport|122|0|203|0|{0|write|}81|82|}
{2010214001|XXGiport_src_flow|123|0|205|0|{0|}82|30|}
{2010007001|XXGobject_proto_object|124|0|206|0|{}81|83|}
{2010211001|XXGvertex_iport_iport|125|0|208|0|{0|write|}83|84|}
{2010006001|XXGobject_psameas_object|126|0|210|0|{metadata|write_metadata|1|0|}84|83|}
{2010601001|XXGgraph_vertex_vertex|127|0|211|0|{WBCL_To_reduced_IDS_1|}27|85|}
{2010212001|XXGvertex_oport_oport|128|0|213|0|{0|out|}85|86|}
{2010213001|XXGoport_dst_flow|129|0|215|0|{0|}86|28|}
{2010212001|XXGvertex_oport_oport|130|0|216|0|{1|index|}85|87|}
{2010213001|XXGoport_dst_flow|131|0|218|0|{0|}87|30|}
{2010212001|XXGvertex_oport_oport|132|0|219|0|{2|address|}85|88|}
{2010211001|XXGvertex_iport_iport|133|0|221|0|{0|in|}85|89|}
{2010214001|XXGiport_src_flow|134|0|223|0|{0|}89|29|}
{2010007001|XXGobject_proto_object|135|0|224|0|{}85|90|}
{2010212001|XXGvertex_oport_oport|136|0|226|0|{0|out|}90|91|}
{2010006001|XXGobject_psameas_object|137|0|228|0|{metadata|out_metadata|1|0|}91|90|}
{2010212001|XXGvertex_oport_oport|138|0|229|0|{1|index|}90|92|}
{2010006001|XXGobject_psameas_object|139|0|231|0|{metadata|index_metadata|1|0|}92|90|}
{2010212001|XXGvertex_oport_oport|140|0|232|0|{2|address|}90|93|}
{2010006001|XXGobject_psameas_object|141|0|234|0|{metadata|address_metadata|1|0|}93|90|}
{2010211001|XXGvertex_iport_iport|142|0|235|0|{0|in|}90|94|}
{2010006001|XXGobject_psameas_object|143|0|237|0|{metadata|in_metadata|1|0|}94|90|}
{2010006001|XXGobject_psameas_object|144|0|238|0|{Layout|Layout|0|0|}85|77|}
{2010006001|XXGobject_psameas_object|145|0|239|0|{in_metadata|out0_metadata|0|0|}85|36|}
{2010006001|XXGobject_psameas_object|146|0|240|0|{out_metadata|write_metadata|0|0|}85|77|}
{2010211001|XXGvertex_iport_iport|147|0|241|0|{0|in0|}27|95|}
{2010215002|XXGiport_binding_iport|148|0|243|0|{.5|.5|{0|}13819|}95|60|}
{2010214001|XXGiport_src_flow|149|0|244|0|{0|}95|22|}
{2010601001|XXGgraph_vertex_vertex|150|0|245|0|{DELETE_THIS_FILE|}1|48|}
{2010601001|XXGgraph_vertex_vertex|151|0|246|0|{Filter_Main_and_Archive|}1|96|}
{2010212001|XXGvertex_oport_oport|152|0|248|0|{0|out|}96|97|}
{2010213001|XXGoport_dst_flow|153|0|250|0|{0|}97|20|}
{2010212001|XXGvertex_oport_oport|154|0|251|0|{1|deselect|}96|98|}
{2010213001|XXGoport_dst_flow|155|0|253|0|{0|}98|22|}
{2010212001|XXGvertex_oport_oport|156|0|254|0|{2|reject|}96|99|}
{2010212001|XXGvertex_oport_oport|157|0|256|0|{3|error|}96|100|}
{2010212001|XXGvertex_oport_oport|158|0|258|0|{4|log|}96|101|}
{2010211001|XXGvertex_iport_iport|159|0|260|0|{0|in|}96|102|}
{2010214001|XXGiport_src_flow|160|0|262|0|{0|}102|16|}
{2010007001|XXGobject_proto_object|161|0|263|0|{}96|103|}
{2010212001|XXGvertex_oport_oport|162|0|265|0|{0|out|}103|104|}
{2010006001|XXGobject_psameas_object|163|0|267|0|{metadata|out_metadata|1|0|}104|103|}
{2010212001|XXGvertex_oport_oport|164|0|268|0|{1|deselect|}103|105|}
{2010006001|XXGobject_psameas_object|165|0|270|0|{metadata|deselect_metadata|1|0|}105|103|}
{2010212001|XXGvertex_oport_oport|166|0|271|0|{2|reject|}103|106|}
{2010006001|XXGobject_psameas_object|167|0|273|0|{metadata|reject_metadata|1|0|}106|103|}
{2010212001|XXGvertex_oport_oport|168|0|274|0|{3|error|}103|107|}
{2010006001|XXGobject_psameas_object|169|0|276|0|{metadata|error_metadata|1|0|}107|103|}
{2010212001|XXGvertex_oport_oport|170|0|277|0|{4|log|}103|108|}
{2010006001|XXGobject_psameas_object|171|0|279|0|{metadata|log_metadata|1|0|}108|103|}
{2010211001|XXGvertex_iport_iport|172|0|280|0|{0|in|}103|109|}
{2010006001|XXGobject_psameas_object|173|0|282|0|{metadata|in_metadata|1|0|}109|103|}
{2010006001|XXGobject_psameas_object|174|0|283|0|{Layout|Layout|0|0|}96|48|}
{2010006001|XXGobject_psameas_object|175|0|284|0|{deselect_metadata|out0_metadata|0|0|}96|36|}
{2010006001|XXGobject_psameas_object|176|0|285|0|{in_metadata|out0_metadata|0|0|}96|36|}
{2010006001|XXGobject_psameas_object|177|0|286|0|{out_metadata|out0_metadata|0|0|}96|36|}
{2010006001|XXGobject_psameas_object|178|0|287|0|{reject_metadata|out0_metadata|0|0|}96|36|}
{2010601001|XXGgraph_vertex_vertex|179|0|288|0|{Gather|}1|110|}
{2010212001|XXGvertex_oport_oport|180|0|290|0|{0|out|}110|111|}
{2010213001|XXGoport_dst_flow|181|0|292|0|{0|}111|18|}
{2010211001|XXGvertex_iport_iport|182|0|293|0|{0|in|}110|112|}
{2010214001|XXGiport_src_flow|183|0|295|0|{0|}112|17|}
{2010214001|XXGiport_src_flow|184|0|296|0|{1|}112|15|}
{2010007001|XXGobject_proto_object|185|0|297|0|{}110|113|}
{2010212001|XXGvertex_oport_oport|186|0|299|0|{0|out|}113|114|}
{2010006001|XXGobject_psameas_object|187|0|301|0|{metadata|out_metadata|1|0|}114|113|}
{2010211001|XXGvertex_iport_iport|188|0|302|0|{0|in|}113|115|}
{2010006001|XXGobject_psameas_object|189|0|304|0|{metadata|in_metadata|1|0|}115|113|}
{2010006001|XXGobject_psameas_object|190|0|305|0|{Layout|Layout|0|0|}110|48|}
{2010006001|XXGobject_psameas_object|191|0|306|0|{in_metadata|read_metadata|0|0|}110|52|}
{2010006001|XXGobject_psameas_object|192|0|307|0|{out_metadata|read_metadata|0|0|}110|52|}
{2010601001|XXGgraph_vertex_vertex|193|0|308|0|{Input_Ids_File|}1|52|}
{2010601001|XXGgraph_vertex_vertex|194|0|309|0|{Main_IDS|}1|116|}
{2010604001|XXGgraph_flow_flow|195|0|311|0|{Flow_1|}116|117|}
{2010604001|XXGgraph_flow_flow|196|0|313|0|{Flow_2|}116|118|}
{2010604001|XXGgraph_flow_flow|197|0|315|0|{Flow_3|}116|119|}
{2010604001|XXGgraph_flow_flow|198|0|317|0|{Flow_4|}116|120|}
{2010604001|XXGgraph_flow_flow|199|0|319|0|{Flow_8|}116|121|}
{2010601001|XXGgraph_vertex_vertex|200|0|321|0|{Partition_by_Key_and_Sort_1|}116|122|}
{2010604001|XXGgraph_flow_flow|201|0|323|0|{Flow_1|}122|123|}
{2010601001|XXGgraph_vertex_vertex|202|0|325|0|{Partition_by_Key|}122|124|}
{2010212001|XXGvertex_oport_oport|203|0|327|0|{0|out|}124|125|}
{2010213001|XXGoport_dst_flow|204|0|329|0|{0|}125|123|}
{2010211001|XXGvertex_iport_iport|205|0|330|0|{0|in|}124|126|}
{2010006001|XXGobject_psameas_object|206|0|332|0|{in_metadata|out0_metadata|0|0|}124|36|}
{2010006001|XXGobject_psameas_object|207|0|333|0|{out_metadata|out0_metadata|0|0|}124|36|}
{2010601001|XXGgraph_vertex_vertex|208|0|334|0|{Sort|}122|127|}
{2010212001|XXGvertex_oport_oport|209|0|336|0|{0|out|}127|128|}
{2010211001|XXGvertex_iport_iport|210|0|338|0|{0|in|}127|129|}
{2010214001|XXGiport_src_flow|211|0|340|0|{0|}129|123|}
{2010006001|XXGobject_psameas_object|212|0|341|0|{in_metadata|out0_metadata|0|0|}127|36|}
{2010006001|XXGobject_psameas_object|213|0|342|0|{out_metadata|out0_metadata|0|0|}127|36|}
{2010212001|XXGvertex_oport_oport|214|0|343|0|{0|out0|}122|130|}
{2010216002|XXGoport_binding_oport|215|0|345|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}130|128|}
{2010213001|XXGoport_dst_flow|216|0|346|0|{0|}130|119|}
{2010211001|XXGvertex_iport_iport|217|0|347|0|{0|in0|}122|131|}
{2010215002|XXGiport_binding_iport|218|0|349|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}131|126|}
{2010214001|XXGiport_src_flow|219|0|350|0|{0|}131|118|}
{2010007001|XXGobject_proto_object|220|0|351|0|{}122|132|}
{2010604001|XXGgraph_flow_flow|221|0|353|0|{Flow_1|}132|133|}
{2010601001|XXGgraph_vertex_vertex|222|0|355|0|{Partition_by_Key|}132|134|}
{2010212001|XXGvertex_oport_oport|223|0|357|0|{0|out|}134|135|}
{2010213001|XXGoport_dst_flow|224|0|359|0|{0|}135|133|}
{2010211001|XXGvertex_iport_iport|225|0|360|0|{0|in|}134|136|}
{2010007001|XXGobject_proto_object|226|0|362|0|{}134|137|}
{2010212001|XXGvertex_oport_oport|227|0|364|0|{0|out|}137|138|}
{2010006001|XXGobject_psameas_object|228|0|366|0|{metadata|out_metadata|1|0|}138|137|}
{2010211001|XXGvertex_iport_iport|229|0|367|0|{0|in|}137|139|}
{2010006001|XXGobject_psameas_object|230|0|369|0|{metadata|in_metadata|1|0|}139|137|}
{2010006001|XXGobject_psameas_object|231|0|370|0|{Layout|InputLayout|1|0|}134|132|}
{2010006001|XXGobject_psameas_object|232|0|371|0|{key|Key|1|0|}134|132|}
{2010601001|XXGgraph_vertex_vertex|233|0|372|0|{Sort|}132|140|}
{2010212001|XXGvertex_oport_oport|234|0|374|0|{0|out|}140|141|}
{2010211001|XXGvertex_iport_iport|235|0|376|0|{0|in|}140|142|}
{2010214001|XXGiport_src_flow|236|0|378|0|{0|}142|133|}
{2010007001|XXGobject_proto_object|237|0|379|0|{}140|143|}
{2010212001|XXGvertex_oport_oport|238|0|381|0|{0|out|}143|144|}
{2010006001|XXGobject_psameas_object|239|0|383|0|{metadata|out_metadata|1|0|}144|143|}
{2010211001|XXGvertex_iport_iport|240|0|384|0|{0|in|}143|145|}
{2010006001|XXGobject_psameas_object|241|0|386|0|{metadata|in_metadata|1|0|}145|143|}
{2010006001|XXGobject_psameas_object|242|0|387|0|{Layout|OutputLayout|1|0|}140|132|}
{2010006001|XXGobject_psameas_object|243|0|388|0|{key|Key|1|0|}140|132|}
{2010006001|XXGobject_psameas_object|244|0|389|0|{max_core|Max_core|1|0|}140|132|}
{2010212001|XXGvertex_oport_oport|245|0|390|0|{0|out0|}132|146|}
{2010216002|XXGoport_binding_oport|246|0|392|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}146|141|}
{2010211001|XXGvertex_iport_iport|247|0|393|0|{0|in0|}132|147|}
{2010215002|XXGiport_binding_iport|248|0|395|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}147|136|}
{2010006001|XXGobject_psameas_object|249|0|396|0|{InputLayout|Layout|0|0|}122|48|}
{2010006001|XXGobject_psameas_object|250|0|397|0|{OutputLayout|Layout|0|0|}122|148|}
{2010211001|XXGvertex_iport_iport|251|0|399|0|{0|write|}148|149|}
{2010214001|XXGiport_src_flow|252|0|401|0|{0|}149|121|}
{2010007001|XXGobject_proto_object|253|0|402|0|{}148|150|}
{2010211001|XXGvertex_iport_iport|254|0|404|0|{0|write|}150|151|}
{2010006001|XXGobject_psameas_object|255|0|406|0|{metadata|write_metadata|1|0|}151|150|}
{2010601001|XXGgraph_vertex_vertex|256|0|407|0|{Purge_Filter_Latest|}116|152|}
{2010212001|XXGvertex_oport_oport|257|0|409|0|{0|out|}152|153|}
{2010213001|XXGoport_dst_flow|258|0|411|0|{0|}153|118|}
{2010212001|XXGvertex_oport_oport|259|0|412|0|{1|deselect|}152|154|}
{2010213001|XXGoport_dst_flow|260|0|414|0|{0|}154|117|}
{2010212001|XXGvertex_oport_oport|261|0|415|0|{2|reject|}152|155|}
{2010212001|XXGvertex_oport_oport|262|0|417|0|{3|error|}152|156|}
{2010212001|XXGvertex_oport_oport|263|0|419|0|{4|log|}152|157|}
{2010211001|XXGvertex_iport_iport|264|0|421|0|{0|in|}152|158|}
{2010007001|XXGobject_proto_object|265|0|423|0|{}152|159|}
{2010212001|XXGvertex_oport_oport|266|0|425|0|{0|out|}159|160|}
{2010006001|XXGobject_psameas_object|267|0|427|0|{metadata|out_metadata|1|0|}160|159|}
{2010212001|XXGvertex_oport_oport|268|0|428|0|{1|deselect|}159|161|}
{2010006001|XXGobject_psameas_object|269|0|430|0|{metadata|deselect_metadata|1|0|}161|159|}
{2010212001|XXGvertex_oport_oport|270|0|431|0|{2|reject|}159|162|}
{2010006001|XXGobject_psameas_object|271|0|433|0|{metadata|reject_metadata|1|0|}162|159|}
{2010212001|XXGvertex_oport_oport|272|0|434|0|{3|error|}159|163|}
{2010006001|XXGobject_psameas_object|273|0|436|0|{metadata|error_metadata|1|0|}163|159|}
{2010212001|XXGvertex_oport_oport|274|0|437|0|{4|log|}159|164|}
{2010006001|XXGobject_psameas_object|275|0|439|0|{metadata|log_metadata|1|0|}164|159|}
{2010211001|XXGvertex_iport_iport|276|0|440|0|{0|in|}159|165|}
{2010006001|XXGobject_psameas_object|277|0|442|0|{metadata|in_metadata|1|0|}165|159|}
{2010006001|XXGobject_psameas_object|278|0|443|0|{Layout|Layout|0|0|}152|48|}
{2010006001|XXGobject_psameas_object|279|0|444|0|{deselect_metadata|out0_metadata|0|0|}152|36|}
{2010006001|XXGobject_psameas_object|280|0|445|0|{in_metadata|out0_metadata|0|0|}152|36|}
{2010006001|XXGobject_psameas_object|281|0|446|0|{out_metadata|out0_metadata|0|0|}152|36|}
{2010006001|XXGobject_psameas_object|282|0|447|0|{reject_metadata|out0_metadata|0|0|}152|36|}
{2010601001|XXGgraph_vertex_vertex|283|0|448|0|{REDUCED_ICFF_New|}116|148|}
{2010601001|XXGgraph_vertex_vertex|284|0|449|0|{REDUCED_Index_File|}116|166|}
{2010211001|XXGvertex_iport_iport|285|0|451|0|{0|write|}166|167|}
{2010214001|XXGiport_src_flow|286|0|453|0|{0|}167|120|}
{2010007001|XXGobject_proto_object|287|0|454|0|{}166|168|}
{2010211001|XXGvertex_iport_iport|288|0|456|0|{0|write|}168|169|}
{2010006001|XXGobject_psameas_object|289|0|458|0|{metadata|write_metadata|1|0|}169|168|}
{2010601001|XXGgraph_vertex_vertex|290|0|459|0|{Trash|}116|170|}
{2010211001|XXGvertex_iport_iport|291|0|461|0|{0|in|}170|171|}
{2010214001|XXGiport_src_flow|292|0|463|0|{0|}171|117|}
{2010007001|XXGobject_proto_object|293|0|464|0|{}170|172|}
{2010211001|XXGvertex_iport_iport|294|0|466|0|{0|in|}172|173|}
{2010006001|XXGobject_psameas_object|295|0|468|0|{metadata|in_metadata|1|0|}173|172|}
{2010006001|XXGobject_psameas_object|296|0|469|0|{Layout|Layout|0|0|}170|48|}
{2010006001|XXGobject_psameas_object|297|0|470|0|{in_metadata|out0_metadata|0|0|}170|36|}
{2010601001|XXGgraph_vertex_vertex|298|0|471|0|{WBCL_To_reduced_IDS|}116|174|}
{2010212001|XXGvertex_oport_oport|299|0|473|0|{0|out|}174|175|}
{2010213001|XXGoport_dst_flow|300|0|475|0|{0|}175|121|}
{2010212001|XXGvertex_oport_oport|301|0|476|0|{1|index|}174|176|}
{2010213001|XXGoport_dst_flow|302|0|478|0|{0|}176|120|}
{2010212001|XXGvertex_oport_oport|303|0|479|0|{2|address|}174|177|}
{2010211001|XXGvertex_iport_iport|304|0|481|0|{0|in|}174|178|}
{2010214001|XXGiport_src_flow|305|0|483|0|{0|}178|119|}
{2010007001|XXGobject_proto_object|306|0|484|0|{}174|179|}
{2010212001|XXGvertex_oport_oport|307|0|486|0|{0|out|}179|180|}
{2010006001|XXGobject_psameas_object|308|0|488|0|{metadata|out_metadata|1|0|}180|179|}
{2010212001|XXGvertex_oport_oport|309|0|489|0|{1|index|}179|181|}
{2010006001|XXGobject_psameas_object|310|0|491|0|{metadata|index_metadata|1|0|}181|179|}
{2010212001|XXGvertex_oport_oport|311|0|492|0|{2|address|}179|182|}
{2010006001|XXGobject_psameas_object|312|0|494|0|{metadata|address_metadata|1|0|}182|179|}
{2010211001|XXGvertex_iport_iport|313|0|495|0|{0|in|}179|183|}
{2010006001|XXGobject_psameas_object|314|0|497|0|{metadata|in_metadata|1|0|}183|179|}
{2010006001|XXGobject_psameas_object|315|0|498|0|{Layout|Layout|0|0|}174|148|}
{2010006001|XXGobject_psameas_object|316|0|499|0|{in_metadata|out0_metadata|0|0|}174|36|}
{2010006001|XXGobject_psameas_object|317|0|500|0|{out_metadata|write_metadata|0|0|}174|148|}
{2010211001|XXGvertex_iport_iport|318|0|501|0|{0|in0|}116|184|}
{2010215002|XXGiport_binding_iport|319|0|503|0|{.5|.5|{0|}13813|}184|158|}
{2010214001|XXGiport_src_flow|320|0|504|0|{0|}184|20|}
{2010601001|XXGgraph_vertex_vertex|321|0|505|0|{Purge_Filter_Archive|}1|185|}
{2010212001|XXGvertex_oport_oport|322|0|507|0|{0|out|}185|186|}
{2010213001|XXGoport_dst_flow|323|0|509|0|{0|}186|21|}
{2010212001|XXGvertex_oport_oport|324|0|510|0|{1|deselect|}185|187|}
{2010213001|XXGoport_dst_flow|325|0|512|0|{0|}187|19|}
{2010212001|XXGvertex_oport_oport|326|0|513|0|{2|reject|}185|188|}
{2010212001|XXGvertex_oport_oport|327|0|515|0|{3|error|}185|189|}
{2010212001|XXGvertex_oport_oport|328|0|517|0|{4|log|}185|190|}
{2010211001|XXGvertex_iport_iport|329|0|519|0|{0|in|}185|191|}
{2010214001|XXGiport_src_flow|330|0|521|0|{0|}191|18|}
{2010007001|XXGobject_proto_object|331|0|522|0|{}185|192|}
{2010212001|XXGvertex_oport_oport|332|0|524|0|{0|out|}192|193|}
{2010006001|XXGobject_psameas_object|333|0|526|0|{metadata|out_metadata|1|0|}193|192|}
{2010212001|XXGvertex_oport_oport|334|0|527|0|{1|deselect|}192|194|}
{2010006001|XXGobject_psameas_object|335|0|529|0|{metadata|deselect_metadata|1|0|}194|192|}
{2010212001|XXGvertex_oport_oport|336|0|530|0|{2|reject|}192|195|}
{2010006001|XXGobject_psameas_object|337|0|532|0|{metadata|reject_metadata|1|0|}195|192|}
{2010212001|XXGvertex_oport_oport|338|0|533|0|{3|error|}192|196|}
{2010006001|XXGobject_psameas_object|339|0|535|0|{metadata|error_metadata|1|0|}196|192|}
{2010212001|XXGvertex_oport_oport|340|0|536|0|{4|log|}192|197|}
{2010006001|XXGobject_psameas_object|341|0|538|0|{metadata|log_metadata|1|0|}197|192|}
{2010211001|XXGvertex_iport_iport|342|0|539|0|{0|in|}192|198|}
{2010006001|XXGobject_psameas_object|343|0|541|0|{metadata|in_metadata|1|0|}198|192|}
{2010006001|XXGobject_psameas_object|344|0|542|0|{Layout|Layout|0|0|}185|48|}
{2010006001|XXGobject_psameas_object|345|0|543|0|{deselect_metadata|read_metadata|0|0|}185|52|}
{2010006001|XXGobject_psameas_object|346|0|544|0|{in_metadata|read_metadata|0|0|}185|52|}
{2010006001|XXGobject_psameas_object|347|0|545|0|{out_metadata|read_metadata|0|0|}185|52|}
{2010006001|XXGobject_psameas_object|348|0|546|0|{reject_metadata|read_metadata|0|0|}185|52|}
{2010601001|XXGgraph_vertex_vertex|349|0|547|0|{Reformat|}1|36|}
{2010601001|XXGgraph_vertex_vertex|350|0|548|0|{Reformat_Re_Calculate_Hash|}1|199|}
{2010212001|XXGvertex_oport_oport|351|0|550|0|{0|out0|}199|200|}
{2010212001|XXGvertex_oport_oport|352|0|552|0|{1|reject0|}199|201|}
{2010212001|XXGvertex_oport_oport|353|0|554|0|{2|error0|}199|202|}
{2010212001|XXGvertex_oport_oport|354|0|556|0|{3|log|}199|203|}
{2010211001|XXGvertex_iport_iport|355|0|558|0|{0|in|}199|204|}
{2010007001|XXGobject_proto_object|356|0|560|0|{}199|205|}
{2010212001|XXGvertex_oport_oport|357|0|562|0|{0|out0|}205|206|}
{2010006001|XXGobject_psameas_object|358|0|564|0|{metadata|out0_metadata|1|0|}206|205|}
{2010006001|XXGobject_psameas_object|359|0|565|0|{transform0|transform0|1|0|}206|205|}
{2010212001|XXGvertex_oport_oport|360|0|566|0|{1|reject0|}205|207|}
{2010006001|XXGobject_psameas_object|361|0|568|0|{metadata|reject0_metadata|1|0|}207|205|}
{2010212001|XXGvertex_oport_oport|362|0|569|0|{2|error0|}205|208|}
{2010006001|XXGobject_psameas_object|363|0|571|0|{metadata|error0_metadata|1|0|}208|205|}
{2010212001|XXGvertex_oport_oport|364|0|572|0|{3|log|}205|209|}
{2010006001|XXGobject_psameas_object|365|0|574|0|{metadata|log_metadata|1|0|}209|205|}
{2010211001|XXGvertex_iport_iport|366|0|575|0|{0|in|}205|210|}
{2010006001|XXGobject_psameas_object|367|0|577|0|{metadata|in_metadata|1|0|}210|205|}
{2010601001|XXGgraph_vertex_vertex|368|0|578|0|{Version_Log|}1|211|}
{2010605001|XXGgraph_legend_legend|369|0|580|0|{0|}211|212|}
{2010241001|XXGlegend_face_face|370|0|582|0|{}212|213|}
{2010605001|XXGgraph_legend_legend|371|0|584|0|{1|}211|214|}
{2010241001|XXGlegend_face_face|372|0|586|0|{}214|215|}
{2010605001|XXGgraph_legend_legend|373|0|588|0|{2|}211|216|}
{2010241001|XXGlegend_face_face|374|0|590|0|{}216|217|}
{2010605001|XXGgraph_legend_legend|375|0|592|0|{3|}211|218|}
{2010241001|XXGlegend_face_face|376|0|594|0|{}218|219|}
{2010605001|XXGgraph_legend_legend|377|0|596|0|{4|}211|220|}
{2010241001|XXGlegend_face_face|378|0|598|0|{}220|221|}
{2010605001|XXGgraph_legend_legend|379|0|600|0|{5|}211|222|}
{2010241001|XXGlegend_face_face|380|0|602|0|{}222|223|}
{2010605001|XXGgraph_legend_legend|381|0|604|0|{6|}211|224|}
{2010241001|XXGlegend_face_face|382|0|606|0|{}224|225|}
{2010605001|XXGgraph_legend_legend|383|0|608|0|{7|}211|226|}
{2010241001|XXGlegend_face_face|384|0|610|0|{}226|227|}
{2010605001|XXGgraph_legend_legend|385|0|612|0|{8|}211|228|}
{2010241001|XXGlegend_face_face|386|0|614|0|{}228|229|}
{2010605001|XXGgraph_legend_legend|387|0|616|0|{9|}211|230|}
{2010241001|XXGlegend_face_face|388|0|618|0|{}230|231|}
{2010605001|XXGgraph_legend_legend|389|0|620|0|{10|}211|232|}
{2010241001|XXGlegend_face_face|390|0|622|0|{}232|233|}
{2010605001|XXGgraph_legend_legend|391|0|624|0|{11|}211|234|}
{2010241001|XXGlegend_face_face|392|0|626|0|{}234|235|}
{2010109001|XXGobject_property_value|393|0|628|0|{0|TrackingThumbprint|72|}1|236|}
