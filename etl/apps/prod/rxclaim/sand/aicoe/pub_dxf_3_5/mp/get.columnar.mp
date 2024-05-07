@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|1512|rel_count|2520|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|3.5.4.0|3|9|P|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";|8|1|FKl|Provides functions and types to use in PDL.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|IDS_PATH|$PUB_DATAHUB_MFS_LOOKUP|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_SERIAL_PATH|$PUB_DATAHUB_SERIAL_LOOKUP|3|9|EFK|@{0|}}
{30001002|XXparameter|RUN_ID|$[(datetime("YYYYMMDDHH24MISS")) now()]|3|9|FK|@{0|}}
{30001002|XXparameter|START_CHANGES_TIME|$[ (string(""))(datetime("YYYY-MM-DD HH24:MI:SS")) (date("YYYY-MM-DD"))(today() - 1)]|3|9|EFK|Optional: YYYY-MM-DD HH24:MI:SS: The time to use to start selecting new or updated records or records changing effectiveness.  Defaults to "", which means include all dates.|{0|}}
{30001002|XXparameter|END_CHANGES_TIME|$[ (string(""))(datetime("YYYY-MM-DD HH24:MI:SS"))now() ]|3|9|FK|YYYY-MM-DD HH24:MI:SS: The time to use to stop selecting new or updated records or records changing effectiveness.  Defaults to now.|{0|}}
{30001002|XXparameter|IS_READ_ARCHIVE|False|13|9|FK|@{0|}}
{30001002|XXparameter|MAX_NUM_COLUMNAR_READ|4|1|9|K|@{0|}}
{30001002|XXparameter|MAIN_DATASET||3|9|FK|@{0|}}
{30001002|XXparameter|FILTER_COLUMNS|@3|9|FK|@{0|}}
{30001002|XXparameter|FILTER_EXPR||3|9|FK|@{0|}}
{30001002|XXparameter|GET_COLUMN_LIST|claim_nbr,claim_seq_nbr,claim_stat_id,mbr_sk,cag_sk,src_env_sk,prod_adjud_sk,cag_sk,rej_cd1_sk,rej_cd2_sk,pst_dispensing_fee_cont|3|9|FK|User configured columns required from columnar|{0|}}
{30001002|XXparameter|MAIN_DATASET_NK|$[get_ids_table_nk(MAIN_DATASET)]|3|9|K|@{0|}}
{30001002|XXparameter|NK_COLUMNS_VEC|$[begin
let string("") v_nk_and_hk=string_concat("dxf_hk_part1;dxf_hk_part2;ids_updt_dttm;" ,string_replace(string_replace(MAIN_DATASET_NK,"\{",""),"\}",""));
let string("")[int] v_nk_vec = string_split(v_nk_and_hk,";") ;
let string("")[int] v_final_nk_vec = for ( let n in v_nk_vec) : string_lrtrim(n) ;
result :: v_final_nk_vec ;
end ]|3|9|K|This Parameter will contain hk and nk of dataset|{0|}}
{30001002|XXparameter|NK_RECORD_DML|$[begin
let string("") v_sub_area=string_split(MAIN_DATASET,".")[0];
let string("") v_all_dml_file_vec=string_concat(PUB_DATAHUB_DML,"/",v_sub_area,"/",MAIN_DATASET,".dml");
let dml_field_info_vec v_current_record_info_vec=record_info(read_type(v_all_dml_file_vec));
let string("")[int] v_current_col_info_vec=record_info_item_expanded(read_type(v_all_dml_file_vec),item="name");
let int count=length_of(NK_COLUMNS_VEC);
let int vec_index=0;
let string("") expr="";
let int j=0;
 for ( j, j< count )
           begin
                  vec_index=vector_search(v_current_col_info_vec,comparison_element = NK_COLUMNS_VEC[j] );
                  expr= expr + v_current_record_info_vec[vec_index].dml_type + " " + v_current_record_info_vec[vec_index].name + " = " + v_current_record_info_vec[vec_index].default + ";" + "\\n" ;
               end
      
result :: " record" + "\\n" + expr + "\\n" + "end" ;
end ]|3|9|K|Position of element in DML|{0|}}
{30001002|XXparameter|IGNORE_COLUMNAR_DML_LIST|ids_rxclaim.f_claim_transaction.c1.dml|3|9|K|@{0|}}
{30001002|XXparameter|ALL_COLUMNAR_DML_VEC|$[begin
        let string("") v_sub_area=string_split(MAIN_DATASET,".")[0];
        let string("")[int] v_ignore_dml_vec=string_split(IGNORE_COLUMNAR_DML_LIST,"\|");
        let string("")[int] v_all_dml_file_vec=directory_listing(string_concat(PUB_DATAHUB_DML,"/",v_sub_area,"/"),string_concat(MAIN_DATASET,".c*.dml"));
        result :: vector_difference(v_all_dml_file_vec,v_ignore_dml_vec);
end ]|3|9|K|@{0|}}
{30001002|XXparameter|ALL_UNIQUE_COLUMN_PRESENT|$[begin
let int v_num_of_dml_files_to_read=length_of(ALL_COLUMNAR_DML_VEC);
let string("") v_current_dml="";
let int i=0;
let string("")[int] v_combine_columns_vec=allocate_with_defaults();
let string("")[int] v_current_col_vec=allocate_with_defaults();
let string("") v_sub_area=string_split(MAIN_DATASET,".")[0];
let string("") v_dml_path=string_concat(PUB_DATAHUB_DML,"/",v_sub_area,"/");
for(i, i < v_num_of_dml_files_to_read )
    begin
         v_current_dml=ALL_COLUMNAR_DML_VEC[i];
         v_current_col_vec=record_info_item_expanded(read_type(v_dml_path +v_current_dml),item = "name");
         v_combine_columns_vec = vector_concat(v_combine_columns_vec,v_current_col_vec);
    end 
result :: string_join(v_combine_columns_vec,",");
 end  ]|3|9|K|All unique column present in all columnars|{0|}}
{30001002|XXparameter|COLUMNAR_MATCH_INFO|$[begin
let string("")[int] v_required_col_vec = string_split(GET_COLUMN_LIST,",");
let string("")[int] current_col_vec=allocate_with_defaults();
let string("")[int] matching_col_vec=allocate_with_defaults();
let string("")[int] non_matching_col_vec=allocate_with_defaults();
let int v_num_of_columnar=length_of(ALL_COLUMNAR_DML_VEC);
let int i=0;
let string("") v_current_dml="";
let string("") v_find_matching_column="";
let string("") v_sub_area=string_split(MAIN_DATASET,".")[0];
let string("") v_dml_path=string_concat(PUB_DATAHUB_DML,"/",v_sub_area,"/");
let record
      decimal(2)  num_of_matching_col = 0;
      decimal(2)  num_of_non_matching_col = 0;
      string(",") matching_dml;
end[int] col_match_info_vec= allocate_with_defaults();;


    for (i, i < v_num_of_columnar)
       begin
         v_current_dml=ALL_COLUMNAR_DML_VEC[i];
         current_col_vec=record_info_item_expanded(read_type(v_dml_path +v_current_dml),item = "name");
          matching_col_vec=vector_intersection(v_required_col_vec,current_col_vec);
          non_matching_col_vec=vector_difference(v_required_col_vec,current_col_vec);
          col_match_info_vec=vector_append(col_match_info_vec, [record  num_of_matching_col length_of(matching_col_vec) ,num_of_non_matching_col length_of(non_matching_col_vec) ,  matching_dml  v_current_dml ]) ;
          //v_find_matching_column= string_concat(v_find_matching_column ,(string("")) (decimal("")) length_of(matching_col_vec),",",v_current_dml ,  "\|" );   
      end 
result :: vector_sort (col_match_info_vec ,\{num_of_non_matching_col ascending;num_of_matching_col descending\}) ;
end ]|3|9|K|This provides the number of colmnars |{0|}}
{30001002|XXparameter|COLUMNARS_READ_INFO_VEC|$[begin
let string("")[int] v_required_col_vec = vector_sort_dedup_first(string_split(GET_COLUMN_LIST,","));
let int v_num_of_columns_to_read=length_of(v_required_col_vec);
let string("") read_columnar_file="";
let string("") read_columnar_dml="";
let string("") v_base_dataset_nm=string_split(MAIN_DATASET,".")[1];
let int max_columnars_to_read=MAX_NUM_COLUMNAR_READ;
let int i=0;
let string("") v_current_dml="";
let string("") v_columnar_identifier="";
let string("") v_find_matching_column="";
let string("") v_sub_area=string_split(MAIN_DATASET,".")[0];
let string("") v_dml_path=string_concat(PUB_DATAHUB_DML,"/",v_sub_area,"/");
let string("")[int] v_combine_columns=allocate_with_defaults();
let record
      string("") columnar_file ;
      string("") columnar_dml;
end[int] columar_read_info_vec= allocate_with_defaults();;
begin block define_columnars_top
for(i, i < max_columnars_to_read )
    begin
           
           if((COLUMNAR_MATCH_INFO[i].num_of_matching_col == v_num_of_columns_to_read) && (COLUMNAR_MATCH_INFO[i].num_of_non_matching_col == 0 )) 
                  begin 
                       v_columnar_identifier=string_split(COLUMNAR_MATCH_INFO[i].matching_dml,".")[2];
                        read_columnar_file= PUB_DATAHUB_MFS_LOOKUP + "/ids/" + v_sub_area + "/columnar/" + v_base_dataset_nm +"." + v_columnar_identifier + ".dat.gz" ;
                        read_columnar_dml= PUB_DATAHUB_DML + "/" + v_sub_area + "/" + MAIN_DATASET +"." + v_columnar_identifier + ".dml" ;
                        columar_read_info_vec= vector_append(columar_read_info_vec ,[record  columnar_file read_columnar_file ,columnar_dml read_columnar_dml ] );
                       exit define_columnars_top ;
                  end 
             
            if(length_of(vector_difference(v_required_col_vec,v_combine_columns))!=0)
                 begin
                      v_columnar_identifier=string_split(COLUMNAR_MATCH_INFO[i].matching_dml,".")[2];
                      read_columnar_file= PUB_DATAHUB_MFS_LOOKUP + "/ids/" + v_sub_area +  "/columnar/" + v_base_dataset_nm +"." + v_columnar_identifier + ".dat.gz"  ;
                      read_columnar_dml= PUB_DATAHUB_DML + "/" + v_sub_area + "/" + MAIN_DATASET +"." + v_columnar_identifier + ".dml" ;
                      v_combine_columns=vector_sort_dedup_first(vector_concat(v_combine_columns,record_info_item_expanded(read_type(v_dml_path +COLUMNAR_MATCH_INFO[i].matching_dml),item = "name")));
                      columar_read_info_vec= vector_append(columar_read_info_vec ,[record  columnar_file read_columnar_file ,columnar_dml read_columnar_dml ] );
                 end
             if(length_of(vector_difference(v_required_col_vec,v_combine_columns))==0)
                 begin
                     exit define_columnars_top ; 
                 end
    end       
end block define_columnars_top
result :: columar_read_info_vec;
 end  ]|3|9|K|This Parameter will derive the best columnar datasets info|{0|}}
{30001002|XXparameter|GENERATE_OUT_DML_VEC|$[begin
let dml_field_info_vec v_info_vec = allocate_with_defaults();
let string("")[int] dml_found_vec = for ( let n in COLUMNARS_READ_INFO_VEC) : n.columnar_dml ;
let string("")[int] v_int_required_col_vec = string_split(GET_COLUMN_LIST,",");
let string("")[int] v_required_col_vec = vector_difference(v_int_required_col_vec,NK_COLUMNS_VEC);
let int dml_count=length_of(dml_found_vec);
let string("")[int] v_current_col_info_vec=allocate_with_defaults();
let string("")[int] v_columnar_out_dml=allocate_with_defaults();
let string("")[int] v_columns_found_so_far=allocate_with_defaults();
let int column_count=length_of(v_required_col_vec);
let string("") expr="";
let int i=0;
let int j=0;
let vec_index=0;
for (i,i<dml_count)
   begin
     expr="";
     v_info_vec=record_info(read_type(COLUMNARS_READ_INFO_VEC[i].columnar_dml));
     v_current_col_info_vec=record_info_item_expanded(read_type(COLUMNARS_READ_INFO_VEC[i].columnar_dml),item="name");
      j=0;
       for ( j, j< column_count )
           begin
             if( (v_required_col_vec[j] member v_current_col_info_vec ) and not (v_required_col_vec[j] member v_columns_found_so_far )  )
               begin
                  vec_index=vector_search(v_current_col_info_vec,comparison_element = v_required_col_vec[j] );
                  expr= expr + v_info_vec[vec_index].dml_type + " " + v_info_vec[vec_index].name +  " = " + v_info_vec[vec_index].default + ";" + "\\n" ;
                  v_columns_found_so_far=vector_append(v_columns_found_so_far,v_required_col_vec[j]);
               end
           end 
             expr= "record " + "\\n" +  expr + "end ;";
  v_columnar_out_dml=vector_append(v_columnar_out_dml,expr) ;
    end
result :: for ( let p in v_columnar_out_dml) : join_types(NK_RECORD_DML,p);
end
 ]|3|9|K|This parameter will generate output dml with required columns for every DML that has to be used |{0|}}
{30001002|XXparameter|IS_ALL_COLUMN_PRESENT|$[begin
let string("")[int] v_required_col_vec = string_split(GET_COLUMN_LIST,",");
let int v_num_of_dml_files_to_read=length_of(COLUMNARS_READ_INFO_VEC);
let string("") v_current_dml="";
let int i=0;
let string("")[int] v_combine_columns_vec=allocate_with_defaults();
let string("")[int] v_current_col_vec=allocate_with_defaults();
for(i, i < v_num_of_dml_files_to_read )
    begin
         v_current_dml=COLUMNARS_READ_INFO_VEC[i].columnar_dml;
         v_current_col_vec=record_info_item_expanded(read_type(COLUMNARS_READ_INFO_VEC[i].columnar_dml),item = "name");
         v_combine_columns_vec = vector_concat(v_combine_columns_vec,v_current_col_vec);
    end 
result :: if(length_of(vector_difference(vector_sort_dedup_first(v_required_col_vec),vector_sort_dedup_first(v_combine_columns_vec)))==0 ) 1 else 0;
 end  ]|3|9|K|This value must be 1 and detrmines that all columns required in get column list are found in matching columnars|{0|}}
{30001002|XXparameter|COMBINE_CLEAN_DML_BASE|$[begin
        let string("") v_final_dml="record \\n end ";
        let count=length_of(GENERATE_OUT_DML_VEC);
        let int i=0;
                for (i,i<count)
                  begin
                   v_final_dml=join_types(v_final_dml,GENERATE_OUT_DML_VEC[i]);
                 end 
result :: v_final_dml;
end
]|3|9|K|This DML will be base for clean and combined dml output|{0|}}
{30001002|XXparameter|JOIN_XFR|$[begin 
let string("") v_join_xfr="";

let string("")[int] v_column_info=allocate_with_defaults();
let string("")[int] v_non_nk_column_info=allocate_with_defaults();
let int i=0;
let int j=0;
let int out_dml_count=length_of(GENERATE_OUT_DML_VEC);
let string("") v_xfr_prefix= if(out_dml_count ==2 ) "out::join(in0,in1)=  \\n begin " else if (out_dml_count ==3  ) "out::join(in0,in1,in2)=  \\n begin "
                             else if (out_dml_count ==4  ) "out::join(in0,in1,in2,in3)=  \\n begin " else "";



for(i,i<out_dml_count)
    begin
      v_column_info=record_info_item_expanded(GENERATE_OUT_DML_VEC[i],item="name"); 
      v_non_nk_column_info=vector_difference(v_column_info,NK_COLUMNS_VEC);
      j=0;
      for(j,j<length_of(v_non_nk_column_info))
          begin
           v_join_xfr= v_join_xfr + "\\n" + "out." +v_non_nk_column_info[j] +" :: " + "in" + (string("")) (decimal("")) i + "." + v_non_nk_column_info[j] + " ;";
          end 
    end

result :: v_xfr_prefix + v_join_xfr + "\\n" + "out.*::in0.* ;" + "\\n"+  "end" ;
end ]|3|9|K|@{0|}}
{30001002|XXparameter|JOIN_COUNT|$[length_of(GENERATE_OUT_DML_VEC)]|1|9|K|@{0|}}
{30001002|XXparameter|___Output_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|SOURCE_SYSTEM|$[string_split(MAIN_DATASET,".")[0]]|3|9|FK|@{0|}}
{30001002|XXparameter|DO_SOURCE|0|1|9|RFK|0 or 1: Whether or not to produce the source file.  Defaults to 1 (True).|{0|}}
{30001002|XXparameter|DO_CLEAN|1|1|9|RFK|0 or 1: Whether or not to produce a clean file.  Defaults to 0 (False).|{0|}}
{30001002|XXparameter|DO_LOOKUP|0|1|9|RFK|0 or 1: Whether or not to produce a lookup file.  Defaults to 0 (False).  Note that lookup files also have parameters for subsetting their DML and for sorting, dedup'ing, and managing overlapping intervals, based on a lookup key, etc.|{0|}}
{30001002|XXparameter|SOURCE_LOWER||3|9|FK|@{0|}}
{30001002|XXparameter|GET_DML_PLUS_HEADER|$[join_types(read_type("/~$PUB_DXF_DML/dxf_header.dml"),COMBINE_CLEAN_DML_BASE)]|3|9|K|@{0|}}
{30001002|XXparameter|SOURCE_DML|$[ if ( not DO_SOURCE ) "" else GET_DML_PLUS_HEADER ]|3|9|FK|The record format of the source file.  Defaults to the input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|CLEAN_DML|$[ if ( not DO_CLEAN ) "" else GET_DML_PLUS_HEADER ]|3|9|FK|The record format of the output file.  Defaults to the input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|SOURCE_FILE_URL|$[ if ( not DO_SOURCE ) "" else "mfile:" + AI_MFS + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_LOWER + "." + (string(""))RUN_ID + ".dat.gz" ]|3|9|K|Optional: Used by the ACE to view the source file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|CLEAN_FILE_URL|$[ if ( not DO_CLEAN ) "" else "mfile:" + AI_MFS + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_LOWER + "." +(string("")) RUN_ID + ".dat.gz" ]|3|9|K|Optional: Used by the ACE to view the clean file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|LOOKUP_FILE_URL|$[ if ( not DO_LOOKUP ) "" else "file:" + AI_SERIAL_LOOKUP + "/lookup." + SOURCE_SYSTEM + "/lookup." + SOURCE_LOWER + ".dat" ]|3|9|K|Optional: Used by the ACE to view the lookup file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|SOURCE_DML_FILE|$[ if ( not DO_SOURCE ) "" else AI_DML + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_LOWER + ".dml" ]|3|9|K|The DML file to use for the "source" results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|CLEAN_DML_FILE|$[ if ( not DO_CLEAN ) "" else AI_DML + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_LOWER + ".dml" ]|3|9|K|The DML file to use for the results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|LOOKUP_DML_FILE|$[ if ( not DO_LOOKUP ) "" else AI_DML + "/lookup." + SOURCE_SYSTEM + "/lookup." + SOURCE_LOWER + ".dml" ]|3|9|RK|The DML file to use for the resulting lookup, if any.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|LOOKUP_FIELDS_KEY||3|9|FK|Optional: \{field_1; field_2, ...\}: A list of fields that should be included in the lookup DML.|{0|}}
{30001002|XXparameter|LOOKUP_FIELD_NAME_VEC|$[ for ( let k in key_info(LOOKUP_FIELDS_KEY) ) : k.field_name ]|3|9|RK|A vector of field names in the lookup fields key.|{0|}}
{30001002|XXparameter|LOOKUP_KEY||3|9|EFK|\{field_1; ...; field_n\}: Optional: The key to use for lookup.  When present, a serial lookup file will be produced.|{0|}}
{30001002|XXparameter|LOOKUP_DML|$[ add_fields(
    "record\\nend",
    for ( let f in record_info(GET_DML_PLUS_HEADER) ) :
      if ( LOOKUP_FIELD_NAME_VEC == [vector] or f.name member LOOKUP_FIELD_NAME_VEC )
        f)
]|3|9|RFK|The record format for any lookup output file.  Defaults to the input DML, plus a DMF header, reduced to the fields specified in the lookup fields key.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$[
begin
let string("") field = "";
for(let key in key_info(LOOKUP_KEY)) begin block eff_dt_fld_nm
  for(let modifiers in key.modifiers) if(starts_with(modifiers, "interval_bottom")) begin
    field = key.field_name;
    exit eff_dt_fld_nm;
  end    
end block eff_dt_fld_nm
result ::  field;
end
]|3|9|FK|Optional: The name of the field that contains the start of the interval, if any.  This is often set to the effective start date.  Defaults to the interval_bottom field in the lookup key, if any.|{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$[
begin
let string("") field = "";
for(let key in key_info(LOOKUP_KEY)) begin block eff_dt_fld_nm
  for(let modifiers in key.modifiers) if(starts_with(modifiers, "interval_top")) begin
    field = key.field_name;
    exit eff_dt_fld_nm;
  end    
end block eff_dt_fld_nm
result ::  field;
end
]|3|9|FK|Optional: The name of the field that contains the end of the interval, if any.  This is often set to the effective end date or termination date.  Defaults to the interval_top field in the lookup key, if any.|{0|}}
{30001002|XXparameter|DO_FIX_INTERVAL|$[if(EFFECTIVE_DATE_FIELD_NAME == "" && END_DATE_FIELD_NAME == "") 0 else 1]|13|9|FK|@{0|}}
{30001002|XXparameter|FIX_END_DATE|$[DO_FIX_INTERVAL]|13|9|RFK||{0|}}
{30001002|XXparameter|FIX_EFFECTIVE_DATE|False|13|9|RFK||{0|}}
{30001002|XXparameter|DEFAULT_DEDUP_SORT_KEY|// This must be set appropriately in the intermediate pset.|3|9|FK|\{field_1; ...; field_n\}: The prefered extra dedup sort key.  Only fields that are present in the target table will be used.|{0|}}
{30001002|XXparameter|EXTRA_DEDUP_SORT_KEY|$[ make_key(
  for ( let k in key_info(DEFAULT_DEDUP_SORT_KEY) ) :
    if ( k.field_name member LOOKUP_FIELD_NAME_VEC )
      k)
]|3|9|FK|\{field_1; ...; field_n\}: A key with the extra fields to sort on before deduping by the effective natural key (the first record is kept).  Defaults to a standard set of keys from DEFAULT_DEDUP_SORT_KEY, if those fields are present.|{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$[ make_key(vector_concat(
    key_info(re_replace(re_replace(LOOKUP_KEY, " interval_bottom;.*", "\}"), " interval_bottom overlapping;.*", "\}")),
    key_info(EXTRA_DEDUP_SORT_KEY)))
]|3|9|RO|\{field_1; ...; field_n\}: Fields to sort on for dedup.|{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|1|3|9|FK|#: The number of microseconds between adjacent effective and end dates.  Typically 1 or 1000000 (a second) or 86400000000 (a day).|{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$[ [vector EFFECTIVE_DATE_FIELD_NAME] ]|3|9|RFK|A vector of fields that are to be preserved from the earlier record when two matching, adjacent records are merged.  Typically, this is anything related to the start date.|{0|}}
{30001002|XXparameter|AB_ALLOW_GRAPH_IN_COMPONENT|true|13|9|EK|@{0|}}
{30001002|XXparameter|___Data_Suppression_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|True|13|9|RFK|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION.__copy_was_declaration|1|3|9|PH|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|icff.maintenence|Mukesh.Singh|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1295000|708000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{2|1|1|}Job 'get.columnar' Execution Status Report

Job completed successfully at Tuesday, August 28, 2018 17:31:43
Run performed by user jchavan1
||echo "Maintenance Processing Started for : $IDS_DATASET" 
|#Move processed files to /processed directory
if [ $mpjret -eq 0 ]
then
       echo " Graph complted , running end Scripts now " 
 #If Xref is ICFF type then go ahead with renaming of xref created in process .
#Taking backup of existing Xref file to bkp file 
  if [[ ( -f $INPUT_ICFF_XREF_DATA_FILE )  && ( -f $INPUT_ICFF_XREF_IDX_FILE ) && ("$\{IS_XREF_AN_ICFF\}"=="Y") ]];then
        echo "Renaming INPUT_ICFF_XREF_DATA_FILE :$INPUT_ICFF_XREF_DATA_FILE to Backup Xref file :-$INPUT_ICFF_XREF_BKP_DATA_FILE "
        m_mv $INPUT_ICFF_XREF_DATA_FILE $INPUT_ICFF_XREF_BKP_DATA_FILE
                if [ $? -ne 0 ];then
                    echo " failed to rename INPUT_ICFF_XREF_DATA_FILE :$INPUT_ICFF_XREF_DATA_FILE to Backup Xref file :-$INPUT_ICFF_XREF_DATA_FILE "
                    exit 12
                fi 
        echo " Renaming INPUT_ICFF_XREF_IDX_FILE :$INPUT_ICFF_XREF_BKP_IDX_FILE to Backup Xref IDX file :-$INPUT_ICFF_XREF_BKP_IDX_FILE " 
        m_mv $INPUT_ICFF_XREF_IDX_FILE $INPUT_ICFF_XREF_BKP_IDX_FILE
                        if [ $? -ne 0 ];then
                                        echo " failed to rename INPUT_ICFF_XREF_IDX_FILE :$INPUT_ICFF_XREF_BKP_IDX_FILE to Backup Xref IDX file :-$INPUT_ICFF_XREF_BKP_IDX_FILE "
                                exit 12
                         fi 
       fi
# Now renaming .new  xref file to main files 
   if [[ ( -f $OUTPUT_ICFF_XREF_DATA_FILE )  && ( -f $OUTPUT_ICFF_XREF_IDX_FILE ) && ("$\{IS_XREF_AN_ICFF\}"=="Y")  ]];then
         echo "Renaming OUTPUT_ICFF_XREF_IDX_FILE :$OUTPUT_ICFF_XREF_IDX_FILE to Main xref ICFF file :-$INPUT_ICFF_XREF_IDX_FILE "
         m_mv $OUTPUT_ICFF_XREF_DATA_FILE $INPUT_ICFF_XREF_DATA_FILE
                if [ $? -ne 0 ];then
                    echo " failed to rename  new xref : OUTPUT_ICFF_XREF_DATA_FILE :$INPUT_ICFF_XREF_DATA_FILE to Main XREF ICFF file :-$INPUT_ICFF_XREF_DATA_FILE "
                    exit 12
               fi 
        echo " Renaming DX  OUTPUT_ICFF_XREF_IDX_FILE :$OUTPUT_ICFF_XREF_IDX_FILE to Main xref ICFF file :-$INPUT_ICFF_XREF_IDX_FILE "
        m_mv $OUTPUT_ICFF_XREF_IDX_FILE $INPUT_ICFF_XREF_IDX_FILE
            if [ $? -ne 0 ];then
                    echo " failed to rename  new xref IDX  OUTPUT_ICFF_XREF_IDX_FILE :$OUTPUT_ICFF_XREF_IDX_FILE to Main xref ICFF file :-$INPUT_ICFF_XREF_IDX_FILE "
                    exit 12
                fi 
       fi
   
 echo $IDS_DATASET >> $RUN_ID_FILE
 echo " Maintenenace run successfull with RUN ID : $RUN_ID"
else
        echo "Graph Failed"
fi
|@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV_3.5-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial Rounded MT Bold|128|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Read Columnar to Create Clean File|258794|60155|109000|35000|927000|56000|15510|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|32768|360|1|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}15706|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.328000009059906|{12|493000|354000|513000|354000|554000|354000|554000|204000|639000|204000|660000|204000|}15578|2065|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.7534246444702148|{12|493000|384000|523000|384000|610000|384000|610000|309000|639000|309000|660000|309000|}15588|2065|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.3378378450870514|{0|}15580|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}15708|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}15710|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}15712|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}15688|17|}}
{2010501005|XXGpvertex|15|0|29|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Join.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|$\{JOIN_XFR\}|3|3|c|@{0|}}
{30001002|XXparameter|condition|$[JOIN_COUNT > 1 ]|3|9||@{0|}}
{30001002|XXparameter|conditionInputPort|in*|3|2|$|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in3_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|$\{COMBINE_CLEAN_DML_BASE\}|3|3|c|@{0|}}
{30001002|XXparameter|unused0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused3_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject3_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error2_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error3_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Join|385000|325000|0|0|0|0|15690|Join-4 input|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|16|0|31|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|17|0|34|0|{@{}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|18|0|36|0|{@{}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|19|0|38|0|{@{}@0|0|0|0|unused2|0.0|count|unused|2|1168|0|}}
{2010203004|XXGoport|20|0|40|0|{@{}@0|0|0|0|unused3|0.0|count|unused|3|1168|0|}}
{2010203004|XXGoport|21|0|42|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|22|0|44|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|23|0|46|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|24|0|48|0|{@{}@0|0|0|0|reject3|0.0|count|reject|3|1168|0|}}
{2010203004|XXGoport|25|0|50|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|26|0|52|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|27|0|54|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|28|0|56|0|{@{}@0|0|0|0|error3|0.0|count|error|3|1176|0|}}
{2010203004|XXGoport|29|0|58|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|30|0|60|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|31|0|63|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010202004|XXGiport|32|0|66|0|{@{}@0|0|0|0|in2|0.0|count|in|2|1808|0|}}
{2010202004|XXGiport|33|0|69|0|{@{}@0|0|0|0|in3|0.0|count|in|3|1808|0|}}
{2010501005|XXGpvertex|34|0|72|0|{Performs inner, outer, and semi-joins with multiple flows of data records. It maximizes performance by loading input data records into main memory.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?join|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|4|1|1|Fl|Number of inputs to join function|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not sorted. In this case, JOIN processes the data in-memory without sorting it.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|_min_count|2|1|2|FH$|Minimum number of inputs to join|{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field(s) on which to join|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required DML function|{0|}}
{30001002|XXparameter|join_type|Inner Join (matching records required on all inputs)|15|1|Fl|Handling for duplicate and missing key values|{3|Inner Join (matching records required on all inputs)|Full Outer Join (use null for missing records)|Explicit|}}
{30001002|XXparameter|join_type.display_name|join-type|3|9|P|@{0|}}
{30001002|XXparameter|show_interface|True|13|1|Hl|Whether to show the interface parameter|{0|}}
{30001002|XXparameter|show_interface.update_clauses|update_value True|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface|version-3-2-2|15|1|Fl|Controls whether to use the legacy interface or the improved Co>Operating System Version 3.2.2 and later parameter interface.  Specifically, it controls whether to use the legacy record-required parameter with inverted booleans or the Version 3.2.2 record-match-required parameter with normal booleans. The choice of parameter-interface is compatible with all Co>Operating System versions except when count is greater than 5 in which case older Co>Operating Systems will fail with the version-3-2-2 interface.|{2|version-3-2-2|legacy|}}
{30001002|XXparameter|parameter_interface.display_name|parameter-interface|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface.condition|version 3.2: param show_interface True param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|parameter_interface.update_clauses|update_value legacy|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface_internal|value join-type Inner* legacy value join-type Full* legacy sameas parameter-interface default dollar_substitution version-3-2-2|3|13|v|Sets the value of the internal parameter interface|{0|}}
{30001002|XXparameter|parameter_interface_internal.display_name|parameter-interface-internal|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required0.display_name|record-match-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required1|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required2|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required3|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required1.display_name|record-match-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required0|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required2|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required3|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|dedup1|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup2|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup3|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select0||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|select1||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select2||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select3||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not0.display_name|record-match-required-not0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not1|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not2|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not3|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not1.display_name|record-match-required-not1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll0|value record-match-required0 F* True value record-match-required0 T* False value record-match-required0 f* True value record-match-required0 t* False value record-match-required0 0 True value record-match-required0 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll0.display_name|record-match-required-not-unroll0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll0.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll1|value record-match-required1 F* True value record-match-required1 T* False value record-match-required1 f* True value record-match-required1 t* False value record-match-required1 0 True value record-match-required1 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll1.display_name|record-match-required-not-unroll1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll1.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll2|value record-match-required2 F* True value record-match-required2 T* False value record-match-required2 f* True value record-match-required2 t* False value record-match-required2 0 True value record-match-required2 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll2.display_name|record-match-required-not-unroll2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll2.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll3|value record-match-required3 F* True value record-match-required3 T* False value record-match-required3 f* True value record-match-required3 t* False value record-match-required3 0 True value record-match-required3 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll3.display_name|record-match-required-not-unroll3|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll3.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll4|value record-match-required4 F* True value record-match-required4 T* False value record-match-required4 f* True value record-match-required4 t* False value record-match-required4 0 True value record-match-required4 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll4.display_name|record-match-required-not-unroll4|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll4.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems|value record-match-required5 * True default constant False|13|13|Kv|Interface protection parameter|{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.display_name|join-mpc-interface-3-2-supports-maximum-count-of-5-in-older-cooperating-systems|3|9|P|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.keyword|join-mpc-interface-3-2-supports-maximum-count-of-5-in-older-cooperating-systems|3|9|P|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.condition|version :3.2.1.r9 param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen3|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_display_values|True(recordrequiredonthisinput) False(usenullformissingrecord)|3|2|H$||{0|}}
{30001002|XXparameter|record_required_display_values.display_name|record-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|dedup_display_values|Donotdedupthisinput Dedupthisinputbeforejoining|3|2|H$||{0|}}
{30001002|XXparameter|dedup_display_values.display_name|dedup-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_display_values|False(usenullformissingrecord) True(recordrequiredonthisinput)|3|2|H$||{0|}}
{30001002|XXparameter|record_match_required_display_values.display_name|record-match-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_positional1|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional2|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional3|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional0|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional0.display_name|matchoptional-positional0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional1|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional2|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional3|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional1.display_name|matchoptional-positional1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional2|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional3|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
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
{30001002|XXparameter|select_positional2|sameas select|20|13|Ov|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional3|sameas select|20|13|Ov|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword2|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword3|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword0|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword0.display_name|matchoptional-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword1|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword2|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword3|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword1.display_name|matchoptional-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword2|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword3|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
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
{30001002|XXparameter|select_keyword2|sameas select|20|13|Kv|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword3|sameas select|20|13|Kv|Filter expression before join function|{0|}}
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
{30001002|XXparameter|override_key2||19|2|FK$|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key3||19|2|FK$|Alternate name(s) for join key(s)|{0|}}
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
{30001002|XXparameter|check_sort|False|13|1|FKl|Always check sort order on inputs|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 3.0.1.r9: param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|sql_null_comparisons|False|13|1|FKl|When matching against null fields, use SQL semantics instead of DML semantics|{0|}}
{30001002|XXparameter|sql_null_comparisons.display_name|sql-null-comparisons|3|9|P|@{0|}}
{30001002|XXparameter|sql_null_comparisons.keyword|sql-null-comparisons|3|9|P|@{0|}}
{30001002|XXparameter|sql_null_comparisons.condition|version 3.3.1.r3:|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::join(in[*])|3|2|H$|Join transform|{0|}}
{30001002|XXparameter|sorted_mpname|merge-join|3|2|H$||{0|}}
{30001002|XXparameter|sorted_mpname.display_name|sorted-mpname|3|9|P|@{0|}}
{30001002|XXparameter|memory_mpname|hash-join|3|2|H$||{0|}}
{30001002|XXparameter|memory_mpname.display_name|memory-mpname|3|9|P|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp max-memory max-core dedup singlematch dedup-keyword singlematch record-required matchoptional record-required-keyword matchoptional select-keyword select record-required-positional matchoptional dedup-positional singlematch matchoptional-keyword matchoptional matchoptional-positional matchoptional|3|2|H$||{0|}}
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
{30001002|XXparameter|port_analysis|reject*=in*; unused*=in*; error*=^error|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=join(*);unused=join(*)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|error_port_type error <parameter error0_metadata>|3|2|H$|Type for make_error output|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in[*])|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in[*])|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in[*])|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in2_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in3_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|unused0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|unused1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|unused2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|unused3_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject3_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error3_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,unused[*],reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1543507694|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: unused = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
{30001002|XXparameter|record_match_required2.display_name|record-match-required2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required2.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required2.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required2.display_name|record-required2|3|9|P|@{0|}}
{30001002|XXparameter|record_required2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_required2.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required2.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|dedup2.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|select2.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.display_name|record-match-required-not2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_positional2.display_name|record-required-positional2|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional2.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional2.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional2.display_name|matchoptional-positional2|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional2.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional2.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional2.display_name|dedup-positional2|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional2.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional2.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional2.display_name|select-positional2|3|9|P|@{0|}}
{30001002|XXparameter|select_positional2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|select_positional2.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional2.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword2.display_name|record-required-keyword2|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.display_name|matchoptional-keyword2|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword2.display_name|dedup-keyword2|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword2.display_name|select-keyword2|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key2.display_name|override-key2|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required3.display_name|record-match-required3|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required3.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required3.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required3.display_name|record-required3|3|9|P|@{0|}}
{30001002|XXparameter|record_required3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|record_required3.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required3.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|dedup3.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|select3.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not3.display_name|record-match-required-not3|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not3.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not3.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen3.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen3.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_positional3.display_name|record-required-positional3|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional3.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional3.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional3.display_name|matchoptional-positional3|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional3.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional3.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional3.display_name|dedup-positional3|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional3.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional3.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional3.display_name|select-positional3|3|9|P|@{0|}}
{30001002|XXparameter|select_positional3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|select_positional3.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional3.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword3.display_name|record-required-keyword3|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword3.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword3.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword3.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword3.display_name|matchoptional-keyword3|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword3.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword3.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword3.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword3.display_name|dedup-keyword3|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword3.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword3.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword3.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword3.display_name|select-keyword3|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword3.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword3.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword3.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key3.display_name|override-key3|3|9|P|@{0|}}
{30001002|XXparameter|override_key3.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|override_key3.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key3.condition|version 2.1:|3|15|P?|@{0|}}
}}@0|Join|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|35|0|74|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|36|0|77|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|37|0|80|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|38|0|83|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused2|0.0|count|unused|2|1168|0|}}
{2010203004|XXGoport|39|0|86|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused3|0.0|count|unused|3|1168|0|}}
{2010203004|XXGoport|40|0|89|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|41|0|92|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|42|0|95|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|43|0|98|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject3|0.0|count|reject|3|1168|0|}}
{2010203004|XXGoport|44|0|101|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|45|0|104|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|46|0|107|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|47|0|110|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error3|0.0|count|error|3|1176|0|}}
{2010203004|XXGoport|48|0|113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|49|0|116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|select0||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required0.display_name|record-match-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional0.display_name|matchoptional-positional0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword0.display_name|matchoptional-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not0||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not0.display_name|record-match-required-not0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|50|0|134|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|select1||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required1.display_name|record-match-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup1||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional1.display_name|matchoptional-positional1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword1.display_name|matchoptional-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not1||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not1.display_name|record-match-required-not1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010202004|XXGiport|51|0|152|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|record_match_required2||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required2.display_name|record-match-required2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required2.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required2.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required2||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required2.display_name|record-required2|3|9|P|@{0|}}
{30001002|XXparameter|record_required2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_required2.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required2.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup2||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|dedup2.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select2||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|select2.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not2.display_name|record-match-required-not2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_positional2||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional2.display_name|record-required-positional2|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional2.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional2.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional2||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional2.display_name|matchoptional-positional2|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional2.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional2.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional2||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional2.display_name|dedup-positional2|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional2.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional2.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional2||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional2.display_name|select-positional2|3|9|P|@{0|}}
{30001002|XXparameter|select_positional2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|select_positional2.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional2.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword2||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword2.display_name|record-required-keyword2|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword2||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword2.display_name|matchoptional-keyword2|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword2||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword2.display_name|dedup-keyword2|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword2||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword2.display_name|select-keyword2|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key2||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key2.display_name|override-key2|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.condition|version 2.1:|3|15|P?|@{0|}}
}}@0|0|0|0|in2|0.0|count|in|2|1808|0|}}
{2010202004|XXGiport|52|0|170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|record_match_required3||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required3.display_name|record-match-required3|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required3.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required3.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required3||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required3.display_name|record-required3|3|9|P|@{0|}}
{30001002|XXparameter|record_required3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|record_required3.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required3.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup3||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|dedup3.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select3||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|select3.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not3||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not3.display_name|record-match-required-not3|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not3.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not3.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen3||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen3.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen3.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_positional3||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional3.display_name|record-required-positional3|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional3.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional3.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional3||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional3.display_name|matchoptional-positional3|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional3.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional3.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional3||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional3.display_name|dedup-positional3|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional3.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional3.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional3||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional3.display_name|select-positional3|3|9|P|@{0|}}
{30001002|XXparameter|select_positional3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|select_positional3.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional3.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword3||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword3.display_name|record-required-keyword3|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword3.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword3.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword3.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword3||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword3.display_name|matchoptional-keyword3|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword3.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword3.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword3.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword3||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword3.display_name|dedup-keyword3|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword3.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword3.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword3.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword3||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword3.display_name|select-keyword3|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword3.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword3.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword3.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key3||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key3.display_name|override-key3|3|9|P|@{0|}}
{30001002|XXparameter|override_key3.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|override_key3.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key3.condition|version 2.1:|3|15|P?|@{0|}}
}}@0|0|0|0|in3|0.0|count|in|3|1808|0|}}
{2010501005|XXGpvertex|53|0|188|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
}}@1|@57000|160500|77000|181000|135000|93000|9935|Map to Output|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|54|0|190|0|{@{}@211000|194000|11000|11000|source|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|55|0|192|0|{@{}@384|.5|0.0|{12|222000|199000|242000|199000|242000|199000|242000|104000|745000|104000|766000|104000|}9932|17|}}
{2010203004|XXGoport|56|0|194|0|{@{}@211000|224000|11000|11000|clean|0.0|count|out|1|2448|0|}}
{2010210004|XXGflow|57|0|196|0|{@{}@384|.5|.1120000034570694|{8|222000|229000|252000|229000|740000|229000|761000|229000|}9933|17|}}
{2010203004|XXGoport|58|0|198|0|{@{}@211000|254000|11000|11000|lkp|0.0|count|out|2|2448|0|}}
{2010210004|XXGflow|59|0|200|0|{@{}@384|.5|0.0|{12|222000|259000|242000|259000|242000|259000|242000|339000|299000|339000|320000|339000|}9934|17|}}
{2010203004|XXGoport|60|0|202|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|61|0|204|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|62|0|206|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|63|0|208|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|64|0|210|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|65|0|212|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|66|0|214|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|67|0|216|0|{@{}@67000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|68|0|219|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$DO_SOURCE|3|9||@{0|}}
{30001002|XXparameter|Layout|$SOURCE_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/source.$SOURCE_SYSTEM/source.$SOURCE_LOWER.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$SOURCE_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|4\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|condition\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_conditional_comp_starts_c\|\}\}\{56\|Conditional components should start with a capital C.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_output_compressed_file_extension_functions\|\}\}\{56\|Compressed files should be written using dataset extension .gz
\|\}\}\}\}|3|9|P|@{0|}}
}}@1|@1081913|220000|671000|180000|56000|50000|15693|Optional: Source|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|69|0|221|0|{@{}@661000|199000|11000|11000|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|70|0|224|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1543507692|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|71|0|226|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|72|0|229|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$DO_CLEAN|3|9||@{0|}}
{30001002|XXparameter|Layout|$CLEAN_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/clean.$SOURCE_SYSTEM/clean.$SOURCE_LOWER.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$CLEAN_DML_FILE|3|2|f$|@{0|}}
}}@1|@1082913|370000|671000|285000|56000|50000|15691|Optional: Clean|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|73|0|231|0|{@{}@661000|304000|11000|11000|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|74|0|234|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1543507692|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|75|0|236|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|76|0|239|0|{|{}@1|@472000|414500|494000|435000|56000|50000|9941|Dups|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|77|0|241|0|{@{}@484000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010210004|XXGflow|78|0|243|0|{@{}@384|.5|.5|{10|409000|398000|409000|418000|409000|459000|462000|459000|483000|459000|}9940|2065|}}
{2010501005|XXGpvertex|79|0|248|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|45000|88500|0|0|0|0|15145|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|80|0|250|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|81|0|252|0|{@{}@384|.5|.5|{0|}15144|17|}}
{2010203004|XXGoport|82|0|254|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|83|0|256|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|84|0|258|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|85|0|260|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|86|0|263|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Filter by Expression|450000|84250|0|0|0|0|15719|Filter by Expression-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|87|0|265|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|88|0|267|0|{@{}@384|.5|.5|{0|}15718|17|}}
{2010203004|XXGoport|89|0|269|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|90|0|271|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|91|0|273|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|92|0|275|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|93|0|277|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|94|0|279|0|{@{}@384|.5|.5|{0|}15751|17|}}
{2010501005|XXGpvertex|95|0|284|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|45000|88500|0|0|0|0|15138|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|96|0|286|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|97|0|288|0|{@{}@384|.5|.5|{0|}15137|17|}}
{2010203004|XXGoport|98|0|290|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|99|0|292|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|100|0|294|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|101|0|296|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|102|0|299|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Filter by Expression|450000|289250|0|0|0|0|15449|Filter by Expression-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|103|0|301|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|104|0|303|0|{@{}@384|.5|.5|{0|}15737|17|}}
{2010203004|XXGoport|105|0|305|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|106|0|307|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|107|0|309|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|108|0|311|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|109|0|313|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|110|0|315|0|{@{}@384|.5|.5|{0|}15756|17|}}
{2010501005|XXGpvertex|111|0|319|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|45000|88500|0|0|0|0|15138|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|112|0|321|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|113|0|323|0|{@{}@384|.5|.5|{0|}15137|17|}}
{2010203004|XXGoport|114|0|325|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|115|0|327|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|116|0|329|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|117|0|331|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|118|0|334|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Filter by Expression|450000|289250|0|0|0|0|15449|Filter by Expression-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|119|0|336|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|120|0|338|0|{@{}@384|.5|.5|{0|}15737|17|}}
{2010203004|XXGoport|121|0|340|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|122|0|342|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|123|0|344|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|124|0|346|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|125|0|348|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|126|0|350|0|{@{}@384|.5|.5|{0|}15756|17|}}
{2010501005|XXGpvertex|127|0|354|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
}}@0|Reformat|45000|88500|0|0|0|0|15138|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|128|0|356|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|129|0|358|0|{@{}@384|.5|.5|{0|}15137|17|}}
{2010203004|XXGoport|130|0|360|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|131|0|362|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|132|0|364|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|133|0|366|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|134|0|369|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Filter by Expression|450000|289250|0|0|0|0|15449|Filter by Expression-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|135|0|371|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|136|0|373|0|{@{}@384|.5|.5|{0|}15737|17|}}
{2010203004|XXGoport|137|0|375|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|138|0|377|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|139|0|379|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|140|0|381|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|141|0|383|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|142|0|385|0|{@{}@384|.5|.5|{0|}15756|17|}}
{2010503005|XXGfvertex|143|0|398|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$DO_LOOKUP|3|9||@{0|}}
{30001002|XXparameter|Layout|$LOOKUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$LOOKUP_FILE_URL", "pdl") create_update 1 is_db 0]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
}}@1|@1080913|510000|671000|390000|56000|50000|15692|Optional: Lookup|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|144|0|400|0|{@{}@661000|409000|11000|11000|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|145|0|403|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1543507692|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|146|0|405|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|147|0|409|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/prepare_output.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|FIX_END_DATE|$[DO_FIX_INTERVAL]|3|9||@{0|}}
{30001002|XXparameter|FIX_EFFECTIVE_DATE|False|3|9||@{0|}}
}}@0|@640000|340631|317000|338000|892000|502000|15694|Prepare Output|Kimbo Mundy|Created 12/5/2013 10:59:43 PM|1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|891000|525000|1|}}
{2010240003|XXGlegend|148|0|411|0|{@{}@Disabled if no lookup key|316000|250000|336000|270000|145000|16000|9843|}}
{2010242002|XXGface|149|0|413|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|150|0|415|0|{@{}@Always
Disabled|786000|395000|806000|415000|50000|32000|9896|}}
{2010242002|XXGface|151|0|417|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|152|0|419|0|{@{}@Disabled if no 
lookup key|621000|235000|641000|260000|82000|32000|9897|}}
{2010242002|XXGface|153|0|421|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|154|0|423|0|{@{}@Enabled if no 
lookup key|621000|445000|641000|465000|79000|32000|9875|}}
{2010242002|XXGface|155|0|425|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|156|0|429|0|{@{}@384|.5|.5|{8|499000|334000|529000|334000|624000|334000|645000|334000|}9920|1043|}}
{2010210004|XXGflow|157|0|432|0|{@{}@384|.5|1.0|{12|716000|334000|736000|334000|771000|334000|771000|379000|771000|379000|792000|379000|}9902|17|}}
{2010210004|XXGflow|158|0|434|0|{@{}@384|.5|.5|{12|499000|344000|519000|344000|569000|344000|569000|434000|620000|434000|641000|434000|}9921|19|}}
{2010210004|XXGflow|159|0|437|0|{@{}@384|.5|1.0|{12|712000|434000|732000|434000|771000|434000|771000|389000|771000|389000|792000|389000|}9903|17|}}
{2010501005|XXGpvertex|160|0|439|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@769000|75000|777000|84000|54000|41000|9858|Copy Out|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|161|0|441|0|{@{}@830000|99000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|162|0|443|0|{@{}@767000|99000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|163|0|449|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@764000|200000|772000|209000|54000|41000|9859|Copy Out.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|164|0|451|0|{@{}@825000|224000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|165|0|453|0|{@{}@762000|224000|11000|11000|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|166|0|459|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|INPUT_DML||3|8|s=|@{0|}}
}}@0|@310336|269500|331000|292000|884000|534000|9946|Dedup and Fix Intervals|Kimbo Mundy|Created 12/6/2013 6:52:46 PM|1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|884000|533000|1|}}
{2010240003|XXGlegend|167|0|461|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|168|0|463|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|169|0|465|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|170|0|467|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|171|0|469|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|172|0|471|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|173|0|473|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6826|}}
{2010242002|XXGface|174|0|475|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|175|0|477|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|176|0|479|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|177|0|481|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6818|17|}}
{2010210004|XXGflow|178|0|483|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6817|20|}}
{2010210004|XXGflow|179|0|485|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6833|17|}}
{2010210004|XXGflow|180|0|487|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6834|17|}}
{2010210004|XXGflow|181|0|489|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6828|17|}}
{2010210004|XXGflow|182|0|491|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6815|17|}}
{2010501005|XXGpvertex|183|0|493|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|184|0|495|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|185|0|498|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|186|0|500|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|187|0|502|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|188|0|504|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|189|0|506|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|190|0|514|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|191|0|516|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|192|0|519|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|193|0|523|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|194|0|525|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|195|0|527|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|196|0|533|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@479000|385000|499000|405000|129000|107000|6816|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|197|0|535|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|198|0|538|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|199|0|540|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|200|0|542|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|201|0|544|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|202|0|551|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@477000|176000|497000|196000|139000|107000|6835|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|203|0|553|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|204|0|556|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|205|0|558|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|206|0|560|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|207|0|562|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|208|0|569|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@328000|62062|348000|82000|106000|89000|6819|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|209|0|571|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|210|0|574|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|211|0|580|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@131000|387000|151000|407000|135000|107000|6829|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|212|0|582|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|213|0|585|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|214|0|591|0|{@{}@488000|329000|11000|21000|out|.5|@@@14352|0|}}
{2010203004|XXGoport|215|0|596|0|{@{}@404000|387000|11000|11000|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|216|0|600|0|{@{}@321000|334000|11000|11000|in|.5|@@@14096|0|}}
{2010501005|XXGpvertex|217|0|606|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@642000|401500|652000|416000|50000|41000|9899|Gather|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|218|0|608|0|{@{}@701000|429000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|219|0|611|0|{@{}@642000|429000|11000|11000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|220|0|616|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@793000|351500|803000|366000|50000|41000|9904|Gather.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|221|0|618|0|{@{}@852000|379000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|222|0|620|0|{@{}@793000|374000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|223|0|628|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@646000|298500|656000|313000|50000|41000|9901|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|224|0|630|0|{@{}@705000|329000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|225|0|633|0|{@{}@646000|329000|11000|11000|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|226|0|638|0|{@{}@482000|349000|11000|11000|source|.16666666666666666|@@@14352|0|}}
{2010203004|XXGoport|227|0|642|0|{@{}@482000|379000|11000|11000|clean|.5|@@@14352|0|}}
{2010203004|XXGoport|228|0|646|0|{@{}@482000|409000|11000|11000|lookup|.8333333333333333|@@@14736|0|}}
{2010202004|XXGiport|229|0|650|0|{@{}@307000|379000|11000|11000|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|230|0|654|0|{Subgraph created from graph "clean.db_edw"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LOOKUP_KEY|$LOOKUP_KEY|3|9|FK|\{key1; key2...\}: Optional: A key that can optionally end with either an interval field or a pair of interval bottom and top feilds.  All key fields must be present in the input DML.  If this is omitted, then you must explictly specify the other parameters.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$EFFECTIVE_DATE_FIELD_NAME|3|9|FK|Optional: The name of the field that contains the start of the interval, if any.  This is often set to the effective start date.  Defaults to the interval_bottom field in the lookup key, if any.|{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$END_DATE_FIELD_NAME|3|9|FK|Optional: The name of the field that contains the end of the interval, if any.  This is often set to the effective end date or termination date.  Defaults to the interval_top field in the lookup key, if any.|{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|$ADJACENT_INTERVAL_MICROSECONDS|3|9|FK|#: The number of microseconds between adjacent effective and end dates.  Typically 1 or 1000000 (a second) or 86400000000 (a day).|{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$DEDUP_SORT_KEY|3|9|RFK|\{key1; key2...\}: The key to sort by, before the dedup.  All key fields must be present in the input DML.  Defaults to a value based on the dedup key.  For Type 2 loads, set this to the dedup key plus the end effective date.  We keep the shorter records on the theory that they would be newer.|{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$KEEP_FROM_FIRST_VEC|3|9|RFK|A vector of fields that should be copied from the earlier record when two matching, adjacent records are merged.  Defaults to the effective date and DMF matching effective date, if any.|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|STEP|get|3|9|RFK|The step name.  Used to prefix the Dups reject file name.|{0|}}
{30001002|XXparameter|DUP_FILE_URL|mfile:$AI_MFS_REJECT/$STEP.$SOURCE_SYSTEM/$STEP.$SOURCE_LOWER.dups.dat.gz|3|9|FK|@{0|}}
{30001002|XXparameter|FIX_END_DATE|False|13|9|RFK||{0|}}
{30001002|XXparameter|FIX_EFFECTIVE_DATE|False|13|9|RFK||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1546507981|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|@260000|290678|0|0|892000|502000|0|prepare_output|||1|100|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|891000|502000|3|}}
{2010240003|XXGlegend|231|0|656|0|{@{}@Disabled if no lookup key|316000|250000|336000|270000|145000|16000|9843|}}
{2010242002|XXGface|232|0|658|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|233|0|660|0|{@{}@Always
Disabled|786000|395000|806000|415000|50000|32000|9896|}}
{2010242002|XXGface|234|0|662|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|235|0|664|0|{@{}@Disabled if no 
lookup key|621000|235000|641000|260000|82000|32000|9897|}}
{2010242002|XXGface|236|0|666|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|237|0|668|0|{@{}@Enabled if no 
lookup key|621000|445000|641000|465000|79000|32000|9875|}}
{2010242002|XXGface|238|0|670|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|239|0|672|0|{@{}@384|.5|0.0|{12|222000|259000|242000|259000|242000|259000|242000|339000|299000|339000|320000|339000|}9934|17|}}
{2010210004|XXGflow|240|0|674|0|{@{}@384|.5|.1120000034570694|{8|222000|229000|252000|229000|740000|229000|761000|229000|}9933|17|}}
{2010210004|XXGflow|241|0|676|0|{@{}@384|.5|.5|{8|499000|334000|529000|334000|624000|334000|645000|334000|}9920|1043|}}
{2010210004|XXGflow|242|0|678|0|{@{}@384|.5|.5|{10|409000|398000|409000|418000|409000|459000|462000|459000|483000|459000|}9940|2065|}}
{2010210004|XXGflow|243|0|680|0|{@{}@384|.5|1.0|{12|716000|334000|736000|334000|771000|334000|771000|379000|771000|379000|792000|379000|}9902|17|}}
{2010210004|XXGflow|244|0|682|0|{@{}@384|.5|.5|{12|499000|344000|519000|344000|569000|344000|569000|434000|620000|434000|641000|434000|}9921|19|}}
{2010210004|XXGflow|245|0|684|0|{@{}@384|.5|0.0|{12|222000|199000|242000|199000|242000|199000|242000|104000|745000|104000|766000|104000|}9932|17|}}
{2010210004|XXGflow|246|0|686|0|{@{}@384|.5|1.0|{12|712000|434000|732000|434000|771000|434000|771000|389000|771000|389000|792000|389000|}9903|17|}}
{2010501005|XXGpvertex|247|0|688|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@1|@769000|75000|777000|84000|54000|41000|9858|Copy Out|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|248|0|690|0|{@{}@830000|99000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|249|0|692|0|{@{}@767000|99000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|250|0|695|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1379520141|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|251|0|697|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|252|0|700|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|253|0|703|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@1|@764000|200000|772000|209000|54000|41000|9859|Copy Out.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|254|0|705|0|{@{}@825000|224000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|255|0|707|0|{@{}@762000|224000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|256|0|710|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1379520141|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|257|0|712|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|258|0|715|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|259|0|718|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/dedup_and_fix_intervals.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|LOOKUP_KEY|$LOOKUP_KEY|3|9||@{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$EFFECTIVE_DATE_FIELD_NAME|3|9||@{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$END_DATE_FIELD_NAME|3|9||@{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|$ADJACENT_INTERVAL_MICROSECONDS|3|9||@{0|}}
{30001002|XXparameter|UNDATED_NATURAL_KEY|$[
begin
let dml_key_info_vec final_key = [vector];
for(let key in key_info(LOOKUP_KEY)) begin
  if(key.modifiers == [vector]) begin
    final_key = vector_append(final_key, key);
  end
  for(let modifiers in key.modifiers) if(not starts_with(modifiers, "interval_bottom") && not starts_with(modifiers, "interval_top")) begin
    final_key = vector_append(final_key, key);
  end    
end
result ::  make_key(final_key);
end
]|3|9||@{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$DEDUP_SORT_KEY|3|9||@{0|}}
{30001002|XXparameter|FIX_END_DATE||3|8|=|@{0|}}
{30001002|XXparameter|FIX_EFFECTIVE_DATE||3|8|=|@{0|}}
{30001002|XXparameter|INPUT_DML||3|8|s=|@{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$KEEP_FROM_FIRST_VEC|3|9||@{0|}}
{30001002|XXparameter|condition|$[ DO_LOOKUP and LOOKUP_KEY != "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|3|1|l|@{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|$|@{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|$|@{0|}}
}}@0|@310336|269500|331000|292000|884000|534000|9946|Dedup and Fix Intervals|Kimbo Mundy|Created 12/6/2013 6:52:46 PM|1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|884000|533000|1|}}
{2010240003|XXGlegend|260|0|720|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|261|0|722|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|262|0|724|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|263|0|726|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|264|0|728|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|265|0|730|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|266|0|732|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6826|}}
{2010242002|XXGface|267|0|734|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|268|0|736|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|269|0|738|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|270|0|740|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6818|17|}}
{2010210004|XXGflow|271|0|742|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6817|20|}}
{2010210004|XXGflow|272|0|744|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6833|17|}}
{2010210004|XXGflow|273|0|746|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6834|17|}}
{2010210004|XXGflow|274|0|748|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6828|17|}}
{2010210004|XXGflow|275|0|750|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6815|17|}}
{2010501005|XXGpvertex|276|0|752|0|{|{}@1|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|277|0|754|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|278|0|757|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|279|0|759|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|280|0|761|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|281|0|763|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|282|0|765|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|283|0|768|0|{|{}@1|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|284|0|770|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|285|0|773|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|286|0|775|0|{|{}@1|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|287|0|777|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|288|0|779|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|289|0|782|0|{|{}@1|@479000|385000|499000|405000|129000|107000|6816|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|290|0|784|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|291|0|787|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|292|0|789|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|293|0|791|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|294|0|793|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|295|0|796|0|{|{}@1|@477000|176000|497000|196000|139000|107000|6835|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|296|0|798|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|297|0|801|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|298|0|803|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|299|0|805|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|300|0|807|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|301|0|810|0|{|{}@1|@328000|62062|348000|82000|106000|89000|6819|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|302|0|812|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|303|0|815|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|304|0|818|0|{|{}@1|@131000|387000|151000|407000|135000|107000|6829|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|305|0|820|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|306|0|823|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|307|0|826|0|{@{}@488000|329000|11000|21000|out|.5|@@@14352|0|}}
{2010203004|XXGoport|308|0|831|0|{@{}@404000|387000|11000|11000|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|309|0|835|0|{@{}@321000|334000|11000|11000|in|.5|@@@14096|0|}}
{2010600005|XXGgraph|310|0|839|0|{Subgraph created from graph "kimbo"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "/~$PUB_DXF_XFR/keys.xfr";|3|9|RK||{0|}}
{30001002|XXparameter|LOOKUP_KEY|\{nk1; nk2; eff_dt interval_bottom; end_dt interval_top\}|3|9|FK|\{key1; key2...\}: Optional: A key that can optionally end with either an interval field or a pair of interval bottom and top feilds.  All key fields must be present in the input DML.  If this is omitted, then you must explictly specify the other parameters.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$[ re_match_replace(LOOKUP_KEY,
    ".*; *(.*) interval_bottom; *(.*) interval_top",
    "$1")
]|3|9|FK|Optional: The name of the field that contains the start of the interval, if any.  This is often set to the effective start date.  Defaults to the interval_bottom field in the lookup key, if any.|{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$[ re_match_replace(LOOKUP_KEY,
    ".*; *(.*) interval_bottom; *(.*) interval_top",
    "$2")
]|3|9|FK|Optional: The name of the field that contains the end of the interval, if any.  This is often set to the effective end date or termination date.  Defaults to the interval_top field in the lookup key, if any.|{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|86400|3|9|FK|#: The number of microseconds between adjacent effective and end dates.  Typically 1 or 1000000 (a second) or 86400000000 (a day).|{0|}}
{30001002|XXparameter|UNDATED_NATURAL_KEY|$[ re_replace(LOOKUP_KEY,
    "; *[^;]* interval_bottom;.*",
    "\}")
]|3|9|RFK|The lookup key minus any interval range.  For Type 2 loads, this should be set to the natural key.  Defaults to a the lookup key without any interval fields.|{0|}}
{30001002|XXparameter|PARTITION_KEY|$UNDATED_NATURAL_KEY|3|9|RFK|The key to partition on before processing.  For Type 2 loads, this should be set to the list natural key, if any, or else the natural key.  Defaults to the undated natural key.|{0|}}
{30001002|XXparameter|DEDUP_KEY|$[ if ( EFFECTIVE_DATE_FIELD_NAME == "" )
    UNDATED_NATURAL_KEY
  else
    add_key(UNDATED_NATURAL_KEY,
      key_info(EFFECTIVE_DATE_FIELD_NAME)[0])
]|3|9|RFK|\{key1; key2...\}: The key to use in the dedup.  All key fields must be present in the input DML.  Defaults to a value based on the lookup key.  For Type 2 loads, set this to the natural key plus the effective date descending.|{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$[ if ( END_DATE_FIELD_NAME == "" )
    DEDUP_KEY
  else
    add_key(DEDUP_KEY,
      key_info(END_DATE_FIELD_NAME)[0])
]|3|9|RFK|\{key1; key2...\}: The key to sort by, before the dedup.  All key fields must be present in the input DML.  Defaults to a value based on the dedup key.  For Type 2 loads, set this to the dedup key plus the end effective date.  We keep the shorter records on the theory that they would be newer.|{0|}}
{30001002|XXparameter|CHECK_KEYS|$[ if ( not starts_with_key(DEDUP_SORT_KEY, PARTITION_KEY) )
    force_error("The Partition Key is not a prefix of the Dedup Sort Key.  Partition Key: " + PARTITION_KEY + ", Dedup Sort Key: " + DEDUP_SORT_KEY)
  else if ( not starts_with_key(DEDUP_KEY, PARTITION_KEY) )
    force_error("The Partition Key is not a prefix of the Dedup Key.  Partition Key: " + PARTITION_KEY + ", Dedup Key: " + DEDUP_KEY)
  else if ( not starts_with_key(DEDUP_SORT_KEY, DEDUP_KEY) )
    force_error("The Dedup Key is not a prefix of the Dedup Sort Key.  Dedup Key: " + DEDUP_KEY + ", Dedup Sort Key: " + DEDUP_SORT_KEY)
  else if ( not starts_with_key(DEDUP_KEY, UNDATED_NATURAL_KEY) )
    force_error("The Undated Natural Key is not a prefix of the Dedup Key.  Undated Natural Key: " + UNDATED_NATURAL_KEY + ", Dedup Key: " + DEDUP_KEY)
  else
    ""
]|3|9|K|Returns "" if there is no problem with the consistency of the keys.  Otherwise, forces an error.  Note that you must reference this parameter in order to force it to be evaluated at run time.|{0|}}
{30001002|XXparameter|FIX_END_DATE|True|13|9|RFK|@{0|}}
{30001002|XXparameter|FIX_EFFECTIVE_DATE|False|13|9|RFK|@{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_DIRECTION|$[ CHECK_KEYS + if ( FIX_EFFECTIVE_DATE ) "ascending" else "descending" ]|3|9|RK|The direction to sort the effective date field, if any.  This is based on whether we have an end date or not.|{0|}}
{30001002|XXparameter|ADJUSTED_DEDUP_SORT_KEY|$[ set_field_direction(DEDUP_SORT_KEY, EFFECTIVE_DATE_FIELD_NAME, EFFECTIVE_DATE_DIRECTION) ]|3|9|RK|The dedup sort key adjusted so that any effective date has the right ascending or descending ordering.  This depends on whether there is an end date.|{0|}}
{30001002|XXparameter|ADJUSTED_DEDUP_KEY|$[ set_field_direction(DEDUP_KEY, EFFECTIVE_DATE_FIELD_NAME, EFFECTIVE_DATE_DIRECTION) ]|3|9|RK|The dedup key adjusted so that any effective date has the right ascending or descending ordering.  This depends on whether there is an end date.|{0|}}
{30001002|XXparameter|INPUT_DML||7|1|RFsl|The full DML used in this subgraph.|{0|}}
{30001002|XXparameter|INPUT_FIELD_NAME_VEC|$[ record_info_item(INPUT_DML, "name") ]|3|9|RK|A vector of field names in the input DML.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_TYPE|$[ if ( EFFECTIVE_DATE_FIELD_NAME == "" )
    ""
  else
    (for ( let info in record_info(INPUT_DML) ) :
      if ( info.name == EFFECTIVE_DATE_FIELD_NAME )
        info.dml_type)[0]
]|3|9|K|The DML type of the effective date field.  Used for temporary variables.|{0|}}
{30001002|XXparameter|DIFF_DML|$[ add_fields("record\\nend",
    for ( let info in record_info(INPUT_DML) ) :
      if ( info.name not member [vector EFFECTIVE_DATE_FIELD_NAME, END_DATE_FIELD_NAME] )
        info)
]|3|9|FK|The DML used for comparing adjacent records.  Defaults to the input DML, excluding any effective or end dates.|{0|}}
{30001002|XXparameter|DROP_RECORD_DIFF_DML|$[ if ( "drop_record" member INPUT_FIELD_NAME_VEC )
      join_types("record\\n  decimal(1) drop_record;\\nend", DIFF_DML)
    else
      DIFF_DML
]|3|9|RK|The diff DML with drop_record as the first field.  This is used when comparing adjacent records.|{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$[ if ( "matching__eff_dt" member INPUT_FIELD_NAME_VEC )
      [vector "matching__eff_dt", EFFECTIVE_DATE_FIELD_NAME]
    else
      [vector EFFECTIVE_DATE_FIELD_NAME]
]|3|9|RFK|A vector of fields that should be copied from the earlier record when two matching, adjacent records are merged.  Defaults to the effective date and DMF matching effective date, if any.|{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1546507204|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|@87336|104500|0|0|884000|534000|0|dedup_and_fix_intervals|||1|100|-1||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|884000|533000|3|}}
{2010240003|XXGlegend|311|0|841|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|312|0|843|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|313|0|845|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|314|0|847|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|315|0|849|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|316|0|851|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|317|0|853|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6826|}}
{2010242002|XXGface|318|0|855|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|319|0|857|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|320|0|859|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|321|0|861|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6818|17|}}
{2010210004|XXGflow|322|0|863|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6817|20|}}
{2010210004|XXGflow|323|0|865|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6833|17|}}
{2010210004|XXGflow|324|0|867|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6834|17|}}
{2010210004|XXGflow|325|0|869|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6828|17|}}
{2010210004|XXGflow|326|0|871|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6815|17|}}
{2010501005|XXGpvertex|327|0|873|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$ADJUSTED_DEDUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
}}@1|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|328|0|875|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|329|0|878|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|330|0|880|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|331|0|882|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|332|0|884|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|333|0|886|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|334|0|889|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|dup_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,dup,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|335|0|891|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|336|0|894|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|337|0|897|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|338|0|900|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|339|0|903|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|340|0|906|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|341|0|909|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$PARTITION_KEY|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|2|Pf$|@{0|}}
}}@1|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|342|0|911|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|343|0|914|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|344|0|916|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
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
{30001002|XXparameter|in_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|345|0|918|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|346|0|921|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|347|0|925|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@1|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|348|0|927|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|349|0|929|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|350|0|932|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403552|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|351|0|934|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|352|0|937|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|353|0|940|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key_method|False|3|1|l|@{0|}}
{30001002|XXparameter|transform|/* Find records with the same data values and abutting or overlapping effective dates. */
out :: key_change(in1, in2) =
begin
  out :1: (( in1.$END_DATE_FIELD_NAME < in2.$EFFECTIVE_DATE_FIELD_NAME ) or  // 1) There is a gap, ...
            $[ string_join(                                                                                // 2) Or Drop Record changed, ...
                vector_concat( // Put the non-NULL tests before the NULLable tests.                        // 3) One of the data fields does not match.
                  for ( let i in record_info(DROP_RECORD_DIFF_DML) ) :
                    if ( not i.nullable )
                      printf("in1.%s != in2.%s", i.name, i.name),
                  for ( let i in record_info(DIFF_DML) ) :
                    if ( i.nullable )
                      printf("first_defined(in1.%s != in2.%s, is_null(in1.%s) != is_null(in2.%s))",
                             i.name, i.name, i.name, i.name)),
                " or\\n            ") ] );
  out :2: 1;
end;


/* Keep the oldest Eff Date and the latest End Date amongst a group of matching records.
Because the incoming records have the earliest End Eff Date first, this will keep the longest (last) End Date. 
Other "physical" fields come from the last (latest) record, except for the Source Sequence Number, if any. */
out :: rollup(in) =
begin
  out.* :: in.*;
  $[ string_join(
      for ( let f in KEEP_FROM_FIRST_VEC ) :
        "out." + f + " :: first(in." + f + ");",
      "\\n  ") ]
end;|3|9|j|@{0|}}
{30001002|XXparameter|condition|$[ FIX_END_DATE \|\| FIX_EFFECTIVE_DATE ]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|@479000|385000|499000|405000|129000|107000|6816|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|354|0|942|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|355|0|945|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|356|0|947|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|357|0|949|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|358|0|951|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|359|0|954|0|{Generates data records that summarize groups of data records.  Rollup in memory maximizes performance by keeping intermediate results in main memory.  Rollup sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Ordering of input data|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input_display_values|In-memory:Inputneednotbesorted Inputmustbesortedorgrouped|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input_display_values.display_name|sorted-input-display-values|3|9|P|@{0|}}
{30001002|XXparameter|key_method|value sorted-input False True default constant True|13|13|Fv|How groups are specified|{0|}}
{30001002|XXparameter|key_method.display_name|key-method|3|9|P|@{0|}}
{30001002|XXparameter|key_method.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|key_method_display_values|Usekey_changefunction Usekeyspecifier|3|2|H$||{0|}}
{30001002|XXparameter|key_method_display_values.display_name|key-method-display-values|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key to define rollup groups|{0|}}
{30001002|XXparameter|key.condition|param key-method True|3|15|P?|@{0|}}
{30001002|XXparameter|positional_key|value key-method False "" sameas key|19|13|Ov|Key to define rollup groups|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
{30001002|XXparameter|max_core|67108864|1|2|FK$|Maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
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
{30001002|XXparameter|check_sort.condition|param key-method True param sorted-input True version 2.11.1:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|grouped_input|False|13|1|Fl|Input data should be processed in groups|{0|}}
{30001002|XXparameter|grouped_input.display_name|grouped-input|3|9|P|@{0|}}
{30001002|XXparameter|grouped_input.condition|param sorted-input False version 2.14.102:|3|15|P?|@{0|}}
{30001002|XXparameter|grouped_input_display_values|Dataisnotgroupedbyamajorkey Dataisgroupedbyamajorkey|3|2|H$||{0|}}
{30001002|XXparameter|grouped_input_display_values.display_name|grouped-input-display-values|3|9|P|@{0|}}
{30001002|XXparameter|major_key||19|2|FK$|Major key into which data is grouped|{0|}}
{30001002|XXparameter|major_key.display_name|major-key|3|9|P|@{0|}}
{30001002|XXparameter|major_key.keyword|major-key|3|9|P|@{0|}}
{30001002|XXparameter|major_key.condition|param grouped-input True|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|10|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of public variables in rollup|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|temp ? temp::rollup(temp, in) : out::rollup(in)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation4|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation5|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6|optional integer(8) out::key_change(in in1, in in2)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation5_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6_analysis|integer(8) key_change_out::key_change(in in, in in)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|_simple_transform_operation|rollup|3|2|H$|What operation should transform editor open with|{0|}}
{30001002|XXparameter|_simple_transform_operation.condition|version 2.11.7.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|sorted_mpname|rollup|3|2|H$||{0|}}
{30001002|XXparameter|sorted_mpname.display_name|sorted-mpname|3|9|P|@{0|}}
{30001002|XXparameter|memory_mpname|hash-rollup|3|2|H$||{0|}}
{30001002|XXparameter|memory_mpname.display_name|memory-mpname|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select); out=aggregate(key)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation7|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation8|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation9|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|360|0|956|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|361|0|959|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|362|0|962|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|363|0|965|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|364|0|968|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|365|0|971|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|$[
if(FIX_END_DATE)
"/* Remember the current and previous effective dates. */
type temporary_type =
record
  " + EFFECTIVE_DATE_TYPE + " cur_eff_dttm = NULL;
  " + EFFECTIVE_DATE_TYPE + " prev_eff_dttm = NULL;
end;


/* Initialize the Effective Date accumulator to NULL. */
temp :: initialize(in) =
begin
  temp :: allocate_with_nulls();
end;


/* Remember the new Effective Date and carry over the Previous (Later) Effective Date. */
out :: scan(temp, in) =
begin
  out.prev_eff_dttm :: temp.cur_eff_dttm;
  out.cur_eff_dttm :: in." + EFFECTIVE_DATE_FIELD_NAME + ";
end;


/* Within a given Natural Key group, for overlapping dates, this sets the End Date/Time to the following Effective Date/Time, minus 1 second. 
This does *not* fill in gaps, however. */
out :: finalize(temp, in) =
begin
  // This works because records are sorted in descending order by Effective Date.\\n" + 
  ((string_index(EFFECTIVE_DATE_TYPE, "date") != 0)?
        "  out." + END_DATE_FIELD_NAME + " :1: if ( temp.prev_eff_dttm <= in." + END_DATE_FIELD_NAME + " )
    datetime_add(temp.prev_eff_dttm, 0, microseconds = -(" + ADJACENT_INTERVAL_MICROSECONDS+ "));  // This is skipped for the first record in NK group.
  out." + END_DATE_FIELD_NAME + " :: in." + END_DATE_FIELD_NAME + ";  // So the first (latest) record keeps its original End Date.
  out.* :: in.*;\\n":
        "  out." + END_DATE_FIELD_NAME + " :1: if ( temp.prev_eff_dttm <= in." + END_DATE_FIELD_NAME + " )
    temp.prev_eff_dttm - " + ADJACENT_INTERVAL_MICROSECONDS + ";  // This is skipped for the first record in NK group.
  out." + END_DATE_FIELD_NAME + " :: in." + END_DATE_FIELD_NAME + ";  // So the first (latest) record keeps its original End Date.
  out.* :: in.*;\\n") + 
"end;"
else if(FIX_EFFECTIVE_DATE)
"/* Remember the current and previous effective dates. */
type temporary_type =
record
  " + EFFECTIVE_DATE_TYPE + " cur_end_dttm = NULL;
  " + EFFECTIVE_DATE_TYPE + " prev_end_dttm = NULL;
end;


/* Initialize the Effective Date accumulator to NULL. */
temp :: initialize(in) =
begin
  temp :: allocate_with_nulls();
end;


/* Remember the new Effective Date and carry over the Previous (Later) Effective Date. */
out :: scan(temp, in) =
begin
  out.prev_end_dttm :: temp.cur_end_dttm;
  out.cur_end_dttm :: in." + END_DATE_FIELD_NAME + ";
end;


/* Within a given Natural Key group, for overlapping dates, this sets the End Date/Time to the following Effective Date/Time, minus 1 second. 
This does *not* fill in gaps, however. */
out :: finalize(temp, in) =
begin
  // This works because records are sorted in descending order by Effective Date.\\n" +   
  ((string_index(EFFECTIVE_DATE_TYPE, "date") != 0)?
        "out." + EFFECTIVE_DATE_FIELD_NAME + " :1: if ( temp.prev_end_dttm >= in." + EFFECTIVE_DATE_FIELD_NAME + " )
    datetime_add(temp.prev_end_dttm, 0, microseconds = (" + ADJACENT_INTERVAL_MICROSECONDS+ "));  // This is skipped for the first record in NK group.
  out." + EFFECTIVE_DATE_FIELD_NAME + " :: in." + EFFECTIVE_DATE_FIELD_NAME + ";  // So the first (latest) record keeps its original End Date.
  out.* :: in.*\\n":
        "  out." + EFFECTIVE_DATE_FIELD_NAME + " :1: if ( temp.prev_eff_dttm <= in." + EFFECTIVE_DATE_FIELD_NAME + " )
    temp.prev_eff_dttm - " + ADJACENT_INTERVAL_MICROSECONDS + ";  // This is skipped for the first record in NK group.
  out." + EFFECTIVE_DATE_FIELD_NAME + " :: in." + EFFECTIVE_DATE_FIELD_NAME + ";  // So the first (latest) record keeps its original End Date.
  out.* :: in.*;\\n") + 
"end;"
else ""
]|3|9|j|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[ FIX_END_DATE \|\| FIX_EFFECTIVE_DATE ]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Scan.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|@477000|176000|497000|196000|139000|107000|6835|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|366|0|973|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|367|0|976|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|368|0|978|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|369|0|980|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|370|0|982|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|371|0|985|0|{Generates a series of cumulative summary records--such as year-to-date totals--for groups of data records.  Scan in memory maximizes performance by keeping intermediate results in main memory.  Scan sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?scan|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Ordering of input data|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.condition|version 2.4.16:|3|15|P?|@{0|}}
{30001002|XXparameter|sorted_input_display_values|In-memory:Inputneednotbesorted Inputmustbesortedorgrouped|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input_display_values.display_name|sorted-input-display-values|3|9|P|@{0|}}
{30001002|XXparameter|key_method|value sorted-input False True default constant True|13|13|Fv|How groups are specified|{0|}}
{30001002|XXparameter|key_method.display_name|key-method|3|9|P|@{0|}}
{30001002|XXparameter|key_method.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|key_method_display_values|Usekey_changefunction Usekeyspecifier|3|2|H$||{0|}}
{30001002|XXparameter|key_method_display_values.display_name|key-method-display-values|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key to define scan groups|{0|}}
{30001002|XXparameter|key.condition|param key-method True|3|15|P?|@{0|}}
{30001002|XXparameter|positional_key|value key-method False "" sameas key|19|13|Ov|Key to define rollup groups|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
{30001002|XXparameter|max_core|67108864|1|2|FK$|Maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param sorted-input False|3|15|P?|@{0|}}
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
{30001002|XXparameter|check_sort.condition|param key-method True param sorted-input True version 2.11.1:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order|False|13|1|FKl|Exit rather than spill to disk|{0|}}
{30001002|XXparameter|maintain_order.display_name|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.keyword|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.condition|version 2.16.0.r3: param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|grouped_input|False|13|1|Fl|Input data should be processed in groups|{0|}}
{30001002|XXparameter|grouped_input.display_name|grouped-input|3|9|P|@{0|}}
{30001002|XXparameter|grouped_input.condition|param sorted-input False version 2.14.102:|3|15|P?|@{0|}}
{30001002|XXparameter|grouped_input_display_values|Dataisnotgroupedbyamajorkey Dataisgroupedbyamajorkey|3|2|H$||{0|}}
{30001002|XXparameter|grouped_input_display_values.display_name|grouped-input-display-values|3|9|P|@{0|}}
{30001002|XXparameter|major_key||19|2|FK$|Major key into which data is grouped|{0|}}
{30001002|XXparameter|major_key.display_name|major-key|3|9|P|@{0|}}
{30001002|XXparameter|major_key.keyword|major-key|3|9|P|@{0|}}
{30001002|XXparameter|major_key.condition|param grouped-input True|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|10|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate steps in scan|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|temp ? temp::scan(temp, in) : out::scan(in)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation4|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation5|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6|optional integer(8) out::key_change(in in1, in in2)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation5_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6_analysis|integer(8) key_change_out::key_change(in in, in in)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|_simple_transform_operation|scan|3|2|H$|What operation should transform editor open with|{0|}}
{30001002|XXparameter|_simple_transform_operation.condition|version 3.0:|3|15|P?|@{0|}}
{30001002|XXparameter|sorted_mpname|scan|3|2|H$||{0|}}
{30001002|XXparameter|sorted_mpname.display_name|sorted-mpname|3|9|P|@{0|}}
{30001002|XXparameter|memory_mpname|hash-scan|3|2|H$||{0|}}
{30001002|XXparameter|memory_mpname.display_name|memory-mpname|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation7|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation8|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation9|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|372|0|987|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|373|0|990|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|374|0|993|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|375|0|996|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|376|0|999|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|377|0|1002|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$ADJUSTED_DEDUP_SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
}}@1|@328000|62062|348000|82000|106000|89000|6819|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|378|0|1004|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|379|0|1007|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|380|0|1010|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|381|0|1012|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|382|0|1015|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|383|0|1018|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|major_key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{$EFFECTIVE_DATE_FIELD_NAME; $END_DATE_FIELD_NAME\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|allow_unsorted|True|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(EFFECTIVE_DATE_FIELD_NAME) &&
   not is_blank(END_DATE_FIELD_NAME)]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
}}@1|@131000|387000|151000|407000|135000|107000|6829|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|384|0|1020|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|385|0|1023|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|386|0|1026|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|387|0|1028|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|388|0|1031|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|389|0|1034|0|{@{}@0|0|0|0|out|.5|@@@14352|0|}}
{2010203004|XXGoport|390|0|1037|0|{@{}@0|0|0|0|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|391|0|1040|0|{@{}@0|0|0|0|in|.5|@@@14096|0|}}
{2010503005|XXGfvertex|392|0|1045|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|$DUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$DUP_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|protection|0644|3|2|$|@{0|}}
}}@1|@472000|414500|494000|435000|56000|50000|9941|Dups|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|393|0|1047|0|{@{}@484000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|394|0|1050|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1379520122|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|395|0|1052|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|396|0|1056|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ LOOKUP_KEY == "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
}}@1|@642000|401500|652000|416000|50000|41000|9899|Gather|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|397|0|1058|0|{@{}@701000|429000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|398|0|1061|0|{@{}@642000|429000|11000|11000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|399|0|1064|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520143|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|400|0|1066|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|401|0|1069|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|402|0|1072|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
}}@1|@793000|351500|803000|366000|50000|41000|9904|Gather.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|403|0|1074|0|{@{}@852000|379000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|404|0|1076|0|{@{}@793000|374000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|405|0|1080|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1379520143|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|406|0|1082|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|407|0|1085|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|408|0|1088|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_group|GET_COUNT|3|2|$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error2_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|@57000|160500|77000|181000|135000|93000|9935|Map to Output|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|409|0|1090|0|{@{}@211000|194000|11000|11000|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|410|0|1093|0|{@{}@211000|224000|11000|11000|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|411|0|1096|0|{@{}@211000|254000|11000|11000|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|412|0|1099|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|413|0|1101|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|414|0|1103|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|415|0|1105|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|416|0|1107|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|417|0|1109|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|418|0|1111|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|419|0|1113|0|{@{}@67000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|420|0|1115|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|3|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|transform1||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|transform2||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
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
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520143|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out2_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|421|0|1117|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|422|0|1121|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|423|0|1125|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform2||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|424|0|1129|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|425|0|1132|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|426|0|1135|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|427|0|1138|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|428|0|1141|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|429|0|1144|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|430|0|1147|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|431|0|1150|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|432|0|1153|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$LOOKUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ LOOKUP_KEY != "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
}}@1|@646000|298500|656000|313000|50000|41000|9901|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|433|0|1155|0|{@{}@705000|329000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|434|0|1158|0|{@{}@646000|329000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|435|0|1161|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to merge on|{0|}}
{30001002|XXparameter|check_sort|True|13|1|FKl|Abort on first record that is out of sorted order|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 3.1.2.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520143|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|436|0|1163|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|437|0|1166|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|438|0|1169|0|{@{}@0|0|0|0|source|.16666666666666666|@@@14352|0|}}
{2010203004|XXGoport|439|0|1172|0|{@{}@0|0|0|0|clean|.5|@@@14352|0|}}
{2010203004|XXGoport|440|0|1175|0|{@{}@0|0|0|0|lookup|.8333333333333333|@@@14736|0|}}
{2010202004|XXGiport|441|0|1178|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|442|0|1181|0|{Subgraph created from graph "get.columnar"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/read_columnar.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|$ENABLE_OUTBOUND_SUPPRESSION|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|@11750|177125|0|0|0|0|15707|Read Columnar -1|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1046000|503000|1|}}
{2010240003|XXGlegend|443|0|1183|0|{@{}@Global outbound data
suppression|141000|16000|0|0|0|0|15735|}}
{2010242002|XXGface|444|0|1185|0|{@{}@Arial|0|160|0|}}
{2010210004|XXGflow|445|0|1187|0|{@{}@384|.5|.5|{0|}15750|2065|}}
{2010210004|XXGflow|446|0|1189|0|{@{}@384|.5|.5|{0|}15752|17|}}
{2010243001|XXGwatcher|447|0|1191|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|448|0|1193|0|{@{}@384|.5|.24358974397182465|{0|}15757|17|}}
{2010243001|XXGwatcher|449|0|1195|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|450|0|1198|0|{@{}@384|.5|.5|{0|}15737|17|}}
{2010210004|XXGflow|451|0|1200|0|{@{}@384|.5|.5|{0|}15456|17|}}
{2010210004|XXGflow|452|0|1202|0|{@{}@384|.5|.5|{0|}15738|17|}}
{2010210004|XXGflow|453|0|1205|0|{@{}@384|.5|.5|{0|}15755|2065|}}
{2010210004|XXGflow|454|0|1207|0|{@{}@384|.5|.5|{0|}15756|17|}}
{2010600005|XXGgraph|455|0|1209|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|2|3|9|P|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@150000|75000|0|0|0|0|15754|Data Suppression - Outbound|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|5|}}
{2010203004|XXGoport|456|0|1211|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|457|0|1214|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|458|0|1217|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010503005|XXGfvertex|459|0|1221|0|{|{}@0|@25000|107000|0|0|0|0|15441|Existing IDS ICFF|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|460|0|1223|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|461|0|1228|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|2|3|9|P|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@150000|255000|0|0|0|0|15759|Data Suppression - Outbound-1|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|5|}}
{2010203004|XXGoport|462|0|1230|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|463|0|1233|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|464|0|1236|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010503005|XXGfvertex|465|0|1240|0|{|{}@0|@31000|283750|0|0|0|0|15749|Input File- Archive|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|466|0|1242|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|467|0|1247|0|{Subgraph created from graph "get.columnar"|{}@0|@692500|78250|0|0|0|0|15457|De-Dup|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|468|0|1249|0|{@{}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|469|0|1251|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|470|0|1253|0|{@{}@384|.5|.5|{0|}15133|17|}}
{2010210004|XXGflow|471|0|1255|0|{@{}@384|.5|.5|{0|}15140|17|}}
{2010501005|XXGpvertex|472|0|1258|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Dedup Sorted|626000|102500|0|0|0|0|15141|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|473|0|1260|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|474|0|1262|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|475|0|1264|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|476|0|1266|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|477|0|1268|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|478|0|1270|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|479|0|1279|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|235000|98000|0|0|0|0|15132|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|480|0|1281|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|481|0|1284|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|482|0|1290|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|429000|87000|0|0|0|0|15135|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|483|0|1292|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|484|0|1295|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|485|0|1301|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|486|0|1305|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|487|0|1309|0|{Subgraph created from graph "get.columnar"|{}@0|@712500|283250|0|0|0|0|15739|De-Dup-1|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|488|0|1311|0|{@{}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|489|0|1313|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|490|0|1315|0|{@{}@384|.5|.5|{0|}15133|17|}}
{2010210004|XXGflow|491|0|1317|0|{@{}@384|.5|.5|{0|}15127|17|}}
{2010210004|XXGflow|492|0|1319|0|{@{}@384|.5|.5|{0|}15137|17|}}
{2010501005|XXGpvertex|493|0|1321|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Dedup Sorted|626000|102500|0|0|0|0|15128|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|494|0|1323|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|495|0|1325|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|496|0|1327|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|497|0|1329|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|498|0|1331|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|499|0|1333|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|500|0|1337|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|45000|88500|0|0|0|0|15138|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|501|0|1339|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|502|0|1342|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|503|0|1344|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|504|0|1346|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|505|0|1348|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|506|0|1351|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Filter by Expression|450000|289250|0|0|0|0|15449|Filter by Expression-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|507|0|1353|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|508|0|1356|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|509|0|1358|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|510|0|1360|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|511|0|1362|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|512|0|1364|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|513|0|1373|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|235000|98000|0|0|0|0|15134|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|514|0|1375|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|515|0|1378|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|516|0|1384|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|429000|87000|0|0|0|0|15126|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|517|0|1386|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|518|0|1389|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|519|0|1395|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|520|0|1399|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|521|0|1403|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|386000|208000|0|0|0|0|15732|Discard Suppressed Data|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|522|0|1405|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|523|0|1410|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|381000|403000|0|0|0|0|15734|Discard Suppressed Data-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|524|0|1412|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|525|0|1421|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Merge|960000|184500|0|0|0|0|15443|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|526|0|1423|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|527|0|1425|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|528|0|1432|0|{@{}@0|0|0|0|out0|.49303621169916434|@@@14352|0|}}
{2010600005|XXGgraph|529|0|1436|0|{Subgraph created from graph "get.columnar"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|SERIAL_NUM|1|1|9|RFK|@{0|}}
{30001002|XXparameter|condition|$[length_of(COLUMNARS_READ_INFO_VEC) > (SERIAL_NUM - 1 ) ]|3|9|F||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|FILE|$[ COLUMNARS_READ_INFO_VEC[SERIAL_NUM - 1 ].columnar_file ]|3|9|RFK|@{0|}}
{30001002|XXparameter|DML|$[ COLUMNARS_READ_INFO_VEC[SERIAL_NUM - 1 ].columnar_dml ]|3|9|RFK|@{0|}}
{30001002|XXparameter|ARCHIVE_FL|$[string_replace(FILE,".dat.gz",".archive.dat.gz")]|3|9|RFK|@{0|}}
{30001002|XXparameter|OUT_DML|$[GENERATE_OUT_DML_VEC[SERIAL_NUM - 1 ]]|3|9|RFK|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|True|3|9|RFK|@{0|}}
{30001002|XXparameter|mpcmodtime|1596810186|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|@11750|192125|0|0|0|0|15388|First Columnar||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1046000|503000|7|}}
{2010240003|XXGlegend|530|0|1438|0|{@{}@Global outbound data
suppression|141000|16000|0|0|0|0|15735|}}
{2010242002|XXGface|531|0|1440|0|{@{}@Arial|0|160|0|}}
{2010210004|XXGflow|532|0|1442|0|{@{}@384|.5|.5|{0|}15750|2065|}}
{2010210004|XXGflow|533|0|1444|0|{@{}@384|.5|.5|{0|}15752|17|}}
{2010243001|XXGwatcher|534|0|1446|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|535|0|1448|0|{@{}@384|.5|.24358974397182465|{0|}15757|17|}}
{2010243001|XXGwatcher|536|0|1450|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|537|0|1452|0|{@{}@384|.5|.5|{0|}15718|17|}}
{2010210004|XXGflow|538|0|1454|0|{@{}@384|.5|.5|{0|}15737|17|}}
{2010210004|XXGflow|539|0|1456|0|{@{}@384|.5|.5|{0|}15456|17|}}
{2010210004|XXGflow|540|0|1458|0|{@{}@384|.5|.5|{0|}15738|17|}}
{2010210004|XXGflow|541|0|1460|0|{@{}@384|.5|.5|{0|}15751|17|}}
{2010210004|XXGflow|542|0|1462|0|{@{}@384|.5|.5|{0|}15755|2065|}}
{2010210004|XXGflow|543|0|1464|0|{@{}@384|.5|.5|{0|}15756|17|}}
{2010600005|XXGgraph|544|0|1466|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|1|3|9|P|@{0|}}
{30001002|XXparameter|!prototype|$PUB_DXF_COMPONENTS/data_suppression.outbound.mgi|3|9|Pf|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|$ENABLE_OUTBOUND_SUPPRESSION|3|9||@{0|}}
}}@0|@150000|75000|0|0|0|0|15754|Data Suppression - Outbound|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|5|}}
{2010600005|XXGgraph|545|0|1468|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|implementation|$PUB_DXF_COMPONENTS/data_suppression.outbound.mp|44|9|RFf|A target subgraph that implements this interface, or a pset for one.|{0|}}
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
{30001002|XXparameter|EXPRESSION_LOOKUP_CONTENTS|@3|9|FK|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|True|13|9|RFK|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Layout.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|Layout.layout_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|in0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|in0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|out0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|out0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|deselect_metadata||7|9|RF||{0|}}
{30001002|XXparameter|deselect_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1563451632|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in0 = out0
metadata type: out0 = in0
metadata type: in0 = deselect
metadata type: deselect = in0|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|Graph Interface|||1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|600000|400000|7|}}
{2010203004|XXGoport|546|0|1470|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|547|0|1473|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|548|0|1476|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010203004|XXGoport|549|0|1479|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|550|0|1482|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|551|0|1485|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010600005|XXGgraph|552|0|1488|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|1|3|9|P|@{0|}}
{30001002|XXparameter|!prototype|$PUB_DXF_COMPONENTS/data_suppression.outbound.mgi|3|9|Pf|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|$ENABLE_OUTBOUND_SUPPRESSION|3|9||@{0|}}
}}@0|@150000|255000|0|0|0|0|15759|Data Suppression - Outbound-1|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|5|}}
{2010600005|XXGgraph|553|0|1490|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|implementation|$PUB_DXF_COMPONENTS/data_suppression.outbound.mp|44|9|RFf|A target subgraph that implements this interface, or a pset for one.|{0|}}
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
{30001002|XXparameter|EXPRESSION_LOOKUP_CONTENTS|@3|9|FK|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|True|13|9|RFK|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Layout.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|Layout.layout_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|in0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|in0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|out0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|out0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|deselect_metadata||7|9|RF||{0|}}
{30001002|XXparameter|deselect_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1563451632|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in0 = out0
metadata type: out0 = in0
metadata type: in0 = deselect
metadata type: deselect = in0|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|Graph Interface|||1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|600000|400000|7|}}
{2010203004|XXGoport|554|0|1492|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|555|0|1495|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|556|0|1498|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010203004|XXGoport|557|0|1501|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|558|0|1504|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|559|0|1507|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010600005|XXGgraph|560|0|1510|0|{Subgraph created from graph "get.columnar"|{}@0|@692500|78250|0|0|0|0|15457|De-Dup|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|561|0|1512|0|{@{}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|562|0|1514|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|563|0|1516|0|{@{}@384|.5|.5|{0|}15133|17|}}
{2010210004|XXGflow|564|0|1518|0|{@{}@384|.5|.5|{0|}15140|17|}}
{2010210004|XXGflow|565|0|1520|0|{@{}@384|.5|.5|{0|}15144|17|}}
{2010501005|XXGpvertex|566|0|1522|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1;dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|626000|102500|0|0|0|0|15141|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|567|0|1524|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|568|0|1526|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|569|0|1528|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|570|0|1530|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|571|0|1532|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|572|0|1534|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|573|0|1537|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|574|0|1539|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|575|0|1542|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|576|0|1545|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|577|0|1548|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|578|0|1551|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|579|0|1554|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|580|0|1557|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
out :: reformat(in) =
begin
   let hash_key_combine_type dxf_hk =  reinterpret(get_hash(in, $MAIN_DATASET_NK)) ;
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|out0_metadata|$\{OUT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|45000|88500|0|0|0|0|15145|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|581|0|1559|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|582|0|1562|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|583|0|1564|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|584|0|1566|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|585|0|1568|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|586|0|1570|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|587|0|1572|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|588|0|1576|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|589|0|1579|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|590|0|1582|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|591|0|1585|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|592|0|1588|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
}}@0|Sort|235000|98000|0|0|0|0|15132|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|593|0|1590|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|594|0|1593|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|595|0|1596|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|596|0|1598|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|597|0|1601|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|598|0|1604|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; ids_updt_dttm descending\}|3|2|$|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|Sort within Groups|429000|87000|0|0|0|0|15135|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|599|0|1606|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|600|0|1609|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|601|0|1612|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|602|0|1614|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|603|0|1617|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|604|0|1620|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|605|0|1624|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|606|0|1628|0|{Subgraph created from graph "get.columnar"|{}@0|@712500|283250|0|0|0|0|15739|De-Dup-1|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|607|0|1630|0|{@{}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|608|0|1632|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|609|0|1634|0|{@{}@384|.5|.5|{0|}15133|17|}}
{2010210004|XXGflow|610|0|1636|0|{@{}@384|.5|.5|{0|}15127|17|}}
{2010210004|XXGflow|611|0|1638|0|{@{}@384|.5|.5|{0|}15137|17|}}
{2010501005|XXGpvertex|612|0|1640|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1;dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|626000|102500|0|0|0|0|15128|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|613|0|1642|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|614|0|1644|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|615|0|1646|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|616|0|1648|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|617|0|1650|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|618|0|1652|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|619|0|1655|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|620|0|1657|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|621|0|1660|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|622|0|1663|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|623|0|1666|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|624|0|1669|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|625|0|1672|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|626|0|1675|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
out :: reformat(in) =
begin
   let hash_key_combine_type dxf_hk =  reinterpret(get_hash(in, $"MAIN_DATASET_NK")) ;
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|out0_metadata|$\{OUT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|45000|88500|0|0|0|0|15138|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|627|0|1677|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|628|0|1680|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|629|0|1682|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|630|0|1684|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|631|0|1686|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|632|0|1688|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|633|0|1690|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|634|0|1694|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|635|0|1697|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|636|0|1700|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|637|0|1703|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|638|0|1706|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
}}@0|Sort|235000|98000|0|0|0|0|15134|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|639|0|1708|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|640|0|1711|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|641|0|1714|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|642|0|1716|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|643|0|1719|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|644|0|1722|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; ids_updt_dttm descending\}|3|2|$|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|Sort within Groups|429000|87000|0|0|0|0|15126|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|645|0|1724|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|646|0|1727|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|647|0|1730|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|648|0|1732|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|649|0|1735|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|650|0|1738|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|651|0|1742|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|652|0|1746|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
}}@0|Trash|386000|208000|0|0|0|0|15732|Discard Suppressed Data|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|653|0|1748|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|654|0|1751|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|655|0|1753|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|656|0|1756|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
}}@0|Trash|381000|403000|0|0|0|0|15734|Discard Suppressed Data-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|657|0|1758|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|658|0|1761|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|659|0|1763|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|660|0|1766|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$FILE|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$DML|3|2|f$|@{0|}}
}}@0|@25000|107000|0|0|0|0|15441|Existing IDS ICFF|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|661|0|1768|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|662|0|1771|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|663|0|1773|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|664|0|1776|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata|$DML|3|2|f$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|select_expr|$FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|$\{OUT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|450000|289250|0|0|0|0|15449|Filter by Expression-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|665|0|1778|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|666|0|1781|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|667|0|1783|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|668|0|1785|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|669|0|1787|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|670|0|1789|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|671|0|1792|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|672|0|1794|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|673|0|1797|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|674|0|1800|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|675|0|1803|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|676|0|1806|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|677|0|1809|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|678|0|1814|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|$FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata|$DML|3|2|f$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|out_metadata|$\{OUT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|450000|84250|0|0|0|0|15719|Filter by Expression-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|679|0|1816|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|680|0|1819|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|681|0|1821|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|682|0|1823|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|683|0|1825|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|684|0|1827|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|685|0|1830|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|686|0|1832|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|687|0|1835|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|688|0|1838|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|689|0|1841|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|690|0|1844|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|691|0|1847|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|692|0|1851|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ARCHIVE_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ARCHIVE_FL|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$DML|3|2|f$|@{0|}}
{30001002|XXparameter|condition|$[IS_READ_ARCHIVE]|3|9||@{0|}}
}}@0|@31000|283750|0|0|0|0|15749|Input File- Archive|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|693|0|1853|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|694|0|1856|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|695|0|1858|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|696|0|1861|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[IS_READ_ARCHIVE]|3|9||@{0|}}
}}@1|Merge|960000|184500|0|0|0|0|15443|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|697|0|1863|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|698|0|1865|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|699|0|1869|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to merge on|{0|}}
{30001002|XXparameter|check_sort|True|13|1|FKl|Abort on first record that is out of sorted order|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 3.1.2.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Merge|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|700|0|1871|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|701|0|1874|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|702|0|1877|0|{@{}@0|0|0|0|out0|.49303621169916434|@@@14352|0|}}
{2010600005|XXGgraph|703|0|1880|0|{Subgraph created from graph "get.columnar"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/read_columnar.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|SERIAL_NUM|2|3|9||@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|$ENABLE_OUTBOUND_SUPPRESSION|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|@10000|302125|0|0|0|0|15709|Read Columnar -2|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1046000|503000|1|}}
{2010240003|XXGlegend|704|0|1882|0|{@{}@Global outbound data
suppression|141000|16000|0|0|0|0|15735|}}
{2010242002|XXGface|705|0|1884|0|{@{}@Arial|0|160|0|}}
{2010210004|XXGflow|706|0|1886|0|{@{}@384|.5|.5|{0|}15750|2065|}}
{2010210004|XXGflow|707|0|1888|0|{@{}@384|.5|.5|{0|}15752|17|}}
{2010243001|XXGwatcher|708|0|1890|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|709|0|1892|0|{@{}@384|.5|.24358974397182465|{0|}15757|17|}}
{2010243001|XXGwatcher|710|0|1894|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|711|0|1896|0|{@{}@384|.5|.5|{0|}15718|17|}}
{2010210004|XXGflow|712|0|1899|0|{@{}@384|.5|.5|{0|}15456|17|}}
{2010210004|XXGflow|713|0|1901|0|{@{}@384|.5|.5|{0|}15738|17|}}
{2010210004|XXGflow|714|0|1903|0|{@{}@384|.5|.5|{0|}15751|17|}}
{2010210004|XXGflow|715|0|1905|0|{@{}@384|.5|.5|{0|}15755|2065|}}
{2010600005|XXGgraph|716|0|1908|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|2|3|9|P|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@150000|75000|0|0|0|0|15754|Data Suppression - Outbound|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|5|}}
{2010203004|XXGoport|717|0|1910|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|718|0|1913|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|719|0|1916|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010503005|XXGfvertex|720|0|1920|0|{|{}@0|@25000|107000|0|0|0|0|15441|Existing IDS ICFF|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|721|0|1922|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|722|0|1927|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|2|3|9|P|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@150000|255000|0|0|0|0|15759|Data Suppression - Outbound-1|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|5|}}
{2010203004|XXGoport|723|0|1929|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|724|0|1932|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|725|0|1935|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010503005|XXGfvertex|726|0|1939|0|{|{}@0|@31000|283750|0|0|0|0|15749|Input File- Archive|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|727|0|1941|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|728|0|1946|0|{Subgraph created from graph "get.columnar"|{}@0|@692500|78250|0|0|0|0|15457|De-Dup|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|729|0|1948|0|{@{}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|730|0|1950|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|731|0|1952|0|{@{}@384|.5|.5|{0|}15133|17|}}
{2010210004|XXGflow|732|0|1954|0|{@{}@384|.5|.5|{0|}15140|17|}}
{2010210004|XXGflow|733|0|1956|0|{@{}@384|.5|.5|{0|}15144|17|}}
{2010501005|XXGpvertex|734|0|1958|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Dedup Sorted|626000|102500|0|0|0|0|15141|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|735|0|1960|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|736|0|1962|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|737|0|1964|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|738|0|1966|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|739|0|1968|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|740|0|1970|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|741|0|1974|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|45000|88500|0|0|0|0|15145|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|742|0|1976|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|743|0|1979|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|744|0|1981|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|745|0|1983|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|746|0|1985|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|747|0|1988|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Filter by Expression|450000|84250|0|0|0|0|15719|Filter by Expression-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|748|0|1990|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|749|0|1993|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|750|0|1995|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|751|0|1997|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|752|0|1999|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|753|0|2001|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|754|0|2011|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|235000|98000|0|0|0|0|15132|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|755|0|2013|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|756|0|2016|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|757|0|2022|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|429000|87000|0|0|0|0|15135|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|758|0|2024|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|759|0|2027|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|760|0|2033|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|761|0|2037|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|762|0|2041|0|{Subgraph created from graph "get.columnar"|{}@0|@712500|283250|0|0|0|0|15739|De-Dup-1|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|763|0|2043|0|{@{}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|764|0|2045|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|765|0|2047|0|{@{}@384|.5|.5|{0|}15133|17|}}
{2010210004|XXGflow|766|0|2049|0|{@{}@384|.5|.5|{0|}15127|17|}}
{2010501005|XXGpvertex|767|0|2052|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Dedup Sorted|626000|102500|0|0|0|0|15128|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|768|0|2054|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|769|0|2056|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|770|0|2058|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|771|0|2060|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|772|0|2062|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|773|0|2064|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|774|0|2073|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|235000|98000|0|0|0|0|15134|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|775|0|2075|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|776|0|2078|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|777|0|2084|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|429000|87000|0|0|0|0|15126|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|778|0|2086|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|779|0|2089|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|780|0|2095|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|781|0|2099|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|782|0|2103|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|386000|208000|0|0|0|0|15732|Discard Suppressed Data|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|783|0|2105|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|784|0|2110|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|381000|403000|0|0|0|0|15734|Discard Suppressed Data-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|785|0|2112|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|786|0|2121|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Merge|960000|184500|0|0|0|0|15443|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|787|0|2123|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|788|0|2125|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|789|0|2132|0|{@{}@0|0|0|0|out0|.49303621169916434|@@@14352|0|}}
{2010600005|XXGgraph|790|0|2136|0|{Subgraph created from graph "get.columnar"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|SERIAL_NUM|1|1|9|RFK|@{0|}}
{30001002|XXparameter|condition|$[length_of(COLUMNARS_READ_INFO_VEC) > (SERIAL_NUM - 1 ) ]|3|9|F||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|FILE|$[ COLUMNARS_READ_INFO_VEC[SERIAL_NUM - 1 ].columnar_file ]|3|9|RFK|@{0|}}
{30001002|XXparameter|DML|$[ COLUMNARS_READ_INFO_VEC[SERIAL_NUM - 1 ].columnar_dml ]|3|9|RFK|@{0|}}
{30001002|XXparameter|ARCHIVE_FL|$[string_replace(FILE,".dat.gz",".archive.dat.gz")]|3|9|RFK|@{0|}}
{30001002|XXparameter|OUT_DML|$[GENERATE_OUT_DML_VEC[SERIAL_NUM - 1 ]]|3|9|RFK|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|True|3|9|RFK|@{0|}}
{30001002|XXparameter|mpcmodtime|1596810186|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|@11750|192125|0|0|0|0|15388|First Columnar||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1046000|503000|7|}}
{2010240003|XXGlegend|791|0|2138|0|{@{}@Global outbound data
suppression|141000|16000|0|0|0|0|15735|}}
{2010242002|XXGface|792|0|2140|0|{@{}@Arial|0|160|0|}}
{2010210004|XXGflow|793|0|2142|0|{@{}@384|.5|.5|{0|}15750|2065|}}
{2010210004|XXGflow|794|0|2144|0|{@{}@384|.5|.5|{0|}15752|17|}}
{2010243001|XXGwatcher|795|0|2146|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|796|0|2148|0|{@{}@384|.5|.24358974397182465|{0|}15757|17|}}
{2010243001|XXGwatcher|797|0|2150|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|798|0|2152|0|{@{}@384|.5|.5|{0|}15718|17|}}
{2010210004|XXGflow|799|0|2154|0|{@{}@384|.5|.5|{0|}15737|17|}}
{2010210004|XXGflow|800|0|2156|0|{@{}@384|.5|.5|{0|}15456|17|}}
{2010210004|XXGflow|801|0|2158|0|{@{}@384|.5|.5|{0|}15738|17|}}
{2010210004|XXGflow|802|0|2160|0|{@{}@384|.5|.5|{0|}15751|17|}}
{2010210004|XXGflow|803|0|2162|0|{@{}@384|.5|.5|{0|}15755|2065|}}
{2010210004|XXGflow|804|0|2164|0|{@{}@384|.5|.5|{0|}15756|17|}}
{2010600005|XXGgraph|805|0|2166|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|1|3|9|P|@{0|}}
{30001002|XXparameter|!prototype|$PUB_DXF_COMPONENTS/data_suppression.outbound.mgi|3|9|Pf|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|$ENABLE_OUTBOUND_SUPPRESSION|3|9||@{0|}}
}}@0|@150000|75000|0|0|0|0|15754|Data Suppression - Outbound|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|5|}}
{2010600005|XXGgraph|806|0|2168|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|implementation|$PUB_DXF_COMPONENTS/data_suppression.outbound.mp|44|9|RFf|A target subgraph that implements this interface, or a pset for one.|{0|}}
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
{30001002|XXparameter|EXPRESSION_LOOKUP_CONTENTS|@3|9|FK|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|True|13|9|RFK|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Layout.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|Layout.layout_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|in0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|in0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|out0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|out0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|deselect_metadata||7|9|RF||{0|}}
{30001002|XXparameter|deselect_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1563451632|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in0 = out0
metadata type: out0 = in0
metadata type: in0 = deselect
metadata type: deselect = in0|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|Graph Interface|||1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|600000|400000|7|}}
{2010203004|XXGoport|807|0|2170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|808|0|2173|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|809|0|2176|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010203004|XXGoport|810|0|2179|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|811|0|2182|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|812|0|2185|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010600005|XXGgraph|813|0|2188|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|1|3|9|P|@{0|}}
{30001002|XXparameter|!prototype|$PUB_DXF_COMPONENTS/data_suppression.outbound.mgi|3|9|Pf|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|$ENABLE_OUTBOUND_SUPPRESSION|3|9||@{0|}}
}}@0|@150000|255000|0|0|0|0|15759|Data Suppression - Outbound-1|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|5|}}
{2010600005|XXGgraph|814|0|2190|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|implementation|$PUB_DXF_COMPONENTS/data_suppression.outbound.mp|44|9|RFf|A target subgraph that implements this interface, or a pset for one.|{0|}}
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
{30001002|XXparameter|EXPRESSION_LOOKUP_CONTENTS|@3|9|FK|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|True|13|9|RFK|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Layout.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|Layout.layout_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|in0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|in0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|out0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|out0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|deselect_metadata||7|9|RF||{0|}}
{30001002|XXparameter|deselect_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1563451632|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in0 = out0
metadata type: out0 = in0
metadata type: in0 = deselect
metadata type: deselect = in0|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|Graph Interface|||1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|600000|400000|7|}}
{2010203004|XXGoport|815|0|2192|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|816|0|2195|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|817|0|2198|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010203004|XXGoport|818|0|2201|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|819|0|2204|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|820|0|2207|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010600005|XXGgraph|821|0|2210|0|{Subgraph created from graph "get.columnar"|{}@0|@692500|78250|0|0|0|0|15457|De-Dup|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|822|0|2212|0|{@{}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|823|0|2214|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|824|0|2216|0|{@{}@384|.5|.5|{0|}15133|17|}}
{2010210004|XXGflow|825|0|2218|0|{@{}@384|.5|.5|{0|}15140|17|}}
{2010210004|XXGflow|826|0|2220|0|{@{}@384|.5|.5|{0|}15144|17|}}
{2010501005|XXGpvertex|827|0|2222|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1;dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|626000|102500|0|0|0|0|15141|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|828|0|2224|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|829|0|2226|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|830|0|2228|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|831|0|2230|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|832|0|2232|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|833|0|2234|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|834|0|2237|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|835|0|2239|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|836|0|2242|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|837|0|2245|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|838|0|2248|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|839|0|2251|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|840|0|2254|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|841|0|2257|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
out :: reformat(in) =
begin
   let hash_key_combine_type dxf_hk =  reinterpret(get_hash(in, $MAIN_DATASET_NK)) ;
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|out0_metadata|$\{OUT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|45000|88500|0|0|0|0|15145|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|842|0|2259|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|843|0|2262|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|844|0|2264|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|845|0|2266|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|846|0|2268|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|847|0|2270|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|848|0|2272|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|849|0|2276|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|850|0|2279|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|851|0|2282|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|852|0|2285|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|853|0|2288|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
}}@0|Sort|235000|98000|0|0|0|0|15132|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|854|0|2290|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|855|0|2293|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|856|0|2296|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|857|0|2298|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|858|0|2301|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|859|0|2304|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; ids_updt_dttm descending\}|3|2|$|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|Sort within Groups|429000|87000|0|0|0|0|15135|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|860|0|2306|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|861|0|2309|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|862|0|2312|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|863|0|2314|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|864|0|2317|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|865|0|2320|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|866|0|2324|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|867|0|2328|0|{Subgraph created from graph "get.columnar"|{}@0|@712500|283250|0|0|0|0|15739|De-Dup-1|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|868|0|2330|0|{@{}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|869|0|2332|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|870|0|2334|0|{@{}@384|.5|.5|{0|}15133|17|}}
{2010210004|XXGflow|871|0|2336|0|{@{}@384|.5|.5|{0|}15127|17|}}
{2010210004|XXGflow|872|0|2338|0|{@{}@384|.5|.5|{0|}15137|17|}}
{2010501005|XXGpvertex|873|0|2340|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1;dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|626000|102500|0|0|0|0|15128|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|874|0|2342|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|875|0|2344|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|876|0|2346|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|877|0|2348|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|878|0|2350|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|879|0|2352|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|880|0|2355|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|881|0|2357|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|882|0|2360|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|883|0|2363|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|884|0|2366|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|885|0|2369|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|886|0|2372|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|887|0|2375|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
out :: reformat(in) =
begin
   let hash_key_combine_type dxf_hk =  reinterpret(get_hash(in, $"MAIN_DATASET_NK")) ;
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|out0_metadata|$\{OUT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|45000|88500|0|0|0|0|15138|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|888|0|2377|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|889|0|2380|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|890|0|2382|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|891|0|2384|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|892|0|2386|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|893|0|2388|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|894|0|2390|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|895|0|2394|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|896|0|2397|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|897|0|2400|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|898|0|2403|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|899|0|2406|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
}}@0|Sort|235000|98000|0|0|0|0|15134|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|900|0|2408|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|901|0|2411|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|902|0|2414|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|903|0|2416|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|904|0|2419|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|905|0|2422|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; ids_updt_dttm descending\}|3|2|$|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|Sort within Groups|429000|87000|0|0|0|0|15126|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|906|0|2424|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|907|0|2427|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|908|0|2430|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|909|0|2432|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|910|0|2435|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|911|0|2438|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|912|0|2442|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|913|0|2446|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
}}@0|Trash|386000|208000|0|0|0|0|15732|Discard Suppressed Data|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|914|0|2448|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|915|0|2451|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|916|0|2453|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|917|0|2456|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
}}@0|Trash|381000|403000|0|0|0|0|15734|Discard Suppressed Data-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|918|0|2458|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|919|0|2461|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|920|0|2463|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|921|0|2466|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$FILE|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$DML|3|2|f$|@{0|}}
}}@0|@25000|107000|0|0|0|0|15441|Existing IDS ICFF|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|922|0|2468|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|923|0|2471|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|924|0|2473|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|925|0|2476|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata|$DML|3|2|f$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|select_expr|$FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|$\{OUT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|450000|289250|0|0|0|0|15449|Filter by Expression-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|926|0|2478|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|927|0|2481|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|928|0|2483|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|929|0|2485|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|930|0|2487|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|931|0|2489|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|932|0|2492|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|933|0|2494|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|934|0|2497|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|935|0|2500|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|936|0|2503|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|937|0|2506|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|938|0|2509|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|939|0|2514|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|$FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata|$DML|3|2|f$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|out_metadata|$\{OUT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|450000|84250|0|0|0|0|15719|Filter by Expression-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|940|0|2516|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|941|0|2519|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|942|0|2521|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|943|0|2523|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|944|0|2525|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|945|0|2527|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|946|0|2530|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|947|0|2532|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|948|0|2535|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|949|0|2538|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|950|0|2541|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|951|0|2544|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|952|0|2547|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|953|0|2551|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ARCHIVE_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ARCHIVE_FL|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$DML|3|2|f$|@{0|}}
{30001002|XXparameter|condition|$[IS_READ_ARCHIVE]|3|9||@{0|}}
}}@0|@31000|283750|0|0|0|0|15749|Input File- Archive|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|954|0|2553|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|955|0|2556|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|956|0|2558|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|957|0|2561|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[IS_READ_ARCHIVE]|3|9||@{0|}}
}}@1|Merge|960000|184500|0|0|0|0|15443|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|958|0|2563|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|959|0|2565|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|960|0|2569|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to merge on|{0|}}
{30001002|XXparameter|check_sort|True|13|1|FKl|Abort on first record that is out of sorted order|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 3.1.2.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Merge|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|961|0|2571|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|962|0|2574|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|963|0|2577|0|{@{}@0|0|0|0|out0|.49303621169916434|@@@14352|0|}}
{2010600005|XXGgraph|964|0|2580|0|{Subgraph created from graph "get.columnar"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/read_columnar.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|SERIAL_NUM|3|3|9||@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|$ENABLE_OUTBOUND_SUPPRESSION|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|@10000|427125|0|0|0|0|15711|Read Columnar -3|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1046000|503000|1|}}
{2010240003|XXGlegend|965|0|2582|0|{@{}@Global outbound data
suppression|141000|16000|0|0|0|0|15735|}}
{2010242002|XXGface|966|0|2584|0|{@{}@Arial|0|160|0|}}
{2010210004|XXGflow|967|0|2586|0|{@{}@384|.5|.5|{0|}15750|2065|}}
{2010210004|XXGflow|968|0|2588|0|{@{}@384|.5|.5|{0|}15752|17|}}
{2010243001|XXGwatcher|969|0|2590|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|970|0|2592|0|{@{}@384|.5|.24358974397182465|{0|}15757|17|}}
{2010243001|XXGwatcher|971|0|2594|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|972|0|2596|0|{@{}@384|.5|.5|{0|}15718|17|}}
{2010210004|XXGflow|973|0|2599|0|{@{}@384|.5|.5|{0|}15456|17|}}
{2010210004|XXGflow|974|0|2601|0|{@{}@384|.5|.5|{0|}15738|17|}}
{2010210004|XXGflow|975|0|2603|0|{@{}@384|.5|.5|{0|}15751|17|}}
{2010210004|XXGflow|976|0|2605|0|{@{}@384|.5|.5|{0|}15755|2065|}}
{2010600005|XXGgraph|977|0|2608|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|2|3|9|P|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@150000|75000|0|0|0|0|15754|Data Suppression - Outbound|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|5|}}
{2010203004|XXGoport|978|0|2610|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|979|0|2613|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|980|0|2616|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010503005|XXGfvertex|981|0|2620|0|{|{}@0|@25000|107000|0|0|0|0|15441|Existing IDS ICFF|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|982|0|2622|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|983|0|2627|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|2|3|9|P|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@150000|255000|0|0|0|0|15759|Data Suppression - Outbound-1|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|5|}}
{2010203004|XXGoport|984|0|2629|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|985|0|2632|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|986|0|2635|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010503005|XXGfvertex|987|0|2639|0|{|{}@0|@31000|283750|0|0|0|0|15749|Input File- Archive|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|988|0|2641|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|989|0|2646|0|{Subgraph created from graph "get.columnar"|{}@0|@692500|78250|0|0|0|0|15457|De-Dup|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|990|0|2648|0|{@{}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|991|0|2650|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|992|0|2652|0|{@{}@384|.5|.5|{0|}15133|17|}}
{2010210004|XXGflow|993|0|2654|0|{@{}@384|.5|.5|{0|}15140|17|}}
{2010210004|XXGflow|994|0|2656|0|{@{}@384|.5|.5|{0|}15144|17|}}
{2010501005|XXGpvertex|995|0|2658|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Dedup Sorted|626000|102500|0|0|0|0|15141|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|996|0|2660|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|997|0|2662|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|998|0|2664|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|999|0|2666|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1000|0|2668|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1001|0|2670|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|1002|0|2674|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|45000|88500|0|0|0|0|15145|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1003|0|2676|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|1004|0|2679|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|1005|0|2681|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|1006|0|2683|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1007|0|2685|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1008|0|2688|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Filter by Expression|450000|84250|0|0|0|0|15719|Filter by Expression-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1009|0|2690|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|1010|0|2693|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|1011|0|2695|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1012|0|2697|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1013|0|2699|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1014|0|2701|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1015|0|2711|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|235000|98000|0|0|0|0|15132|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1016|0|2713|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1017|0|2716|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1018|0|2722|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|429000|87000|0|0|0|0|15135|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1019|0|2724|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1020|0|2727|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|1021|0|2733|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|1022|0|2737|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|1023|0|2741|0|{Subgraph created from graph "get.columnar"|{}@0|@712500|283250|0|0|0|0|15739|De-Dup-1|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|1024|0|2743|0|{@{}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|1025|0|2745|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|1026|0|2747|0|{@{}@384|.5|.5|{0|}15133|17|}}
{2010210004|XXGflow|1027|0|2749|0|{@{}@384|.5|.5|{0|}15127|17|}}
{2010501005|XXGpvertex|1028|0|2752|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Dedup Sorted|626000|102500|0|0|0|0|15128|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1029|0|2754|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|1030|0|2756|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|1031|0|2758|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1032|0|2760|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1033|0|2762|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1034|0|2764|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|1035|0|2773|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|235000|98000|0|0|0|0|15134|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1036|0|2775|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1037|0|2778|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1038|0|2784|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|429000|87000|0|0|0|0|15126|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1039|0|2786|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1040|0|2789|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|1041|0|2795|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|1042|0|2799|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|1043|0|2803|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|386000|208000|0|0|0|0|15732|Discard Suppressed Data|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|1044|0|2805|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1045|0|2810|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|381000|403000|0|0|0|0|15734|Discard Suppressed Data-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|1046|0|2812|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1047|0|2821|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Merge|960000|184500|0|0|0|0|15443|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1048|0|2823|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1049|0|2825|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|1050|0|2832|0|{@{}@0|0|0|0|out0|.49303621169916434|@@@14352|0|}}
{2010600005|XXGgraph|1051|0|2836|0|{Subgraph created from graph "get.columnar"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|SERIAL_NUM|1|1|9|RFK|@{0|}}
{30001002|XXparameter|condition|$[length_of(COLUMNARS_READ_INFO_VEC) > (SERIAL_NUM - 1 ) ]|3|9|F||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|FILE|$[ COLUMNARS_READ_INFO_VEC[SERIAL_NUM - 1 ].columnar_file ]|3|9|RFK|@{0|}}
{30001002|XXparameter|DML|$[ COLUMNARS_READ_INFO_VEC[SERIAL_NUM - 1 ].columnar_dml ]|3|9|RFK|@{0|}}
{30001002|XXparameter|ARCHIVE_FL|$[string_replace(FILE,".dat.gz",".archive.dat.gz")]|3|9|RFK|@{0|}}
{30001002|XXparameter|OUT_DML|$[GENERATE_OUT_DML_VEC[SERIAL_NUM - 1 ]]|3|9|RFK|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|True|3|9|RFK|@{0|}}
{30001002|XXparameter|mpcmodtime|1596810186|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|@11750|192125|0|0|0|0|15388|First Columnar||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1046000|503000|7|}}
{2010240003|XXGlegend|1052|0|2838|0|{@{}@Global outbound data
suppression|141000|16000|0|0|0|0|15735|}}
{2010242002|XXGface|1053|0|2840|0|{@{}@Arial|0|160|0|}}
{2010210004|XXGflow|1054|0|2842|0|{@{}@384|.5|.5|{0|}15750|2065|}}
{2010210004|XXGflow|1055|0|2844|0|{@{}@384|.5|.5|{0|}15752|17|}}
{2010243001|XXGwatcher|1056|0|2846|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|1057|0|2848|0|{@{}@384|.5|.24358974397182465|{0|}15757|17|}}
{2010243001|XXGwatcher|1058|0|2850|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|1059|0|2852|0|{@{}@384|.5|.5|{0|}15718|17|}}
{2010210004|XXGflow|1060|0|2854|0|{@{}@384|.5|.5|{0|}15737|17|}}
{2010210004|XXGflow|1061|0|2856|0|{@{}@384|.5|.5|{0|}15456|17|}}
{2010210004|XXGflow|1062|0|2858|0|{@{}@384|.5|.5|{0|}15738|17|}}
{2010210004|XXGflow|1063|0|2860|0|{@{}@384|.5|.5|{0|}15751|17|}}
{2010210004|XXGflow|1064|0|2862|0|{@{}@384|.5|.5|{0|}15755|2065|}}
{2010210004|XXGflow|1065|0|2864|0|{@{}@384|.5|.5|{0|}15756|17|}}
{2010600005|XXGgraph|1066|0|2866|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|1|3|9|P|@{0|}}
{30001002|XXparameter|!prototype|$PUB_DXF_COMPONENTS/data_suppression.outbound.mgi|3|9|Pf|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|$ENABLE_OUTBOUND_SUPPRESSION|3|9||@{0|}}
}}@0|@150000|75000|0|0|0|0|15754|Data Suppression - Outbound|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|5|}}
{2010600005|XXGgraph|1067|0|2868|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|implementation|$PUB_DXF_COMPONENTS/data_suppression.outbound.mp|44|9|RFf|A target subgraph that implements this interface, or a pset for one.|{0|}}
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
{30001002|XXparameter|EXPRESSION_LOOKUP_CONTENTS|@3|9|FK|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|True|13|9|RFK|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Layout.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|Layout.layout_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|in0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|in0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|out0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|out0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|deselect_metadata||7|9|RF||{0|}}
{30001002|XXparameter|deselect_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1563451632|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in0 = out0
metadata type: out0 = in0
metadata type: in0 = deselect
metadata type: deselect = in0|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|Graph Interface|||1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|600000|400000|7|}}
{2010203004|XXGoport|1068|0|2870|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|1069|0|2873|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|1070|0|2876|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010203004|XXGoport|1071|0|2879|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|1072|0|2882|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|1073|0|2885|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010600005|XXGgraph|1074|0|2888|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|1|3|9|P|@{0|}}
{30001002|XXparameter|!prototype|$PUB_DXF_COMPONENTS/data_suppression.outbound.mgi|3|9|Pf|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|$ENABLE_OUTBOUND_SUPPRESSION|3|9||@{0|}}
}}@0|@150000|255000|0|0|0|0|15759|Data Suppression - Outbound-1|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|5|}}
{2010600005|XXGgraph|1075|0|2890|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|implementation|$PUB_DXF_COMPONENTS/data_suppression.outbound.mp|44|9|RFf|A target subgraph that implements this interface, or a pset for one.|{0|}}
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
{30001002|XXparameter|EXPRESSION_LOOKUP_CONTENTS|@3|9|FK|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|True|13|9|RFK|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Layout.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|Layout.layout_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|in0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|in0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|out0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|out0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|deselect_metadata||7|9|RF||{0|}}
{30001002|XXparameter|deselect_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1563451632|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in0 = out0
metadata type: out0 = in0
metadata type: in0 = deselect
metadata type: deselect = in0|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|Graph Interface|||1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|600000|400000|7|}}
{2010203004|XXGoport|1076|0|2892|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|1077|0|2895|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|1078|0|2898|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010203004|XXGoport|1079|0|2901|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|1080|0|2904|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|1081|0|2907|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010600005|XXGgraph|1082|0|2910|0|{Subgraph created from graph "get.columnar"|{}@0|@692500|78250|0|0|0|0|15457|De-Dup|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|1083|0|2912|0|{@{}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|1084|0|2914|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|1085|0|2916|0|{@{}@384|.5|.5|{0|}15133|17|}}
{2010210004|XXGflow|1086|0|2918|0|{@{}@384|.5|.5|{0|}15140|17|}}
{2010210004|XXGflow|1087|0|2920|0|{@{}@384|.5|.5|{0|}15144|17|}}
{2010501005|XXGpvertex|1088|0|2922|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1;dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|626000|102500|0|0|0|0|15141|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1089|0|2924|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|1090|0|2926|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|1091|0|2928|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1092|0|2930|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1093|0|2932|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1094|0|2934|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|1095|0|2937|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1096|0|2939|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|1097|0|2942|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|1098|0|2945|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1099|0|2948|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1100|0|2951|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1101|0|2954|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|1102|0|2957|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
out :: reformat(in) =
begin
   let hash_key_combine_type dxf_hk =  reinterpret(get_hash(in, $MAIN_DATASET_NK)) ;
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|out0_metadata|$\{OUT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|45000|88500|0|0|0|0|15145|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1103|0|2959|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|1104|0|2962|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|1105|0|2964|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|1106|0|2966|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1107|0|2968|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1108|0|2970|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1109|0|2972|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|1110|0|2976|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|1111|0|2979|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|1112|0|2982|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1113|0|2985|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1114|0|2988|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
}}@0|Sort|235000|98000|0|0|0|0|15132|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1115|0|2990|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1116|0|2993|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1117|0|2996|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1118|0|2998|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1119|0|3001|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1120|0|3004|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; ids_updt_dttm descending\}|3|2|$|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|Sort within Groups|429000|87000|0|0|0|0|15135|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1121|0|3006|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1122|0|3009|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|1123|0|3012|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|1124|0|3014|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1125|0|3017|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|1126|0|3020|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|1127|0|3024|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|1128|0|3028|0|{Subgraph created from graph "get.columnar"|{}@0|@712500|283250|0|0|0|0|15739|De-Dup-1|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|1129|0|3030|0|{@{}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|1130|0|3032|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|1131|0|3034|0|{@{}@384|.5|.5|{0|}15133|17|}}
{2010210004|XXGflow|1132|0|3036|0|{@{}@384|.5|.5|{0|}15127|17|}}
{2010210004|XXGflow|1133|0|3038|0|{@{}@384|.5|.5|{0|}15137|17|}}
{2010501005|XXGpvertex|1134|0|3040|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1;dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|626000|102500|0|0|0|0|15128|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1135|0|3042|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|1136|0|3044|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|1137|0|3046|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1138|0|3048|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1139|0|3050|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1140|0|3052|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|1141|0|3055|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1142|0|3057|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|1143|0|3060|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|1144|0|3063|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1145|0|3066|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1146|0|3069|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1147|0|3072|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|1148|0|3075|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
out :: reformat(in) =
begin
   let hash_key_combine_type dxf_hk =  reinterpret(get_hash(in, $"MAIN_DATASET_NK")) ;
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|out0_metadata|$\{OUT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|45000|88500|0|0|0|0|15138|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1149|0|3077|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|1150|0|3080|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|1151|0|3082|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|1152|0|3084|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1153|0|3086|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1154|0|3088|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1155|0|3090|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|1156|0|3094|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|1157|0|3097|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|1158|0|3100|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1159|0|3103|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1160|0|3106|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
}}@0|Sort|235000|98000|0|0|0|0|15134|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1161|0|3108|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1162|0|3111|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1163|0|3114|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1164|0|3116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1165|0|3119|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1166|0|3122|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; ids_updt_dttm descending\}|3|2|$|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|Sort within Groups|429000|87000|0|0|0|0|15126|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1167|0|3124|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1168|0|3127|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|1169|0|3130|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|1170|0|3132|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1171|0|3135|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|1172|0|3138|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|1173|0|3142|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|1174|0|3146|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
}}@0|Trash|386000|208000|0|0|0|0|15732|Discard Suppressed Data|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|1175|0|3148|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1176|0|3151|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|1177|0|3153|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1178|0|3156|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
}}@0|Trash|381000|403000|0|0|0|0|15734|Discard Suppressed Data-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|1179|0|3158|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1180|0|3161|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|1181|0|3163|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|1182|0|3166|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$FILE|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$DML|3|2|f$|@{0|}}
}}@0|@25000|107000|0|0|0|0|15441|Existing IDS ICFF|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|1183|0|3168|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|1184|0|3171|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|1185|0|3173|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|1186|0|3176|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata|$DML|3|2|f$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|select_expr|$FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|$\{OUT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|450000|289250|0|0|0|0|15449|Filter by Expression-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1187|0|3178|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|1188|0|3181|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|1189|0|3183|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1190|0|3185|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1191|0|3187|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1192|0|3189|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1193|0|3192|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|1194|0|3194|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|1195|0|3197|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|1196|0|3200|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1197|0|3203|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1198|0|3206|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1199|0|3209|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1200|0|3214|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|$FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata|$DML|3|2|f$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|out_metadata|$\{OUT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|450000|84250|0|0|0|0|15719|Filter by Expression-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1201|0|3216|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|1202|0|3219|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|1203|0|3221|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1204|0|3223|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1205|0|3225|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1206|0|3227|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1207|0|3230|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|1208|0|3232|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|1209|0|3235|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|1210|0|3238|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1211|0|3241|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1212|0|3244|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1213|0|3247|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|1214|0|3251|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ARCHIVE_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ARCHIVE_FL|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$DML|3|2|f$|@{0|}}
{30001002|XXparameter|condition|$[IS_READ_ARCHIVE]|3|9||@{0|}}
}}@0|@31000|283750|0|0|0|0|15749|Input File- Archive|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|1215|0|3253|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|1216|0|3256|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|1217|0|3258|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|1218|0|3261|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[IS_READ_ARCHIVE]|3|9||@{0|}}
}}@1|Merge|960000|184500|0|0|0|0|15443|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1219|0|3263|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1220|0|3265|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|1221|0|3269|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to merge on|{0|}}
{30001002|XXparameter|check_sort|True|13|1|FKl|Abort on first record that is out of sorted order|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 3.1.2.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Merge|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1222|0|3271|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1223|0|3274|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|1224|0|3277|0|{@{}@0|0|0|0|out0|.49303621169916434|@@@14352|0|}}
{2010600005|XXGgraph|1225|0|3280|0|{Subgraph created from graph "get.columnar"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/read_columnar.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|SERIAL_NUM|4|3|9||@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|$ENABLE_OUTBOUND_SUPPRESSION|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|@10000|567125|0|0|0|0|15713|Read Columnar -4|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1046000|503000|1|}}
{2010240003|XXGlegend|1226|0|3282|0|{@{}@Global outbound data
suppression|141000|16000|0|0|0|0|15735|}}
{2010242002|XXGface|1227|0|3284|0|{@{}@Arial|0|160|0|}}
{2010210004|XXGflow|1228|0|3286|0|{@{}@384|.5|.5|{0|}15750|2065|}}
{2010210004|XXGflow|1229|0|3288|0|{@{}@384|.5|.5|{0|}15752|17|}}
{2010243001|XXGwatcher|1230|0|3290|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|1231|0|3292|0|{@{}@384|.5|.24358974397182465|{0|}15757|17|}}
{2010243001|XXGwatcher|1232|0|3294|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|1233|0|3296|0|{@{}@384|.5|.5|{0|}15718|17|}}
{2010210004|XXGflow|1234|0|3299|0|{@{}@384|.5|.5|{0|}15456|17|}}
{2010210004|XXGflow|1235|0|3301|0|{@{}@384|.5|.5|{0|}15738|17|}}
{2010210004|XXGflow|1236|0|3303|0|{@{}@384|.5|.5|{0|}15751|17|}}
{2010210004|XXGflow|1237|0|3305|0|{@{}@384|.5|.5|{0|}15755|2065|}}
{2010600005|XXGgraph|1238|0|3308|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|2|3|9|P|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
}}@0|@150000|75000|0|0|0|0|15754|Data Suppression - Outbound|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|5|}}
{2010203004|XXGoport|1239|0|3310|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|1240|0|3313|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|1241|0|3316|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010503005|XXGfvertex|1242|0|3320|0|{|{}@0|@25000|107000|0|0|0|0|15441|Existing IDS ICFF|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|1243|0|3322|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|1244|0|3327|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|2|3|9|P|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
}}@0|@150000|255000|0|0|0|0|15759|Data Suppression - Outbound-1|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|5|}}
{2010203004|XXGoport|1245|0|3329|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|1246|0|3332|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|1247|0|3335|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010503005|XXGfvertex|1248|0|3339|0|{|{}@0|@31000|283750|0|0|0|0|15749|Input File- Archive|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|1249|0|3341|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|1250|0|3346|0|{Subgraph created from graph "get.columnar"|{}@0|@692500|78250|0|0|0|0|15457|De-Dup|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|1251|0|3348|0|{@{}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|1252|0|3350|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|1253|0|3352|0|{@{}@384|.5|.5|{0|}15133|17|}}
{2010210004|XXGflow|1254|0|3354|0|{@{}@384|.5|.5|{0|}15140|17|}}
{2010210004|XXGflow|1255|0|3356|0|{@{}@384|.5|.5|{0|}15144|17|}}
{2010501005|XXGpvertex|1256|0|3358|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|Dedup Sorted|626000|102500|0|0|0|0|15141|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1257|0|3360|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|1258|0|3362|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|1259|0|3364|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1260|0|3366|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1261|0|3368|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1262|0|3370|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|1263|0|3374|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
}}@0|Reformat|45000|88500|0|0|0|0|15145|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1264|0|3376|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|1265|0|3379|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|1266|0|3381|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|1267|0|3383|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1268|0|3385|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1269|0|3388|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
}}@0|Filter by Expression|450000|84250|0|0|0|0|15719|Filter by Expression-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1270|0|3390|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|1271|0|3393|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|1272|0|3395|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1273|0|3397|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1274|0|3399|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1275|0|3401|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1276|0|3411|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Sort|235000|98000|0|0|0|0|15132|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1277|0|3413|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1278|0|3416|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1279|0|3422|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Sort within Groups|429000|87000|0|0|0|0|15135|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1280|0|3424|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1281|0|3427|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|1282|0|3433|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|1283|0|3437|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|1284|0|3441|0|{Subgraph created from graph "get.columnar"|{}@0|@712500|283250|0|0|0|0|15739|De-Dup-1|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|1285|0|3443|0|{@{}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|1286|0|3445|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|1287|0|3447|0|{@{}@384|.5|.5|{0|}15133|17|}}
{2010210004|XXGflow|1288|0|3449|0|{@{}@384|.5|.5|{0|}15127|17|}}
{2010501005|XXGpvertex|1289|0|3452|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|Dedup Sorted|626000|102500|0|0|0|0|15128|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1290|0|3454|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|1291|0|3456|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|1292|0|3458|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1293|0|3460|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1294|0|3462|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1295|0|3464|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|1296|0|3473|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Sort|235000|98000|0|0|0|0|15134|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1297|0|3475|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1298|0|3478|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1299|0|3484|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Sort within Groups|429000|87000|0|0|0|0|15126|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1300|0|3486|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1301|0|3489|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|1302|0|3495|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|1303|0|3499|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|1304|0|3503|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|Trash|386000|208000|0|0|0|0|15732|Discard Suppressed Data|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|1305|0|3505|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1306|0|3510|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|Trash|381000|403000|0|0|0|0|15734|Discard Suppressed Data-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|1307|0|3512|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1308|0|3521|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Merge|960000|184500|0|0|0|0|15443|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1309|0|3523|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1310|0|3525|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|1311|0|3532|0|{@{}@0|0|0|0|out0|.49303621169916434|@@@14352|0|}}
{2010600005|XXGgraph|1312|0|3536|0|{Subgraph created from graph "get.columnar"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|SERIAL_NUM|1|1|9|RFK|@{0|}}
{30001002|XXparameter|condition|$[length_of(COLUMNARS_READ_INFO_VEC) > (SERIAL_NUM - 1 ) ]|3|9|F||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|FILE|$[ COLUMNARS_READ_INFO_VEC[SERIAL_NUM - 1 ].columnar_file ]|3|9|RFK|@{0|}}
{30001002|XXparameter|DML|$[ COLUMNARS_READ_INFO_VEC[SERIAL_NUM - 1 ].columnar_dml ]|3|9|RFK|@{0|}}
{30001002|XXparameter|ARCHIVE_FL|$[string_replace(FILE,".dat.gz",".archive.dat.gz")]|3|9|RFK|@{0|}}
{30001002|XXparameter|OUT_DML|$[GENERATE_OUT_DML_VEC[SERIAL_NUM - 1 ]]|3|9|RFK|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|True|3|9|RFK|@{0|}}
{30001002|XXparameter|mpcmodtime|1596810186|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|@11750|192125|0|0|0|0|15388|First Columnar||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1046000|503000|7|}}
{2010240003|XXGlegend|1313|0|3538|0|{@{}@Global outbound data
suppression|141000|16000|0|0|0|0|15735|}}
{2010242002|XXGface|1314|0|3540|0|{@{}@Arial|0|160|0|}}
{2010210004|XXGflow|1315|0|3542|0|{@{}@384|.5|.5|{0|}15750|2065|}}
{2010210004|XXGflow|1316|0|3544|0|{@{}@384|.5|.5|{0|}15752|17|}}
{2010243001|XXGwatcher|1317|0|3546|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|1318|0|3548|0|{@{}@384|.5|.24358974397182465|{0|}15757|17|}}
{2010243001|XXGwatcher|1319|0|3550|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|1320|0|3552|0|{@{}@384|.5|.5|{0|}15718|17|}}
{2010210004|XXGflow|1321|0|3554|0|{@{}@384|.5|.5|{0|}15737|17|}}
{2010210004|XXGflow|1322|0|3556|0|{@{}@384|.5|.5|{0|}15456|17|}}
{2010210004|XXGflow|1323|0|3558|0|{@{}@384|.5|.5|{0|}15738|17|}}
{2010210004|XXGflow|1324|0|3560|0|{@{}@384|.5|.5|{0|}15751|17|}}
{2010210004|XXGflow|1325|0|3562|0|{@{}@384|.5|.5|{0|}15755|2065|}}
{2010210004|XXGflow|1326|0|3564|0|{@{}@384|.5|.5|{0|}15756|17|}}
{2010600005|XXGgraph|1327|0|3566|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|1|3|9|P|@{0|}}
{30001002|XXparameter|!prototype|$PUB_DXF_COMPONENTS/data_suppression.outbound.mgi|3|9|Pf|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|$ENABLE_OUTBOUND_SUPPRESSION|3|9||@{0|}}
}}@0|@150000|75000|0|0|0|0|15754|Data Suppression - Outbound|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|5|}}
{2010600005|XXGgraph|1328|0|3568|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|implementation|$PUB_DXF_COMPONENTS/data_suppression.outbound.mp|44|9|RFf|A target subgraph that implements this interface, or a pset for one.|{0|}}
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
{30001002|XXparameter|EXPRESSION_LOOKUP_CONTENTS|@3|9|FK|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|True|13|9|RFK|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Layout.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|Layout.layout_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|in0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|in0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|out0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|out0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|deselect_metadata||7|9|RF||{0|}}
{30001002|XXparameter|deselect_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1563451632|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in0 = out0
metadata type: out0 = in0
metadata type: in0 = deselect
metadata type: deselect = in0|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|Graph Interface|||1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|600000|400000|7|}}
{2010203004|XXGoport|1329|0|3570|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|1330|0|3573|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|1331|0|3576|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010203004|XXGoport|1332|0|3579|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|1333|0|3582|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|1334|0|3585|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010600005|XXGgraph|1335|0|3588|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|1|3|9|P|@{0|}}
{30001002|XXparameter|!prototype|$PUB_DXF_COMPONENTS/data_suppression.outbound.mgi|3|9|Pf|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|$ENABLE_OUTBOUND_SUPPRESSION|3|9||@{0|}}
}}@0|@150000|255000|0|0|0|0|15759|Data Suppression - Outbound-1|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|5|}}
{2010600005|XXGgraph|1336|0|3590|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|implementation|$PUB_DXF_COMPONENTS/data_suppression.outbound.mp|44|9|RFf|A target subgraph that implements this interface, or a pset for one.|{0|}}
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
{30001002|XXparameter|EXPRESSION_LOOKUP_CONTENTS|@3|9|FK|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|True|13|9|RFK|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Layout.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|Layout.layout_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|in0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|in0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|out0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|out0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|deselect_metadata||7|9|RF||{0|}}
{30001002|XXparameter|deselect_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1563451632|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in0 = out0
metadata type: out0 = in0
metadata type: in0 = deselect
metadata type: deselect = in0|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|Graph Interface|||1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|600000|400000|7|}}
{2010203004|XXGoport|1337|0|3592|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|1338|0|3595|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|1339|0|3598|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010203004|XXGoport|1340|0|3601|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|1341|0|3604|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|1342|0|3607|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010600005|XXGgraph|1343|0|3610|0|{Subgraph created from graph "get.columnar"|{}@0|@692500|78250|0|0|0|0|15457|De-Dup|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|1344|0|3612|0|{@{}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|1345|0|3614|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|1346|0|3616|0|{@{}@384|.5|.5|{0|}15133|17|}}
{2010210004|XXGflow|1347|0|3618|0|{@{}@384|.5|.5|{0|}15140|17|}}
{2010210004|XXGflow|1348|0|3620|0|{@{}@384|.5|.5|{0|}15144|17|}}
{2010501005|XXGpvertex|1349|0|3622|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1;dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|626000|102500|0|0|0|0|15141|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1350|0|3624|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|1351|0|3626|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|1352|0|3628|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1353|0|3630|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1354|0|3632|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1355|0|3634|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|1356|0|3637|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1357|0|3639|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|1358|0|3642|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|1359|0|3645|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1360|0|3648|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1361|0|3651|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1362|0|3654|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|1363|0|3657|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
out :: reformat(in) =
begin
   let hash_key_combine_type dxf_hk =  reinterpret(get_hash(in, $MAIN_DATASET_NK)) ;
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|out0_metadata|$\{OUT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|45000|88500|0|0|0|0|15145|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1364|0|3659|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|1365|0|3662|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|1366|0|3664|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|1367|0|3666|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1368|0|3668|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1369|0|3670|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1370|0|3672|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|1371|0|3676|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|1372|0|3679|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|1373|0|3682|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1374|0|3685|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1375|0|3688|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
}}@0|Sort|235000|98000|0|0|0|0|15132|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1376|0|3690|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1377|0|3693|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1378|0|3696|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1379|0|3698|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1380|0|3701|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1381|0|3704|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; ids_updt_dttm descending\}|3|2|$|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|Sort within Groups|429000|87000|0|0|0|0|15135|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1382|0|3706|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1383|0|3709|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|1384|0|3712|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|1385|0|3714|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1386|0|3717|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|1387|0|3720|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|1388|0|3724|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|1389|0|3728|0|{Subgraph created from graph "get.columnar"|{}@0|@712500|283250|0|0|0|0|15739|De-Dup-1|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|1390|0|3730|0|{@{}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|1391|0|3732|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|1392|0|3734|0|{@{}@384|.5|.5|{0|}15133|17|}}
{2010210004|XXGflow|1393|0|3736|0|{@{}@384|.5|.5|{0|}15127|17|}}
{2010210004|XXGflow|1394|0|3738|0|{@{}@384|.5|.5|{0|}15137|17|}}
{2010501005|XXGpvertex|1395|0|3740|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1;dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|626000|102500|0|0|0|0|15128|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1396|0|3742|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|1397|0|3744|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|1398|0|3746|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1399|0|3748|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1400|0|3750|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1401|0|3752|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|1402|0|3755|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1403|0|3757|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|1404|0|3760|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|1405|0|3763|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1406|0|3766|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1407|0|3769|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1408|0|3772|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|1409|0|3775|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
out :: reformat(in) =
begin
   let hash_key_combine_type dxf_hk =  reinterpret(get_hash(in, $"MAIN_DATASET_NK")) ;
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|out0_metadata|$\{OUT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|45000|88500|0|0|0|0|15138|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1410|0|3777|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|1411|0|3780|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|1412|0|3782|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|1413|0|3784|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1414|0|3786|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1415|0|3788|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1416|0|3790|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|1417|0|3794|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|1418|0|3797|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|1419|0|3800|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1420|0|3803|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1421|0|3806|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
}}@0|Sort|235000|98000|0|0|0|0|15134|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1422|0|3808|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1423|0|3811|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1424|0|3814|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1425|0|3816|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1426|0|3819|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1427|0|3822|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; ids_updt_dttm descending\}|3|2|$|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|Sort within Groups|429000|87000|0|0|0|0|15126|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1428|0|3824|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1429|0|3827|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|1430|0|3830|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|1431|0|3832|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1432|0|3835|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|1433|0|3838|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|1434|0|3842|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|1435|0|3846|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
}}@0|Trash|386000|208000|0|0|0|0|15732|Discard Suppressed Data|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|1436|0|3848|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1437|0|3851|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|1438|0|3853|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1439|0|3856|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
}}@0|Trash|381000|403000|0|0|0|0|15734|Discard Suppressed Data-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|1440|0|3858|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1441|0|3861|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|1442|0|3863|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|1443|0|3866|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$FILE|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$DML|3|2|f$|@{0|}}
}}@0|@25000|107000|0|0|0|0|15441|Existing IDS ICFF|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|1444|0|3868|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|1445|0|3871|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|1446|0|3873|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|1447|0|3876|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata|$DML|3|2|f$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|select_expr|$FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|$\{OUT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|450000|289250|0|0|0|0|15449|Filter by Expression-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1448|0|3878|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|1449|0|3881|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|1450|0|3883|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1451|0|3885|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1452|0|3887|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1453|0|3889|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1454|0|3892|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|1455|0|3894|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|1456|0|3897|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|1457|0|3900|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1458|0|3903|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1459|0|3906|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1460|0|3909|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1461|0|3914|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|$FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata|$DML|3|2|f$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|out_metadata|$\{OUT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|450000|84250|0|0|0|0|15719|Filter by Expression-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1462|0|3916|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|1463|0|3919|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|1464|0|3921|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1465|0|3923|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1466|0|3925|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1467|0|3927|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1468|0|3930|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|1469|0|3932|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|1470|0|3935|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|1471|0|3938|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|1472|0|3941|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1473|0|3944|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|1474|0|3947|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|1475|0|3951|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ARCHIVE_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ARCHIVE_FL|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$DML|3|2|f$|@{0|}}
{30001002|XXparameter|condition|$[IS_READ_ARCHIVE]|3|9||@{0|}}
}}@0|@31000|283750|0|0|0|0|15749|Input File- Archive|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|1476|0|3953|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|1477|0|3956|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|1478|0|3958|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|1479|0|3961|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[IS_READ_ARCHIVE]|3|9||@{0|}}
}}@1|Merge|960000|184500|0|0|0|0|15443|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1480|0|3963|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1481|0|3965|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|1482|0|3969|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to merge on|{0|}}
{30001002|XXparameter|check_sort|True|13|1|FKl|Abort on first record that is out of sorted order|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 3.1.2.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Merge|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1483|0|3971|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1484|0|3974|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|1485|0|3977|0|{@{}@0|0|0|0|out0|.49303621169916434|@@@14352|0|}}
{2010600005|XXGgraph|1486|0|3980|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@15000|60000|0|0|0|0|15399|Version Log|Mukesh.singh|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|821000|470000|3|}}
{2010240003|XXGlegend|1487|0|3982|0|{@{}@Date|92000|66000|0|0|0|0|7|}}
{2010242002|XXGface|1488|0|3984|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|1489|0|3986|0|{@{}@Author|217000|66000|0|0|0|0|99|}}
{2010242002|XXGface|1490|0|3988|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|1491|0|3990|0|{@{}@Description|417000|66000|0|0|0|0|28|}}
{2010242002|XXGface|1492|0|3992|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|1493|0|3994|0|{@{}@Version|17000|66000|0|0|0|0|4|}}
{2010242002|XXGface|1494|0|3996|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|1495|0|3998|0|{@{}@1.0|17000|88000|0|0|0|0|105|}}
{2010242002|XXGface|1496|0|4000|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|1497|0|4002|0|{@{}@Jan 11 2017|82000|88000|0|0|0|0|107|}}
{2010242002|XXGface|1498|0|4004|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|1499|0|4006|0|{@{}@Mukesh.Singh (Exusia)|187000|88000|0|0|0|0|109|}}
{2010242002|XXGface|1500|0|4008|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|1501|0|4010|0|{@{}@Initial version - This version only support Data and Index consolidation in 
IDS dimensions
|412000|83000|0|0|0|0|112|}}
{2010242002|XXGface|1502|0|4012|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|1503|0|4014|0|{@{}@1.0|17000|123000|0|0|0|0|106|}}
{2010242002|XXGface|1504|0|4016|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|1505|0|4018|0|{@{}@July 11 2017|77000|123000|0|0|0|0|114|}}
{2010242002|XXGface|1506|0|4020|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|1507|0|4022|0|{@{}@Mukesh.Singh (Exusia)|187000|123000|0|0|0|0|110|}}
{2010242002|XXGface|1508|0|4024|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|1509|0|4026|0|{@{}@Xref Consolidation functionality is added|412000|123000|0|0|0|0|113|}}
{2010242002|XXGface|1510|0|4028|0|{@{}@Arial Narrow|0|100|0|}}
{2010110002|XXGconstant|1511|0|4030|0|{@{}@{1|1024275|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_1|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_12|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_13|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_14|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_2|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_3|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_4|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_5|}1|14|}
{2010601001|XXGgraph_vertex_vertex|14|0|28|0|{Join_4_input|}1|15|}
{2010212001|XXGvertex_oport_oport|15|0|30|0|{0|out|}15|16|}
{2010213001|XXGoport_dst_flow|16|0|32|0|{0|}16|14|}
{2010212001|XXGvertex_oport_oport|17|0|33|0|{1|unused0|}15|17|}
{2010212001|XXGvertex_oport_oport|18|0|35|0|{2|unused1|}15|18|}
{2010212001|XXGvertex_oport_oport|19|0|37|0|{3|unused2|}15|19|}
{2010212001|XXGvertex_oport_oport|20|0|39|0|{4|unused3|}15|20|}
{2010212001|XXGvertex_oport_oport|21|0|41|0|{5|reject0|}15|21|}
{2010212001|XXGvertex_oport_oport|22|0|43|0|{6|reject1|}15|22|}
{2010212001|XXGvertex_oport_oport|23|0|45|0|{7|reject2|}15|23|}
{2010212001|XXGvertex_oport_oport|24|0|47|0|{8|reject3|}15|24|}
{2010212001|XXGvertex_oport_oport|25|0|49|0|{9|error0|}15|25|}
{2010212001|XXGvertex_oport_oport|26|0|51|0|{10|error1|}15|26|}
{2010212001|XXGvertex_oport_oport|27|0|53|0|{11|error2|}15|27|}
{2010212001|XXGvertex_oport_oport|28|0|55|0|{12|error3|}15|28|}
{2010212001|XXGvertex_oport_oport|29|0|57|0|{13|log|}15|29|}
{2010211001|XXGvertex_iport_iport|30|0|59|0|{0|in0|}15|30|}
{2010214001|XXGiport_src_flow|31|0|61|0|{0|}30|7|}
{2010211001|XXGvertex_iport_iport|32|0|62|0|{1|in1|}15|31|}
{2010214001|XXGiport_src_flow|33|0|64|0|{0|}31|11|}
{2010211001|XXGvertex_iport_iport|34|0|65|0|{2|in2|}15|32|}
{2010214001|XXGiport_src_flow|35|0|67|0|{0|}32|12|}
{2010211001|XXGvertex_iport_iport|36|0|68|0|{3|in3|}15|33|}
{2010214001|XXGiport_src_flow|37|0|70|0|{0|}33|13|}
{2010007001|XXGobject_proto_object|38|0|71|0|{}15|34|}
{2010212001|XXGvertex_oport_oport|39|0|73|0|{0|out|}34|35|}
{2010006001|XXGobject_psameas_object|40|0|75|0|{metadata|out_metadata|1|0|}35|34|}
{2010212001|XXGvertex_oport_oport|41|0|76|0|{1|unused0|}34|36|}
{2010006001|XXGobject_psameas_object|42|0|78|0|{metadata|unused0_metadata|1|0|}36|34|}
{2010212001|XXGvertex_oport_oport|43|0|79|0|{2|unused1|}34|37|}
{2010006001|XXGobject_psameas_object|44|0|81|0|{metadata|unused1_metadata|1|0|}37|34|}
{2010212001|XXGvertex_oport_oport|45|0|82|0|{3|unused2|}34|38|}
{2010006001|XXGobject_psameas_object|46|0|84|0|{metadata|unused2_metadata|1|0|}38|34|}
{2010212001|XXGvertex_oport_oport|47|0|85|0|{4|unused3|}34|39|}
{2010006001|XXGobject_psameas_object|48|0|87|0|{metadata|unused3_metadata|1|0|}39|34|}
{2010212001|XXGvertex_oport_oport|49|0|88|0|{5|reject0|}34|40|}
{2010006001|XXGobject_psameas_object|50|0|90|0|{metadata|reject0_metadata|1|0|}40|34|}
{2010212001|XXGvertex_oport_oport|51|0|91|0|{6|reject1|}34|41|}
{2010006001|XXGobject_psameas_object|52|0|93|0|{metadata|reject1_metadata|1|0|}41|34|}
{2010212001|XXGvertex_oport_oport|53|0|94|0|{7|reject2|}34|42|}
{2010006001|XXGobject_psameas_object|54|0|96|0|{metadata|reject2_metadata|1|0|}42|34|}
{2010212001|XXGvertex_oport_oport|55|0|97|0|{8|reject3|}34|43|}
{2010006001|XXGobject_psameas_object|56|0|99|0|{metadata|reject3_metadata|1|0|}43|34|}
{2010212001|XXGvertex_oport_oport|57|0|100|0|{9|error0|}34|44|}
{2010006001|XXGobject_psameas_object|58|0|102|0|{metadata|error0_metadata|1|0|}44|34|}
{2010212001|XXGvertex_oport_oport|59|0|103|0|{10|error1|}34|45|}
{2010006001|XXGobject_psameas_object|60|0|105|0|{metadata|error1_metadata|1|0|}45|34|}
{2010212001|XXGvertex_oport_oport|61|0|106|0|{11|error2|}34|46|}
{2010006001|XXGobject_psameas_object|62|0|108|0|{metadata|error2_metadata|1|0|}46|34|}
{2010212001|XXGvertex_oport_oport|63|0|109|0|{12|error3|}34|47|}
{2010006001|XXGobject_psameas_object|64|0|111|0|{metadata|error3_metadata|1|0|}47|34|}
{2010212001|XXGvertex_oport_oport|65|0|112|0|{13|log|}34|48|}
{2010006001|XXGobject_psameas_object|66|0|114|0|{metadata|log_metadata|1|0|}48|34|}
{2010211001|XXGvertex_iport_iport|67|0|115|0|{0|in0|}34|49|}
{2010006001|XXGobject_psameas_object|68|0|117|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|1|0|}49|34|}
{2010006001|XXGobject_psameas_object|69|0|118|0|{dedup0|dedup0|1|0|}49|34|}
{2010006001|XXGobject_psameas_object|70|0|119|0|{dedup_keyword0|dedup_keyword0|1|0|}49|34|}
{2010006001|XXGobject_psameas_object|71|0|120|0|{dedup_positional0|dedup_positional0|1|0|}49|34|}
{2010006001|XXGobject_psameas_object|72|0|121|0|{matchoptional_keyword0|matchoptional_keyword0|1|0|}49|34|}
{2010006001|XXGobject_psameas_object|73|0|122|0|{matchoptional_positional0|matchoptional_positional0|1|0|}49|34|}
{2010006001|XXGobject_psameas_object|74|0|123|0|{metadata|in0_metadata|1|0|}49|34|}
{2010006001|XXGobject_psameas_object|75|0|124|0|{override_key0|override_key0|1|0|}49|34|}
{2010006001|XXGobject_psameas_object|76|0|125|0|{record_match_required0|record_match_required0|1|0|}49|34|}
{2010006001|XXGobject_psameas_object|77|0|126|0|{record_match_required_not0|record_match_required_not0|1|0|}49|34|}
{2010006001|XXGobject_psameas_object|78|0|127|0|{record_required0|record_required0|1|0|}49|34|}
{2010006001|XXGobject_psameas_object|79|0|128|0|{record_required_keyword0|record_required_keyword0|1|0|}49|34|}
{2010006001|XXGobject_psameas_object|80|0|129|0|{record_required_positional0|record_required_positional0|1|0|}49|34|}
{2010006001|XXGobject_psameas_object|81|0|130|0|{select0|select0|1|0|}49|34|}
{2010006001|XXGobject_psameas_object|82|0|131|0|{select_keyword0|select_keyword0|1|0|}49|34|}
{2010006001|XXGobject_psameas_object|83|0|132|0|{select_positional0|select_positional0|1|0|}49|34|}
{2010211001|XXGvertex_iport_iport|84|0|133|0|{1|in1|}34|50|}
{2010006001|XXGobject_psameas_object|85|0|135|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|1|0|}50|34|}
{2010006001|XXGobject_psameas_object|86|0|136|0|{dedup1|dedup1|1|0|}50|34|}
{2010006001|XXGobject_psameas_object|87|0|137|0|{dedup_keyword1|dedup_keyword1|1|0|}50|34|}
{2010006001|XXGobject_psameas_object|88|0|138|0|{dedup_positional1|dedup_positional1|1|0|}50|34|}
{2010006001|XXGobject_psameas_object|89|0|139|0|{matchoptional_keyword1|matchoptional_keyword1|1|0|}50|34|}
{2010006001|XXGobject_psameas_object|90|0|140|0|{matchoptional_positional1|matchoptional_positional1|1|0|}50|34|}
{2010006001|XXGobject_psameas_object|91|0|141|0|{metadata|in1_metadata|1|0|}50|34|}
{2010006001|XXGobject_psameas_object|92|0|142|0|{override_key1|override_key1|1|0|}50|34|}
{2010006001|XXGobject_psameas_object|93|0|143|0|{record_match_required1|record_match_required1|1|0|}50|34|}
{2010006001|XXGobject_psameas_object|94|0|144|0|{record_match_required_not1|record_match_required_not1|1|0|}50|34|}
{2010006001|XXGobject_psameas_object|95|0|145|0|{record_required1|record_required1|1|0|}50|34|}
{2010006001|XXGobject_psameas_object|96|0|146|0|{record_required_keyword1|record_required_keyword1|1|0|}50|34|}
{2010006001|XXGobject_psameas_object|97|0|147|0|{record_required_positional1|record_required_positional1|1|0|}50|34|}
{2010006001|XXGobject_psameas_object|98|0|148|0|{select1|select1|1|0|}50|34|}
{2010006001|XXGobject_psameas_object|99|0|149|0|{select_keyword1|select_keyword1|1|0|}50|34|}
{2010006001|XXGobject_psameas_object|100|0|150|0|{select_positional1|select_positional1|1|0|}50|34|}
{2010211001|XXGvertex_iport_iport|101|0|151|0|{2|in2|}34|51|}
{2010006001|XXGobject_psameas_object|102|0|153|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2|1|0|}51|34|}
{2010006001|XXGobject_psameas_object|103|0|154|0|{dedup2|dedup2|1|0|}51|34|}
{2010006001|XXGobject_psameas_object|104|0|155|0|{dedup_keyword2|dedup_keyword2|1|0|}51|34|}
{2010006001|XXGobject_psameas_object|105|0|156|0|{dedup_positional2|dedup_positional2|1|0|}51|34|}
{2010006001|XXGobject_psameas_object|106|0|157|0|{matchoptional_keyword2|matchoptional_keyword2|1|0|}51|34|}
{2010006001|XXGobject_psameas_object|107|0|158|0|{matchoptional_positional2|matchoptional_positional2|1|0|}51|34|}
{2010006001|XXGobject_psameas_object|108|0|159|0|{metadata|in2_metadata|1|0|}51|34|}
{2010006001|XXGobject_psameas_object|109|0|160|0|{override_key2|override_key2|1|0|}51|34|}
{2010006001|XXGobject_psameas_object|110|0|161|0|{record_match_required2|record_match_required2|1|0|}51|34|}
{2010006001|XXGobject_psameas_object|111|0|162|0|{record_match_required_not2|record_match_required_not2|1|0|}51|34|}
{2010006001|XXGobject_psameas_object|112|0|163|0|{record_required2|record_required2|1|0|}51|34|}
{2010006001|XXGobject_psameas_object|113|0|164|0|{record_required_keyword2|record_required_keyword2|1|0|}51|34|}
{2010006001|XXGobject_psameas_object|114|0|165|0|{record_required_positional2|record_required_positional2|1|0|}51|34|}
{2010006001|XXGobject_psameas_object|115|0|166|0|{select2|select2|1|0|}51|34|}
{2010006001|XXGobject_psameas_object|116|0|167|0|{select_keyword2|select_keyword2|1|0|}51|34|}
{2010006001|XXGobject_psameas_object|117|0|168|0|{select_positional2|select_positional2|1|0|}51|34|}
{2010211001|XXGvertex_iport_iport|118|0|169|0|{3|in3|}34|52|}
{2010006001|XXGobject_psameas_object|119|0|171|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen3|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen3|1|0|}52|34|}
{2010006001|XXGobject_psameas_object|120|0|172|0|{dedup3|dedup3|1|0|}52|34|}
{2010006001|XXGobject_psameas_object|121|0|173|0|{dedup_keyword3|dedup_keyword3|1|0|}52|34|}
{2010006001|XXGobject_psameas_object|122|0|174|0|{dedup_positional3|dedup_positional3|1|0|}52|34|}
{2010006001|XXGobject_psameas_object|123|0|175|0|{matchoptional_keyword3|matchoptional_keyword3|1|0|}52|34|}
{2010006001|XXGobject_psameas_object|124|0|176|0|{matchoptional_positional3|matchoptional_positional3|1|0|}52|34|}
{2010006001|XXGobject_psameas_object|125|0|177|0|{metadata|in3_metadata|1|0|}52|34|}
{2010006001|XXGobject_psameas_object|126|0|178|0|{override_key3|override_key3|1|0|}52|34|}
{2010006001|XXGobject_psameas_object|127|0|179|0|{record_match_required3|record_match_required3|1|0|}52|34|}
{2010006001|XXGobject_psameas_object|128|0|180|0|{record_match_required_not3|record_match_required_not3|1|0|}52|34|}
{2010006001|XXGobject_psameas_object|129|0|181|0|{record_required3|record_required3|1|0|}52|34|}
{2010006001|XXGobject_psameas_object|130|0|182|0|{record_required_keyword3|record_required_keyword3|1|0|}52|34|}
{2010006001|XXGobject_psameas_object|131|0|183|0|{record_required_positional3|record_required_positional3|1|0|}52|34|}
{2010006001|XXGobject_psameas_object|132|0|184|0|{select3|select3|1|0|}52|34|}
{2010006001|XXGobject_psameas_object|133|0|185|0|{select_keyword3|select_keyword3|1|0|}52|34|}
{2010006001|XXGobject_psameas_object|134|0|186|0|{select_positional3|select_positional3|1|0|}52|34|}
{2010006001|XXGobject_psameas_object|135|0|187|0|{Layout|Layout|0|0|}15|53|}
{2010212001|XXGvertex_oport_oport|136|0|189|0|{0|source|}53|54|}
{2010213001|XXGoport_dst_flow|137|0|191|0|{0|}54|55|}
{2010212001|XXGvertex_oport_oport|138|0|193|0|{1|clean|}53|56|}
{2010213001|XXGoport_dst_flow|139|0|195|0|{0|}56|57|}
{2010212001|XXGvertex_oport_oport|140|0|197|0|{2|lkp|}53|58|}
{2010213001|XXGoport_dst_flow|141|0|199|0|{0|}58|59|}
{2010212001|XXGvertex_oport_oport|142|0|201|0|{3|reject0|}53|60|}
{2010212001|XXGvertex_oport_oport|143|0|203|0|{4|reject1|}53|61|}
{2010212001|XXGvertex_oport_oport|144|0|205|0|{5|reject2|}53|62|}
{2010212001|XXGvertex_oport_oport|145|0|207|0|{6|error0|}53|63|}
{2010212001|XXGvertex_oport_oport|146|0|209|0|{7|error1|}53|64|}
{2010212001|XXGvertex_oport_oport|147|0|211|0|{8|error2|}53|65|}
{2010212001|XXGvertex_oport_oport|148|0|213|0|{9|log|}53|66|}
{2010211001|XXGvertex_iport_iport|149|0|215|0|{0|in|}53|67|}
{2010006001|XXGobject_psameas_object|150|0|217|0|{in_metadata|out_metadata|0|0|}53|15|}
{2010006001|XXGobject_psameas_object|151|0|218|0|{out0_metadata|write_metadata|0|0|}53|68|}
{2010211001|XXGvertex_iport_iport|152|0|220|0|{0|write|}68|69|}
{2010214001|XXGiport_src_flow|153|0|222|0|{0|}69|8|}
{2010007001|XXGobject_proto_object|154|0|223|0|{}68|70|}
{2010211001|XXGvertex_iport_iport|155|0|225|0|{0|write|}70|71|}
{2010006001|XXGobject_psameas_object|156|0|227|0|{metadata|write_metadata|1|0|}71|70|}
{2010006001|XXGobject_psameas_object|157|0|228|0|{out1_metadata|write_metadata|0|0|}53|72|}
{2010211001|XXGvertex_iport_iport|158|0|230|0|{0|write|}72|73|}
{2010214001|XXGiport_src_flow|159|0|232|0|{0|}73|9|}
{2010007001|XXGobject_proto_object|160|0|233|0|{}72|74|}
{2010211001|XXGvertex_iport_iport|161|0|235|0|{0|write|}74|75|}
{2010006001|XXGobject_psameas_object|162|0|237|0|{metadata|write_metadata|1|0|}75|74|}
{2010006001|XXGobject_psameas_object|163|0|238|0|{out2_metadata|write_metadata|0|0|}53|76|}
{2010211001|XXGvertex_iport_iport|164|0|240|0|{0|write|}76|77|}
{2010214001|XXGiport_src_flow|165|0|242|0|{0|}77|78|}
{2010006001|XXGobject_psameas_object|166|0|244|0|{reject0_metadata|out_metadata|0|0|}53|15|}
{2010006001|XXGobject_psameas_object|167|0|245|0|{reject1_metadata|out_metadata|0|0|}53|15|}
{2010006001|XXGobject_psameas_object|168|0|246|0|{reject2_metadata|out_metadata|0|0|}53|15|}
{2010006001|XXGobject_psameas_object|169|0|247|0|{in0_metadata|out0_metadata|0|0|}15|79|}
{2010212001|XXGvertex_oport_oport|170|0|249|0|{0|out0|}79|80|}
{2010213001|XXGoport_dst_flow|171|0|251|0|{0|}80|81|}
{2010212001|XXGvertex_oport_oport|172|0|253|0|{1|reject0|}79|82|}
{2010212001|XXGvertex_oport_oport|173|0|255|0|{2|error0|}79|83|}
{2010212001|XXGvertex_oport_oport|174|0|257|0|{3|log|}79|84|}
{2010211001|XXGvertex_iport_iport|175|0|259|0|{0|in|}79|85|}
{2010006001|XXGobject_psameas_object|176|0|261|0|{Layout|Layout|0|0|}79|53|}
{2010006001|XXGobject_psameas_object|177|0|262|0|{in_metadata|out_metadata|0|0|}79|86|}
{2010212001|XXGvertex_oport_oport|178|0|264|0|{0|out|}86|87|}
{2010213001|XXGoport_dst_flow|179|0|266|0|{0|}87|88|}
{2010212001|XXGvertex_oport_oport|180|0|268|0|{1|deselect|}86|89|}
{2010212001|XXGvertex_oport_oport|181|0|270|0|{2|reject|}86|90|}
{2010212001|XXGvertex_oport_oport|182|0|272|0|{3|error|}86|91|}
{2010212001|XXGvertex_oport_oport|183|0|274|0|{4|log|}86|92|}
{2010211001|XXGvertex_iport_iport|184|0|276|0|{0|in|}86|93|}
{2010214001|XXGiport_src_flow|185|0|278|0|{0|}93|94|}
{2010006001|XXGobject_psameas_object|186|0|280|0|{Layout|Layout|0|0|}86|53|}
{2010006001|XXGobject_psameas_object|187|0|281|0|{deselect_metadata|in_metadata|0|0|}86|86|}
{2010006001|XXGobject_psameas_object|188|0|282|0|{reject0_metadata|out_metadata|0|0|}79|86|}
{2010006001|XXGobject_psameas_object|189|0|283|0|{in1_metadata|out0_metadata|0|0|}15|95|}
{2010212001|XXGvertex_oport_oport|190|0|285|0|{0|out0|}95|96|}
{2010213001|XXGoport_dst_flow|191|0|287|0|{0|}96|97|}
{2010212001|XXGvertex_oport_oport|192|0|289|0|{1|reject0|}95|98|}
{2010212001|XXGvertex_oport_oport|193|0|291|0|{2|error0|}95|99|}
{2010212001|XXGvertex_oport_oport|194|0|293|0|{3|log|}95|100|}
{2010211001|XXGvertex_iport_iport|195|0|295|0|{0|in|}95|101|}
{2010006001|XXGobject_psameas_object|196|0|297|0|{Layout|Layout|0|0|}95|53|}
{2010006001|XXGobject_psameas_object|197|0|298|0|{in_metadata|out_metadata|0|0|}95|102|}
{2010212001|XXGvertex_oport_oport|198|0|300|0|{0|out|}102|103|}
{2010213001|XXGoport_dst_flow|199|0|302|0|{0|}103|104|}
{2010212001|XXGvertex_oport_oport|200|0|304|0|{1|deselect|}102|105|}
{2010212001|XXGvertex_oport_oport|201|0|306|0|{2|reject|}102|106|}
{2010212001|XXGvertex_oport_oport|202|0|308|0|{3|error|}102|107|}
{2010212001|XXGvertex_oport_oport|203|0|310|0|{4|log|}102|108|}
{2010211001|XXGvertex_iport_iport|204|0|312|0|{0|in|}102|109|}
{2010214001|XXGiport_src_flow|205|0|314|0|{0|}109|110|}
{2010006001|XXGobject_psameas_object|206|0|316|0|{Layout|Layout|0|0|}102|53|}
{2010006001|XXGobject_psameas_object|207|0|317|0|{reject0_metadata|out_metadata|0|0|}95|102|}
{2010006001|XXGobject_psameas_object|208|0|318|0|{in2_metadata|out0_metadata|0|0|}15|111|}
{2010212001|XXGvertex_oport_oport|209|0|320|0|{0|out0|}111|112|}
{2010213001|XXGoport_dst_flow|210|0|322|0|{0|}112|113|}
{2010212001|XXGvertex_oport_oport|211|0|324|0|{1|reject0|}111|114|}
{2010212001|XXGvertex_oport_oport|212|0|326|0|{2|error0|}111|115|}
{2010212001|XXGvertex_oport_oport|213|0|328|0|{3|log|}111|116|}
{2010211001|XXGvertex_iport_iport|214|0|330|0|{0|in|}111|117|}
{2010006001|XXGobject_psameas_object|215|0|332|0|{Layout|Layout|0|0|}111|53|}
{2010006001|XXGobject_psameas_object|216|0|333|0|{in_metadata|out_metadata|0|0|}111|118|}
{2010212001|XXGvertex_oport_oport|217|0|335|0|{0|out|}118|119|}
{2010213001|XXGoport_dst_flow|218|0|337|0|{0|}119|120|}
{2010212001|XXGvertex_oport_oport|219|0|339|0|{1|deselect|}118|121|}
{2010212001|XXGvertex_oport_oport|220|0|341|0|{2|reject|}118|122|}
{2010212001|XXGvertex_oport_oport|221|0|343|0|{3|error|}118|123|}
{2010212001|XXGvertex_oport_oport|222|0|345|0|{4|log|}118|124|}
{2010211001|XXGvertex_iport_iport|223|0|347|0|{0|in|}118|125|}
{2010214001|XXGiport_src_flow|224|0|349|0|{0|}125|126|}
{2010006001|XXGobject_psameas_object|225|0|351|0|{Layout|Layout|0|0|}118|53|}
{2010006001|XXGobject_psameas_object|226|0|352|0|{reject0_metadata|out_metadata|0|0|}111|118|}
{2010006001|XXGobject_psameas_object|227|0|353|0|{in3_metadata|out0_metadata|0|0|}15|127|}
{2010212001|XXGvertex_oport_oport|228|0|355|0|{0|out0|}127|128|}
{2010213001|XXGoport_dst_flow|229|0|357|0|{0|}128|129|}
{2010212001|XXGvertex_oport_oport|230|0|359|0|{1|reject0|}127|130|}
{2010212001|XXGvertex_oport_oport|231|0|361|0|{2|error0|}127|131|}
{2010212001|XXGvertex_oport_oport|232|0|363|0|{3|log|}127|132|}
{2010211001|XXGvertex_iport_iport|233|0|365|0|{0|in|}127|133|}
{2010006001|XXGobject_psameas_object|234|0|367|0|{Layout|Layout|0|0|}127|53|}
{2010006001|XXGobject_psameas_object|235|0|368|0|{in_metadata|out_metadata|0|0|}127|134|}
{2010212001|XXGvertex_oport_oport|236|0|370|0|{0|out|}134|135|}
{2010213001|XXGoport_dst_flow|237|0|372|0|{0|}135|136|}
{2010212001|XXGvertex_oport_oport|238|0|374|0|{1|deselect|}134|137|}
{2010212001|XXGvertex_oport_oport|239|0|376|0|{2|reject|}134|138|}
{2010212001|XXGvertex_oport_oport|240|0|378|0|{3|error|}134|139|}
{2010212001|XXGvertex_oport_oport|241|0|380|0|{4|log|}134|140|}
{2010211001|XXGvertex_iport_iport|242|0|382|0|{0|in|}134|141|}
{2010214001|XXGiport_src_flow|243|0|384|0|{0|}141|142|}
{2010006001|XXGobject_psameas_object|244|0|386|0|{Layout|Layout|0|0|}134|53|}
{2010006001|XXGobject_psameas_object|245|0|387|0|{reject0_metadata|out_metadata|0|0|}127|134|}
{2010006001|XXGobject_psameas_object|246|0|388|0|{reject0_metadata|out0_metadata|0|0|}15|79|}
{2010006001|XXGobject_psameas_object|247|0|389|0|{reject1_metadata|out0_metadata|0|0|}15|95|}
{2010006001|XXGobject_psameas_object|248|0|390|0|{reject2_metadata|out0_metadata|0|0|}15|111|}
{2010006001|XXGobject_psameas_object|249|0|391|0|{reject3_metadata|out0_metadata|0|0|}15|127|}
{2010006001|XXGobject_psameas_object|250|0|392|0|{unused0_metadata|out0_metadata|0|0|}15|79|}
{2010006001|XXGobject_psameas_object|251|0|393|0|{unused1_metadata|out0_metadata|0|0|}15|95|}
{2010006001|XXGobject_psameas_object|252|0|394|0|{unused2_metadata|out0_metadata|0|0|}15|111|}
{2010006001|XXGobject_psameas_object|253|0|395|0|{unused3_metadata|out0_metadata|0|0|}15|127|}
{2010601001|XXGgraph_vertex_vertex|254|0|396|0|{Optional_Clean|}1|72|}
{2010601001|XXGgraph_vertex_vertex|255|0|397|0|{Optional_Lookup|}1|143|}
{2010211001|XXGvertex_iport_iport|256|0|399|0|{0|write|}143|144|}
{2010214001|XXGiport_src_flow|257|0|401|0|{0|}144|10|}
{2010007001|XXGobject_proto_object|258|0|402|0|{}143|145|}
{2010211001|XXGvertex_iport_iport|259|0|404|0|{0|write|}145|146|}
{2010006001|XXGobject_psameas_object|260|0|406|0|{metadata|write_metadata|1|0|}146|145|}
{2010601001|XXGgraph_vertex_vertex|261|0|407|0|{Optional_Source|}1|68|}
{2010601001|XXGgraph_vertex_vertex|262|0|408|0|{Prepare_Output|}1|147|}
{2010605001|XXGgraph_legend_legend|263|0|410|0|{0|}147|148|}
{2010241001|XXGlegend_face_face|264|0|412|0|{}148|149|}
{2010605001|XXGgraph_legend_legend|265|0|414|0|{1|}147|150|}
{2010241001|XXGlegend_face_face|266|0|416|0|{}150|151|}
{2010605001|XXGgraph_legend_legend|267|0|418|0|{2|}147|152|}
{2010241001|XXGlegend_face_face|268|0|420|0|{}152|153|}
{2010605001|XXGgraph_legend_legend|269|0|422|0|{3|}147|154|}
{2010241001|XXGlegend_face_face|270|0|424|0|{}154|155|}
{2010604001|XXGgraph_flow_flow|271|0|426|0|{Flow_1|}147|59|}
{2010604001|XXGgraph_flow_flow|272|0|427|0|{Flow_2|}147|57|}
{2010604001|XXGgraph_flow_flow|273|0|428|0|{Flow_3|}147|156|}
{2010604001|XXGgraph_flow_flow|274|0|430|0|{Flow_4|}147|78|}
{2010604001|XXGgraph_flow_flow|275|0|431|0|{Flow_5|}147|157|}
{2010604001|XXGgraph_flow_flow|276|0|433|0|{Flow_6|}147|158|}
{2010604001|XXGgraph_flow_flow|277|0|435|0|{Flow_7|}147|55|}
{2010604001|XXGgraph_flow_flow|278|0|436|0|{Flow_8|}147|159|}
{2010601001|XXGgraph_vertex_vertex|279|0|438|0|{Copy_Out|}147|160|}
{2010212001|XXGvertex_oport_oport|280|0|440|0|{0|out|}160|161|}
{2010211001|XXGvertex_iport_iport|281|0|442|0|{0|in|}160|162|}
{2010214001|XXGiport_src_flow|282|0|444|0|{0|}162|55|}
{2010006001|XXGobject_psameas_object|283|0|445|0|{Layout|Layout|0|0|}160|68|}
{2010006001|XXGobject_psameas_object|284|0|446|0|{in_metadata|write_metadata|0|0|}160|68|}
{2010006001|XXGobject_psameas_object|285|0|447|0|{out_metadata|write_metadata|0|0|}160|68|}
{2010601001|XXGgraph_vertex_vertex|286|0|448|0|{Copy_Out_|}147|163|}
{2010212001|XXGvertex_oport_oport|287|0|450|0|{0|out|}163|164|}
{2010211001|XXGvertex_iport_iport|288|0|452|0|{0|in|}163|165|}
{2010214001|XXGiport_src_flow|289|0|454|0|{0|}165|57|}
{2010006001|XXGobject_psameas_object|290|0|455|0|{Layout|Layout|0|0|}163|72|}
{2010006001|XXGobject_psameas_object|291|0|456|0|{in_metadata|write_metadata|0|0|}163|72|}
{2010006001|XXGobject_psameas_object|292|0|457|0|{out_metadata|write_metadata|0|0|}163|72|}
{2010601001|XXGgraph_vertex_vertex|293|0|458|0|{Dedup_and_Fix_Intervals|}147|166|}
{2010605001|XXGgraph_legend_legend|294|0|460|0|{0|}166|167|}
{2010241001|XXGlegend_face_face|295|0|462|0|{}167|168|}
{2010605001|XXGgraph_legend_legend|296|0|464|0|{1|}166|169|}
{2010241001|XXGlegend_face_face|297|0|466|0|{}169|170|}
{2010605001|XXGgraph_legend_legend|298|0|468|0|{2|}166|171|}
{2010241001|XXGlegend_face_face|299|0|470|0|{}171|172|}
{2010605001|XXGgraph_legend_legend|300|0|472|0|{3|}166|173|}
{2010241001|XXGlegend_face_face|301|0|474|0|{}173|174|}
{2010605001|XXGgraph_legend_legend|302|0|476|0|{4|}166|175|}
{2010241001|XXGlegend_face_face|303|0|478|0|{}175|176|}
{2010604001|XXGgraph_flow_flow|304|0|480|0|{Flow_1|}166|177|}
{2010604001|XXGgraph_flow_flow|305|0|482|0|{Flow_2|}166|178|}
{2010604001|XXGgraph_flow_flow|306|0|484|0|{Flow_3|}166|179|}
{2010604001|XXGgraph_flow_flow|307|0|486|0|{Flow_4|}166|180|}
{2010604001|XXGgraph_flow_flow|308|0|488|0|{Flow_6|}166|181|}
{2010604001|XXGgraph_flow_flow|309|0|490|0|{Flow_7|}166|182|}
{2010601001|XXGgraph_vertex_vertex|310|0|492|0|{Dedup_by_NK_Eff_Date|}166|183|}
{2010212001|XXGvertex_oport_oport|311|0|494|0|{0|out|}183|184|}
{2010213001|XXGoport_dst_flow|312|0|496|0|{0|}184|179|}
{2010212001|XXGvertex_oport_oport|313|0|497|0|{1|dup|}183|185|}
{2010212001|XXGvertex_oport_oport|314|0|499|0|{2|reject|}183|186|}
{2010212001|XXGvertex_oport_oport|315|0|501|0|{3|error|}183|187|}
{2010212001|XXGvertex_oport_oport|316|0|503|0|{4|log|}183|188|}
{2010211001|XXGvertex_iport_iport|317|0|505|0|{0|in|}183|189|}
{2010214001|XXGiport_src_flow|318|0|507|0|{0|}189|177|}
{2010006001|XXGobject_psameas_object|319|0|508|0|{Layout|Layout|0|0|}183|76|}
{2010006001|XXGobject_psameas_object|320|0|509|0|{dup_metadata|write_metadata|0|0|}183|76|}
{2010006001|XXGobject_psameas_object|321|0|510|0|{in_metadata|write_metadata|0|0|}183|76|}
{2010006001|XXGobject_psameas_object|322|0|511|0|{out_metadata|write_metadata|0|0|}183|76|}
{2010006001|XXGobject_psameas_object|323|0|512|0|{reject_metadata|write_metadata|0|0|}183|76|}
{2010601001|XXGgraph_vertex_vertex|324|0|513|0|{Parition_by_Related_or_NK|}166|190|}
{2010212001|XXGvertex_oport_oport|325|0|515|0|{0|out|}190|191|}
{2010213001|XXGoport_dst_flow|326|0|517|0|{0|}191|178|}
{2010211001|XXGvertex_iport_iport|327|0|518|0|{0|in|}190|192|}
{2010006001|XXGobject_psameas_object|328|0|520|0|{Layout|Layout|0|0|}190|53|}
{2010006001|XXGobject_psameas_object|329|0|521|0|{out_metadata|write_metadata|0|0|}190|76|}
{2010601001|XXGgraph_vertex_vertex|330|0|522|0|{Replicate|}166|193|}
{2010212001|XXGvertex_oport_oport|331|0|524|0|{0|out|}193|194|}
{2010211001|XXGvertex_iport_iport|332|0|526|0|{0|in|}193|195|}
{2010214001|XXGiport_src_flow|333|0|528|0|{0|}195|182|}
{2010006001|XXGobject_psameas_object|334|0|529|0|{Layout|Layout|0|0|}193|76|}
{2010006001|XXGobject_psameas_object|335|0|530|0|{in_metadata|write_metadata|0|0|}193|143|}
{2010006001|XXGobject_psameas_object|336|0|531|0|{out_metadata|write_metadata|0|0|}193|143|}
{2010601001|XXGgraph_vertex_vertex|337|0|532|0|{Rollup_Adjoining_Eff_Dates|}166|196|}
{2010212001|XXGvertex_oport_oport|338|0|534|0|{0|out|}196|197|}
{2010213001|XXGoport_dst_flow|339|0|536|0|{0|}197|182|}
{2010212001|XXGvertex_oport_oport|340|0|537|0|{1|reject|}196|198|}
{2010212001|XXGvertex_oport_oport|341|0|539|0|{2|error|}196|199|}
{2010212001|XXGvertex_oport_oport|342|0|541|0|{3|log|}196|200|}
{2010211001|XXGvertex_iport_iport|343|0|543|0|{0|in|}196|201|}
{2010214001|XXGiport_src_flow|344|0|545|0|{0|}201|181|}
{2010006001|XXGobject_psameas_object|345|0|546|0|{Layout|Layout|0|0|}196|76|}
{2010006001|XXGobject_psameas_object|346|0|547|0|{in_metadata|write_metadata|0|0|}196|76|}
{2010006001|XXGobject_psameas_object|347|0|548|0|{out_metadata|write_metadata|0|0|}196|76|}
{2010006001|XXGobject_psameas_object|348|0|549|0|{reject_metadata|write_metadata|0|0|}196|76|}
{2010601001|XXGgraph_vertex_vertex|349|0|550|0|{Scan_to_Fix_Overlapping_Dates|}166|202|}
{2010212001|XXGvertex_oport_oport|350|0|552|0|{0|out|}202|203|}
{2010213001|XXGoport_dst_flow|351|0|554|0|{0|}203|180|}
{2010212001|XXGvertex_oport_oport|352|0|555|0|{1|reject|}202|204|}
{2010212001|XXGvertex_oport_oport|353|0|557|0|{2|error|}202|205|}
{2010212001|XXGvertex_oport_oport|354|0|559|0|{3|log|}202|206|}
{2010211001|XXGvertex_iport_iport|355|0|561|0|{0|in|}202|207|}
{2010214001|XXGiport_src_flow|356|0|563|0|{0|}207|179|}
{2010006001|XXGobject_psameas_object|357|0|564|0|{Layout|Layout|0|0|}202|76|}
{2010006001|XXGobject_psameas_object|358|0|565|0|{in_metadata|write_metadata|0|0|}202|76|}
{2010006001|XXGobject_psameas_object|359|0|566|0|{out_metadata|write_metadata|0|0|}202|76|}
{2010006001|XXGobject_psameas_object|360|0|567|0|{reject_metadata|write_metadata|0|0|}202|76|}
{2010601001|XXGgraph_vertex_vertex|361|0|568|0|{Sort_for_Dedup|}166|208|}
{2010212001|XXGvertex_oport_oport|362|0|570|0|{0|out|}208|209|}
{2010213001|XXGoport_dst_flow|363|0|572|0|{0|}209|177|}
{2010211001|XXGvertex_iport_iport|364|0|573|0|{0|in|}208|210|}
{2010214001|XXGiport_src_flow|365|0|575|0|{0|}210|178|}
{2010006001|XXGobject_psameas_object|366|0|576|0|{Layout|Layout|0|0|}208|76|}
{2010006001|XXGobject_psameas_object|367|0|577|0|{in_metadata|write_metadata|0|0|}208|76|}
{2010006001|XXGobject_psameas_object|368|0|578|0|{out_metadata|write_metadata|0|0|}208|76|}
{2010601001|XXGgraph_vertex_vertex|369|0|579|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}166|211|}
{2010212001|XXGvertex_oport_oport|370|0|581|0|{0|out|}211|212|}
{2010213001|XXGoport_dst_flow|371|0|583|0|{0|}212|181|}
{2010211001|XXGvertex_iport_iport|372|0|584|0|{0|in|}211|213|}
{2010214001|XXGiport_src_flow|373|0|586|0|{0|}213|180|}
{2010006001|XXGobject_psameas_object|374|0|587|0|{Layout|Layout|0|0|}211|76|}
{2010006001|XXGobject_psameas_object|375|0|588|0|{in_metadata|write_metadata|0|0|}211|76|}
{2010006001|XXGobject_psameas_object|376|0|589|0|{out_metadata|write_metadata|0|0|}211|76|}
{2010212001|XXGvertex_oport_oport|377|0|590|0|{0|out|}166|214|}
{2010216002|XXGoport_binding_oport|378|0|592|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6831|}214|194|}
{2010213001|XXGoport_dst_flow|379|0|593|0|{0|}214|156|}
{2010213001|XXGoport_dst_flow|380|0|594|0|{1|}214|158|}
{2010212001|XXGvertex_oport_oport|381|0|595|0|{1|dups|}166|215|}
{2010216002|XXGoport_binding_oport|382|0|597|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6832|}215|185|}
{2010213001|XXGoport_dst_flow|383|0|598|0|{0|}215|78|}
{2010211001|XXGvertex_iport_iport|384|0|599|0|{0|in|}166|216|}
{2010215002|XXGiport_binding_iport|385|0|601|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6830|}216|192|}
{2010214001|XXGiport_src_flow|386|0|602|0|{0|}216|59|}
{2010006001|XXGobject_psameas_object|387|0|603|0|{INPUT_DML|write_metadata|0|0|}166|76|}
{2010601001|XXGgraph_vertex_vertex|388|0|604|0|{Dups|}147|76|}
{2010601001|XXGgraph_vertex_vertex|389|0|605|0|{Gather|}147|217|}
{2010212001|XXGvertex_oport_oport|390|0|607|0|{0|out|}217|218|}
{2010213001|XXGoport_dst_flow|391|0|609|0|{0|}218|159|}
{2010211001|XXGvertex_iport_iport|392|0|610|0|{0|in|}217|219|}
{2010214001|XXGiport_src_flow|393|0|612|0|{0|}219|158|}
{2010006001|XXGobject_psameas_object|394|0|613|0|{in_metadata|write_metadata|0|0|}217|143|}
{2010006001|XXGobject_psameas_object|395|0|614|0|{out_metadata|write_metadata|0|0|}217|143|}
{2010601001|XXGgraph_vertex_vertex|396|0|615|0|{Gather_|}147|220|}
{2010212001|XXGvertex_oport_oport|397|0|617|0|{0|out|}220|221|}
{2010211001|XXGvertex_iport_iport|398|0|619|0|{0|in|}220|222|}
{2010214001|XXGiport_src_flow|399|0|621|0|{0|}222|157|}
{2010214001|XXGiport_src_flow|400|0|622|0|{1|}222|159|}
{2010006001|XXGobject_psameas_object|401|0|623|0|{Layout|Layout|0|0|}220|143|}
{2010006001|XXGobject_psameas_object|402|0|624|0|{in_metadata|write_metadata|0|0|}220|143|}
{2010006001|XXGobject_psameas_object|403|0|625|0|{out_metadata|write_metadata|0|0|}220|143|}
{2010601001|XXGgraph_vertex_vertex|404|0|626|0|{Map_to_Output|}147|53|}
{2010601001|XXGgraph_vertex_vertex|405|0|627|0|{Merge|}147|223|}
{2010212001|XXGvertex_oport_oport|406|0|629|0|{0|out|}223|224|}
{2010213001|XXGoport_dst_flow|407|0|631|0|{0|}224|157|}
{2010211001|XXGvertex_iport_iport|408|0|632|0|{0|in|}223|225|}
{2010214001|XXGiport_src_flow|409|0|634|0|{0|}225|156|}
{2010006001|XXGobject_psameas_object|410|0|635|0|{in_metadata|write_metadata|0|0|}223|143|}
{2010006001|XXGobject_psameas_object|411|0|636|0|{out_metadata|write_metadata|0|0|}223|143|}
{2010212001|XXGvertex_oport_oport|412|0|637|0|{0|source|}147|226|}
{2010216002|XXGoport_binding_oport|413|0|639|0|{.5|1.0|{8|840000|104000|860000|104000|890000|104000|910000|104000|}9943|}226|161|}
{2010213001|XXGoport_dst_flow|414|0|640|0|{0|}226|8|}
{2010212001|XXGvertex_oport_oport|415|0|641|0|{1|clean|}147|227|}
{2010216002|XXGoport_binding_oport|416|0|643|0|{.5|1.0|{12|835000|229000|855000|229000|890000|229000|890000|269000|890000|269000|910000|269000|}9944|}227|164|}
{2010213001|XXGoport_dst_flow|417|0|644|0|{0|}227|9|}
{2010212001|XXGvertex_oport_oport|418|0|645|0|{2|lookup|}147|228|}
{2010216002|XXGoport_binding_oport|419|0|647|0|{.5|.5|{12|862000|384000|882000|384000|886000|384000|886000|439000|890000|439000|910000|439000|}9945|}228|221|}
{2010213001|XXGoport_dst_flow|420|0|648|0|{0|}228|10|}
{2010211001|XXGvertex_iport_iport|421|0|649|0|{0|in0|}147|229|}
{2010215002|XXGiport_binding_iport|422|0|651|0|{.5|.5|{12|67000|229000|47000|229000|43000|229000|43000|269000|39000|269000|19000|269000|}9942|}229|67|}
{2010214001|XXGiport_src_flow|423|0|652|0|{0|}229|14|}
{2010007001|XXGobject_proto_object|424|0|653|0|{}147|230|}
{2010605001|XXGgraph_legend_legend|425|0|655|0|{0|}230|231|}
{2010241001|XXGlegend_face_face|426|0|657|0|{}231|232|}
{2010605001|XXGgraph_legend_legend|427|0|659|0|{1|}230|233|}
{2010241001|XXGlegend_face_face|428|0|661|0|{}233|234|}
{2010605001|XXGgraph_legend_legend|429|0|663|0|{2|}230|235|}
{2010241001|XXGlegend_face_face|430|0|665|0|{}235|236|}
{2010605001|XXGgraph_legend_legend|431|0|667|0|{3|}230|237|}
{2010241001|XXGlegend_face_face|432|0|669|0|{}237|238|}
{2010604001|XXGgraph_flow_flow|433|0|671|0|{Flow_1|}230|239|}
{2010604001|XXGgraph_flow_flow|434|0|673|0|{Flow_2|}230|240|}
{2010604001|XXGgraph_flow_flow|435|0|675|0|{Flow_3|}230|241|}
{2010604001|XXGgraph_flow_flow|436|0|677|0|{Flow_4|}230|242|}
{2010604001|XXGgraph_flow_flow|437|0|679|0|{Flow_5|}230|243|}
{2010604001|XXGgraph_flow_flow|438|0|681|0|{Flow_6|}230|244|}
{2010604001|XXGgraph_flow_flow|439|0|683|0|{Flow_7|}230|245|}
{2010604001|XXGgraph_flow_flow|440|0|685|0|{Flow_8|}230|246|}
{2010601001|XXGgraph_vertex_vertex|441|0|687|0|{Copy_Out|}230|247|}
{2010212001|XXGvertex_oport_oport|442|0|689|0|{0|out|}247|248|}
{2010211001|XXGvertex_iport_iport|443|0|691|0|{0|in|}247|249|}
{2010214001|XXGiport_src_flow|444|0|693|0|{0|}249|245|}
{2010007001|XXGobject_proto_object|445|0|694|0|{}247|250|}
{2010212001|XXGvertex_oport_oport|446|0|696|0|{0|out|}250|251|}
{2010006001|XXGobject_psameas_object|447|0|698|0|{metadata|out_metadata|1|0|}251|250|}
{2010211001|XXGvertex_iport_iport|448|0|699|0|{0|in|}250|252|}
{2010006001|XXGobject_psameas_object|449|0|701|0|{metadata|in_metadata|1|0|}252|250|}
{2010601001|XXGgraph_vertex_vertex|450|0|702|0|{Copy_Out_|}230|253|}
{2010212001|XXGvertex_oport_oport|451|0|704|0|{0|out|}253|254|}
{2010211001|XXGvertex_iport_iport|452|0|706|0|{0|in|}253|255|}
{2010214001|XXGiport_src_flow|453|0|708|0|{0|}255|240|}
{2010007001|XXGobject_proto_object|454|0|709|0|{}253|256|}
{2010212001|XXGvertex_oport_oport|455|0|711|0|{0|out|}256|257|}
{2010006001|XXGobject_psameas_object|456|0|713|0|{metadata|out_metadata|1|0|}257|256|}
{2010211001|XXGvertex_iport_iport|457|0|714|0|{0|in|}256|258|}
{2010006001|XXGobject_psameas_object|458|0|716|0|{metadata|in_metadata|1|0|}258|256|}
{2010601001|XXGgraph_vertex_vertex|459|0|717|0|{Dedup_and_Fix_Intervals|}230|259|}
{2010605001|XXGgraph_legend_legend|460|0|719|0|{0|}259|260|}
{2010241001|XXGlegend_face_face|461|0|721|0|{}260|261|}
{2010605001|XXGgraph_legend_legend|462|0|723|0|{1|}259|262|}
{2010241001|XXGlegend_face_face|463|0|725|0|{}262|263|}
{2010605001|XXGgraph_legend_legend|464|0|727|0|{2|}259|264|}
{2010241001|XXGlegend_face_face|465|0|729|0|{}264|265|}
{2010605001|XXGgraph_legend_legend|466|0|731|0|{3|}259|266|}
{2010241001|XXGlegend_face_face|467|0|733|0|{}266|267|}
{2010605001|XXGgraph_legend_legend|468|0|735|0|{4|}259|268|}
{2010241001|XXGlegend_face_face|469|0|737|0|{}268|269|}
{2010604001|XXGgraph_flow_flow|470|0|739|0|{Flow_1|}259|270|}
{2010604001|XXGgraph_flow_flow|471|0|741|0|{Flow_2|}259|271|}
{2010604001|XXGgraph_flow_flow|472|0|743|0|{Flow_3|}259|272|}
{2010604001|XXGgraph_flow_flow|473|0|745|0|{Flow_4|}259|273|}
{2010604001|XXGgraph_flow_flow|474|0|747|0|{Flow_6|}259|274|}
{2010604001|XXGgraph_flow_flow|475|0|749|0|{Flow_7|}259|275|}
{2010601001|XXGgraph_vertex_vertex|476|0|751|0|{Dedup_by_NK_Eff_Date|}259|276|}
{2010212001|XXGvertex_oport_oport|477|0|753|0|{0|out|}276|277|}
{2010213001|XXGoport_dst_flow|478|0|755|0|{0|}277|272|}
{2010212001|XXGvertex_oport_oport|479|0|756|0|{1|dup|}276|278|}
{2010212001|XXGvertex_oport_oport|480|0|758|0|{2|reject|}276|279|}
{2010212001|XXGvertex_oport_oport|481|0|760|0|{3|error|}276|280|}
{2010212001|XXGvertex_oport_oport|482|0|762|0|{4|log|}276|281|}
{2010211001|XXGvertex_iport_iport|483|0|764|0|{0|in|}276|282|}
{2010214001|XXGiport_src_flow|484|0|766|0|{0|}282|270|}
{2010601001|XXGgraph_vertex_vertex|485|0|767|0|{Parition_by_Related_or_NK|}259|283|}
{2010212001|XXGvertex_oport_oport|486|0|769|0|{0|out|}283|284|}
{2010213001|XXGoport_dst_flow|487|0|771|0|{0|}284|271|}
{2010211001|XXGvertex_iport_iport|488|0|772|0|{0|in|}283|285|}
{2010601001|XXGgraph_vertex_vertex|489|0|774|0|{Replicate|}259|286|}
{2010212001|XXGvertex_oport_oport|490|0|776|0|{0|out|}286|287|}
{2010211001|XXGvertex_iport_iport|491|0|778|0|{0|in|}286|288|}
{2010214001|XXGiport_src_flow|492|0|780|0|{0|}288|275|}
{2010601001|XXGgraph_vertex_vertex|493|0|781|0|{Rollup_Adjoining_Eff_Dates|}259|289|}
{2010212001|XXGvertex_oport_oport|494|0|783|0|{0|out|}289|290|}
{2010213001|XXGoport_dst_flow|495|0|785|0|{0|}290|275|}
{2010212001|XXGvertex_oport_oport|496|0|786|0|{1|reject|}289|291|}
{2010212001|XXGvertex_oport_oport|497|0|788|0|{2|error|}289|292|}
{2010212001|XXGvertex_oport_oport|498|0|790|0|{3|log|}289|293|}
{2010211001|XXGvertex_iport_iport|499|0|792|0|{0|in|}289|294|}
{2010214001|XXGiport_src_flow|500|0|794|0|{0|}294|274|}
{2010601001|XXGgraph_vertex_vertex|501|0|795|0|{Scan_to_Fix_Overlapping_Dates|}259|295|}
{2010212001|XXGvertex_oport_oport|502|0|797|0|{0|out|}295|296|}
{2010213001|XXGoport_dst_flow|503|0|799|0|{0|}296|273|}
{2010212001|XXGvertex_oport_oport|504|0|800|0|{1|reject|}295|297|}
{2010212001|XXGvertex_oport_oport|505|0|802|0|{2|error|}295|298|}
{2010212001|XXGvertex_oport_oport|506|0|804|0|{3|log|}295|299|}
{2010211001|XXGvertex_iport_iport|507|0|806|0|{0|in|}295|300|}
{2010214001|XXGiport_src_flow|508|0|808|0|{0|}300|272|}
{2010601001|XXGgraph_vertex_vertex|509|0|809|0|{Sort_for_Dedup|}259|301|}
{2010212001|XXGvertex_oport_oport|510|0|811|0|{0|out|}301|302|}
{2010213001|XXGoport_dst_flow|511|0|813|0|{0|}302|270|}
{2010211001|XXGvertex_iport_iport|512|0|814|0|{0|in|}301|303|}
{2010214001|XXGiport_src_flow|513|0|816|0|{0|}303|271|}
{2010601001|XXGgraph_vertex_vertex|514|0|817|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}259|304|}
{2010212001|XXGvertex_oport_oport|515|0|819|0|{0|out|}304|305|}
{2010213001|XXGoport_dst_flow|516|0|821|0|{0|}305|274|}
{2010211001|XXGvertex_iport_iport|517|0|822|0|{0|in|}304|306|}
{2010214001|XXGiport_src_flow|518|0|824|0|{0|}306|273|}
{2010212001|XXGvertex_oport_oport|519|0|825|0|{0|out|}259|307|}
{2010216002|XXGoport_binding_oport|520|0|827|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6831|}307|287|}
{2010213001|XXGoport_dst_flow|521|0|828|0|{0|}307|241|}
{2010213001|XXGoport_dst_flow|522|0|829|0|{1|}307|244|}
{2010212001|XXGvertex_oport_oport|523|0|830|0|{1|dups|}259|308|}
{2010216002|XXGoport_binding_oport|524|0|832|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6832|}308|278|}
{2010213001|XXGoport_dst_flow|525|0|833|0|{0|}308|242|}
{2010211001|XXGvertex_iport_iport|526|0|834|0|{0|in|}259|309|}
{2010215002|XXGiport_binding_iport|527|0|836|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6830|}309|285|}
{2010214001|XXGiport_src_flow|528|0|837|0|{0|}309|239|}
{2010007001|XXGobject_proto_object|529|0|838|0|{}259|310|}
{2010605001|XXGgraph_legend_legend|530|0|840|0|{0|}310|311|}
{2010241001|XXGlegend_face_face|531|0|842|0|{}311|312|}
{2010605001|XXGgraph_legend_legend|532|0|844|0|{1|}310|313|}
{2010241001|XXGlegend_face_face|533|0|846|0|{}313|314|}
{2010605001|XXGgraph_legend_legend|534|0|848|0|{2|}310|315|}
{2010241001|XXGlegend_face_face|535|0|850|0|{}315|316|}
{2010605001|XXGgraph_legend_legend|536|0|852|0|{3|}310|317|}
{2010241001|XXGlegend_face_face|537|0|854|0|{}317|318|}
{2010605001|XXGgraph_legend_legend|538|0|856|0|{4|}310|319|}
{2010241001|XXGlegend_face_face|539|0|858|0|{}319|320|}
{2010604001|XXGgraph_flow_flow|540|0|860|0|{Flow_1|}310|321|}
{2010604001|XXGgraph_flow_flow|541|0|862|0|{Flow_2|}310|322|}
{2010604001|XXGgraph_flow_flow|542|0|864|0|{Flow_3|}310|323|}
{2010604001|XXGgraph_flow_flow|543|0|866|0|{Flow_4|}310|324|}
{2010604001|XXGgraph_flow_flow|544|0|868|0|{Flow_6|}310|325|}
{2010604001|XXGgraph_flow_flow|545|0|870|0|{Flow_7|}310|326|}
{2010601001|XXGgraph_vertex_vertex|546|0|872|0|{Dedup_by_NK_Eff_Date|}310|327|}
{2010212001|XXGvertex_oport_oport|547|0|874|0|{0|out|}327|328|}
{2010213001|XXGoport_dst_flow|548|0|876|0|{0|}328|323|}
{2010212001|XXGvertex_oport_oport|549|0|877|0|{1|dup|}327|329|}
{2010212001|XXGvertex_oport_oport|550|0|879|0|{2|reject|}327|330|}
{2010212001|XXGvertex_oport_oport|551|0|881|0|{3|error|}327|331|}
{2010212001|XXGvertex_oport_oport|552|0|883|0|{4|log|}327|332|}
{2010211001|XXGvertex_iport_iport|553|0|885|0|{0|in|}327|333|}
{2010214001|XXGiport_src_flow|554|0|887|0|{0|}333|321|}
{2010007001|XXGobject_proto_object|555|0|888|0|{}327|334|}
{2010212001|XXGvertex_oport_oport|556|0|890|0|{0|out|}334|335|}
{2010006001|XXGobject_psameas_object|557|0|892|0|{metadata|out_metadata|1|0|}335|334|}
{2010212001|XXGvertex_oport_oport|558|0|893|0|{1|dup|}334|336|}
{2010006001|XXGobject_psameas_object|559|0|895|0|{metadata|dup_metadata|1|0|}336|334|}
{2010212001|XXGvertex_oport_oport|560|0|896|0|{2|reject|}334|337|}
{2010006001|XXGobject_psameas_object|561|0|898|0|{metadata|reject_metadata|1|0|}337|334|}
{2010212001|XXGvertex_oport_oport|562|0|899|0|{3|error|}334|338|}
{2010006001|XXGobject_psameas_object|563|0|901|0|{metadata|error_metadata|1|0|}338|334|}
{2010212001|XXGvertex_oport_oport|564|0|902|0|{4|log|}334|339|}
{2010006001|XXGobject_psameas_object|565|0|904|0|{metadata|log_metadata|1|0|}339|334|}
{2010211001|XXGvertex_iport_iport|566|0|905|0|{0|in|}334|340|}
{2010006001|XXGobject_psameas_object|567|0|907|0|{metadata|in_metadata|1|0|}340|334|}
{2010601001|XXGgraph_vertex_vertex|568|0|908|0|{Parition_by_Related_or_NK|}310|341|}
{2010212001|XXGvertex_oport_oport|569|0|910|0|{0|out|}341|342|}
{2010213001|XXGoport_dst_flow|570|0|912|0|{0|}342|322|}
{2010211001|XXGvertex_iport_iport|571|0|913|0|{0|in|}341|343|}
{2010007001|XXGobject_proto_object|572|0|915|0|{}341|344|}
{2010212001|XXGvertex_oport_oport|573|0|917|0|{0|out|}344|345|}
{2010006001|XXGobject_psameas_object|574|0|919|0|{metadata|out_metadata|1|0|}345|344|}
{2010211001|XXGvertex_iport_iport|575|0|920|0|{0|in|}344|346|}
{2010006001|XXGobject_psameas_object|576|0|922|0|{metadata|in_metadata|1|0|}346|344|}
{2010006001|XXGobject_psameas_object|577|0|923|0|{in_metadata|INPUT_DML|1|0|}341|310|}
{2010601001|XXGgraph_vertex_vertex|578|0|924|0|{Replicate|}310|347|}
{2010212001|XXGvertex_oport_oport|579|0|926|0|{0|out|}347|348|}
{2010211001|XXGvertex_iport_iport|580|0|928|0|{0|in|}347|349|}
{2010214001|XXGiport_src_flow|581|0|930|0|{0|}349|326|}
{2010007001|XXGobject_proto_object|582|0|931|0|{}347|350|}
{2010212001|XXGvertex_oport_oport|583|0|933|0|{0|out|}350|351|}
{2010006001|XXGobject_psameas_object|584|0|935|0|{metadata|out_metadata|1|0|}351|350|}
{2010211001|XXGvertex_iport_iport|585|0|936|0|{0|in|}350|352|}
{2010006001|XXGobject_psameas_object|586|0|938|0|{metadata|in_metadata|1|0|}352|350|}
{2010601001|XXGgraph_vertex_vertex|587|0|939|0|{Rollup_Adjoining_Eff_Dates|}310|353|}
{2010212001|XXGvertex_oport_oport|588|0|941|0|{0|out|}353|354|}
{2010213001|XXGoport_dst_flow|589|0|943|0|{0|}354|326|}
{2010212001|XXGvertex_oport_oport|590|0|944|0|{1|reject|}353|355|}
{2010212001|XXGvertex_oport_oport|591|0|946|0|{2|error|}353|356|}
{2010212001|XXGvertex_oport_oport|592|0|948|0|{3|log|}353|357|}
{2010211001|XXGvertex_iport_iport|593|0|950|0|{0|in|}353|358|}
{2010214001|XXGiport_src_flow|594|0|952|0|{0|}358|325|}
{2010007001|XXGobject_proto_object|595|0|953|0|{}353|359|}
{2010212001|XXGvertex_oport_oport|596|0|955|0|{0|out|}359|360|}
{2010006001|XXGobject_psameas_object|597|0|957|0|{metadata|out_metadata|1|0|}360|359|}
{2010212001|XXGvertex_oport_oport|598|0|958|0|{1|reject|}359|361|}
{2010006001|XXGobject_psameas_object|599|0|960|0|{metadata|reject_metadata|1|0|}361|359|}
{2010212001|XXGvertex_oport_oport|600|0|961|0|{2|error|}359|362|}
{2010006001|XXGobject_psameas_object|601|0|963|0|{metadata|error_metadata|1|0|}362|359|}
{2010212001|XXGvertex_oport_oport|602|0|964|0|{3|log|}359|363|}
{2010006001|XXGobject_psameas_object|603|0|966|0|{metadata|log_metadata|1|0|}363|359|}
{2010211001|XXGvertex_iport_iport|604|0|967|0|{0|in|}359|364|}
{2010006001|XXGobject_psameas_object|605|0|969|0|{metadata|in_metadata|1|0|}364|359|}
{2010601001|XXGgraph_vertex_vertex|606|0|970|0|{Scan_to_Fix_Overlapping_Dates|}310|365|}
{2010212001|XXGvertex_oport_oport|607|0|972|0|{0|out|}365|366|}
{2010213001|XXGoport_dst_flow|608|0|974|0|{0|}366|324|}
{2010212001|XXGvertex_oport_oport|609|0|975|0|{1|reject|}365|367|}
{2010212001|XXGvertex_oport_oport|610|0|977|0|{2|error|}365|368|}
{2010212001|XXGvertex_oport_oport|611|0|979|0|{3|log|}365|369|}
{2010211001|XXGvertex_iport_iport|612|0|981|0|{0|in|}365|370|}
{2010214001|XXGiport_src_flow|613|0|983|0|{0|}370|323|}
{2010007001|XXGobject_proto_object|614|0|984|0|{}365|371|}
{2010212001|XXGvertex_oport_oport|615|0|986|0|{0|out|}371|372|}
{2010006001|XXGobject_psameas_object|616|0|988|0|{metadata|out_metadata|1|0|}372|371|}
{2010212001|XXGvertex_oport_oport|617|0|989|0|{1|reject|}371|373|}
{2010006001|XXGobject_psameas_object|618|0|991|0|{metadata|reject_metadata|1|0|}373|371|}
{2010212001|XXGvertex_oport_oport|619|0|992|0|{2|error|}371|374|}
{2010006001|XXGobject_psameas_object|620|0|994|0|{metadata|error_metadata|1|0|}374|371|}
{2010212001|XXGvertex_oport_oport|621|0|995|0|{3|log|}371|375|}
{2010006001|XXGobject_psameas_object|622|0|997|0|{metadata|log_metadata|1|0|}375|371|}
{2010211001|XXGvertex_iport_iport|623|0|998|0|{0|in|}371|376|}
{2010006001|XXGobject_psameas_object|624|0|1000|0|{metadata|in_metadata|1|0|}376|371|}
{2010601001|XXGgraph_vertex_vertex|625|0|1001|0|{Sort_for_Dedup|}310|377|}
{2010212001|XXGvertex_oport_oport|626|0|1003|0|{0|out|}377|378|}
{2010213001|XXGoport_dst_flow|627|0|1005|0|{0|}378|321|}
{2010211001|XXGvertex_iport_iport|628|0|1006|0|{0|in|}377|379|}
{2010214001|XXGiport_src_flow|629|0|1008|0|{0|}379|322|}
{2010007001|XXGobject_proto_object|630|0|1009|0|{}377|380|}
{2010212001|XXGvertex_oport_oport|631|0|1011|0|{0|out|}380|381|}
{2010006001|XXGobject_psameas_object|632|0|1013|0|{metadata|out_metadata|1|0|}381|380|}
{2010211001|XXGvertex_iport_iport|633|0|1014|0|{0|in|}380|382|}
{2010006001|XXGobject_psameas_object|634|0|1016|0|{metadata|in_metadata|1|0|}382|380|}
{2010601001|XXGgraph_vertex_vertex|635|0|1017|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}310|383|}
{2010212001|XXGvertex_oport_oport|636|0|1019|0|{0|out|}383|384|}
{2010213001|XXGoport_dst_flow|637|0|1021|0|{0|}384|325|}
{2010211001|XXGvertex_iport_iport|638|0|1022|0|{0|in|}383|385|}
{2010214001|XXGiport_src_flow|639|0|1024|0|{0|}385|324|}
{2010007001|XXGobject_proto_object|640|0|1025|0|{}383|386|}
{2010212001|XXGvertex_oport_oport|641|0|1027|0|{0|out|}386|387|}
{2010006001|XXGobject_psameas_object|642|0|1029|0|{metadata|out_metadata|1|0|}387|386|}
{2010211001|XXGvertex_iport_iport|643|0|1030|0|{0|in|}386|388|}
{2010006001|XXGobject_psameas_object|644|0|1032|0|{metadata|in_metadata|1|0|}388|386|}
{2010212001|XXGvertex_oport_oport|645|0|1033|0|{0|out|}310|389|}
{2010216002|XXGoport_binding_oport|646|0|1035|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6831|}389|348|}
{2010212001|XXGvertex_oport_oport|647|0|1036|0|{1|dups|}310|390|}
{2010216002|XXGoport_binding_oport|648|0|1038|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6832|}390|329|}
{2010211001|XXGvertex_iport_iport|649|0|1039|0|{0|in|}310|391|}
{2010215002|XXGiport_binding_iport|650|0|1041|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6830|}391|343|}
{2010006001|XXGobject_psameas_object|651|0|1042|0|{FIX_EFFECTIVE_DATE|FIX_EFFECTIVE_DATE|1|0|}259|230|}
{2010006001|XXGobject_psameas_object|652|0|1043|0|{FIX_END_DATE|FIX_END_DATE|1|0|}259|230|}
{2010006001|XXGobject_psameas_object|653|0|1044|0|{INPUT_DML|write_metadata|0|0|}259|392|}
{2010211001|XXGvertex_iport_iport|654|0|1046|0|{0|write|}392|393|}
{2010214001|XXGiport_src_flow|655|0|1048|0|{0|}393|242|}
{2010007001|XXGobject_proto_object|656|0|1049|0|{}392|394|}
{2010211001|XXGvertex_iport_iport|657|0|1051|0|{0|write|}394|395|}
{2010006001|XXGobject_psameas_object|658|0|1053|0|{metadata|write_metadata|1|0|}395|394|}
{2010601001|XXGgraph_vertex_vertex|659|0|1054|0|{Dups|}230|392|}
{2010601001|XXGgraph_vertex_vertex|660|0|1055|0|{Gather|}230|396|}
{2010212001|XXGvertex_oport_oport|661|0|1057|0|{0|out|}396|397|}
{2010213001|XXGoport_dst_flow|662|0|1059|0|{0|}397|246|}
{2010211001|XXGvertex_iport_iport|663|0|1060|0|{0|in|}396|398|}
{2010214001|XXGiport_src_flow|664|0|1062|0|{0|}398|244|}
{2010007001|XXGobject_proto_object|665|0|1063|0|{}396|399|}
{2010212001|XXGvertex_oport_oport|666|0|1065|0|{0|out|}399|400|}
{2010006001|XXGobject_psameas_object|667|0|1067|0|{metadata|out_metadata|1|0|}400|399|}
{2010211001|XXGvertex_iport_iport|668|0|1068|0|{0|in|}399|401|}
{2010006001|XXGobject_psameas_object|669|0|1070|0|{metadata|in_metadata|1|0|}401|399|}
{2010601001|XXGgraph_vertex_vertex|670|0|1071|0|{Gather_|}230|402|}
{2010212001|XXGvertex_oport_oport|671|0|1073|0|{0|out|}402|403|}
{2010211001|XXGvertex_iport_iport|672|0|1075|0|{0|in|}402|404|}
{2010214001|XXGiport_src_flow|673|0|1077|0|{0|}404|243|}
{2010214001|XXGiport_src_flow|674|0|1078|0|{1|}404|246|}
{2010007001|XXGobject_proto_object|675|0|1079|0|{}402|405|}
{2010212001|XXGvertex_oport_oport|676|0|1081|0|{0|out|}405|406|}
{2010006001|XXGobject_psameas_object|677|0|1083|0|{metadata|out_metadata|1|0|}406|405|}
{2010211001|XXGvertex_iport_iport|678|0|1084|0|{0|in|}405|407|}
{2010006001|XXGobject_psameas_object|679|0|1086|0|{metadata|in_metadata|1|0|}407|405|}
{2010601001|XXGgraph_vertex_vertex|680|0|1087|0|{Map_to_Output|}230|408|}
{2010212001|XXGvertex_oport_oport|681|0|1089|0|{0|source|}408|409|}
{2010213001|XXGoport_dst_flow|682|0|1091|0|{0|}409|245|}
{2010212001|XXGvertex_oport_oport|683|0|1092|0|{1|clean|}408|410|}
{2010213001|XXGoport_dst_flow|684|0|1094|0|{0|}410|240|}
{2010212001|XXGvertex_oport_oport|685|0|1095|0|{2|lkp|}408|411|}
{2010213001|XXGoport_dst_flow|686|0|1097|0|{0|}411|239|}
{2010212001|XXGvertex_oport_oport|687|0|1098|0|{3|reject0|}408|412|}
{2010212001|XXGvertex_oport_oport|688|0|1100|0|{4|reject1|}408|413|}
{2010212001|XXGvertex_oport_oport|689|0|1102|0|{5|reject2|}408|414|}
{2010212001|XXGvertex_oport_oport|690|0|1104|0|{6|error0|}408|415|}
{2010212001|XXGvertex_oport_oport|691|0|1106|0|{7|error1|}408|416|}
{2010212001|XXGvertex_oport_oport|692|0|1108|0|{8|error2|}408|417|}
{2010212001|XXGvertex_oport_oport|693|0|1110|0|{9|log|}408|418|}
{2010211001|XXGvertex_iport_iport|694|0|1112|0|{0|in|}408|419|}
{2010007001|XXGobject_proto_object|695|0|1114|0|{}408|420|}
{2010212001|XXGvertex_oport_oport|696|0|1116|0|{0|source|}420|421|}
{2010006001|XXGobject_psameas_object|697|0|1118|0|{metadata|out0_metadata|1|0|}421|420|}
{2010006001|XXGobject_psameas_object|698|0|1119|0|{transform0|transform0|1|0|}421|420|}
{2010212001|XXGvertex_oport_oport|699|0|1120|0|{1|clean|}420|422|}
{2010006001|XXGobject_psameas_object|700|0|1122|0|{metadata|out1_metadata|1|0|}422|420|}
{2010006001|XXGobject_psameas_object|701|0|1123|0|{transform1|transform1|1|0|}422|420|}
{2010212001|XXGvertex_oport_oport|702|0|1124|0|{2|lkp|}420|423|}
{2010006001|XXGobject_psameas_object|703|0|1126|0|{metadata|out2_metadata|1|0|}423|420|}
{2010006001|XXGobject_psameas_object|704|0|1127|0|{transform2|transform2|1|0|}423|420|}
{2010212001|XXGvertex_oport_oport|705|0|1128|0|{3|reject0|}420|424|}
{2010006001|XXGobject_psameas_object|706|0|1130|0|{metadata|reject0_metadata|1|0|}424|420|}
{2010212001|XXGvertex_oport_oport|707|0|1131|0|{4|reject1|}420|425|}
{2010006001|XXGobject_psameas_object|708|0|1133|0|{metadata|reject1_metadata|1|0|}425|420|}
{2010212001|XXGvertex_oport_oport|709|0|1134|0|{5|reject2|}420|426|}
{2010006001|XXGobject_psameas_object|710|0|1136|0|{metadata|reject2_metadata|1|0|}426|420|}
{2010212001|XXGvertex_oport_oport|711|0|1137|0|{6|error0|}420|427|}
{2010006001|XXGobject_psameas_object|712|0|1139|0|{metadata|error0_metadata|1|0|}427|420|}
{2010212001|XXGvertex_oport_oport|713|0|1140|0|{7|error1|}420|428|}
{2010006001|XXGobject_psameas_object|714|0|1142|0|{metadata|error1_metadata|1|0|}428|420|}
{2010212001|XXGvertex_oport_oport|715|0|1143|0|{8|error2|}420|429|}
{2010006001|XXGobject_psameas_object|716|0|1145|0|{metadata|error2_metadata|1|0|}429|420|}
{2010212001|XXGvertex_oport_oport|717|0|1146|0|{9|log|}420|430|}
{2010006001|XXGobject_psameas_object|718|0|1148|0|{metadata|log_metadata|1|0|}430|420|}
{2010211001|XXGvertex_iport_iport|719|0|1149|0|{0|in|}420|431|}
{2010006001|XXGobject_psameas_object|720|0|1151|0|{metadata|in_metadata|1|0|}431|420|}
{2010601001|XXGgraph_vertex_vertex|721|0|1152|0|{Merge|}230|432|}
{2010212001|XXGvertex_oport_oport|722|0|1154|0|{0|out|}432|433|}
{2010213001|XXGoport_dst_flow|723|0|1156|0|{0|}433|243|}
{2010211001|XXGvertex_iport_iport|724|0|1157|0|{0|in|}432|434|}
{2010214001|XXGiport_src_flow|725|0|1159|0|{0|}434|241|}
{2010007001|XXGobject_proto_object|726|0|1160|0|{}432|435|}
{2010212001|XXGvertex_oport_oport|727|0|1162|0|{0|out|}435|436|}
{2010006001|XXGobject_psameas_object|728|0|1164|0|{metadata|out_metadata|1|0|}436|435|}
{2010211001|XXGvertex_iport_iport|729|0|1165|0|{0|in|}435|437|}
{2010006001|XXGobject_psameas_object|730|0|1167|0|{metadata|in_metadata|1|0|}437|435|}
{2010212001|XXGvertex_oport_oport|731|0|1168|0|{0|source|}230|438|}
{2010216002|XXGoport_binding_oport|732|0|1170|0|{.5|1.0|{8|840000|104000|860000|104000|890000|104000|910000|104000|}9943|}438|248|}
{2010212001|XXGvertex_oport_oport|733|0|1171|0|{1|clean|}230|439|}
{2010216002|XXGoport_binding_oport|734|0|1173|0|{.5|1.0|{12|835000|229000|855000|229000|890000|229000|890000|269000|890000|269000|910000|269000|}9944|}439|254|}
{2010212001|XXGvertex_oport_oport|735|0|1174|0|{2|lookup|}230|440|}
{2010216002|XXGoport_binding_oport|736|0|1176|0|{.5|.5|{12|862000|384000|882000|384000|886000|384000|886000|439000|890000|439000|910000|439000|}9945|}440|403|}
{2010211001|XXGvertex_iport_iport|737|0|1177|0|{0|in0|}230|441|}
{2010215002|XXGiport_binding_iport|738|0|1179|0|{.5|.5|{12|67000|229000|47000|229000|43000|229000|43000|269000|39000|269000|19000|269000|}9942|}441|419|}
{2010601001|XXGgraph_vertex_vertex|739|0|1180|0|{Read_Columnar_1|}1|442|}
{2010605001|XXGgraph_legend_legend|740|0|1182|0|{0|}442|443|}
{2010241001|XXGlegend_face_face|741|0|1184|0|{}443|444|}
{2010604001|XXGgraph_flow_flow|742|0|1186|0|{Flow_1|}442|445|}
{2010604001|XXGgraph_flow_flow|743|0|1188|0|{Flow_15|}442|446|}
{2010244001|XXGflow_watcher_watcher|744|0|1190|0|{}446|447|}
{2010604001|XXGgraph_flow_flow|745|0|1192|0|{Flow_16|}442|448|}
{2010244001|XXGflow_watcher_watcher|746|0|1194|0|{}448|449|}
{2010604001|XXGgraph_flow_flow|747|0|1196|0|{Flow_2|}442|88|}
{2010604001|XXGgraph_flow_flow|748|0|1197|0|{Flow_3|}442|450|}
{2010604001|XXGgraph_flow_flow|749|0|1199|0|{Flow_4|}442|451|}
{2010604001|XXGgraph_flow_flow|750|0|1201|0|{Flow_5|}442|452|}
{2010604001|XXGgraph_flow_flow|751|0|1203|0|{Flow_6|}442|94|}
{2010604001|XXGgraph_flow_flow|752|0|1204|0|{Flow_7|}442|453|}
{2010604001|XXGgraph_flow_flow|753|0|1206|0|{Flow_8|}442|454|}
{2010601001|XXGgraph_vertex_vertex|754|0|1208|0|{Data_Suppression_Outbound|}442|455|}
{2010212001|XXGvertex_oport_oport|755|0|1210|0|{0|out0|}455|456|}
{2010213001|XXGoport_dst_flow|756|0|1212|0|{0|}456|94|}
{2010212001|XXGvertex_oport_oport|757|0|1213|0|{1|deselect|}455|457|}
{2010213001|XXGoport_dst_flow|758|0|1215|0|{0|}457|446|}
{2010211001|XXGvertex_iport_iport|759|0|1216|0|{0|in0|}455|458|}
{2010214001|XXGiport_src_flow|760|0|1218|0|{0|}458|445|}
{2010006001|XXGobject_psameas_object|761|0|1219|0|{Layout|Layout|0|0|}455|53|}
{2010006001|XXGobject_psameas_object|762|0|1220|0|{deselect_metadata|read_metadata|0|0|}455|459|}
{2010212001|XXGvertex_oport_oport|763|0|1222|0|{0|read|}459|460|}
{2010213001|XXGoport_dst_flow|764|0|1224|0|{0|}460|445|}
{2010006001|XXGobject_psameas_object|765|0|1225|0|{in0_metadata|read_metadata|0|0|}455|459|}
{2010006001|XXGobject_psameas_object|766|0|1226|0|{out0_metadata|read_metadata|0|0|}455|459|}
{2010601001|XXGgraph_vertex_vertex|767|0|1227|0|{Data_Suppression_Outbound_1|}442|461|}
{2010212001|XXGvertex_oport_oport|768|0|1229|0|{0|out0|}461|462|}
{2010213001|XXGoport_dst_flow|769|0|1231|0|{0|}462|454|}
{2010212001|XXGvertex_oport_oport|770|0|1232|0|{1|deselect|}461|463|}
{2010213001|XXGoport_dst_flow|771|0|1234|0|{0|}463|448|}
{2010211001|XXGvertex_iport_iport|772|0|1235|0|{0|in0|}461|464|}
{2010214001|XXGiport_src_flow|773|0|1237|0|{0|}464|453|}
{2010006001|XXGobject_psameas_object|774|0|1238|0|{Layout|Layout|0|0|}461|53|}
{2010006001|XXGobject_psameas_object|775|0|1239|0|{deselect_metadata|read_metadata|0|0|}461|465|}
{2010212001|XXGvertex_oport_oport|776|0|1241|0|{0|read|}465|466|}
{2010213001|XXGoport_dst_flow|777|0|1243|0|{0|}466|453|}
{2010006001|XXGobject_psameas_object|778|0|1244|0|{in0_metadata|read_metadata|0|0|}461|465|}
{2010006001|XXGobject_psameas_object|779|0|1245|0|{out0_metadata|read_metadata|0|0|}461|465|}
{2010601001|XXGgraph_vertex_vertex|780|0|1246|0|{De_Dup|}442|467|}
{2010605001|XXGgraph_legend_legend|781|0|1248|0|{0|}467|468|}
{2010241001|XXGlegend_face_face|782|0|1250|0|{}468|469|}
{2010604001|XXGgraph_flow_flow|783|0|1252|0|{Flow_2|}467|470|}
{2010604001|XXGgraph_flow_flow|784|0|1254|0|{Flow_3|}467|471|}
{2010604001|XXGgraph_flow_flow|785|0|1256|0|{Flow_4|}467|81|}
{2010601001|XXGgraph_vertex_vertex|786|0|1257|0|{Dedup_Sorted|}467|472|}
{2010212001|XXGvertex_oport_oport|787|0|1259|0|{0|out|}472|473|}
{2010212001|XXGvertex_oport_oport|788|0|1261|0|{1|dup|}472|474|}
{2010212001|XXGvertex_oport_oport|789|0|1263|0|{2|reject|}472|475|}
{2010212001|XXGvertex_oport_oport|790|0|1265|0|{3|error|}472|476|}
{2010212001|XXGvertex_oport_oport|791|0|1267|0|{4|log|}472|477|}
{2010211001|XXGvertex_iport_iport|792|0|1269|0|{0|in|}472|478|}
{2010214001|XXGiport_src_flow|793|0|1271|0|{0|}478|471|}
{2010006001|XXGobject_psameas_object|794|0|1272|0|{Layout|Layout|0|0|}472|53|}
{2010006001|XXGobject_psameas_object|795|0|1273|0|{dup_metadata|out0_metadata|0|0|}472|79|}
{2010006001|XXGobject_psameas_object|796|0|1274|0|{in_metadata|out0_metadata|0|0|}472|79|}
{2010006001|XXGobject_psameas_object|797|0|1275|0|{out_metadata|out0_metadata|0|0|}472|79|}
{2010006001|XXGobject_psameas_object|798|0|1276|0|{reject_metadata|out0_metadata|0|0|}472|79|}
{2010601001|XXGgraph_vertex_vertex|799|0|1277|0|{RFMT_Create_hash_on_NK|}467|79|}
{2010601001|XXGgraph_vertex_vertex|800|0|1278|0|{Sort_on_ICFF_KEY|}467|479|}
{2010212001|XXGvertex_oport_oport|801|0|1280|0|{0|out|}479|480|}
{2010213001|XXGoport_dst_flow|802|0|1282|0|{0|}480|470|}
{2010211001|XXGvertex_iport_iport|803|0|1283|0|{0|in|}479|481|}
{2010214001|XXGiport_src_flow|804|0|1285|0|{0|}481|81|}
{2010006001|XXGobject_psameas_object|805|0|1286|0|{Layout|Layout|0|0|}479|53|}
{2010006001|XXGobject_psameas_object|806|0|1287|0|{in_metadata|out0_metadata|0|0|}479|79|}
{2010006001|XXGobject_psameas_object|807|0|1288|0|{out_metadata|out0_metadata|0|0|}479|79|}
{2010601001|XXGgraph_vertex_vertex|808|0|1289|0|{Sort_within_Groups_1|}467|482|}
{2010212001|XXGvertex_oport_oport|809|0|1291|0|{0|out|}482|483|}
{2010213001|XXGoport_dst_flow|810|0|1293|0|{0|}483|471|}
{2010211001|XXGvertex_iport_iport|811|0|1294|0|{0|in|}482|484|}
{2010214001|XXGiport_src_flow|812|0|1296|0|{0|}484|470|}
{2010006001|XXGobject_psameas_object|813|0|1297|0|{Layout|Layout|0|0|}482|53|}
{2010006001|XXGobject_psameas_object|814|0|1298|0|{in_metadata|out0_metadata|0|0|}482|79|}
{2010006001|XXGobject_psameas_object|815|0|1299|0|{out_metadata|out0_metadata|0|0|}482|79|}
{2010212001|XXGvertex_oport_oport|816|0|1300|0|{0|out0|}467|485|}
{2010216002|XXGoport_binding_oport|817|0|1302|0|{.5|.5|{0|}15147|}485|473|}
{2010213001|XXGoport_dst_flow|818|0|1303|0|{0|}485|451|}
{2010211001|XXGvertex_iport_iport|819|0|1304|0|{0|in0|}467|486|}
{2010215002|XXGiport_binding_iport|820|0|1306|0|{.5|.5|{0|}15146|}486|85|}
{2010214001|XXGiport_src_flow|821|0|1307|0|{0|}486|88|}
{2010601001|XXGgraph_vertex_vertex|822|0|1308|0|{De_Dup_1|}442|487|}
{2010605001|XXGgraph_legend_legend|823|0|1310|0|{0|}487|488|}
{2010241001|XXGlegend_face_face|824|0|1312|0|{}488|489|}
{2010604001|XXGgraph_flow_flow|825|0|1314|0|{Flow_2|}487|490|}
{2010604001|XXGgraph_flow_flow|826|0|1316|0|{Flow_3|}487|491|}
{2010604001|XXGgraph_flow_flow|827|0|1318|0|{Flow_4|}487|492|}
{2010601001|XXGgraph_vertex_vertex|828|0|1320|0|{Dedup_Sorted|}487|493|}
{2010212001|XXGvertex_oport_oport|829|0|1322|0|{0|out|}493|494|}
{2010212001|XXGvertex_oport_oport|830|0|1324|0|{1|dup|}493|495|}
{2010212001|XXGvertex_oport_oport|831|0|1326|0|{2|reject|}493|496|}
{2010212001|XXGvertex_oport_oport|832|0|1328|0|{3|error|}493|497|}
{2010212001|XXGvertex_oport_oport|833|0|1330|0|{4|log|}493|498|}
{2010211001|XXGvertex_iport_iport|834|0|1332|0|{0|in|}493|499|}
{2010214001|XXGiport_src_flow|835|0|1334|0|{0|}499|491|}
{2010006001|XXGobject_psameas_object|836|0|1335|0|{Layout|Layout|0|0|}493|53|}
{2010006001|XXGobject_psameas_object|837|0|1336|0|{dup_metadata|out0_metadata|0|0|}493|500|}
{2010212001|XXGvertex_oport_oport|838|0|1338|0|{0|out0|}500|501|}
{2010213001|XXGoport_dst_flow|839|0|1340|0|{0|}501|492|}
{2010212001|XXGvertex_oport_oport|840|0|1341|0|{1|reject0|}500|502|}
{2010212001|XXGvertex_oport_oport|841|0|1343|0|{2|error0|}500|503|}
{2010212001|XXGvertex_oport_oport|842|0|1345|0|{3|log|}500|504|}
{2010211001|XXGvertex_iport_iport|843|0|1347|0|{0|in|}500|505|}
{2010006001|XXGobject_psameas_object|844|0|1349|0|{Layout|Layout|0|0|}500|53|}
{2010006001|XXGobject_psameas_object|845|0|1350|0|{in_metadata|out_metadata|0|0|}500|506|}
{2010212001|XXGvertex_oport_oport|846|0|1352|0|{0|out|}506|507|}
{2010213001|XXGoport_dst_flow|847|0|1354|0|{0|}507|450|}
{2010212001|XXGvertex_oport_oport|848|0|1355|0|{1|deselect|}506|508|}
{2010212001|XXGvertex_oport_oport|849|0|1357|0|{2|reject|}506|509|}
{2010212001|XXGvertex_oport_oport|850|0|1359|0|{3|error|}506|510|}
{2010212001|XXGvertex_oport_oport|851|0|1361|0|{4|log|}506|511|}
{2010211001|XXGvertex_iport_iport|852|0|1363|0|{0|in|}506|512|}
{2010214001|XXGiport_src_flow|853|0|1365|0|{0|}512|454|}
{2010006001|XXGobject_psameas_object|854|0|1366|0|{Layout|Layout|0|0|}506|53|}
{2010006001|XXGobject_psameas_object|855|0|1367|0|{reject0_metadata|out_metadata|0|0|}500|506|}
{2010006001|XXGobject_psameas_object|856|0|1368|0|{in_metadata|out0_metadata|0|0|}493|500|}
{2010006001|XXGobject_psameas_object|857|0|1369|0|{out_metadata|out0_metadata|0|0|}493|500|}
{2010006001|XXGobject_psameas_object|858|0|1370|0|{reject_metadata|out0_metadata|0|0|}493|500|}
{2010601001|XXGgraph_vertex_vertex|859|0|1371|0|{RFMT_Create_hash_on_NK|}487|500|}
{2010601001|XXGgraph_vertex_vertex|860|0|1372|0|{Sort_on_ICFF_KEY|}487|513|}
{2010212001|XXGvertex_oport_oport|861|0|1374|0|{0|out|}513|514|}
{2010213001|XXGoport_dst_flow|862|0|1376|0|{0|}514|490|}
{2010211001|XXGvertex_iport_iport|863|0|1377|0|{0|in|}513|515|}
{2010214001|XXGiport_src_flow|864|0|1379|0|{0|}515|492|}
{2010006001|XXGobject_psameas_object|865|0|1380|0|{Layout|Layout|0|0|}513|53|}
{2010006001|XXGobject_psameas_object|866|0|1381|0|{in_metadata|out0_metadata|0|0|}513|500|}
{2010006001|XXGobject_psameas_object|867|0|1382|0|{out_metadata|out0_metadata|0|0|}513|500|}
{2010601001|XXGgraph_vertex_vertex|868|0|1383|0|{Sort_within_Groups_1|}487|516|}
{2010212001|XXGvertex_oport_oport|869|0|1385|0|{0|out|}516|517|}
{2010213001|XXGoport_dst_flow|870|0|1387|0|{0|}517|491|}
{2010211001|XXGvertex_iport_iport|871|0|1388|0|{0|in|}516|518|}
{2010214001|XXGiport_src_flow|872|0|1390|0|{0|}518|490|}
{2010006001|XXGobject_psameas_object|873|0|1391|0|{Layout|Layout|0|0|}516|53|}
{2010006001|XXGobject_psameas_object|874|0|1392|0|{in_metadata|out0_metadata|0|0|}516|500|}
{2010006001|XXGobject_psameas_object|875|0|1393|0|{out_metadata|out0_metadata|0|0|}516|500|}
{2010212001|XXGvertex_oport_oport|876|0|1394|0|{0|out0|}487|519|}
{2010216002|XXGoport_binding_oport|877|0|1396|0|{.5|.5|{0|}15140|}519|494|}
{2010213001|XXGoport_dst_flow|878|0|1397|0|{0|}519|452|}
{2010211001|XXGvertex_iport_iport|879|0|1398|0|{0|in0|}487|520|}
{2010215002|XXGiport_binding_iport|880|0|1400|0|{.5|.5|{0|}15139|}520|505|}
{2010214001|XXGiport_src_flow|881|0|1401|0|{0|}520|450|}
{2010601001|XXGgraph_vertex_vertex|882|0|1402|0|{Discard_Suppressed_Data|}442|521|}
{2010211001|XXGvertex_iport_iport|883|0|1404|0|{0|in|}521|522|}
{2010214001|XXGiport_src_flow|884|0|1406|0|{0|}522|446|}
{2010006001|XXGobject_psameas_object|885|0|1407|0|{Layout|Layout|0|0|}521|455|}
{2010006001|XXGobject_psameas_object|886|0|1408|0|{in_metadata|read_metadata|0|0|}521|459|}
{2010601001|XXGgraph_vertex_vertex|887|0|1409|0|{Discard_Suppressed_Data_1|}442|523|}
{2010211001|XXGvertex_iport_iport|888|0|1411|0|{0|in|}523|524|}
{2010214001|XXGiport_src_flow|889|0|1413|0|{0|}524|448|}
{2010006001|XXGobject_psameas_object|890|0|1414|0|{Layout|Layout|0|0|}523|461|}
{2010006001|XXGobject_psameas_object|891|0|1415|0|{in_metadata|read_metadata|0|0|}523|465|}
{2010601001|XXGgraph_vertex_vertex|892|0|1416|0|{Existing_IDS_ICFF|}442|459|}
{2010601001|XXGgraph_vertex_vertex|893|0|1417|0|{Filter_by_Expression_1|}442|506|}
{2010601001|XXGgraph_vertex_vertex|894|0|1418|0|{Filter_by_Expression_2|}442|86|}
{2010601001|XXGgraph_vertex_vertex|895|0|1419|0|{Input_File_Archive|}442|465|}
{2010601001|XXGgraph_vertex_vertex|896|0|1420|0|{Merge|}442|525|}
{2010212001|XXGvertex_oport_oport|897|0|1422|0|{0|out|}525|526|}
{2010211001|XXGvertex_iport_iport|898|0|1424|0|{0|in|}525|527|}
{2010214001|XXGiport_src_flow|899|0|1426|0|{0|}527|451|}
{2010214001|XXGiport_src_flow|900|0|1427|0|{1|}527|452|}
{2010006001|XXGobject_psameas_object|901|0|1428|0|{Layout|Layout|0|0|}525|53|}
{2010006001|XXGobject_psameas_object|902|0|1429|0|{in_metadata|out0_metadata|0|0|}525|79|}
{2010006001|XXGobject_psameas_object|903|0|1430|0|{out_metadata|out0_metadata|0|0|}525|79|}
{2010212001|XXGvertex_oport_oport|904|0|1431|0|{0|out0|}442|528|}
{2010216002|XXGoport_binding_oport|905|0|1433|0|{.5|.5|{0|}15740|}528|526|}
{2010213001|XXGoport_dst_flow|906|0|1434|0|{0|}528|7|}
{2010007001|XXGobject_proto_object|907|0|1435|0|{}442|529|}
{2010605001|XXGgraph_legend_legend|908|0|1437|0|{0|}529|530|}
{2010241001|XXGlegend_face_face|909|0|1439|0|{}530|531|}
{2010604001|XXGgraph_flow_flow|910|0|1441|0|{Flow_1|}529|532|}
{2010604001|XXGgraph_flow_flow|911|0|1443|0|{Flow_15|}529|533|}
{2010244001|XXGflow_watcher_watcher|912|0|1445|0|{}533|534|}
{2010604001|XXGgraph_flow_flow|913|0|1447|0|{Flow_16|}529|535|}
{2010244001|XXGflow_watcher_watcher|914|0|1449|0|{}535|536|}
{2010604001|XXGgraph_flow_flow|915|0|1451|0|{Flow_2|}529|537|}
{2010604001|XXGgraph_flow_flow|916|0|1453|0|{Flow_3|}529|538|}
{2010604001|XXGgraph_flow_flow|917|0|1455|0|{Flow_4|}529|539|}
{2010604001|XXGgraph_flow_flow|918|0|1457|0|{Flow_5|}529|540|}
{2010604001|XXGgraph_flow_flow|919|0|1459|0|{Flow_6|}529|541|}
{2010604001|XXGgraph_flow_flow|920|0|1461|0|{Flow_7|}529|542|}
{2010604001|XXGgraph_flow_flow|921|0|1463|0|{Flow_8|}529|543|}
{2010601001|XXGgraph_vertex_vertex|922|0|1465|0|{Data_Suppression_Outbound|}529|544|}
{2010401001|XXGvertex_prototype_vertex|923|0|1467|0|{}544|545|}
{2010212001|XXGvertex_oport_oport|924|0|1469|0|{0|out0|}545|546|}
{2010006001|XXGobject_psameas_object|925|0|1471|0|{metadata|out0_metadata|1|0|}546|545|}
{2010212001|XXGvertex_oport_oport|926|0|1472|0|{1|deselect|}545|547|}
{2010006001|XXGobject_psameas_object|927|0|1474|0|{metadata|deselect_metadata|1|0|}547|545|}
{2010211001|XXGvertex_iport_iport|928|0|1475|0|{0|in0|}545|548|}
{2010006001|XXGobject_psameas_object|929|0|1477|0|{metadata|in0_metadata|1|0|}548|545|}
{2010212001|XXGvertex_oport_oport|930|0|1478|0|{0|out0|}544|549|}
{2010213001|XXGoport_dst_flow|931|0|1480|0|{0|}549|541|}
{2010212001|XXGvertex_oport_oport|932|0|1481|0|{1|deselect|}544|550|}
{2010213001|XXGoport_dst_flow|933|0|1483|0|{0|}550|533|}
{2010211001|XXGvertex_iport_iport|934|0|1484|0|{0|in0|}544|551|}
{2010214001|XXGiport_src_flow|935|0|1486|0|{0|}551|532|}
{2010601001|XXGgraph_vertex_vertex|936|0|1487|0|{Data_Suppression_Outbound_1|}529|552|}
{2010401001|XXGvertex_prototype_vertex|937|0|1489|0|{}552|553|}
{2010212001|XXGvertex_oport_oport|938|0|1491|0|{0|out0|}553|554|}
{2010006001|XXGobject_psameas_object|939|0|1493|0|{metadata|out0_metadata|1|0|}554|553|}
{2010212001|XXGvertex_oport_oport|940|0|1494|0|{1|deselect|}553|555|}
{2010006001|XXGobject_psameas_object|941|0|1496|0|{metadata|deselect_metadata|1|0|}555|553|}
{2010211001|XXGvertex_iport_iport|942|0|1497|0|{0|in0|}553|556|}
{2010006001|XXGobject_psameas_object|943|0|1499|0|{metadata|in0_metadata|1|0|}556|553|}
{2010212001|XXGvertex_oport_oport|944|0|1500|0|{0|out0|}552|557|}
{2010213001|XXGoport_dst_flow|945|0|1502|0|{0|}557|543|}
{2010212001|XXGvertex_oport_oport|946|0|1503|0|{1|deselect|}552|558|}
{2010213001|XXGoport_dst_flow|947|0|1505|0|{0|}558|535|}
{2010211001|XXGvertex_iport_iport|948|0|1506|0|{0|in0|}552|559|}
{2010214001|XXGiport_src_flow|949|0|1508|0|{0|}559|542|}
{2010601001|XXGgraph_vertex_vertex|950|0|1509|0|{De_Dup|}529|560|}
{2010605001|XXGgraph_legend_legend|951|0|1511|0|{0|}560|561|}
{2010241001|XXGlegend_face_face|952|0|1513|0|{}561|562|}
{2010604001|XXGgraph_flow_flow|953|0|1515|0|{Flow_2|}560|563|}
{2010604001|XXGgraph_flow_flow|954|0|1517|0|{Flow_3|}560|564|}
{2010604001|XXGgraph_flow_flow|955|0|1519|0|{Flow_4|}560|565|}
{2010601001|XXGgraph_vertex_vertex|956|0|1521|0|{Dedup_Sorted|}560|566|}
{2010212001|XXGvertex_oport_oport|957|0|1523|0|{0|out|}566|567|}
{2010212001|XXGvertex_oport_oport|958|0|1525|0|{1|dup|}566|568|}
{2010212001|XXGvertex_oport_oport|959|0|1527|0|{2|reject|}566|569|}
{2010212001|XXGvertex_oport_oport|960|0|1529|0|{3|error|}566|570|}
{2010212001|XXGvertex_oport_oport|961|0|1531|0|{4|log|}566|571|}
{2010211001|XXGvertex_iport_iport|962|0|1533|0|{0|in|}566|572|}
{2010214001|XXGiport_src_flow|963|0|1535|0|{0|}572|564|}
{2010007001|XXGobject_proto_object|964|0|1536|0|{}566|573|}
{2010212001|XXGvertex_oport_oport|965|0|1538|0|{0|out|}573|574|}
{2010006001|XXGobject_psameas_object|966|0|1540|0|{metadata|out_metadata|1|0|}574|573|}
{2010212001|XXGvertex_oport_oport|967|0|1541|0|{1|dup|}573|575|}
{2010006001|XXGobject_psameas_object|968|0|1543|0|{metadata|dup_metadata|1|0|}575|573|}
{2010212001|XXGvertex_oport_oport|969|0|1544|0|{2|reject|}573|576|}
{2010006001|XXGobject_psameas_object|970|0|1546|0|{metadata|reject_metadata|1|0|}576|573|}
{2010212001|XXGvertex_oport_oport|971|0|1547|0|{3|error|}573|577|}
{2010006001|XXGobject_psameas_object|972|0|1549|0|{metadata|error_metadata|1|0|}577|573|}
{2010212001|XXGvertex_oport_oport|973|0|1550|0|{4|log|}573|578|}
{2010006001|XXGobject_psameas_object|974|0|1552|0|{metadata|log_metadata|1|0|}578|573|}
{2010211001|XXGvertex_iport_iport|975|0|1553|0|{0|in|}573|579|}
{2010006001|XXGobject_psameas_object|976|0|1555|0|{metadata|in_metadata|1|0|}579|573|}
{2010601001|XXGgraph_vertex_vertex|977|0|1556|0|{RFMT_Create_hash_on_NK|}560|580|}
{2010212001|XXGvertex_oport_oport|978|0|1558|0|{0|out0|}580|581|}
{2010213001|XXGoport_dst_flow|979|0|1560|0|{0|}581|565|}
{2010212001|XXGvertex_oport_oport|980|0|1561|0|{1|reject0|}580|582|}
{2010212001|XXGvertex_oport_oport|981|0|1563|0|{2|error0|}580|583|}
{2010212001|XXGvertex_oport_oport|982|0|1565|0|{3|log|}580|584|}
{2010211001|XXGvertex_iport_iport|983|0|1567|0|{0|in|}580|585|}
{2010007001|XXGobject_proto_object|984|0|1569|0|{}580|586|}
{2010212001|XXGvertex_oport_oport|985|0|1571|0|{0|out0|}586|587|}
{2010006001|XXGobject_psameas_object|986|0|1573|0|{metadata|out0_metadata|1|0|}587|586|}
{2010006001|XXGobject_psameas_object|987|0|1574|0|{transform0|transform0|1|0|}587|586|}
{2010212001|XXGvertex_oport_oport|988|0|1575|0|{1|reject0|}586|588|}
{2010006001|XXGobject_psameas_object|989|0|1577|0|{metadata|reject0_metadata|1|0|}588|586|}
{2010212001|XXGvertex_oport_oport|990|0|1578|0|{2|error0|}586|589|}
{2010006001|XXGobject_psameas_object|991|0|1580|0|{metadata|error0_metadata|1|0|}589|586|}
{2010212001|XXGvertex_oport_oport|992|0|1581|0|{3|log|}586|590|}
{2010006001|XXGobject_psameas_object|993|0|1583|0|{metadata|log_metadata|1|0|}590|586|}
{2010211001|XXGvertex_iport_iport|994|0|1584|0|{0|in|}586|591|}
{2010006001|XXGobject_psameas_object|995|0|1586|0|{metadata|in_metadata|1|0|}591|586|}
{2010601001|XXGgraph_vertex_vertex|996|0|1587|0|{Sort_on_ICFF_KEY|}560|592|}
{2010212001|XXGvertex_oport_oport|997|0|1589|0|{0|out|}592|593|}
{2010213001|XXGoport_dst_flow|998|0|1591|0|{0|}593|563|}
{2010211001|XXGvertex_iport_iport|999|0|1592|0|{0|in|}592|594|}
{2010214001|XXGiport_src_flow|1000|0|1594|0|{0|}594|565|}
{2010007001|XXGobject_proto_object|1001|0|1595|0|{}592|595|}
{2010212001|XXGvertex_oport_oport|1002|0|1597|0|{0|out|}595|596|}
{2010006001|XXGobject_psameas_object|1003|0|1599|0|{metadata|out_metadata|1|0|}596|595|}
{2010211001|XXGvertex_iport_iport|1004|0|1600|0|{0|in|}595|597|}
{2010006001|XXGobject_psameas_object|1005|0|1602|0|{metadata|in_metadata|1|0|}597|595|}
{2010601001|XXGgraph_vertex_vertex|1006|0|1603|0|{Sort_within_Groups_1|}560|598|}
{2010212001|XXGvertex_oport_oport|1007|0|1605|0|{0|out|}598|599|}
{2010213001|XXGoport_dst_flow|1008|0|1607|0|{0|}599|564|}
{2010211001|XXGvertex_iport_iport|1009|0|1608|0|{0|in|}598|600|}
{2010214001|XXGiport_src_flow|1010|0|1610|0|{0|}600|563|}
{2010007001|XXGobject_proto_object|1011|0|1611|0|{}598|601|}
{2010212001|XXGvertex_oport_oport|1012|0|1613|0|{0|out|}601|602|}
{2010006001|XXGobject_psameas_object|1013|0|1615|0|{metadata|out_metadata|1|0|}602|601|}
{2010211001|XXGvertex_iport_iport|1014|0|1616|0|{0|in|}601|603|}
{2010006001|XXGobject_psameas_object|1015|0|1618|0|{metadata|in_metadata|1|0|}603|601|}
{2010212001|XXGvertex_oport_oport|1016|0|1619|0|{0|out0|}560|604|}
{2010216002|XXGoport_binding_oport|1017|0|1621|0|{.5|.5|{0|}15147|}604|567|}
{2010213001|XXGoport_dst_flow|1018|0|1622|0|{0|}604|539|}
{2010211001|XXGvertex_iport_iport|1019|0|1623|0|{0|in0|}560|605|}
{2010215002|XXGiport_binding_iport|1020|0|1625|0|{.5|.5|{0|}15146|}605|585|}
{2010214001|XXGiport_src_flow|1021|0|1626|0|{0|}605|537|}
{2010601001|XXGgraph_vertex_vertex|1022|0|1627|0|{De_Dup_1|}529|606|}
{2010605001|XXGgraph_legend_legend|1023|0|1629|0|{0|}606|607|}
{2010241001|XXGlegend_face_face|1024|0|1631|0|{}607|608|}
{2010604001|XXGgraph_flow_flow|1025|0|1633|0|{Flow_2|}606|609|}
{2010604001|XXGgraph_flow_flow|1026|0|1635|0|{Flow_3|}606|610|}
{2010604001|XXGgraph_flow_flow|1027|0|1637|0|{Flow_4|}606|611|}
{2010601001|XXGgraph_vertex_vertex|1028|0|1639|0|{Dedup_Sorted|}606|612|}
{2010212001|XXGvertex_oport_oport|1029|0|1641|0|{0|out|}612|613|}
{2010212001|XXGvertex_oport_oport|1030|0|1643|0|{1|dup|}612|614|}
{2010212001|XXGvertex_oport_oport|1031|0|1645|0|{2|reject|}612|615|}
{2010212001|XXGvertex_oport_oport|1032|0|1647|0|{3|error|}612|616|}
{2010212001|XXGvertex_oport_oport|1033|0|1649|0|{4|log|}612|617|}
{2010211001|XXGvertex_iport_iport|1034|0|1651|0|{0|in|}612|618|}
{2010214001|XXGiport_src_flow|1035|0|1653|0|{0|}618|610|}
{2010007001|XXGobject_proto_object|1036|0|1654|0|{}612|619|}
{2010212001|XXGvertex_oport_oport|1037|0|1656|0|{0|out|}619|620|}
{2010006001|XXGobject_psameas_object|1038|0|1658|0|{metadata|out_metadata|1|0|}620|619|}
{2010212001|XXGvertex_oport_oport|1039|0|1659|0|{1|dup|}619|621|}
{2010006001|XXGobject_psameas_object|1040|0|1661|0|{metadata|dup_metadata|1|0|}621|619|}
{2010212001|XXGvertex_oport_oport|1041|0|1662|0|{2|reject|}619|622|}
{2010006001|XXGobject_psameas_object|1042|0|1664|0|{metadata|reject_metadata|1|0|}622|619|}
{2010212001|XXGvertex_oport_oport|1043|0|1665|0|{3|error|}619|623|}
{2010006001|XXGobject_psameas_object|1044|0|1667|0|{metadata|error_metadata|1|0|}623|619|}
{2010212001|XXGvertex_oport_oport|1045|0|1668|0|{4|log|}619|624|}
{2010006001|XXGobject_psameas_object|1046|0|1670|0|{metadata|log_metadata|1|0|}624|619|}
{2010211001|XXGvertex_iport_iport|1047|0|1671|0|{0|in|}619|625|}
{2010006001|XXGobject_psameas_object|1048|0|1673|0|{metadata|in_metadata|1|0|}625|619|}
{2010601001|XXGgraph_vertex_vertex|1049|0|1674|0|{RFMT_Create_hash_on_NK|}606|626|}
{2010212001|XXGvertex_oport_oport|1050|0|1676|0|{0|out0|}626|627|}
{2010213001|XXGoport_dst_flow|1051|0|1678|0|{0|}627|611|}
{2010212001|XXGvertex_oport_oport|1052|0|1679|0|{1|reject0|}626|628|}
{2010212001|XXGvertex_oport_oport|1053|0|1681|0|{2|error0|}626|629|}
{2010212001|XXGvertex_oport_oport|1054|0|1683|0|{3|log|}626|630|}
{2010211001|XXGvertex_iport_iport|1055|0|1685|0|{0|in|}626|631|}
{2010007001|XXGobject_proto_object|1056|0|1687|0|{}626|632|}
{2010212001|XXGvertex_oport_oport|1057|0|1689|0|{0|out0|}632|633|}
{2010006001|XXGobject_psameas_object|1058|0|1691|0|{metadata|out0_metadata|1|0|}633|632|}
{2010006001|XXGobject_psameas_object|1059|0|1692|0|{transform0|transform0|1|0|}633|632|}
{2010212001|XXGvertex_oport_oport|1060|0|1693|0|{1|reject0|}632|634|}
{2010006001|XXGobject_psameas_object|1061|0|1695|0|{metadata|reject0_metadata|1|0|}634|632|}
{2010212001|XXGvertex_oport_oport|1062|0|1696|0|{2|error0|}632|635|}
{2010006001|XXGobject_psameas_object|1063|0|1698|0|{metadata|error0_metadata|1|0|}635|632|}
{2010212001|XXGvertex_oport_oport|1064|0|1699|0|{3|log|}632|636|}
{2010006001|XXGobject_psameas_object|1065|0|1701|0|{metadata|log_metadata|1|0|}636|632|}
{2010211001|XXGvertex_iport_iport|1066|0|1702|0|{0|in|}632|637|}
{2010006001|XXGobject_psameas_object|1067|0|1704|0|{metadata|in_metadata|1|0|}637|632|}
{2010601001|XXGgraph_vertex_vertex|1068|0|1705|0|{Sort_on_ICFF_KEY|}606|638|}
{2010212001|XXGvertex_oport_oport|1069|0|1707|0|{0|out|}638|639|}
{2010213001|XXGoport_dst_flow|1070|0|1709|0|{0|}639|609|}
{2010211001|XXGvertex_iport_iport|1071|0|1710|0|{0|in|}638|640|}
{2010214001|XXGiport_src_flow|1072|0|1712|0|{0|}640|611|}
{2010007001|XXGobject_proto_object|1073|0|1713|0|{}638|641|}
{2010212001|XXGvertex_oport_oport|1074|0|1715|0|{0|out|}641|642|}
{2010006001|XXGobject_psameas_object|1075|0|1717|0|{metadata|out_metadata|1|0|}642|641|}
{2010211001|XXGvertex_iport_iport|1076|0|1718|0|{0|in|}641|643|}
{2010006001|XXGobject_psameas_object|1077|0|1720|0|{metadata|in_metadata|1|0|}643|641|}
{2010601001|XXGgraph_vertex_vertex|1078|0|1721|0|{Sort_within_Groups_1|}606|644|}
{2010212001|XXGvertex_oport_oport|1079|0|1723|0|{0|out|}644|645|}
{2010213001|XXGoport_dst_flow|1080|0|1725|0|{0|}645|610|}
{2010211001|XXGvertex_iport_iport|1081|0|1726|0|{0|in|}644|646|}
{2010214001|XXGiport_src_flow|1082|0|1728|0|{0|}646|609|}
{2010007001|XXGobject_proto_object|1083|0|1729|0|{}644|647|}
{2010212001|XXGvertex_oport_oport|1084|0|1731|0|{0|out|}647|648|}
{2010006001|XXGobject_psameas_object|1085|0|1733|0|{metadata|out_metadata|1|0|}648|647|}
{2010211001|XXGvertex_iport_iport|1086|0|1734|0|{0|in|}647|649|}
{2010006001|XXGobject_psameas_object|1087|0|1736|0|{metadata|in_metadata|1|0|}649|647|}
{2010212001|XXGvertex_oport_oport|1088|0|1737|0|{0|out0|}606|650|}
{2010216002|XXGoport_binding_oport|1089|0|1739|0|{.5|.5|{0|}15140|}650|613|}
{2010213001|XXGoport_dst_flow|1090|0|1740|0|{0|}650|540|}
{2010211001|XXGvertex_iport_iport|1091|0|1741|0|{0|in0|}606|651|}
{2010215002|XXGiport_binding_iport|1092|0|1743|0|{.5|.5|{0|}15139|}651|631|}
{2010214001|XXGiport_src_flow|1093|0|1744|0|{0|}651|538|}
{2010601001|XXGgraph_vertex_vertex|1094|0|1745|0|{Discard_Suppressed_Data|}529|652|}
{2010211001|XXGvertex_iport_iport|1095|0|1747|0|{0|in|}652|653|}
{2010214001|XXGiport_src_flow|1096|0|1749|0|{0|}653|533|}
{2010007001|XXGobject_proto_object|1097|0|1750|0|{}652|654|}
{2010211001|XXGvertex_iport_iport|1098|0|1752|0|{0|in|}654|655|}
{2010006001|XXGobject_psameas_object|1099|0|1754|0|{metadata|in_metadata|1|0|}655|654|}
{2010601001|XXGgraph_vertex_vertex|1100|0|1755|0|{Discard_Suppressed_Data_1|}529|656|}
{2010211001|XXGvertex_iport_iport|1101|0|1757|0|{0|in|}656|657|}
{2010214001|XXGiport_src_flow|1102|0|1759|0|{0|}657|535|}
{2010007001|XXGobject_proto_object|1103|0|1760|0|{}656|658|}
{2010211001|XXGvertex_iport_iport|1104|0|1762|0|{0|in|}658|659|}
{2010006001|XXGobject_psameas_object|1105|0|1764|0|{metadata|in_metadata|1|0|}659|658|}
{2010601001|XXGgraph_vertex_vertex|1106|0|1765|0|{Existing_IDS_ICFF|}529|660|}
{2010212001|XXGvertex_oport_oport|1107|0|1767|0|{0|read|}660|661|}
{2010213001|XXGoport_dst_flow|1108|0|1769|0|{0|}661|532|}
{2010007001|XXGobject_proto_object|1109|0|1770|0|{}660|662|}
{2010212001|XXGvertex_oport_oport|1110|0|1772|0|{0|read|}662|663|}
{2010006001|XXGobject_psameas_object|1111|0|1774|0|{metadata|read_metadata|1|0|}663|662|}
{2010601001|XXGgraph_vertex_vertex|1112|0|1775|0|{Filter_by_Expression_1|}529|664|}
{2010212001|XXGvertex_oport_oport|1113|0|1777|0|{0|out|}664|665|}
{2010213001|XXGoport_dst_flow|1114|0|1779|0|{0|}665|538|}
{2010212001|XXGvertex_oport_oport|1115|0|1780|0|{1|deselect|}664|666|}
{2010212001|XXGvertex_oport_oport|1116|0|1782|0|{2|reject|}664|667|}
{2010212001|XXGvertex_oport_oport|1117|0|1784|0|{3|error|}664|668|}
{2010212001|XXGvertex_oport_oport|1118|0|1786|0|{4|log|}664|669|}
{2010211001|XXGvertex_iport_iport|1119|0|1788|0|{0|in|}664|670|}
{2010214001|XXGiport_src_flow|1120|0|1790|0|{0|}670|543|}
{2010007001|XXGobject_proto_object|1121|0|1791|0|{}664|671|}
{2010212001|XXGvertex_oport_oport|1122|0|1793|0|{0|out|}671|672|}
{2010006001|XXGobject_psameas_object|1123|0|1795|0|{metadata|out_metadata|1|0|}672|671|}
{2010212001|XXGvertex_oport_oport|1124|0|1796|0|{1|deselect|}671|673|}
{2010006001|XXGobject_psameas_object|1125|0|1798|0|{metadata|deselect_metadata|1|0|}673|671|}
{2010212001|XXGvertex_oport_oport|1126|0|1799|0|{2|reject|}671|674|}
{2010006001|XXGobject_psameas_object|1127|0|1801|0|{metadata|reject_metadata|1|0|}674|671|}
{2010212001|XXGvertex_oport_oport|1128|0|1802|0|{3|error|}671|675|}
{2010006001|XXGobject_psameas_object|1129|0|1804|0|{metadata|error_metadata|1|0|}675|671|}
{2010212001|XXGvertex_oport_oport|1130|0|1805|0|{4|log|}671|676|}
{2010006001|XXGobject_psameas_object|1131|0|1807|0|{metadata|log_metadata|1|0|}676|671|}
{2010211001|XXGvertex_iport_iport|1132|0|1808|0|{0|in|}671|677|}
{2010006001|XXGobject_psameas_object|1133|0|1810|0|{metadata|in_metadata|1|0|}677|671|}
{2010006001|XXGobject_psameas_object|1134|0|1811|0|{deselect_metadata|in_metadata|0|0|}664|664|}
{2010006001|XXGobject_psameas_object|1135|0|1812|0|{reject_metadata|in_metadata|0|0|}664|664|}
{2010601001|XXGgraph_vertex_vertex|1136|0|1813|0|{Filter_by_Expression_2|}529|678|}
{2010212001|XXGvertex_oport_oport|1137|0|1815|0|{0|out|}678|679|}
{2010213001|XXGoport_dst_flow|1138|0|1817|0|{0|}679|537|}
{2010212001|XXGvertex_oport_oport|1139|0|1818|0|{1|deselect|}678|680|}
{2010212001|XXGvertex_oport_oport|1140|0|1820|0|{2|reject|}678|681|}
{2010212001|XXGvertex_oport_oport|1141|0|1822|0|{3|error|}678|682|}
{2010212001|XXGvertex_oport_oport|1142|0|1824|0|{4|log|}678|683|}
{2010211001|XXGvertex_iport_iport|1143|0|1826|0|{0|in|}678|684|}
{2010214001|XXGiport_src_flow|1144|0|1828|0|{0|}684|541|}
{2010007001|XXGobject_proto_object|1145|0|1829|0|{}678|685|}
{2010212001|XXGvertex_oport_oport|1146|0|1831|0|{0|out|}685|686|}
{2010006001|XXGobject_psameas_object|1147|0|1833|0|{metadata|out_metadata|1|0|}686|685|}
{2010212001|XXGvertex_oport_oport|1148|0|1834|0|{1|deselect|}685|687|}
{2010006001|XXGobject_psameas_object|1149|0|1836|0|{metadata|deselect_metadata|1|0|}687|685|}
{2010212001|XXGvertex_oport_oport|1150|0|1837|0|{2|reject|}685|688|}
{2010006001|XXGobject_psameas_object|1151|0|1839|0|{metadata|reject_metadata|1|0|}688|685|}
{2010212001|XXGvertex_oport_oport|1152|0|1840|0|{3|error|}685|689|}
{2010006001|XXGobject_psameas_object|1153|0|1842|0|{metadata|error_metadata|1|0|}689|685|}
{2010212001|XXGvertex_oport_oport|1154|0|1843|0|{4|log|}685|690|}
{2010006001|XXGobject_psameas_object|1155|0|1845|0|{metadata|log_metadata|1|0|}690|685|}
{2010211001|XXGvertex_iport_iport|1156|0|1846|0|{0|in|}685|691|}
{2010006001|XXGobject_psameas_object|1157|0|1848|0|{metadata|in_metadata|1|0|}691|685|}
{2010006001|XXGobject_psameas_object|1158|0|1849|0|{reject_metadata|in_metadata|0|0|}678|678|}
{2010601001|XXGgraph_vertex_vertex|1159|0|1850|0|{Input_File_Archive|}529|692|}
{2010212001|XXGvertex_oport_oport|1160|0|1852|0|{0|read|}692|693|}
{2010213001|XXGoport_dst_flow|1161|0|1854|0|{0|}693|542|}
{2010007001|XXGobject_proto_object|1162|0|1855|0|{}692|694|}
{2010212001|XXGvertex_oport_oport|1163|0|1857|0|{0|read|}694|695|}
{2010006001|XXGobject_psameas_object|1164|0|1859|0|{metadata|read_metadata|1|0|}695|694|}
{2010601001|XXGgraph_vertex_vertex|1165|0|1860|0|{Merge|}529|696|}
{2010212001|XXGvertex_oport_oport|1166|0|1862|0|{0|out|}696|697|}
{2010211001|XXGvertex_iport_iport|1167|0|1864|0|{0|in|}696|698|}
{2010214001|XXGiport_src_flow|1168|0|1866|0|{0|}698|539|}
{2010214001|XXGiport_src_flow|1169|0|1867|0|{1|}698|540|}
{2010007001|XXGobject_proto_object|1170|0|1868|0|{}696|699|}
{2010212001|XXGvertex_oport_oport|1171|0|1870|0|{0|out|}699|700|}
{2010006001|XXGobject_psameas_object|1172|0|1872|0|{metadata|out_metadata|1|0|}700|699|}
{2010211001|XXGvertex_iport_iport|1173|0|1873|0|{0|in|}699|701|}
{2010006001|XXGobject_psameas_object|1174|0|1875|0|{metadata|in_metadata|1|0|}701|699|}
{2010212001|XXGvertex_oport_oport|1175|0|1876|0|{0|out0|}529|702|}
{2010216002|XXGoport_binding_oport|1176|0|1878|0|{.5|.5|{0|}15740|}702|697|}
{2010601001|XXGgraph_vertex_vertex|1177|0|1879|0|{Read_Columnar_2|}1|703|}
{2010605001|XXGgraph_legend_legend|1178|0|1881|0|{0|}703|704|}
{2010241001|XXGlegend_face_face|1179|0|1883|0|{}704|705|}
{2010604001|XXGgraph_flow_flow|1180|0|1885|0|{Flow_1|}703|706|}
{2010604001|XXGgraph_flow_flow|1181|0|1887|0|{Flow_15|}703|707|}
{2010244001|XXGflow_watcher_watcher|1182|0|1889|0|{}707|708|}
{2010604001|XXGgraph_flow_flow|1183|0|1891|0|{Flow_16|}703|709|}
{2010244001|XXGflow_watcher_watcher|1184|0|1893|0|{}709|710|}
{2010604001|XXGgraph_flow_flow|1185|0|1895|0|{Flow_2|}703|711|}
{2010604001|XXGgraph_flow_flow|1186|0|1897|0|{Flow_3|}703|104|}
{2010604001|XXGgraph_flow_flow|1187|0|1898|0|{Flow_4|}703|712|}
{2010604001|XXGgraph_flow_flow|1188|0|1900|0|{Flow_5|}703|713|}
{2010604001|XXGgraph_flow_flow|1189|0|1902|0|{Flow_6|}703|714|}
{2010604001|XXGgraph_flow_flow|1190|0|1904|0|{Flow_7|}703|715|}
{2010604001|XXGgraph_flow_flow|1191|0|1906|0|{Flow_8|}703|110|}
{2010601001|XXGgraph_vertex_vertex|1192|0|1907|0|{Data_Suppression_Outbound|}703|716|}
{2010212001|XXGvertex_oport_oport|1193|0|1909|0|{0|out0|}716|717|}
{2010213001|XXGoport_dst_flow|1194|0|1911|0|{0|}717|714|}
{2010212001|XXGvertex_oport_oport|1195|0|1912|0|{1|deselect|}716|718|}
{2010213001|XXGoport_dst_flow|1196|0|1914|0|{0|}718|707|}
{2010211001|XXGvertex_iport_iport|1197|0|1915|0|{0|in0|}716|719|}
{2010214001|XXGiport_src_flow|1198|0|1917|0|{0|}719|706|}
{2010006001|XXGobject_psameas_object|1199|0|1918|0|{Layout|Layout|0|0|}716|53|}
{2010006001|XXGobject_psameas_object|1200|0|1919|0|{deselect_metadata|read_metadata|0|0|}716|720|}
{2010212001|XXGvertex_oport_oport|1201|0|1921|0|{0|read|}720|721|}
{2010213001|XXGoport_dst_flow|1202|0|1923|0|{0|}721|706|}
{2010006001|XXGobject_psameas_object|1203|0|1924|0|{in0_metadata|read_metadata|0|0|}716|720|}
{2010006001|XXGobject_psameas_object|1204|0|1925|0|{out0_metadata|read_metadata|0|0|}716|720|}
{2010601001|XXGgraph_vertex_vertex|1205|0|1926|0|{Data_Suppression_Outbound_1|}703|722|}
{2010212001|XXGvertex_oport_oport|1206|0|1928|0|{0|out0|}722|723|}
{2010213001|XXGoport_dst_flow|1207|0|1930|0|{0|}723|110|}
{2010212001|XXGvertex_oport_oport|1208|0|1931|0|{1|deselect|}722|724|}
{2010213001|XXGoport_dst_flow|1209|0|1933|0|{0|}724|709|}
{2010211001|XXGvertex_iport_iport|1210|0|1934|0|{0|in0|}722|725|}
{2010214001|XXGiport_src_flow|1211|0|1936|0|{0|}725|715|}
{2010006001|XXGobject_psameas_object|1212|0|1937|0|{Layout|Layout|0|0|}722|53|}
{2010006001|XXGobject_psameas_object|1213|0|1938|0|{deselect_metadata|read_metadata|0|0|}722|726|}
{2010212001|XXGvertex_oport_oport|1214|0|1940|0|{0|read|}726|727|}
{2010213001|XXGoport_dst_flow|1215|0|1942|0|{0|}727|715|}
{2010006001|XXGobject_psameas_object|1216|0|1943|0|{in0_metadata|read_metadata|0|0|}722|726|}
{2010006001|XXGobject_psameas_object|1217|0|1944|0|{out0_metadata|read_metadata|0|0|}722|726|}
{2010601001|XXGgraph_vertex_vertex|1218|0|1945|0|{De_Dup|}703|728|}
{2010605001|XXGgraph_legend_legend|1219|0|1947|0|{0|}728|729|}
{2010241001|XXGlegend_face_face|1220|0|1949|0|{}729|730|}
{2010604001|XXGgraph_flow_flow|1221|0|1951|0|{Flow_2|}728|731|}
{2010604001|XXGgraph_flow_flow|1222|0|1953|0|{Flow_3|}728|732|}
{2010604001|XXGgraph_flow_flow|1223|0|1955|0|{Flow_4|}728|733|}
{2010601001|XXGgraph_vertex_vertex|1224|0|1957|0|{Dedup_Sorted|}728|734|}
{2010212001|XXGvertex_oport_oport|1225|0|1959|0|{0|out|}734|735|}
{2010212001|XXGvertex_oport_oport|1226|0|1961|0|{1|dup|}734|736|}
{2010212001|XXGvertex_oport_oport|1227|0|1963|0|{2|reject|}734|737|}
{2010212001|XXGvertex_oport_oport|1228|0|1965|0|{3|error|}734|738|}
{2010212001|XXGvertex_oport_oport|1229|0|1967|0|{4|log|}734|739|}
{2010211001|XXGvertex_iport_iport|1230|0|1969|0|{0|in|}734|740|}
{2010214001|XXGiport_src_flow|1231|0|1971|0|{0|}740|732|}
{2010006001|XXGobject_psameas_object|1232|0|1972|0|{Layout|Layout|0|0|}734|53|}
{2010006001|XXGobject_psameas_object|1233|0|1973|0|{dup_metadata|out0_metadata|0|0|}734|741|}
{2010212001|XXGvertex_oport_oport|1234|0|1975|0|{0|out0|}741|742|}
{2010213001|XXGoport_dst_flow|1235|0|1977|0|{0|}742|733|}
{2010212001|XXGvertex_oport_oport|1236|0|1978|0|{1|reject0|}741|743|}
{2010212001|XXGvertex_oport_oport|1237|0|1980|0|{2|error0|}741|744|}
{2010212001|XXGvertex_oport_oport|1238|0|1982|0|{3|log|}741|745|}
{2010211001|XXGvertex_iport_iport|1239|0|1984|0|{0|in|}741|746|}
{2010006001|XXGobject_psameas_object|1240|0|1986|0|{Layout|Layout|0|0|}741|53|}
{2010006001|XXGobject_psameas_object|1241|0|1987|0|{in_metadata|out_metadata|0|0|}741|747|}
{2010212001|XXGvertex_oport_oport|1242|0|1989|0|{0|out|}747|748|}
{2010213001|XXGoport_dst_flow|1243|0|1991|0|{0|}748|711|}
{2010212001|XXGvertex_oport_oport|1244|0|1992|0|{1|deselect|}747|749|}
{2010212001|XXGvertex_oport_oport|1245|0|1994|0|{2|reject|}747|750|}
{2010212001|XXGvertex_oport_oport|1246|0|1996|0|{3|error|}747|751|}
{2010212001|XXGvertex_oport_oport|1247|0|1998|0|{4|log|}747|752|}
{2010211001|XXGvertex_iport_iport|1248|0|2000|0|{0|in|}747|753|}
{2010214001|XXGiport_src_flow|1249|0|2002|0|{0|}753|714|}
{2010006001|XXGobject_psameas_object|1250|0|2003|0|{Layout|Layout|0|0|}747|53|}
{2010006001|XXGobject_psameas_object|1251|0|2004|0|{deselect_metadata|out_metadata|0|0|}747|747|}
{2010006001|XXGobject_psameas_object|1252|0|2005|0|{reject0_metadata|out_metadata|0|0|}741|747|}
{2010006001|XXGobject_psameas_object|1253|0|2006|0|{in_metadata|out0_metadata|0|0|}734|741|}
{2010006001|XXGobject_psameas_object|1254|0|2007|0|{out_metadata|out0_metadata|0|0|}734|741|}
{2010006001|XXGobject_psameas_object|1255|0|2008|0|{reject_metadata|out0_metadata|0|0|}734|741|}
{2010601001|XXGgraph_vertex_vertex|1256|0|2009|0|{RFMT_Create_hash_on_NK|}728|741|}
{2010601001|XXGgraph_vertex_vertex|1257|0|2010|0|{Sort_on_ICFF_KEY|}728|754|}
{2010212001|XXGvertex_oport_oport|1258|0|2012|0|{0|out|}754|755|}
{2010213001|XXGoport_dst_flow|1259|0|2014|0|{0|}755|731|}
{2010211001|XXGvertex_iport_iport|1260|0|2015|0|{0|in|}754|756|}
{2010214001|XXGiport_src_flow|1261|0|2017|0|{0|}756|733|}
{2010006001|XXGobject_psameas_object|1262|0|2018|0|{Layout|Layout|0|0|}754|53|}
{2010006001|XXGobject_psameas_object|1263|0|2019|0|{in_metadata|out0_metadata|0|0|}754|741|}
{2010006001|XXGobject_psameas_object|1264|0|2020|0|{out_metadata|out0_metadata|0|0|}754|741|}
{2010601001|XXGgraph_vertex_vertex|1265|0|2021|0|{Sort_within_Groups_1|}728|757|}
{2010212001|XXGvertex_oport_oport|1266|0|2023|0|{0|out|}757|758|}
{2010213001|XXGoport_dst_flow|1267|0|2025|0|{0|}758|732|}
{2010211001|XXGvertex_iport_iport|1268|0|2026|0|{0|in|}757|759|}
{2010214001|XXGiport_src_flow|1269|0|2028|0|{0|}759|731|}
{2010006001|XXGobject_psameas_object|1270|0|2029|0|{Layout|Layout|0|0|}757|53|}
{2010006001|XXGobject_psameas_object|1271|0|2030|0|{in_metadata|out0_metadata|0|0|}757|741|}
{2010006001|XXGobject_psameas_object|1272|0|2031|0|{out_metadata|out0_metadata|0|0|}757|741|}
{2010212001|XXGvertex_oport_oport|1273|0|2032|0|{0|out0|}728|760|}
{2010216002|XXGoport_binding_oport|1274|0|2034|0|{.5|.5|{0|}15147|}760|735|}
{2010213001|XXGoport_dst_flow|1275|0|2035|0|{0|}760|712|}
{2010211001|XXGvertex_iport_iport|1276|0|2036|0|{0|in0|}728|761|}
{2010215002|XXGiport_binding_iport|1277|0|2038|0|{.5|.5|{0|}15146|}761|746|}
{2010214001|XXGiport_src_flow|1278|0|2039|0|{0|}761|711|}
{2010601001|XXGgraph_vertex_vertex|1279|0|2040|0|{De_Dup_1|}703|762|}
{2010605001|XXGgraph_legend_legend|1280|0|2042|0|{0|}762|763|}
{2010241001|XXGlegend_face_face|1281|0|2044|0|{}763|764|}
{2010604001|XXGgraph_flow_flow|1282|0|2046|0|{Flow_2|}762|765|}
{2010604001|XXGgraph_flow_flow|1283|0|2048|0|{Flow_3|}762|766|}
{2010604001|XXGgraph_flow_flow|1284|0|2050|0|{Flow_4|}762|97|}
{2010601001|XXGgraph_vertex_vertex|1285|0|2051|0|{Dedup_Sorted|}762|767|}
{2010212001|XXGvertex_oport_oport|1286|0|2053|0|{0|out|}767|768|}
{2010212001|XXGvertex_oport_oport|1287|0|2055|0|{1|dup|}767|769|}
{2010212001|XXGvertex_oport_oport|1288|0|2057|0|{2|reject|}767|770|}
{2010212001|XXGvertex_oport_oport|1289|0|2059|0|{3|error|}767|771|}
{2010212001|XXGvertex_oport_oport|1290|0|2061|0|{4|log|}767|772|}
{2010211001|XXGvertex_iport_iport|1291|0|2063|0|{0|in|}767|773|}
{2010214001|XXGiport_src_flow|1292|0|2065|0|{0|}773|766|}
{2010006001|XXGobject_psameas_object|1293|0|2066|0|{Layout|Layout|0|0|}767|53|}
{2010006001|XXGobject_psameas_object|1294|0|2067|0|{dup_metadata|out0_metadata|0|0|}767|95|}
{2010006001|XXGobject_psameas_object|1295|0|2068|0|{in_metadata|out0_metadata|0|0|}767|95|}
{2010006001|XXGobject_psameas_object|1296|0|2069|0|{out_metadata|out0_metadata|0|0|}767|95|}
{2010006001|XXGobject_psameas_object|1297|0|2070|0|{reject_metadata|out0_metadata|0|0|}767|95|}
{2010601001|XXGgraph_vertex_vertex|1298|0|2071|0|{RFMT_Create_hash_on_NK|}762|95|}
{2010601001|XXGgraph_vertex_vertex|1299|0|2072|0|{Sort_on_ICFF_KEY|}762|774|}
{2010212001|XXGvertex_oport_oport|1300|0|2074|0|{0|out|}774|775|}
{2010213001|XXGoport_dst_flow|1301|0|2076|0|{0|}775|765|}
{2010211001|XXGvertex_iport_iport|1302|0|2077|0|{0|in|}774|776|}
{2010214001|XXGiport_src_flow|1303|0|2079|0|{0|}776|97|}
{2010006001|XXGobject_psameas_object|1304|0|2080|0|{Layout|Layout|0|0|}774|53|}
{2010006001|XXGobject_psameas_object|1305|0|2081|0|{in_metadata|out0_metadata|0|0|}774|95|}
{2010006001|XXGobject_psameas_object|1306|0|2082|0|{out_metadata|out0_metadata|0|0|}774|95|}
{2010601001|XXGgraph_vertex_vertex|1307|0|2083|0|{Sort_within_Groups_1|}762|777|}
{2010212001|XXGvertex_oport_oport|1308|0|2085|0|{0|out|}777|778|}
{2010213001|XXGoport_dst_flow|1309|0|2087|0|{0|}778|766|}
{2010211001|XXGvertex_iport_iport|1310|0|2088|0|{0|in|}777|779|}
{2010214001|XXGiport_src_flow|1311|0|2090|0|{0|}779|765|}
{2010006001|XXGobject_psameas_object|1312|0|2091|0|{Layout|Layout|0|0|}777|53|}
{2010006001|XXGobject_psameas_object|1313|0|2092|0|{in_metadata|out0_metadata|0|0|}777|95|}
{2010006001|XXGobject_psameas_object|1314|0|2093|0|{out_metadata|out0_metadata|0|0|}777|95|}
{2010212001|XXGvertex_oport_oport|1315|0|2094|0|{0|out0|}762|780|}
{2010216002|XXGoport_binding_oport|1316|0|2096|0|{.5|.5|{0|}15140|}780|768|}
{2010213001|XXGoport_dst_flow|1317|0|2097|0|{0|}780|713|}
{2010211001|XXGvertex_iport_iport|1318|0|2098|0|{0|in0|}762|781|}
{2010215002|XXGiport_binding_iport|1319|0|2100|0|{.5|.5|{0|}15139|}781|101|}
{2010214001|XXGiport_src_flow|1320|0|2101|0|{0|}781|104|}
{2010601001|XXGgraph_vertex_vertex|1321|0|2102|0|{Discard_Suppressed_Data|}703|782|}
{2010211001|XXGvertex_iport_iport|1322|0|2104|0|{0|in|}782|783|}
{2010214001|XXGiport_src_flow|1323|0|2106|0|{0|}783|707|}
{2010006001|XXGobject_psameas_object|1324|0|2107|0|{Layout|Layout|0|0|}782|716|}
{2010006001|XXGobject_psameas_object|1325|0|2108|0|{in_metadata|read_metadata|0|0|}782|720|}
{2010601001|XXGgraph_vertex_vertex|1326|0|2109|0|{Discard_Suppressed_Data_1|}703|784|}
{2010211001|XXGvertex_iport_iport|1327|0|2111|0|{0|in|}784|785|}
{2010214001|XXGiport_src_flow|1328|0|2113|0|{0|}785|709|}
{2010006001|XXGobject_psameas_object|1329|0|2114|0|{Layout|Layout|0|0|}784|722|}
{2010006001|XXGobject_psameas_object|1330|0|2115|0|{in_metadata|read_metadata|0|0|}784|726|}
{2010601001|XXGgraph_vertex_vertex|1331|0|2116|0|{Existing_IDS_ICFF|}703|720|}
{2010601001|XXGgraph_vertex_vertex|1332|0|2117|0|{Filter_by_Expression_1|}703|102|}
{2010601001|XXGgraph_vertex_vertex|1333|0|2118|0|{Filter_by_Expression_2|}703|747|}
{2010601001|XXGgraph_vertex_vertex|1334|0|2119|0|{Input_File_Archive|}703|726|}
{2010601001|XXGgraph_vertex_vertex|1335|0|2120|0|{Merge|}703|786|}
{2010212001|XXGvertex_oport_oport|1336|0|2122|0|{0|out|}786|787|}
{2010211001|XXGvertex_iport_iport|1337|0|2124|0|{0|in|}786|788|}
{2010214001|XXGiport_src_flow|1338|0|2126|0|{0|}788|712|}
{2010214001|XXGiport_src_flow|1339|0|2127|0|{1|}788|713|}
{2010006001|XXGobject_psameas_object|1340|0|2128|0|{Layout|Layout|0|0|}786|53|}
{2010006001|XXGobject_psameas_object|1341|0|2129|0|{in_metadata|out0_metadata|0|0|}786|95|}
{2010006001|XXGobject_psameas_object|1342|0|2130|0|{out_metadata|out0_metadata|0|0|}786|95|}
{2010212001|XXGvertex_oport_oport|1343|0|2131|0|{0|out0|}703|789|}
{2010216002|XXGoport_binding_oport|1344|0|2133|0|{.5|.5|{0|}15740|}789|787|}
{2010213001|XXGoport_dst_flow|1345|0|2134|0|{0|}789|11|}
{2010007001|XXGobject_proto_object|1346|0|2135|0|{}703|790|}
{2010605001|XXGgraph_legend_legend|1347|0|2137|0|{0|}790|791|}
{2010241001|XXGlegend_face_face|1348|0|2139|0|{}791|792|}
{2010604001|XXGgraph_flow_flow|1349|0|2141|0|{Flow_1|}790|793|}
{2010604001|XXGgraph_flow_flow|1350|0|2143|0|{Flow_15|}790|794|}
{2010244001|XXGflow_watcher_watcher|1351|0|2145|0|{}794|795|}
{2010604001|XXGgraph_flow_flow|1352|0|2147|0|{Flow_16|}790|796|}
{2010244001|XXGflow_watcher_watcher|1353|0|2149|0|{}796|797|}
{2010604001|XXGgraph_flow_flow|1354|0|2151|0|{Flow_2|}790|798|}
{2010604001|XXGgraph_flow_flow|1355|0|2153|0|{Flow_3|}790|799|}
{2010604001|XXGgraph_flow_flow|1356|0|2155|0|{Flow_4|}790|800|}
{2010604001|XXGgraph_flow_flow|1357|0|2157|0|{Flow_5|}790|801|}
{2010604001|XXGgraph_flow_flow|1358|0|2159|0|{Flow_6|}790|802|}
{2010604001|XXGgraph_flow_flow|1359|0|2161|0|{Flow_7|}790|803|}
{2010604001|XXGgraph_flow_flow|1360|0|2163|0|{Flow_8|}790|804|}
{2010601001|XXGgraph_vertex_vertex|1361|0|2165|0|{Data_Suppression_Outbound|}790|805|}
{2010401001|XXGvertex_prototype_vertex|1362|0|2167|0|{}805|806|}
{2010212001|XXGvertex_oport_oport|1363|0|2169|0|{0|out0|}806|807|}
{2010006001|XXGobject_psameas_object|1364|0|2171|0|{metadata|out0_metadata|1|0|}807|806|}
{2010212001|XXGvertex_oport_oport|1365|0|2172|0|{1|deselect|}806|808|}
{2010006001|XXGobject_psameas_object|1366|0|2174|0|{metadata|deselect_metadata|1|0|}808|806|}
{2010211001|XXGvertex_iport_iport|1367|0|2175|0|{0|in0|}806|809|}
{2010006001|XXGobject_psameas_object|1368|0|2177|0|{metadata|in0_metadata|1|0|}809|806|}
{2010212001|XXGvertex_oport_oport|1369|0|2178|0|{0|out0|}805|810|}
{2010213001|XXGoport_dst_flow|1370|0|2180|0|{0|}810|802|}
{2010212001|XXGvertex_oport_oport|1371|0|2181|0|{1|deselect|}805|811|}
{2010213001|XXGoport_dst_flow|1372|0|2183|0|{0|}811|794|}
{2010211001|XXGvertex_iport_iport|1373|0|2184|0|{0|in0|}805|812|}
{2010214001|XXGiport_src_flow|1374|0|2186|0|{0|}812|793|}
{2010601001|XXGgraph_vertex_vertex|1375|0|2187|0|{Data_Suppression_Outbound_1|}790|813|}
{2010401001|XXGvertex_prototype_vertex|1376|0|2189|0|{}813|814|}
{2010212001|XXGvertex_oport_oport|1377|0|2191|0|{0|out0|}814|815|}
{2010006001|XXGobject_psameas_object|1378|0|2193|0|{metadata|out0_metadata|1|0|}815|814|}
{2010212001|XXGvertex_oport_oport|1379|0|2194|0|{1|deselect|}814|816|}
{2010006001|XXGobject_psameas_object|1380|0|2196|0|{metadata|deselect_metadata|1|0|}816|814|}
{2010211001|XXGvertex_iport_iport|1381|0|2197|0|{0|in0|}814|817|}
{2010006001|XXGobject_psameas_object|1382|0|2199|0|{metadata|in0_metadata|1|0|}817|814|}
{2010212001|XXGvertex_oport_oport|1383|0|2200|0|{0|out0|}813|818|}
{2010213001|XXGoport_dst_flow|1384|0|2202|0|{0|}818|804|}
{2010212001|XXGvertex_oport_oport|1385|0|2203|0|{1|deselect|}813|819|}
{2010213001|XXGoport_dst_flow|1386|0|2205|0|{0|}819|796|}
{2010211001|XXGvertex_iport_iport|1387|0|2206|0|{0|in0|}813|820|}
{2010214001|XXGiport_src_flow|1388|0|2208|0|{0|}820|803|}
{2010601001|XXGgraph_vertex_vertex|1389|0|2209|0|{De_Dup|}790|821|}
{2010605001|XXGgraph_legend_legend|1390|0|2211|0|{0|}821|822|}
{2010241001|XXGlegend_face_face|1391|0|2213|0|{}822|823|}
{2010604001|XXGgraph_flow_flow|1392|0|2215|0|{Flow_2|}821|824|}
{2010604001|XXGgraph_flow_flow|1393|0|2217|0|{Flow_3|}821|825|}
{2010604001|XXGgraph_flow_flow|1394|0|2219|0|{Flow_4|}821|826|}
{2010601001|XXGgraph_vertex_vertex|1395|0|2221|0|{Dedup_Sorted|}821|827|}
{2010212001|XXGvertex_oport_oport|1396|0|2223|0|{0|out|}827|828|}
{2010212001|XXGvertex_oport_oport|1397|0|2225|0|{1|dup|}827|829|}
{2010212001|XXGvertex_oport_oport|1398|0|2227|0|{2|reject|}827|830|}
{2010212001|XXGvertex_oport_oport|1399|0|2229|0|{3|error|}827|831|}
{2010212001|XXGvertex_oport_oport|1400|0|2231|0|{4|log|}827|832|}
{2010211001|XXGvertex_iport_iport|1401|0|2233|0|{0|in|}827|833|}
{2010214001|XXGiport_src_flow|1402|0|2235|0|{0|}833|825|}
{2010007001|XXGobject_proto_object|1403|0|2236|0|{}827|834|}
{2010212001|XXGvertex_oport_oport|1404|0|2238|0|{0|out|}834|835|}
{2010006001|XXGobject_psameas_object|1405|0|2240|0|{metadata|out_metadata|1|0|}835|834|}
{2010212001|XXGvertex_oport_oport|1406|0|2241|0|{1|dup|}834|836|}
{2010006001|XXGobject_psameas_object|1407|0|2243|0|{metadata|dup_metadata|1|0|}836|834|}
{2010212001|XXGvertex_oport_oport|1408|0|2244|0|{2|reject|}834|837|}
{2010006001|XXGobject_psameas_object|1409|0|2246|0|{metadata|reject_metadata|1|0|}837|834|}
{2010212001|XXGvertex_oport_oport|1410|0|2247|0|{3|error|}834|838|}
{2010006001|XXGobject_psameas_object|1411|0|2249|0|{metadata|error_metadata|1|0|}838|834|}
{2010212001|XXGvertex_oport_oport|1412|0|2250|0|{4|log|}834|839|}
{2010006001|XXGobject_psameas_object|1413|0|2252|0|{metadata|log_metadata|1|0|}839|834|}
{2010211001|XXGvertex_iport_iport|1414|0|2253|0|{0|in|}834|840|}
{2010006001|XXGobject_psameas_object|1415|0|2255|0|{metadata|in_metadata|1|0|}840|834|}
{2010601001|XXGgraph_vertex_vertex|1416|0|2256|0|{RFMT_Create_hash_on_NK|}821|841|}
{2010212001|XXGvertex_oport_oport|1417|0|2258|0|{0|out0|}841|842|}
{2010213001|XXGoport_dst_flow|1418|0|2260|0|{0|}842|826|}
{2010212001|XXGvertex_oport_oport|1419|0|2261|0|{1|reject0|}841|843|}
{2010212001|XXGvertex_oport_oport|1420|0|2263|0|{2|error0|}841|844|}
{2010212001|XXGvertex_oport_oport|1421|0|2265|0|{3|log|}841|845|}
{2010211001|XXGvertex_iport_iport|1422|0|2267|0|{0|in|}841|846|}
{2010007001|XXGobject_proto_object|1423|0|2269|0|{}841|847|}
{2010212001|XXGvertex_oport_oport|1424|0|2271|0|{0|out0|}847|848|}
{2010006001|XXGobject_psameas_object|1425|0|2273|0|{metadata|out0_metadata|1|0|}848|847|}
{2010006001|XXGobject_psameas_object|1426|0|2274|0|{transform0|transform0|1|0|}848|847|}
{2010212001|XXGvertex_oport_oport|1427|0|2275|0|{1|reject0|}847|849|}
{2010006001|XXGobject_psameas_object|1428|0|2277|0|{metadata|reject0_metadata|1|0|}849|847|}
{2010212001|XXGvertex_oport_oport|1429|0|2278|0|{2|error0|}847|850|}
{2010006001|XXGobject_psameas_object|1430|0|2280|0|{metadata|error0_metadata|1|0|}850|847|}
{2010212001|XXGvertex_oport_oport|1431|0|2281|0|{3|log|}847|851|}
{2010006001|XXGobject_psameas_object|1432|0|2283|0|{metadata|log_metadata|1|0|}851|847|}
{2010211001|XXGvertex_iport_iport|1433|0|2284|0|{0|in|}847|852|}
{2010006001|XXGobject_psameas_object|1434|0|2286|0|{metadata|in_metadata|1|0|}852|847|}
{2010601001|XXGgraph_vertex_vertex|1435|0|2287|0|{Sort_on_ICFF_KEY|}821|853|}
{2010212001|XXGvertex_oport_oport|1436|0|2289|0|{0|out|}853|854|}
{2010213001|XXGoport_dst_flow|1437|0|2291|0|{0|}854|824|}
{2010211001|XXGvertex_iport_iport|1438|0|2292|0|{0|in|}853|855|}
{2010214001|XXGiport_src_flow|1439|0|2294|0|{0|}855|826|}
{2010007001|XXGobject_proto_object|1440|0|2295|0|{}853|856|}
{2010212001|XXGvertex_oport_oport|1441|0|2297|0|{0|out|}856|857|}
{2010006001|XXGobject_psameas_object|1442|0|2299|0|{metadata|out_metadata|1|0|}857|856|}
{2010211001|XXGvertex_iport_iport|1443|0|2300|0|{0|in|}856|858|}
{2010006001|XXGobject_psameas_object|1444|0|2302|0|{metadata|in_metadata|1|0|}858|856|}
{2010601001|XXGgraph_vertex_vertex|1445|0|2303|0|{Sort_within_Groups_1|}821|859|}
{2010212001|XXGvertex_oport_oport|1446|0|2305|0|{0|out|}859|860|}
{2010213001|XXGoport_dst_flow|1447|0|2307|0|{0|}860|825|}
{2010211001|XXGvertex_iport_iport|1448|0|2308|0|{0|in|}859|861|}
{2010214001|XXGiport_src_flow|1449|0|2310|0|{0|}861|824|}
{2010007001|XXGobject_proto_object|1450|0|2311|0|{}859|862|}
{2010212001|XXGvertex_oport_oport|1451|0|2313|0|{0|out|}862|863|}
{2010006001|XXGobject_psameas_object|1452|0|2315|0|{metadata|out_metadata|1|0|}863|862|}
{2010211001|XXGvertex_iport_iport|1453|0|2316|0|{0|in|}862|864|}
{2010006001|XXGobject_psameas_object|1454|0|2318|0|{metadata|in_metadata|1|0|}864|862|}
{2010212001|XXGvertex_oport_oport|1455|0|2319|0|{0|out0|}821|865|}
{2010216002|XXGoport_binding_oport|1456|0|2321|0|{.5|.5|{0|}15147|}865|828|}
{2010213001|XXGoport_dst_flow|1457|0|2322|0|{0|}865|800|}
{2010211001|XXGvertex_iport_iport|1458|0|2323|0|{0|in0|}821|866|}
{2010215002|XXGiport_binding_iport|1459|0|2325|0|{.5|.5|{0|}15146|}866|846|}
{2010214001|XXGiport_src_flow|1460|0|2326|0|{0|}866|798|}
{2010601001|XXGgraph_vertex_vertex|1461|0|2327|0|{De_Dup_1|}790|867|}
{2010605001|XXGgraph_legend_legend|1462|0|2329|0|{0|}867|868|}
{2010241001|XXGlegend_face_face|1463|0|2331|0|{}868|869|}
{2010604001|XXGgraph_flow_flow|1464|0|2333|0|{Flow_2|}867|870|}
{2010604001|XXGgraph_flow_flow|1465|0|2335|0|{Flow_3|}867|871|}
{2010604001|XXGgraph_flow_flow|1466|0|2337|0|{Flow_4|}867|872|}
{2010601001|XXGgraph_vertex_vertex|1467|0|2339|0|{Dedup_Sorted|}867|873|}
{2010212001|XXGvertex_oport_oport|1468|0|2341|0|{0|out|}873|874|}
{2010212001|XXGvertex_oport_oport|1469|0|2343|0|{1|dup|}873|875|}
{2010212001|XXGvertex_oport_oport|1470|0|2345|0|{2|reject|}873|876|}
{2010212001|XXGvertex_oport_oport|1471|0|2347|0|{3|error|}873|877|}
{2010212001|XXGvertex_oport_oport|1472|0|2349|0|{4|log|}873|878|}
{2010211001|XXGvertex_iport_iport|1473|0|2351|0|{0|in|}873|879|}
{2010214001|XXGiport_src_flow|1474|0|2353|0|{0|}879|871|}
{2010007001|XXGobject_proto_object|1475|0|2354|0|{}873|880|}
{2010212001|XXGvertex_oport_oport|1476|0|2356|0|{0|out|}880|881|}
{2010006001|XXGobject_psameas_object|1477|0|2358|0|{metadata|out_metadata|1|0|}881|880|}
{2010212001|XXGvertex_oport_oport|1478|0|2359|0|{1|dup|}880|882|}
{2010006001|XXGobject_psameas_object|1479|0|2361|0|{metadata|dup_metadata|1|0|}882|880|}
{2010212001|XXGvertex_oport_oport|1480|0|2362|0|{2|reject|}880|883|}
{2010006001|XXGobject_psameas_object|1481|0|2364|0|{metadata|reject_metadata|1|0|}883|880|}
{2010212001|XXGvertex_oport_oport|1482|0|2365|0|{3|error|}880|884|}
{2010006001|XXGobject_psameas_object|1483|0|2367|0|{metadata|error_metadata|1|0|}884|880|}
{2010212001|XXGvertex_oport_oport|1484|0|2368|0|{4|log|}880|885|}
{2010006001|XXGobject_psameas_object|1485|0|2370|0|{metadata|log_metadata|1|0|}885|880|}
{2010211001|XXGvertex_iport_iport|1486|0|2371|0|{0|in|}880|886|}
{2010006001|XXGobject_psameas_object|1487|0|2373|0|{metadata|in_metadata|1|0|}886|880|}
{2010601001|XXGgraph_vertex_vertex|1488|0|2374|0|{RFMT_Create_hash_on_NK|}867|887|}
{2010212001|XXGvertex_oport_oport|1489|0|2376|0|{0|out0|}887|888|}
{2010213001|XXGoport_dst_flow|1490|0|2378|0|{0|}888|872|}
{2010212001|XXGvertex_oport_oport|1491|0|2379|0|{1|reject0|}887|889|}
{2010212001|XXGvertex_oport_oport|1492|0|2381|0|{2|error0|}887|890|}
{2010212001|XXGvertex_oport_oport|1493|0|2383|0|{3|log|}887|891|}
{2010211001|XXGvertex_iport_iport|1494|0|2385|0|{0|in|}887|892|}
{2010007001|XXGobject_proto_object|1495|0|2387|0|{}887|893|}
{2010212001|XXGvertex_oport_oport|1496|0|2389|0|{0|out0|}893|894|}
{2010006001|XXGobject_psameas_object|1497|0|2391|0|{metadata|out0_metadata|1|0|}894|893|}
{2010006001|XXGobject_psameas_object|1498|0|2392|0|{transform0|transform0|1|0|}894|893|}
{2010212001|XXGvertex_oport_oport|1499|0|2393|0|{1|reject0|}893|895|}
{2010006001|XXGobject_psameas_object|1500|0|2395|0|{metadata|reject0_metadata|1|0|}895|893|}
{2010212001|XXGvertex_oport_oport|1501|0|2396|0|{2|error0|}893|896|}
{2010006001|XXGobject_psameas_object|1502|0|2398|0|{metadata|error0_metadata|1|0|}896|893|}
{2010212001|XXGvertex_oport_oport|1503|0|2399|0|{3|log|}893|897|}
{2010006001|XXGobject_psameas_object|1504|0|2401|0|{metadata|log_metadata|1|0|}897|893|}
{2010211001|XXGvertex_iport_iport|1505|0|2402|0|{0|in|}893|898|}
{2010006001|XXGobject_psameas_object|1506|0|2404|0|{metadata|in_metadata|1|0|}898|893|}
{2010601001|XXGgraph_vertex_vertex|1507|0|2405|0|{Sort_on_ICFF_KEY|}867|899|}
{2010212001|XXGvertex_oport_oport|1508|0|2407|0|{0|out|}899|900|}
{2010213001|XXGoport_dst_flow|1509|0|2409|0|{0|}900|870|}
{2010211001|XXGvertex_iport_iport|1510|0|2410|0|{0|in|}899|901|}
{2010214001|XXGiport_src_flow|1511|0|2412|0|{0|}901|872|}
{2010007001|XXGobject_proto_object|1512|0|2413|0|{}899|902|}
{2010212001|XXGvertex_oport_oport|1513|0|2415|0|{0|out|}902|903|}
{2010006001|XXGobject_psameas_object|1514|0|2417|0|{metadata|out_metadata|1|0|}903|902|}
{2010211001|XXGvertex_iport_iport|1515|0|2418|0|{0|in|}902|904|}
{2010006001|XXGobject_psameas_object|1516|0|2420|0|{metadata|in_metadata|1|0|}904|902|}
{2010601001|XXGgraph_vertex_vertex|1517|0|2421|0|{Sort_within_Groups_1|}867|905|}
{2010212001|XXGvertex_oport_oport|1518|0|2423|0|{0|out|}905|906|}
{2010213001|XXGoport_dst_flow|1519|0|2425|0|{0|}906|871|}
{2010211001|XXGvertex_iport_iport|1520|0|2426|0|{0|in|}905|907|}
{2010214001|XXGiport_src_flow|1521|0|2428|0|{0|}907|870|}
{2010007001|XXGobject_proto_object|1522|0|2429|0|{}905|908|}
{2010212001|XXGvertex_oport_oport|1523|0|2431|0|{0|out|}908|909|}
{2010006001|XXGobject_psameas_object|1524|0|2433|0|{metadata|out_metadata|1|0|}909|908|}
{2010211001|XXGvertex_iport_iport|1525|0|2434|0|{0|in|}908|910|}
{2010006001|XXGobject_psameas_object|1526|0|2436|0|{metadata|in_metadata|1|0|}910|908|}
{2010212001|XXGvertex_oport_oport|1527|0|2437|0|{0|out0|}867|911|}
{2010216002|XXGoport_binding_oport|1528|0|2439|0|{.5|.5|{0|}15140|}911|874|}
{2010213001|XXGoport_dst_flow|1529|0|2440|0|{0|}911|801|}
{2010211001|XXGvertex_iport_iport|1530|0|2441|0|{0|in0|}867|912|}
{2010215002|XXGiport_binding_iport|1531|0|2443|0|{.5|.5|{0|}15139|}912|892|}
{2010214001|XXGiport_src_flow|1532|0|2444|0|{0|}912|799|}
{2010601001|XXGgraph_vertex_vertex|1533|0|2445|0|{Discard_Suppressed_Data|}790|913|}
{2010211001|XXGvertex_iport_iport|1534|0|2447|0|{0|in|}913|914|}
{2010214001|XXGiport_src_flow|1535|0|2449|0|{0|}914|794|}
{2010007001|XXGobject_proto_object|1536|0|2450|0|{}913|915|}
{2010211001|XXGvertex_iport_iport|1537|0|2452|0|{0|in|}915|916|}
{2010006001|XXGobject_psameas_object|1538|0|2454|0|{metadata|in_metadata|1|0|}916|915|}
{2010601001|XXGgraph_vertex_vertex|1539|0|2455|0|{Discard_Suppressed_Data_1|}790|917|}
{2010211001|XXGvertex_iport_iport|1540|0|2457|0|{0|in|}917|918|}
{2010214001|XXGiport_src_flow|1541|0|2459|0|{0|}918|796|}
{2010007001|XXGobject_proto_object|1542|0|2460|0|{}917|919|}
{2010211001|XXGvertex_iport_iport|1543|0|2462|0|{0|in|}919|920|}
{2010006001|XXGobject_psameas_object|1544|0|2464|0|{metadata|in_metadata|1|0|}920|919|}
{2010601001|XXGgraph_vertex_vertex|1545|0|2465|0|{Existing_IDS_ICFF|}790|921|}
{2010212001|XXGvertex_oport_oport|1546|0|2467|0|{0|read|}921|922|}
{2010213001|XXGoport_dst_flow|1547|0|2469|0|{0|}922|793|}
{2010007001|XXGobject_proto_object|1548|0|2470|0|{}921|923|}
{2010212001|XXGvertex_oport_oport|1549|0|2472|0|{0|read|}923|924|}
{2010006001|XXGobject_psameas_object|1550|0|2474|0|{metadata|read_metadata|1|0|}924|923|}
{2010601001|XXGgraph_vertex_vertex|1551|0|2475|0|{Filter_by_Expression_1|}790|925|}
{2010212001|XXGvertex_oport_oport|1552|0|2477|0|{0|out|}925|926|}
{2010213001|XXGoport_dst_flow|1553|0|2479|0|{0|}926|799|}
{2010212001|XXGvertex_oport_oport|1554|0|2480|0|{1|deselect|}925|927|}
{2010212001|XXGvertex_oport_oport|1555|0|2482|0|{2|reject|}925|928|}
{2010212001|XXGvertex_oport_oport|1556|0|2484|0|{3|error|}925|929|}
{2010212001|XXGvertex_oport_oport|1557|0|2486|0|{4|log|}925|930|}
{2010211001|XXGvertex_iport_iport|1558|0|2488|0|{0|in|}925|931|}
{2010214001|XXGiport_src_flow|1559|0|2490|0|{0|}931|804|}
{2010007001|XXGobject_proto_object|1560|0|2491|0|{}925|932|}
{2010212001|XXGvertex_oport_oport|1561|0|2493|0|{0|out|}932|933|}
{2010006001|XXGobject_psameas_object|1562|0|2495|0|{metadata|out_metadata|1|0|}933|932|}
{2010212001|XXGvertex_oport_oport|1563|0|2496|0|{1|deselect|}932|934|}
{2010006001|XXGobject_psameas_object|1564|0|2498|0|{metadata|deselect_metadata|1|0|}934|932|}
{2010212001|XXGvertex_oport_oport|1565|0|2499|0|{2|reject|}932|935|}
{2010006001|XXGobject_psameas_object|1566|0|2501|0|{metadata|reject_metadata|1|0|}935|932|}
{2010212001|XXGvertex_oport_oport|1567|0|2502|0|{3|error|}932|936|}
{2010006001|XXGobject_psameas_object|1568|0|2504|0|{metadata|error_metadata|1|0|}936|932|}
{2010212001|XXGvertex_oport_oport|1569|0|2505|0|{4|log|}932|937|}
{2010006001|XXGobject_psameas_object|1570|0|2507|0|{metadata|log_metadata|1|0|}937|932|}
{2010211001|XXGvertex_iport_iport|1571|0|2508|0|{0|in|}932|938|}
{2010006001|XXGobject_psameas_object|1572|0|2510|0|{metadata|in_metadata|1|0|}938|932|}
{2010006001|XXGobject_psameas_object|1573|0|2511|0|{deselect_metadata|in_metadata|0|0|}925|925|}
{2010006001|XXGobject_psameas_object|1574|0|2512|0|{reject_metadata|in_metadata|0|0|}925|925|}
{2010601001|XXGgraph_vertex_vertex|1575|0|2513|0|{Filter_by_Expression_2|}790|939|}
{2010212001|XXGvertex_oport_oport|1576|0|2515|0|{0|out|}939|940|}
{2010213001|XXGoport_dst_flow|1577|0|2517|0|{0|}940|798|}
{2010212001|XXGvertex_oport_oport|1578|0|2518|0|{1|deselect|}939|941|}
{2010212001|XXGvertex_oport_oport|1579|0|2520|0|{2|reject|}939|942|}
{2010212001|XXGvertex_oport_oport|1580|0|2522|0|{3|error|}939|943|}
{2010212001|XXGvertex_oport_oport|1581|0|2524|0|{4|log|}939|944|}
{2010211001|XXGvertex_iport_iport|1582|0|2526|0|{0|in|}939|945|}
{2010214001|XXGiport_src_flow|1583|0|2528|0|{0|}945|802|}
{2010007001|XXGobject_proto_object|1584|0|2529|0|{}939|946|}
{2010212001|XXGvertex_oport_oport|1585|0|2531|0|{0|out|}946|947|}
{2010006001|XXGobject_psameas_object|1586|0|2533|0|{metadata|out_metadata|1|0|}947|946|}
{2010212001|XXGvertex_oport_oport|1587|0|2534|0|{1|deselect|}946|948|}
{2010006001|XXGobject_psameas_object|1588|0|2536|0|{metadata|deselect_metadata|1|0|}948|946|}
{2010212001|XXGvertex_oport_oport|1589|0|2537|0|{2|reject|}946|949|}
{2010006001|XXGobject_psameas_object|1590|0|2539|0|{metadata|reject_metadata|1|0|}949|946|}
{2010212001|XXGvertex_oport_oport|1591|0|2540|0|{3|error|}946|950|}
{2010006001|XXGobject_psameas_object|1592|0|2542|0|{metadata|error_metadata|1|0|}950|946|}
{2010212001|XXGvertex_oport_oport|1593|0|2543|0|{4|log|}946|951|}
{2010006001|XXGobject_psameas_object|1594|0|2545|0|{metadata|log_metadata|1|0|}951|946|}
{2010211001|XXGvertex_iport_iport|1595|0|2546|0|{0|in|}946|952|}
{2010006001|XXGobject_psameas_object|1596|0|2548|0|{metadata|in_metadata|1|0|}952|946|}
{2010006001|XXGobject_psameas_object|1597|0|2549|0|{reject_metadata|in_metadata|0|0|}939|939|}
{2010601001|XXGgraph_vertex_vertex|1598|0|2550|0|{Input_File_Archive|}790|953|}
{2010212001|XXGvertex_oport_oport|1599|0|2552|0|{0|read|}953|954|}
{2010213001|XXGoport_dst_flow|1600|0|2554|0|{0|}954|803|}
{2010007001|XXGobject_proto_object|1601|0|2555|0|{}953|955|}
{2010212001|XXGvertex_oport_oport|1602|0|2557|0|{0|read|}955|956|}
{2010006001|XXGobject_psameas_object|1603|0|2559|0|{metadata|read_metadata|1|0|}956|955|}
{2010601001|XXGgraph_vertex_vertex|1604|0|2560|0|{Merge|}790|957|}
{2010212001|XXGvertex_oport_oport|1605|0|2562|0|{0|out|}957|958|}
{2010211001|XXGvertex_iport_iport|1606|0|2564|0|{0|in|}957|959|}
{2010214001|XXGiport_src_flow|1607|0|2566|0|{0|}959|800|}
{2010214001|XXGiport_src_flow|1608|0|2567|0|{1|}959|801|}
{2010007001|XXGobject_proto_object|1609|0|2568|0|{}957|960|}
{2010212001|XXGvertex_oport_oport|1610|0|2570|0|{0|out|}960|961|}
{2010006001|XXGobject_psameas_object|1611|0|2572|0|{metadata|out_metadata|1|0|}961|960|}
{2010211001|XXGvertex_iport_iport|1612|0|2573|0|{0|in|}960|962|}
{2010006001|XXGobject_psameas_object|1613|0|2575|0|{metadata|in_metadata|1|0|}962|960|}
{2010212001|XXGvertex_oport_oport|1614|0|2576|0|{0|out0|}790|963|}
{2010216002|XXGoport_binding_oport|1615|0|2578|0|{.5|.5|{0|}15740|}963|958|}
{2010601001|XXGgraph_vertex_vertex|1616|0|2579|0|{Read_Columnar_3|}1|964|}
{2010605001|XXGgraph_legend_legend|1617|0|2581|0|{0|}964|965|}
{2010241001|XXGlegend_face_face|1618|0|2583|0|{}965|966|}
{2010604001|XXGgraph_flow_flow|1619|0|2585|0|{Flow_1|}964|967|}
{2010604001|XXGgraph_flow_flow|1620|0|2587|0|{Flow_15|}964|968|}
{2010244001|XXGflow_watcher_watcher|1621|0|2589|0|{}968|969|}
{2010604001|XXGgraph_flow_flow|1622|0|2591|0|{Flow_16|}964|970|}
{2010244001|XXGflow_watcher_watcher|1623|0|2593|0|{}970|971|}
{2010604001|XXGgraph_flow_flow|1624|0|2595|0|{Flow_2|}964|972|}
{2010604001|XXGgraph_flow_flow|1625|0|2597|0|{Flow_3|}964|120|}
{2010604001|XXGgraph_flow_flow|1626|0|2598|0|{Flow_4|}964|973|}
{2010604001|XXGgraph_flow_flow|1627|0|2600|0|{Flow_5|}964|974|}
{2010604001|XXGgraph_flow_flow|1628|0|2602|0|{Flow_6|}964|975|}
{2010604001|XXGgraph_flow_flow|1629|0|2604|0|{Flow_7|}964|976|}
{2010604001|XXGgraph_flow_flow|1630|0|2606|0|{Flow_8|}964|126|}
{2010601001|XXGgraph_vertex_vertex|1631|0|2607|0|{Data_Suppression_Outbound|}964|977|}
{2010212001|XXGvertex_oport_oport|1632|0|2609|0|{0|out0|}977|978|}
{2010213001|XXGoport_dst_flow|1633|0|2611|0|{0|}978|975|}
{2010212001|XXGvertex_oport_oport|1634|0|2612|0|{1|deselect|}977|979|}
{2010213001|XXGoport_dst_flow|1635|0|2614|0|{0|}979|968|}
{2010211001|XXGvertex_iport_iport|1636|0|2615|0|{0|in0|}977|980|}
{2010214001|XXGiport_src_flow|1637|0|2617|0|{0|}980|967|}
{2010006001|XXGobject_psameas_object|1638|0|2618|0|{Layout|Layout|0|0|}977|53|}
{2010006001|XXGobject_psameas_object|1639|0|2619|0|{deselect_metadata|read_metadata|0|0|}977|981|}
{2010212001|XXGvertex_oport_oport|1640|0|2621|0|{0|read|}981|982|}
{2010213001|XXGoport_dst_flow|1641|0|2623|0|{0|}982|967|}
{2010006001|XXGobject_psameas_object|1642|0|2624|0|{in0_metadata|read_metadata|0|0|}977|981|}
{2010006001|XXGobject_psameas_object|1643|0|2625|0|{out0_metadata|read_metadata|0|0|}977|981|}
{2010601001|XXGgraph_vertex_vertex|1644|0|2626|0|{Data_Suppression_Outbound_1|}964|983|}
{2010212001|XXGvertex_oport_oport|1645|0|2628|0|{0|out0|}983|984|}
{2010213001|XXGoport_dst_flow|1646|0|2630|0|{0|}984|126|}
{2010212001|XXGvertex_oport_oport|1647|0|2631|0|{1|deselect|}983|985|}
{2010213001|XXGoport_dst_flow|1648|0|2633|0|{0|}985|970|}
{2010211001|XXGvertex_iport_iport|1649|0|2634|0|{0|in0|}983|986|}
{2010214001|XXGiport_src_flow|1650|0|2636|0|{0|}986|976|}
{2010006001|XXGobject_psameas_object|1651|0|2637|0|{Layout|Layout|0|0|}983|53|}
{2010006001|XXGobject_psameas_object|1652|0|2638|0|{deselect_metadata|read_metadata|0|0|}983|987|}
{2010212001|XXGvertex_oport_oport|1653|0|2640|0|{0|read|}987|988|}
{2010213001|XXGoport_dst_flow|1654|0|2642|0|{0|}988|976|}
{2010006001|XXGobject_psameas_object|1655|0|2643|0|{in0_metadata|read_metadata|0|0|}983|987|}
{2010006001|XXGobject_psameas_object|1656|0|2644|0|{out0_metadata|read_metadata|0|0|}983|987|}
{2010601001|XXGgraph_vertex_vertex|1657|0|2645|0|{De_Dup|}964|989|}
{2010605001|XXGgraph_legend_legend|1658|0|2647|0|{0|}989|990|}
{2010241001|XXGlegend_face_face|1659|0|2649|0|{}990|991|}
{2010604001|XXGgraph_flow_flow|1660|0|2651|0|{Flow_2|}989|992|}
{2010604001|XXGgraph_flow_flow|1661|0|2653|0|{Flow_3|}989|993|}
{2010604001|XXGgraph_flow_flow|1662|0|2655|0|{Flow_4|}989|994|}
{2010601001|XXGgraph_vertex_vertex|1663|0|2657|0|{Dedup_Sorted|}989|995|}
{2010212001|XXGvertex_oport_oport|1664|0|2659|0|{0|out|}995|996|}
{2010212001|XXGvertex_oport_oport|1665|0|2661|0|{1|dup|}995|997|}
{2010212001|XXGvertex_oport_oport|1666|0|2663|0|{2|reject|}995|998|}
{2010212001|XXGvertex_oport_oport|1667|0|2665|0|{3|error|}995|999|}
{2010212001|XXGvertex_oport_oport|1668|0|2667|0|{4|log|}995|1000|}
{2010211001|XXGvertex_iport_iport|1669|0|2669|0|{0|in|}995|1001|}
{2010214001|XXGiport_src_flow|1670|0|2671|0|{0|}1001|993|}
{2010006001|XXGobject_psameas_object|1671|0|2672|0|{Layout|Layout|0|0|}995|53|}
{2010006001|XXGobject_psameas_object|1672|0|2673|0|{dup_metadata|out0_metadata|0|0|}995|1002|}
{2010212001|XXGvertex_oport_oport|1673|0|2675|0|{0|out0|}1002|1003|}
{2010213001|XXGoport_dst_flow|1674|0|2677|0|{0|}1003|994|}
{2010212001|XXGvertex_oport_oport|1675|0|2678|0|{1|reject0|}1002|1004|}
{2010212001|XXGvertex_oport_oport|1676|0|2680|0|{2|error0|}1002|1005|}
{2010212001|XXGvertex_oport_oport|1677|0|2682|0|{3|log|}1002|1006|}
{2010211001|XXGvertex_iport_iport|1678|0|2684|0|{0|in|}1002|1007|}
{2010006001|XXGobject_psameas_object|1679|0|2686|0|{Layout|Layout|0|0|}1002|53|}
{2010006001|XXGobject_psameas_object|1680|0|2687|0|{in_metadata|out_metadata|0|0|}1002|1008|}
{2010212001|XXGvertex_oport_oport|1681|0|2689|0|{0|out|}1008|1009|}
{2010213001|XXGoport_dst_flow|1682|0|2691|0|{0|}1009|972|}
{2010212001|XXGvertex_oport_oport|1683|0|2692|0|{1|deselect|}1008|1010|}
{2010212001|XXGvertex_oport_oport|1684|0|2694|0|{2|reject|}1008|1011|}
{2010212001|XXGvertex_oport_oport|1685|0|2696|0|{3|error|}1008|1012|}
{2010212001|XXGvertex_oport_oport|1686|0|2698|0|{4|log|}1008|1013|}
{2010211001|XXGvertex_iport_iport|1687|0|2700|0|{0|in|}1008|1014|}
{2010214001|XXGiport_src_flow|1688|0|2702|0|{0|}1014|975|}
{2010006001|XXGobject_psameas_object|1689|0|2703|0|{Layout|Layout|0|0|}1008|53|}
{2010006001|XXGobject_psameas_object|1690|0|2704|0|{deselect_metadata|in_metadata|0|0|}1008|1008|}
{2010006001|XXGobject_psameas_object|1691|0|2705|0|{reject0_metadata|out_metadata|0|0|}1002|1008|}
{2010006001|XXGobject_psameas_object|1692|0|2706|0|{in_metadata|out0_metadata|0|0|}995|1002|}
{2010006001|XXGobject_psameas_object|1693|0|2707|0|{out_metadata|out0_metadata|0|0|}995|1002|}
{2010006001|XXGobject_psameas_object|1694|0|2708|0|{reject_metadata|out0_metadata|0|0|}995|1002|}
{2010601001|XXGgraph_vertex_vertex|1695|0|2709|0|{RFMT_Create_hash_on_NK|}989|1002|}
{2010601001|XXGgraph_vertex_vertex|1696|0|2710|0|{Sort_on_ICFF_KEY|}989|1015|}
{2010212001|XXGvertex_oport_oport|1697|0|2712|0|{0|out|}1015|1016|}
{2010213001|XXGoport_dst_flow|1698|0|2714|0|{0|}1016|992|}
{2010211001|XXGvertex_iport_iport|1699|0|2715|0|{0|in|}1015|1017|}
{2010214001|XXGiport_src_flow|1700|0|2717|0|{0|}1017|994|}
{2010006001|XXGobject_psameas_object|1701|0|2718|0|{Layout|Layout|0|0|}1015|53|}
{2010006001|XXGobject_psameas_object|1702|0|2719|0|{in_metadata|out0_metadata|0|0|}1015|1002|}
{2010006001|XXGobject_psameas_object|1703|0|2720|0|{out_metadata|out0_metadata|0|0|}1015|1002|}
{2010601001|XXGgraph_vertex_vertex|1704|0|2721|0|{Sort_within_Groups_1|}989|1018|}
{2010212001|XXGvertex_oport_oport|1705|0|2723|0|{0|out|}1018|1019|}
{2010213001|XXGoport_dst_flow|1706|0|2725|0|{0|}1019|993|}
{2010211001|XXGvertex_iport_iport|1707|0|2726|0|{0|in|}1018|1020|}
{2010214001|XXGiport_src_flow|1708|0|2728|0|{0|}1020|992|}
{2010006001|XXGobject_psameas_object|1709|0|2729|0|{Layout|Layout|0|0|}1018|53|}
{2010006001|XXGobject_psameas_object|1710|0|2730|0|{in_metadata|out0_metadata|0|0|}1018|1002|}
{2010006001|XXGobject_psameas_object|1711|0|2731|0|{out_metadata|out0_metadata|0|0|}1018|1002|}
{2010212001|XXGvertex_oport_oport|1712|0|2732|0|{0|out0|}989|1021|}
{2010216002|XXGoport_binding_oport|1713|0|2734|0|{.5|.5|{0|}15147|}1021|996|}
{2010213001|XXGoport_dst_flow|1714|0|2735|0|{0|}1021|973|}
{2010211001|XXGvertex_iport_iport|1715|0|2736|0|{0|in0|}989|1022|}
{2010215002|XXGiport_binding_iport|1716|0|2738|0|{.5|.5|{0|}15146|}1022|1007|}
{2010214001|XXGiport_src_flow|1717|0|2739|0|{0|}1022|972|}
{2010601001|XXGgraph_vertex_vertex|1718|0|2740|0|{De_Dup_1|}964|1023|}
{2010605001|XXGgraph_legend_legend|1719|0|2742|0|{0|}1023|1024|}
{2010241001|XXGlegend_face_face|1720|0|2744|0|{}1024|1025|}
{2010604001|XXGgraph_flow_flow|1721|0|2746|0|{Flow_2|}1023|1026|}
{2010604001|XXGgraph_flow_flow|1722|0|2748|0|{Flow_3|}1023|1027|}
{2010604001|XXGgraph_flow_flow|1723|0|2750|0|{Flow_4|}1023|113|}
{2010601001|XXGgraph_vertex_vertex|1724|0|2751|0|{Dedup_Sorted|}1023|1028|}
{2010212001|XXGvertex_oport_oport|1725|0|2753|0|{0|out|}1028|1029|}
{2010212001|XXGvertex_oport_oport|1726|0|2755|0|{1|dup|}1028|1030|}
{2010212001|XXGvertex_oport_oport|1727|0|2757|0|{2|reject|}1028|1031|}
{2010212001|XXGvertex_oport_oport|1728|0|2759|0|{3|error|}1028|1032|}
{2010212001|XXGvertex_oport_oport|1729|0|2761|0|{4|log|}1028|1033|}
{2010211001|XXGvertex_iport_iport|1730|0|2763|0|{0|in|}1028|1034|}
{2010214001|XXGiport_src_flow|1731|0|2765|0|{0|}1034|1027|}
{2010006001|XXGobject_psameas_object|1732|0|2766|0|{Layout|Layout|0|0|}1028|53|}
{2010006001|XXGobject_psameas_object|1733|0|2767|0|{dup_metadata|out0_metadata|0|0|}1028|111|}
{2010006001|XXGobject_psameas_object|1734|0|2768|0|{in_metadata|out0_metadata|0|0|}1028|111|}
{2010006001|XXGobject_psameas_object|1735|0|2769|0|{out_metadata|out0_metadata|0|0|}1028|111|}
{2010006001|XXGobject_psameas_object|1736|0|2770|0|{reject_metadata|out0_metadata|0|0|}1028|111|}
{2010601001|XXGgraph_vertex_vertex|1737|0|2771|0|{RFMT_Create_hash_on_NK|}1023|111|}
{2010601001|XXGgraph_vertex_vertex|1738|0|2772|0|{Sort_on_ICFF_KEY|}1023|1035|}
{2010212001|XXGvertex_oport_oport|1739|0|2774|0|{0|out|}1035|1036|}
{2010213001|XXGoport_dst_flow|1740|0|2776|0|{0|}1036|1026|}
{2010211001|XXGvertex_iport_iport|1741|0|2777|0|{0|in|}1035|1037|}
{2010214001|XXGiport_src_flow|1742|0|2779|0|{0|}1037|113|}
{2010006001|XXGobject_psameas_object|1743|0|2780|0|{Layout|Layout|0|0|}1035|53|}
{2010006001|XXGobject_psameas_object|1744|0|2781|0|{in_metadata|out0_metadata|0|0|}1035|111|}
{2010006001|XXGobject_psameas_object|1745|0|2782|0|{out_metadata|out0_metadata|0|0|}1035|111|}
{2010601001|XXGgraph_vertex_vertex|1746|0|2783|0|{Sort_within_Groups_1|}1023|1038|}
{2010212001|XXGvertex_oport_oport|1747|0|2785|0|{0|out|}1038|1039|}
{2010213001|XXGoport_dst_flow|1748|0|2787|0|{0|}1039|1027|}
{2010211001|XXGvertex_iport_iport|1749|0|2788|0|{0|in|}1038|1040|}
{2010214001|XXGiport_src_flow|1750|0|2790|0|{0|}1040|1026|}
{2010006001|XXGobject_psameas_object|1751|0|2791|0|{Layout|Layout|0|0|}1038|53|}
{2010006001|XXGobject_psameas_object|1752|0|2792|0|{in_metadata|out0_metadata|0|0|}1038|111|}
{2010006001|XXGobject_psameas_object|1753|0|2793|0|{out_metadata|out0_metadata|0|0|}1038|111|}
{2010212001|XXGvertex_oport_oport|1754|0|2794|0|{0|out0|}1023|1041|}
{2010216002|XXGoport_binding_oport|1755|0|2796|0|{.5|.5|{0|}15140|}1041|1029|}
{2010213001|XXGoport_dst_flow|1756|0|2797|0|{0|}1041|974|}
{2010211001|XXGvertex_iport_iport|1757|0|2798|0|{0|in0|}1023|1042|}
{2010215002|XXGiport_binding_iport|1758|0|2800|0|{.5|.5|{0|}15139|}1042|117|}
{2010214001|XXGiport_src_flow|1759|0|2801|0|{0|}1042|120|}
{2010601001|XXGgraph_vertex_vertex|1760|0|2802|0|{Discard_Suppressed_Data|}964|1043|}
{2010211001|XXGvertex_iport_iport|1761|0|2804|0|{0|in|}1043|1044|}
{2010214001|XXGiport_src_flow|1762|0|2806|0|{0|}1044|968|}
{2010006001|XXGobject_psameas_object|1763|0|2807|0|{Layout|Layout|0|0|}1043|977|}
{2010006001|XXGobject_psameas_object|1764|0|2808|0|{in_metadata|read_metadata|0|0|}1043|981|}
{2010601001|XXGgraph_vertex_vertex|1765|0|2809|0|{Discard_Suppressed_Data_1|}964|1045|}
{2010211001|XXGvertex_iport_iport|1766|0|2811|0|{0|in|}1045|1046|}
{2010214001|XXGiport_src_flow|1767|0|2813|0|{0|}1046|970|}
{2010006001|XXGobject_psameas_object|1768|0|2814|0|{Layout|Layout|0|0|}1045|983|}
{2010006001|XXGobject_psameas_object|1769|0|2815|0|{in_metadata|read_metadata|0|0|}1045|987|}
{2010601001|XXGgraph_vertex_vertex|1770|0|2816|0|{Existing_IDS_ICFF|}964|981|}
{2010601001|XXGgraph_vertex_vertex|1771|0|2817|0|{Filter_by_Expression_1|}964|118|}
{2010601001|XXGgraph_vertex_vertex|1772|0|2818|0|{Filter_by_Expression_2|}964|1008|}
{2010601001|XXGgraph_vertex_vertex|1773|0|2819|0|{Input_File_Archive|}964|987|}
{2010601001|XXGgraph_vertex_vertex|1774|0|2820|0|{Merge|}964|1047|}
{2010212001|XXGvertex_oport_oport|1775|0|2822|0|{0|out|}1047|1048|}
{2010211001|XXGvertex_iport_iport|1776|0|2824|0|{0|in|}1047|1049|}
{2010214001|XXGiport_src_flow|1777|0|2826|0|{0|}1049|973|}
{2010214001|XXGiport_src_flow|1778|0|2827|0|{1|}1049|974|}
{2010006001|XXGobject_psameas_object|1779|0|2828|0|{Layout|Layout|0|0|}1047|53|}
{2010006001|XXGobject_psameas_object|1780|0|2829|0|{in_metadata|out0_metadata|0|0|}1047|111|}
{2010006001|XXGobject_psameas_object|1781|0|2830|0|{out_metadata|out0_metadata|0|0|}1047|111|}
{2010212001|XXGvertex_oport_oport|1782|0|2831|0|{0|out0|}964|1050|}
{2010216002|XXGoport_binding_oport|1783|0|2833|0|{.5|.5|{0|}15740|}1050|1048|}
{2010213001|XXGoport_dst_flow|1784|0|2834|0|{0|}1050|12|}
{2010007001|XXGobject_proto_object|1785|0|2835|0|{}964|1051|}
{2010605001|XXGgraph_legend_legend|1786|0|2837|0|{0|}1051|1052|}
{2010241001|XXGlegend_face_face|1787|0|2839|0|{}1052|1053|}
{2010604001|XXGgraph_flow_flow|1788|0|2841|0|{Flow_1|}1051|1054|}
{2010604001|XXGgraph_flow_flow|1789|0|2843|0|{Flow_15|}1051|1055|}
{2010244001|XXGflow_watcher_watcher|1790|0|2845|0|{}1055|1056|}
{2010604001|XXGgraph_flow_flow|1791|0|2847|0|{Flow_16|}1051|1057|}
{2010244001|XXGflow_watcher_watcher|1792|0|2849|0|{}1057|1058|}
{2010604001|XXGgraph_flow_flow|1793|0|2851|0|{Flow_2|}1051|1059|}
{2010604001|XXGgraph_flow_flow|1794|0|2853|0|{Flow_3|}1051|1060|}
{2010604001|XXGgraph_flow_flow|1795|0|2855|0|{Flow_4|}1051|1061|}
{2010604001|XXGgraph_flow_flow|1796|0|2857|0|{Flow_5|}1051|1062|}
{2010604001|XXGgraph_flow_flow|1797|0|2859|0|{Flow_6|}1051|1063|}
{2010604001|XXGgraph_flow_flow|1798|0|2861|0|{Flow_7|}1051|1064|}
{2010604001|XXGgraph_flow_flow|1799|0|2863|0|{Flow_8|}1051|1065|}
{2010601001|XXGgraph_vertex_vertex|1800|0|2865|0|{Data_Suppression_Outbound|}1051|1066|}
{2010401001|XXGvertex_prototype_vertex|1801|0|2867|0|{}1066|1067|}
{2010212001|XXGvertex_oport_oport|1802|0|2869|0|{0|out0|}1067|1068|}
{2010006001|XXGobject_psameas_object|1803|0|2871|0|{metadata|out0_metadata|1|0|}1068|1067|}
{2010212001|XXGvertex_oport_oport|1804|0|2872|0|{1|deselect|}1067|1069|}
{2010006001|XXGobject_psameas_object|1805|0|2874|0|{metadata|deselect_metadata|1|0|}1069|1067|}
{2010211001|XXGvertex_iport_iport|1806|0|2875|0|{0|in0|}1067|1070|}
{2010006001|XXGobject_psameas_object|1807|0|2877|0|{metadata|in0_metadata|1|0|}1070|1067|}
{2010212001|XXGvertex_oport_oport|1808|0|2878|0|{0|out0|}1066|1071|}
{2010213001|XXGoport_dst_flow|1809|0|2880|0|{0|}1071|1063|}
{2010212001|XXGvertex_oport_oport|1810|0|2881|0|{1|deselect|}1066|1072|}
{2010213001|XXGoport_dst_flow|1811|0|2883|0|{0|}1072|1055|}
{2010211001|XXGvertex_iport_iport|1812|0|2884|0|{0|in0|}1066|1073|}
{2010214001|XXGiport_src_flow|1813|0|2886|0|{0|}1073|1054|}
{2010601001|XXGgraph_vertex_vertex|1814|0|2887|0|{Data_Suppression_Outbound_1|}1051|1074|}
{2010401001|XXGvertex_prototype_vertex|1815|0|2889|0|{}1074|1075|}
{2010212001|XXGvertex_oport_oport|1816|0|2891|0|{0|out0|}1075|1076|}
{2010006001|XXGobject_psameas_object|1817|0|2893|0|{metadata|out0_metadata|1|0|}1076|1075|}
{2010212001|XXGvertex_oport_oport|1818|0|2894|0|{1|deselect|}1075|1077|}
{2010006001|XXGobject_psameas_object|1819|0|2896|0|{metadata|deselect_metadata|1|0|}1077|1075|}
{2010211001|XXGvertex_iport_iport|1820|0|2897|0|{0|in0|}1075|1078|}
{2010006001|XXGobject_psameas_object|1821|0|2899|0|{metadata|in0_metadata|1|0|}1078|1075|}
{2010212001|XXGvertex_oport_oport|1822|0|2900|0|{0|out0|}1074|1079|}
{2010213001|XXGoport_dst_flow|1823|0|2902|0|{0|}1079|1065|}
{2010212001|XXGvertex_oport_oport|1824|0|2903|0|{1|deselect|}1074|1080|}
{2010213001|XXGoport_dst_flow|1825|0|2905|0|{0|}1080|1057|}
{2010211001|XXGvertex_iport_iport|1826|0|2906|0|{0|in0|}1074|1081|}
{2010214001|XXGiport_src_flow|1827|0|2908|0|{0|}1081|1064|}
{2010601001|XXGgraph_vertex_vertex|1828|0|2909|0|{De_Dup|}1051|1082|}
{2010605001|XXGgraph_legend_legend|1829|0|2911|0|{0|}1082|1083|}
{2010241001|XXGlegend_face_face|1830|0|2913|0|{}1083|1084|}
{2010604001|XXGgraph_flow_flow|1831|0|2915|0|{Flow_2|}1082|1085|}
{2010604001|XXGgraph_flow_flow|1832|0|2917|0|{Flow_3|}1082|1086|}
{2010604001|XXGgraph_flow_flow|1833|0|2919|0|{Flow_4|}1082|1087|}
{2010601001|XXGgraph_vertex_vertex|1834|0|2921|0|{Dedup_Sorted|}1082|1088|}
{2010212001|XXGvertex_oport_oport|1835|0|2923|0|{0|out|}1088|1089|}
{2010212001|XXGvertex_oport_oport|1836|0|2925|0|{1|dup|}1088|1090|}
{2010212001|XXGvertex_oport_oport|1837|0|2927|0|{2|reject|}1088|1091|}
{2010212001|XXGvertex_oport_oport|1838|0|2929|0|{3|error|}1088|1092|}
{2010212001|XXGvertex_oport_oport|1839|0|2931|0|{4|log|}1088|1093|}
{2010211001|XXGvertex_iport_iport|1840|0|2933|0|{0|in|}1088|1094|}
{2010214001|XXGiport_src_flow|1841|0|2935|0|{0|}1094|1086|}
{2010007001|XXGobject_proto_object|1842|0|2936|0|{}1088|1095|}
{2010212001|XXGvertex_oport_oport|1843|0|2938|0|{0|out|}1095|1096|}
{2010006001|XXGobject_psameas_object|1844|0|2940|0|{metadata|out_metadata|1|0|}1096|1095|}
{2010212001|XXGvertex_oport_oport|1845|0|2941|0|{1|dup|}1095|1097|}
{2010006001|XXGobject_psameas_object|1846|0|2943|0|{metadata|dup_metadata|1|0|}1097|1095|}
{2010212001|XXGvertex_oport_oport|1847|0|2944|0|{2|reject|}1095|1098|}
{2010006001|XXGobject_psameas_object|1848|0|2946|0|{metadata|reject_metadata|1|0|}1098|1095|}
{2010212001|XXGvertex_oport_oport|1849|0|2947|0|{3|error|}1095|1099|}
{2010006001|XXGobject_psameas_object|1850|0|2949|0|{metadata|error_metadata|1|0|}1099|1095|}
{2010212001|XXGvertex_oport_oport|1851|0|2950|0|{4|log|}1095|1100|}
{2010006001|XXGobject_psameas_object|1852|0|2952|0|{metadata|log_metadata|1|0|}1100|1095|}
{2010211001|XXGvertex_iport_iport|1853|0|2953|0|{0|in|}1095|1101|}
{2010006001|XXGobject_psameas_object|1854|0|2955|0|{metadata|in_metadata|1|0|}1101|1095|}
{2010601001|XXGgraph_vertex_vertex|1855|0|2956|0|{RFMT_Create_hash_on_NK|}1082|1102|}
{2010212001|XXGvertex_oport_oport|1856|0|2958|0|{0|out0|}1102|1103|}
{2010213001|XXGoport_dst_flow|1857|0|2960|0|{0|}1103|1087|}
{2010212001|XXGvertex_oport_oport|1858|0|2961|0|{1|reject0|}1102|1104|}
{2010212001|XXGvertex_oport_oport|1859|0|2963|0|{2|error0|}1102|1105|}
{2010212001|XXGvertex_oport_oport|1860|0|2965|0|{3|log|}1102|1106|}
{2010211001|XXGvertex_iport_iport|1861|0|2967|0|{0|in|}1102|1107|}
{2010007001|XXGobject_proto_object|1862|0|2969|0|{}1102|1108|}
{2010212001|XXGvertex_oport_oport|1863|0|2971|0|{0|out0|}1108|1109|}
{2010006001|XXGobject_psameas_object|1864|0|2973|0|{metadata|out0_metadata|1|0|}1109|1108|}
{2010006001|XXGobject_psameas_object|1865|0|2974|0|{transform0|transform0|1|0|}1109|1108|}
{2010212001|XXGvertex_oport_oport|1866|0|2975|0|{1|reject0|}1108|1110|}
{2010006001|XXGobject_psameas_object|1867|0|2977|0|{metadata|reject0_metadata|1|0|}1110|1108|}
{2010212001|XXGvertex_oport_oport|1868|0|2978|0|{2|error0|}1108|1111|}
{2010006001|XXGobject_psameas_object|1869|0|2980|0|{metadata|error0_metadata|1|0|}1111|1108|}
{2010212001|XXGvertex_oport_oport|1870|0|2981|0|{3|log|}1108|1112|}
{2010006001|XXGobject_psameas_object|1871|0|2983|0|{metadata|log_metadata|1|0|}1112|1108|}
{2010211001|XXGvertex_iport_iport|1872|0|2984|0|{0|in|}1108|1113|}
{2010006001|XXGobject_psameas_object|1873|0|2986|0|{metadata|in_metadata|1|0|}1113|1108|}
{2010601001|XXGgraph_vertex_vertex|1874|0|2987|0|{Sort_on_ICFF_KEY|}1082|1114|}
{2010212001|XXGvertex_oport_oport|1875|0|2989|0|{0|out|}1114|1115|}
{2010213001|XXGoport_dst_flow|1876|0|2991|0|{0|}1115|1085|}
{2010211001|XXGvertex_iport_iport|1877|0|2992|0|{0|in|}1114|1116|}
{2010214001|XXGiport_src_flow|1878|0|2994|0|{0|}1116|1087|}
{2010007001|XXGobject_proto_object|1879|0|2995|0|{}1114|1117|}
{2010212001|XXGvertex_oport_oport|1880|0|2997|0|{0|out|}1117|1118|}
{2010006001|XXGobject_psameas_object|1881|0|2999|0|{metadata|out_metadata|1|0|}1118|1117|}
{2010211001|XXGvertex_iport_iport|1882|0|3000|0|{0|in|}1117|1119|}
{2010006001|XXGobject_psameas_object|1883|0|3002|0|{metadata|in_metadata|1|0|}1119|1117|}
{2010601001|XXGgraph_vertex_vertex|1884|0|3003|0|{Sort_within_Groups_1|}1082|1120|}
{2010212001|XXGvertex_oport_oport|1885|0|3005|0|{0|out|}1120|1121|}
{2010213001|XXGoport_dst_flow|1886|0|3007|0|{0|}1121|1086|}
{2010211001|XXGvertex_iport_iport|1887|0|3008|0|{0|in|}1120|1122|}
{2010214001|XXGiport_src_flow|1888|0|3010|0|{0|}1122|1085|}
{2010007001|XXGobject_proto_object|1889|0|3011|0|{}1120|1123|}
{2010212001|XXGvertex_oport_oport|1890|0|3013|0|{0|out|}1123|1124|}
{2010006001|XXGobject_psameas_object|1891|0|3015|0|{metadata|out_metadata|1|0|}1124|1123|}
{2010211001|XXGvertex_iport_iport|1892|0|3016|0|{0|in|}1123|1125|}
{2010006001|XXGobject_psameas_object|1893|0|3018|0|{metadata|in_metadata|1|0|}1125|1123|}
{2010212001|XXGvertex_oport_oport|1894|0|3019|0|{0|out0|}1082|1126|}
{2010216002|XXGoport_binding_oport|1895|0|3021|0|{.5|.5|{0|}15147|}1126|1089|}
{2010213001|XXGoport_dst_flow|1896|0|3022|0|{0|}1126|1061|}
{2010211001|XXGvertex_iport_iport|1897|0|3023|0|{0|in0|}1082|1127|}
{2010215002|XXGiport_binding_iport|1898|0|3025|0|{.5|.5|{0|}15146|}1127|1107|}
{2010214001|XXGiport_src_flow|1899|0|3026|0|{0|}1127|1059|}
{2010601001|XXGgraph_vertex_vertex|1900|0|3027|0|{De_Dup_1|}1051|1128|}
{2010605001|XXGgraph_legend_legend|1901|0|3029|0|{0|}1128|1129|}
{2010241001|XXGlegend_face_face|1902|0|3031|0|{}1129|1130|}
{2010604001|XXGgraph_flow_flow|1903|0|3033|0|{Flow_2|}1128|1131|}
{2010604001|XXGgraph_flow_flow|1904|0|3035|0|{Flow_3|}1128|1132|}
{2010604001|XXGgraph_flow_flow|1905|0|3037|0|{Flow_4|}1128|1133|}
{2010601001|XXGgraph_vertex_vertex|1906|0|3039|0|{Dedup_Sorted|}1128|1134|}
{2010212001|XXGvertex_oport_oport|1907|0|3041|0|{0|out|}1134|1135|}
{2010212001|XXGvertex_oport_oport|1908|0|3043|0|{1|dup|}1134|1136|}
{2010212001|XXGvertex_oport_oport|1909|0|3045|0|{2|reject|}1134|1137|}
{2010212001|XXGvertex_oport_oport|1910|0|3047|0|{3|error|}1134|1138|}
{2010212001|XXGvertex_oport_oport|1911|0|3049|0|{4|log|}1134|1139|}
{2010211001|XXGvertex_iport_iport|1912|0|3051|0|{0|in|}1134|1140|}
{2010214001|XXGiport_src_flow|1913|0|3053|0|{0|}1140|1132|}
{2010007001|XXGobject_proto_object|1914|0|3054|0|{}1134|1141|}
{2010212001|XXGvertex_oport_oport|1915|0|3056|0|{0|out|}1141|1142|}
{2010006001|XXGobject_psameas_object|1916|0|3058|0|{metadata|out_metadata|1|0|}1142|1141|}
{2010212001|XXGvertex_oport_oport|1917|0|3059|0|{1|dup|}1141|1143|}
{2010006001|XXGobject_psameas_object|1918|0|3061|0|{metadata|dup_metadata|1|0|}1143|1141|}
{2010212001|XXGvertex_oport_oport|1919|0|3062|0|{2|reject|}1141|1144|}
{2010006001|XXGobject_psameas_object|1920|0|3064|0|{metadata|reject_metadata|1|0|}1144|1141|}
{2010212001|XXGvertex_oport_oport|1921|0|3065|0|{3|error|}1141|1145|}
{2010006001|XXGobject_psameas_object|1922|0|3067|0|{metadata|error_metadata|1|0|}1145|1141|}
{2010212001|XXGvertex_oport_oport|1923|0|3068|0|{4|log|}1141|1146|}
{2010006001|XXGobject_psameas_object|1924|0|3070|0|{metadata|log_metadata|1|0|}1146|1141|}
{2010211001|XXGvertex_iport_iport|1925|0|3071|0|{0|in|}1141|1147|}
{2010006001|XXGobject_psameas_object|1926|0|3073|0|{metadata|in_metadata|1|0|}1147|1141|}
{2010601001|XXGgraph_vertex_vertex|1927|0|3074|0|{RFMT_Create_hash_on_NK|}1128|1148|}
{2010212001|XXGvertex_oport_oport|1928|0|3076|0|{0|out0|}1148|1149|}
{2010213001|XXGoport_dst_flow|1929|0|3078|0|{0|}1149|1133|}
{2010212001|XXGvertex_oport_oport|1930|0|3079|0|{1|reject0|}1148|1150|}
{2010212001|XXGvertex_oport_oport|1931|0|3081|0|{2|error0|}1148|1151|}
{2010212001|XXGvertex_oport_oport|1932|0|3083|0|{3|log|}1148|1152|}
{2010211001|XXGvertex_iport_iport|1933|0|3085|0|{0|in|}1148|1153|}
{2010007001|XXGobject_proto_object|1934|0|3087|0|{}1148|1154|}
{2010212001|XXGvertex_oport_oport|1935|0|3089|0|{0|out0|}1154|1155|}
{2010006001|XXGobject_psameas_object|1936|0|3091|0|{metadata|out0_metadata|1|0|}1155|1154|}
{2010006001|XXGobject_psameas_object|1937|0|3092|0|{transform0|transform0|1|0|}1155|1154|}
{2010212001|XXGvertex_oport_oport|1938|0|3093|0|{1|reject0|}1154|1156|}
{2010006001|XXGobject_psameas_object|1939|0|3095|0|{metadata|reject0_metadata|1|0|}1156|1154|}
{2010212001|XXGvertex_oport_oport|1940|0|3096|0|{2|error0|}1154|1157|}
{2010006001|XXGobject_psameas_object|1941|0|3098|0|{metadata|error0_metadata|1|0|}1157|1154|}
{2010212001|XXGvertex_oport_oport|1942|0|3099|0|{3|log|}1154|1158|}
{2010006001|XXGobject_psameas_object|1943|0|3101|0|{metadata|log_metadata|1|0|}1158|1154|}
{2010211001|XXGvertex_iport_iport|1944|0|3102|0|{0|in|}1154|1159|}
{2010006001|XXGobject_psameas_object|1945|0|3104|0|{metadata|in_metadata|1|0|}1159|1154|}
{2010601001|XXGgraph_vertex_vertex|1946|0|3105|0|{Sort_on_ICFF_KEY|}1128|1160|}
{2010212001|XXGvertex_oport_oport|1947|0|3107|0|{0|out|}1160|1161|}
{2010213001|XXGoport_dst_flow|1948|0|3109|0|{0|}1161|1131|}
{2010211001|XXGvertex_iport_iport|1949|0|3110|0|{0|in|}1160|1162|}
{2010214001|XXGiport_src_flow|1950|0|3112|0|{0|}1162|1133|}
{2010007001|XXGobject_proto_object|1951|0|3113|0|{}1160|1163|}
{2010212001|XXGvertex_oport_oport|1952|0|3115|0|{0|out|}1163|1164|}
{2010006001|XXGobject_psameas_object|1953|0|3117|0|{metadata|out_metadata|1|0|}1164|1163|}
{2010211001|XXGvertex_iport_iport|1954|0|3118|0|{0|in|}1163|1165|}
{2010006001|XXGobject_psameas_object|1955|0|3120|0|{metadata|in_metadata|1|0|}1165|1163|}
{2010601001|XXGgraph_vertex_vertex|1956|0|3121|0|{Sort_within_Groups_1|}1128|1166|}
{2010212001|XXGvertex_oport_oport|1957|0|3123|0|{0|out|}1166|1167|}
{2010213001|XXGoport_dst_flow|1958|0|3125|0|{0|}1167|1132|}
{2010211001|XXGvertex_iport_iport|1959|0|3126|0|{0|in|}1166|1168|}
{2010214001|XXGiport_src_flow|1960|0|3128|0|{0|}1168|1131|}
{2010007001|XXGobject_proto_object|1961|0|3129|0|{}1166|1169|}
{2010212001|XXGvertex_oport_oport|1962|0|3131|0|{0|out|}1169|1170|}
{2010006001|XXGobject_psameas_object|1963|0|3133|0|{metadata|out_metadata|1|0|}1170|1169|}
{2010211001|XXGvertex_iport_iport|1964|0|3134|0|{0|in|}1169|1171|}
{2010006001|XXGobject_psameas_object|1965|0|3136|0|{metadata|in_metadata|1|0|}1171|1169|}
{2010212001|XXGvertex_oport_oport|1966|0|3137|0|{0|out0|}1128|1172|}
{2010216002|XXGoport_binding_oport|1967|0|3139|0|{.5|.5|{0|}15140|}1172|1135|}
{2010213001|XXGoport_dst_flow|1968|0|3140|0|{0|}1172|1062|}
{2010211001|XXGvertex_iport_iport|1969|0|3141|0|{0|in0|}1128|1173|}
{2010215002|XXGiport_binding_iport|1970|0|3143|0|{.5|.5|{0|}15139|}1173|1153|}
{2010214001|XXGiport_src_flow|1971|0|3144|0|{0|}1173|1060|}
{2010601001|XXGgraph_vertex_vertex|1972|0|3145|0|{Discard_Suppressed_Data|}1051|1174|}
{2010211001|XXGvertex_iport_iport|1973|0|3147|0|{0|in|}1174|1175|}
{2010214001|XXGiport_src_flow|1974|0|3149|0|{0|}1175|1055|}
{2010007001|XXGobject_proto_object|1975|0|3150|0|{}1174|1176|}
{2010211001|XXGvertex_iport_iport|1976|0|3152|0|{0|in|}1176|1177|}
{2010006001|XXGobject_psameas_object|1977|0|3154|0|{metadata|in_metadata|1|0|}1177|1176|}
{2010601001|XXGgraph_vertex_vertex|1978|0|3155|0|{Discard_Suppressed_Data_1|}1051|1178|}
{2010211001|XXGvertex_iport_iport|1979|0|3157|0|{0|in|}1178|1179|}
{2010214001|XXGiport_src_flow|1980|0|3159|0|{0|}1179|1057|}
{2010007001|XXGobject_proto_object|1981|0|3160|0|{}1178|1180|}
{2010211001|XXGvertex_iport_iport|1982|0|3162|0|{0|in|}1180|1181|}
{2010006001|XXGobject_psameas_object|1983|0|3164|0|{metadata|in_metadata|1|0|}1181|1180|}
{2010601001|XXGgraph_vertex_vertex|1984|0|3165|0|{Existing_IDS_ICFF|}1051|1182|}
{2010212001|XXGvertex_oport_oport|1985|0|3167|0|{0|read|}1182|1183|}
{2010213001|XXGoport_dst_flow|1986|0|3169|0|{0|}1183|1054|}
{2010007001|XXGobject_proto_object|1987|0|3170|0|{}1182|1184|}
{2010212001|XXGvertex_oport_oport|1988|0|3172|0|{0|read|}1184|1185|}
{2010006001|XXGobject_psameas_object|1989|0|3174|0|{metadata|read_metadata|1|0|}1185|1184|}
{2010601001|XXGgraph_vertex_vertex|1990|0|3175|0|{Filter_by_Expression_1|}1051|1186|}
{2010212001|XXGvertex_oport_oport|1991|0|3177|0|{0|out|}1186|1187|}
{2010213001|XXGoport_dst_flow|1992|0|3179|0|{0|}1187|1060|}
{2010212001|XXGvertex_oport_oport|1993|0|3180|0|{1|deselect|}1186|1188|}
{2010212001|XXGvertex_oport_oport|1994|0|3182|0|{2|reject|}1186|1189|}
{2010212001|XXGvertex_oport_oport|1995|0|3184|0|{3|error|}1186|1190|}
{2010212001|XXGvertex_oport_oport|1996|0|3186|0|{4|log|}1186|1191|}
{2010211001|XXGvertex_iport_iport|1997|0|3188|0|{0|in|}1186|1192|}
{2010214001|XXGiport_src_flow|1998|0|3190|0|{0|}1192|1065|}
{2010007001|XXGobject_proto_object|1999|0|3191|0|{}1186|1193|}
{2010212001|XXGvertex_oport_oport|2000|0|3193|0|{0|out|}1193|1194|}
{2010006001|XXGobject_psameas_object|2001|0|3195|0|{metadata|out_metadata|1|0|}1194|1193|}
{2010212001|XXGvertex_oport_oport|2002|0|3196|0|{1|deselect|}1193|1195|}
{2010006001|XXGobject_psameas_object|2003|0|3198|0|{metadata|deselect_metadata|1|0|}1195|1193|}
{2010212001|XXGvertex_oport_oport|2004|0|3199|0|{2|reject|}1193|1196|}
{2010006001|XXGobject_psameas_object|2005|0|3201|0|{metadata|reject_metadata|1|0|}1196|1193|}
{2010212001|XXGvertex_oport_oport|2006|0|3202|0|{3|error|}1193|1197|}
{2010006001|XXGobject_psameas_object|2007|0|3204|0|{metadata|error_metadata|1|0|}1197|1193|}
{2010212001|XXGvertex_oport_oport|2008|0|3205|0|{4|log|}1193|1198|}
{2010006001|XXGobject_psameas_object|2009|0|3207|0|{metadata|log_metadata|1|0|}1198|1193|}
{2010211001|XXGvertex_iport_iport|2010|0|3208|0|{0|in|}1193|1199|}
{2010006001|XXGobject_psameas_object|2011|0|3210|0|{metadata|in_metadata|1|0|}1199|1193|}
{2010006001|XXGobject_psameas_object|2012|0|3211|0|{deselect_metadata|in_metadata|0|0|}1186|1186|}
{2010006001|XXGobject_psameas_object|2013|0|3212|0|{reject_metadata|in_metadata|0|0|}1186|1186|}
{2010601001|XXGgraph_vertex_vertex|2014|0|3213|0|{Filter_by_Expression_2|}1051|1200|}
{2010212001|XXGvertex_oport_oport|2015|0|3215|0|{0|out|}1200|1201|}
{2010213001|XXGoport_dst_flow|2016|0|3217|0|{0|}1201|1059|}
{2010212001|XXGvertex_oport_oport|2017|0|3218|0|{1|deselect|}1200|1202|}
{2010212001|XXGvertex_oport_oport|2018|0|3220|0|{2|reject|}1200|1203|}
{2010212001|XXGvertex_oport_oport|2019|0|3222|0|{3|error|}1200|1204|}
{2010212001|XXGvertex_oport_oport|2020|0|3224|0|{4|log|}1200|1205|}
{2010211001|XXGvertex_iport_iport|2021|0|3226|0|{0|in|}1200|1206|}
{2010214001|XXGiport_src_flow|2022|0|3228|0|{0|}1206|1063|}
{2010007001|XXGobject_proto_object|2023|0|3229|0|{}1200|1207|}
{2010212001|XXGvertex_oport_oport|2024|0|3231|0|{0|out|}1207|1208|}
{2010006001|XXGobject_psameas_object|2025|0|3233|0|{metadata|out_metadata|1|0|}1208|1207|}
{2010212001|XXGvertex_oport_oport|2026|0|3234|0|{1|deselect|}1207|1209|}
{2010006001|XXGobject_psameas_object|2027|0|3236|0|{metadata|deselect_metadata|1|0|}1209|1207|}
{2010212001|XXGvertex_oport_oport|2028|0|3237|0|{2|reject|}1207|1210|}
{2010006001|XXGobject_psameas_object|2029|0|3239|0|{metadata|reject_metadata|1|0|}1210|1207|}
{2010212001|XXGvertex_oport_oport|2030|0|3240|0|{3|error|}1207|1211|}
{2010006001|XXGobject_psameas_object|2031|0|3242|0|{metadata|error_metadata|1|0|}1211|1207|}
{2010212001|XXGvertex_oport_oport|2032|0|3243|0|{4|log|}1207|1212|}
{2010006001|XXGobject_psameas_object|2033|0|3245|0|{metadata|log_metadata|1|0|}1212|1207|}
{2010211001|XXGvertex_iport_iport|2034|0|3246|0|{0|in|}1207|1213|}
{2010006001|XXGobject_psameas_object|2035|0|3248|0|{metadata|in_metadata|1|0|}1213|1207|}
{2010006001|XXGobject_psameas_object|2036|0|3249|0|{reject_metadata|in_metadata|0|0|}1200|1200|}
{2010601001|XXGgraph_vertex_vertex|2037|0|3250|0|{Input_File_Archive|}1051|1214|}
{2010212001|XXGvertex_oport_oport|2038|0|3252|0|{0|read|}1214|1215|}
{2010213001|XXGoport_dst_flow|2039|0|3254|0|{0|}1215|1064|}
{2010007001|XXGobject_proto_object|2040|0|3255|0|{}1214|1216|}
{2010212001|XXGvertex_oport_oport|2041|0|3257|0|{0|read|}1216|1217|}
{2010006001|XXGobject_psameas_object|2042|0|3259|0|{metadata|read_metadata|1|0|}1217|1216|}
{2010601001|XXGgraph_vertex_vertex|2043|0|3260|0|{Merge|}1051|1218|}
{2010212001|XXGvertex_oport_oport|2044|0|3262|0|{0|out|}1218|1219|}
{2010211001|XXGvertex_iport_iport|2045|0|3264|0|{0|in|}1218|1220|}
{2010214001|XXGiport_src_flow|2046|0|3266|0|{0|}1220|1061|}
{2010214001|XXGiport_src_flow|2047|0|3267|0|{1|}1220|1062|}
{2010007001|XXGobject_proto_object|2048|0|3268|0|{}1218|1221|}
{2010212001|XXGvertex_oport_oport|2049|0|3270|0|{0|out|}1221|1222|}
{2010006001|XXGobject_psameas_object|2050|0|3272|0|{metadata|out_metadata|1|0|}1222|1221|}
{2010211001|XXGvertex_iport_iport|2051|0|3273|0|{0|in|}1221|1223|}
{2010006001|XXGobject_psameas_object|2052|0|3275|0|{metadata|in_metadata|1|0|}1223|1221|}
{2010212001|XXGvertex_oport_oport|2053|0|3276|0|{0|out0|}1051|1224|}
{2010216002|XXGoport_binding_oport|2054|0|3278|0|{.5|.5|{0|}15740|}1224|1219|}
{2010601001|XXGgraph_vertex_vertex|2055|0|3279|0|{Read_Columnar_4|}1|1225|}
{2010605001|XXGgraph_legend_legend|2056|0|3281|0|{0|}1225|1226|}
{2010241001|XXGlegend_face_face|2057|0|3283|0|{}1226|1227|}
{2010604001|XXGgraph_flow_flow|2058|0|3285|0|{Flow_1|}1225|1228|}
{2010604001|XXGgraph_flow_flow|2059|0|3287|0|{Flow_15|}1225|1229|}
{2010244001|XXGflow_watcher_watcher|2060|0|3289|0|{}1229|1230|}
{2010604001|XXGgraph_flow_flow|2061|0|3291|0|{Flow_16|}1225|1231|}
{2010244001|XXGflow_watcher_watcher|2062|0|3293|0|{}1231|1232|}
{2010604001|XXGgraph_flow_flow|2063|0|3295|0|{Flow_2|}1225|1233|}
{2010604001|XXGgraph_flow_flow|2064|0|3297|0|{Flow_3|}1225|136|}
{2010604001|XXGgraph_flow_flow|2065|0|3298|0|{Flow_4|}1225|1234|}
{2010604001|XXGgraph_flow_flow|2066|0|3300|0|{Flow_5|}1225|1235|}
{2010604001|XXGgraph_flow_flow|2067|0|3302|0|{Flow_6|}1225|1236|}
{2010604001|XXGgraph_flow_flow|2068|0|3304|0|{Flow_7|}1225|1237|}
{2010604001|XXGgraph_flow_flow|2069|0|3306|0|{Flow_8|}1225|142|}
{2010601001|XXGgraph_vertex_vertex|2070|0|3307|0|{Data_Suppression_Outbound|}1225|1238|}
{2010212001|XXGvertex_oport_oport|2071|0|3309|0|{0|out0|}1238|1239|}
{2010213001|XXGoport_dst_flow|2072|0|3311|0|{0|}1239|1236|}
{2010212001|XXGvertex_oport_oport|2073|0|3312|0|{1|deselect|}1238|1240|}
{2010213001|XXGoport_dst_flow|2074|0|3314|0|{0|}1240|1229|}
{2010211001|XXGvertex_iport_iport|2075|0|3315|0|{0|in0|}1238|1241|}
{2010214001|XXGiport_src_flow|2076|0|3317|0|{0|}1241|1228|}
{2010006001|XXGobject_psameas_object|2077|0|3318|0|{Layout|Layout|0|0|}1238|53|}
{2010006001|XXGobject_psameas_object|2078|0|3319|0|{deselect_metadata|read_metadata|0|0|}1238|1242|}
{2010212001|XXGvertex_oport_oport|2079|0|3321|0|{0|read|}1242|1243|}
{2010213001|XXGoport_dst_flow|2080|0|3323|0|{0|}1243|1228|}
{2010006001|XXGobject_psameas_object|2081|0|3324|0|{in0_metadata|read_metadata|0|0|}1238|1242|}
{2010006001|XXGobject_psameas_object|2082|0|3325|0|{out0_metadata|read_metadata|0|0|}1238|1242|}
{2010601001|XXGgraph_vertex_vertex|2083|0|3326|0|{Data_Suppression_Outbound_1|}1225|1244|}
{2010212001|XXGvertex_oport_oport|2084|0|3328|0|{0|out0|}1244|1245|}
{2010213001|XXGoport_dst_flow|2085|0|3330|0|{0|}1245|142|}
{2010212001|XXGvertex_oport_oport|2086|0|3331|0|{1|deselect|}1244|1246|}
{2010213001|XXGoport_dst_flow|2087|0|3333|0|{0|}1246|1231|}
{2010211001|XXGvertex_iport_iport|2088|0|3334|0|{0|in0|}1244|1247|}
{2010214001|XXGiport_src_flow|2089|0|3336|0|{0|}1247|1237|}
{2010006001|XXGobject_psameas_object|2090|0|3337|0|{Layout|Layout|0|0|}1244|53|}
{2010006001|XXGobject_psameas_object|2091|0|3338|0|{deselect_metadata|read_metadata|0|0|}1244|1248|}
{2010212001|XXGvertex_oport_oport|2092|0|3340|0|{0|read|}1248|1249|}
{2010213001|XXGoport_dst_flow|2093|0|3342|0|{0|}1249|1237|}
{2010006001|XXGobject_psameas_object|2094|0|3343|0|{in0_metadata|read_metadata|0|0|}1244|1248|}
{2010006001|XXGobject_psameas_object|2095|0|3344|0|{out0_metadata|read_metadata|0|0|}1244|1248|}
{2010601001|XXGgraph_vertex_vertex|2096|0|3345|0|{De_Dup|}1225|1250|}
{2010605001|XXGgraph_legend_legend|2097|0|3347|0|{0|}1250|1251|}
{2010241001|XXGlegend_face_face|2098|0|3349|0|{}1251|1252|}
{2010604001|XXGgraph_flow_flow|2099|0|3351|0|{Flow_2|}1250|1253|}
{2010604001|XXGgraph_flow_flow|2100|0|3353|0|{Flow_3|}1250|1254|}
{2010604001|XXGgraph_flow_flow|2101|0|3355|0|{Flow_4|}1250|1255|}
{2010601001|XXGgraph_vertex_vertex|2102|0|3357|0|{Dedup_Sorted|}1250|1256|}
{2010212001|XXGvertex_oport_oport|2103|0|3359|0|{0|out|}1256|1257|}
{2010212001|XXGvertex_oport_oport|2104|0|3361|0|{1|dup|}1256|1258|}
{2010212001|XXGvertex_oport_oport|2105|0|3363|0|{2|reject|}1256|1259|}
{2010212001|XXGvertex_oport_oport|2106|0|3365|0|{3|error|}1256|1260|}
{2010212001|XXGvertex_oport_oport|2107|0|3367|0|{4|log|}1256|1261|}
{2010211001|XXGvertex_iport_iport|2108|0|3369|0|{0|in|}1256|1262|}
{2010214001|XXGiport_src_flow|2109|0|3371|0|{0|}1262|1254|}
{2010006001|XXGobject_psameas_object|2110|0|3372|0|{Layout|Layout|0|0|}1256|53|}
{2010006001|XXGobject_psameas_object|2111|0|3373|0|{dup_metadata|out0_metadata|0|0|}1256|1263|}
{2010212001|XXGvertex_oport_oport|2112|0|3375|0|{0|out0|}1263|1264|}
{2010213001|XXGoport_dst_flow|2113|0|3377|0|{0|}1264|1255|}
{2010212001|XXGvertex_oport_oport|2114|0|3378|0|{1|reject0|}1263|1265|}
{2010212001|XXGvertex_oport_oport|2115|0|3380|0|{2|error0|}1263|1266|}
{2010212001|XXGvertex_oport_oport|2116|0|3382|0|{3|log|}1263|1267|}
{2010211001|XXGvertex_iport_iport|2117|0|3384|0|{0|in|}1263|1268|}
{2010006001|XXGobject_psameas_object|2118|0|3386|0|{Layout|Layout|0|0|}1263|53|}
{2010006001|XXGobject_psameas_object|2119|0|3387|0|{in_metadata|out_metadata|0|0|}1263|1269|}
{2010212001|XXGvertex_oport_oport|2120|0|3389|0|{0|out|}1269|1270|}
{2010213001|XXGoport_dst_flow|2121|0|3391|0|{0|}1270|1233|}
{2010212001|XXGvertex_oport_oport|2122|0|3392|0|{1|deselect|}1269|1271|}
{2010212001|XXGvertex_oport_oport|2123|0|3394|0|{2|reject|}1269|1272|}
{2010212001|XXGvertex_oport_oport|2124|0|3396|0|{3|error|}1269|1273|}
{2010212001|XXGvertex_oport_oport|2125|0|3398|0|{4|log|}1269|1274|}
{2010211001|XXGvertex_iport_iport|2126|0|3400|0|{0|in|}1269|1275|}
{2010214001|XXGiport_src_flow|2127|0|3402|0|{0|}1275|1236|}
{2010006001|XXGobject_psameas_object|2128|0|3403|0|{Layout|Layout|0|0|}1269|53|}
{2010006001|XXGobject_psameas_object|2129|0|3404|0|{deselect_metadata|in_metadata|0|0|}1269|1269|}
{2010006001|XXGobject_psameas_object|2130|0|3405|0|{reject0_metadata|out_metadata|0|0|}1263|1269|}
{2010006001|XXGobject_psameas_object|2131|0|3406|0|{in_metadata|out0_metadata|0|0|}1256|1263|}
{2010006001|XXGobject_psameas_object|2132|0|3407|0|{out_metadata|out0_metadata|0|0|}1256|1263|}
{2010006001|XXGobject_psameas_object|2133|0|3408|0|{reject_metadata|out0_metadata|0|0|}1256|1263|}
{2010601001|XXGgraph_vertex_vertex|2134|0|3409|0|{RFMT_Create_hash_on_NK|}1250|1263|}
{2010601001|XXGgraph_vertex_vertex|2135|0|3410|0|{Sort_on_ICFF_KEY|}1250|1276|}
{2010212001|XXGvertex_oport_oport|2136|0|3412|0|{0|out|}1276|1277|}
{2010213001|XXGoport_dst_flow|2137|0|3414|0|{0|}1277|1253|}
{2010211001|XXGvertex_iport_iport|2138|0|3415|0|{0|in|}1276|1278|}
{2010214001|XXGiport_src_flow|2139|0|3417|0|{0|}1278|1255|}
{2010006001|XXGobject_psameas_object|2140|0|3418|0|{Layout|Layout|0|0|}1276|53|}
{2010006001|XXGobject_psameas_object|2141|0|3419|0|{in_metadata|out0_metadata|0|0|}1276|1263|}
{2010006001|XXGobject_psameas_object|2142|0|3420|0|{out_metadata|out0_metadata|0|0|}1276|1263|}
{2010601001|XXGgraph_vertex_vertex|2143|0|3421|0|{Sort_within_Groups_1|}1250|1279|}
{2010212001|XXGvertex_oport_oport|2144|0|3423|0|{0|out|}1279|1280|}
{2010213001|XXGoport_dst_flow|2145|0|3425|0|{0|}1280|1254|}
{2010211001|XXGvertex_iport_iport|2146|0|3426|0|{0|in|}1279|1281|}
{2010214001|XXGiport_src_flow|2147|0|3428|0|{0|}1281|1253|}
{2010006001|XXGobject_psameas_object|2148|0|3429|0|{Layout|Layout|0|0|}1279|53|}
{2010006001|XXGobject_psameas_object|2149|0|3430|0|{in_metadata|out0_metadata|0|0|}1279|1263|}
{2010006001|XXGobject_psameas_object|2150|0|3431|0|{out_metadata|out0_metadata|0|0|}1279|1263|}
{2010212001|XXGvertex_oport_oport|2151|0|3432|0|{0|out0|}1250|1282|}
{2010216002|XXGoport_binding_oport|2152|0|3434|0|{.5|.5|{0|}15147|}1282|1257|}
{2010213001|XXGoport_dst_flow|2153|0|3435|0|{0|}1282|1234|}
{2010211001|XXGvertex_iport_iport|2154|0|3436|0|{0|in0|}1250|1283|}
{2010215002|XXGiport_binding_iport|2155|0|3438|0|{.5|.5|{0|}15146|}1283|1268|}
{2010214001|XXGiport_src_flow|2156|0|3439|0|{0|}1283|1233|}
{2010601001|XXGgraph_vertex_vertex|2157|0|3440|0|{De_Dup_1|}1225|1284|}
{2010605001|XXGgraph_legend_legend|2158|0|3442|0|{0|}1284|1285|}
{2010241001|XXGlegend_face_face|2159|0|3444|0|{}1285|1286|}
{2010604001|XXGgraph_flow_flow|2160|0|3446|0|{Flow_2|}1284|1287|}
{2010604001|XXGgraph_flow_flow|2161|0|3448|0|{Flow_3|}1284|1288|}
{2010604001|XXGgraph_flow_flow|2162|0|3450|0|{Flow_4|}1284|129|}
{2010601001|XXGgraph_vertex_vertex|2163|0|3451|0|{Dedup_Sorted|}1284|1289|}
{2010212001|XXGvertex_oport_oport|2164|0|3453|0|{0|out|}1289|1290|}
{2010212001|XXGvertex_oport_oport|2165|0|3455|0|{1|dup|}1289|1291|}
{2010212001|XXGvertex_oport_oport|2166|0|3457|0|{2|reject|}1289|1292|}
{2010212001|XXGvertex_oport_oport|2167|0|3459|0|{3|error|}1289|1293|}
{2010212001|XXGvertex_oport_oport|2168|0|3461|0|{4|log|}1289|1294|}
{2010211001|XXGvertex_iport_iport|2169|0|3463|0|{0|in|}1289|1295|}
{2010214001|XXGiport_src_flow|2170|0|3465|0|{0|}1295|1288|}
{2010006001|XXGobject_psameas_object|2171|0|3466|0|{Layout|Layout|0|0|}1289|53|}
{2010006001|XXGobject_psameas_object|2172|0|3467|0|{dup_metadata|out0_metadata|0|0|}1289|127|}
{2010006001|XXGobject_psameas_object|2173|0|3468|0|{in_metadata|out0_metadata|0|0|}1289|127|}
{2010006001|XXGobject_psameas_object|2174|0|3469|0|{out_metadata|out0_metadata|0|0|}1289|127|}
{2010006001|XXGobject_psameas_object|2175|0|3470|0|{reject_metadata|out0_metadata|0|0|}1289|127|}
{2010601001|XXGgraph_vertex_vertex|2176|0|3471|0|{RFMT_Create_hash_on_NK|}1284|127|}
{2010601001|XXGgraph_vertex_vertex|2177|0|3472|0|{Sort_on_ICFF_KEY|}1284|1296|}
{2010212001|XXGvertex_oport_oport|2178|0|3474|0|{0|out|}1296|1297|}
{2010213001|XXGoport_dst_flow|2179|0|3476|0|{0|}1297|1287|}
{2010211001|XXGvertex_iport_iport|2180|0|3477|0|{0|in|}1296|1298|}
{2010214001|XXGiport_src_flow|2181|0|3479|0|{0|}1298|129|}
{2010006001|XXGobject_psameas_object|2182|0|3480|0|{Layout|Layout|0|0|}1296|53|}
{2010006001|XXGobject_psameas_object|2183|0|3481|0|{in_metadata|out0_metadata|0|0|}1296|127|}
{2010006001|XXGobject_psameas_object|2184|0|3482|0|{out_metadata|out0_metadata|0|0|}1296|127|}
{2010601001|XXGgraph_vertex_vertex|2185|0|3483|0|{Sort_within_Groups_1|}1284|1299|}
{2010212001|XXGvertex_oport_oport|2186|0|3485|0|{0|out|}1299|1300|}
{2010213001|XXGoport_dst_flow|2187|0|3487|0|{0|}1300|1288|}
{2010211001|XXGvertex_iport_iport|2188|0|3488|0|{0|in|}1299|1301|}
{2010214001|XXGiport_src_flow|2189|0|3490|0|{0|}1301|1287|}
{2010006001|XXGobject_psameas_object|2190|0|3491|0|{Layout|Layout|0|0|}1299|53|}
{2010006001|XXGobject_psameas_object|2191|0|3492|0|{in_metadata|out0_metadata|0|0|}1299|127|}
{2010006001|XXGobject_psameas_object|2192|0|3493|0|{out_metadata|out0_metadata|0|0|}1299|127|}
{2010212001|XXGvertex_oport_oport|2193|0|3494|0|{0|out0|}1284|1302|}
{2010216002|XXGoport_binding_oport|2194|0|3496|0|{.5|.5|{0|}15140|}1302|1290|}
{2010213001|XXGoport_dst_flow|2195|0|3497|0|{0|}1302|1235|}
{2010211001|XXGvertex_iport_iport|2196|0|3498|0|{0|in0|}1284|1303|}
{2010215002|XXGiport_binding_iport|2197|0|3500|0|{.5|.5|{0|}15139|}1303|133|}
{2010214001|XXGiport_src_flow|2198|0|3501|0|{0|}1303|136|}
{2010601001|XXGgraph_vertex_vertex|2199|0|3502|0|{Discard_Suppressed_Data|}1225|1304|}
{2010211001|XXGvertex_iport_iport|2200|0|3504|0|{0|in|}1304|1305|}
{2010214001|XXGiport_src_flow|2201|0|3506|0|{0|}1305|1229|}
{2010006001|XXGobject_psameas_object|2202|0|3507|0|{Layout|Layout|0|0|}1304|1238|}
{2010006001|XXGobject_psameas_object|2203|0|3508|0|{in_metadata|read_metadata|0|0|}1304|1242|}
{2010601001|XXGgraph_vertex_vertex|2204|0|3509|0|{Discard_Suppressed_Data_1|}1225|1306|}
{2010211001|XXGvertex_iport_iport|2205|0|3511|0|{0|in|}1306|1307|}
{2010214001|XXGiport_src_flow|2206|0|3513|0|{0|}1307|1231|}
{2010006001|XXGobject_psameas_object|2207|0|3514|0|{Layout|Layout|0|0|}1306|1244|}
{2010006001|XXGobject_psameas_object|2208|0|3515|0|{in_metadata|read_metadata|0|0|}1306|1248|}
{2010601001|XXGgraph_vertex_vertex|2209|0|3516|0|{Existing_IDS_ICFF|}1225|1242|}
{2010601001|XXGgraph_vertex_vertex|2210|0|3517|0|{Filter_by_Expression_1|}1225|134|}
{2010601001|XXGgraph_vertex_vertex|2211|0|3518|0|{Filter_by_Expression_2|}1225|1269|}
{2010601001|XXGgraph_vertex_vertex|2212|0|3519|0|{Input_File_Archive|}1225|1248|}
{2010601001|XXGgraph_vertex_vertex|2213|0|3520|0|{Merge|}1225|1308|}
{2010212001|XXGvertex_oport_oport|2214|0|3522|0|{0|out|}1308|1309|}
{2010211001|XXGvertex_iport_iport|2215|0|3524|0|{0|in|}1308|1310|}
{2010214001|XXGiport_src_flow|2216|0|3526|0|{0|}1310|1234|}
{2010214001|XXGiport_src_flow|2217|0|3527|0|{1|}1310|1235|}
{2010006001|XXGobject_psameas_object|2218|0|3528|0|{Layout|Layout|0|0|}1308|53|}
{2010006001|XXGobject_psameas_object|2219|0|3529|0|{in_metadata|out0_metadata|0|0|}1308|127|}
{2010006001|XXGobject_psameas_object|2220|0|3530|0|{out_metadata|out0_metadata|0|0|}1308|127|}
{2010212001|XXGvertex_oport_oport|2221|0|3531|0|{0|out0|}1225|1311|}
{2010216002|XXGoport_binding_oport|2222|0|3533|0|{.5|.5|{0|}15740|}1311|1309|}
{2010213001|XXGoport_dst_flow|2223|0|3534|0|{0|}1311|13|}
{2010007001|XXGobject_proto_object|2224|0|3535|0|{}1225|1312|}
{2010605001|XXGgraph_legend_legend|2225|0|3537|0|{0|}1312|1313|}
{2010241001|XXGlegend_face_face|2226|0|3539|0|{}1313|1314|}
{2010604001|XXGgraph_flow_flow|2227|0|3541|0|{Flow_1|}1312|1315|}
{2010604001|XXGgraph_flow_flow|2228|0|3543|0|{Flow_15|}1312|1316|}
{2010244001|XXGflow_watcher_watcher|2229|0|3545|0|{}1316|1317|}
{2010604001|XXGgraph_flow_flow|2230|0|3547|0|{Flow_16|}1312|1318|}
{2010244001|XXGflow_watcher_watcher|2231|0|3549|0|{}1318|1319|}
{2010604001|XXGgraph_flow_flow|2232|0|3551|0|{Flow_2|}1312|1320|}
{2010604001|XXGgraph_flow_flow|2233|0|3553|0|{Flow_3|}1312|1321|}
{2010604001|XXGgraph_flow_flow|2234|0|3555|0|{Flow_4|}1312|1322|}
{2010604001|XXGgraph_flow_flow|2235|0|3557|0|{Flow_5|}1312|1323|}
{2010604001|XXGgraph_flow_flow|2236|0|3559|0|{Flow_6|}1312|1324|}
{2010604001|XXGgraph_flow_flow|2237|0|3561|0|{Flow_7|}1312|1325|}
{2010604001|XXGgraph_flow_flow|2238|0|3563|0|{Flow_8|}1312|1326|}
{2010601001|XXGgraph_vertex_vertex|2239|0|3565|0|{Data_Suppression_Outbound|}1312|1327|}
{2010401001|XXGvertex_prototype_vertex|2240|0|3567|0|{}1327|1328|}
{2010212001|XXGvertex_oport_oport|2241|0|3569|0|{0|out0|}1328|1329|}
{2010006001|XXGobject_psameas_object|2242|0|3571|0|{metadata|out0_metadata|1|0|}1329|1328|}
{2010212001|XXGvertex_oport_oport|2243|0|3572|0|{1|deselect|}1328|1330|}
{2010006001|XXGobject_psameas_object|2244|0|3574|0|{metadata|deselect_metadata|1|0|}1330|1328|}
{2010211001|XXGvertex_iport_iport|2245|0|3575|0|{0|in0|}1328|1331|}
{2010006001|XXGobject_psameas_object|2246|0|3577|0|{metadata|in0_metadata|1|0|}1331|1328|}
{2010212001|XXGvertex_oport_oport|2247|0|3578|0|{0|out0|}1327|1332|}
{2010213001|XXGoport_dst_flow|2248|0|3580|0|{0|}1332|1324|}
{2010212001|XXGvertex_oport_oport|2249|0|3581|0|{1|deselect|}1327|1333|}
{2010213001|XXGoport_dst_flow|2250|0|3583|0|{0|}1333|1316|}
{2010211001|XXGvertex_iport_iport|2251|0|3584|0|{0|in0|}1327|1334|}
{2010214001|XXGiport_src_flow|2252|0|3586|0|{0|}1334|1315|}
{2010601001|XXGgraph_vertex_vertex|2253|0|3587|0|{Data_Suppression_Outbound_1|}1312|1335|}
{2010401001|XXGvertex_prototype_vertex|2254|0|3589|0|{}1335|1336|}
{2010212001|XXGvertex_oport_oport|2255|0|3591|0|{0|out0|}1336|1337|}
{2010006001|XXGobject_psameas_object|2256|0|3593|0|{metadata|out0_metadata|1|0|}1337|1336|}
{2010212001|XXGvertex_oport_oport|2257|0|3594|0|{1|deselect|}1336|1338|}
{2010006001|XXGobject_psameas_object|2258|0|3596|0|{metadata|deselect_metadata|1|0|}1338|1336|}
{2010211001|XXGvertex_iport_iport|2259|0|3597|0|{0|in0|}1336|1339|}
{2010006001|XXGobject_psameas_object|2260|0|3599|0|{metadata|in0_metadata|1|0|}1339|1336|}
{2010212001|XXGvertex_oport_oport|2261|0|3600|0|{0|out0|}1335|1340|}
{2010213001|XXGoport_dst_flow|2262|0|3602|0|{0|}1340|1326|}
{2010212001|XXGvertex_oport_oport|2263|0|3603|0|{1|deselect|}1335|1341|}
{2010213001|XXGoport_dst_flow|2264|0|3605|0|{0|}1341|1318|}
{2010211001|XXGvertex_iport_iport|2265|0|3606|0|{0|in0|}1335|1342|}
{2010214001|XXGiport_src_flow|2266|0|3608|0|{0|}1342|1325|}
{2010601001|XXGgraph_vertex_vertex|2267|0|3609|0|{De_Dup|}1312|1343|}
{2010605001|XXGgraph_legend_legend|2268|0|3611|0|{0|}1343|1344|}
{2010241001|XXGlegend_face_face|2269|0|3613|0|{}1344|1345|}
{2010604001|XXGgraph_flow_flow|2270|0|3615|0|{Flow_2|}1343|1346|}
{2010604001|XXGgraph_flow_flow|2271|0|3617|0|{Flow_3|}1343|1347|}
{2010604001|XXGgraph_flow_flow|2272|0|3619|0|{Flow_4|}1343|1348|}
{2010601001|XXGgraph_vertex_vertex|2273|0|3621|0|{Dedup_Sorted|}1343|1349|}
{2010212001|XXGvertex_oport_oport|2274|0|3623|0|{0|out|}1349|1350|}
{2010212001|XXGvertex_oport_oport|2275|0|3625|0|{1|dup|}1349|1351|}
{2010212001|XXGvertex_oport_oport|2276|0|3627|0|{2|reject|}1349|1352|}
{2010212001|XXGvertex_oport_oport|2277|0|3629|0|{3|error|}1349|1353|}
{2010212001|XXGvertex_oport_oport|2278|0|3631|0|{4|log|}1349|1354|}
{2010211001|XXGvertex_iport_iport|2279|0|3633|0|{0|in|}1349|1355|}
{2010214001|XXGiport_src_flow|2280|0|3635|0|{0|}1355|1347|}
{2010007001|XXGobject_proto_object|2281|0|3636|0|{}1349|1356|}
{2010212001|XXGvertex_oport_oport|2282|0|3638|0|{0|out|}1356|1357|}
{2010006001|XXGobject_psameas_object|2283|0|3640|0|{metadata|out_metadata|1|0|}1357|1356|}
{2010212001|XXGvertex_oport_oport|2284|0|3641|0|{1|dup|}1356|1358|}
{2010006001|XXGobject_psameas_object|2285|0|3643|0|{metadata|dup_metadata|1|0|}1358|1356|}
{2010212001|XXGvertex_oport_oport|2286|0|3644|0|{2|reject|}1356|1359|}
{2010006001|XXGobject_psameas_object|2287|0|3646|0|{metadata|reject_metadata|1|0|}1359|1356|}
{2010212001|XXGvertex_oport_oport|2288|0|3647|0|{3|error|}1356|1360|}
{2010006001|XXGobject_psameas_object|2289|0|3649|0|{metadata|error_metadata|1|0|}1360|1356|}
{2010212001|XXGvertex_oport_oport|2290|0|3650|0|{4|log|}1356|1361|}
{2010006001|XXGobject_psameas_object|2291|0|3652|0|{metadata|log_metadata|1|0|}1361|1356|}
{2010211001|XXGvertex_iport_iport|2292|0|3653|0|{0|in|}1356|1362|}
{2010006001|XXGobject_psameas_object|2293|0|3655|0|{metadata|in_metadata|1|0|}1362|1356|}
{2010601001|XXGgraph_vertex_vertex|2294|0|3656|0|{RFMT_Create_hash_on_NK|}1343|1363|}
{2010212001|XXGvertex_oport_oport|2295|0|3658|0|{0|out0|}1363|1364|}
{2010213001|XXGoport_dst_flow|2296|0|3660|0|{0|}1364|1348|}
{2010212001|XXGvertex_oport_oport|2297|0|3661|0|{1|reject0|}1363|1365|}
{2010212001|XXGvertex_oport_oport|2298|0|3663|0|{2|error0|}1363|1366|}
{2010212001|XXGvertex_oport_oport|2299|0|3665|0|{3|log|}1363|1367|}
{2010211001|XXGvertex_iport_iport|2300|0|3667|0|{0|in|}1363|1368|}
{2010007001|XXGobject_proto_object|2301|0|3669|0|{}1363|1369|}
{2010212001|XXGvertex_oport_oport|2302|0|3671|0|{0|out0|}1369|1370|}
{2010006001|XXGobject_psameas_object|2303|0|3673|0|{metadata|out0_metadata|1|0|}1370|1369|}
{2010006001|XXGobject_psameas_object|2304|0|3674|0|{transform0|transform0|1|0|}1370|1369|}
{2010212001|XXGvertex_oport_oport|2305|0|3675|0|{1|reject0|}1369|1371|}
{2010006001|XXGobject_psameas_object|2306|0|3677|0|{metadata|reject0_metadata|1|0|}1371|1369|}
{2010212001|XXGvertex_oport_oport|2307|0|3678|0|{2|error0|}1369|1372|}
{2010006001|XXGobject_psameas_object|2308|0|3680|0|{metadata|error0_metadata|1|0|}1372|1369|}
{2010212001|XXGvertex_oport_oport|2309|0|3681|0|{3|log|}1369|1373|}
{2010006001|XXGobject_psameas_object|2310|0|3683|0|{metadata|log_metadata|1|0|}1373|1369|}
{2010211001|XXGvertex_iport_iport|2311|0|3684|0|{0|in|}1369|1374|}
{2010006001|XXGobject_psameas_object|2312|0|3686|0|{metadata|in_metadata|1|0|}1374|1369|}
{2010601001|XXGgraph_vertex_vertex|2313|0|3687|0|{Sort_on_ICFF_KEY|}1343|1375|}
{2010212001|XXGvertex_oport_oport|2314|0|3689|0|{0|out|}1375|1376|}
{2010213001|XXGoport_dst_flow|2315|0|3691|0|{0|}1376|1346|}
{2010211001|XXGvertex_iport_iport|2316|0|3692|0|{0|in|}1375|1377|}
{2010214001|XXGiport_src_flow|2317|0|3694|0|{0|}1377|1348|}
{2010007001|XXGobject_proto_object|2318|0|3695|0|{}1375|1378|}
{2010212001|XXGvertex_oport_oport|2319|0|3697|0|{0|out|}1378|1379|}
{2010006001|XXGobject_psameas_object|2320|0|3699|0|{metadata|out_metadata|1|0|}1379|1378|}
{2010211001|XXGvertex_iport_iport|2321|0|3700|0|{0|in|}1378|1380|}
{2010006001|XXGobject_psameas_object|2322|0|3702|0|{metadata|in_metadata|1|0|}1380|1378|}
{2010601001|XXGgraph_vertex_vertex|2323|0|3703|0|{Sort_within_Groups_1|}1343|1381|}
{2010212001|XXGvertex_oport_oport|2324|0|3705|0|{0|out|}1381|1382|}
{2010213001|XXGoport_dst_flow|2325|0|3707|0|{0|}1382|1347|}
{2010211001|XXGvertex_iport_iport|2326|0|3708|0|{0|in|}1381|1383|}
{2010214001|XXGiport_src_flow|2327|0|3710|0|{0|}1383|1346|}
{2010007001|XXGobject_proto_object|2328|0|3711|0|{}1381|1384|}
{2010212001|XXGvertex_oport_oport|2329|0|3713|0|{0|out|}1384|1385|}
{2010006001|XXGobject_psameas_object|2330|0|3715|0|{metadata|out_metadata|1|0|}1385|1384|}
{2010211001|XXGvertex_iport_iport|2331|0|3716|0|{0|in|}1384|1386|}
{2010006001|XXGobject_psameas_object|2332|0|3718|0|{metadata|in_metadata|1|0|}1386|1384|}
{2010212001|XXGvertex_oport_oport|2333|0|3719|0|{0|out0|}1343|1387|}
{2010216002|XXGoport_binding_oport|2334|0|3721|0|{.5|.5|{0|}15147|}1387|1350|}
{2010213001|XXGoport_dst_flow|2335|0|3722|0|{0|}1387|1322|}
{2010211001|XXGvertex_iport_iport|2336|0|3723|0|{0|in0|}1343|1388|}
{2010215002|XXGiport_binding_iport|2337|0|3725|0|{.5|.5|{0|}15146|}1388|1368|}
{2010214001|XXGiport_src_flow|2338|0|3726|0|{0|}1388|1320|}
{2010601001|XXGgraph_vertex_vertex|2339|0|3727|0|{De_Dup_1|}1312|1389|}
{2010605001|XXGgraph_legend_legend|2340|0|3729|0|{0|}1389|1390|}
{2010241001|XXGlegend_face_face|2341|0|3731|0|{}1390|1391|}
{2010604001|XXGgraph_flow_flow|2342|0|3733|0|{Flow_2|}1389|1392|}
{2010604001|XXGgraph_flow_flow|2343|0|3735|0|{Flow_3|}1389|1393|}
{2010604001|XXGgraph_flow_flow|2344|0|3737|0|{Flow_4|}1389|1394|}
{2010601001|XXGgraph_vertex_vertex|2345|0|3739|0|{Dedup_Sorted|}1389|1395|}
{2010212001|XXGvertex_oport_oport|2346|0|3741|0|{0|out|}1395|1396|}
{2010212001|XXGvertex_oport_oport|2347|0|3743|0|{1|dup|}1395|1397|}
{2010212001|XXGvertex_oport_oport|2348|0|3745|0|{2|reject|}1395|1398|}
{2010212001|XXGvertex_oport_oport|2349|0|3747|0|{3|error|}1395|1399|}
{2010212001|XXGvertex_oport_oport|2350|0|3749|0|{4|log|}1395|1400|}
{2010211001|XXGvertex_iport_iport|2351|0|3751|0|{0|in|}1395|1401|}
{2010214001|XXGiport_src_flow|2352|0|3753|0|{0|}1401|1393|}
{2010007001|XXGobject_proto_object|2353|0|3754|0|{}1395|1402|}
{2010212001|XXGvertex_oport_oport|2354|0|3756|0|{0|out|}1402|1403|}
{2010006001|XXGobject_psameas_object|2355|0|3758|0|{metadata|out_metadata|1|0|}1403|1402|}
{2010212001|XXGvertex_oport_oport|2356|0|3759|0|{1|dup|}1402|1404|}
{2010006001|XXGobject_psameas_object|2357|0|3761|0|{metadata|dup_metadata|1|0|}1404|1402|}
{2010212001|XXGvertex_oport_oport|2358|0|3762|0|{2|reject|}1402|1405|}
{2010006001|XXGobject_psameas_object|2359|0|3764|0|{metadata|reject_metadata|1|0|}1405|1402|}
{2010212001|XXGvertex_oport_oport|2360|0|3765|0|{3|error|}1402|1406|}
{2010006001|XXGobject_psameas_object|2361|0|3767|0|{metadata|error_metadata|1|0|}1406|1402|}
{2010212001|XXGvertex_oport_oport|2362|0|3768|0|{4|log|}1402|1407|}
{2010006001|XXGobject_psameas_object|2363|0|3770|0|{metadata|log_metadata|1|0|}1407|1402|}
{2010211001|XXGvertex_iport_iport|2364|0|3771|0|{0|in|}1402|1408|}
{2010006001|XXGobject_psameas_object|2365|0|3773|0|{metadata|in_metadata|1|0|}1408|1402|}
{2010601001|XXGgraph_vertex_vertex|2366|0|3774|0|{RFMT_Create_hash_on_NK|}1389|1409|}
{2010212001|XXGvertex_oport_oport|2367|0|3776|0|{0|out0|}1409|1410|}
{2010213001|XXGoport_dst_flow|2368|0|3778|0|{0|}1410|1394|}
{2010212001|XXGvertex_oport_oport|2369|0|3779|0|{1|reject0|}1409|1411|}
{2010212001|XXGvertex_oport_oport|2370|0|3781|0|{2|error0|}1409|1412|}
{2010212001|XXGvertex_oport_oport|2371|0|3783|0|{3|log|}1409|1413|}
{2010211001|XXGvertex_iport_iport|2372|0|3785|0|{0|in|}1409|1414|}
{2010007001|XXGobject_proto_object|2373|0|3787|0|{}1409|1415|}
{2010212001|XXGvertex_oport_oport|2374|0|3789|0|{0|out0|}1415|1416|}
{2010006001|XXGobject_psameas_object|2375|0|3791|0|{metadata|out0_metadata|1|0|}1416|1415|}
{2010006001|XXGobject_psameas_object|2376|0|3792|0|{transform0|transform0|1|0|}1416|1415|}
{2010212001|XXGvertex_oport_oport|2377|0|3793|0|{1|reject0|}1415|1417|}
{2010006001|XXGobject_psameas_object|2378|0|3795|0|{metadata|reject0_metadata|1|0|}1417|1415|}
{2010212001|XXGvertex_oport_oport|2379|0|3796|0|{2|error0|}1415|1418|}
{2010006001|XXGobject_psameas_object|2380|0|3798|0|{metadata|error0_metadata|1|0|}1418|1415|}
{2010212001|XXGvertex_oport_oport|2381|0|3799|0|{3|log|}1415|1419|}
{2010006001|XXGobject_psameas_object|2382|0|3801|0|{metadata|log_metadata|1|0|}1419|1415|}
{2010211001|XXGvertex_iport_iport|2383|0|3802|0|{0|in|}1415|1420|}
{2010006001|XXGobject_psameas_object|2384|0|3804|0|{metadata|in_metadata|1|0|}1420|1415|}
{2010601001|XXGgraph_vertex_vertex|2385|0|3805|0|{Sort_on_ICFF_KEY|}1389|1421|}
{2010212001|XXGvertex_oport_oport|2386|0|3807|0|{0|out|}1421|1422|}
{2010213001|XXGoport_dst_flow|2387|0|3809|0|{0|}1422|1392|}
{2010211001|XXGvertex_iport_iport|2388|0|3810|0|{0|in|}1421|1423|}
{2010214001|XXGiport_src_flow|2389|0|3812|0|{0|}1423|1394|}
{2010007001|XXGobject_proto_object|2390|0|3813|0|{}1421|1424|}
{2010212001|XXGvertex_oport_oport|2391|0|3815|0|{0|out|}1424|1425|}
{2010006001|XXGobject_psameas_object|2392|0|3817|0|{metadata|out_metadata|1|0|}1425|1424|}
{2010211001|XXGvertex_iport_iport|2393|0|3818|0|{0|in|}1424|1426|}
{2010006001|XXGobject_psameas_object|2394|0|3820|0|{metadata|in_metadata|1|0|}1426|1424|}
{2010601001|XXGgraph_vertex_vertex|2395|0|3821|0|{Sort_within_Groups_1|}1389|1427|}
{2010212001|XXGvertex_oport_oport|2396|0|3823|0|{0|out|}1427|1428|}
{2010213001|XXGoport_dst_flow|2397|0|3825|0|{0|}1428|1393|}
{2010211001|XXGvertex_iport_iport|2398|0|3826|0|{0|in|}1427|1429|}
{2010214001|XXGiport_src_flow|2399|0|3828|0|{0|}1429|1392|}
{2010007001|XXGobject_proto_object|2400|0|3829|0|{}1427|1430|}
{2010212001|XXGvertex_oport_oport|2401|0|3831|0|{0|out|}1430|1431|}
{2010006001|XXGobject_psameas_object|2402|0|3833|0|{metadata|out_metadata|1|0|}1431|1430|}
{2010211001|XXGvertex_iport_iport|2403|0|3834|0|{0|in|}1430|1432|}
{2010006001|XXGobject_psameas_object|2404|0|3836|0|{metadata|in_metadata|1|0|}1432|1430|}
{2010212001|XXGvertex_oport_oport|2405|0|3837|0|{0|out0|}1389|1433|}
{2010216002|XXGoport_binding_oport|2406|0|3839|0|{.5|.5|{0|}15140|}1433|1396|}
{2010213001|XXGoport_dst_flow|2407|0|3840|0|{0|}1433|1323|}
{2010211001|XXGvertex_iport_iport|2408|0|3841|0|{0|in0|}1389|1434|}
{2010215002|XXGiport_binding_iport|2409|0|3843|0|{.5|.5|{0|}15139|}1434|1414|}
{2010214001|XXGiport_src_flow|2410|0|3844|0|{0|}1434|1321|}
{2010601001|XXGgraph_vertex_vertex|2411|0|3845|0|{Discard_Suppressed_Data|}1312|1435|}
{2010211001|XXGvertex_iport_iport|2412|0|3847|0|{0|in|}1435|1436|}
{2010214001|XXGiport_src_flow|2413|0|3849|0|{0|}1436|1316|}
{2010007001|XXGobject_proto_object|2414|0|3850|0|{}1435|1437|}
{2010211001|XXGvertex_iport_iport|2415|0|3852|0|{0|in|}1437|1438|}
{2010006001|XXGobject_psameas_object|2416|0|3854|0|{metadata|in_metadata|1|0|}1438|1437|}
{2010601001|XXGgraph_vertex_vertex|2417|0|3855|0|{Discard_Suppressed_Data_1|}1312|1439|}
{2010211001|XXGvertex_iport_iport|2418|0|3857|0|{0|in|}1439|1440|}
{2010214001|XXGiport_src_flow|2419|0|3859|0|{0|}1440|1318|}
{2010007001|XXGobject_proto_object|2420|0|3860|0|{}1439|1441|}
{2010211001|XXGvertex_iport_iport|2421|0|3862|0|{0|in|}1441|1442|}
{2010006001|XXGobject_psameas_object|2422|0|3864|0|{metadata|in_metadata|1|0|}1442|1441|}
{2010601001|XXGgraph_vertex_vertex|2423|0|3865|0|{Existing_IDS_ICFF|}1312|1443|}
{2010212001|XXGvertex_oport_oport|2424|0|3867|0|{0|read|}1443|1444|}
{2010213001|XXGoport_dst_flow|2425|0|3869|0|{0|}1444|1315|}
{2010007001|XXGobject_proto_object|2426|0|3870|0|{}1443|1445|}
{2010212001|XXGvertex_oport_oport|2427|0|3872|0|{0|read|}1445|1446|}
{2010006001|XXGobject_psameas_object|2428|0|3874|0|{metadata|read_metadata|1|0|}1446|1445|}
{2010601001|XXGgraph_vertex_vertex|2429|0|3875|0|{Filter_by_Expression_1|}1312|1447|}
{2010212001|XXGvertex_oport_oport|2430|0|3877|0|{0|out|}1447|1448|}
{2010213001|XXGoport_dst_flow|2431|0|3879|0|{0|}1448|1321|}
{2010212001|XXGvertex_oport_oport|2432|0|3880|0|{1|deselect|}1447|1449|}
{2010212001|XXGvertex_oport_oport|2433|0|3882|0|{2|reject|}1447|1450|}
{2010212001|XXGvertex_oport_oport|2434|0|3884|0|{3|error|}1447|1451|}
{2010212001|XXGvertex_oport_oport|2435|0|3886|0|{4|log|}1447|1452|}
{2010211001|XXGvertex_iport_iport|2436|0|3888|0|{0|in|}1447|1453|}
{2010214001|XXGiport_src_flow|2437|0|3890|0|{0|}1453|1326|}
{2010007001|XXGobject_proto_object|2438|0|3891|0|{}1447|1454|}
{2010212001|XXGvertex_oport_oport|2439|0|3893|0|{0|out|}1454|1455|}
{2010006001|XXGobject_psameas_object|2440|0|3895|0|{metadata|out_metadata|1|0|}1455|1454|}
{2010212001|XXGvertex_oport_oport|2441|0|3896|0|{1|deselect|}1454|1456|}
{2010006001|XXGobject_psameas_object|2442|0|3898|0|{metadata|deselect_metadata|1|0|}1456|1454|}
{2010212001|XXGvertex_oport_oport|2443|0|3899|0|{2|reject|}1454|1457|}
{2010006001|XXGobject_psameas_object|2444|0|3901|0|{metadata|reject_metadata|1|0|}1457|1454|}
{2010212001|XXGvertex_oport_oport|2445|0|3902|0|{3|error|}1454|1458|}
{2010006001|XXGobject_psameas_object|2446|0|3904|0|{metadata|error_metadata|1|0|}1458|1454|}
{2010212001|XXGvertex_oport_oport|2447|0|3905|0|{4|log|}1454|1459|}
{2010006001|XXGobject_psameas_object|2448|0|3907|0|{metadata|log_metadata|1|0|}1459|1454|}
{2010211001|XXGvertex_iport_iport|2449|0|3908|0|{0|in|}1454|1460|}
{2010006001|XXGobject_psameas_object|2450|0|3910|0|{metadata|in_metadata|1|0|}1460|1454|}
{2010006001|XXGobject_psameas_object|2451|0|3911|0|{deselect_metadata|in_metadata|0|0|}1447|1447|}
{2010006001|XXGobject_psameas_object|2452|0|3912|0|{reject_metadata|in_metadata|0|0|}1447|1447|}
{2010601001|XXGgraph_vertex_vertex|2453|0|3913|0|{Filter_by_Expression_2|}1312|1461|}
{2010212001|XXGvertex_oport_oport|2454|0|3915|0|{0|out|}1461|1462|}
{2010213001|XXGoport_dst_flow|2455|0|3917|0|{0|}1462|1320|}
{2010212001|XXGvertex_oport_oport|2456|0|3918|0|{1|deselect|}1461|1463|}
{2010212001|XXGvertex_oport_oport|2457|0|3920|0|{2|reject|}1461|1464|}
{2010212001|XXGvertex_oport_oport|2458|0|3922|0|{3|error|}1461|1465|}
{2010212001|XXGvertex_oport_oport|2459|0|3924|0|{4|log|}1461|1466|}
{2010211001|XXGvertex_iport_iport|2460|0|3926|0|{0|in|}1461|1467|}
{2010214001|XXGiport_src_flow|2461|0|3928|0|{0|}1467|1324|}
{2010007001|XXGobject_proto_object|2462|0|3929|0|{}1461|1468|}
{2010212001|XXGvertex_oport_oport|2463|0|3931|0|{0|out|}1468|1469|}
{2010006001|XXGobject_psameas_object|2464|0|3933|0|{metadata|out_metadata|1|0|}1469|1468|}
{2010212001|XXGvertex_oport_oport|2465|0|3934|0|{1|deselect|}1468|1470|}
{2010006001|XXGobject_psameas_object|2466|0|3936|0|{metadata|deselect_metadata|1|0|}1470|1468|}
{2010212001|XXGvertex_oport_oport|2467|0|3937|0|{2|reject|}1468|1471|}
{2010006001|XXGobject_psameas_object|2468|0|3939|0|{metadata|reject_metadata|1|0|}1471|1468|}
{2010212001|XXGvertex_oport_oport|2469|0|3940|0|{3|error|}1468|1472|}
{2010006001|XXGobject_psameas_object|2470|0|3942|0|{metadata|error_metadata|1|0|}1472|1468|}
{2010212001|XXGvertex_oport_oport|2471|0|3943|0|{4|log|}1468|1473|}
{2010006001|XXGobject_psameas_object|2472|0|3945|0|{metadata|log_metadata|1|0|}1473|1468|}
{2010211001|XXGvertex_iport_iport|2473|0|3946|0|{0|in|}1468|1474|}
{2010006001|XXGobject_psameas_object|2474|0|3948|0|{metadata|in_metadata|1|0|}1474|1468|}
{2010006001|XXGobject_psameas_object|2475|0|3949|0|{reject_metadata|in_metadata|0|0|}1461|1461|}
{2010601001|XXGgraph_vertex_vertex|2476|0|3950|0|{Input_File_Archive|}1312|1475|}
{2010212001|XXGvertex_oport_oport|2477|0|3952|0|{0|read|}1475|1476|}
{2010213001|XXGoport_dst_flow|2478|0|3954|0|{0|}1476|1325|}
{2010007001|XXGobject_proto_object|2479|0|3955|0|{}1475|1477|}
{2010212001|XXGvertex_oport_oport|2480|0|3957|0|{0|read|}1477|1478|}
{2010006001|XXGobject_psameas_object|2481|0|3959|0|{metadata|read_metadata|1|0|}1478|1477|}
{2010601001|XXGgraph_vertex_vertex|2482|0|3960|0|{Merge|}1312|1479|}
{2010212001|XXGvertex_oport_oport|2483|0|3962|0|{0|out|}1479|1480|}
{2010211001|XXGvertex_iport_iport|2484|0|3964|0|{0|in|}1479|1481|}
{2010214001|XXGiport_src_flow|2485|0|3966|0|{0|}1481|1322|}
{2010214001|XXGiport_src_flow|2486|0|3967|0|{1|}1481|1323|}
{2010007001|XXGobject_proto_object|2487|0|3968|0|{}1479|1482|}
{2010212001|XXGvertex_oport_oport|2488|0|3970|0|{0|out|}1482|1483|}
{2010006001|XXGobject_psameas_object|2489|0|3972|0|{metadata|out_metadata|1|0|}1483|1482|}
{2010211001|XXGvertex_iport_iport|2490|0|3973|0|{0|in|}1482|1484|}
{2010006001|XXGobject_psameas_object|2491|0|3975|0|{metadata|in_metadata|1|0|}1484|1482|}
{2010212001|XXGvertex_oport_oport|2492|0|3976|0|{0|out0|}1312|1485|}
{2010216002|XXGoport_binding_oport|2493|0|3978|0|{.5|.5|{0|}15740|}1485|1480|}
{2010601001|XXGgraph_vertex_vertex|2494|0|3979|0|{Version_Log|}1|1486|}
{2010605001|XXGgraph_legend_legend|2495|0|3981|0|{0|}1486|1487|}
{2010241001|XXGlegend_face_face|2496|0|3983|0|{}1487|1488|}
{2010605001|XXGgraph_legend_legend|2497|0|3985|0|{1|}1486|1489|}
{2010241001|XXGlegend_face_face|2498|0|3987|0|{}1489|1490|}
{2010605001|XXGgraph_legend_legend|2499|0|3989|0|{2|}1486|1491|}
{2010241001|XXGlegend_face_face|2500|0|3991|0|{}1491|1492|}
{2010605001|XXGgraph_legend_legend|2501|0|3993|0|{3|}1486|1493|}
{2010241001|XXGlegend_face_face|2502|0|3995|0|{}1493|1494|}
{2010605001|XXGgraph_legend_legend|2503|0|3997|0|{4|}1486|1495|}
{2010241001|XXGlegend_face_face|2504|0|3999|0|{}1495|1496|}
{2010605001|XXGgraph_legend_legend|2505|0|4001|0|{5|}1486|1497|}
{2010241001|XXGlegend_face_face|2506|0|4003|0|{}1497|1498|}
{2010605001|XXGgraph_legend_legend|2507|0|4005|0|{6|}1486|1499|}
{2010241001|XXGlegend_face_face|2508|0|4007|0|{}1499|1500|}
{2010605001|XXGgraph_legend_legend|2509|0|4009|0|{7|}1486|1501|}
{2010241001|XXGlegend_face_face|2510|0|4011|0|{}1501|1502|}
{2010605001|XXGgraph_legend_legend|2511|0|4013|0|{8|}1486|1503|}
{2010241001|XXGlegend_face_face|2512|0|4015|0|{}1503|1504|}
{2010605001|XXGgraph_legend_legend|2513|0|4017|0|{9|}1486|1505|}
{2010241001|XXGlegend_face_face|2514|0|4019|0|{}1505|1506|}
{2010605001|XXGgraph_legend_legend|2515|0|4021|0|{10|}1486|1507|}
{2010241001|XXGlegend_face_face|2516|0|4023|0|{}1507|1508|}
{2010605001|XXGgraph_legend_legend|2517|0|4025|0|{11|}1486|1509|}
{2010241001|XXGlegend_face_face|2518|0|4027|0|{}1509|1510|}
{2010109001|XXGobject_property_value|2519|0|4029|0|{0|TrackingThumbprint|72|}1|1511|}
