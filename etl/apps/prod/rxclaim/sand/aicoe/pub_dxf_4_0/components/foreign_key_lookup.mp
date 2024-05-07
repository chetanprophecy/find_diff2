@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|259|rel_count|422|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|TARGET|$[""]|3|9|RFK|@{0|}}
{30001002|XXparameter|FK_MAP||3|9|FK|@{0|}}
{30001002|XXparameter|IDS_TABLE_PROPERTIES_FILE_CONTENT|$[read_file(PUB_DXF_META + "/ids_table_properties.dat")]|3|9|K|Read the ids_table_properties file and cache it so any calls to functions do not have to go back to the file system. This is for startup and GDE performance.|{0|}}
{30001002|XXparameter|IDS_TABLE_PROPERTIES_FILE_LINES|$[ begin
  /* Retain only the entries that will be required for this instance of the subgraph, i.e. the TARGET, and any tables required for FSKs */

  let string("\\x01")[] required_tables = [vector];
  if(not is_blank(TARGET)) required_tables = vector_append(required_tables, TARGET);
  for(let map in re_split_no_empty(FK_MAP, "[\\r\\n]+"))
    required_tables = vector_append(required_tables, string_split(map, "\|")[2]);

  result :: for(let line in string_split_no_empty(IDS_TABLE_PROPERTIES_FILE_CONTENT, "\\n")):
              if(not starts_with(line, "#") and string_prefix(line, string_index(line, "\|")-1) member required_tables) line;
  //result :: for(let line in string_split_no_empty(IDS_TABLE_PROPERTIES_FILE_CONTENT, "\\n")):string_prefix(line, string_index(line, "\|")-1) ;
end ]|3|9|K|Make a vector of all lines that are required for this run. Then we override the ids_table_properties functions to use this vector instead of reading the file from disk|{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_DML/generic_data_types.dml";

/*
   The functions from ids_table_properties.xfr are all replicated here after reading that fxr file,
   and the function that reads from the properties file (get_all_ids_table_properties) is overridden
   to use the content of a parameter rather than read the properties meta file from the disk for
   each function call.
*/

$[ begin
  let pkg = read_package(PUB_DXF_XFR + "/ids/ids_table_properties.xfr");
  let string("\\x01")[] ret = [vector];
  for(let pc in pkg.members)
    if(pc.form == "transform")
      if(pc.name == "get_all_ids_table_properties")
      begin
        let string("\\x01") val = pc.value;
        val = string_replace(val, "read_file(get_ids_table_properties_file_path())", string_representation(""));
        val = string_replace(val, "string_split_no_empty(contents, \\"\\\\n\\")", string_representation(IDS_TABLE_PROPERTIES_FILE_LINES));
        ret = vector_append(ret, val);
      end
      else
        ret = vector_append(ret, pc.value);
  result :: string_join(ret, "\\n");
end]

/*
fk_map_type has been defined to interpret the contents of the "FK_MAP" parameter.
*/
type fk_map_type =
record
  string("\|") fsk_field;
  string("\|") nk_fields;
  string("\|") sk_lookup_name;
end;

/*
table_type_info_type has been defined to interpret the contents of the "TABLE_TYPE_INFO" parameter.
*/
type placeholder_flag_info =
record
  string("\|") table_name;
  string("\|") placeholder_flag;
end;|3|9|RK|Provides functions to use in PDL.|{0|}}
{30001002|XXparameter|FK_MAP_REC_VEC|$[ begin
  let fk_map_lines = re_split_no_empty(FK_MAP, "[\\r\\n]+");
  result :: for ( let string("") line in fk_map_lines ) : reinterpret_as(fk_map_type, line);
end ]|3|9|K|@{0|}}
{30001002|XXparameter|ILM_NAME|$[ ILM_NAME ]|3|9|RFK|@{0|}}
{30001002|XXparameter|DIM_INFO||3|9|FK|@{0|}}
{30001002|XXparameter|CUSTOM_MLKP_IDS_LIST|$[CUSTOM_MLKP_IDS_LIST]|3|9|FK|@{0|}}
{30001002|XXparameter|MLKP_FK_MAP|$[
begin
let string("")[int] custom_mlkp_vec_list=if(!is_blank(CUSTOM_MLKP_IDS_LIST)) string_split(CUSTOM_MLKP_IDS_LIST,",") else [vector];
//Parameter was added to remove custom ids ICFF SK lookup from below list .
let string("")[int] v_final_out_map_string_vec=allocate_with_defaults();
let int i=0;

let string("")[int] out_map_string_vec = [vector];
let string("")[1] blank_element_vec = [vector ""];
let string("") one_map = "";		
let string("") storage_type = "";

for(let fk_map_type map in FK_MAP_REC_VEC) begin
storage_type = get_ids_table_properties(map.sk_lookup_name).storage_type;
if(is_blank(storage_type)) force_error("ERROR: No entry found for the table " + map.sk_lookup_name + " in the ids_table_properties meta file");
one_map = if((string_upcase(storage_type) == "ICFF") && (map.sk_lookup_name not member custom_mlkp_vec_list )  ) map.fsk_field + "\|" + map.nk_fields + "\|" + map.sk_lookup_name + "\|"
                        else "";
out_map_string_vec = vector_append(out_map_string_vec, one_map); 
end
//v_final_out_map_string_vec=if(!is_blank(CUSTOM_MLKP_IDS_LIST)) for vector_difference(out_map_string_vec,custom_mlkp_vec_list) else out_map_string_vec ;
result :: string_join(vector_difference(out_map_string_vec, blank_element_vec), "\\n");
end
]|3|9|K|@{0|}}
{30001002|XXparameter|MLKP_FK_MAP_REC_VEC|$[ begin
  let fk_map_lines = re_split_no_empty(MLKP_FK_MAP, "[\\r\\n]+");
  result :: for ( let string("") line in fk_map_lines ) : reinterpret_as(fk_map_type, line);
end ]|3|9|K|@{0|}}
{30001002|XXparameter|MLKP_PLACEHOLDER_FLAG|$[
begin
        let fk_map_type[int] fk_maps = vector_sort(MLKP_FK_MAP_REC_VEC, \{sk_lookup_name\});
        let string("")[int] placeholder_flag_vec = [vector];

        for(let fk_map_type map in fk_maps) begin
                placeholder_flag_vec = vector_append(placeholder_flag_vec, map.sk_lookup_name + "\|" + (string(""))(decimal(""))do_create_placeholder(map.sk_lookup_name));
        end

        result :: string_join(placeholder_flag_vec, "\\n");
end
]|3|9|RK|@{0|}}
{30001002|XXparameter|MICFF_LKPDIR|$[PUB_DATAHUB_MFS_LOOKUP + "/ids/"]|3|9|RK|@{0|}}
{30001002|XXparameter|SLKP_FK_MAP|$[
begin

let string("")[int] out_map_string_vec = [vector];
let string("")[1] blank_element_vec = [vector ""];
let string("") one_map = "";		
let string("") storage_type = "";

for(let fk_map_type map in FK_MAP_REC_VEC) begin
storage_type = get_ids_table_properties(map.sk_lookup_name).storage_type;
if(is_blank(storage_type)) force_error("ERROR: No entry found for the table " + map.sk_lookup_name + " in the ids_table_properties meta file");
one_map = if(string_upcase(storage_type) == "REGULAR") map.fsk_field + "\|" + map.nk_fields + "\|" + map.sk_lookup_name + "\|"
                        else "";
out_map_string_vec = vector_append(out_map_string_vec, one_map); 
end

result :: string_join(vector_difference(out_map_string_vec, blank_element_vec), "\\n");
end
]|3|9|K|@{0|}}
{30001002|XXparameter|SLKP_FK_MAP_REC_VEC|$[ begin
  let fk_map_lines = re_split_no_empty(SLKP_FK_MAP, "[\\r\\n]+");
  result :: for ( let string("") line in fk_map_lines ) : reinterpret_as(fk_map_type, line);
end ]|3|9|K|@{0|}}
{30001002|XXparameter|SLKP_LKPDIR|$[PUB_DATAHUB_DXF_LOOKUP + "/ids/"]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_DML_FILE|$[
AI_DML + "/split." + string_split(TARGET, ".")[0] + "/split." + TARGET + ".dml"
]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_DML|$[read_type(TARGET_DML_FILE)]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_SUBRECORD_NAME|$[
begin
let dml_field_info_vec target_dml_info = record_info(TARGET_DML);
let string("") subrecord_name_vec = "";
for(let dml_field_info field in target_dml_info) subrecord_name_vec = if(!is_null(field.typename) and starts_with(field.typename, "split_")) field.name else subrecord_name_vec;
result :: subrecord_name_vec;
end;
]|3|9|RK|@{0|}}
{30001002|XXparameter|UNIQUE_RECORD_IDENTIFIER_KEYS|\{record_nbr\}|19|9|R|Field to partition on|{0|}}
{30001002|XXparameter|IDENTIFIER_FIELDS_DML|/*
This parameter creates output DML with "parition_nbr" and "record_nbr" fields added 
to the split file DML. These fields are used as unique record identifiers which will
be useful to merge the split records later in the component.
*/
$[
begin

let dml_include_vec generic_types = [vector $PUB_DXF_DML + "/generic_data_types.dml"];
let string("") micff_slkp_split_dml = TARGET_DML;   
let dml_field_info_item_vec field_name_info = record_info_item(micff_slkp_split_dml, "name");

let decimal("") index = vector_search(field_name_info, "newline");

micff_slkp_split_dml = if(index != -1) remove_fields(micff_slkp_split_dml, [vector "newline"]) else micff_slkp_split_dml;

//Add additional required fields
micff_slkp_split_dml = add_fields(micff_slkp_split_dml, [vector          
                make_field("dim_match_stat", "record\\n    string(\\"\\") dimension;\\n    string(\\"\\") nk_subrec;\\n    decimal(\\"\\") dim_match_flag;\\n    hash_key_combine_type fsk_hk;\\n  end[int]", include_vec = [vector $PUB_DXF_DML + "/generic_data_types.dml"])
                ,make_field("partition_nbr", "decimal(\\"\\")", comment = "Unique record identifier field containing partition number of input record.", include_vec = [vector $PUB_DXF_DML + "/generic_data_types.dml"])
                ,make_field("record_nbr", "decimal(\\"\\")", comment = "Unique record identifier field containing record number of input record.", include_vec = [vector $PUB_DXF_DML + "/generic_data_types.dml"])
                ,make_field("newline", "string(1)", "\\"\\\\n\\"")
        ], generic_types);
                        

result :: if(string_index(micff_slkp_split_dml, "metadata type") == 0) '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\nmetadata type = \\n' + micff_slkp_split_dml + ";" 
                else '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\n' + micff_slkp_split_dml;

end
]|7|9|RK||{0|}}
{30001002|XXparameter|MLKP_SPLIT_RFMT_DML|/*
This parameter creates output DML reduced fields. It keeps only the FSK fields
coming from the split file and drops the rest of the fields. It adds a field,
"dim_match_stat" which is a vector of a user defined record type to hold some 
information about the dimension from which lookup needs to be perfomed such as
the match status, the table type, the hk value and the dimension name.
*/
$[
begin
let dml_include_vec generic_types = [vector $PUB_DXF_DML + "/generic_data_types.dml"];
let string("") norm_dml = "record\\nend";

for(let fk_map_type map in MLKP_FK_MAP_REC_VEC) begin
        norm_dml = add_field(norm_dml, string_split(map.fsk_field, ".")[1], "decimal('\\\\x01')", "", "", 0, NULL, generic_types);       
end

//Add additional required fields
norm_dml = add_fields(norm_dml, [vector
                        make_field("dim_match_stat", "record\\n    string(\\"\\") dimension;\\n    string(\\"\\") nk_subrec;\\n    decimal(\\"\\") dim_match_flag;\\n    hash_key_combine_type fsk_hk;\\n  end[int]", include_vec = generic_types)
                        ,make_field("fsk_field_vec", "string(\\"\\")[int]", include_vec = generic_types)
                        ,make_field("partition_nbr", "decimal(\\"\\")", include_vec = generic_types)
                        ,make_field("record_nbr", "decimal(\\"\\")", include_vec = generic_types)
                        ,make_field("newline", "string(1)", "\\"\\\\n\\"", include_vec = generic_types)
                        ], generic_types);


result :: 'include "~$PUB_DXF_DML/generic_data_types.dml";\\n\\nmetadata type=' + norm_dml + ';';
end
]|7|9|RF||{0|}}
{30001002|XXparameter|MLKP_SPLIT_RFMT_XFR|/*
This parameter generates the xfr which populates the fields in the DML created
by the parameter "MICFF_SPLIT_RFMT_DML".
*/
$[
begin

let string("") include_type = '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\n';
let dml_include_vec generic_types = [vector $PUB_DXF_DML + "/generic_data_types.dml"];
let string("") rfmt_xfr = make_transform("reformat", [vector make_arg("in")], [vector make_arg("out")]);
let fk_map_type[int] fk_maps = vector_sort(MLKP_FK_MAP_REC_VEC, \{sk_lookup_name\});
let decimal("") index_of_prev_map = -1;
rfmt_xfr = add_local(rfmt_xfr, "dim_match_stat", "record\\n    string(\\"\\") dimension;\\n    string(\\"\\") nk_subrec;\\n    decimal(\\"\\") dim_match_flag;\\n    hash_key_combine_type fsk_hk;\\n  end[int]", 
                        "[vector]", include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "fsk_hk_vec", "hash_key_combine_type[int]", 
                        "[vector]", include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "fsk_field_vec", "string(\\"\\")[int]", 
                        "[vector]", include_vec = generic_types);

//Assignment of hash_key_details field
for(let fk_map_type map in fk_maps) begin

        index_of_prev_map = index_of(map) - 1;

        rfmt_xfr = add_local(rfmt_xfr, string_split(map.fsk_field, ".")[1] + "_hk", "hash_key_combine_type", 
                        "reinterpret_as(hash_key_combine_type, hash_value(in, '\{" + map.nk_fields + "\}', 'murmur'))",
                        include_vec = generic_types);
                        
        /*Check if this is not the first iteration of the current loop*/
        if(index_of_prev_map != -1) 
                /*If hk value for current and previous iteration is the same, populate only fsk_field_vec, else populate both fsk_field_vec and dim_match_stat.
                This is to ensure that dim_match_stat only gets populated for unique dimensions.*/
                rfmt_xfr = add_statement(rfmt_xfr, "if('" + map.sk_lookup_name + "' == '" + fk_maps[index_of_prev_map].sk_lookup_name + "' and " + string_split(map.fsk_field, ".")[1] + "_hk == " + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1] + "_hk)
                                                      fsk_field_vec[length_of(fsk_field_vec)-1] = string_concat(fsk_field_vec[length_of(fsk_field_vec)-1], ';', '" + map.fsk_field + "');
                                                    else begin 
                                                      fsk_field_vec = vector_append(fsk_field_vec,'" + map.fsk_field + "');
                                                      dim_match_stat = vector_append(dim_match_stat, [record dimension '" + map.sk_lookup_name + "' nk_subrec '" + map.nk_fields + "' dim_match_flag 0 fsk_hk " + string_split(map.fsk_field, ".")[1] + "_hk]);
                                                    end;", include_vec = generic_types);
        else begin
        /*If this is the first iteration of current loop, populate both fsk_field_vec and dim_match_stat.*/
                rfmt_xfr = add_statement(rfmt_xfr, "fsk_field_vec = vector_append(fsk_field_vec,'" + map.fsk_field + "');", include_vec = generic_types);
                rfmt_xfr = add_statement(rfmt_xfr, "dim_match_stat = vector_append(dim_match_stat, [record dimension '" + map.sk_lookup_name + "' nk_subrec '" + map.nk_fields + "' dim_match_flag 0 fsk_hk " + string_split(map.fsk_field, ".")[1] + "_hk]);", include_vec = generic_types);
        end
        
end

rfmt_xfr = add_rule(rfmt_xfr, "out.dim_match_stat", 
                        "dim_match_stat", 
                        include_vec = generic_types);

rfmt_xfr = add_rule(rfmt_xfr, "out.fsk_field_vec", 
                        "fsk_field_vec", 
                        include_vec = generic_types);

if(length_of(fk_maps) > 0)
rfmt_xfr = add_rule(rfmt_xfr, "out.*", 
                        "in." + string_split(fk_maps[0].fsk_field,".")[0] + ".*", priority = 1,
                        include_vec = generic_types);
                        
rfmt_xfr = add_rule(rfmt_xfr, "out.*", 
                        "in.*", priority = 2,
                        include_vec = generic_types);

result :: string_concat(include_type, rfmt_xfr);

end
]|8|9|FO|Reformat transform|{0|}}
{30001002|XXparameter|MLKP_MULTIPLY_DML|/*
This parameter creates the multiply DML which is the output of the Normalize
component in the Multifile lookup subgraph. The DML contains the same fields as its
input DML, which points to the parameter, "MICFF_SPLIT_RFMT_DML", except that
the vector in "MICFF_SPLIT_RFMT_DML" is normalized here.
*/
$[
begin
let dml_include_vec generic_types = [vector $PUB_DXF_DML + "/generic_data_types.dml"];
let string("") norm_dml = "record\\nend";

for(let fk_map_type map in MLKP_FK_MAP_REC_VEC) begin
        norm_dml = add_field(norm_dml, string_split(map.fsk_field, ".")[1], 'decimal("\\\\x01")', include_vec = generic_types);       
end

//Add additional required fields
norm_dml = add_fields(norm_dml, [vector
                        make_field("dim_match_stat", "record\\n    string(\\"\\") dimension;\\n    string(\\"\\") nk_subrec;\\n    decimal(\\"\\") dim_match_flag;\\n    hash_key_combine_type fsk_hk;\\n  end", include_vec = generic_types)
                        ,make_field("fsk_field", "string(\\"\\")", include_vec = generic_types)
                        ,make_field("partition_nbr", "decimal(\\"\\")", include_vec = generic_types)
                        ,make_field("record_nbr", "decimal(\\"\\")", include_vec = generic_types)
                        ,make_field("newline", "string(1)", "\\"\\\\n\\"", include_vec = generic_types)
                        ], generic_types);


result :: 'include "~$PUB_DXF_DML/generic_data_types.dml";\\n\\nmetadata type=' + norm_dml + ';';
end
]|7|9|RF||{0|}}
{30001002|XXparameter|MLKP_NORM_XFR|/*
This is used in the normalize component in the Multifile lookup subgraph.
*/

out::length(in)=
begin
  out::length_of(in.dim_match_stat); /*Length is same as the number of entries in the "MLKP_FK_MAP" parameter*/
end;

out::normalize(in, index)=
begin
  out.dim_match_stat :: in.dim_match_stat[index];
  out.fsk_field :: in.fsk_field_vec[index];
  out.* :: in.*;
end;|8|1|RFOl|Required and optional DML functions|{0|}}
{30001002|XXparameter|MLKP_RFMT_XFR|/*
This parameter generates the xfr for the Reformat compoent in the Multifile lookup subgraph,
which looks up the "hash_key" value being received from the input in the corresponding 
dimension, the name of which is available in the input field, "dimension". The looked up
value is assigned to the corresponding surrogate key, the name of which is available in 
the input field "sk_field_name".
*/


/*lookup_not_loaded()) 
     current_lookup = lookup_load(this_partition_path("/etl/data/dev//mfs/mfs_4way/aicoe/pub_datahub/lookup/rxclaim_bc/ids/ids_common/one/d_cag.dat.gz"),this_partition_path("/etl/data/dev//mfs/mfs_4way/aicoe/pub_datahub/lookup/rxclaim_bc/ids/ids_common/one/d_cag.idx"),"ICFF_TEMPLATE_IDS" );  
 lookup_record_value = first_defined(lookup_last(current_lookup, "ICFF_TEMPLATE_IDS", in.dxf_hk_part1),allocate_with_defaults() );
 */
$[
begin

let string("") include_type = '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\ninclude "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";\\n\\n';
let string("") lkp_global = "";
let decimal("") index_of_prev_map = -1;
let dml_include_vec generic_types = [vector $PUB_DXF_DML + "/generic_data_types.dml", $PUB_DXF_XFR + "/ids/ids_table_properties.xfr"];
let string("") rfmt_xfr = make_transform("reformat", [vector make_arg("in")], [vector make_arg("out")]);

let fk_map_type[int] fk_maps = vector_sort(MLKP_FK_MAP_REC_VEC, \{sk_lookup_name\});

lkp_global = lkp_global + 'let string("")[int] dim_placeholder_flags_vec = string_split("' + MLKP_PLACEHOLDER_FLAG + '", "\\\\n");\\n' + 
             'let string("")[int] dimenstion_names_vec = for(let flag in dim_placeholder_flags_vec) : string_split(flag, "\|")[0];\\n' + 
             'let decimal("")[int] placeholder_flags_vec = for(let flag in dim_placeholder_flags_vec) : string_split(flag, "\|")[1];\\n';

rfmt_xfr = add_local(rfmt_xfr, "flag", "decimal(\\"\\")", 
                        "1", "Flag to hold indictor of non-matching lookup.", generic_types);
rfmt_xfr = add_local(rfmt_xfr, "count", "decimal(\\"\\")", 
                        "0", "Variable to hold count of lookup matches.", include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "lkp_record", "xref_lookup_type", comment = "Variable to hold looked up record.", include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "plchldr_dim_index", "decimal(\\"\\\\x01\\")", 'vector_search(dimenstion_names_vec, in.dim_match_stat.dimension)',       
                        comment = "Variable to hold the index of placeholder flag information.", include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "surogate_key", "decimal(\\"\\\\x01\\")", '((placeholder_flags_vec[plchldr_dim_index])?"0":"-1")',       
                        comment = "Variable to hold the looked up surrogate key.", include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "fsk_vec", "string(\\"\\")[int]", 
                        "string_split(in.fsk_field, ';')", "Vector to hold multiple FSKs mapped to the same dimension.", generic_types);
                        
for(let fk_map_type map in fk_maps) begin
  index_of_prev_map = index_of(map) - 1;
  
  rfmt_xfr = add_local(rfmt_xfr, string_split(map.fsk_field, ".")[1] + "_found", "decimal(\\"\\")", 
                        '"' + map.fsk_field + '" member fsk_vec', "Flag set to true if FSK field is present in FSK_VEC", generic_types);
  
  lkp_global = lkp_global + '\\nlet lookup_identifier_type ' + string_split(map.fsk_field, ".")[1] + '_lkp_id = lookup_not_loaded();\\n\\n';

  if(index_of_prev_map == -1) begin
        rfmt_xfr = add_statement(rfmt_xfr, '  if(' + string_split(map.fsk_field, ".")[1] + '_found && ' + string_split(map.fsk_field, ".")[1] + '_lkp_id == lookup_not_loaded()) begin ' + string_split(map.fsk_field, ".")[1] + '_lkp_id = lookup_load(this_partition_path("' + MICFF_LKPDIR + '" + string_split(in.dim_match_stat.dimension, ".")[0] + "/xref/xref." + string_split(in.dim_match_stat.dimension, ".")[1] + ".dat.gz"),
                               this_partition_path("' + MICFF_LKPDIR + '" + string_split(in.dim_match_stat.dimension, ".")[0] + "/xref/xref." + string_split(in.dim_match_stat.dimension, ".")[1] + ".idx"), "ICFF HK UK Lookup Template", -1); end', include_vec = generic_types);
  end
  else begin
        rfmt_xfr = add_statement(rfmt_xfr, '  if("' + map.sk_lookup_name + '" == "' + fk_maps[index_of_prev_map].sk_lookup_name + '" && ' + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1] + '_found)' + 
                string_split(map.fsk_field, ".")[1] + '_lkp_id = ' + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1] + '_lkp_id;
  else begin
    if(' + string_split(map.fsk_field, ".")[1] + '_found && ' + string_split(map.fsk_field, ".")[1] + '_lkp_id == lookup_not_loaded()) begin ' + string_split(map.fsk_field, ".")[1] + '_lkp_id = lookup_load(this_partition_path("' + MICFF_LKPDIR + '" + string_split(in.dim_match_stat.dimension, ".")[0] + "/xref/xref." + string_split(in.dim_match_stat.dimension, ".")[1] + ".dat.gz"),
      this_partition_path("' + MICFF_LKPDIR + '" + string_split(in.dim_match_stat.dimension, ".")[0] + "/xref/xref." + string_split(in.dim_match_stat.dimension, ".")[1] + ".idx"), "ICFF HK UK Lookup Template", -1); end
  end', include_vec = generic_types);
  end
end

for(let fk_map_type map in fk_maps) begin
  index_of_prev_map = index_of(map) - 1;
  if(index_of_prev_map == -1) begin                             
        rfmt_xfr = add_statement(rfmt_xfr, "  if(" + string_split(map.fsk_field, ".")[1] + "_found) begin 
        count = lookup_count(" + string_split(map.fsk_field, ".")[1] + "_lkp_id, 'ICFF HK UK Lookup Template', in.dim_match_stat.fsk_hk.dxf_hk_part1);
        if(count != 0) begin 
          lkp_record = lookup_last(" + string_split(map.fsk_field, ".")[1] + "_lkp_id, 'ICFF HK UK Lookup Template', in.dim_match_stat.fsk_hk.dxf_hk_part1);
          if(lkp_record.dxf_hk_part2 == in.dim_match_stat.fsk_hk.dxf_hk_part2) begin
            surogate_key = lkp_record.dxf_sk;
            flag = 0;
          end
          else begin block " + string_split(map.fsk_field, ".")[1] + "_exact_rec
            for(let int i = 0, i < count - 1) begin 
              lkp_record = lookup_previous(" + string_split(map.fsk_field, ".")[1] + "_lkp_id, 'ICFF HK UK Lookup Template');
              if(lkp_record.dxf_hk_part2 == in.dim_match_stat.fsk_hk.dxf_hk_part2) begin
                surogate_key = lkp_record.dxf_sk;
                flag = 0;
                exit " + string_split(map.fsk_field, ".")[1] + "_exact_rec;
              end;
            end;
          end block " + string_split(map.fsk_field, ".")[1] + "_exact_rec
        end
        else flag = 1;
      end", include_vec = generic_types);
  end
  else begin
    //Actual lookup statement
        rfmt_xfr = add_statement(rfmt_xfr, "  if('" + map.sk_lookup_name + "' != '" + fk_maps[index_of_prev_map].sk_lookup_name + "' \|\| not " + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1] + "_found) begin
      if(" + string_split(map.fsk_field, ".")[1] + "_found) begin 
        count = lookup_count(" + string_split(map.fsk_field, ".")[1] + "_lkp_id, 'ICFF HK UK Lookup Template', in.dim_match_stat.fsk_hk.dxf_hk_part1);
        if(count != 0) begin 
          lkp_record = lookup_last(" + string_split(map.fsk_field, ".")[1] + "_lkp_id, 'ICFF HK UK Lookup Template', in.dim_match_stat.fsk_hk.dxf_hk_part1);
          if(lkp_record.dxf_hk_part2 == in.dim_match_stat.fsk_hk.dxf_hk_part2) begin
            surogate_key = lkp_record.dxf_sk;
            flag = 0;
          end
          else begin block " + string_split(map.fsk_field, ".")[1] + "_exact_rec
            for(let int i = 0, i < count - 1) begin 
              lkp_record = lookup_previous(" + string_split(map.fsk_field, ".")[1] + "_lkp_id, 'ICFF HK UK Lookup Template');
              if(lkp_record.dxf_hk_part2 == in.dim_match_stat.fsk_hk.dxf_hk_part2) begin
                surogate_key = lkp_record.dxf_sk;
                flag = 0;
                exit " + string_split(map.fsk_field, ".")[1] + "_exact_rec;
              end;
            end;
          end block " + string_split(map.fsk_field, ".")[1] + "_exact_rec
        end
        else flag = 1;
      end
    end", include_vec = generic_types); 
  end
end

//Surrogate Key assignment
for(let fk_map_type map in fk_maps) 
        rfmt_xfr = add_rule(rfmt_xfr, "out." + string_split(map.fsk_field, ".")[1], 
                        "if(" + string_split(map.fsk_field, ".")[1] + "_found) surogate_key 
                        else in." + string_split(map.fsk_field, ".")[1], 
                        comment = "Assignement of looked up universal key to the appropriate field.", include_vec = generic_types);

rfmt_xfr = add_rule(rfmt_xfr, "out.dim_match_stat", 
                        "[record dimension in.dim_match_stat.dimension nk_subrec in.dim_match_stat.nk_subrec dim_match_flag flag fsk_hk in.dim_match_stat.fsk_hk]", 1, include_vec = generic_types);                       

rfmt_xfr = add_rule(rfmt_xfr, "out.*", 
                        "in.*", include_vec = generic_types);

result :: string_concat(include_type, "\\n", lkp_global, rfmt_xfr);

end
]|8|9|RFO|Reformat transform|{0|}}
{30001002|XXparameter|MLKP_ROLLUP_XFR|/*
This parameter creates the xfr for the Rollup component in the Multifile Lookup subgraph 
which aggregates the multiplied records which represent the same entity, by grouping
on the unique record identifier fields, i.e. "record_nbr"(additional field created 
and populated in Normalize).
Note: The field "partition_nbr" which is also added for unqiue identification of the 
record, need not be used, since the records are being repartitioned as per their 
original partitions using Partition by Expression component before this Rollup.
*/
$[
begin

//Temporary type definition
let string("") include_type = 
'\\ninclude "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";\\n\\n';
let dml_include_vec generic_types = [vector $PUB_DXF_XFR + "/ids/ids_table_properties.xfr"];
let fk_map_type[int] fk_maps = vector_sort(MLKP_FK_MAP_REC_VEC, \{sk_lookup_name\});
let string("") globals = 'let string("")[int] dim_placeholder_flags_vec = string_split("' + MLKP_PLACEHOLDER_FLAG + '", "\\\\n");\\n' + 
             'let string("")[int] dimenstion_names_vec = for(let flag in dim_placeholder_flags_vec) : string_split(flag, "\|")[0];\\n' + 
             'let decimal("")[int] placeholder_flags_vec = for(let flag in dim_placeholder_flags_vec) : string_split(flag, "\|")[1];\\n';

let string("") rlp_xfr = make_transform("rollup", [vector make_arg("in")], [vector make_arg("out")]);

rlp_xfr = add_local(rlp_xfr, "plchldr_dim_index", "decimal(\\"\\\\x01\\")", 'vector_search(dimenstion_names_vec, in.dim_match_stat.dimension)',       
                        comment = "Variable to hold the index of placeholder flag information.", include_vec = generic_types);

rlp_xfr = add_local(rlp_xfr, "fsk_vec", "string(\\"\\")[int]", 
                        "string_split(in.fsk_field, ';')", "Vector to hold multiple FSKs mapped to the same dimension.");

rlp_xfr = add_local(rlp_xfr, "is_unmatched_and_placeholder", "", 
                        "placeholder_flags_vec[plchldr_dim_index] && in.dim_match_stat.dim_match_flag == 1", "Flag that signifies whether there is a mismatch and a placeholder is required.");

rlp_xfr = add_rule(rlp_xfr, "out.dim_match_stat", 
                        "accumulation(in.dim_match_stat, is_unmatched_and_placeholder)", include_vec = generic_types);
rlp_xfr = add_rule(rlp_xfr, "out.fsk_field_vec", 
                        "accumulation(in.fsk_field, is_unmatched_and_placeholder)", , include_vec = generic_types);
        
for(let fk_map_type map in fk_maps) 
rlp_xfr = add_rule(rlp_xfr, "out." + string_split(map.fsk_field, ".")[1], 
                        "first(in." + string_split(map.fsk_field, ".")[1] + ", vector_search(fsk_vec, '" + map.fsk_field + "') != -1)");
                        
rlp_xfr = add_rule(rlp_xfr, "out.*", "in.*");

result :: string_concat(include_type, "\\n", globals, "\\n", rlp_xfr);
end
]|8|9|RFO|Required and optional DML functions|{0|}}
{30001002|XXparameter|MLKP_SK_COUNT|$[ (decimal(""))length_of(MLKP_FK_MAP_REC_VEC) ]|3|9|K|@{0|}}
{30001002|XXparameter|SLKP_RFMT_XFR|/*
This parameter generates the xfr for the Reformat compoent in the Serial Lookup Subgraph,
which looks the "hash_key" value being calculated locally in the corresponding dimension
and assigns the looked up "universal key" value to the corresponding surrogate key.
*/
$[
begin

let string("") include_type = '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\n';
let dml_include_vec generic_types = [vector $PUB_DXF_DML + "/generic_data_types.dml"];
let string("") rfmt_xfr = make_transform("reformat", [vector make_arg("in")], [vector make_arg("out")]);
let string("") fk_map_parameter = SLKP_FK_MAP;
let fk_map_type[int] fk_maps = vector_sort(SLKP_FK_MAP_REC_VEC, \{sk_lookup_name\});
let string("") globals = "";
let dml_field_info_vec target_dml_info = [vector];
let dml_field_info_vec date_rec_info = [vector];
let string('') date_format = '';
let string('') date_field_name = '';
let decimal('') uk_default = '';
let decimal('') index_of_prev_map = '';
let placeholder_flag = 0;

rfmt_xfr = add_local(rfmt_xfr, "count", "decimal(\\"\\")", 
                        include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "lkp_record", "xref_serial_lookup_type", comment = "Variable to hold the looked up record", include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "dim_match_stat_rec", "  record\\n    string(\\"\\") dimension;\\n    string(\\"\\") nk_subrec;\\n    decimal(\\"\\") dim_match_flag;\\n    hash_key_combine_type fsk_hk;\\n  end", include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "dim_match_stat_vec", "  record\\n    string(\\"\\") dimension;\\n    string(\\"\\") nk_subrec;\\n    decimal(\\"\\") dim_match_flag;\\n    hash_key_combine_type fsk_hk;\\n  end[int]", "[vector]", include_vec = generic_types);


for(let fk_map_type map in fk_maps) begin

        index_of_prev_map = index_of(map) - 1;
        rfmt_xfr = add_local(rfmt_xfr, string_split(map.fsk_field, ".")[1] + "_surrogate_key", "decimal(\\"\\")",(string("")) uk_default, include_vec = generic_types);                
                
        /*Check if current lookup is d_date.*/
        if(!ends_with(map.sk_lookup_name, "d_date")) begin

                /*Obtain placeholder flag for current lookup file to identify if a placeholder record needs to be generated.*/
                placeholder_flag = do_create_placeholder(map.sk_lookup_name);
                uk_default = (placeholder_flag?0:-1);

                rfmt_xfr = add_local(rfmt_xfr, string_split(map.fsk_field, ".")[1] + "_hash_key", "hash_key_combine_type", 
                        "reinterpret_as(hash_key_combine_type, hash_value(in, '\{" + map.nk_fields + "\}', 'murmur'))", "Local variables of the to hold hash value.", include_vec = generic_types);
                
                /*Check if current iteration is not the first iteration of this loop, and if lookup name for current iteration is same as that of the previous iteration.*/
                if(index_of_prev_map != -1 and map.sk_lookup_name == fk_maps[index_of_prev_map].sk_lookup_name)
                        /*If the lookup name of current and previous iteration is the same, populate the current iteration's lookup identifier from the previous iteration's lookup identifier.
                        This will eliminate another call to lookup load for the same lookups.*/
                        globals = string_concat(globals, "let lookup_identifier_type " + string_split(map.fsk_field, ".")[1] + "_lkp_identifier = " + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1] + "_lkp_identifier;\\n");
                else
                        /*If the lookup name of current and previous iteration is different, generate the lookup load statement for the new lookup table.*/
                        globals = if(DXF_SERVER_ARCHITECTURE == "SMP") string_concat(globals, "let lookup_identifier_type " + string_split(map.fsk_field, ".")[1] + "_lkp_identifier = lookup_load('" + SLKP_LKPDIR + "/" + string_split(map.sk_lookup_name, ".")[0] + "/xref/xref." +  string_split(map.sk_lookup_name, ".")[1] + ".dat', '" + SLKP_LKPDIR + "/" + string_split(map.sk_lookup_name, ".")[0] + "/xref/xref." +  string_split(map.sk_lookup_name, ".")[1] + ".idx', 'Regular HK UK Lookup Template');\\t\\t/*Local variables of the to hold identifier for lookup.*/\\n")
                                  else string_concat(globals, "let lookup_identifier_type " + string_split(map.fsk_field, ".")[1] + "_lkp_identifier = lookup_load(this_partition_path('" + SLKP_LKPDIR + "/" + string_split(map.sk_lookup_name, ".")[0] + "/xref/xref." +  string_split(map.sk_lookup_name, ".")[1] + ".dat'), this_partition_path('" + SLKP_LKPDIR + "/" + string_split(map.sk_lookup_name, ".")[0] + "/xref/xref." +  string_split(map.sk_lookup_name, ".")[1] + ".idx'), 'Regular HK UK Lookup Template');\\t\\t/*Local variables of the to hold identifier for lookup.*/\\n");

                /*Check if current iteration is not the first iteration of this loop, and if lookup name for current iteration is not d_date.*/
                if(index_of_prev_map != -1 and !ends_with(fk_maps[index_of_prev_map].sk_lookup_name, "d_date"))
                        /*Check if placeholder flag has been turned off, in which case dim_match stat need not be populated.*/
                        if(placeholder_flag == 0)
                                rfmt_xfr = add_statement(rfmt_xfr, 
                                                         "if('" + map.sk_lookup_name + "' == '" + fk_maps[index_of_prev_map].sk_lookup_name + "' and " + string_split(map.fsk_field, ".")[1] + "_hash_key == " + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1]  + "_hash_key) "
                                                           + string_split(map.fsk_field, ".")[1] + "_surrogate_key = " + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1] + "_surrogate_key; else begin "
                                                           + string_split(map.fsk_field, ".")[1] + "_surrogate_key = first_defined(lookup(" + string_split(map.fsk_field, ".")[1] + "_lkp_identifier, 'Regular HK UK Lookup Template', " + string_split(map.fsk_field, ".")[1] + "_hash_key).dxf_sk, " + (string(""))(decimal(""))uk_default + ");
                                                         end",
                                                         include_vec = generic_types);
                        else
                        /*If placeholder flag has been turned on, generate the code to populate dim_match_stat.*/
                                rfmt_xfr = add_statement(rfmt_xfr, 
                                                         "if('" + map.sk_lookup_name + "' == '" + fk_maps[index_of_prev_map].sk_lookup_name + "' and " + string_split(map.fsk_field, ".")[1] + "_hash_key == " + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1]  + "_hash_key) "
                                                           + string_split(map.fsk_field, ".")[1] + "_surrogate_key = " + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1] + "_surrogate_key; else begin "
                                                           + string_split(map.fsk_field, ".")[1] + "_surrogate_key = first_defined(lookup(" + string_split(map.fsk_field, ".")[1] + "_lkp_identifier, 'Regular HK UK Lookup Template', " + string_split(map.fsk_field, ".")[1] + "_hash_key).dxf_sk, " + (string(""))(decimal(""))uk_default + ");
                                                           if(" + string_split(map.fsk_field, ".")[1] + "_surrogate_key == " + (string(""))(decimal(""))uk_default + ") begin
                                                             dim_match_stat_rec = [record dimension \\"" + map.sk_lookup_name + "\\" nk_subrec \\"" + map.nk_fields + "\\"dim_match_flag 1 fsk_hk " + string_split(map.fsk_field, ".")[1] + "_hash_key];
                                                             dim_match_stat_vec = vector_append(dim_match_stat_vec, dim_match_stat_rec);
                                                           end
                                                         end",
                                                         include_vec = generic_types);
                else begin
                        /*If the current iteration is the first iteration of the loop, generate lookup statements without checking the details of the previous iteration.*/
                        rfmt_xfr = add_statement(rfmt_xfr, 
                                                 string_split(map.fsk_field, ".")[1] + "_surrogate_key = first_defined(lookup(" + string_split(map.fsk_field, ".")[1] + "_lkp_identifier, 'Regular HK UK Lookup Template', " + string_split(map.fsk_field, ".")[1] + "_hash_key).dxf_sk, " + (string(""))(decimal(""))uk_default + ");", 
                                                 include_vec = generic_types);
                        /*If placeholder flag has been turned on, generate the code to populate dim_match_stat.*/
                        if(placeholder_flag == 1)
                                rfmt_xfr = add_statement(rfmt_xfr, "if(" + string_split(map.fsk_field, ".")[1] + "_surrogate_key == " + (string(""))(decimal(""))uk_default + ") begin
                                                                     dim_match_stat_rec = [record dimension \\"" + map.sk_lookup_name + "\\" nk_subrec \\"" + map.nk_fields + "\\" dim_match_flag 1 fsk_hk " + string_split(map.fsk_field, ".")[1] + "_hash_key];
                                                                     dim_match_stat_vec = vector_append(dim_match_stat_vec, dim_match_stat_rec);
                                                                   end", include_vec = generic_types);
                end
        end
        else begin
                /*Generate transform for d_date.*/
                target_dml_info = record_info(TARGET_DML);
                date_rec_info = record_info(target_dml_info[vector_search(target_dml_info, [record name map.nk_fields dml_type "" default "" condition "" nullable 0 nullflag 0 form "" comment NULL scomment "" typename "" offset NULL includes NULL], \{name\})].dml_type);
                date_format = date_rec_info[0].dml_type;
                date_field_name = date_rec_info[0].name;
                rfmt_xfr = add_statement(rfmt_xfr, string_split(map.fsk_field, ".")[1] + '_surrogate_key = if(is_null(in.' + map.nk_fields + '.' + date_field_name + ') or is_blank(in.' + map.nk_fields + '.' + date_field_name + ')) (decimal(""))(string(""))(date("YYYYMMDD"))"19000101" else (decimal(""))(string(""))(date("YYYYMMDD"))(' + date_format + ')in.' + map.nk_fields + '.' + date_field_name + ';', include_vec = generic_types);                      
        end

        rfmt_xfr = add_rule(rfmt_xfr, 
                            "out." + map.fsk_field,
                            string_split(map.fsk_field, ".")[1] + "_surrogate_key",
                            comment = "Assignement of looked up universal key to the appropriate field.", 
                            include_vec = generic_types);

end


rfmt_xfr = add_rule(rfmt_xfr, "out.dim_match_stat", 
                        "dim_match_stat_vec", include_vec = generic_types);

rfmt_xfr = add_rule(rfmt_xfr, "out.*", "in.*", include_vec = generic_types);

result :: string_concat(include_type, globals, rfmt_xfr);

end
]|8|9|FO|Reformat transform|{0|}}
{30001002|XXparameter|SLKP_SK_COUNT|$[ (decimal(""))length_of(SLKP_FK_MAP_REC_VEC) ]|3|9|K|@{0|}}
{30001002|XXparameter|SK_COUNT|$[
MLKP_SK_COUNT + SLKP_SK_COUNT
]|3|9|RK|@{0|}}
{30001002|XXparameter|MERGE_ALL_LKPS_XFR|/*
This parameter creates the xfr for the fuse which merges all the records that
were split to be looked up using various approaches.
*/
$[
begin

let string("") include_type = '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\n';

let string("") fuse_xfr = make_transform("fuse", [vector make_arg("in0"), make_arg("in1")], [vector make_arg("out")]);

for(let fk_map_type map in MLKP_FK_MAP_REC_VEC) begin
        fuse_xfr = add_rule(fuse_xfr, "out." + map.fsk_field, 
                        "in0." + string_split(map.fsk_field, ".")[1],
                        comment = "Assignement of surrogate key to appropriate out field.");
end

for(let fk_map_type map in SLKP_FK_MAP_REC_VEC) begin
        fuse_xfr = add_rule(fuse_xfr, "out." + map.fsk_field, 
                        "in1." + map.fsk_field,
                        comment = "Assignement of surrogate key to appropriate out field.");
end

fuse_xfr = add_rule(fuse_xfr, "out.dim_match_stat", "vector_concat(in0.dim_match_stat, in1.dim_match_stat)");

/*fuse_xfr = add_rule(fuse_xfr, "out.dim_match_stat", "vector_concat(for(let dim in in0.dim_match_stat) : if(dim.dim_match_flag == 1 and dim.table_type not member [vector 'fact', 'reference_static']) dim,
                                                                   for(let dim in in1.dim_match_stat) : if(dim.dim_match_flag == 1 and dim.table_type not member [vector 'fact', 'reference_static']) dim)"
                                                                   );*/
fuse_xfr = add_rule(fuse_xfr, "out.*", "in1.*");

result :: string_concat(include_type, fuse_xfr);

end
]|8|9|RFO|Required DML function|{0|}}
{30001002|XXparameter|DISTINGUISH_OUTINDEXES|//Output Index xfr to obtain a separate copy of non-matching records.
output_indices_out::output_indexes(in)=
begin
  output_indices_out :: if(length_of(in.dim_match_stat) == 0) [vector 0] else [vector 0, 1];
end;|8|9|RK|Output index vector computation|{0|}}
{30001002|XXparameter|DISTINGUISH_DML|/*
Distinguish dml which contains the same fields as the target, with the addition of
"dim_match_stat" and "target". (Required for processing of non-matching record.
*/
$[
begin

let string("") distinguish_dml = TARGET_DML;
let dml_field_info_item_vec field_name_info = record_info_item(distinguish_dml, "name");
let decimal("") index = vector_search(field_name_info, "newline");
let dml_include_vec generic_types = [vector $PUB_DXF_DML + "/generic_data_types.dml"];

distinguish_dml = if(index != -1) remove_fields(distinguish_dml, [vector "newline"]) else distinguish_dml;

index = vector_search(field_name_info, "newline");

distinguish_dml = add_fields(distinguish_dml, [vector 
                make_field("dim_match_stat", "record\\n    string(\\"\\") dimension;\\n    string(\\"\\") nk_subrec;\\n    decimal(\\"\\") dim_match_flag;\\n    hash_key_combine_type fsk_hk;\\n  end[int]", include_vec = generic_types)
                ,make_field("target", "string('')", include_vec = generic_types)
                ,make_field("newline", "string(1)", "\\"\\\\n\\"", include_vec = generic_types)
                ]);

result :: if(string_index(distinguish_dml, "metadata type") == 0) '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\nmetadata type = \\n' + distinguish_dml + ";" 
                else '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\n' + distinguish_dml;
end
]|7|9|RK||{0|}}
{30001002|XXparameter|DISTINGUISH_XFR|/*
Distinguish xfr to separate out only those records for which the match
status is 1, indicating a non-matching record.
*/

include "~$PUB_DXF_DML/generic_data_types.dml";

out::reformat(in)=
begin
  let record
    string("") dimension;
    string("") nk_subrec;
    decimal("") dim_match_flag;
    hash_key_combine_type fsk_hk;
  end[int] dim_match_stat_vec = for(let dim_match_entry in in.dim_match_stat):
                                    if(dim_match_entry.dim_match_flag == 1) dim_match_entry;
  out.target :: $"TARGET";
  out.dim_match_stat :: dim_match_stat_vec;
  out.* :: in.*;
end;|8|9|RO|Reformat transform|{0|}}
{30001002|XXparameter|NON_MATCHING_DML|//DML of the non-matching port
$[
begin

let dml_include_vec generic_types = [vector $PUB_DXF_DML + "/generic_data_types.dml"];
let string("") non_matching_dml = "record\\nend";
let string("") final_non_matching_dml = "";
//let string("") fk_map_parameter = MLKP_FK_MAP + "\\r\\n" + SLKP_FK_MAP;
//let fk_map_type[int] fk_maps = for ( let string("") line in re_split_no_empty(fk_map_parameter, "[\\r\\n]+") ) : reinterpret_as(fk_map_type, line);

non_matching_dml = add_fields(non_matching_dml, [vector
                        make_field("fsk_hk", "hash_key_combine_type", include_vec = generic_types)
                        ,make_field("out_fields", "  record\\n    string(\\"\\") field_name;\\n    string(\\"\\") field_value;\\n  end[int]", include_vec = generic_types)
                        ,make_field("dimension", "string(\\"\\")", comment = "Name of the dimension to which the hash_key in the above field will correspond.", include_vec = generic_types)
                        ,make_field("target", "string(\\"\\")", comment = "Name of the target from which the non-matching record has been produced.", include_vec = generic_types)
                        ], generic_types);

final_non_matching_dml = if(string_index(non_matching_dml, "metadata type") == 0) '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\nmetadata type = \\n' + non_matching_dml + ";"
                else '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\n' + non_matching_dml;
                
result :: join_types(read_type(PUB_DXF_DML + "/split_header.type2.dml"), join_types(read_file(PUB_DXF_DML + "/dxf_header.dml"), final_non_matching_dml));

end
]|7|9|RK|@{0|}}
{30001002|XXparameter|NON_MATCHING_XFR|/*
Generates XFR for populating data for non-matching records (Layout 
of the same is as specified in NON-MATCHING DML parameter).
*/
$[
begin
let string("") include_type = 'include "~$PUB_DXF_XFR/bre_helper.map.xfr";';
let string("") length_function = make_transform("length", [vector make_arg("in")], [vector make_arg("out")]);
let string("") normalize_function = make_transform("normalize", [vector make_arg("in"), make_arg("index")], [vector make_arg("out")]);
//let string("") output_select_function = make_transform("output_select", [vector make_arg("final")], [vector make_arg("out")]);
let string("") globals = "";
//let string("") fk_map_parameter = MLKP_FK_MAP + "\\r\\n" + SLKP_FK_MAP;
//let fk_map_type[int] fk_maps = for ( let string("") line in re_split_no_empty(fk_map_parameter, "[\\r\\n]+") ) : reinterpret_as(fk_map_type, line);

if(!is_blank(DIM_INFO)) begin 

globals = 'let string("") dim_info_parameter = "' + DIM_INFO + '";
let  record
    string("\|") dim_name;
    string("\|") nk_subrec;
    string("\|") dim_fields_not_in_split_file;
    string("\|") dim_fields_in_split_file;
    string("\|") fsk_field;
end[int]dim_info=for ( let string("") line in re_split_no_empty(dim_info_parameter, "[\\n]+") ) : reinterpret_as(record string("\|") dim_name; string("\|") nk_subrec; string("\|") dim_fields_not_in_split_file; string("\|") dim_fields_in_split_file; string("\|") fsk_field; end, line);';


length_function = add_rule(length_function, "out", 'length_of(in.dim_match_stat)');
normalize_function = add_rule(normalize_function, "out.*", is_blank(TARGET_SUBRECORD_NAME) ? "in.*" : "in." + TARGET_SUBRECORD_NAME + ".*");

normalize_function = add_local(normalize_function, 'out_fields', "  record\\n    string('\\\\x01') field_name;\\n    string('\\\\x01') field_value;\\n  end[int]", "[vector]", comment = "Variable to hold the field name, field value pair to be assigned to the out_fields output field.");
normalize_function = add_local(normalize_function, 'out_field_in_split_file', "  record\\n    string('\\\\x01') field_name;\\n    string('\\\\x01') field_value;\\n  end[int]", "[vector]", comment = "Variable to hold the output dimension fields which need to be pulled from split file.");
normalize_function = add_local(normalize_function, 'out_field_not_in_split_file', "  record\\n    string('\\\\x01') field_name;\\n    string('\\\\x01') field_value;\\n  end[int]", "[vector]", comment = "Variable to hold the output dimension fields which are not present in the split file and need to be assigned blank value.");
normalize_function = add_local(normalize_function, 'out_sk_fields', "  record\\n    string('\\\\x01') field_name;\\n    string('\\\\x01') field_value;\\n  end[int]", "[vector]", comment = "Output SK field which needs to be assigned default value i.e. '0' here.");


normalize_function = add_local(normalize_function, 'dim_index', 'decimal("")', "-1");
normalize_function = add_local(normalize_function, 'dim_fields_not_in_split_file', 'string("")[int]', "[vector]");
normalize_function = add_local(normalize_function, 'dim_fields_in_split_file', 'string("")[int]', "[vector]");
normalize_function = add_local(normalize_function, 'sk_fields', 'string("")[int]', "[vector]");
normalize_function = add_local(normalize_function, 'field_nm', 'string("")', "");
normalize_function = add_local(normalize_function, 'default', 'string("")', "");


normalize_function = add_statement(normalize_function, 'dim_index = vector_search(dim_info, [record dim_name in.dim_match_stat[index].dimension nk_subrec in.dim_match_stat[index].nk_subrec dim_fields_not_in_split_file "" dim_fields_in_split_file "" fsk_field ""], \{dim_name;nk_subrec\});');

normalize_function = add_statement(normalize_function, 'dim_fields_not_in_split_file = string_split_no_empty(dim_info[dim_index].dim_fields_not_in_split_file, ";");');

normalize_function = add_statement(normalize_function, 'dim_fields_in_split_file = string_split_no_empty(dim_info[dim_index].dim_fields_in_split_file, ";");');

normalize_function = add_statement(normalize_function, 'sk_fields = string_split_no_empty(dim_info[dim_index].fsk_field, ";");');

normalize_function = add_statement(normalize_function, 'out_field_not_in_split_file = for(let string("") field in dim_fields_not_in_split_file) field_nm = if(length_of(string_split(field, ".")) == 2) string_split(field, ".")[1] else field; : [record field_name field_nm field_value ""];');
normalize_function = add_statement(normalize_function, 'out_field_in_split_file = for(let string("") field in dim_fields_in_split_file) field_nm = if(length_of(string_split(field, ".")) == 2) string_split(field, ".")[1] else field; : [record field_name field_nm field_value first_defined((string(""))eval(in,field), "")];');
normalize_function = add_statement(normalize_function, 'out_sk_fields = for(let string("") field in sk_fields) field_nm = if(length_of(string_split(field, ".")) == 2) string_split(field, ".")[1] else field; : [record field_name field_nm field_value "0"];');
normalize_function = add_statement(normalize_function, 'out_fields = vector_concat(vector_concat(out_field_not_in_split_file,out_field_in_split_file), out_sk_fields);');

normalize_function = add_rule(normalize_function, "out.out_fields", "out_fields");
normalize_function = add_rule(normalize_function, "out.dimension", "in.dim_match_stat[index].dimension");
normalize_function = add_rule(normalize_function, "out.fsk_hk", "in.dim_match_stat[index].fsk_hk");
normalize_function = add_rule(normalize_function, "out.target", "in.target");

end
else 
begin
length_function = add_rule(length_function, "out", 'length_of(in.dim_match_stat)');
normalize_function = add_rules(normalize_function, [vector make_rule('out.out_fields', '[vector]')
                        ,make_rule("out.fsk_hk", 'in.dim_match_stat[index].fsk_hk')
                        ,make_rule("out.dimension", 'in.dim_match_stat[index].dimension')
                        ,make_rule("out.target", '"-"')
                        ,is_blank(TARGET_SUBRECORD_NAME) ? make_rule("out.*", "in.*") : make_rule("out.*", "in." + TARGET_SUBRECORD_NAME + ".*")]);

end;

result :: include_type + "\\n\\n" + globals + "\\n\\n" + length_function + "\\n" + normalize_function;

end
]|8|9|RK|@{0|}}
{30001002|XXparameter|condition|$[
if((decimal(""))SK_COUNT  == 0) 0 else 1
]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|all|3|1|Fl||{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|foreign_key_lookup|Manav Jindal|Created 1/31/2017 9:20:18 AM|1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1707000|760000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.2.0|{2|1|1|}Job 'foreign_key_lookup' Execution Status Report

Job completed successfully at Tuesday, April 04, 2017 03:17:10
Run performed by user gkaur109
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Dev-4||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|128|220|1|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@This subgraph extracts the surrogate key 
for every pair of natural keys passed to it|44000|60000|0|0|0|0|14169|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|128|220|1|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}14205|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}14201|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}14211|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}1396|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}14212|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}14207|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}14202|17|}}
{2010501005|XXGpvertex|14|0|27|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Fuse.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform||3|8|=|@{0|}}
{30001002|XXparameter|condition|$[
if((decimal(""))MLKP_SK_COUNT  == 0) 0
else if((decimal(""))MLKP_SK_COUNT  == 0 && (decimal(""))SLKP_SK_COUNT  == 0) 0
else 1
]|3|9||@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|$IDENTIFIER_FIELDS_DML|3|9||@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Fuse|990000|250000|0|0|0|0|14214|FUSE: Merge All Lookup Records|Ab Initio Software|Built-in 2.10:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|15|0|29|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|16|0|32|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|17|0|34|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|18|0|36|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|19|0|38|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|20|0|40|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|21|0|42|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|22|0|45|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010501005|XXGpvertex|23|0|48|0|{Applies a transform to the corresponding records from each input flow. The transform is first applied to the first record on each flow, then to the second, and so on. The result of the transform is sent out of the out port.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|fuse-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of inputs to fuse function|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
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
{30001002|XXparameter|num_operations|7|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(4) out::select(in[*])|3|2|H$|If this returns 0, the input records are discarded.|{0|}}
{30001002|XXparameter|operation1_analysis|integer(4) select_out::select(in[*])|3|2|H$||{0|}}
{30001002|XXparameter|operation2|out::fuse(in[*])|3|2|H$|Function combining one record from each input to produce one record on the output.|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in*; error*=^error|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|error_port_type error <parameter error0_metadata>|3|2|H$|Type for make_error output|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, in[*])|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, in[*])|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, in[*])|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation7|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Fuse|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|24|0|50|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|25|0|53|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|26|0|56|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|27|0|59|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|28|0|62|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|29|0|65|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|30|0|68|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|31|0|71|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010501005|XXGpvertex|32|0|74|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$UNIQUE_RECORD_IDENTIFIER_KEYS|3|9||@{0|}}
{30001002|XXparameter|transform||3|8|=|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|1219000|560000|0|0|0|0|1011|RLP: Merge records representing the same entity|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|33|0|76|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|34|0|78|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|35|0|80|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|36|0|82|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|37|0|84|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|38|0|86|0|{@{}@384|.5|.5|{0|}991|17|}}
{2010501005|XXGpvertex|39|0|88|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not sorted or grouped.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.update_clauses|retain_old_default|3|9|P|@{0|}}
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
{30001002|XXparameter|output_without_input|Never|15|1|FKl|When to invoke the output_without_input transform function to produce an output record not corresponding to an input record.|{4|Never|At each computepoint|At each checkpoint|At component shutdown|}}
{30001002|XXparameter|output_without_input.condition|version 3.2.2.r15:|3|15|P?|@{0|}}
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
{30001002|XXparameter|major_key.condition|param grouped-input True param sorted-input False version 2.14.102:|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|13|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of public variables in rollup|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|temp ? temp::rollup(temp, in) : out::rollup(in)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation4|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation5|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6|optional integer(8) out::key_change(in in1, in in2)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|operation7|optional out::output_without_input()|3|2|H$|Output when there are no input records|{0|}}
{30001002|XXparameter|operation7.condition|version 3.2.2.r15:|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation12|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|operation13|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|40|0|90|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|41|0|93|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|42|0|96|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|43|0|99|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|44|0|102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|45|0|105|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Normalize|615000|235000|0|0|0|0|1004|NORM: Multiply input records|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|46|0|107|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|47|0|109|0|{@{}@384|.5|.5|{0|}911|17|}}
{2010203004|XXGoport|48|0|111|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|49|0|113|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|50|0|115|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|51|0|117|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|52|0|119|0|{@{}@384|.5|.5|{0|}995|17|}}
{2010501005|XXGpvertex|53|0|121|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
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
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate types in transform package|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|num_operations|13|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|optional integer(8) out::length(in)|3|2|H$|Number of records to output.  Either this function or finished() must be defined.|{0|}}
{30001002|XXparameter|operation4|temp ? temp::normalize(temp, in, integer(8) index) : out::normalize(in, integer(8) index)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation5|optional temp ? integer(8) finished_out::finished(temp, in, integer(8) index) : integer(8) finished_out::finished(in, integer(8) index)|3|2|H$|Are we done with this input record?  Either this function or length() must be defined.|{0|}}
{30001002|XXparameter|operation6|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation7|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation3_analysis|integer(8) length_out::length(in)|3|2|H$|Number of records to output|{0|}}
{30001002|XXparameter|operation7_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation12|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|operation13|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Normalize|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|54|0|123|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|55|0|126|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|56|0|129|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|57|0|132|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|58|0|135|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|59|0|138|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|115000|227000|0|0|0|0|1009|RFMT: Split file and generate hash_key and partition and record numbers|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|60|0|140|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|61|0|143|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|62|0|145|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|63|0|147|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|64|0|149|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|65|0|151|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
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
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|66|0|153|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|67|0|157|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|68|0|160|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|69|0|163|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|70|0|166|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|71|0|169|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_DML/generic_data_types.dml";
/*Reformat operation*/
out::reformat(in)=
begin
out.partition_nbr :: this_partition();
out.record_nbr :: invocation_number();
out.dim_match_stat :: allocate_with_defaults();
out.* :1: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|out0_metadata|$IDENTIFIER_FIELDS_DML|3|9||@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|65000|300000|0|0|0|0|14220|RFMT: Split ICFF and Regular Lookup records|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|72|0|171|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|73|0|174|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|74|0|176|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|75|0|178|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|76|0|180|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|77|0|182|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
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
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|78|0|184|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|79|0|188|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|80|0|191|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|81|0|194|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|82|0|197|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|83|0|200|0|{Subgraph created from graph "Universal Key Extraction_optimized"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|NORM_XFR||8|8|RFO=|Required and optional DML functions|{0|}}
{30001002|XXparameter|RFMT_XFR||8|8|RFO=|Reformat transform|{0|}}
{30001002|XXparameter|ROLLUP_XFR||8|8|RFO=|Required and optional DML functions|{0|}}
{30001002|XXparameter|MULTIPLY_DML||7|8|RF=||{0|}}
{30001002|XXparameter|SPLIT_RFMT_XFR||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|SPLIT_RFMT_DML||7|8|RF=||{0|}}
{30001002|XXparameter|condition|$[
if((decimal(""))MLKP_SK_COUNT  == 0) 0 else 1
]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@637750|228750|0|0|0|0|14191|MUltifile Lookup|gunit.kaur|Created 5/6/2016 11:13:41 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1442000|725000|3|}}
{2010240003|XXGlegend|84|0|202|0|{@{}@This subgraph takes the split file as input and extracts the 
universal key for every pair of natural keys passed to it|44000|60000|0|0|0|0|536|}}
{2010242002|XXGface|85|0|204|0|{@{}@Arial|128|140|1|}}
{2010210004|XXGflow|86|0|206|0|{@{}@384|.5|.5|{0|}1000|17|}}
{2010210004|XXGflow|87|0|208|0|{@{}@384|.5|.5|{0|}988|20|}}
{2010210004|XXGflow|88|0|212|0|{@{}@384|.5|.5|{0|}999|529|}}
{2010501005|XXGpvertex|89|0|216|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Expression.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|function|partition_nbr|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Partition by Expression|773000|560000|0|0|0|0|1005|PBE: Repartition records as per their previous partition order|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|90|0|218|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010203004|XXGoport|91|0|221|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|92|0|223|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|93|0|225|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|94|0|227|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|95|0|230|0|{Distributes data records to its output flow partitions according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|function-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|function||20|2|RFO$|Function to partition on|{0|}}
{30001002|XXparameter|function.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_function|-use_package|3|2|RO$|Replaces function as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_function.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the partition_index() function defined in the package to specify the partition index.|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|4|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|integer(8) index_out::partition_index(in)|3|2|H$|Use this instead of the function parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) index_out::partition_index(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|version 2.16: param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|version 2.16: param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit_keyword.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|version 2.16: param logging True|3|15|P?|@{0|}}
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
{30001002|XXparameter|port_analysis|reject=in;out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|3|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Partition by Expression|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|96|0|232|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010203004|XXGoport|97|0|235|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|98|0|238|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|99|0|241|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|100|0|244|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|101|0|250|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Deprecated/Sort/Partition_by_Key_and_Sort.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|Key|\{dim_match_stat.fsk_hk.dxf_hk_part1\}|3|9||@{0|}}
{30001002|XXparameter|Max_core|$AI_GRAPH_MAX_CORE|3|2|$|@{0|}}
}}@0|@1000000|255000|0|0|481000|303000|1006|PBKS: \{hash_key\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|102|0|252|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|103|0|254|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|104|0|256|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|105|0|259|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|106|0|263|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|107|0|265|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|108|0|267|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|109|0|272|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|110|0|276|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|111|0|280|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Key||19|2|RFs$|Field to partition on|{0|}}
{30001002|XXparameter|InputLayout|@9|9|RFs||{0|}}
{30001002|XXparameter|Max_core|100663296|1|2|F$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|OutputLayout|@9|9|RFs||{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|112|0|282|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|113|0|284|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|114|0|286|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|115|0|289|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|116|0|291|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|117|0|293|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|118|0|296|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|119|0|301|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|120|0|303|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|121|0|305|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|122|0|308|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|123|0|310|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|124|0|313|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|125|0|319|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|126|0|322|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|127|0|325|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|514500|572500|0|0|0|0|1007|RFMT: Extract universal key for multiplied records|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|128|0|327|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|129|0|330|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|130|0|332|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|131|0|334|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|132|0|336|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|133|0|339|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
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
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|134|0|341|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|135|0|345|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|136|0|348|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|137|0|351|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|138|0|354|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|139|0|363|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$UNIQUE_RECORD_IDENTIFIER_KEYS|3|9||@{0|}}
{30001002|XXparameter|max_core|$AI_GRAPH_MAX_CORE_HALF|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Sort|1020000|588000|0|0|0|0|1012|SORT \{record_nbr\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|140|0|365|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|141|0|368|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|142|0|371|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|143|0|373|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|144|0|376|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|145|0|381|0|{@{}@0|0|0|0|out1|.8094804010938924|@@@14352|0|}}
{2010202004|XXGiport|146|0|385|0|{@{}@0|0|0|0|in0|.28167730173199634|@@@13840|0|}}
{2010503005|XXGfvertex|147|0|407|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Template.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|RecordFormat|include "~$PUB_DXF_DML/generic_data_types.dml";
 
metadata type = xref_lookup_type;|3|9||@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|keep_on_disk|True|3|1|l|@{0|}}
{30001002|XXparameter|block_compressed|True|3|1|l|@{0|}}
}}@0|Lookup Template|1129000|119500|0|0|0|0|14215|ICFF HK UK Lookup Template|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|148|0|409|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x1200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|Layout|file:/~null|28|9|RF||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|block_compressed.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Lookup Template|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010501005|XXGpvertex|149|0|412|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform|$NON_MATCHING_XFR|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|$NON_MATCHING_DML|3|9||@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Normalize|1332000|590000|0|0|0|0|14217|NORM: Split non-matching records from each dimension|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|150|0|414|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|151|0|416|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|152|0|418|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|153|0|420|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|154|0|422|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|155|0|425|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
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
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate types in transform package|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|num_operations|13|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|optional integer(8) out::length(in)|3|2|H$|Number of records to output.  Either this function or finished() must be defined.|{0|}}
{30001002|XXparameter|operation4|temp ? temp::normalize(temp, in, integer(8) index) : out::normalize(in, integer(8) index)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation5|optional temp ? integer(8) finished_out::finished(temp, in, integer(8) index) : integer(8) finished_out::finished(in, integer(8) index)|3|2|H$|Are we done with this input record?  Either this function or length() must be defined.|{0|}}
{30001002|XXparameter|operation6|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation7|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation3_analysis|integer(8) length_out::length(in)|3|2|H$|Number of records to output|{0|}}
{30001002|XXparameter|operation7_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation12|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|operation13|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Normalize|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|156|0|427|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|157|0|430|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|158|0|433|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|159|0|436|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|160|0|439|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|161|0|442|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0||3|3|c|@{0|}}
{30001002|XXparameter|transform1|$DISTINGUISH_XFR|3|9||@{0|}}
{30001002|XXparameter|output_indexes|$DISTINGUISH_OUTINDEXES|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|@3|9|s|@{0|}}
{30001002|XXparameter|out1_metadata|$DISTINGUISH_DML|3|9||@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|1001000|465000|0|0|0|0|14219|RFMT: Distinguish Non-Matching Records|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|162|0|444|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|163|0|446|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|164|0|449|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|165|0|451|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|166|0|453|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|167|0|455|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|168|0|457|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|169|0|459|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|170|0|462|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform1||8|1|FOl|Reformat transform|{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|171|0|464|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|172|0|468|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|173|0|472|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|174|0|475|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|175|0|478|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|176|0|481|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|177|0|484|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|178|0|487|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|179|0|496|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Template.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|RecordFormat|include "~$PUB_DXF_DML/generic_data_types.dml";
 
metadata type = xref_serial_lookup_type;|3|9||@{0|}}
{30001002|XXparameter|key|\{dxf_hk\}|3|2|$|@{0|}}
}}@0|Lookup Template|899000|119500|0|0|0|0|14222|Regular HK UK Lookup Template|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|180|0|498|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x1200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|Layout|file:/~null|28|9|RF||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|block_compressed.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Lookup Template|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010600005|XXGgraph|181|0|500|0|{Subgraph created from graph "Universal Key Extraction_multi_serial"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|RFMT_XFR||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
{30001002|XXparameter|condition|$[
if((decimal(""))SLKP_SK_COUNT  == 0) 0 else 1
]|3|9|F||{0|}}
}}@0|@636000|437000|0|0|0|0|14213|Regular Serial Lookup|gunit.kaur|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|735000|458000|7|}}
{2010501005|XXGpvertex|182|0|502|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0||3|8|=|@{0|}}
{30001002|XXparameter|output_indexes||3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|180000|165000|0|0|0|0|685|RFMT: Extract Universal Key|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|183|0|504|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|184|0|506|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|185|0|508|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|186|0|510|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|187|0|512|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|188|0|514|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
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
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|189|0|516|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|190|0|520|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|191|0|523|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|192|0|526|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|193|0|529|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|194|0|536|0|{@{}@0|0|0|0|out0|.5043668122270742|@@@14352|0|}}
{2010202004|XXGiport|195|0|540|0|{@{}@0|0|0|0|in0|.4978165938864629|@@@13840|0|}}
{2010501005|XXGpvertex|196|0|545|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[
if((decimal(""))MLKP_SK_COUNT  == 0 \|\| (decimal(""))SLKP_SK_COUNT  == 0) 0 else 1
]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Replicate|338000|360000|0|0|0|0|14223|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|197|0|547|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|198|0|551|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|199|0|554|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|200|0|556|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|201|0|559|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|202|0|564|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@100000|150000|0|0|0|0|14159|Version Log|Gunit Kaur|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|980000|429000|3|}}
{2010240003|XXGlegend|203|0|566|0|{@{}@Date|92000|251000|0|0|0|0|1474|}}
{2010242002|XXGface|204|0|568|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|205|0|570|0|{@{}@Author|217000|251000|0|0|0|0|1473|}}
{2010242002|XXGface|206|0|572|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|207|0|574|0|{@{}@Description|417000|251000|0|0|0|0|1472|}}
{2010242002|XXGface|208|0|576|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|209|0|578|0|{@{}@Version|17000|251000|0|0|0|0|1470|}}
{2010242002|XXGface|210|0|580|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|211|0|582|0|{@{}@Initial version|412000|268000|0|0|0|0|1482|}}
{2010242002|XXGface|212|0|584|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|213|0|586|0|{@{}@May 19 2016|82000|268000|0|0|0|0|1486|}}
{2010242002|XXGface|214|0|588|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|215|0|590|0|{@{}@1.0|17000|268000|0|0|0|0|1455|}}
{2010242002|XXGface|216|0|592|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|217|0|594|0|{@{}@Gunit Kaur (Exusia)|187000|268000|0|0|0|0|1514|}}
{2010242002|XXGface|218|0|596|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|219|0|598|0|{@{}@Summary:

This subgraph extracts the surrogate key for every pair of natural keys passed to it.|15000|42500|0|0|0|0|1512|}}
{2010242002|XXGface|220|0|600|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|221|0|602|0|{@{}@2.0|17000|288000|0|0|0|0|1485|}}
{2010242002|XXGface|222|0|604|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|223|0|606|0|{@{}@May 30 2016|82000|288000|0|0|0|0|1515|}}
{2010242002|XXGface|224|0|608|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|225|0|610|0|{@{}@Gunit Kaur (Exusia)|187000|288000|0|0|0|0|1476|}}
{2010242002|XXGface|226|0|612|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|227|0|614|0|{@{}@Placholder generation conditionalized to dimension tables only, Special proccesing added for d_date|412000|288000|0|0|0|0|1516|}}
{2010242002|XXGface|228|0|616|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|229|0|618|0|{@{}@High Level Design conceived by:
Anwar Parvez, Alex Zhao

ETL Design conceived by:
Manav Jindal|18000|105000|0|0|0|0|1522|}}
{2010242002|XXGface|230|0|620|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|231|0|622|0|{@{}@3.0|17000|308000|0|0|0|0|1491|}}
{2010242002|XXGface|232|0|624|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|233|0|626|0|{@{}@Aug 24 2016|82000|308000|0|0|0|0|1517|}}
{2010242002|XXGface|234|0|628|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|235|0|630|0|{@{}@Gunit Kaur (Exusia)|187000|308000|0|0|0|0|1493|}}
{2010242002|XXGface|236|0|632|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|237|0|634|0|{@{}@MICFF Normalize length reduction, Reduction of lookup calls|412000|308000|0|0|0|0|1518|}}
{2010242002|XXGface|238|0|636|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|239|0|638|0|{@{}@4.0|17000|328000|0|0|0|0|1499|}}
{2010242002|XXGface|240|0|640|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|241|0|642|0|{@{}@Aug 29 2016|82000|328000|0|0|0|0|1519|}}
{2010242002|XXGface|242|0|644|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|243|0|646|0|{@{}@Gunit Kaur (Exusia)|187000|328000|0|0|0|0|1496|}}
{2010242002|XXGface|244|0|648|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|245|0|650|0|{@{}@Flow buffering handled, redundant joins eliminated, Fuse component added|412000|328000|0|0|0|0|1520|}}
{2010242002|XXGface|246|0|652|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|247|0|654|0|{@{}@5.0|17000|348000|0|0|0|0|1505|}}
{2010242002|XXGface|248|0|656|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|249|0|658|0|{@{}@Nov 07 2016|82000|348000|0|0|0|0|1521|}}
{2010242002|XXGface|250|0|660|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|251|0|662|0|{@{}@Mukesh Singh (Exusia)|187000|348000|0|0|0|0|1503|}}
{2010242002|XXGface|252|0|664|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|253|0|666|0|{@{}@Custom/Reduced lookup, DA|412000|348000|0|0|0|0|1504|}}
{2010242002|XXGface|254|0|668|0|{@{}@Candara|0|100|0|}}
{2010203004|XXGoport|255|0|670|0|{@{}@0|0|0|0|all|.3297442799461642|@@@14352|0|}}
{2010203004|XXGoport|256|0|673|0|{@{}@0|0|0|0|non_matching|.8092105263157895|@@@14352|0|}}
{2010202004|XXGiport|257|0|676|0|{@{}@0|0|0|0|in0|.47203274215552526|@@@13840|0|}}
{2010110002|XXGconstant|258|0|679|0|{@{}@{1|4369747|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_1|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_2|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_3|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_4|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_5|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_6|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_7|}1|13|}
{2010601001|XXGgraph_vertex_vertex|13|0|26|0|{FUSE_Merge_All_Lookup_Records|}1|14|}
{2010212001|XXGvertex_oport_oport|14|0|28|0|{0|out|}14|15|}
{2010213001|XXGoport_dst_flow|15|0|30|0|{0|}15|12|}
{2010212001|XXGvertex_oport_oport|16|0|31|0|{1|reject0|}14|16|}
{2010212001|XXGvertex_oport_oport|17|0|33|0|{2|reject1|}14|17|}
{2010212001|XXGvertex_oport_oport|18|0|35|0|{3|error0|}14|18|}
{2010212001|XXGvertex_oport_oport|19|0|37|0|{4|error1|}14|19|}
{2010212001|XXGvertex_oport_oport|20|0|39|0|{5|log|}14|20|}
{2010211001|XXGvertex_iport_iport|21|0|41|0|{0|in0|}14|21|}
{2010214001|XXGiport_src_flow|22|0|43|0|{0|}21|7|}
{2010211001|XXGvertex_iport_iport|23|0|44|0|{1|in1|}14|22|}
{2010214001|XXGiport_src_flow|24|0|46|0|{0|}22|11|}
{2010007001|XXGobject_proto_object|25|0|47|0|{}14|23|}
{2010212001|XXGvertex_oport_oport|26|0|49|0|{0|out|}23|24|}
{2010006001|XXGobject_psameas_object|27|0|51|0|{metadata|out_metadata|1|0|}24|23|}
{2010212001|XXGvertex_oport_oport|28|0|52|0|{1|reject0|}23|25|}
{2010006001|XXGobject_psameas_object|29|0|54|0|{metadata|reject0_metadata|1|0|}25|23|}
{2010212001|XXGvertex_oport_oport|30|0|55|0|{2|reject1|}23|26|}
{2010006001|XXGobject_psameas_object|31|0|57|0|{metadata|reject1_metadata|1|0|}26|23|}
{2010212001|XXGvertex_oport_oport|32|0|58|0|{3|error0|}23|27|}
{2010006001|XXGobject_psameas_object|33|0|60|0|{metadata|error0_metadata|1|0|}27|23|}
{2010212001|XXGvertex_oport_oport|34|0|61|0|{4|error1|}23|28|}
{2010006001|XXGobject_psameas_object|35|0|63|0|{metadata|error1_metadata|1|0|}28|23|}
{2010212001|XXGvertex_oport_oport|36|0|64|0|{5|log|}23|29|}
{2010006001|XXGobject_psameas_object|37|0|66|0|{metadata|log_metadata|1|0|}29|23|}
{2010211001|XXGvertex_iport_iport|38|0|67|0|{0|in0|}23|30|}
{2010006001|XXGobject_psameas_object|39|0|69|0|{metadata|in0_metadata|1|0|}30|23|}
{2010211001|XXGvertex_iport_iport|40|0|70|0|{1|in1|}23|31|}
{2010006001|XXGobject_psameas_object|41|0|72|0|{metadata|in1_metadata|1|0|}31|23|}
{2010006001|XXGobject_psameas_object|42|0|73|0|{in0_metadata|out_metadata|0|0|}14|32|}
{2010212001|XXGvertex_oport_oport|43|0|75|0|{0|out|}32|33|}
{2010212001|XXGvertex_oport_oport|44|0|77|0|{1|reject|}32|34|}
{2010212001|XXGvertex_oport_oport|45|0|79|0|{2|error|}32|35|}
{2010212001|XXGvertex_oport_oport|46|0|81|0|{3|log|}32|36|}
{2010211001|XXGvertex_iport_iport|47|0|83|0|{0|in|}32|37|}
{2010214001|XXGiport_src_flow|48|0|85|0|{0|}37|38|}
{2010007001|XXGobject_proto_object|49|0|87|0|{}32|39|}
{2010212001|XXGvertex_oport_oport|50|0|89|0|{0|out|}39|40|}
{2010006001|XXGobject_psameas_object|51|0|91|0|{metadata|out_metadata|1|0|}40|39|}
{2010212001|XXGvertex_oport_oport|52|0|92|0|{1|reject|}39|41|}
{2010006001|XXGobject_psameas_object|53|0|94|0|{metadata|reject_metadata|1|0|}41|39|}
{2010212001|XXGvertex_oport_oport|54|0|95|0|{2|error|}39|42|}
{2010006001|XXGobject_psameas_object|55|0|97|0|{metadata|error_metadata|1|0|}42|39|}
{2010212001|XXGvertex_oport_oport|56|0|98|0|{3|log|}39|43|}
{2010006001|XXGobject_psameas_object|57|0|100|0|{metadata|log_metadata|1|0|}43|39|}
{2010211001|XXGvertex_iport_iport|58|0|101|0|{0|in|}39|44|}
{2010006001|XXGobject_psameas_object|59|0|103|0|{metadata|in_metadata|1|0|}44|39|}
{2010006001|XXGobject_psameas_object|60|0|104|0|{in_metadata|out_metadata|0|0|}32|45|}
{2010212001|XXGvertex_oport_oport|61|0|106|0|{0|out|}45|46|}
{2010213001|XXGoport_dst_flow|62|0|108|0|{0|}46|47|}
{2010212001|XXGvertex_oport_oport|63|0|110|0|{1|reject|}45|48|}
{2010212001|XXGvertex_oport_oport|64|0|112|0|{2|error|}45|49|}
{2010212001|XXGvertex_oport_oport|65|0|114|0|{3|log|}45|50|}
{2010211001|XXGvertex_iport_iport|66|0|116|0|{0|in|}45|51|}
{2010214001|XXGiport_src_flow|67|0|118|0|{0|}51|52|}
{2010007001|XXGobject_proto_object|68|0|120|0|{}45|53|}
{2010212001|XXGvertex_oport_oport|69|0|122|0|{0|out|}53|54|}
{2010006001|XXGobject_psameas_object|70|0|124|0|{metadata|out_metadata|1|0|}54|53|}
{2010212001|XXGvertex_oport_oport|71|0|125|0|{1|reject|}53|55|}
{2010006001|XXGobject_psameas_object|72|0|127|0|{metadata|reject_metadata|1|0|}55|53|}
{2010212001|XXGvertex_oport_oport|73|0|128|0|{2|error|}53|56|}
{2010006001|XXGobject_psameas_object|74|0|130|0|{metadata|error_metadata|1|0|}56|53|}
{2010212001|XXGvertex_oport_oport|75|0|131|0|{3|log|}53|57|}
{2010006001|XXGobject_psameas_object|76|0|133|0|{metadata|log_metadata|1|0|}57|53|}
{2010211001|XXGvertex_iport_iport|77|0|134|0|{0|in|}53|58|}
{2010006001|XXGobject_psameas_object|78|0|136|0|{metadata|in_metadata|1|0|}58|53|}
{2010006001|XXGobject_psameas_object|79|0|137|0|{in_metadata|out0_metadata|0|0|}45|59|}
{2010212001|XXGvertex_oport_oport|80|0|139|0|{0|out0|}59|60|}
{2010213001|XXGoport_dst_flow|81|0|141|0|{0|}60|52|}
{2010212001|XXGvertex_oport_oport|82|0|142|0|{1|reject0|}59|61|}
{2010212001|XXGvertex_oport_oport|83|0|144|0|{2|error0|}59|62|}
{2010212001|XXGvertex_oport_oport|84|0|146|0|{3|log|}59|63|}
{2010211001|XXGvertex_iport_iport|85|0|148|0|{0|in|}59|64|}
{2010007001|XXGobject_proto_object|86|0|150|0|{}59|65|}
{2010212001|XXGvertex_oport_oport|87|0|152|0|{0|out0|}65|66|}
{2010006001|XXGobject_psameas_object|88|0|154|0|{metadata|out0_metadata|1|0|}66|65|}
{2010006001|XXGobject_psameas_object|89|0|155|0|{transform0|transform0|1|0|}66|65|}
{2010212001|XXGvertex_oport_oport|90|0|156|0|{1|reject0|}65|67|}
{2010006001|XXGobject_psameas_object|91|0|158|0|{metadata|reject0_metadata|1|0|}67|65|}
{2010212001|XXGvertex_oport_oport|92|0|159|0|{2|error0|}65|68|}
{2010006001|XXGobject_psameas_object|93|0|161|0|{metadata|error0_metadata|1|0|}68|65|}
{2010212001|XXGvertex_oport_oport|94|0|162|0|{3|log|}65|69|}
{2010006001|XXGobject_psameas_object|95|0|164|0|{metadata|log_metadata|1|0|}69|65|}
{2010211001|XXGvertex_iport_iport|96|0|165|0|{0|in|}65|70|}
{2010006001|XXGobject_psameas_object|97|0|167|0|{metadata|in_metadata|1|0|}70|65|}
{2010006001|XXGobject_psameas_object|98|0|168|0|{in_metadata|out0_metadata|0|0|}59|71|}
{2010212001|XXGvertex_oport_oport|99|0|170|0|{0|out0|}71|72|}
{2010213001|XXGoport_dst_flow|100|0|172|0|{0|}72|8|}
{2010212001|XXGvertex_oport_oport|101|0|173|0|{1|reject0|}71|73|}
{2010212001|XXGvertex_oport_oport|102|0|175|0|{2|error0|}71|74|}
{2010212001|XXGvertex_oport_oport|103|0|177|0|{3|log|}71|75|}
{2010211001|XXGvertex_iport_iport|104|0|179|0|{0|in|}71|76|}
{2010007001|XXGobject_proto_object|105|0|181|0|{}71|77|}
{2010212001|XXGvertex_oport_oport|106|0|183|0|{0|out0|}77|78|}
{2010006001|XXGobject_psameas_object|107|0|185|0|{metadata|out0_metadata|1|0|}78|77|}
{2010006001|XXGobject_psameas_object|108|0|186|0|{transform0|transform0|1|0|}78|77|}
{2010212001|XXGvertex_oport_oport|109|0|187|0|{1|reject0|}77|79|}
{2010006001|XXGobject_psameas_object|110|0|189|0|{metadata|reject0_metadata|1|0|}79|77|}
{2010212001|XXGvertex_oport_oport|111|0|190|0|{2|error0|}77|80|}
{2010006001|XXGobject_psameas_object|112|0|192|0|{metadata|error0_metadata|1|0|}80|77|}
{2010212001|XXGvertex_oport_oport|113|0|193|0|{3|log|}77|81|}
{2010006001|XXGobject_psameas_object|114|0|195|0|{metadata|log_metadata|1|0|}81|77|}
{2010211001|XXGvertex_iport_iport|115|0|196|0|{0|in|}77|82|}
{2010006001|XXGobject_psameas_object|116|0|198|0|{metadata|in_metadata|1|0|}82|77|}
{2010006001|XXGobject_psameas_object|117|0|199|0|{out0_metadata|SPLIT_RFMT_DML|1|0|}59|83|}
{2010605001|XXGgraph_legend_legend|118|0|201|0|{0|}83|84|}
{2010241001|XXGlegend_face_face|119|0|203|0|{}84|85|}
{2010604001|XXGgraph_flow_flow|120|0|205|0|{Flow_1|}83|86|}
{2010604001|XXGgraph_flow_flow|121|0|207|0|{Flow_2|}83|87|}
{2010604001|XXGgraph_flow_flow|122|0|209|0|{Flow_3|}83|52|}
{2010604001|XXGgraph_flow_flow|123|0|210|0|{Flow_4|}83|47|}
{2010604001|XXGgraph_flow_flow|124|0|211|0|{Flow_5|}83|88|}
{2010604001|XXGgraph_flow_flow|125|0|213|0|{Flow_6|}83|38|}
{2010601001|XXGgraph_vertex_vertex|126|0|214|0|{NORM_Multiply_input_records|}83|45|}
{2010601001|XXGgraph_vertex_vertex|127|0|215|0|{PBE_Repartition_records_as_per_their_previous_partition_order|}83|89|}
{2010212001|XXGvertex_oport_oport|128|0|217|0|{0|out|}89|90|}
{2010213001|XXGoport_dst_flow|129|0|219|0|{0|}90|87|}
{2010212001|XXGvertex_oport_oport|130|0|220|0|{1|reject|}89|91|}
{2010212001|XXGvertex_oport_oport|131|0|222|0|{2|error|}89|92|}
{2010212001|XXGvertex_oport_oport|132|0|224|0|{3|log|}89|93|}
{2010211001|XXGvertex_iport_iport|133|0|226|0|{0|in|}89|94|}
{2010214001|XXGiport_src_flow|134|0|228|0|{0|}94|86|}
{2010007001|XXGobject_proto_object|135|0|229|0|{}89|95|}
{2010212001|XXGvertex_oport_oport|136|0|231|0|{0|out|}95|96|}
{2010006001|XXGobject_psameas_object|137|0|233|0|{metadata|out_metadata|1|0|}96|95|}
{2010212001|XXGvertex_oport_oport|138|0|234|0|{1|reject|}95|97|}
{2010006001|XXGobject_psameas_object|139|0|236|0|{metadata|reject_metadata|1|0|}97|95|}
{2010212001|XXGvertex_oport_oport|140|0|237|0|{2|error|}95|98|}
{2010006001|XXGobject_psameas_object|141|0|239|0|{metadata|error_metadata|1|0|}98|95|}
{2010212001|XXGvertex_oport_oport|142|0|240|0|{3|log|}95|99|}
{2010006001|XXGobject_psameas_object|143|0|242|0|{metadata|log_metadata|1|0|}99|95|}
{2010211001|XXGvertex_iport_iport|144|0|243|0|{0|in|}95|100|}
{2010006001|XXGobject_psameas_object|145|0|245|0|{metadata|in_metadata|1|0|}100|95|}
{2010006001|XXGobject_psameas_object|146|0|246|0|{in_metadata|out_metadata|0|0|}89|45|}
{2010006001|XXGobject_psameas_object|147|0|247|0|{out_metadata|out_metadata|0|0|}89|45|}
{2010006001|XXGobject_psameas_object|148|0|248|0|{reject_metadata|out_metadata|0|0|}89|45|}
{2010601001|XXGgraph_vertex_vertex|149|0|249|0|{PBKS_hash_key_|}83|101|}
{2010604001|XXGgraph_flow_flow|150|0|251|0|{Flow_1|}101|102|}
{2010601001|XXGgraph_vertex_vertex|151|0|253|0|{Partition_by_Key|}101|103|}
{2010212001|XXGvertex_oport_oport|152|0|255|0|{0|out|}103|104|}
{2010213001|XXGoport_dst_flow|153|0|257|0|{0|}104|102|}
{2010211001|XXGvertex_iport_iport|154|0|258|0|{0|in|}103|105|}
{2010006001|XXGobject_psameas_object|155|0|260|0|{in_metadata|out_metadata|0|0|}103|45|}
{2010006001|XXGobject_psameas_object|156|0|261|0|{out_metadata|out_metadata|0|0|}103|45|}
{2010601001|XXGgraph_vertex_vertex|157|0|262|0|{Sort|}101|106|}
{2010212001|XXGvertex_oport_oport|158|0|264|0|{0|out|}106|107|}
{2010211001|XXGvertex_iport_iport|159|0|266|0|{0|in|}106|108|}
{2010214001|XXGiport_src_flow|160|0|268|0|{0|}108|102|}
{2010006001|XXGobject_psameas_object|161|0|269|0|{in_metadata|out_metadata|0|0|}106|45|}
{2010006001|XXGobject_psameas_object|162|0|270|0|{out_metadata|out_metadata|0|0|}106|45|}
{2010212001|XXGvertex_oport_oport|163|0|271|0|{0|out0|}101|109|}
{2010216002|XXGoport_binding_oport|164|0|273|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}109|107|}
{2010213001|XXGoport_dst_flow|165|0|274|0|{0|}109|88|}
{2010211001|XXGvertex_iport_iport|166|0|275|0|{0|in0|}101|110|}
{2010215002|XXGiport_binding_iport|167|0|277|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}110|105|}
{2010214001|XXGiport_src_flow|168|0|278|0|{0|}110|47|}
{2010007001|XXGobject_proto_object|169|0|279|0|{}101|111|}
{2010604001|XXGgraph_flow_flow|170|0|281|0|{Flow_1|}111|112|}
{2010601001|XXGgraph_vertex_vertex|171|0|283|0|{Partition_by_Key|}111|113|}
{2010212001|XXGvertex_oport_oport|172|0|285|0|{0|out|}113|114|}
{2010213001|XXGoport_dst_flow|173|0|287|0|{0|}114|112|}
{2010211001|XXGvertex_iport_iport|174|0|288|0|{0|in|}113|115|}
{2010007001|XXGobject_proto_object|175|0|290|0|{}113|116|}
{2010212001|XXGvertex_oport_oport|176|0|292|0|{0|out|}116|117|}
{2010006001|XXGobject_psameas_object|177|0|294|0|{metadata|out_metadata|1|0|}117|116|}
{2010211001|XXGvertex_iport_iport|178|0|295|0|{0|in|}116|118|}
{2010006001|XXGobject_psameas_object|179|0|297|0|{metadata|in_metadata|1|0|}118|116|}
{2010006001|XXGobject_psameas_object|180|0|298|0|{Layout|InputLayout|1|0|}113|111|}
{2010006001|XXGobject_psameas_object|181|0|299|0|{key|Key|1|0|}113|111|}
{2010601001|XXGgraph_vertex_vertex|182|0|300|0|{Sort|}111|119|}
{2010212001|XXGvertex_oport_oport|183|0|302|0|{0|out|}119|120|}
{2010211001|XXGvertex_iport_iport|184|0|304|0|{0|in|}119|121|}
{2010214001|XXGiport_src_flow|185|0|306|0|{0|}121|112|}
{2010007001|XXGobject_proto_object|186|0|307|0|{}119|122|}
{2010212001|XXGvertex_oport_oport|187|0|309|0|{0|out|}122|123|}
{2010006001|XXGobject_psameas_object|188|0|311|0|{metadata|out_metadata|1|0|}123|122|}
{2010211001|XXGvertex_iport_iport|189|0|312|0|{0|in|}122|124|}
{2010006001|XXGobject_psameas_object|190|0|314|0|{metadata|in_metadata|1|0|}124|122|}
{2010006001|XXGobject_psameas_object|191|0|315|0|{Layout|OutputLayout|1|0|}119|111|}
{2010006001|XXGobject_psameas_object|192|0|316|0|{key|Key|1|0|}119|111|}
{2010006001|XXGobject_psameas_object|193|0|317|0|{max_core|Max_core|1|0|}119|111|}
{2010212001|XXGvertex_oport_oport|194|0|318|0|{0|out0|}111|125|}
{2010216002|XXGoport_binding_oport|195|0|320|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}125|120|}
{2010211001|XXGvertex_iport_iport|196|0|321|0|{0|in0|}111|126|}
{2010215002|XXGiport_binding_iport|197|0|323|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}126|115|}
{2010601001|XXGgraph_vertex_vertex|198|0|324|0|{RFMT_Extract_universal_key_for_multiplied_records|}83|127|}
{2010212001|XXGvertex_oport_oport|199|0|326|0|{0|out0|}127|128|}
{2010213001|XXGoport_dst_flow|200|0|328|0|{0|}128|86|}
{2010212001|XXGvertex_oport_oport|201|0|329|0|{1|reject0|}127|129|}
{2010212001|XXGvertex_oport_oport|202|0|331|0|{2|error0|}127|130|}
{2010212001|XXGvertex_oport_oport|203|0|333|0|{3|log|}127|131|}
{2010211001|XXGvertex_iport_iport|204|0|335|0|{0|in|}127|132|}
{2010214001|XXGiport_src_flow|205|0|337|0|{0|}132|88|}
{2010007001|XXGobject_proto_object|206|0|338|0|{}127|133|}
{2010212001|XXGvertex_oport_oport|207|0|340|0|{0|out0|}133|134|}
{2010006001|XXGobject_psameas_object|208|0|342|0|{metadata|out0_metadata|1|0|}134|133|}
{2010006001|XXGobject_psameas_object|209|0|343|0|{transform0|transform0|1|0|}134|133|}
{2010212001|XXGvertex_oport_oport|210|0|344|0|{1|reject0|}133|135|}
{2010006001|XXGobject_psameas_object|211|0|346|0|{metadata|reject0_metadata|1|0|}135|133|}
{2010212001|XXGvertex_oport_oport|212|0|347|0|{2|error0|}133|136|}
{2010006001|XXGobject_psameas_object|213|0|349|0|{metadata|error0_metadata|1|0|}136|133|}
{2010212001|XXGvertex_oport_oport|214|0|350|0|{3|log|}133|137|}
{2010006001|XXGobject_psameas_object|215|0|352|0|{metadata|log_metadata|1|0|}137|133|}
{2010211001|XXGvertex_iport_iport|216|0|353|0|{0|in|}133|138|}
{2010006001|XXGobject_psameas_object|217|0|355|0|{metadata|in_metadata|1|0|}138|133|}
{2010006001|XXGobject_psameas_object|218|0|356|0|{in_metadata|out_metadata|0|0|}127|45|}
{2010006001|XXGobject_psameas_object|219|0|357|0|{out0_metadata|out_metadata|0|0|}127|45|}
{2010006001|XXGobject_psameas_object|220|0|358|0|{reject0_metadata|out_metadata|0|0|}127|45|}
{2010006001|XXGobject_psameas_object|221|0|359|0|{transform0|RFMT_XFR|1|0|}127|83|}
{2010601001|XXGgraph_vertex_vertex|222|0|360|0|{RFMT_Split_file_and_generate_hash_key_and_partition_and_record_numbers|}83|59|}
{2010601001|XXGgraph_vertex_vertex|223|0|361|0|{RLP_Merge_records_representing_the_same_entity|}83|32|}
{2010601001|XXGgraph_vertex_vertex|224|0|362|0|{SORT_record_nbr_|}83|139|}
{2010212001|XXGvertex_oport_oport|225|0|364|0|{0|out|}139|140|}
{2010213001|XXGoport_dst_flow|226|0|366|0|{0|}140|38|}
{2010211001|XXGvertex_iport_iport|227|0|367|0|{0|in|}139|141|}
{2010214001|XXGiport_src_flow|228|0|369|0|{0|}141|87|}
{2010007001|XXGobject_proto_object|229|0|370|0|{}139|142|}
{2010212001|XXGvertex_oport_oport|230|0|372|0|{0|out|}142|143|}
{2010006001|XXGobject_psameas_object|231|0|374|0|{metadata|out_metadata|1|0|}143|142|}
{2010211001|XXGvertex_iport_iport|232|0|375|0|{0|in|}142|144|}
{2010006001|XXGobject_psameas_object|233|0|377|0|{metadata|in_metadata|1|0|}144|142|}
{2010006001|XXGobject_psameas_object|234|0|378|0|{in_metadata|out_metadata|0|0|}139|45|}
{2010006001|XXGobject_psameas_object|235|0|379|0|{out_metadata|out_metadata|0|0|}139|45|}
{2010212001|XXGvertex_oport_oport|236|0|380|0|{0|out1|}83|145|}
{2010216002|XXGoport_binding_oport|237|0|382|0|{.5|.5|{0|}1010|}145|33|}
{2010213001|XXGoport_dst_flow|238|0|383|0|{0|}145|7|}
{2010211001|XXGvertex_iport_iport|239|0|384|0|{0|in0|}83|146|}
{2010215002|XXGiport_binding_iport|240|0|386|0|{.5|.5|{0|}1008|}146|64|}
{2010214001|XXGiport_src_flow|241|0|387|0|{0|}146|13|}
{2010006001|XXGobject_psameas_object|242|0|388|0|{MULTIPLY_DML|MLKP_MULTIPLY_DML|1|0|}83|1|}
{2010006001|XXGobject_psameas_object|243|0|389|0|{NORM_XFR|MLKP_NORM_XFR|1|0|}83|1|}
{2010006001|XXGobject_psameas_object|244|0|390|0|{RFMT_XFR|MLKP_RFMT_XFR|1|0|}83|1|}
{2010006001|XXGobject_psameas_object|245|0|391|0|{ROLLUP_XFR|MLKP_ROLLUP_XFR|1|0|}83|1|}
{2010006001|XXGobject_psameas_object|246|0|392|0|{SPLIT_RFMT_DML|MLKP_SPLIT_RFMT_DML|1|0|}83|1|}
{2010006001|XXGobject_psameas_object|247|0|393|0|{SPLIT_RFMT_XFR|MLKP_SPLIT_RFMT_XFR|1|0|}83|1|}
{2010006001|XXGobject_psameas_object|248|0|394|0|{reject0_metadata|out0_metadata|0|0|}59|71|}
{2010006001|XXGobject_psameas_object|249|0|395|0|{transform0|SPLIT_RFMT_XFR|1|0|}59|83|}
{2010006001|XXGobject_psameas_object|250|0|396|0|{out_metadata|MULTIPLY_DML|1|0|}45|83|}
{2010006001|XXGobject_psameas_object|251|0|397|0|{reject_metadata|out0_metadata|0|0|}45|59|}
{2010006001|XXGobject_psameas_object|252|0|398|0|{transform|NORM_XFR|1|0|}45|83|}
{2010006001|XXGobject_psameas_object|253|0|399|0|{out_metadata|SPLIT_RFMT_DML|1|0|}32|83|}
{2010006001|XXGobject_psameas_object|254|0|400|0|{reject_metadata|out_metadata|0|0|}32|45|}
{2010006001|XXGobject_psameas_object|255|0|401|0|{transform|ROLLUP_XFR|1|0|}32|83|}
{2010006001|XXGobject_psameas_object|256|0|402|0|{in1_metadata|out0_metadata|0|0|}14|71|}
{2010006001|XXGobject_psameas_object|257|0|403|0|{reject0_metadata|out_metadata|0|0|}14|32|}
{2010006001|XXGobject_psameas_object|258|0|404|0|{reject1_metadata|out0_metadata|0|0|}14|71|}
{2010006001|XXGobject_psameas_object|259|0|405|0|{transform|MERGE_ALL_LKPS_XFR|1|0|}14|1|}
{2010601001|XXGgraph_vertex_vertex|260|0|406|0|{ICFF_HK_UK_Lookup_Template|}1|147|}
{2010007001|XXGobject_proto_object|261|0|408|0|{}147|148|}
{2010601001|XXGgraph_vertex_vertex|262|0|410|0|{MUltifile_Lookup|}1|83|}
{2010601001|XXGgraph_vertex_vertex|263|0|411|0|{NORM_Split_non_matching_records_from_each_dimension|}1|149|}
{2010212001|XXGvertex_oport_oport|264|0|413|0|{0|out|}149|150|}
{2010212001|XXGvertex_oport_oport|265|0|415|0|{1|reject|}149|151|}
{2010212001|XXGvertex_oport_oport|266|0|417|0|{2|error|}149|152|}
{2010212001|XXGvertex_oport_oport|267|0|419|0|{3|log|}149|153|}
{2010211001|XXGvertex_iport_iport|268|0|421|0|{0|in|}149|154|}
{2010214001|XXGiport_src_flow|269|0|423|0|{0|}154|10|}
{2010007001|XXGobject_proto_object|270|0|424|0|{}149|155|}
{2010212001|XXGvertex_oport_oport|271|0|426|0|{0|out|}155|156|}
{2010006001|XXGobject_psameas_object|272|0|428|0|{metadata|out_metadata|1|0|}156|155|}
{2010212001|XXGvertex_oport_oport|273|0|429|0|{1|reject|}155|157|}
{2010006001|XXGobject_psameas_object|274|0|431|0|{metadata|reject_metadata|1|0|}157|155|}
{2010212001|XXGvertex_oport_oport|275|0|432|0|{2|error|}155|158|}
{2010006001|XXGobject_psameas_object|276|0|434|0|{metadata|error_metadata|1|0|}158|155|}
{2010212001|XXGvertex_oport_oport|277|0|435|0|{3|log|}155|159|}
{2010006001|XXGobject_psameas_object|278|0|437|0|{metadata|log_metadata|1|0|}159|155|}
{2010211001|XXGvertex_iport_iport|279|0|438|0|{0|in|}155|160|}
{2010006001|XXGobject_psameas_object|280|0|440|0|{metadata|in_metadata|1|0|}160|155|}
{2010006001|XXGobject_psameas_object|281|0|441|0|{in_metadata|out1_metadata|0|0|}149|161|}
{2010212001|XXGvertex_oport_oport|282|0|443|0|{0|out0|}161|162|}
{2010212001|XXGvertex_oport_oport|283|0|445|0|{1|out1|}161|163|}
{2010213001|XXGoport_dst_flow|284|0|447|0|{0|}163|10|}
{2010212001|XXGvertex_oport_oport|285|0|448|0|{2|reject0|}161|164|}
{2010212001|XXGvertex_oport_oport|286|0|450|0|{3|reject1|}161|165|}
{2010212001|XXGvertex_oport_oport|287|0|452|0|{4|error0|}161|166|}
{2010212001|XXGvertex_oport_oport|288|0|454|0|{5|error1|}161|167|}
{2010212001|XXGvertex_oport_oport|289|0|456|0|{6|log|}161|168|}
{2010211001|XXGvertex_iport_iport|290|0|458|0|{0|in|}161|169|}
{2010214001|XXGiport_src_flow|291|0|460|0|{0|}169|12|}
{2010007001|XXGobject_proto_object|292|0|461|0|{}161|170|}
{2010212001|XXGvertex_oport_oport|293|0|463|0|{0|out0|}170|171|}
{2010006001|XXGobject_psameas_object|294|0|465|0|{metadata|out0_metadata|1|0|}171|170|}
{2010006001|XXGobject_psameas_object|295|0|466|0|{transform0|transform0|1|0|}171|170|}
{2010212001|XXGvertex_oport_oport|296|0|467|0|{1|out1|}170|172|}
{2010006001|XXGobject_psameas_object|297|0|469|0|{metadata|out1_metadata|1|0|}172|170|}
{2010006001|XXGobject_psameas_object|298|0|470|0|{transform1|transform1|1|0|}172|170|}
{2010212001|XXGvertex_oport_oport|299|0|471|0|{2|reject0|}170|173|}
{2010006001|XXGobject_psameas_object|300|0|473|0|{metadata|reject0_metadata|1|0|}173|170|}
{2010212001|XXGvertex_oport_oport|301|0|474|0|{3|reject1|}170|174|}
{2010006001|XXGobject_psameas_object|302|0|476|0|{metadata|reject1_metadata|1|0|}174|170|}
{2010212001|XXGvertex_oport_oport|303|0|477|0|{4|error0|}170|175|}
{2010006001|XXGobject_psameas_object|304|0|479|0|{metadata|error0_metadata|1|0|}175|170|}
{2010212001|XXGvertex_oport_oport|305|0|480|0|{5|error1|}170|176|}
{2010006001|XXGobject_psameas_object|306|0|482|0|{metadata|error1_metadata|1|0|}176|170|}
{2010212001|XXGvertex_oport_oport|307|0|483|0|{6|log|}170|177|}
{2010006001|XXGobject_psameas_object|308|0|485|0|{metadata|log_metadata|1|0|}177|170|}
{2010211001|XXGvertex_iport_iport|309|0|486|0|{0|in|}170|178|}
{2010006001|XXGobject_psameas_object|310|0|488|0|{metadata|in_metadata|1|0|}178|170|}
{2010006001|XXGobject_psameas_object|311|0|489|0|{in_metadata|out_metadata|0|0|}161|14|}
{2010006001|XXGobject_psameas_object|312|0|490|0|{reject0_metadata|out_metadata|0|0|}161|14|}
{2010006001|XXGobject_psameas_object|313|0|491|0|{reject1_metadata|out_metadata|0|0|}161|14|}
{2010006001|XXGobject_psameas_object|314|0|492|0|{reject_metadata|out1_metadata|0|0|}149|161|}
{2010601001|XXGgraph_vertex_vertex|315|0|493|0|{RFMT_Distinguish_Non_Matching_Records|}1|161|}
{2010601001|XXGgraph_vertex_vertex|316|0|494|0|{RFMT_Split_ICFF_and_Regular_Lookup_records|}1|71|}
{2010601001|XXGgraph_vertex_vertex|317|0|495|0|{Regular_HK_UK_Lookup_Template|}1|179|}
{2010007001|XXGobject_proto_object|318|0|497|0|{}179|180|}
{2010601001|XXGgraph_vertex_vertex|319|0|499|0|{Regular_Serial_Lookup|}1|181|}
{2010601001|XXGgraph_vertex_vertex|320|0|501|0|{RFMT_Extract_Universal_Key|}181|182|}
{2010212001|XXGvertex_oport_oport|321|0|503|0|{0|out0|}182|183|}
{2010212001|XXGvertex_oport_oport|322|0|505|0|{1|reject0|}182|184|}
{2010212001|XXGvertex_oport_oport|323|0|507|0|{2|error0|}182|185|}
{2010212001|XXGvertex_oport_oport|324|0|509|0|{3|log|}182|186|}
{2010211001|XXGvertex_iport_iport|325|0|511|0|{0|in|}182|187|}
{2010007001|XXGobject_proto_object|326|0|513|0|{}182|188|}
{2010212001|XXGvertex_oport_oport|327|0|515|0|{0|out0|}188|189|}
{2010006001|XXGobject_psameas_object|328|0|517|0|{metadata|out0_metadata|1|0|}189|188|}
{2010006001|XXGobject_psameas_object|329|0|518|0|{transform0|transform0|1|0|}189|188|}
{2010212001|XXGvertex_oport_oport|330|0|519|0|{1|reject0|}188|190|}
{2010006001|XXGobject_psameas_object|331|0|521|0|{metadata|reject0_metadata|1|0|}190|188|}
{2010212001|XXGvertex_oport_oport|332|0|522|0|{2|error0|}188|191|}
{2010006001|XXGobject_psameas_object|333|0|524|0|{metadata|error0_metadata|1|0|}191|188|}
{2010212001|XXGvertex_oport_oport|334|0|525|0|{3|log|}188|192|}
{2010006001|XXGobject_psameas_object|335|0|527|0|{metadata|log_metadata|1|0|}192|188|}
{2010211001|XXGvertex_iport_iport|336|0|528|0|{0|in|}188|193|}
{2010006001|XXGobject_psameas_object|337|0|530|0|{metadata|in_metadata|1|0|}193|188|}
{2010006001|XXGobject_psameas_object|338|0|531|0|{in_metadata|out0_metadata|0|0|}182|71|}
{2010006001|XXGobject_psameas_object|339|0|532|0|{out0_metadata|out0_metadata|0|0|}182|71|}
{2010006001|XXGobject_psameas_object|340|0|533|0|{reject0_metadata|out0_metadata|0|0|}182|71|}
{2010006001|XXGobject_psameas_object|341|0|534|0|{transform0|RFMT_XFR|1|0|}182|181|}
{2010212001|XXGvertex_oport_oport|342|0|535|0|{0|out0|}181|194|}
{2010216002|XXGoport_binding_oport|343|0|537|0|{.5|.5|{0|}683|}194|183|}
{2010213001|XXGoport_dst_flow|344|0|538|0|{0|}194|11|}
{2010211001|XXGvertex_iport_iport|345|0|539|0|{0|in0|}181|195|}
{2010215002|XXGiport_binding_iport|346|0|541|0|{.5|.5|{0|}684|}195|187|}
{2010214001|XXGiport_src_flow|347|0|542|0|{0|}195|9|}
{2010006001|XXGobject_psameas_object|348|0|543|0|{RFMT_XFR|SLKP_RFMT_XFR|1|0|}181|1|}
{2010601001|XXGgraph_vertex_vertex|349|0|544|0|{Replicate|}1|196|}
{2010212001|XXGvertex_oport_oport|350|0|546|0|{0|out|}196|197|}
{2010213001|XXGoport_dst_flow|351|0|548|0|{0|}197|13|}
{2010213001|XXGoport_dst_flow|352|0|549|0|{1|}197|9|}
{2010211001|XXGvertex_iport_iport|353|0|550|0|{0|in|}196|198|}
{2010214001|XXGiport_src_flow|354|0|552|0|{0|}198|8|}
{2010007001|XXGobject_proto_object|355|0|553|0|{}196|199|}
{2010212001|XXGvertex_oport_oport|356|0|555|0|{0|out|}199|200|}
{2010006001|XXGobject_psameas_object|357|0|557|0|{metadata|out_metadata|1|0|}200|199|}
{2010211001|XXGvertex_iport_iport|358|0|558|0|{0|in|}199|201|}
{2010006001|XXGobject_psameas_object|359|0|560|0|{metadata|in_metadata|1|0|}201|199|}
{2010006001|XXGobject_psameas_object|360|0|561|0|{in_metadata|out0_metadata|0|0|}196|71|}
{2010006001|XXGobject_psameas_object|361|0|562|0|{out_metadata|out0_metadata|0|0|}196|71|}
{2010601001|XXGgraph_vertex_vertex|362|0|563|0|{Version_Log|}1|202|}
{2010605001|XXGgraph_legend_legend|363|0|565|0|{0|}202|203|}
{2010241001|XXGlegend_face_face|364|0|567|0|{}203|204|}
{2010605001|XXGgraph_legend_legend|365|0|569|0|{1|}202|205|}
{2010241001|XXGlegend_face_face|366|0|571|0|{}205|206|}
{2010605001|XXGgraph_legend_legend|367|0|573|0|{2|}202|207|}
{2010241001|XXGlegend_face_face|368|0|575|0|{}207|208|}
{2010605001|XXGgraph_legend_legend|369|0|577|0|{3|}202|209|}
{2010241001|XXGlegend_face_face|370|0|579|0|{}209|210|}
{2010605001|XXGgraph_legend_legend|371|0|581|0|{4|}202|211|}
{2010241001|XXGlegend_face_face|372|0|583|0|{}211|212|}
{2010605001|XXGgraph_legend_legend|373|0|585|0|{5|}202|213|}
{2010241001|XXGlegend_face_face|374|0|587|0|{}213|214|}
{2010605001|XXGgraph_legend_legend|375|0|589|0|{6|}202|215|}
{2010241001|XXGlegend_face_face|376|0|591|0|{}215|216|}
{2010605001|XXGgraph_legend_legend|377|0|593|0|{7|}202|217|}
{2010241001|XXGlegend_face_face|378|0|595|0|{}217|218|}
{2010605001|XXGgraph_legend_legend|379|0|597|0|{8|}202|219|}
{2010241001|XXGlegend_face_face|380|0|599|0|{}219|220|}
{2010605001|XXGgraph_legend_legend|381|0|601|0|{9|}202|221|}
{2010241001|XXGlegend_face_face|382|0|603|0|{}221|222|}
{2010605001|XXGgraph_legend_legend|383|0|605|0|{10|}202|223|}
{2010241001|XXGlegend_face_face|384|0|607|0|{}223|224|}
{2010605001|XXGgraph_legend_legend|385|0|609|0|{11|}202|225|}
{2010241001|XXGlegend_face_face|386|0|611|0|{}225|226|}
{2010605001|XXGgraph_legend_legend|387|0|613|0|{12|}202|227|}
{2010241001|XXGlegend_face_face|388|0|615|0|{}227|228|}
{2010605001|XXGgraph_legend_legend|389|0|617|0|{13|}202|229|}
{2010241001|XXGlegend_face_face|390|0|619|0|{}229|230|}
{2010605001|XXGgraph_legend_legend|391|0|621|0|{14|}202|231|}
{2010241001|XXGlegend_face_face|392|0|623|0|{}231|232|}
{2010605001|XXGgraph_legend_legend|393|0|625|0|{15|}202|233|}
{2010241001|XXGlegend_face_face|394|0|627|0|{}233|234|}
{2010605001|XXGgraph_legend_legend|395|0|629|0|{16|}202|235|}
{2010241001|XXGlegend_face_face|396|0|631|0|{}235|236|}
{2010605001|XXGgraph_legend_legend|397|0|633|0|{17|}202|237|}
{2010241001|XXGlegend_face_face|398|0|635|0|{}237|238|}
{2010605001|XXGgraph_legend_legend|399|0|637|0|{18|}202|239|}
{2010241001|XXGlegend_face_face|400|0|639|0|{}239|240|}
{2010605001|XXGgraph_legend_legend|401|0|641|0|{19|}202|241|}
{2010241001|XXGlegend_face_face|402|0|643|0|{}241|242|}
{2010605001|XXGgraph_legend_legend|403|0|645|0|{20|}202|243|}
{2010241001|XXGlegend_face_face|404|0|647|0|{}243|244|}
{2010605001|XXGgraph_legend_legend|405|0|649|0|{21|}202|245|}
{2010241001|XXGlegend_face_face|406|0|651|0|{}245|246|}
{2010605001|XXGgraph_legend_legend|407|0|653|0|{22|}202|247|}
{2010241001|XXGlegend_face_face|408|0|655|0|{}247|248|}
{2010605001|XXGgraph_legend_legend|409|0|657|0|{23|}202|249|}
{2010241001|XXGlegend_face_face|410|0|659|0|{}249|250|}
{2010605001|XXGgraph_legend_legend|411|0|661|0|{24|}202|251|}
{2010241001|XXGlegend_face_face|412|0|663|0|{}251|252|}
{2010605001|XXGgraph_legend_legend|413|0|665|0|{25|}202|253|}
{2010241001|XXGlegend_face_face|414|0|667|0|{}253|254|}
{2010212001|XXGvertex_oport_oport|415|0|669|0|{0|all|}1|255|}
{2010216002|XXGoport_binding_oport|416|0|671|0|{.5|.5|{0|}14218|}255|162|}
{2010212001|XXGvertex_oport_oport|417|0|672|0|{1|non_matching|}1|256|}
{2010216002|XXGoport_binding_oport|418|0|674|0|{.5|.5|{0|}14216|}256|150|}
{2010211001|XXGvertex_iport_iport|419|0|675|0|{0|in0|}1|257|}
{2010215002|XXGiport_binding_iport|420|0|677|0|{.5|.5|{0|}14221|}257|76|}
{2010109001|XXGobject_property_value|421|0|678|0|{0|TrackingThumbprint|72|}1|258|}
