@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|675|rel_count|1095|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_DML/dxf_metadata.dml";

// The following function maps the control file data to its control type format.
out :: gen_ctl_data(ctl_filename) =
begin
        let string("") cdata="";
        let string("") fld_nm="";
        let string("") value="";
        let string("") fld_list1=string_concat(string_replace(string_join(record_info_item(expand_type("include '~$PUB_DXF_DML/dxf_metadata.dml'; metadata type = dxf_control_type1;"), "name"), "\\n"), "_", ""), "\\n");
        let string("") fld_list2=string_concat(string_replace(string_join(record_info_item(expand_type("include '~$PUB_DXF_DML/dxf_metadata.dml'; metadata type = dxf_control_type2;"), "name"), "\\n"), "_", ""), "\\n");
        let string("") fld_list3=string_concat(string_replace(string_join(record_info_item(expand_type("include '~$PUB_DXF_DML/dxf_metadata.dml'; metadata type = dxf_control_type3;"), "name"), "\\n"), "_", ""), "\\n");
        let string("") fld_list=string_concat(string_replace(string_join(record_info_item(expand_type("include '~$PUB_DXF_DML/dxf_metadata.dml'; metadata type = dxf_control;"), "name"), "\\n"), "_", ""), "\\n");

        let string("")[int] control_vec = string_split_no_empty(read_file(ctl_filename), "\\n");
        for (let int i=0, i < length_of(control_vec))
        begin
                fld_nm=string_concat(fld_nm, string_concat(string_downcase(string_replace(string_lrtrim(string_split(control_vec[i], "=")[0]), "_", "")), "\\n"));
                value=string_downcase(string_lrtrim(string_split(control_vec[i], "=")[1]));
                //cdata = if(ends_with(fld_nm,"fielddelimiter\\n") && value member [vector "\\x01", "\\001", "'\\\\001'", "'\\\\x01'"])
                  cdata = if(ends_with(fld_nm,"fielddelimiter\\n"))
                                 string_concat(cdata, string_concat("\\\\001", "\\n"))
                        //else if(ends_with(fld_nm,"recorddelimiter\\n") && value member [vector "\\n", "'\\\\n'", ""] )
                          else if(ends_with(fld_nm,"recorddelimiter\\n"))
                                 string_concat(cdata, string_concat("\\\\n", "\\n"))
                        else if(is_blank(value))
                                string_concat(cdata, string_concat("XXXXX","\\n")) // This defaults to XXXXX incase value is blank.
                        else
                                string_concat(cdata, string_concat(value, "\\n"));
                
        end;
        out :: if(fld_list1 == fld_nm) reinterpret_as(dxf_control_type1, cdata) 
                  else if (fld_list2 == fld_nm) reinterpret_as(dxf_control_type2, cdata) 
                  else if (fld_list3 == fld_nm) reinterpret_as(dxf_control_type3, cdata) 
                  else if (fld_list == fld_nm) reinterpret_as(dxf_control, cdata) 
                  else force_error("ERROR: " + ctl_filename + " is not inline to either of dxf_control_type1, dxf_control_type2, dxf_control_type3, dxf_control  type(s) in $PUB_DXF_DML/dxf_metadata.dml file." + "\\nFields in dxf_control_type1 type - " + fld_list1 + "\\nFields in dxf_control_type2 type - " + fld_list2 + "\\nFields in dxf_control_type3 type - " + fld_list3 + "\\nFields in dxf_control type - " + fld_list + "\\nFields in control file - " + fld_nm + "\\nAborting the graph.");
end;

// The following function maps the metadata file contents to its metadata type format.
out :: gen_meta_data(meta_filename, datalake_source_type = "datalake") =
begin
        //20170605 - Following thee lines are added to identify the source is ORX for Y2VLLSP to fix meta file issue.
        let string("")[int] mfilevec = string_split_no_empty(meta_filename, "/");
        let string("") mfilenm = mfilevec[length_of(mfilevec) - 1];
        let decimal("") flag = if (("RX1" member string_split_no_empty(mfilenm,"_") && "Y2VLLSP" member string_split_no_empty(mfilenm,"_")) \|\| ("RX2" member string_split_no_empty(mfilenm,"_") && "Y2VLLSP" member string_split_no_empty(mfilenm,"_"))) 1 else 0;
        
        let string("")[int] meta_vec = string_split_no_empty(read_file(meta_filename), "\\n");
        let dxf_metadata dxf_fld_vec = allocate_with_defaults();
        let ecg_metadata ecg_fld_vec = allocate_with_defaults();
        let dxf_metadata[int] dxf_mdata_vec = [vector];
        
        //20170322: Header record in meta will remain same for both sources.
        /*let decimal("") hdr_flg = if(datalake_source_type == "datalake")
                                    if(string_downcase(meta_vec[0]) == "source_name\|schema_name\|table_name\|column_name\|data_type\|data_length\|data_scale\|format\|primary_keys\|column_id") 1 else 0
                                  else if(datalake_source_type == "local")
                                    if(string_downcase(meta_vec[0]) == "source_name\|schema_name\|table_name\|column_name\|data_type\|data_length\|data_scale\|format\|primary_keys\|column_id\|column_alias_name") 1 else 0;
         */ 
         
        let decimal("") hdr_flg = if(string_downcase(meta_vec[0]) == "source_name\|schema_name\|table_name\|column_name\|data_type\|data_length\|data_scale\|format\|primary_keys\|column_id") 1 else 0 ;
        for (let int i=hdr_flg, i < length_of(meta_vec))
                begin

                       /*if(datalake_source_type == "datalake")
                                dxf_fld_vec = reinterpret_as(dxf_metadata, string_concat(meta_vec[i], "\\n"));
                        else if(datalake_source_type == "local") begin
                                ecg_fld_vec = reinterpret_as(ecg_metadata, string_concat(meta_vec[i], "\\n"));
                                dxf_fld_vec.source_name = ecg_fld_vec.source_name;
                                dxf_fld_vec.schema_name = ecg_fld_vec.schema_name;
                                dxf_fld_vec.table_name = ecg_fld_vec.table_name;
                                dxf_fld_vec.column_name = ecg_fld_vec.column_name;
                                dxf_fld_vec.data_type = ecg_fld_vec.data_type;
                                dxf_fld_vec.data_length = ecg_fld_vec.data_length;
                                dxf_fld_vec.data_scale = ecg_fld_vec.data_scale;
                                dxf_fld_vec.format = ecg_fld_vec.format;
                                dxf_fld_vec.primary_keys = ecg_fld_vec.primary_keys;
                                dxf_fld_vec.column_id = ecg_fld_vec.column_id;
                        end  */
                        //20170322: dxf metadata will remain same for both source types-datalake or local
                        if (flag)  // 20170605 - Code introduced to fix the R2VLLSP issue for meta file in ORX
                                dxf_fld_vec = reinterpret_as(dxf_metadata, string_concat(string_replace(meta_vec[i],"\@\@CND","_AT__AT_CND"), "\\n"));
                        else
                                dxf_fld_vec = reinterpret_as(dxf_metadata, string_concat(meta_vec[i], "\\n"));
                        
                        if(! is_valid(dxf_fld_vec)) force_error("ERROR: Field property of " + meta_vec[i] + " record is having less number of delimiters.\\nAborting the graph.");

                        //fld_vec = reinterpret_as(dxf_metadata, string_concat(meta_vec[i], "\\n"));
                
               /* Added on 20170425 to handle the micro seconds coming CDC_TS in Datalake file. Testing was done on the test files provided by Datalake team of RCMBRP */ 
               if( ( string_lrtrim(dxf_fld_vec.column_name) == "CDC_TS") && ( (string_lrtrim(dxf_fld_vec.data_type) member [vector "DATETIME", "TIMESTAMP"]) && (string_lrtrim(dxf_fld_vec.format) member [vector "yyyy-MM-dd HH:mm:ss.SSSSSS"]) ) )
                        begin
                                dxf_fld_vec.data_type = "DATETIME";
                                dxf_fld_vec.format = "YYYY-MM-DD HH24:MI:SS.nnnnnn";
                                dxf_fld_vec.data_length = "10"; // Can be any thing for the DATETIME formats.
                                dxf_fld_vec.data_scale = "6"; // Can be any thing for the DATETIME formats.
                        end
                       else if( ( string_lrtrim(dxf_fld_vec.column_name) == "CDC_TS") \|\| ( (string_lrtrim(dxf_fld_vec.data_type) member [vector "DATETIME", "TIMESTAMP"]) && (string_lrtrim(dxf_fld_vec.format) member [vector "YYYY-MM-DD HH24:MI:SS.nnn", "%yyyy-%mm-%dd-%hh.%nn.%ss.3", "yyyy-MM-dd HH:mm:ss.SSS", "%yyyy-%mm-%dd-%hh:%nn:%ss.3"]) ) )
                        begin
                                dxf_fld_vec.data_type = "DATETIME";
                                dxf_fld_vec.format = "YYYY-MM-DD HH24:MI:SS.nnn";
                                dxf_fld_vec.data_length = "10"; // Can be any thing for the DATETIME formats.
                                dxf_fld_vec.data_scale = "6"; // Can be any thing for the DATETIME formats.
                        end
                        
                        
                        else if( string_lrtrim(dxf_fld_vec.data_type) member [vector "DATETIME"] && string_lrtrim(dxf_fld_vec.format) member [vector "YYYYMMDDHH24MISS" ] )
                        begin
                                dxf_fld_vec.data_type = "DATETIME";
                                dxf_fld_vec.format = "YYYYMMDDHH24MISS";
                                dxf_fld_vec.data_length = "10"; // Can be any thing for the DATETIME formats.
                                dxf_fld_vec.data_scale = "6"; // Can be any thing for the DATETIME formats.
                        end
                        else if( string_lrtrim(dxf_fld_vec.data_type) member [vector "DATE"] && string_lrtrim(dxf_fld_vec.format) member [vector "%yyyy-%mm-%dd" ] )
                        begin
                                dxf_fld_vec.data_type = "DATE";
                                dxf_fld_vec.format = "YYYY-MM-DD";
                                dxf_fld_vec.data_length = "10"; // Can be any thing for the DATETIME formats.
                                dxf_fld_vec.data_scale = "0"; // Can be any thing for the DATETIME formats.
                        end
                        else if(string_lrtrim(dxf_fld_vec.data_type) member [vector "CHAR", "CHARACTER", "STRING", "VARCHAR2", "VARCHAR"])
                                dxf_fld_vec.data_type = "STRING";
                        else if(string_lrtrim(dxf_fld_vec.data_type) member [vector "DECIMAL", "NUMERIC", "NUMBER", "NUMBER FLOATING POINT"])
                                dxf_fld_vec.data_type = "DECIMAL";
                        else 
                                force_error ("ERROR: New Data type \\"" + dxf_fld_vec.data_type + "\\" (or) New Data format \\"" + dxf_fld_vec.format + "\\" identified. Please request Framework team to include the new data type (or) data format.\\nAborting the graph.");
                
                        if (is_null(dxf_fld_vec.data_scale) \|\| string_lrtrim(dxf_fld_vec.data_scale) == "")
                                dxf_fld_vec.data_scale = "0";
                        if((dxf_fld_vec.column_name != "CDC_TS") && (is_null(dxf_fld_vec.format) \|\| string_lrtrim(dxf_fld_vec.format) == ""))
                                dxf_fld_vec.format = "XXXXX";
                        if(is_null(dxf_fld_vec.primary_keys) \|\| string_lrtrim(dxf_fld_vec.primary_keys) == "")
                                dxf_fld_vec.primary_keys = "N";
                        if(is_null(dxf_fld_vec.source_name) \|\| string_lrtrim(dxf_fld_vec.source_name) == "" \|\| is_null(dxf_fld_vec.schema_name) \|\| string_lrtrim(dxf_fld_vec.schema_name) == "" \|\| is_null(dxf_fld_vec.table_name) \|\| string_lrtrim(dxf_fld_vec.table_name) == "" \|\| is_null(dxf_fld_vec.column_name) \|\| string_lrtrim(dxf_fld_vec.column_name) == "" \|\| is_null(dxf_fld_vec.data_type) \|\| string_lrtrim(dxf_fld_vec.data_type) == "" \|\| is_null(dxf_fld_vec.data_length) \|\| string_lrtrim(dxf_fld_vec.data_length) == "" \|\| is_null(dxf_fld_vec.column_id) \|\| string_lrtrim(dxf_fld_vec.column_id) == "")
                                force_error("ERROR: " + meta_filename + " properties such as source_name, schema_name, table_name, column_name, data_type, data_length, column_id is/are coming blank. Aborting the graph.");
                        dxf_mdata_vec = vector_append(dxf_mdata_vec, dxf_fld_vec);  
                end
        
        out :: dxf_mdata_vec;
end;


// The following function takes metadata file, control file and generates dml corresponds to it.
out :: gen_datalake_dml_without_maxlength(meta_filename, ctl_filename, datalake_source_type='datalake') =
begin
        
        let dxf_metadata[int] meta_vec = meta_filename;
        let dxf_control ctrl_info = ctl_filename;
        let dml_field_info_vec dml_fields = [vector];
        let string("") dml="record\\nend";
        /*let string("") delim=if(string_lrtrim(ctrl_info.field_delimiter) != "XXXXX") '"' + string_lrtrim(string_replace(ctrl_info.field_delimiter, "'", "")) + '"' else "\\"\\\\001\\""; */
        let string("") delim=if(string_lrtrim(ctrl_info.field_delimiter) != "XXXXX") '"' + string_lrtrim(string_replace(string_replace(ctrl_info.field_delimiter, "'", ""), '"', '')) + '"' else "\\"\\\\001\\""; 

        for (let int i = 0, i < length_of(meta_vec)) 
        begin
                if( i == length_of(meta_vec) - 1 && string_downcase(meta_vec[i].column_name) == "newline")
                        dml_fields = vector_append(dml_fields, 
                                        make_field(string_downcase(meta_vec[i].column_name), 
                                                'string(1)', 
                                                default = if(string_lrtrim(ctrl_info.record_delimiter) != "XXXXX") '"' + string_lrtrim(string_replace(string_replace(ctrl_info.record_delimiter, "'", ""), 
'"', '')) + '"' else "\\"\\\\n\\""));

                if( i == length_of(meta_vec) - 1 )
                        /*delim=if(string_lrtrim(ctrl_info.record_delimiter) != "XXXXX") '"' + string_lrtrim(string_replace(ctrl_info.record_delimiter, "'", "")) + '"' else "\\"\\\\n\\""; */
                        delim=if(string_lrtrim(ctrl_info.record_delimiter) != "XXXXX") '"' + string_lrtrim(string_replace(string_replace(ctrl_info.record_delimiter, "'", ""), '"', '')) + '"' else "\\"\\\\n\\""; 
                if ( string_downcase(meta_vec[i].column_name) != "newline" )
                        dml_fields = vector_append(dml_fields, make_field(string_downcase(meta_vec[i].column_name), 
                                                              if (meta_vec[i].data_type member [vector "STRING"])
                                                                        if(meta_vec[i].data_length == "0")      // if length is zero creating delimited column
                                                                                'string('+delim+')' 
                                                                        else
                                                                                'string('+delim+')'  /*'string('+delim+', maximum_length=' + meta_vec[i].data_length + ')' */
                                                              else if (meta_vec[i].data_type member [vector "DATE", "DATETIME"] )
                                                              if(meta_vec[i].format member [vector "YYYY-MM-DD HH24:MI:SS.nnnnnn"]) /* Added on 20170425 to handle the micro seconds coming CDC_TS in Datalake file. Testing was done on the test files provided by Datalake team of RCMBRP */
                                                                                'datetime("YYYY-MM-DD HH24:MI:SS.nnnnnn")('+delim+')' 
                                                                        else if(meta_vec[i].format member [vector "YYYY-MM-DD HH24:MI:SS.nnn", "%yyyy-%mm-%dd"]) 
                                                                                'datetime("YYYY-MM-DD HH24:MI:SS.nnn")('+delim+')' 
                                                                              
                                                                        else if(meta_vec[i].format == "YYYYMMDDHH24MISS")
                                                                                'datetime("' + meta_vec[i].format + '")('+delim+')' 
                                                                        else
                                                                                force_error ("\\n\\nERROR: \\"" + meta_vec[i].format + "\\" is not listed as valid DATE/DATETIME format in the graph. Please request Framework team to include \\"" + meta_vec[i].format + "\\" format for type \\"" + meta_vec[i].data_type + "\\" in gen_datalake_dml_without_maxlength() function to resolve the error.\\n\\n")
                                                              else if (meta_vec[i].data_type member [vector "DECIMAL"])
                                                                        if(meta_vec[i].data_length == "0" && meta_vec[i].data_scale == "0") // if length is zero creating delimited column
                                                                                'decimal('+delim+')' 
                                                                        else if(meta_vec[i].data_length == "0" && meta_vec[i].data_scale != "0") // if length is zero and precision is present creating delimited column with precision
                                                                                'decimal('+delim+'.' + meta_vec[i].data_scale + ')'
                                                                        else if (meta_vec[i].data_scale == "0") 
                                                                                'decimal('+delim+')' /*'decimal('+delim+', maximum_length='+meta_vec[i].data_length+')'*/
                                                                        else //if (meta_vec[i].data_scale != "0") 
                                                                                'decimal('+delim+'.'+meta_vec[i].data_scale+')'  /*'decimal('+delim+'.'+meta_vec[i].data_scale+', maximum_length='+meta_vec[i].data_length+')'*/
                                                              else
                                                                        force_error("\\n\\nERROR: New data type which is not listed in the function is identified. Please request Framework team to include the new type - \\"" + meta_vec[i].data_type + "\\" in gen_datalake_dml_without_maxlength() function to resolve the error.\\n\\n")
                                        , default=if(meta_vec[i].primary_keys == "N")"\\"\\""  else "", nullable= if(meta_vec[i].primary_keys == "N") 1 else 0));
                /*if( i == 0 && string_downcase(meta_vec[(length_of(meta_vec) - 1)].column_name) != "newline")
                        dml = add_field(dml, "newline", 'string(1)', default = if(string_lrtrim(ctrl_info.record_delimiter) != "XXXXX") '"' + string_lrtrim(string_replace(string_replace(ctrl_info.record_delimiter, "'", ""), '"', '')) + '"' else "\\"\\\\n\\"");*/
        end;
        out :: add_fields(dml, dml_fields);
end;

// The following function takes metadata file, control file and generates dml with max_length corresponds to it.
out :: gen_datalake_dml(meta_filename, ctl_filename, datalake_source_type='datalake') =
begin
        
        let dxf_metadata[int] meta_vec = meta_filename;
        let dxf_control ctrl_info = ctl_filename;
        let dml_field_info_vec dml_fields = [vector];
        let string("") dml="//Added extra sign byte and decimal point byte to length for all DECIMAL fields.\\nrecord\\nend";
        /*let string("") delim=if(string_lrtrim(ctrl_info.field_delimiter) != "XXXXX") '"' + string_lrtrim(string_replace(ctrl_info.field_delimiter, "'", "")) + '"' else "\\"\\\\001\\""; */
        let string("") delim=if(string_lrtrim(ctrl_info.field_delimiter) != "XXXXX") '"' + string_lrtrim(string_replace(string_replace(ctrl_info.field_delimiter, "'", ""), '"', '')) + '"' else "\\"\\\\001\\""; 

        for (let int i = 0, i < length_of(meta_vec)) 
        begin
                if( i == length_of(meta_vec) - 1 && string_downcase(meta_vec[i].column_name) == "newline" )
                        dml_fields = vector_append(dml_fields, make_field(string_downcase(meta_vec[i].column_name), 'string(1)', default = if(string_lrtrim(ctrl_info.record_delimiter) != "XXXXX") '"' + string_lrtrim(string_replace(string_replace(ctrl_info.record_delimiter, "'", ""), '"', '')) + '"' else "\\"\\\\n\\""));
                //if ( string_downcase(meta_vec[i].column_name) != "newline" )
                else
                        dml_fields = vector_append(dml_fields, make_field(string_downcase(meta_vec[i].column_name), 
                                                              if (meta_vec[i].data_type member [vector "STRING"])
                                                                        if(meta_vec[i].data_length == "0")      // if length is zero creating delimited column
                                                                                'string('+delim+')' 
                                                                        else
                                                                                'string('+delim+', maximum_length=' + meta_vec[i].data_length + ')'
                                                              else if(meta_vec[i].format member [vector "YYYY-MM-DD HH24:MI:SS.nnnnnn"]) /* Added on 20170425 to handle the micro seconds coming CDC_TS in Datalake file. Testing was done on the test files provided by Datalake team of RCMBRP */
                                                                                'datetime("YYYY-MM-DD HH24:MI:SS.nnnnnn")('+delim+')' 
                                                              else if (meta_vec[i].data_type member [vector "DATE", "DATETIME"] )
                                                                        if(meta_vec[i].format member [vector "YYYY-MM-DD HH24:MI:SS.nnn", "%yyyy-%mm-%dd"]) 
                                                                                'datetime("YYYY-MM-DD HH24:MI:SS.nnn")('+delim+')' 
                                                                        else if(meta_vec[i].format == "YYYYMMDDHH24MISS")
                                                                                'datetime("' + meta_vec[i].format + '")('+delim+')' 
                                                                        else
                                                                                force_error ("\\n\\nERROR: \\"" + meta_vec[i].format + "\\" is not listed as valid DATE/DATETIME format in the graph. Please request Framework team to include \\"" + meta_vec[i].format + "\\" format for type \\"" + meta_vec[i].data_type + "\\" in gen_datalake_dml() function to resolve the error.\\n\\n")
                                                              else if (meta_vec[i].data_type member [vector "DECIMAL"])
                                                                        if(meta_vec[i].data_length == "0" && meta_vec[i].data_scale == "0") // if length is zero creating delimited column
                                                                                'decimal('+delim+')' 
                                                                        else if(meta_vec[i].data_length == "0" && meta_vec[i].data_scale != "0") // if length is zero and precision is present creating delimited column with precision
                                                                                'decimal('+delim+'.' + meta_vec[i].data_scale + ')'
                                                                        else if (meta_vec[i].data_scale == "0") 
                                                                                'decimal('+delim+', maximum_length='+(string(""))((decimal(""))meta_vec[i].data_length + 2)+')' // maximum_length is 2 added to length to accommodate sign and decimal point.
                                                                        else //if (meta_vec[i].data_scale != "0") 
                                                                                'decimal('+delim+'.'+meta_vec[i].data_scale+', maximum_length='+(string(""))((decimal(""))meta_vec[i].data_length /*+ (decimal(""))meta_vec[i].data_scale*/ + 2)+')' // maximum_length is calculated based on length and added 2 to accomodate sign byte and decimal point.
                                                                        else
                                                                        force_error("\\n\\nERROR: New data type which is not listed in the function is identified. Please request Framework team to include the new type - \\"" + meta_vec[i].data_type + "\\" in gen_datalake_dml() function to resolve the error.\\n\\n")
                        , default=if(meta_vec[i].primary_keys == "N")"\\"\\"" else "", nullable=if(meta_vec[i].primary_keys == "N") 1 else 0));
        end;
        if( string_downcase(meta_vec[(length_of(meta_vec) - 1)].column_name) != "newline")
                       dml_fields = vector_append(dml_fields, make_field("newline", 'string(1)', default = if(string_lrtrim(ctrl_info.record_delimiter) != "XXXXX") '"' + string_lrtrim(string_replace(string_replace(ctrl_info.record_delimiter, "'", ""), '"', '')) + '"' else "\\"\\\\n\\""));
        out :: add_fields(dml, dml_fields);
end;|8|9|RK|@{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|REFK|@{0|}}
{30001002|XXparameter|DATASET_ID_LOOKUP_PATH|$AI_SERIAL_LOOKUP/lookup.datalake.dataset_id.txt|3|9|FK||{0|}}
{30001002|XXparameter|___PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|SOURCE_NAME|\{SYSTEM\}.\{SOURCE\}  // This must be set appropriately in the private pset.|3|9|RFK|The fully qualified "logical" name of the source dataset.  One period (.) is expected.|{0|}}
{30001002|XXparameter|SOURCE_LOGICAL_NAME||3|9|RFK|@{0|}}
{30001002|XXparameter|TARGET_NAME||3|9|RFK|The source name, downcased to avoid problems with case-insensitive file systems, such as Windows.|{0|}}
{30001002|XXparameter|TARGET_SYSTEM|$[ re_replace(TARGET_NAME, "[.].*", "") ]|3|9|RK|@{0|}}
{30001002|XXparameter|____DATALAKE_Parameters_____||3|1|Kl|@{0|}}
{30001002|XXparameter|HIST_PREFIX|False|13|9|FK|@{0|}}
{30001002|XXparameter|DATALAKE_ENVIRONMENT|AI_PHASE|3|10|RKd|@{0|}}
{30001002|XXparameter|DATALAKE_SYSTEM||3|9|RFK|@{0|}}
{30001002|XXparameter|DATALAKE_APPLICATION||3|9|RFK|@{0|}}
{30001002|XXparameter|USE_LOCAL_CTL|Y|3|9|FK|@{0|}}
{30001002|XXparameter|DATALAKE_SOURCE_TYPE|datalake|15|9|FK|@{2|datalake|local|}}
{30001002|XXparameter|DATALAKE_ROOT_DIR|AI_PHASE|3|10|FKd|@{0|}}
{30001002|XXparameter|DATALAKE_ROOT_DIR_META|AI_PHASE|3|10|FKd|@{0|}}
{30001002|XXparameter|DATALAKE_ROOT_DIR_META:dev|$DATALAKE_ROOT_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_ROOT_DIR_META:qa|$DATALAKE_ROOT_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_ROOT_DIR_META:uat|$DATALAKE_ROOT_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_ROOT_DIR_META:prod|$DATALAKE_ROOT_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_ROOT_DIR_META:stage|$DATALAKE_ROOT_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_ROOT_DIR_DATA|AI_PHASE|3|10|FKd|@{0|}}
{30001002|XXparameter|DATALAKE_ROOT_DIR_DATA:dev|$DATALAKE_ROOT_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_ROOT_DIR_DATA:qa|$DATALAKE_ROOT_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_ROOT_DIR_DATA:uat|$DATALAKE_ROOT_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_ROOT_DIR_DATA:prod|$DATALAKE_ROOT_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_ROOT_DIR_DATA:stage|$DATALAKE_ROOT_DIR_CTL|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR|AI_PHASE|3|10|FKd|@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR_META|AI_PHASE|3|10|FKd|@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR_DATA|AI_PHASE|3|10|FKd|@{0|}}
{30001002|XXparameter|DATALAKE_MAIN_DIR|$[ if(DATALAKE_SOURCE_TYPE == 'datalake') string_replace(string_replace(DATALAKE_ROOT_DIR, "//", "/"), "/./", "/") else  string_replace(string_replace(DATALAKE_LOCAL_DIR, "//", "/"), "/./", "/") ]|3|9|FK|@{0|}}
{30001002|XXparameter|DATALAKE_MAIN_DIR_META|$[ if(DATALAKE_SOURCE_TYPE == 'datalake') string_replace(string_replace(DATALAKE_ROOT_DIR_META, "//", "/"), "/./", "/") else  string_replace(string_replace(DATALAKE_LOCAL_DIR_META, "//", "/"), "/./", "/") ]|3|9|FK|@{0|}}
{30001002|XXparameter|DATALAKE_MAIN_DIR_DATA|$[ if(DATALAKE_SOURCE_TYPE == 'datalake') string_replace(string_replace(DATALAKE_ROOT_DIR_DATA, "//", "/"), "/./", "/") else  string_replace(string_replace(DATALAKE_LOCAL_DIR_DATA, "//", "/"), "/./", "/") ]|3|9|FK|@{0|}}
{30001002|XXparameter|DATALAKE_AVAILABLE_BOOK_NAMES|$[ if ( AB_APPCONF_EXECUTION )
    (for (let string("") dir_nm in directory_listing(DATALAKE_MAIN_DIR, "[!.]*")) 
     : if( string_lrtrim(file_information(DATALAKE_MAIN_DIR + "/" + dir_nm).file_type) == "DIR") string_upcase(dir_nm))
   else
     [vector "(Evaluated only in Express>It)"]
]|3|9|RK|@{0|}}
{30001002|XXparameter|DATALAKE_BOOK_NM||3|9|RFK|@{0|}}
{30001002|XXparameter|DATALAKE_BOOK_NM_DERIVED|$[ 
//Derive vector list of book names based on environment because book names follow different naming conventions based on Prod and Non Prod environments.
for (let string("") book_name in string_split_no_empty(DATALAKE_BOOK_NM, ",")) : 
//if(string_downcase(AI_PHASE) == "prod" && string_downcase(book_name) == "orx1") "RX1" else if(string_downcase(AI_PHASE) == "prod" && string_downcase(book_name) == "orx2") "RX2" else
        string_upcase(book_name);
]|3|9|RK|@{0|}}
{30001002|XXparameter|DATALAKE_ENTITY_VEC|$[ for (let source_name in string_split_no_empty(SOURCE_NAME, ",")) : string_upcase(string_replace_first(source_name, ".", "_")) ]|3|9|RK|@{0|}}
{30001002|XXparameter|LAST_EXTRACT_TIMESTAMP_FILE_NAME|$[ AI_SERIAL + "/get." + TARGET_SYSTEM + "/get.watermark." + TARGET_NAME + ".dat" ]|3|9|RK|@{0|}}
{30001002|XXparameter|START_DTTM|AB_PARAMETER_ENV|3|10|RFKd|@{0|}}
{30001002|XXparameter|END_DTTM|$[ (datetime("YYYYMMDDHH24MISS")) now1()]|3|9|RFK|@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR:dev|$[ if(USE_LOCAL_CTL=="Y") "/etl/data1/prod/serial/orca/rxclaim/pending/uhclake/prd/p_hdfs/optum/raw/standard_access"
else AI_SERIAL_BASE + "/ecg_landing/outbound" ]|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR:qa|$[ if(USE_LOCAL_CTL=="Y") "/etl/data1/prod/serial/orca/rxclaim/pending/uhclake/prd/p_hdfs/optum/raw/standard_access"
else AI_SERIAL_BASE + "/ecg_landing/outbound" ]|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR:uat|$[ if(USE_LOCAL_CTL=="Y") "/etl/data1/prod/serial/orca/rxclaim/pending/uhclake/prd/p_hdfs/optum/raw/standard_access"
else AI_SERIAL_BASE + "/ecg_landing/outbound" ]|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR:prod|$[ if(USE_LOCAL_CTL=="Y") "/etl/data1/prod/serial/orca/rxclaim/pending/uhclake/prd/p_hdfs/optum/raw/standard_access"
else AI_SERIAL_BASE + "/ecg_landing/outbound" ]|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR_META:dev|$DATALAKE_LOCAL_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR_META:qa|$DATALAKE_LOCAL_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR_META:uat|$DATALAKE_LOCAL_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR_META:prod|$DATALAKE_LOCAL_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR_META:stage|$DATALAKE_LOCAL_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR_DATA:dev|$DATALAKE_LOCAL_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR_DATA:qa|$DATALAKE_LOCAL_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR_DATA:uat|$DATALAKE_LOCAL_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR_DATA:prod|$DATALAKE_LOCAL_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR_DATA:stage|$DATALAKE_LOCAL_DIR|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_CTRL_FILE_DIR_NM|other|3|9|FK|@{0|}}
{30001002|XXparameter|DATALAKE_META_FILE_DIR_NM|meta|3|9|FK|@{0|}}
{30001002|XXparameter|DATALAKE_DATA_FILE_DIR_NM|data|3|9|FK|@{0|}}
{30001002|XXparameter|DATALAKE_URL_VEC|$[ 
begin
// Replace /./ with / and // with / in DATALAKE_MAIN_DIR path
let string("") datalake_rootdir = string_replace(string_replace(DATALAKE_MAIN_DIR, "//", "/"), "/./", "/");
let date("YYYYMMDD") stdt = string_substring(START_DTTM,1,8);
let date("YYYYMMDD") enddt = string_substring(END_DTTM,1,8);
let string(1)[8] stdt_vec = reinterpret_as(string(1)[8], stdt);
let string(1)[8] enddt_vec = reinterpret_as(string(1)[8], enddt);

let string("")[int] book_names = DATALAKE_BOOK_NM_DERIVED;
let string("")[int] entity_names = DATALAKE_ENTITY_VEC;
let string("")[int] dir_level1 = allocate();
let string("")[int] dir_level2 = allocate();
let string("")[int] dir_level3 = allocate();

let string("") date_dir_pattern = "date=";
if(stdt == enddt) date_dir_pattern = date_dir_pattern + (string(""))stdt;
else begin
begin block check_pattern
for(let int l = 0, l < 8) begin
  if(stdt_vec[l] == enddt_vec[l]) date_dir_pattern = date_dir_pattern + stdt_vec[l];
  if(stdt_vec[l] != enddt_vec[l]) exit check_pattern;
end
end block check_pattern
end

date_dir_pattern = string_repad(date_dir_pattern, 13, "?");

if(DATALAKE_SOURCE_TYPE member [vector "datalake", "local"] && DATALAKE_CTRL_FILE_DIR_NM == "other" && DATALAKE_META_FILE_DIR_NM == "meta" && DATALAKE_DATA_FILE_DIR_NM == "data")
begin
// List DATALAKE_ENTITY directories corresponds to each book name selected. 
dir_level1 = for (let int i=0, i < length_of(book_names)) : 
                                        if(file_information(datalake_rootdir + "/" + string_downcase(book_names[i]) + "/" + DATALAKE_CTRL_FILE_DIR_NM + "/" + entity_names[i]).found)
                                                datalake_rootdir + "/" + string_downcase(book_names[i]) + "/" + DATALAKE_CTRL_FILE_DIR_NM + "/" + entity_names[i];

// List version directories corresponds to each DATALAKE_ENTITYs book name selected.
dir_level2 = for (let int j=0, j < length_of(dir_level1)) : 
                                        for(let string("") ver_dir_nm in directory_listing(dir_level1[j], entity_names[j] + ".v*")) : 
                                                        dir_level1[j] + "/" + ver_dir_nm;

// List date directories corresponds to each DATALAKE_ENTITYs version directory selected. And date directory name should be greater than or equal to START_DTTM
dir_level3 = if(DATALAKE_SOURCE_TYPE == "local") dir_level2 else 
  for (let int k=0, k < length_of(dir_level2)) :
  if(stdt == enddt) for(let string("") dt_dir_nm in [vector date_dir_pattern]) : dir_level2[k] + "/" + dt_dir_nm
  else for(let string("") dt_dir_nm in directory_listing(dir_level2[k], date_dir_pattern)) :
    if(string_split(dt_dir_nm, "=")[1] >= stdt && string_split(dt_dir_nm, "=")[1] <= enddt) dir_level2[k] + "/" + dt_dir_nm;

end
else
        dir_level3 = string_split_no_empty(datalake_rootdir + "/" + DATALAKE_CTRL_FILE_DIR_NM, "\\n");

result :: if(length_of(dir_level3) == 1) dir_level3 else vector_sort(dir_level3);
end;
]|3|9|RK|@{0|}}
{30001002|XXparameter|DATALAKE_FILE_PATTERN_VEC|$[
begin
let string("")[int] book_names = DATALAKE_BOOK_NM_DERIVED;
let string("")[int] entity_names = DATALAKE_ENTITY_VEC;

let datetime("YYYYMMDDHH24MISS") stdttm = (string(""))START_DTTM;
let datetime("YYYYMMDDHH24MISS") enddttm = (string(""))END_DTTM;
let string(1)[14] stdttm_vec = reinterpret_as(string(1)[14], stdttm);
let string(1)[14] enddttm_vec = reinterpret_as(string(1)[14], enddttm);

let string("") dttm_pattern = "";

if(stdttm == enddttm) dttm_pattern = stdttm;
begin block check_pattern
for(let int l = 0, l < 14) begin
  if(stdttm_vec[l] == enddttm_vec[l]) dttm_pattern = dttm_pattern + stdttm_vec[l];
  if(stdttm_vec[l] != enddttm_vec[l]) exit check_pattern;
end
end block check_pattern;

dttm_pattern = string_repad(dttm_pattern, 14, "?");

dttm_pattern = "_" + string_prefix(dttm_pattern, 8) + "T" + string_suffix(dttm_pattern, 6) + ".ctl";

result :: for (let int i=0, i < length_of(book_names))
               : if(HIST_PREFIX && DATALAKE_SOURCE_TYPE member [vector "datalake", "local"] && DATALAKE_CTRL_FILE_DIR_NM == "other" && DATALAKE_META_FILE_DIR_NM == "meta" && DATALAKE_DATA_FILE_DIR_NM == "data") 
                        "HIST_" + book_names[i] + "_" + entity_names[i] + dttm_pattern 
                 else if (DATALAKE_SOURCE_TYPE member [vector "datalake", "local"] && DATALAKE_CTRL_FILE_DIR_NM == "other" && DATALAKE_META_FILE_DIR_NM == "meta" && DATALAKE_DATA_FILE_DIR_NM == "data")
                        book_names[i] + "_" + entity_names[i] + dttm_pattern
                 else
                        book_names[i] + "_" + entity_names[i] + ".ctl";

end;
]|3|9|RK|@{0|}}
{30001002|XXparameter|RUN_GROUP|dim_ctrx|3|9|EFK|@{0|}}
{30001002|XXparameter|TRIGGER_FILE_MASK_VEC|$[for (let src_entity  in DATALAKE_ENTITY_VEC) : RUN_GROUP + "." + string_downcase(src_entity) + ".*.dat"
//RUN_GROUP + "." + string_replace(SOURCE_NAME,".","_") + ".*.dat" ]|3|9|FK|@{0|}}
{30001002|XXparameter|LOCAL_TRIGGER_FILE_DIRECTORY|$[AI_SERIAL_PENDING + "/plan_trigger/"]|3|9|FK|Directory where signal file from datalke will be present |{0|}}
{30001002|XXparameter|FILE_LIST_CTL_FOR_AUDIT|$[begin
let int length_of_src_ent=length_of(TRIGGER_FILE_MASK_VEC);
let string("")[int] v_file_list_vec=[vector];
let string("") v_all_ctl_file_list="";
let int j=0;
let int v_num_of_ctl_files=0;
let string("") v_ctl_file_list="";
for (j , j < length_of_src_ent )
 begin
 v_file_list_vec=directory_listing(LOCAL_TRIGGER_FILE_DIRECTORY,  TRIGGER_FILE_MASK_VEC[j] );
 v_all_ctl_file_list= v_all_ctl_file_list + "\\n" + string_join(v_file_list_vec,"\\n");
end
result ::   v_all_ctl_file_list ;
end
]|3|9|EK|ALL CTL file list to move at the end of group plan processing |{0|}}
{30001002|XXparameter|FILE_LIST_MANUAL_LOCAL|$[begin
let int length_of_src_ent=length_of(TRIGGER_FILE_MASK_VEC);
let string("")[int] v_file_list_vec=[vector];
let int j=0;
let int v_num_of_ctl_files=0;
let string("") v_ctl_file_list="";
for (j , j < length_of_src_ent )
 begin
 v_file_list_vec=directory_listing(LOCAL_TRIGGER_FILE_DIRECTORY,  TRIGGER_FILE_MASK_VEC[j] );
 v_num_of_ctl_files=length_of(v_file_list_vec) ;
for (let int i=0,i< v_num_of_ctl_files)
  begin
      v_ctl_file_list= v_ctl_file_list + read_file(LOCAL_TRIGGER_FILE_DIRECTORY + "/" + v_file_list_vec[i]);
  end

end
result ::   if(USE_LOCAL_CTL == "Y")v_ctl_file_list else "" ;
end
]|3|9|K|@{0|}}
{30001002|XXparameter|FILE_LIST_MANUAL|$FILE_LIST_MANUAL_LOCAL|3|9|FK|Optional parameter. Please enter full path of ctl files. each line should contain one ctl file.|{0|}}
{30001002|XXparameter|FULL_FILE_LIST|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|FILE_LIST_TO_PROCESS|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|GET_CTL_FILE_DATA|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|CTL_FILE_LIST|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|META_FILE_LIST|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|GET_META_FILE_DATA|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|GET_META_FILE_DATA:eme|$[(dxf_control_comp_flds)allocate_with_defaults()]|3|9||@{0|}}
{30001002|XXparameter|GET_META_FILE_DATA:sandbox|$[for(let string("") file_nm in META_FILE_LIST) : gen_meta_data(file_nm, DATALAKE_SOURCE_TYPE)]|3|9||@{0|}}
{30001002|XXparameter|DATA_FILE_COMPRESS_FLAG|$[ begin 
result :: if(DATALAKE_SOURCE_TYPE == "datalake") "False"
else if (  (DATALAKE_SOURCE_TYPE == "local") && length_of(FILE_LIST_TO_PROCESS) >=1 && GET_CTL_FILE_DATA[0].data_file_extension == ".dat.gz") "True"
else "False" ;
end
 ]|3|9|FK|If True, reads compressed input files|{0|}}
{30001002|XXparameter|DATALAKE_DATA_FILE_EXTN|$[if(DATA_FILE_COMPRESS_FLAG) ".dat.gz" else ".dat" ]|3|9|K|@{0|}}
{30001002|XXparameter|DATA_FILE_LIST|AB_PARAMETER_ENV|3|10|REKd|@{0|}}
{30001002|XXparameter|CTL_FILE_WISE_COUNT|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|NEW_END_TS|$[
begin
let string("") last_file_nm = if(DATALAKE_SOURCE_TYPE member [vector "datalake", "local"] && DATALAKE_CTRL_FILE_DIR_NM == "other" && DATALAKE_META_FILE_DIR_NM == "meta" && DATALAKE_DATA_FILE_DIR_NM == "data" && FILE_LIST_MANUAL == "" && length_of(FILE_LIST_TO_PROCESS) > 0)
                                        FILE_LIST_TO_PROCESS[length_of(FILE_LIST_TO_PROCESS) - 1]
                              else 
                                        "EMPTY_FILE_LIST" ;

result :: if(DATALAKE_SOURCE_TYPE member [vector "datalake", "local"] && DATALAKE_CTRL_FILE_DIR_NM == "other" && DATALAKE_META_FILE_DIR_NM == "meta" && DATALAKE_DATA_FILE_DIR_NM == "data" && FILE_LIST_MANUAL == "" && length_of(FILE_LIST_TO_PROCESS) > 0)
                string_split(string_substring(last_file_nm, string_rindex(last_file_nm, "_") + 1, 9999), ".")[0]  // Extract timestamp value from last filename.
          else if(DATALAKE_SOURCE_TYPE member [vector "datalake", "local"] && DATALAKE_CTRL_FILE_DIR_NM == "other" && DATALAKE_META_FILE_DIR_NM == "meta" && DATALAKE_DATA_FILE_DIR_NM == "data" && FILE_LIST_MANUAL == "" && length_of(FILE_LIST_TO_PROCESS) == 0)
                string_concat(string_substring(END_DTTM, 1, 8), "T", string_substring(END_DTTM, 9, 6))  // Value of END_DTTM is recorded as no file list is found for given time range.
          else //if(DATALAKE_SOURCE_TYPE member [vector "datalake", "local"] && DATALAKE_CTRL_FILE_DIR_NM == "other" && DATALAKE_META_FILE_DIR_NM == "meta" && DATALAKE_DATA_FILE_DIR_NM == "data" && FILE_LIST_MANUAL != "")
                string_concat(string_substring(START_DTTM, 1, 8), "T", string_substring(START_DTTM, 9, 6));  // Value of START_DTTM is recorded as manual file list is provided.
end;
]|3|9|RK|@{0|}}
{30001002|XXparameter|DO_SOURCE|0|13|9|RFK|0 or 1: Whether or not to produce the source file.  Defaults to 1 (True).|{0|}}
{30001002|XXparameter|DO_CLEAN|0|13|9|RFK|0 or 1: Whether or not to produce a clean file.  Defaults to 0 (False).|{0|}}
{30001002|XXparameter|DO_LOOKUP|0|13|9|RFK|0 or 1: Whether or not to produce a lookup file.  Defaults to 0 (False).  Note that lookup files also have parameters for subsetting their DML and for sorting, dedup'ing, and managing overlapping intervals, based on a lookup key, etc.|{0|}}
{30001002|XXparameter|DO_CONS_LOOKUP|0|13|9|FK|@{0|}}
{30001002|XXparameter|DATALAKE_DATA_FILE_DML_WITHOUT_MAXLENGTH|AB_PARAMETER_ENV|3|10|Kd|@{0|}}
{30001002|XXparameter|DATALAKE_DATA_FILE_DML_WITHOUT_MAXLENGTH:eme|$[ 
begin
result :: read_type(if ( DO_CLEAN )  AI_DML + "/clean." + TARGET_SYSTEM + "/clean." + TARGET_NAME + ".dml" 
     else if ( DO_SOURCE ) AI_DML + "/source." + TARGET_SYSTEM + "/source." + TARGET_NAME + ".dml" 
     else if ( DO_LOOKUP ) AI_DML + "/lookup." + TARGET_SYSTEM + "/lookup." + TARGET_NAME + ".dml") ;
end]|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_DATA_FILE_DML_WITHOUT_MAXLENGTH:sandbox|$[if(META_FILE_LIST != [vector] && CTL_FILE_LIST != [vector]) gen_datalake_dml_without_maxlength(GET_META_FILE_DATA[0], GET_CTL_FILE_DATA[0]) else "record\\nend;"]|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_DATA_FILE_DML|AB_PARAMETER_ENV|3|10|Kd|@{0|}}
{30001002|XXparameter|SOURCE_TYPE_NAME|source_$[ re_replace(TARGET_NAME, "[^a-zA-Z0-9_]", "_") ]_t|3|9|RK|The type name to use in the source DML.|{0|}}
{30001002|XXparameter|ADDITIONAL_FIELDS_DML|record
end|3|9|RFK|Additional DML to be appended to the DMF header and prepended to the get DML.  Defaults to an empty record, which is ignored.|{0|}}
{30001002|XXparameter|GET_DML_PLUS_HEADER|/* Do Not Edit.  This file is generated automatically by combining
 * "$AI_DML/dxf_header.dml", any "$ADDITIONAL_FIELDS_DML", and
 * "$DATALAKE_DATA_FILE_DML generates at run time based on DATALAKE_META_FILE content".
 * Changing the Get DML and resaving the get configuration will update this file.
 */



type $SOURCE_TYPE_NAME =
$[
add_fields("record\\nend",
  record_info(
    expand_type(
      join_types(join_types(
        read_type("/~$PUB_DXF_DML/dxf_header.dml"),
        ADDITIONAL_FIELDS_DML),
        DATALAKE_DATA_FILE_DML))))
];
metadata type = $SOURCE_TYPE_NAME;|3|9|K|The input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|CLEANSE_CHARECTERS|@3|9|FK|@{0|}}
{30001002|XXparameter|___Output_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|SOURCE_FILE_URL|AB_PARAMETER_ENV|3|10|Kd|Optional: Used by the ACE to view the source file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|CLEAN_FILE_URL|AB_PARAMETER_ENV|3|10|Kd|Optional: Used by the ACE to view the clean file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|LOOKUP_FILE_URL|$[ if ( not DO_LOOKUP ) "" else "file:" + AI_SERIAL_LOOKUP + "/lookup." + TARGET_SYSTEM + "/lookup." + TARGET_NAME + ".dat" ]|3|9|K|Optional: Used by the ACE to view the lookup file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|SOURCE_DML_FILE|$[ if ( not DO_SOURCE ) "" else AI_DML + "/source." + TARGET_SYSTEM + "/source." + TARGET_NAME + ".dml" ]|3|9|K|The DML file to use for the "source" results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|CLEAN_DML_FILE|$[ if ( not DO_CLEAN ) "" else AI_DML + "/clean." + TARGET_SYSTEM + "/clean." + TARGET_NAME + ".dml" ]|3|9|K|The DML file to use for the results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|LOOKUP_DML_FILE|$[if ( not DO_LOOKUP ) "" else  AI_DML + "/lookup." + TARGET_SYSTEM + "/lookup." + TARGET_NAME + ".dml" ]|3|9|RK|The DML file to use for the resulting lookup, if any.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|OUTPUT_DML|$[
if( DO_CLEAN )
                read_file(CLEAN_DML_FILE)
        else if(DO_SOURCE)
                read_file(SOURCE_DML_FILE)
        else if( DO_LOOKUP \|\| DO_CONS_LOOKUP)
                read_file(LOOKUP_DML_FILE);
]|3|9|FK|The record format of the source, clean, or lookup output, whichever is first used.|{0|}}
{30001002|XXparameter|LOOKUP_KEY||3|9|EFK|\{field_1; ...; field_n\}: Optional: The key to use for lookup.  When present, a serial lookup file will be produced.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$[ re_match_replace(LOOKUP_KEY,
    ".*; *(.*) interval_bottom; *(.*) interval_top",
    "$1")
]|3|9|FK|Optional: The name of the field that contains the start of the interval, if any.  This is often set to the effective start date.  Defaults to the interval_bottom field in the lookup key, if any.|{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$[ re_match_replace(LOOKUP_KEY,
    ".*; *(.*) interval_bottom; *(.*) interval_top",
    "$2")
]|3|9|FK|Optional: The name of the field that contains the end of the interval, if any.  This is often set to the effective end date or termination date.  Defaults to the interval_top field in the lookup key, if any.|{0|}}
{30001002|XXparameter|DEFAULT_DEDUP_SORT_KEY|// This must be set appropriately in the intermediate pset.
\{source_record_active_cd; source_update_dttm descending; source_sequence_number descending; source_create_dttm descending; dxf_src_dataset_id descending; dxf_src_rec_cnt descending; drop_record; $END_DATE_FIELD_NAME\}
// source_record_active_cd                                    // A (Source Active) before I (Source Inactive)
// source_update_dttm descending                              // Records updated later over earlier
// source_sequence_number descending                          // Records created later over earlier
// source_create_dttm descending                              // Records created later over earlier
// dxf_src_dataset_id descending; dxf_src_rec_cnt descending  // Records delivered later over earlier
// drop_record                                                // 0 (Inserts) over 1 (Deletes)
// $END_DATE_FIELD_NAME                                       // If all else fails, favor records that expire earlier|3|9|RFK|\{field_1; ...; field_n\}: The prefered extra dedup sort key.  Only fields that are present in the target table will be used.|{0|}}
{30001002|XXparameter|EXTRA_DEDUP_SORT_KEY|$[ 
if ( not DO_LOOKUP ) "" else
make_key(
  for ( let k in key_info(DEFAULT_DEDUP_SORT_KEY) ) :
    if ( k.field_name member record_info_item(read_file(LOOKUP_DML_FILE), "name") )
      k);
]|3|9|FK|\{field_1; ...; field_n\}: A key with the extra fields to sort on before deduping by the effective natural key (the first record is kept).  Defaults to a standard set of keys from DEFAULT_DEDUP_SORT_KEY, if those fields are present.|{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$[make_key( vector_concat(key_info(LOOKUP_KEY) , key_info(EXTRA_DEDUP_SORT_KEY)) )]|3|9|RO|\{field_1; ...; field_n\}: Fields to sort on for dedup.|{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|1|3|9|RFK|#: The number of microseconds between adjacent effective and end dates.  Typically 1 or 1000000 (a second) or 86400000000 (a day).|{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$[ [vector EFFECTIVE_DATE_FIELD_NAME] ]|3|9|RFK|A vector of fields that are to be preserved from the earlier record when two matching, adjacent records are merged.  Typically, this is anything related to the start date.|{0|}}
{30001002|XXparameter|READ_DB_NORMALIZE_XFR_FILE|$PUB_DXF_XFR/dxf_process_log.datalake_default.xfr|3|9|RFK|This XFR can be overridden at private project or pset level to provide normalize or additional functionality|{0|}}
{30001002|XXparameter|AB_ALLOW_GRAPH_IN_COMPONENT|true|13|9|EK|@{0|}}
{30001002|XXparameter|___ACE_Template_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|!ab_compatibility|3.2.6.4|3|9|P|@{0|}}
{30001002|XXparameter|DATALAKE_ENVIRONMENT:dev|dev|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_ENVIRONMENT:qa|tst|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_ENVIRONMENT:uat|uat|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_ENVIRONMENT:prod|prod|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_ROOT_DIR:dev|$[ 
if(USE_LOCAL_CTL=="Y") "/etl/data/dev/serial/orca/rxclaim/main/local_DL"
else if(USE_LOCAL_CTL=="N") "/mapr_prod/" + DATALAKE_SYSTEM + "/prd/p_hdfs/" + DATALAKE_APPLICATION + "/raw/standard_access" 
]|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_ROOT_DIR:qa|$[ 
if(USE_LOCAL_CTL=="Y") "/etl/data1/prod/serial/orca/rxclaim/pending/uhclake/prd/p_hdfs/optum/raw/standard_access"
else if(USE_LOCAL_CTL=="N") "/mapr_prod/" + DATALAKE_SYSTEM + "/prd/p_hdfs/" + DATALAKE_APPLICATION + "/raw/standard_access" 
]|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_ROOT_DIR:uat|$[ 
if(USE_LOCAL_CTL=="Y") "/etl/data1/prod/serial/orca/rxclaim/pending/uhclake/prd/p_hdfs/optum/raw/standard_access"
else if(USE_LOCAL_CTL=="N") "/mapr_prod/" + DATALAKE_SYSTEM + "/prd/p_hdfs/" + DATALAKE_APPLICATION + "/raw/standard_access" 
]|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_ROOT_DIR:prod|$[
if(USE_LOCAL_CTL=="Y") "/etl/data1/prod/serial/orca/rxclaim/pending/uhclake/prd/p_hdfs/optum/raw/standard_access"
else if(USE_LOCAL_CTL=="N") "/mapr_prod/" + DATALAKE_SYSTEM + "/prd/p_hdfs/" + DATALAKE_APPLICATION + "/raw/standard_access" 
]|3|9||@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|DATALAKE_DATA_FILE_DML:eme|$[ 
begin
result :: read_type(if ( DO_CLEAN )  AI_DML + "/clean." + TARGET_SYSTEM + "/clean." + TARGET_NAME + ".dml" 
     else if ( DO_SOURCE ) AI_DML + "/source." + TARGET_SYSTEM + "/source." + TARGET_NAME + ".dml" 
     else if ( DO_LOOKUP ) AI_DML + "/lookup." + TARGET_SYSTEM + "/lookup." + TARGET_NAME + ".dml") ;
end]|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_DATA_FILE_DML:sandbox|$[if(META_FILE_LIST != [vector] && CTL_FILE_LIST != [vector]) gen_datalake_dml(GET_META_FILE_DATA[0], GET_CTL_FILE_DATA[0]) else "record\\nend;"]|3|9||@{0|}}
{30001002|XXparameter|START_DTTM:eme|YYYYMMDDHH24MISS|3|9||@{0|}}
{30001002|XXparameter|START_DTTM:sandbox|$[ (datetime("YYYYMMDDHH24MISS")) string_replace_first(string_split_no_empty(read_file(LAST_EXTRACT_TIMESTAMP_FILE_NAME), "\\n")[0], "T", "") ]|3|9||@{0|}}
{30001002|XXparameter|FULL_FILE_LIST:eme|$[ for (let entity_name in DATALAKE_ENTITY_VEC) : AI_SERIAL + "/datalake/" + entity_name + "_YYYYMMDDTHH24MISS.ctl"]|3|9||@{0|}}
{30001002|XXparameter|FULL_FILE_LIST:sandbox|$[ 
begin
let string("")[int] file_list = [vector];

file_list = if(FILE_LIST_MANUAL != "") 
                for (let ctl_file_nm in string_split_no_empty(string_filter_out(FILE_LIST_MANUAL,"\\r"), "\\n")) : 
                        if (! ends_with(ctl_file_nm, ".ctl") ) 
                                force_error("ERROR: FILE_LIST_MANUAL must be list of control files. And each line should contain one control file. \\n\\nAborting the graph.")
                        else if(! file_information(ctl_file_nm).found)
                                force_error("ERROR: Could not locate file - " + ctl_file_nm + " \\n\\nAborting the graph.")
                        else 
                                ctl_file_nm
            else if(FILE_LIST_MANUAL == "" && USE_LOCAL_CTL =='N')
                for (let string("") pattern_nm in DATALAKE_FILE_PATTERN_VEC)
                        : for (let string("") dir_nm in DATALAKE_URL_VEC) 
                                : if(DATALAKE_SOURCE_TYPE member [vector "datalake", "local"] && DATALAKE_CTRL_FILE_DIR_NM == "other" && DATALAKE_META_FILE_DIR_NM == "meta" && DATALAKE_DATA_FILE_DIR_NM == "data")
                                        for (let string("") file_nm in directory_listing(dir_nm,pattern_nm)) 
                                            : dir_nm + "/" + file_nm
                                  else
                                        dir_nm + "/" + pattern_nm
            else [vector];

result :: if(file_list != [vector]) vector_sort(file_list) else [vector];
end;
]|3|9||@{0|}}
{30001002|XXparameter|FILE_LIST_TO_PROCESS:eme|$[ for (let entity_name in DATALAKE_ENTITY_VEC) : AI_SERIAL + "/datalake/" + entity_name + "_YYYYMMDDTHH24MISS.ctl"]|3|9||@{0|}}
{30001002|XXparameter|FILE_LIST_TO_PROCESS:sandbox|$[
begin
let string("")[int] file_list_vec = FULL_FILE_LIST; //string_split_no_empty(FULL_FILE_LIST, "\\n");
let string("")[int] url_vec = DATALAKE_URL_VEC; //string_split_no_empty(FULL_FILE_LIST, "\\n");

let datetime("YYYYMMDDHH24MISS") file_dttm;
let decimal("") small_file_version;
let decimal("") current_file_version;
let string("")[int] dt_range_match_file_list = [vector];
let string("")[int] final_file_list = [vector];

/*if((FILE_LIST_MANUAL != "" && DATALAKE_SOURCE_TYPE member [vector "datalake", "local"]) \|\| (FILE_LIST_MANUAL == "" && DATALAKE_SOURCE_TYPE == "local"))
        final_file_list = file_list_vec;
else */

if(FILE_LIST_MANUAL == "" && DATALAKE_SOURCE_TYPE member [vector "datalake", "local"] && DATALAKE_CTRL_FILE_DIR_NM == "other" && DATALAKE_META_FILE_DIR_NM == "meta" && DATALAKE_DATA_FILE_DIR_NM == "data")
begin
        // creation of FILE_LIST matching the date range.
        for(let int i=0, i < length_of(file_list_vec))
        begin
                file_dttm = string_replace_first(string_substring(file_list_vec[i], string_rindex(file_list_vec[i], "_") + 1, 15), "T", "");
                if( file_dttm > START_DTTM && file_dttm <= END_DTTM ) begin
                        dt_range_match_file_list = vector_append(dt_range_match_file_list, file_list_vec[i]);
                end
        end;
        
        //Assign first file version to compare with rest to find out lower version number.
        if( length_of(dt_range_match_file_list) > 0 ) 
                small_file_version = if(DATALAKE_SOURCE_TYPE == 'local') 
                                        string_substring(dt_range_match_file_list[0], string_rindex(dt_range_match_file_list[0], "/") - 1, 1)
                                     else if(DATALAKE_SOURCE_TYPE == 'datalake') 
                                        string_substring(string_split_no_empty(dt_range_match_file_list[0], "/date=")[0], string_rindex(string_split_no_empty(dt_range_match_file_list[0], "/date=")[0], ".") + 2, 9999);

        /*
        ****BELOW FOR LOOP TO SCAN THROUGH ALL FILES TO FIND THE SMALLEST VERSION NUMBER IS NOT REQUIRED ANY MORE, SINCE THE DATALAKE URLs ARE BEING SORTED IN THE "DATALAKE_URL_VEC" PARAMETER.
            HENCE FILE LIST WILL ALWAYS BE RECEIVED IN SORT ORDER BY DIRECTORY URL, CAUSING THE LOWEST VERSION NUMBER TO BE THE FIRST ONE ONE.****
        */
        //Scan thourgh all the files in the dt_range_match_file_list to find smaller version number.
        /*for(let int j=0, j < length_of(dt_range_match_file_list))
        begin
                current_file_version = if(DATALAKE_SOURCE_TYPE == 'local') 
                                        string_substring(dt_range_match_file_list[j], string_rindex(dt_range_match_file_list[j], "/") - 1, 1)
                                       else if(DATALAKE_SOURCE_TYPE == 'datalake') 
                                        string_substring(string_split_no_empty(dt_range_match_file_list[j], "/date=")[0], string_rindex(string_split_no_empty(dt_range_match_file_list[j], "/date=")[0], ".") + 2, 9999);
                if ( small_file_version > current_file_version )
                        small_file_version = current_file_version;
        end;*/

        //Based on file timestamp and file version, pick up list of files to be processed for the run.
        if(length_of(url_vec) == 1) 
                final_file_list = dt_range_match_file_list ;
        else
        for(let int k=0, k < length_of(dt_range_match_file_list))
        begin
                current_file_version = if(DATALAKE_SOURCE_TYPE == 'local') 
                                        string_substring(dt_range_match_file_list[k], string_rindex(dt_range_match_file_list[k], "/") - 1, 1)
                                       else if(DATALAKE_SOURCE_TYPE == 'datalake') 
                                        string_substring(string_split_no_empty(dt_range_match_file_list[k], "/date=")[0], string_rindex(string_split_no_empty(dt_range_match_file_list[k], "/date=")[0], ".") + 2, 9999);
                if( small_file_version == current_file_version )
                        final_file_list = vector_append(final_file_list, dt_range_match_file_list[k]);
        end;
end
else
        final_file_list = file_list_vec;

result :: final_file_list;
end;
]|3|9||@{0|}}
{30001002|XXparameter|META_FILE_LIST:eme|$[ for (let entity_name in DATALAKE_ENTITY_VEC) : AI_SERIAL + "/datalake/" + entity_name + "_YYYYMMDDTHH24MISS.meta"]|3|9||@{0|}}
{30001002|XXparameter|META_FILE_LIST:sandbox|$[
begin
// Re-interpret ctl file name to corresponding meta file name, check for the file existance and create meta file list.
let string("")[int] meta_file_list = for(let string("") file_nm in FILE_LIST_TO_PROCESS) : if(file_information(string_replace(string_replace(string_replace(file_nm, "/" + DATALAKE_CTRL_FILE_DIR_NM + "/", "/" + DATALAKE_META_FILE_DIR_NM + "/"), ".ctl", ".meta"), DATALAKE_MAIN_DIR, DATALAKE_MAIN_DIR_META)).found) 
                                                                                                       string_replace(string_replace(string_replace(file_nm, "/" + DATALAKE_CTRL_FILE_DIR_NM + "/", "/" + DATALAKE_META_FILE_DIR_NM + "/"), ".ctl", ".meta"), DATALAKE_MAIN_DIR, DATALAKE_MAIN_DIR_META)
                                                                                               else 
                                                                                                       force_error("ERROR: Missing meta file - " + string_replace(string_replace(string_replace(file_nm, "/" + DATALAKE_CTRL_FILE_DIR_NM + "/", "/" + DATALAKE_META_FILE_DIR_NM + "/"), ".ctl", ".meta"), DATALAKE_MAIN_DIR, DATALAKE_MAIN_DIR_META) + ". Aborting the graph."); 

let dxf_metadata_comp_flds[int] first_file_prop = if(length_of(meta_file_list) > 0) gen_meta_data(meta_file_list[0]);

let string("")[int] err_list = for(let string("") file_nm in meta_file_list) : 
                                                if(first_file_prop != (dxf_metadata_comp_flds[int]) gen_meta_data(file_nm)) file_nm;

result :: if(length_of(err_list) > 0) 
                force_error("ERROR: Baseline meta file - " + meta_file_list[0] + "\\n\\nDiscrepancies identified for following meta files -\\n" + string_join(err_list, "\\n") + "\\n\\nAborting the graph.") 
          else 
                meta_file_list;
end;
]|3|9||@{0|}}
{30001002|XXparameter|DATA_FILE_LIST:eme|$[ for (let entity_name in DATALAKE_ENTITY_VEC) : AI_SERIAL + "/datalake/" + entity_name + "_YYYYMMDDTHH24MISS.dat"]|3|9||@{0|}}
{30001002|XXparameter|DATA_FILE_LIST:sandbox|$[
begin
// Re-interpret ctl file name to corresponding data file name, check for the file existance and create data file list.
let string("")[int] data_file_list = [vector];
data_file_list = for(let string("") file_nm in FILE_LIST_TO_PROCESS) : if(file_information(string_replace(string_replace(string_replace(file_nm, "/" + DATALAKE_CTRL_FILE_DIR_NM + "/", "/" + DATALAKE_DATA_FILE_DIR_NM + "/"), ".ctl", DATALAKE_DATA_FILE_EXTN), DATALAKE_MAIN_DIR, DATALAKE_MAIN_DIR_META)).found) 
                                                                                                       string_replace(string_replace(string_replace(file_nm, "/" + DATALAKE_CTRL_FILE_DIR_NM + "/", "/" + DATALAKE_DATA_FILE_DIR_NM + "/"), ".ctl", DATALAKE_DATA_FILE_EXTN), DATALAKE_MAIN_DIR, DATALAKE_MAIN_DIR_META) 
                                                                                               else 
                                                                                                       force_error("ERROR: Missing data file - " + string_replace(string_replace(string_replace(file_nm, "/" + DATALAKE_CTRL_FILE_DIR_NM + "/", "/" + DATALAKE_DATA_FILE_DIR_NM + "/"), ".ctl", DATALAKE_DATA_FILE_EXTN), DATALAKE_MAIN_DIR, DATALAKE_MAIN_DIR_META) + ". Aborting the graph.");

result :: data_file_list;
end;
]|3|9||@{0|}}
{30001002|XXparameter|CTL_FILE_LIST:eme|$[ for (let entity_name in DATALAKE_ENTITY_VEC) : AI_SERIAL + "/datalake/" + entity_name + "_YYYYMMDDTHH24MISS.ctl"]|3|9||@{0|}}
{30001002|XXparameter|CTL_FILE_LIST:sandbox|$[
begin
let string("")[int] ctl_file_list = FILE_LIST_TO_PROCESS;
let ctl_file_data_list = GET_CTL_FILE_DATA;
let dxf_control_comp_flds first_file_prop = if(length_of(ctl_file_list) > 0) ctl_file_data_list[0];
let string("")[int] err_list = for(let string("") file_nm in ctl_file_list) : if(first_file_prop != (dxf_control_comp_flds) ctl_file_data_list[index_of(file_nm)]) file_nm;

result :: if (length_of(err_list) > 0) 
                force_error("ERROR: Baseline ctl file - " + ctl_file_list[0] + "\\n\\nDiscrepancies identified for following ctl files -\\n" + string_join(err_list, "\\n") + "\\n\\nAborting the graph.")
          else 
                ctl_file_list;
end;
]|3|9||@{0|}}
{30001002|XXparameter|CTL_FILE_WISE_COUNT:eme|$[ for (let entity_name in DATALAKE_ENTITY_VEC) : AI_SERIAL + "/datalake/" + entity_name + "_YYYYMMDDTHH24MISS.ctl\|Integer"]|3|9||@{0|}}
{30001002|XXparameter|CTL_FILE_WISE_COUNT:sandbox|$[
begin
let string("")[int] ctl_file_list_vec = CTL_FILE_LIST;
let ctl_file_list_data_vec = GET_CTL_FILE_DATA;

let string("")[int] output_ctl_data = for (let string("") file_nm in ctl_file_list_vec) : file_nm + "\|" + ctl_file_list_data_vec[index_of(file_nm)].record_count;
result :: output_ctl_data;
end;
]|3|9||@{0|}}
{30001002|XXparameter|SOURCE_FILE_URL:eme|$[ if ( not DO_SOURCE ) "" else "mfile:" + AI_MFS + "/source." + TARGET_SYSTEM + "/source." + TARGET_NAME + "." + "\{RUN_ID\}" + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|SOURCE_FILE_URL:sandbox|$[ if ( not DO_SOURCE ) "" else "mfile:" + AI_MFS + "/source." + TARGET_SYSTEM + "/source." + TARGET_NAME + "." + RUN_ID + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|CLEAN_FILE_URL:eme|$[ if ( not DO_CLEAN ) "" else "mfile:" + AI_MFS + "/clean." + TARGET_SYSTEM + "/clean." + TARGET_NAME + "." + "\{RUN_ID\}" + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|CLEAN_FILE_URL:sandbox|$[ if ( not DO_CLEAN ) "" else "mfile:" + AI_MFS + "/clean." + TARGET_SYSTEM + "/clean." + TARGET_NAME + "." + RUN_ID + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|______Consolidated_Lookup_parameters_______________||3|9|K|@{0|}}
{30001002|XXparameter|NATURAL_KEY|$[begin
let string("") v_nk="";
if(DO_CONS_LOOKUP)
  begin
  let string("\\x01") contents = read_file(PUB_DXF_META + "/" + "ids_raw_dataset_properties.dat");
  let string("")[int] lines = string_split_no_empty(contents, "\\n");
  
  let int v_loop_cnt=length_of(lines);
  let int i=0;
 begin block find_nk 
 for(i , i < v_loop_cnt)
  begin 
    if(not is_blank(lines[i]) and not starts_with(lines[i], "#"))
    begin
        let string("") v_src_nm=string_lrtrim(string_split(lines[i],"\|")[0]);
        if(v_src_nm == string_lrtrim(TARGET_NAME ))
            begin              
                v_nk=string_split(lines[i],"\|")[1];
                exit find_nk ;
             end
     
    end
  end
end block find_nk
end
 result:: v_nk ;
end ]|3|9|FK|This Value is derived from an entry into PUB_DXF_META raw_ids_meta_properties file|{0|}}
{30001002|XXparameter|APP_NM||3|9|FK|APP name |{0|}}
{30001002|XXparameter|RAW_MFS_FILE_URL|$[ if(not DO_CONS_LOOKUP) "" else "mfile:" + PUB_DATAHUB_MFS +"/" + APP_NM + "/raw/" + TARGET_NAME  + ".dat.gz" ]|3|9|EK|Raw full mfs file |{0|}}
{30001002|XXparameter|TEMP_RAW_MFS_FILE_URL|$[if(not DO_CONS_LOOKUP) "" else "mfile:" + PUB_DATAHUB_MFS +"/" + APP_NM + "/raw/temp." + TARGET_NAME  + ".dat.gz" ]|3|9|EK|Temp Raw full mfs file |{0|}}
{30001002|XXparameter|CONS_LOOKUP_FILE_URL|$[if(not DO_CONS_LOOKUP) "" else  "file:" + AI_SERIAL_LOOKUP + "/lookup." + TARGET_SYSTEM  + "/lookup_cons." + TARGET_NAME  +  ".dat" ]|3|9|K|Consolidated lookup file URL|{0|}}
{30001002|XXparameter|BKP_RAW_MFS_FILE_URL|$[if(not DO_CONS_LOOKUP) "" else "mfile:" + PUB_DATAHUB_MFS +"/" + APP_NM + "/raw/bkp." + TARGET_NAME  + ".dat.gz" ]|3|9|EK|@{0|}}
{30001002|XXparameter|GRAPH_ENABLE_PARAMETER|$[length_of(DATA_FILE_LIST)]|3|9|K|Used in end script|{0|}}
{30001002|XXparameter|GET_CTL_FILE_DATA:eme|$[(dxf_control_comp_flds)allocate_with_defaults()]|3|9||@{0|}}
{30001002|XXparameter|GET_CTL_FILE_DATA:sandbox|$[for(let string("") file_nm in FILE_LIST_TO_PROCESS) : gen_ctl_data(file_nm)]|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_LOCAL_DIR:stage|$[ if(USE_LOCAL_CTL=="Y") "/etl/data1/prod/serial/orca/rxclaim/pending/uhclake/prd/p_hdfs/optum/raw/standard_access"
else AI_SERIAL_BASE + "/ecg_landing/outbound" ]|3|9||@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|get.datalake_bkp|Sripavan Pulikonda|Created 2/1/2017 7:31:27 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1580000|829000|1|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{2|0|0|}Job 'get.datalake' Execution Status Report

Job completed successfully at Monday, August 21, 2017 20:03:49
Run performed by user msing114
||# Make sure the serial directories exist.
mkdir -m 2775 -p \\
  "$AI_SERIAL_LOG/get.$TARGET_SYSTEM" \\
  "$AI_SERIAL_LOOKUP/lookup.$TARGET_SYSTEM" \\
  "$AI_SERIAL_TEMP/get.$TARGET_SYSTEM" \\
  "$AI_SERIAL/get.$TARGET_SYSTEM"

# Make sure the multifile directories exist.
for d in "$AI_MFS/source.$TARGET_SYSTEM" \\
         "$AI_MFS/clean.$TARGET_SYSTEM" \\
         "$AI_MFS_REJECT/get.$TARGET_SYSTEM"; do
  d="$(echo $d \| sed 's/mfile://')"
  p="$(dirname "$d ")"
  [[ -d "$p" ]] \|\| m_mkdir -mode 2775 "$p"
  [[ -d "$d" ]] \|\| m_mkdir -mode 2775 "$d"
done

# Make sure the Dataset ID Lookup exists.
touch "$DATASET_ID_LOOKUP_PATH"

if [[ (! -f "$RAW_MFS_FILE_URL") && ("$DO_CONS_LOOKUP" == "1")]] ; then
  m_touch "$RAW_MFS_FILE_URL"
fi

# Write the summary tracking info.
export AB_REPORT="summary=$AI_SERIAL_LOG/get.$TARGET_SYSTEM/get.$TARGET_NAME.summary.log $AB_REPORT"

|#Move processed files to /processed directory'
if [[ (x"$TEMP_RAW_MFS_FILE_URL" != x"") &&  ( x"$RAW_MFS_FILE_URL" != x"") && ($DO_CONS_LOOKUP -eq 1 ) && ("$GRAPH_ENABLE_PARAMETER" -ne "0") && ($mpjret -eq 0)  ]]; then
#Take backup first 
m_mv "$RAW_MFS_FILE_URL" "$BKP_RAW_MFS_FILE_URL"
m_mv "$TEMP_RAW_MFS_FILE_URL" "$RAW_MFS_FILE_URL"
else echo "No lookup rename is being done for cons lookup process"
fi
 
|@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Normal||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Candara|32768|140|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@[ Assign values for DXF header fields ]|660000|172000|0|0|0|0|14721|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@SOURCE_NAME - $SOURCE_NAME  |540000|48000|0|0|0|0|14785|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|255|160|0|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@[ In certain cases , a lookup file has to 
be created in append mode  ]|1230000|562000|0|0|0|0|14725|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|11|0|21|0|{@{}@1.This graph has an end script to rename 
consolidated temp lookup file.
2.This Graph has start Script .|17000|590000|0|0|0|0|14734|}}
{2010242002|XXGface|12|0|23|0|{@{}@Arial|32768|100|0|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}14799|17|}}
{2010243001|XXGwatcher|14|0|27|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}14823|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.01785714365541935|{0|}14729|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}14817|531|}}
{2010243001|XXGwatcher|18|0|35|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.5|{0|}14819|17|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|0.0|{0|}14800|2065|}}
{2010210004|XXGflow|21|0|41|0|{@{}@384|.5|.5|{0|}14811|2065|}}
{2010210004|XXGflow|22|0|43|0|{@{}@384|.5|.5|{0|}14818|17|}}
{2010243001|XXGwatcher|23|0|45|0|{@{}@1|100|0||0|}}
{2010210004|XXGflow|24|0|47|0|{@{}@384|.5|0.0|{0|}14802|17|}}
{2010210004|XXGflow|25|0|49|0|{@{}@384|.5|.5|{0|}14796|17|}}
{2010210004|XXGflow|26|0|51|0|{@{}@384|.5|0.0|{0|}14795|17|}}
{2010210004|XXGflow|27|0|53|0|{@{}@384|.5|.5|{0|}14822|18|}}
{2010210004|XXGflow|28|0|55|0|{@{}@384|.5|.5|{0|}14815|17|}}
{2010501005|XXGpvertex|29|0|57|0|{Adds Source IDs and Record Counts.  Also logs the totals.

We use a Normalize here so that other kinds of filtering or expansion could be done as well.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|$READ_DB_NORMALIZE_XFR_FILE|3|9|fj|@{0|}}
{30001002|XXparameter|out_metadata|$[ OUTPUT_DML ]|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@703952|193880|683000|208000|145000|126000|14787|Add Job ID & Record Count|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|30|0|59|0|{@{}@827000|264000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|31|0|62|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|32|0|64|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|33|0|66|0|{@{}@749000|333000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|34|0|68|0|{@{}@673000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|35|0|71|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|num_operations|11|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|36|0|73|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|37|0|76|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|38|0|79|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|39|0|82|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|40|0|85|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|41|0|88|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject2_metadata||3|8|s=|@{0|}}
}}@0|@57000|160500|77000|181000|135000|93000|9952|Map to Output|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|42|0|90|0|{@{}@211000|194000|11000|11000|source|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|43|0|92|0|{@{}@384|.5|0.0|{12|222000|199000|242000|199000|242000|199000|242000|104000|745000|104000|766000|104000|}9949|17|}}
{2010203004|XXGoport|44|0|94|0|{@{}@211000|224000|11000|11000|clean|0.0|count|out|1|2448|0|}}
{2010210004|XXGflow|45|0|96|0|{@{}@384|.5|.1120000034570694|{8|222000|229000|252000|229000|740000|229000|761000|229000|}9971|17|}}
{2010203004|XXGoport|46|0|98|0|{@{}@211000|254000|11000|11000|lkp|0.0|count|out|2|2448|0|}}
{2010210004|XXGflow|47|0|100|0|{@{}@384|.5|0.0|{12|222000|259000|242000|259000|242000|259000|242000|339000|299000|339000|320000|339000|}9977|17|}}
{2010203004|XXGoport|48|0|102|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|49|0|104|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|50|0|106|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|51|0|108|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|52|0|110|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|53|0|112|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|54|0|114|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|55|0|116|0|{@{}@67000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|56|0|119|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DO_SOURCE]|3|9||@{0|}}
{30001002|XXparameter|Layout|$SOURCE_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/source.$TARGET_SYSTEM/source.$TARGET_NAME.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$SOURCE_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|4\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|condition\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_conditional_comp_starts_c\|\}\}\{56\|Conditional components should start with a capital C.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_output_compressed_file_extension_functions\|\}\}\{56\|Compressed files should be written using dataset extension .gz
\|\}\}\}\}|3|9|P|@{0|}}
}}@0|@1199913|111047|671000|180000|56000|50000|14724|Optional: Source|Ab Initio Software||1|1000|-1||6|record_id	== '397416000_A'
|33025|-1|-1|}}
{2010202004|XXGiport|57|0|121|0|{@{}@661000|199000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|58|0|124|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|59|0|126|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|60|0|129|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DO_CLEAN]|3|9||@{0|}}
{30001002|XXparameter|Layout|$CLEAN_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/clean.$TARGET_SYSTEM/clean.$TARGET_NAME.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$CLEAN_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@1202913|236047|671000|285000|56000|50000|14812|Optional: Clean|Ab Initio Software||1|2050|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|61|0|131|0|{@{}@661000|304000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|62|0|134|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|63|0|136|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|64|0|139|0|{|{}@0|@472000|414500|494000|435000|56000|50000|9914|Dups|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|65|0|141|0|{@{}@484000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010210004|XXGflow|66|0|143|0|{@{}@384|.5|.5|{10|409000|398000|409000|418000|409000|459000|462000|459000|483000|459000|}9980|2065|}}
{2010501005|XXGpvertex|67|0|148|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|out0_metadata|$[ join_types('record\\n  string("\\\\x01") filename;\\n  decimal("\\\\x01") file_rec_cntr;\\n  decimal("\\\\x01") src_dataset_id;\\nend;', DATALAKE_DATA_FILE_DML_WITHOUT_MAXLENGTH) ]|3|9||@{0|}}
{30001002|XXparameter|transform0|include "/~$PUB_DXF_XFR/standardize.xfr";

/*Reformat operation*/
out::reformat(in)=
begin
  out.(*,form=="string" && name != "newline") :1: if(not is_blank($"CLEANSE_CHARECTERS")) re_replace(string_and_hex_replace(in.*), $"CLEANSE_CHARECTERS", "");
  out.(*,form=="string" && name != "newline") :2: string_and_hex_replace(in.*);
  //out.(*,name == "newline") :3: "\\n";
  out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|490000|204000|0|0|0|0|14824|Clean Hex Values|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|68|0|150|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|69|0|153|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|70|0|155|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|71|0|157|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|72|0|159|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|73|0|162|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|74|0|164|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|75|0|168|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|76|0|171|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|77|0|174|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|78|0|177|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|79|0|181|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform|include "/~$PUB_DXF_XFR/dataset_id.xfr";
include "/~$PUB_DXF_DML/dxf_job_event_text.dml";

/*Record format for the data read from each input file*/
type input_type = $\{DATALAKE_DATA_FILE_DML_WITHOUT_MAXLENGTH\};

let seq_number = 0; /* Assign record number on each source record.*/
let src_dataset_id = if ( this_partition() == 0 ) get_dataset_id("$\{DATASET_ID_LOOKUP_PATH\}") else 0;  /* The index into the Source Process table. */

//Temp variables to populate event_text
let cntr=0;
let prev_seq_number = -1;  // This is a temporary variable to hold prev seq number, however it still holds the value of prev seq number once control goes to first record of next file.
let datetime("YYYY-MM-DD HH24:MI:SS.nnnnnn") task_start_time = now();
let datetime("YYYY-MM-DD HH24:MI:SS.nnnnnn") dataset_start_time = allocate();
let string("") src_file_name = ""; // Holds the name of the source file to output to log.
let dxf_job_event_text_t job_info = allocate();

filename :: get_filename(in) =
begin 
  seq_number = 0;  
  if(cntr==0) // This condition is required to store first file name to global variable.
  begin
    src_file_name = in.filename;
    cntr = cntr + 1;
  end;
  dataset_start_time = now();
  filename :: in.filename;  /* Assign local file name of each file picked up for processing. */
end;

out :: reformat(read, filename, in) =
begin
  if(prev_seq_number + 1 != seq_number) // Until control reaches to first record of next file, the condition remains false. Once condition is true, it tries to ouput a log record with necessary information.
  begin 
        job_info = [record
    dxf_src_dataset_id  src_dataset_id,
    dxf_src_file_name   src_file_name,
    dxf_src_rec_cnt     prev_seq_number + 1,
    dataset_start_dttm  dataset_start_time,
    dataset_end_dttm    now(),
  ];
        write_to_log("summary :", job_info.as_event_text());
        prev_seq_number = seq_number; 
        src_file_name = in.filename;  
  end 
  else 
        prev_seq_number = seq_number;
  
  seq_number = seq_number + 1;
  out.filename :: filename;
  out.file_rec_cntr :: seq_number;
  out.src_dataset_id :: src_dataset_id;
  out.* :: read.*;
end;

/* Write last source file information to log as reformats fills the log information of all the other sources files. */
out :: final_log_output() =
begin
  job_info = [record
    dxf_src_dataset_id  src_dataset_id,
    dxf_src_file_name   src_file_name,
    dxf_src_rec_cnt     prev_seq_number + 1,
    dataset_start_dttm  dataset_start_time,
    dataset_end_dttm    now(),
  ];

  out.event_type :: "summary :";
  out.event_text :: job_info.as_event_text();
end;|3|3|c|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|$[ join_types('record\\n  string("\\\\001") filename;\\n  decimal("\\\\001") file_rec_cntr;\\n  decimal("\\\\001") src_dataset_id;\\nend;', DATALAKE_DATA_FILE_DML_WITHOUT_MAXLENGTH) ]|3|9||@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|read_count|1000|3|2|$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|1\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|lexer_yyerror\|\}\{56\|M1\|\}\{51\|1\|DA_parameter\|\{56\|transform\|\}\}\{\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|compressed||3|8|=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Read Multiple Files|158000|214500|0|0|0|0|14816|Read Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|80|0|183|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|81|0|186|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|82|0|188|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|83|0|190|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|84|0|192|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|85|0|194|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|86|0|197|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|87|0|200|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/readfiles|3|2|H$||{0|}}
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
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if the reformat transform rejects records read from input files|{3|Abort on first reject|Never abort|Use limit/ramp|}}
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
{30001002|XXparameter|file_empty|Ignore (continue with no reject or error)|15|1|Fl|What to do if an input file is empty|{4|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|Accept (If reading as single record, produce length-only record with no data)|}}
{30001002|XXparameter|file_empty.display_name|file-empty|3|9|P|@{0|}}
{30001002|XXparameter|file_empty.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_empty_keyword|value file-empty F* Fail value file-empty N* Notify value file-empty I* Ignore value file-empty A* Accept default dollar_substitution Ignore|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|file_empty_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_missing|Fail (Stop processing)|15|1|Fl|What to do if an input file is missing|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|file_missing.display_name|file-missing|3|9|P|@{0|}}
{30001002|XXparameter|file_missing.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_missing_keyword|value file-missing F* Fail value file-missing N* Notify value file-missing I* Ignore default dollar_substitution Fail|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|file_missing_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_unavailable|Fail (Stop processing)|15|1|Fl|What to do if the input file is not readable or is otherwise unavailable|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|file_unavailable.display_name|file-unavailable|3|9|P|@{0|}}
{30001002|XXparameter|file_unavailable_keyword|value file-unavailable F* Fail value file-unavailable N* Notify value file-unavailable I* Ignore value file-unavailable A* Accept default dollar_substitution Fail|3|13|Kv|What to do if the input file is not readable or is otherwise unavailable|{0|}}
{30001002|XXparameter|filename_error|Fail (Stop processing)|15|1|Fl|What to do with an input record when get_filename() fails|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|filename_error.display_name|filename-error|3|9|P|@{0|}}
{30001002|XXparameter|filename_error.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|filename_error_keyword|value filename-error F* Fail value filename-error N* Notify value filename-error I* Ignore default dollar_substitution Fail|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|filename_error_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|input_error|Fail (Stop processing)|15|1|Fl|What to do in case of error reading an input file|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|input_error.display_name|input-error|3|9|P|@{0|}}
{30001002|XXparameter|input_error.condition|version 2.14.70:|3|15|P?|@{0|}}
{30001002|XXparameter|input_error_keyword|value input-error F* Fail value input-error N* Notify value input-error I* Ignore default dollar_substitution Fail|3|13|Kv|What to do in case of error reading an input file|{0|}}
{30001002|XXparameter|input_error_keyword.condition|version 2.14.70:|3|15|P?|@{0|}}
{30001002|XXparameter|stream_raw_data|False|13|1|FKl|If True, streams raw data from input files|{0|}}
{30001002|XXparameter|stream_raw_data.condition|version 3.2.1.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|interpret_hadoop_data|False|13|1|Fl|If true, component will interpret data according to the selected Hadoop file format.|{0|}}
{30001002|XXparameter|interpret_hadoop_data.condition|version 3.2.2.r15.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|The input file format: 'uninterpreted' (read raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'rcfile' (RCFile format), 'avro' (Avro format), 'texttable' (Hive text table).|{7|uninterpreted|seqfile|parquet|orc|rcfile|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact interpret_hadoop_data True param_exact stream_raw_data False version 3.2.2.r15.0:|3|15|P?|@{0|}}
{30001002|XXparameter|select_columns_condition|value format parquet True value format orc True value format rcfile True value format * False default constant False|13|13|v|Hidden condition for deciding select-columns visibility|{0|}}
{30001002|XXparameter|select_columns||3|2|FK$|A comma-separated list of column number to read from RCFile, ORC File, or Parquet File. Column numbers are zero-based. For ORC file and Parquet file, if this is set, the direct name mapping via DML field names will be ignored.|{0|}}
{30001002|XXparameter|select_columns.display_name|select-columns|3|9|P|@{0|}}
{30001002|XXparameter|select_columns.keyword|select-columns|3|9|P|@{0|}}
{30001002|XXparameter|select_columns.condition|param select_columns_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|FK$|Location of schema file for reading avro files, prefix with file: or hdfs:. If not specified, data will be read using the schema in the data file.|{0|}}
{30001002|XXparameter|schema_file.display_name|schema-file|3|9|P|@{0|}}
{30001002|XXparameter|schema_file.keyword|schema-file|3|9|P|@{0|}}
{30001002|XXparameter|schema_file.condition|param format avro|3|15|P?|@{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, reads compressed input files|{0|}}
{30001002|XXparameter|compressed.condition|param_exact stream_raw_data False param_exact format uninterpreted version 2.12.2.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|read_as_single_record|False|13|1|FKl|If True, reads each file as one record, adding an initial 8-byte size|{0|}}
{30001002|XXparameter|read_as_single_record.condition|param_exact stream_raw_data False param_exact read-blocks False param_exact format uninterpreted version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|read_blocks|False|13|1|FKl|If True, reads each file as a series of blocks, adding an initial 8-byte size to each block|{0|}}
{30001002|XXparameter|read_blocks.display_name|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.keyword|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.condition|param_exact stream_raw_data False param_exact read_as_single_record False param_exact format uninterpreted version 2.14.25:|3|15|P?|@{0|}}
{30001002|XXparameter|maximum_block_bytes|-1|1|2|FK$|Block size when read-blocks is True. A value of -1 reads the entire file.|{0|}}
{30001002|XXparameter|maximum_block_bytes.display_name|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.keyword|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.condition|param_exact read-blocks True version 2.14.25:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp file_empty_keyword file-empty file_missing_keyword file-missing file_unavailable_keyword file-unavailable filename_error_keyword filename-error input_error_keyword input-error|3|2|$||{0|}}
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
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional input_type read <parameter out_metadata>|3|2|H$|Metadata for records read from input files|{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|num_operations|9|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation2|optional out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation2_analysis|optional long finished_out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation3|optional out::reformat(read, filename, in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|optional out::reformat(read, filename, in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional read::repair_input(void(integer(4)) rawbytes, filename)|3|2|H$|Repair malformed input record from file|{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional input_type read <parameter out_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=^read ; out=^read; filereject=in|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=read,r|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|type2|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation5|optional out::output_for_error(error_info, read)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation6|optional error::make_error(error_info, read)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::log_error(error_info, read)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation8|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation9|optional integer(8) out::output_select(out)|3|2|H$|Select output record.|{0|}}
{30001002|XXparameter|operation9.condition|version 3.2.1.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|operation9_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record.|{0|}}
{30001002|XXparameter|operation9_analysis.condition|version 3.2.1.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|filereject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|fileerror_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,filereject,fileerror,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: filereject = in
metadata type: fileerror = remote("$AB_HOME/include/error-info.dml")
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Read Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|88|0|202|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|89|0|205|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|90|0|208|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|91|0|211|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|92|0|214|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|93|0|217|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|94|0|220|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|95|0|223|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/get.datalake.$TARGET_NAME.\{RUN_ID\}.job_log.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/get.datalake.$TARGET_NAME.$RUN_ID.job_log.dat|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/dxf_process_log.dml|3|2|f$|@{0|}}
}}@0|@535000|408500|0|0|0|0|14790|Get Job Log (Formatted)|Ab Initio Software|@1|2050|0|@6||33025|-1|-1|}}
{2010202004|XXGiport|96|0|225|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|97|0|228|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|98|0|230|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|99|0|234|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|out_metadata|record
  string("") filename;
end;|3|1|l|@{0|}}
{30001002|XXparameter|num_records|$[length_of(DATA_FILE_LIST)]|3|9||@{0|}}
{30001002|XXparameter|transform|let string("")[int] filenames = $[string_representation(DATA_FILE_LIST)];

out::create(index)=
begin
  out.filename:: filenames[index - 1];
end;|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_PENDING|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[length_of(FILE_LIST_TO_PROCESS) >= 1]|3|9||@{0|}}
}}@0|Create Data|19000|229000|0|0|0|0|14813|List files|Ab Initio Software|Built-in 2.15.2:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|100|0|236|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|101|0|239|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|102|0|241|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|103|0|243|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|num_records.display_name|num-records|3|9|P|@{0|}}
{30001002|XXparameter|transform|out::create(index) = begin
  out :: random_value();
end;|8|1|FOl|DML function|{0|}}
{30001002|XXparameter|identical_records|False|13|1|FKl|Whether to evaluate the transform once only, or once for each record|{0|}}
{30001002|XXparameter|identical_records.display_name|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records.keyword|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records_display_values|Evaluatetransformanewforeachrecord Evaluatetransformonceandusethatvalueforallrecords|3|2|H$||{0|}}
{30001002|XXparameter|identical_records_display_values.display_name|identical-records-display-values|3|9|P|@{0|}}
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
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|1|1|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|continuous|False|13|1|RFOl|Whether to produce checkpoints or computepoints.|{0|}}
{30001002|XXparameter|checkpoint_interval|1|1|2|FO$|Number of records between checkpoints, or 0 to indicate that no checkpoints are to be generated.|{0|}}
{30001002|XXparameter|checkpoint_interval.display_name|checkpoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|checkpoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|computepoint_interval|0|1|2|FO$|Number of records between computepoints, or 0 to indicate that no computepoints are to be generated.|{0|}}
{30001002|XXparameter|computepoint_interval.display_name|computepoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|computepoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|do_timed_checkpoints|False|13|1|FKl|Generate checkpoints at timed intervals|{0|}}
{30001002|XXparameter|do_timed_checkpoints.display_name|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.keyword|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::create(unsigned long index)|3|2|H$|Function taking integer index counting 1,2,3,4... to produce records on the output.|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? subscriber :|3|2|H$||{0|}}
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
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|Create Data|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|104|0|245|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|105|0|248|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|106|0|251|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|107|0|257|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Run_Program.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|commandline|ksh -e -c '

if [[ ( x"$\{FILE_LIST_CTL_FOR_AUDIT\}" != x"" ) &&  ( x"$\{LOCAL_TRIGGER_FILE_DIRECTORY\}" != x"" ) ]];then
   cd "$\{LOCAL_TRIGGER_FILE_DIRECTORY\}"
 echo "$\{FILE_LIST_CTL_FOR_AUDIT\}" >> processed.ctl.$\{RUN_GROUP\}.$\{RUN_ID\}.dat

fi
'|3|3|c|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[USE_LOCAL_CTL== "Y"]|3|9||@{0|}}
}}@1|Run Program|857000|644500|0|0|0|0|14804|Append processed CTL file to list  - AT process end CTL files will be moved|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|108|0|259|0|{@{}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|109|0|261|0|{@{}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|110|0|263|0|{Executes a standard UNIX or Windows program.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|filter|3|1|Hl||{0|}}
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
{2010203004|XXGoport|111|0|265|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|112|0|268|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010600005|XXGgraph|113|0|272|0|{Subgraph created from graph "get.datalake"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|AB_DML_DEFS|include "/~$PUB_DXF_XFR/keys.xfr";|3|9|K|@{0|}}
{30001002|XXparameter|condition|$[ DO_CONS_LOOKUP and length_of(DATA_FILE_LIST)!=0 ]|3|9|F||{0|}}
{30001002|XXparameter|CONS_DML_FILE|$[AI_DML + "/lookup." + TARGET_SYSTEM + "/lookup." + TARGET_NAME + ".dml" ]|3|9|FK|Lookup DML File URL|{0|}}
{30001002|XXparameter|LOOKUP_KEY|$LOOKUP_KEY|3|9|RFK||{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$EFFECTIVE_DATE_FIELD_NAME|3|9|RFK||{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$END_DATE_FIELD_NAME|3|9|RFK||{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|$ADJACENT_INTERVAL_MICROSECONDS|3|9|RFK||{0|}}
{30001002|XXparameter|UNDATED_NATURAL_KEY|$[ re_replace(LOOKUP_KEY,
    "; *[^;]* interval_bottom;.*",
    "\}")
]|3|9|RFK||{0|}}
{30001002|XXparameter|PARTITION_KEY|$UNDATED_NATURAL_KEY|3|9|FK|@{0|}}
{30001002|XXparameter|DEDUP_KEY|$[ if ( EFFECTIVE_DATE_FIELD_NAME == "" )
    UNDATED_NATURAL_KEY
  else
    add_key(UNDATED_NATURAL_KEY,
      key_info(EFFECTIVE_DATE_FIELD_NAME)[0])
]|3|9|RFK||{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$DEDUP_SORT_KEY|3|9|RFK||{0|}}
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
]|3|9|FK|@{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_DIRECTION|$[ CHECK_KEYS + if ( END_DATE_FIELD_NAME == "" ) "ascending" else "descending" ]|3|9|FK|@{0|}}
{30001002|XXparameter|ADJUSTED_DEDUP_SORT_KEY|$[ set_field_direction(DEDUP_SORT_KEY, EFFECTIVE_DATE_FIELD_NAME, EFFECTIVE_DATE_DIRECTION) ]|3|9|RFK||{0|}}
{30001002|XXparameter|ADJUSTED_DEDUP_KEY|$[ set_field_direction(DEDUP_KEY, EFFECTIVE_DATE_FIELD_NAME, EFFECTIVE_DATE_DIRECTION) ]|3|9|RFK||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|mpcmodtime|1478193281|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hl|@{0|}}
}}@0|@1283500|333250|0|0|0|0|14797|Cons LookUp|||1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1075000|497000|3|}}
{2010240003|XXGlegend|114|0|274|0|{@{}@Raw MFS File|18000|450000|0|0|0|0|14448|}}
{2010242002|XXGface|115|0|276|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|116|0|278|0|{@{}@384|.5|.5|{0|}14547|17|}}
{2010210004|XXGflow|117|0|280|0|{@{}@384|.5|.5|{0|}14553|2065|}}
{2010210004|XXGflow|118|0|282|0|{@{}@384|.5|.5|{0|}14551|1044|}}
{2010210004|XXGflow|119|0|284|0|{@{}@384|.5|.5|{0|}14545|1041|}}
{2010210004|XXGflow|120|0|286|0|{@{}@384|.5|.5|{0|}14532|2065|}}
{2010210004|XXGflow|121|0|288|0|{@{}@384|.5|.5|{0|}14546|1041|}}
{2010501005|XXGpvertex|122|0|290|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Join.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|driving|1|3|2|$|@{0|}}
{30001002|XXparameter|key|$NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|transform|out :: join(in0, in1) =
begin
  out.* :1: in0.*;
  out.* :2: in1.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|dedup0|True|3|1|l|@{0|}}
{30001002|XXparameter|join_type|Full Outer Join (use null for missing records)|3|1|l|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Join|451000|259000|0|0|0|0|14548|Join : \{NK\}|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|123|0|292|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|124|0|295|0|{@{}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|125|0|297|0|{@{}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|126|0|299|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|127|0|301|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|128|0|303|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|129|0|305|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|130|0|307|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|131|0|309|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|132|0|312|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|133|0|315|0|{Performs inner, outer, and semi-joins with multiple flows of data records. It maximizes performance by loading input data records into main memory.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?join|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of inputs to join function|{0|}}
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
{30001002|XXparameter|record_match_required_not0|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not0.display_name|record-match-required-not0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not1|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
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
{30001002|XXparameter|record_required_keyword0|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
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
{30001002|XXparameter|check_sort|False|13|1|FKl|Always check sort order on inputs|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 3.0.1.r9: param sorted-input True|3|15|P?|@{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|unused0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|unused1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,unused[*],reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: unused = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Join|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|134|0|317|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|135|0|320|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|136|0|323|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|137|0|326|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|138|0|329|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|139|0|332|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|140|0|335|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|141|0|338|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|142|0|341|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
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
{2010202004|XXGiport|143|0|359|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
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
{2010503005|XXGfvertex|144|0|377|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$TEMP_RAW_MFS_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$TEMP_RAW_MFS_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$CONS_DML_FILE|3|2|f$|@{0|}}
}}@0|@981000|119000|0|0|0|0|14554|Temp RAW MFS File|Ab Initio Software|@1|100|-1|@6||33025|-1|-1|}}
{2010202004|XXGiport|145|0|379|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|146|0|382|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|147|0|384|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|148|0|388|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$RAW_MFS_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$RAW_MFS_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$CONS_DML_FILE|3|2|f$|@{0|}}
}}@0|@21000|389000|0|0|0|0|14533|RAW MFS File|Ab Initio Software|@1|100|-1|@6||33025|-1|-1|}}
{2010203004|XXGoport|149|0|390|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|150|0|393|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|151|0|395|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|152|0|403|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Merge|976000|413000|0|0|0|0|14552|Merge|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|153|0|405|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|154|0|407|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|155|0|410|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{2010203004|XXGoport|156|0|412|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|157|0|415|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010503005|XXGfvertex|158|0|418|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$LOOKUP_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$LOOKUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ DO_CONS_LOOKUP and  length_of(DATA_FILE_LIST)!=0 ]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@1487000|360000|0|0|0|0|14791|Optional : Cons Lookup|Ab Initio Software|@1|100|-1|@6||33025|-1|-1|}}
{2010202004|XXGiport|159|0|420|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|160|0|423|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|161|0|425|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|162|0|431|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@176000|370000|0|0|481000|303000|14529|PBKS: \{NK\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|163|0|433|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|164|0|435|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|165|0|437|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|166|0|440|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|167|0|444|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|168|0|446|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|169|0|448|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|170|0|453|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|171|0|457|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|172|0|461|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|173|0|463|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|174|0|465|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|175|0|467|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|176|0|470|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|177|0|472|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|178|0|474|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|179|0|477|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|180|0|482|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|181|0|484|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|182|0|486|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|183|0|489|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|184|0|491|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|185|0|494|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|186|0|500|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|187|0|503|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|188|0|508|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@181000|190000|0|0|481000|303000|14540|PBKS on \{NK\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|189|0|510|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|190|0|512|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|191|0|514|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|192|0|517|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|193|0|519|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DO_LOOKUP && !DO_CONS_LOOKUP]|3|9||@{0|}}
{30001002|XXparameter|Layout|$LOOKUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$LOOKUP_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@1486913|516047|671000|390000|56000|50000|14730|Optional: Lookup|Ab Initio Software||1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|194|0|521|0|{@{}@661000|409000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|195|0|524|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|196|0|526|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|197|0|530|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|198|0|532|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|199|0|534|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|200|0|539|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|201|0|543|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|202|0|546|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|203|0|548|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|204|0|550|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|205|0|552|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|206|0|555|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|207|0|557|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|208|0|559|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|209|0|562|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|210|0|567|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|211|0|569|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|212|0|571|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|213|0|574|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|214|0|576|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|215|0|579|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|216|0|585|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|217|0|588|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|218|0|591|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_LOOKUP|3|2|$|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
}}@0|Replicate|1178000|425500|0|0|0|0|14723|Replicate-1|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|219|0|593|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|220|0|597|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|221|0|600|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|222|0|602|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|223|0|605|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|224|0|612|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|926000|289000|0|0|0|0|14521|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|225|0|614|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|226|0|618|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|227|0|621|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|228|0|623|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|229|0|626|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010203004|XXGoport|230|0|633|0|{@{}@0|0|0|0|out1|.7364185110663984|@@@14352|0|}}
{2010202004|XXGiport|231|0|637|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|232|0|641|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Run_Program.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|commandline|ksh -e -c '

if [[ x"$\{SOURCE_FILE_URL\}" != x"" ]]; then
   d="$(echo  $\{SOURCE_FILE_URL\} \| sed 's/mfile://')"
   m_touch -m 666 "$d"
fi

if [[ x"$\{CLEAN_FILE_URL\}" != x"" ]]; then
   d="$(echo  $\{CLEAN_FILE_URL\} \| sed 's/mfile://')"
   m_touch -m 666 "$d"
fi

if [[ x"$\{LOOKUP_FILE_URL\}" != x"" ]]; then
   d="$(echo  $\{LOOKUP_FILE_URL\} \| sed 's/file://')"
   touch -m 666 "$d"
fi
'|3|3|c|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[length_of(FILE_LIST_TO_PROCESS) == 0]|3|9||@{0|}}
}}@1|Run Program|582000|639500|0|0|0|0|14821|Create zero byte Source/Clean/Lookup if no files to process.|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|233|0|643|0|{@{}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|234|0|645|0|{@{}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|235|0|647|0|{Executes a standard UNIX or Windows program.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|filter|3|1|Hl||{0|}}
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
{2010203004|XXGoport|236|0|649|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|237|0|652|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|238|0|661|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Partition by Round-robin|351000|244000|0|0|0|0|14722|PBRR|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|239|0|663|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|240|0|666|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|241|0|669|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Partition by Round-robin|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|242|0|671|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|243|0|674|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|244|0|680|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|select|event_type == "summary :"|3|2|$|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|include "/~$PUB_DXF_DML/dxf_job_event_text.dml";

let long task_start_time = now();

/* Roll up all the job log entries for a given dataset. */
out :: reformat(in) =
begin

  let dxf_job_event_text_t job_info = reinterpret(in.event_text);
  let decimal("") dl_root_dir_len = string_length($"DATALAKE_MAIN_DIR");
  let string("") ds_file_path = string_substring(job_info.dxf_src_file_name, 0, string_rindex(job_info.dxf_src_file_name, "/"));
  let string("") ds_file_name = string_substring(job_info.dxf_src_file_name, string_length(ds_file_path) + 1, 9999);
  let string("")[int] ctl_file_wise_list = $[string_representation(CTL_FILE_WISE_COUNT)];
  let string("") ctl_file_detail = string_replace(ds_file_path, "/" + $"DATALAKE_DATA_FILE_DIR_NM" + "/", "/" + $"DATALAKE_CTRL_FILE_DIR_NM" + "/", dl_root_dir_len - 1) + string_substring(ds_file_name, 1, string_index(ds_file_name, $"DATALAKE_DATA_FILE_EXTN") - 1) + ".ctl" + "\|" + (string("")) job_info.dxf_src_rec_cnt;
  
  out.* :: job_info.*;
  out.dxf_src_dataset_id :: job_info.dxf_src_dataset_id;  // Use the value from partition 0.
  out.run_id :: $"RUN_ID";
  out.task_name :: $"AB_PSET_NAME";
  out.task_start_dttm :: task_start_time;
  out.task_end_dttm :: now();
  out.dataset_name :: ds_file_name; 
  out.dxf_src_rec_cnt :: if( vector_search(ctl_file_wise_list, ctl_file_detail) == -1 )  job_info.dxf_src_rec_cnt
                             //force_error("ERROR: Record mismatch between \\"" + job_info.dxf_src_file_name + "\\" data file \\nand \\"" + string_split(ctl_file_detail, "\|")[0] + "\\" control file. Aborting the graph.\\n\\n")
                         else
                             job_info.dxf_src_rec_cnt;
  out.type_of_input :: 'datalake file'; /* Or 'file' or 'ftp' */
  out.dataset_start_dttm :: job_info.dataset_start_dttm;
  out.dataset_min_end_dttm :: job_info.dataset_end_dttm;
  out.dataset_max_end_dttm :: job_info.dataset_end_dttm;
  out.file_path :: ds_file_path; 
  out.file_size :: file_information(job_info.dxf_src_file_name).size; 
  out.file_modified_dttm :: file_information(job_info.dxf_src_file_name).modified;
  out.sql_script :: "";
end;|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|~\{52\|1\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|PARAM_failure\|\}\{56\|PARAM113\|\}\{51\|2\|DA_parameter\|\{56\|transform0\|\}DA_port\|\{56\|out0\|\}\}\{\}\}\}\}|3|9|P|@{0|}}
}}@0|Reformat|301000|369500|0|0|0|0|14820|Parse Log and Validate Count(s)|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|245|0|682|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|246|0|685|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|247|0|687|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|248|0|689|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|249|0|691|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|250|0|694|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|251|0|696|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|252|0|700|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|253|0|703|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|254|0|706|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|255|0|709|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|256|0|718|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Run_Program.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|commandline|ksh -c '
if [[ "$\{FILE_LIST_MANUAL\}" == "" ]]; then 
   echo "$\{NEW_END_TS\}" > $\{LAST_EXTRACT_TIMESTAMP_FILE_NAME\}
fi'|3|3|c|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[USE_LOCAL_CTL!= "Y"]|3|9||@{0|}}
}}@1|Run Program|372000|659500|0|0|0|0|14793|Update Watermark Timestamp|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|257|0|720|0|{@{}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|258|0|722|0|{@{}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|259|0|724|0|{Executes a standard UNIX or Windows program.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|filter|3|1|Hl||{0|}}
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
{2010203004|XXGoport|260|0|726|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|261|0|729|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010600005|XXGgraph|262|0|732|0|{Subgraph created from graph "get.datalake"|{}@0|@83000|59250|0|0|0|0|14794|Version Log|spulikon|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|2300000|1222000|7|}}
{2010240003|XXGlegend|263|0|734|0|{@{}@Overview:

DATA_LAKE_SOURCE_TYPE parameter accepts either "datalake or local", If set to "datalake", get process picks files from DATALAKE_ROOT_DIR otherwise from DATALAKE_LOCAL_DIR.
DATALAKE_CTRL_FILE_DIR_NM, DATALAKE_META_FILE_DIR_NM, DATALAKE_DATA_FILE_DIR_NM parameters are set to hold default values "other", "meta" and "data" respectively.

For the above said default values datalake process reads control, meta and data files of pattern below.
<<BOOK_NAME>>_<<SCHEMA_NAME>>_<<TABLE_NAME>>_YYYYMMDDTHH24MISS.<<FILE_EXTENSION>>
from control file locations <<DATALAKE_ROOT_DIR or DATALAKE_LOCAL_DIR>>/<<BOOK_NAME_LOWER>>/DATALAKE_CTRL_FILE_DIR_NM/<<SCHEMA_NAME>>_<<TABLE_NAME>>/<<SCHEMA_NAME>>_<<TABLE_NAME>>.v*/date=????????/
from meta file locations <<DATALAKE_ROOT_DIR or DATALAKE_LOCAL_DIR>>/<<BOOK_NAME_LOWER>>/DATALAKE_META_FILE_DIR_NM/<<SCHEMA_NAME>>_<<TABLE_NAME>>/<<SCHEMA_NAME>>_<<TABLE_NAME>>.v*/date=????????/
from data file locations <<DATALAKE_ROOT_DIR or DATALAKE_LOCAL_DIR>>/<<BOOK_NAME_LOWER>>/DATALAKE_DATA_FILE_DIR_NM/<<SCHEMA_NAME>>_<<TABLE_NAME>>/<<SCHEMA_NAME>>_<<TABLE_NAME>>.v*/date=????????/

Otherwise datalake process reads control, meta and data files of pattern below.
<<BOOK_NAME>>_<<SCHEMA_NAME>>_<<TABLE_NAME>>.<<FILE_EXTENSION>>
from control file locations <<DATALAKE_ROOT_DIR or DATALAKE_LOCAL_DIR>>/DATALAKE_CTRL_FILE_DIR_NM/
from meta file locations <<DATALAKE_ROOT_DIR or DATALAKE_LOCAL_DIR>>/DATALAKE_META_FILE_DIR_NM/
from data file locations <<DATALAKE_ROOT_DIR or DATALAKE_LOCAL_DIR>>/DATALAKE_DATA_FILE_DIR_NM/

This graph performs validations such as
1. Checks existense of control, meta and data files.
2. Selects/picks files that are between START_DTTM and END_DTTM.
3. Checks Control file content is valid and file is in required format.
4. Checks Meta file content is valid and all required fields are validated for name, type, size and format etc.
5. Checks count mismatches between control and data files.
|40000|30000|0|0|0|0|14675|}}
{2010242002|XXGface|264|0|736|0|{@{}@Candara|32768|140|0|}}
{2010240003|XXGlegend|265|0|738|0|{@{}@Version|52000|721000|0|0|0|0|14695|}}
{2010242002|XXGface|266|0|740|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|267|0|742|0|{@{}@Date|127000|721000|0|0|0|0|14676|}}
{2010242002|XXGface|268|0|744|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|269|0|746|0|{@{}@Description|452000|721000|0|0|0|0|14677|}}
{2010242002|XXGface|270|0|748|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|271|0|750|0|{@{}@Author|252000|721000|0|0|0|0|14678|}}
{2010242002|XXGface|272|0|752|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|273|0|754|0|{@{}@1.0|52000|743000|0|0|0|0|14696|}}
{2010242002|XXGface|274|0|756|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|275|0|758|0|{@{}@2.0|52000|763000|0|0|0|0|14679|}}
{2010242002|XXGface|276|0|760|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|277|0|762|0|{@{}@Searching Efficiency & Local Support Added|452000|778000|0|0|0|0|14709|}}
{2010242002|XXGface|278|0|764|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|279|0|766|0|{@{}@Initial version
|452000|738000|0|0|0|0|14707|}}
{2010242002|XXGface|280|0|768|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|281|0|770|0|{@{}@Jun 10 2016|117000|743000|0|0|0|0|14715|}}
{2010242002|XXGface|282|0|772|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|283|0|774|0|{@{}@Dec 27 2016|117000|763000|0|0|0|0|14716|}}
{2010242002|XXGface|284|0|776|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|285|0|778|0|{@{}@3.0|52000|783000|0|0|0|0|14714|}}
{2010242002|XXGface|286|0|780|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|287|0|782|0|{@{}@Mar 03 2017|117000|783000|0|0|0|0|14717|}}
{2010242002|XXGface|288|0|784|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|289|0|786|0|{@{}@Sripavan Pulikonda (Exusia)|227000|743000|0|0|0|0|14706|}}
{2010242002|XXGface|290|0|788|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|291|0|790|0|{@{}@Gunit Kaur (Exusia)|227000|783000|0|0|0|0|14713|}}
{2010242002|XXGface|292|0|792|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|293|0|794|0|{@{}@Mukesh Singh (Exusia)|227000|763000|0|0|0|0|14712|}}
{2010242002|XXGface|294|0|796|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|295|0|798|0|{@{}@High Level Design conceived by:
Anwar Parvez, Alex Zhao

ETL Design conceived by:
Manav Jindal|53000|605000|0|0|0|0|14694|}}
{2010242002|XXGface|296|0|800|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|297|0|802|0|{@{}@Support added to pick files from trigger|452000|758000|0|0|0|0|14708|}}
{2010242002|XXGface|298|0|804|0|{@{}@Arial Narrow|0|100|0|}}
{2010600005|XXGgraph|299|0|806|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/prepare_output.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|DUP_FILE_URL|mfile:$AI_MFS_REJECT/$STEP.$TARGET_SYSTEM/$STEP.$TARGET_NAME.dups.dat.gz|3|9||@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
}}@0|@907000|205000|0|0|892000|502000|14803|prepare output-1|Kimbo Mundy|Created 12/5/2013 10:59:43 PM|1|100|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|891000|502000|1|}}
{2010240003|XXGlegend|300|0|808|0|{@{}@Disabled if no lookup key|316000|250000|336000|270000|145000|16000|9843|}}
{2010242002|XXGface|301|0|810|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|302|0|812|0|{@{}@Always
Disabled|786000|395000|806000|415000|50000|32000|9942|}}
{2010242002|XXGface|303|0|814|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|304|0|816|0|{@{}@Disabled if no 
lookup key|621000|235000|641000|260000|82000|32000|9897|}}
{2010242002|XXGface|305|0|818|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|306|0|820|0|{@{}@Enabled if no 
lookup key|621000|445000|641000|465000|79000|32000|9875|}}
{2010242002|XXGface|307|0|822|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|308|0|826|0|{@{}@384|.5|.5|{8|499000|334000|529000|334000|624000|334000|645000|334000|}9978|1043|}}
{2010210004|XXGflow|309|0|829|0|{@{}@384|.5|1.0|{12|716000|334000|736000|334000|771000|334000|771000|379000|771000|379000|792000|379000|}9964|17|}}
{2010210004|XXGflow|310|0|831|0|{@{}@384|.5|.5|{12|499000|344000|519000|344000|569000|344000|569000|434000|620000|434000|641000|434000|}9979|19|}}
{2010210004|XXGflow|311|0|834|0|{@{}@384|.5|1.0|{12|712000|434000|732000|434000|771000|434000|771000|389000|771000|389000|792000|389000|}9962|17|}}
{2010501005|XXGpvertex|312|0|836|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@769000|75000|777000|84000|54000|41000|9937|Copy Out|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|313|0|838|0|{@{}@830000|99000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|314|0|840|0|{@{}@767000|99000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|315|0|846|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@764000|200000|772000|209000|54000|41000|9972|Copy Out.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|316|0|848|0|{@{}@825000|224000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|317|0|850|0|{@{}@762000|224000|11000|11000|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|318|0|856|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|INPUT_DML||3|8|s=|@{0|}}
}}@0|@310336|269500|331000|292000|884000|534000|9981|Dedup and Fix Intervals|||1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}.17873303592205048|884000|533000|1|}}
{2010240003|XXGlegend|319|0|858|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|320|0|860|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|321|0|862|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|322|0|864|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|323|0|866|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|324|0|868|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|325|0|870|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6796|}}
{2010242002|XXGface|326|0|872|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|327|0|874|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|328|0|876|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|329|0|878|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6835|17|}}
{2010210004|XXGflow|330|0|880|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6834|20|}}
{2010210004|XXGflow|331|0|882|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6832|17|}}
{2010210004|XXGflow|332|0|884|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6828|17|}}
{2010210004|XXGflow|333|0|886|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6823|17|}}
{2010210004|XXGflow|334|0|888|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6817|17|}}
{2010501005|XXGpvertex|335|0|890|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@98000|203000|118000|223000|124000|107000|6833|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|336|0|892|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|337|0|895|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|338|0|897|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|339|0|899|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|340|0|901|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|341|0|903|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|342|0|911|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|343|0|913|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|344|0|916|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|345|0|920|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|346|0|922|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|347|0|924|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|348|0|930|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@479000|385000|499000|405000|129000|107000|6818|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|349|0|932|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|350|0|935|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|351|0|937|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|352|0|939|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|353|0|941|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|354|0|948|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@477000|176000|497000|196000|139000|107000|6788|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|355|0|950|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|356|0|953|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|357|0|955|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|358|0|957|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|359|0|959|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|360|0|966|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@328000|62062|348000|82000|106000|89000|6836|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|361|0|968|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|362|0|971|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|363|0|977|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@131000|387000|151000|407000|135000|107000|6824|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|364|0|979|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|365|0|982|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|366|0|988|0|{Subgraph created from graph "kimbo"|{}@0|@516500|22000|535000|42000|822000|206000|6782|Testing|Kimbo Mundy||1|100|-1||9||32833|{0|}0|0|{0|}{0|}{0|}{0|}.3654080331325531|821000|206000|3|}}
{2010240003|XXGlegend|367|0|990|0|{@{}@Expected Output:
adjacent\|\|>>\|same\|1900-01-02\|1900-01-05\|
dup_keys\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v2\|1900-01-04\|1900-01-05\|
overlap-mix\|\|>>\|same\|1900-01-02\|1900-01-05\|
overlap-mix\|\|>>\|diff\|1900-01-06\|1900-01-07\|
overlap-mix\|\|>>\|same\|1900-01-08\|1900-01-11\|
overlap-same\|\|>>\|same\|1900-01-02\|1900-01-05\||535000|25000|555000|45000|270000|144000|6782|}}
{2010242002|XXGface|368|0|992|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|369|0|994|0|{@{}@384|.5|.5|{8|400000|179000|420000|179000|427000|179000|448000|179000|}6778|17|}}
{2010210004|XXGflow|370|0|996|0|{@{}@384|.5|.5|{8|107000|104000|127000|104000|151000|104000|172000|104000|}6763|17|}}
{2010501005|XXGpvertex|371|0|998|0|{|{}@0|@17000|56000|37000|76000|60000|60000|6764|Create|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|372|0|1000|0|{@{}@96000|99000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|373|0|1003|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|374|0|1005|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|375|0|1007|0|{|{}@0|@379000|49500|401000|70000|56000|50000|6783|Dups|Ab Initio Software||1|10|0||6||32897|-1|-1|}}
{2010202004|XXGiport|376|0|1009|0|{@{}@424000|60000|11000|11000|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|377|0|1011|0|{|{}@0|@326000|151500|332000|161000|58000|41000|6779|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|378|0|1013|0|{@{}@389000|174000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|379|0|1016|0|{@{}@322000|174000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|380|0|1018|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@173000|73500|183000|83000|50000|41000|6752|Partition by Round-robin|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|381|0|1020|0|{@{}@232000|99000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|382|0|1022|0|{@{}@173000|99000|11000|11000|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|383|0|1027|0|{|{}@0|@437000|136000|459000|156000|56000|50000|6758|stdout|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|384|0|1029|0|{@{}@449000|174000|11000|11000|write|0.0|@@@1776|0|}}
{2010203004|XXGoport|385|0|1032|0|{@{}@525000|74000|11000|11000|out|.5|@@@14099|0|}}
{2010202004|XXGiport|386|0|1035|0|{@{}@834000|74000|11000|11000|in0|.5|@@@63762|0|}}
{2010202004|XXGiport|387|0|1038|0|{@{}@679000|32000|11000|11000|in1|.5|@@@12960|0|}}
{2010203004|XXGoport|388|0|1041|0|{@{}@488000|329000|11000|21000|out|.5|@@@14352|0|}}
{2010203004|XXGoport|389|0|1046|0|{@{}@404000|387000|11000|11000|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|390|0|1050|0|{@{}@321000|334000|11000|11000|in|.5|@@@14096|0|}}
{2010501005|XXGpvertex|391|0|1056|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@642000|401500|652000|416000|50000|41000|9963|Gather|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|392|0|1058|0|{@{}@701000|429000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|393|0|1061|0|{@{}@642000|429000|11000|11000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|394|0|1066|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@793000|351500|803000|366000|50000|41000|9955|Gather.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|395|0|1068|0|{@{}@852000|379000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|396|0|1070|0|{@{}@793000|374000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|397|0|1078|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@646000|298500|656000|313000|50000|41000|9965|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|398|0|1080|0|{@{}@705000|329000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|399|0|1083|0|{@{}@646000|329000|11000|11000|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|400|0|1088|0|{@{}@0|0|0|0|source|.16666666666666666|@@@14352|0|}}
{2010203004|XXGoport|401|0|1092|0|{@{}@0|0|0|0|clean|.5|@@@14352|0|}}
{2010203004|XXGoport|402|0|1096|0|{@{}@0|0|0|0|lookup|.8333333333333333|@@@14736|0|}}
{2010202004|XXGiport|403|0|1100|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|404|0|1104|0|{Subgraph created from graph "clean.db_edw"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LOOKUP_KEY|$LOOKUP_KEY|3|9|FK|\{key1; key2...\}: Optional: A key that can optionally end with either an interval field or a pair of interval bottom and top feilds.  All key fields must be present in the input DML.  If this is omitted, then you must explictly specify the other parameters.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$EFFECTIVE_DATE_FIELD_NAME|3|9|FK|Optional: The name of the field that contains the start of the interval, if any.  This is often set to the effective start date.  Defaults to the interval_bottom field in the lookup key, if any.|{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$END_DATE_FIELD_NAME|3|9|FK|Optional: The name of the field that contains the end of the interval, if any.  This is often set to the effective end date or termination date.  Defaults to the interval_top field in the lookup key, if any.|{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|$ADJACENT_INTERVAL_MICROSECONDS|3|9|FK|#: The number of microseconds between adjacent effective and end dates.  Typically 1 or 1000000 (a second) or 86400000000 (a day).|{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$DEDUP_SORT_KEY|3|9|RFK|\{key1; key2...\}: The key to sort by, before the dedup.  All key fields must be present in the input DML.  Defaults to a value based on the dedup key.  For Type 2 loads, set this to the dedup key plus the end effective date.  We keep the shorter records on the theory that they would be newer.|{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$KEEP_FROM_FIRST_VEC|3|9|RFK|A vector of fields that should be copied from the earlier record when two matching, adjacent records are merged.  Defaults to the effective date and DMF matching effective date, if any.|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|STEP|get|3|9|RFK|The step name.  Used to prefix the Dups reject file name.|{0|}}
{30001002|XXparameter|DUP_FILE_URL|mfile:$AI_MFS_REJECT/$STEP.$SOURCE_SYSTEM/$STEP.$SOURCE_LOWER.dups.dat.gz|3|9|FK|@{0|}}
{30001002|XXparameter|mpcmodtime|1464875888|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@260000|290678|0|0|892000|502000|0|prepare_output|||1|100|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|891000|502000|3|}}
{2010240003|XXGlegend|405|0|1106|0|{@{}@Disabled if no lookup key|316000|250000|336000|270000|145000|16000|9843|}}
{2010242002|XXGface|406|0|1108|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|407|0|1110|0|{@{}@Always
Disabled|786000|395000|806000|415000|50000|32000|9896|}}
{2010242002|XXGface|408|0|1112|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|409|0|1114|0|{@{}@Disabled if no 
lookup key|621000|235000|641000|260000|82000|32000|9897|}}
{2010242002|XXGface|410|0|1116|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|411|0|1118|0|{@{}@Enabled if no 
lookup key|621000|445000|641000|465000|79000|32000|9875|}}
{2010242002|XXGface|412|0|1120|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|413|0|1122|0|{@{}@384|.5|0.0|{12|222000|259000|242000|259000|242000|259000|242000|339000|299000|339000|320000|339000|}9909|17|}}
{2010210004|XXGflow|414|0|1124|0|{@{}@384|.5|.1120000034570694|{8|222000|229000|252000|229000|740000|229000|761000|229000|}9853|17|}}
{2010210004|XXGflow|415|0|1126|0|{@{}@384|.5|.5|{8|499000|334000|529000|334000|624000|334000|645000|334000|}9910|1043|}}
{2010210004|XXGflow|416|0|1128|0|{@{}@384|.5|.5|{10|409000|398000|409000|418000|409000|459000|462000|459000|483000|459000|}9913|2065|}}
{2010210004|XXGflow|417|0|1130|0|{@{}@384|.5|1.0|{12|716000|334000|736000|334000|771000|334000|771000|379000|771000|379000|792000|379000|}9902|17|}}
{2010210004|XXGflow|418|0|1132|0|{@{}@384|.5|.5|{12|499000|344000|519000|344000|569000|344000|569000|434000|620000|434000|641000|434000|}9911|19|}}
{2010210004|XXGflow|419|0|1134|0|{@{}@384|.5|0.0|{12|222000|199000|242000|199000|242000|199000|242000|104000|745000|104000|766000|104000|}9852|17|}}
{2010210004|XXGflow|420|0|1136|0|{@{}@384|.5|1.0|{12|712000|434000|732000|434000|771000|434000|771000|389000|771000|389000|792000|389000|}9903|17|}}
{2010501005|XXGpvertex|421|0|1138|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@769000|75000|777000|84000|54000|41000|9858|Copy Out|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|422|0|1140|0|{@{}@830000|99000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|423|0|1142|0|{@{}@767000|99000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|424|0|1145|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|425|0|1147|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|426|0|1150|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|427|0|1153|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@764000|200000|772000|209000|54000|41000|9859|Copy Out.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|428|0|1155|0|{@{}@825000|224000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|429|0|1157|0|{@{}@762000|224000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|430|0|1160|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|431|0|1162|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|432|0|1165|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|433|0|1168|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/dedup_and_fix_intervals.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|LOOKUP_KEY|$LOOKUP_KEY|3|9||@{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$EFFECTIVE_DATE_FIELD_NAME|3|9||@{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$END_DATE_FIELD_NAME|3|9||@{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|$ADJACENT_INTERVAL_MICROSECONDS|3|9||@{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$DEDUP_SORT_KEY|3|9||@{0|}}
{30001002|XXparameter|INPUT_DML||3|8|s=|@{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$KEEP_FROM_FIRST_VEC|3|9||@{0|}}
{30001002|XXparameter|condition|$[ DO_LOOKUP and LOOKUP_KEY != "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|3|1|l|@{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|$|@{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|$|@{0|}}
}}@0|@310336|269500|331000|292000|884000|534000|9912|Dedup and Fix Intervals|||1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}.17873303592205048|884000|533000|1|}}
{2010240003|XXGlegend|434|0|1170|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|435|0|1172|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|436|0|1174|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|437|0|1176|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|438|0|1178|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|439|0|1180|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|440|0|1182|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6796|}}
{2010242002|XXGface|441|0|1184|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|442|0|1186|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|443|0|1188|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|444|0|1190|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6770|17|}}
{2010210004|XXGflow|445|0|1192|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6780|20|}}
{2010210004|XXGflow|446|0|1194|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6786|17|}}
{2010210004|XXGflow|447|0|1196|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6787|17|}}
{2010210004|XXGflow|448|0|1198|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6789|17|}}
{2010210004|XXGflow|449|0|1200|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6790|17|}}
{2010501005|XXGpvertex|450|0|1202|0|{|{}@0|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|451|0|1204|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|452|0|1207|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|453|0|1209|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|454|0|1211|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|455|0|1213|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|456|0|1215|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|457|0|1218|0|{|{}@0|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|458|0|1220|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|459|0|1223|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|460|0|1225|0|{|{}@0|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|461|0|1227|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|462|0|1229|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|463|0|1232|0|{|{}@0|@479000|385000|499000|405000|129000|107000|6791|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|464|0|1234|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|465|0|1237|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|466|0|1239|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|467|0|1241|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|468|0|1243|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|469|0|1246|0|{|{}@0|@477000|176000|497000|196000|139000|107000|6788|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|470|0|1248|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|471|0|1251|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|472|0|1253|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|473|0|1255|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|474|0|1257|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|475|0|1260|0|{|{}@0|@328000|62062|348000|82000|106000|89000|6768|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|476|0|1262|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|477|0|1265|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|478|0|1268|0|{|{}@0|@131000|387000|151000|407000|135000|107000|6731|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|479|0|1270|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|480|0|1273|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|481|0|1276|0|{Subgraph created from graph "kimbo"|{}@0|@516500|22000|535000|42000|822000|206000|6782|Testing|Kimbo Mundy||1|100|-1||9||32833|{0|}0|0|{0|}{0|}{0|}{0|}.3654080331325531|821000|206000|3|}}
{2010240003|XXGlegend|482|0|1278|0|{@{}@Expected Output:
adjacent\|\|>>\|same\|1900-01-02\|1900-01-05\|
dup_keys\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v2\|1900-01-04\|1900-01-05\|
overlap-mix\|\|>>\|same\|1900-01-02\|1900-01-05\|
overlap-mix\|\|>>\|diff\|1900-01-06\|1900-01-07\|
overlap-mix\|\|>>\|same\|1900-01-08\|1900-01-11\|
overlap-same\|\|>>\|same\|1900-01-02\|1900-01-05\||535000|25000|555000|45000|270000|144000|6782|}}
{2010242002|XXGface|483|0|1280|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|484|0|1282|0|{@{}@384|.5|.5|{8|400000|179000|420000|179000|427000|179000|448000|179000|}6778|17|}}
{2010210004|XXGflow|485|0|1284|0|{@{}@384|.5|.5|{8|107000|104000|127000|104000|151000|104000|172000|104000|}6763|17|}}
{2010501005|XXGpvertex|486|0|1286|0|{|{}@0|@17000|56000|37000|76000|60000|60000|6764|Create|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|487|0|1288|0|{@{}@96000|99000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|488|0|1291|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|489|0|1293|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|490|0|1295|0|{|{}@0|@379000|49500|401000|70000|56000|50000|6783|Dups|Ab Initio Software||1|10|0||6||32897|-1|-1|}}
{2010202004|XXGiport|491|0|1297|0|{@{}@424000|60000|11000|11000|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|492|0|1299|0|{|{}@0|@326000|151500|332000|161000|58000|41000|6779|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|493|0|1301|0|{@{}@389000|174000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|494|0|1304|0|{@{}@322000|174000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|495|0|1306|0|{|{}@0|@173000|73500|183000|83000|50000|41000|6752|Partition by Round-robin|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|496|0|1308|0|{@{}@232000|99000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|497|0|1310|0|{@{}@173000|99000|11000|11000|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|498|0|1313|0|{|{}@0|@437000|136000|459000|156000|56000|50000|6758|stdout|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|499|0|1315|0|{@{}@449000|174000|11000|11000|write|0.0|@@@1776|0|}}
{2010203004|XXGoport|500|0|1318|0|{@{}@525000|74000|11000|11000|out|.5|@@@14099|0|}}
{2010202004|XXGiport|501|0|1321|0|{@{}@834000|74000|11000|11000|in0|.5|@@@63762|0|}}
{2010202004|XXGiport|502|0|1324|0|{@{}@679000|32000|11000|11000|in1|.5|@@@12960|0|}}
{2010203004|XXGoport|503|0|1327|0|{@{}@488000|329000|11000|21000|out|.5|@@@14352|0|}}
{2010203004|XXGoport|504|0|1332|0|{@{}@404000|387000|11000|11000|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|505|0|1336|0|{@{}@321000|334000|11000|11000|in|.5|@@@14096|0|}}
{2010600005|XXGgraph|506|0|1340|0|{Subgraph created from graph "kimbo"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
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
{30001002|XXparameter|EFFECTIVE_DATE_DIRECTION|$[ CHECK_KEYS + if ( END_DATE_FIELD_NAME == "" ) "ascending" else "descending" ]|3|9|RK|The direction to sort the effective date field, if any.  This is based on whether we have an end date or not.|{0|}}
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
{30001002|XXparameter|mpcmodtime|1462805142|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@87336|104500|0|0|884000|534000|0|dedup_and_fix_intervals|||1|100|-1||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|884000|533000|3|}}
{2010240003|XXGlegend|507|0|1342|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|508|0|1344|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|509|0|1346|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|510|0|1348|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|511|0|1350|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|512|0|1352|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|513|0|1354|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6796|}}
{2010242002|XXGface|514|0|1356|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|515|0|1358|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|516|0|1360|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|517|0|1362|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6770|17|}}
{2010210004|XXGflow|518|0|1364|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6780|20|}}
{2010210004|XXGflow|519|0|1366|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6786|17|}}
{2010210004|XXGflow|520|0|1368|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6787|17|}}
{2010210004|XXGflow|521|0|1370|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6789|17|}}
{2010210004|XXGflow|522|0|1372|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6790|17|}}
{2010501005|XXGpvertex|523|0|1374|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$ADJUSTED_DEDUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
}}@0|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|524|0|1376|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|525|0|1379|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|526|0|1381|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|527|0|1383|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|528|0|1385|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|529|0|1387|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|530|0|1390|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
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
{2010203004|XXGoport|531|0|1392|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|532|0|1395|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|533|0|1398|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|534|0|1401|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|535|0|1404|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|536|0|1407|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|537|0|1410|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$PARTITION_KEY|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|2|Pf$|@{0|}}
}}@0|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|538|0|1412|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|539|0|1415|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|540|0|1417|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
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
{2010203004|XXGoport|541|0|1419|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|542|0|1422|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|543|0|1426|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|544|0|1428|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|545|0|1430|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|546|0|1433|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|547|0|1435|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|548|0|1438|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|549|0|1441|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key_method|False|3|1|l|@{0|}}
{30001002|XXparameter|transform|/* Find records with the same data values and abutting or overlapping effective dates. */
out :: key_change(in1, in2) =
begin
  out :1: ( in1.$END_DATE_FIELD_NAME < datetime_add(in2.$EFFECTIVE_DATE_FIELD_NAME, 0, 
                                                    microseconds = -($ADJACENT_INTERVAL_MICROSECONDS)) or  // 1) There is a gap, ...
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
{30001002|XXparameter|condition|$[ END_DATE_FIELD_NAME != "" ]|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
}}@0|@479000|385000|499000|405000|129000|107000|6791|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|550|0|1443|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|551|0|1446|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|552|0|1448|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|553|0|1450|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|554|0|1452|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|555|0|1455|0|{Generates data records that summarize groups of data records.  Rollup in memory maximizes performance by keeping intermediate results in main memory.  Rollup sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|556|0|1457|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|557|0|1460|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|558|0|1463|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|559|0|1466|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|560|0|1469|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|561|0|1472|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|/* Remember the current and previous effective dates. */
type temporary_type =
record
  $EFFECTIVE_DATE_TYPE cur_eff_dttm = NULL;
  $EFFECTIVE_DATE_TYPE prev_eff_dttm = NULL;
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
  out.cur_eff_dttm :: in.$EFFECTIVE_DATE_FIELD_NAME;
end;


/* Within a given Natural Key group, for overlapping dates, this sets the End Date/Time to the following Effective Date/Time, minus 1 second. 
This does *not* fill in gaps, however. */
out :: finalize(temp, in) =
begin
  // This works because records are sorted in descending order by Effective Date.
  out.$END_DATE_FIELD_NAME :1: if ( temp.prev_eff_dttm <= in.$END_DATE_FIELD_NAME )
    datetime_add(temp.prev_eff_dttm, 0, microseconds = -($ADJACENT_INTERVAL_MICROSECONDS));  // This is skipped for the first record in NK group.
  out.$END_DATE_FIELD_NAME :: in.$END_DATE_FIELD_NAME;  // So the first (latest) record keeps its original End Date.
  out.* :: in.*;
end;|3|9|j|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[ END_DATE_FIELD_NAME != "" ]|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Scan.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
}}@0|@477000|176000|497000|196000|139000|107000|6788|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|562|0|1474|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|563|0|1477|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|564|0|1479|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|565|0|1481|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|566|0|1483|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|567|0|1486|0|{Generates a series of cumulative summary records--such as year-to-date totals--for groups of data records.  Scan in memory maximizes performance by keeping intermediate results in main memory.  Scan sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?scan|3|1|Hl||{0|}}
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
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|568|0|1488|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|569|0|1491|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|570|0|1494|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|571|0|1497|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|572|0|1500|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|573|0|1503|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$ADJUSTED_DEDUP_SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
}}@0|@328000|62062|348000|82000|106000|89000|6768|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|574|0|1505|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|575|0|1508|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|576|0|1511|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|577|0|1513|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|578|0|1516|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|579|0|1519|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|major_key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{$EFFECTIVE_DATE_FIELD_NAME; $END_DATE_FIELD_NAME\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|allow_unsorted|True|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[ END_DATE_FIELD_NAME != "" ]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
}}@0|@131000|387000|151000|407000|135000|107000|6731|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|580|0|1521|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|581|0|1524|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|582|0|1527|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|583|0|1529|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|584|0|1532|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|585|0|1535|0|{Subgraph created from graph "kimbo"|{}@0|@516500|22000|535000|42000|822000|206000|6782|Testing|Kimbo Mundy||1|100|-1||9||32833|{0|}0|0|{0|}{0|}{0|}{0|}.3654080331325531|821000|206000|3|}}
{2010240003|XXGlegend|586|0|1537|0|{@{}@Expected Output:
adjacent\|\|>>\|same\|1900-01-02\|1900-01-05\|
dup_keys\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v2\|1900-01-04\|1900-01-05\|
overlap-mix\|\|>>\|same\|1900-01-02\|1900-01-05\|
overlap-mix\|\|>>\|diff\|1900-01-06\|1900-01-07\|
overlap-mix\|\|>>\|same\|1900-01-08\|1900-01-11\|
overlap-same\|\|>>\|same\|1900-01-02\|1900-01-05\||535000|25000|555000|45000|270000|144000|6782|}}
{2010242002|XXGface|587|0|1539|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|588|0|1541|0|{@{}@384|.5|.5|{8|400000|179000|420000|179000|427000|179000|448000|179000|}6778|17|}}
{2010210004|XXGflow|589|0|1543|0|{@{}@384|.5|.5|{8|107000|104000|127000|104000|151000|104000|172000|104000|}6763|17|}}
{2010501005|XXGpvertex|590|0|1545|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|num_records|13|3|2|$|@{0|}}
{30001002|XXparameter|transform|/* Returns a record from its arguments. */
out :: rec(key, value, eff_dt, end_dt) =
begin
  out :: [record
    nk1     key,
    nk2     "",
    value   value,
    eff_dt  eff_dt,
    end_dt  end_dt,
  ];
end;


/* Creates a new test record for each given index. */
out :: create(index) =
begin
  out :: switch ( index )
    case  1: rec("dup_keys", "v1", 1, 2);
    case  2: rec("dup_keys", "v2", 1, 2);
    case  3: rec("adjacent", "same", 1, 2);
    case  4: rec("adjacent", "same", 3, 4);
    case  5: rec("overlap-diff", "v1", 1, 4);
    case  6: rec("overlap-diff", "v2", 3, 4);
    case  7: rec("overlap-same", "same", 1, 4);
    case  8: rec("overlap-same", "same", 3, 4);
    case  9: rec("overlap-mix", "same", 1, 10);
    case 10: rec("overlap-mix", "same", 3, 9);
    case 11: rec("overlap-mix", "diff", 5, 8);
    case 12: rec("overlap-mix", "same", 7, 10);
    case 13: rec("overlap-mix", "same", 9, 10);
    default: force_error("Bad index");
  end;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record
  string("\|") nk1;
  string("\|>>\|") nk2;
  string("\|") value;
  date("YYYY-MM-DD")("\|") eff_dt;
  date("YYYY-MM-DD")("\|\\n") end_dt;
end|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
}}@0|@17000|56000|37000|76000|60000|60000|6764|Create|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|591|0|1547|0|{@{}@96000|99000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|592|0|1550|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|593|0|1552|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|594|0|1554|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|num_records.display_name|num-records|3|9|P|@{0|}}
{30001002|XXparameter|transform|out::create(index)=begin out :: random_value(); end;|8|1|FOl|DML function|{0|}}
{30001002|XXparameter|identical_records|False|13|1|FKl|Whether to evaluate the transform once only, or once for each record|{0|}}
{30001002|XXparameter|identical_records.display_name|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records.keyword|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records_display_values|Evaluatetransformanewforeachrecord Evaluatetransformonceandusethatvalueforallrecords|3|2|H$||{0|}}
{30001002|XXparameter|identical_records_display_values.display_name|identical-records-display-values|3|9|P|@{0|}}
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
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|1|1|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|continuous|False|13|1|RFOl|Whether to produce checkpoints or computepoints.|{0|}}
{30001002|XXparameter|checkpoint_interval|1|1|2|FO$|Number of records between checkpoints, or 0 to indicate that no checkpoints are to be generated.|{0|}}
{30001002|XXparameter|checkpoint_interval.display_name|checkpoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|checkpoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|computepoint_interval|0|1|2|FO$|Number of records between computepoints, or 0 to indicate that no computepoints are to be generated.|{0|}}
{30001002|XXparameter|computepoint_interval.display_name|computepoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|computepoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|do_timed_checkpoints|False|13|1|FKl|Generate checkpoints at timed intervals|{0|}}
{30001002|XXparameter|do_timed_checkpoints.display_name|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.keyword|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::create(unsigned long index)|3|2|H$|Function taking integer index counting 1,2,3,4... to produce records on the output.|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? subscriber :|3|2|H$||{0|}}
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
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|595|0|1556|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|596|0|1559|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|597|0|1562|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|598|0|1565|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/test.create/test.create.test1.dups.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/test.create/test.create.test1.dups.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@379000|49500|401000|70000|56000|50000|6783|Dups|Ab Initio Software||1|10|0||6||32897|-1|-1|}}
{2010202004|XXGiport|599|0|1567|0|{@{}@424000|60000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|600|0|1569|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|write_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1375403542|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|601|0|1571|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|602|0|1574|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$PARTITION_KEY|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
}}@0|@326000|151500|332000|161000|58000|41000|6779|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|603|0|1576|0|{@{}@389000|174000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|604|0|1579|0|{@{}@322000|174000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|605|0|1581|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|606|0|1583|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|607|0|1586|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|608|0|1589|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
}}@0|@173000|73500|183000|83000|50000|41000|6752|Partition by Round-robin|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|609|0|1591|0|{@{}@232000|99000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|610|0|1593|0|{@{}@173000|99000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|611|0|1596|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|612|0|1598|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|613|0|1601|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|614|0|1604|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:/~stdout|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/~stdout", "pdl") create_update 1 is_db 0]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@437000|136000|459000|156000|56000|50000|6758|stdout|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|615|0|1606|0|{@{}@449000|174000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|616|0|1609|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1375403542|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|617|0|1611|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010203004|XXGoport|618|0|1614|0|{@{}@525000|74000|11000|11000|out|.5|@@@14099|0|}}
{2010202004|XXGiport|619|0|1617|0|{@{}@834000|74000|11000|11000|in0|.5|@@@63762|0|}}
{2010202004|XXGiport|620|0|1620|0|{@{}@679000|32000|11000|11000|in1|.5|@@@12960|0|}}
{2010203004|XXGoport|621|0|1623|0|{@{}@0|0|0|0|out|.5|@@@14352|0|}}
{2010203004|XXGoport|622|0|1626|0|{@{}@0|0|0|0|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|623|0|1629|0|{@{}@0|0|0|0|in|.5|@@@14096|0|}}
{2010503005|XXGfvertex|624|0|1632|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|$DUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$DUP_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@472000|414500|494000|435000|56000|50000|9914|Dups|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|625|0|1634|0|{@{}@484000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|626|0|1637|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|627|0|1639|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|628|0|1643|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ LOOKUP_KEY == "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
}}@0|@642000|401500|652000|416000|50000|41000|9899|Gather|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|629|0|1645|0|{@{}@701000|429000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|630|0|1648|0|{@{}@642000|429000|11000|11000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|631|0|1651|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|632|0|1653|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|633|0|1656|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|634|0|1659|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
}}@0|@793000|351500|803000|366000|50000|41000|9904|Gather.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|635|0|1661|0|{@{}@852000|379000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|636|0|1663|0|{@{}@793000|374000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|637|0|1667|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|638|0|1669|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|639|0|1672|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|640|0|1675|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error2_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
}}@0|@57000|160500|77000|181000|135000|93000|9863|Map to Output|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|641|0|1677|0|{@{}@211000|194000|11000|11000|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|642|0|1680|0|{@{}@211000|224000|11000|11000|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|643|0|1683|0|{@{}@211000|254000|11000|11000|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|644|0|1686|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|645|0|1688|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|646|0|1690|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|647|0|1692|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|648|0|1694|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|649|0|1696|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|650|0|1698|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|651|0|1700|0|{@{}@67000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|652|0|1702|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520143|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out2_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|error2_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|653|0|1704|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|654|0|1708|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|655|0|1712|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform2||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|656|0|1716|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|657|0|1719|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|658|0|1722|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|659|0|1725|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|660|0|1728|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|661|0|1731|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|662|0|1734|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|663|0|1737|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|664|0|1740|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$LOOKUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ LOOKUP_KEY != "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
}}@0|@646000|298500|656000|313000|50000|41000|9901|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|665|0|1742|0|{@{}@705000|329000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|666|0|1745|0|{@{}@646000|329000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|667|0|1748|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{2010203004|XXGoport|668|0|1750|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|669|0|1753|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|670|0|1756|0|{@{}@0|0|0|0|source|.16666666666666666|@@@14352|0|}}
{2010203004|XXGoport|671|0|1759|0|{@{}@0|0|0|0|clean|.5|@@@14352|0|}}
{2010203004|XXGoport|672|0|1762|0|{@{}@0|0|0|0|lookup|.8333333333333333|@@@14736|0|}}
{2010202004|XXGiport|673|0|1765|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010110002|XXGconstant|674|0|1768|0|{@{}@{1|6376939|}}}
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
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_1|}1|13|}
{2010244001|XXGflow_watcher_watcher|13|0|26|0|{}13|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_10|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_11|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_14|}1|17|}
{2010244001|XXGflow_watcher_watcher|17|0|34|0|{}17|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_19|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_2|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_3|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_4|}1|22|}
{2010244001|XXGflow_watcher_watcher|22|0|44|0|{}22|23|}
{2010604001|XXGgraph_flow_flow|23|0|46|0|{Flow_5|}1|24|}
{2010604001|XXGgraph_flow_flow|24|0|48|0|{Flow_6|}1|25|}
{2010604001|XXGgraph_flow_flow|25|0|50|0|{Flow_7|}1|26|}
{2010604001|XXGgraph_flow_flow|26|0|52|0|{Flow_8|}1|27|}
{2010604001|XXGgraph_flow_flow|27|0|54|0|{Flow_9|}1|28|}
{2010601001|XXGgraph_vertex_vertex|28|0|56|0|{Add_Job_ID_Record_Count|}1|29|}
{2010212001|XXGvertex_oport_oport|29|0|58|0|{0|out|}29|30|}
{2010213001|XXGoport_dst_flow|30|0|60|0|{0|}30|13|}
{2010212001|XXGvertex_oport_oport|31|0|61|0|{1|reject|}29|31|}
{2010212001|XXGvertex_oport_oport|32|0|63|0|{2|error|}29|32|}
{2010212001|XXGvertex_oport_oport|33|0|65|0|{3|log|}29|33|}
{2010211001|XXGvertex_iport_iport|34|0|67|0|{0|in|}29|34|}
{2010214001|XXGiport_src_flow|35|0|69|0|{0|}34|15|}
{2010007001|XXGobject_proto_object|36|0|70|0|{}29|35|}
{2010212001|XXGvertex_oport_oport|37|0|72|0|{0|out|}35|36|}
{2010006001|XXGobject_psameas_object|38|0|74|0|{metadata|out_metadata|1|0|}36|35|}
{2010212001|XXGvertex_oport_oport|39|0|75|0|{1|reject|}35|37|}
{2010006001|XXGobject_psameas_object|40|0|77|0|{metadata|reject_metadata|1|0|}37|35|}
{2010212001|XXGvertex_oport_oport|41|0|78|0|{2|error|}35|38|}
{2010006001|XXGobject_psameas_object|42|0|80|0|{metadata|error_metadata|1|0|}38|35|}
{2010212001|XXGvertex_oport_oport|43|0|81|0|{3|log|}35|39|}
{2010006001|XXGobject_psameas_object|44|0|83|0|{metadata|log_metadata|1|0|}39|35|}
{2010211001|XXGvertex_iport_iport|45|0|84|0|{0|in|}35|40|}
{2010006001|XXGobject_psameas_object|46|0|86|0|{metadata|in_metadata|1|0|}40|35|}
{2010006001|XXGobject_psameas_object|47|0|87|0|{Layout|Layout|0|0|}29|41|}
{2010212001|XXGvertex_oport_oport|48|0|89|0|{0|source|}41|42|}
{2010213001|XXGoport_dst_flow|49|0|91|0|{0|}42|43|}
{2010212001|XXGvertex_oport_oport|50|0|93|0|{1|clean|}41|44|}
{2010213001|XXGoport_dst_flow|51|0|95|0|{0|}44|45|}
{2010212001|XXGvertex_oport_oport|52|0|97|0|{2|lkp|}41|46|}
{2010213001|XXGoport_dst_flow|53|0|99|0|{0|}46|47|}
{2010212001|XXGvertex_oport_oport|54|0|101|0|{3|reject0|}41|48|}
{2010212001|XXGvertex_oport_oport|55|0|103|0|{4|reject1|}41|49|}
{2010212001|XXGvertex_oport_oport|56|0|105|0|{5|reject2|}41|50|}
{2010212001|XXGvertex_oport_oport|57|0|107|0|{6|error0|}41|51|}
{2010212001|XXGvertex_oport_oport|58|0|109|0|{7|error1|}41|52|}
{2010212001|XXGvertex_oport_oport|59|0|111|0|{8|error2|}41|53|}
{2010212001|XXGvertex_oport_oport|60|0|113|0|{9|log|}41|54|}
{2010211001|XXGvertex_iport_iport|61|0|115|0|{0|in|}41|55|}
{2010006001|XXGobject_psameas_object|62|0|117|0|{in_metadata|out_metadata|0|0|}41|29|}
{2010006001|XXGobject_psameas_object|63|0|118|0|{out0_metadata|write_metadata|0|0|}41|56|}
{2010211001|XXGvertex_iport_iport|64|0|120|0|{0|write|}56|57|}
{2010214001|XXGiport_src_flow|65|0|122|0|{0|}57|20|}
{2010007001|XXGobject_proto_object|66|0|123|0|{}56|58|}
{2010211001|XXGvertex_iport_iport|67|0|125|0|{0|write|}58|59|}
{2010006001|XXGobject_psameas_object|68|0|127|0|{metadata|write_metadata|1|0|}59|58|}
{2010006001|XXGobject_psameas_object|69|0|128|0|{out1_metadata|write_metadata|0|0|}41|60|}
{2010211001|XXGvertex_iport_iport|70|0|130|0|{0|write|}60|61|}
{2010214001|XXGiport_src_flow|71|0|132|0|{0|}61|21|}
{2010007001|XXGobject_proto_object|72|0|133|0|{}60|62|}
{2010211001|XXGvertex_iport_iport|73|0|135|0|{0|write|}62|63|}
{2010006001|XXGobject_psameas_object|74|0|137|0|{metadata|write_metadata|1|0|}63|62|}
{2010006001|XXGobject_psameas_object|75|0|138|0|{out2_metadata|write_metadata|0|0|}41|64|}
{2010211001|XXGvertex_iport_iport|76|0|140|0|{0|write|}64|65|}
{2010214001|XXGiport_src_flow|77|0|142|0|{0|}65|66|}
{2010006001|XXGobject_psameas_object|78|0|144|0|{reject0_metadata|out_metadata|0|0|}41|29|}
{2010006001|XXGobject_psameas_object|79|0|145|0|{reject1_metadata|out_metadata|0|0|}41|29|}
{2010006001|XXGobject_psameas_object|80|0|146|0|{reject2_metadata|out_metadata|0|0|}41|29|}
{2010006001|XXGobject_psameas_object|81|0|147|0|{in_metadata|out0_metadata|0|0|}29|67|}
{2010212001|XXGvertex_oport_oport|82|0|149|0|{0|out0|}67|68|}
{2010213001|XXGoport_dst_flow|83|0|151|0|{0|}68|15|}
{2010212001|XXGvertex_oport_oport|84|0|152|0|{1|reject0|}67|69|}
{2010212001|XXGvertex_oport_oport|85|0|154|0|{2|error0|}67|70|}
{2010212001|XXGvertex_oport_oport|86|0|156|0|{3|log|}67|71|}
{2010211001|XXGvertex_iport_iport|87|0|158|0|{0|in|}67|72|}
{2010214001|XXGiport_src_flow|88|0|160|0|{0|}72|27|}
{2010007001|XXGobject_proto_object|89|0|161|0|{}67|73|}
{2010212001|XXGvertex_oport_oport|90|0|163|0|{0|out0|}73|74|}
{2010006001|XXGobject_psameas_object|91|0|165|0|{metadata|out0_metadata|1|0|}74|73|}
{2010006001|XXGobject_psameas_object|92|0|166|0|{transform0|transform0|1|0|}74|73|}
{2010212001|XXGvertex_oport_oport|93|0|167|0|{1|reject0|}73|75|}
{2010006001|XXGobject_psameas_object|94|0|169|0|{metadata|reject0_metadata|1|0|}75|73|}
{2010212001|XXGvertex_oport_oport|95|0|170|0|{2|error0|}73|76|}
{2010006001|XXGobject_psameas_object|96|0|172|0|{metadata|error0_metadata|1|0|}76|73|}
{2010212001|XXGvertex_oport_oport|97|0|173|0|{3|log|}73|77|}
{2010006001|XXGobject_psameas_object|98|0|175|0|{metadata|log_metadata|1|0|}77|73|}
{2010211001|XXGvertex_iport_iport|99|0|176|0|{0|in|}73|78|}
{2010006001|XXGobject_psameas_object|100|0|178|0|{metadata|in_metadata|1|0|}78|73|}
{2010006001|XXGobject_psameas_object|101|0|179|0|{Layout|Layout|0|0|}67|41|}
{2010006001|XXGobject_psameas_object|102|0|180|0|{in_metadata|out_metadata|0|0|}67|79|}
{2010212001|XXGvertex_oport_oport|103|0|182|0|{0|out|}79|80|}
{2010213001|XXGoport_dst_flow|104|0|184|0|{0|}80|28|}
{2010212001|XXGvertex_oport_oport|105|0|185|0|{1|filereject|}79|81|}
{2010212001|XXGvertex_oport_oport|106|0|187|0|{2|fileerror|}79|82|}
{2010212001|XXGvertex_oport_oport|107|0|189|0|{3|reject|}79|83|}
{2010212001|XXGvertex_oport_oport|108|0|191|0|{4|error|}79|84|}
{2010212001|XXGvertex_oport_oport|109|0|193|0|{5|log|}79|85|}
{2010213001|XXGoport_dst_flow|110|0|195|0|{0|}85|22|}
{2010211001|XXGvertex_iport_iport|111|0|196|0|{0|in|}79|86|}
{2010214001|XXGiport_src_flow|112|0|198|0|{0|}86|17|}
{2010007001|XXGobject_proto_object|113|0|199|0|{}79|87|}
{2010212001|XXGvertex_oport_oport|114|0|201|0|{0|out|}87|88|}
{2010006001|XXGobject_psameas_object|115|0|203|0|{metadata|out_metadata|1|0|}88|87|}
{2010212001|XXGvertex_oport_oport|116|0|204|0|{1|filereject|}87|89|}
{2010006001|XXGobject_psameas_object|117|0|206|0|{metadata|filereject_metadata|1|0|}89|87|}
{2010212001|XXGvertex_oport_oport|118|0|207|0|{2|fileerror|}87|90|}
{2010006001|XXGobject_psameas_object|119|0|209|0|{metadata|fileerror_metadata|1|0|}90|87|}
{2010212001|XXGvertex_oport_oport|120|0|210|0|{3|reject|}87|91|}
{2010006001|XXGobject_psameas_object|121|0|212|0|{metadata|reject_metadata|1|0|}91|87|}
{2010212001|XXGvertex_oport_oport|122|0|213|0|{4|error|}87|92|}
{2010006001|XXGobject_psameas_object|123|0|215|0|{metadata|error_metadata|1|0|}92|87|}
{2010212001|XXGvertex_oport_oport|124|0|216|0|{5|log|}87|93|}
{2010006001|XXGobject_psameas_object|125|0|218|0|{metadata|log_metadata|1|0|}93|87|}
{2010211001|XXGvertex_iport_iport|126|0|219|0|{0|in|}87|94|}
{2010006001|XXGobject_psameas_object|127|0|221|0|{metadata|in_metadata|1|0|}94|87|}
{2010006001|XXGobject_psameas_object|128|0|222|0|{Layout|Layout|0|0|}79|95|}
{2010211001|XXGvertex_iport_iport|129|0|224|0|{0|write|}95|96|}
{2010214001|XXGiport_src_flow|130|0|226|0|{0|}96|19|}
{2010007001|XXGobject_proto_object|131|0|227|0|{}95|97|}
{2010211001|XXGvertex_iport_iport|132|0|229|0|{0|write|}97|98|}
{2010006001|XXGobject_psameas_object|133|0|231|0|{metadata|write_metadata|1|0|}98|97|}
{2010006001|XXGobject_psameas_object|134|0|232|0|{compressed|DATA_FILE_COMPRESS_FLAG|1|0|}79|1|}
{2010006001|XXGobject_psameas_object|135|0|233|0|{filereject_metadata|out_metadata|0|0|}79|99|}
{2010212001|XXGvertex_oport_oport|136|0|235|0|{0|out|}99|100|}
{2010213001|XXGoport_dst_flow|137|0|237|0|{0|}100|17|}
{2010212001|XXGvertex_oport_oport|138|0|238|0|{1|error|}99|101|}
{2010212001|XXGvertex_oport_oport|139|0|240|0|{2|log|}99|102|}
{2010007001|XXGobject_proto_object|140|0|242|0|{}99|103|}
{2010212001|XXGvertex_oport_oport|141|0|244|0|{0|out|}103|104|}
{2010006001|XXGobject_psameas_object|142|0|246|0|{metadata|out_metadata|1|0|}104|103|}
{2010212001|XXGvertex_oport_oport|143|0|247|0|{1|error|}103|105|}
{2010006001|XXGobject_psameas_object|144|0|249|0|{metadata|error_metadata|1|0|}105|103|}
{2010212001|XXGvertex_oport_oport|145|0|250|0|{2|log|}103|106|}
{2010006001|XXGobject_psameas_object|146|0|252|0|{metadata|log_metadata|1|0|}106|103|}
{2010006001|XXGobject_psameas_object|147|0|253|0|{in_metadata|out_metadata|0|0|}79|99|}
{2010006001|XXGobject_psameas_object|148|0|254|0|{reject0_metadata|out_metadata|0|0|}67|79|}
{2010006001|XXGobject_psameas_object|149|0|255|0|{reject_metadata|out0_metadata|0|0|}29|67|}
{2010601001|XXGgraph_vertex_vertex|150|0|256|0|{Append_processed_CTL_file_to_list_AT_process_end_CTL_files_will_be_moved|}1|107|}
{2010212001|XXGvertex_oport_oport|151|0|258|0|{0|out|}107|108|}
{2010211001|XXGvertex_iport_iport|152|0|260|0|{0|in|}107|109|}
{2010007001|XXGobject_proto_object|153|0|262|0|{}107|110|}
{2010212001|XXGvertex_oport_oport|154|0|264|0|{0|out|}110|111|}
{2010006001|XXGobject_psameas_object|155|0|266|0|{metadata|out_metadata|1|0|}111|110|}
{2010211001|XXGvertex_iport_iport|156|0|267|0|{0|in|}110|112|}
{2010006001|XXGobject_psameas_object|157|0|269|0|{metadata|in_metadata|1|0|}112|110|}
{2010601001|XXGgraph_vertex_vertex|158|0|270|0|{Clean_Hex_Values|}1|67|}
{2010601001|XXGgraph_vertex_vertex|159|0|271|0|{Cons_LookUp|}1|113|}
{2010605001|XXGgraph_legend_legend|160|0|273|0|{0|}113|114|}
{2010241001|XXGlegend_face_face|161|0|275|0|{}114|115|}
{2010604001|XXGgraph_flow_flow|162|0|277|0|{Flow_1|}113|116|}
{2010604001|XXGgraph_flow_flow|163|0|279|0|{Flow_13|}113|117|}
{2010604001|XXGgraph_flow_flow|164|0|281|0|{Flow_2|}113|118|}
{2010604001|XXGgraph_flow_flow|165|0|283|0|{Flow_4|}113|119|}
{2010604001|XXGgraph_flow_flow|166|0|285|0|{Flow_5|}113|120|}
{2010604001|XXGgraph_flow_flow|167|0|287|0|{Flow_7|}113|121|}
{2010601001|XXGgraph_vertex_vertex|168|0|289|0|{Join_NK_|}113|122|}
{2010212001|XXGvertex_oport_oport|169|0|291|0|{0|out|}122|123|}
{2010213001|XXGoport_dst_flow|170|0|293|0|{0|}123|116|}
{2010212001|XXGvertex_oport_oport|171|0|294|0|{1|unused0|}122|124|}
{2010212001|XXGvertex_oport_oport|172|0|296|0|{2|unused1|}122|125|}
{2010212001|XXGvertex_oport_oport|173|0|298|0|{3|reject0|}122|126|}
{2010212001|XXGvertex_oport_oport|174|0|300|0|{4|reject1|}122|127|}
{2010212001|XXGvertex_oport_oport|175|0|302|0|{5|error0|}122|128|}
{2010212001|XXGvertex_oport_oport|176|0|304|0|{6|error1|}122|129|}
{2010212001|XXGvertex_oport_oport|177|0|306|0|{7|log|}122|130|}
{2010211001|XXGvertex_iport_iport|178|0|308|0|{0|in0|}122|131|}
{2010214001|XXGiport_src_flow|179|0|310|0|{0|}131|119|}
{2010211001|XXGvertex_iport_iport|180|0|311|0|{1|in1|}122|132|}
{2010214001|XXGiport_src_flow|181|0|313|0|{0|}132|121|}
{2010007001|XXGobject_proto_object|182|0|314|0|{}122|133|}
{2010212001|XXGvertex_oport_oport|183|0|316|0|{0|out|}133|134|}
{2010006001|XXGobject_psameas_object|184|0|318|0|{metadata|out_metadata|1|0|}134|133|}
{2010212001|XXGvertex_oport_oport|185|0|319|0|{1|unused0|}133|135|}
{2010006001|XXGobject_psameas_object|186|0|321|0|{metadata|unused0_metadata|1|0|}135|133|}
{2010212001|XXGvertex_oport_oport|187|0|322|0|{2|unused1|}133|136|}
{2010006001|XXGobject_psameas_object|188|0|324|0|{metadata|unused1_metadata|1|0|}136|133|}
{2010212001|XXGvertex_oport_oport|189|0|325|0|{3|reject0|}133|137|}
{2010006001|XXGobject_psameas_object|190|0|327|0|{metadata|reject0_metadata|1|0|}137|133|}
{2010212001|XXGvertex_oport_oport|191|0|328|0|{4|reject1|}133|138|}
{2010006001|XXGobject_psameas_object|192|0|330|0|{metadata|reject1_metadata|1|0|}138|133|}
{2010212001|XXGvertex_oport_oport|193|0|331|0|{5|error0|}133|139|}
{2010006001|XXGobject_psameas_object|194|0|333|0|{metadata|error0_metadata|1|0|}139|133|}
{2010212001|XXGvertex_oport_oport|195|0|334|0|{6|error1|}133|140|}
{2010006001|XXGobject_psameas_object|196|0|336|0|{metadata|error1_metadata|1|0|}140|133|}
{2010212001|XXGvertex_oport_oport|197|0|337|0|{7|log|}133|141|}
{2010006001|XXGobject_psameas_object|198|0|339|0|{metadata|log_metadata|1|0|}141|133|}
{2010211001|XXGvertex_iport_iport|199|0|340|0|{0|in0|}133|142|}
{2010006001|XXGobject_psameas_object|200|0|342|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|1|0|}142|133|}
{2010006001|XXGobject_psameas_object|201|0|343|0|{dedup0|dedup0|1|0|}142|133|}
{2010006001|XXGobject_psameas_object|202|0|344|0|{dedup_keyword0|dedup_keyword0|1|0|}142|133|}
{2010006001|XXGobject_psameas_object|203|0|345|0|{dedup_positional0|dedup_positional0|1|0|}142|133|}
{2010006001|XXGobject_psameas_object|204|0|346|0|{matchoptional_keyword0|matchoptional_keyword0|1|0|}142|133|}
{2010006001|XXGobject_psameas_object|205|0|347|0|{matchoptional_positional0|matchoptional_positional0|1|0|}142|133|}
{2010006001|XXGobject_psameas_object|206|0|348|0|{metadata|in0_metadata|1|0|}142|133|}
{2010006001|XXGobject_psameas_object|207|0|349|0|{override_key0|override_key0|1|0|}142|133|}
{2010006001|XXGobject_psameas_object|208|0|350|0|{record_match_required0|record_match_required0|1|0|}142|133|}
{2010006001|XXGobject_psameas_object|209|0|351|0|{record_match_required_not0|record_match_required_not0|1|0|}142|133|}
{2010006001|XXGobject_psameas_object|210|0|352|0|{record_required0|record_required0|1|0|}142|133|}
{2010006001|XXGobject_psameas_object|211|0|353|0|{record_required_keyword0|record_required_keyword0|1|0|}142|133|}
{2010006001|XXGobject_psameas_object|212|0|354|0|{record_required_positional0|record_required_positional0|1|0|}142|133|}
{2010006001|XXGobject_psameas_object|213|0|355|0|{select0|select0|1|0|}142|133|}
{2010006001|XXGobject_psameas_object|214|0|356|0|{select_keyword0|select_keyword0|1|0|}142|133|}
{2010006001|XXGobject_psameas_object|215|0|357|0|{select_positional0|select_positional0|1|0|}142|133|}
{2010211001|XXGvertex_iport_iport|216|0|358|0|{1|in1|}133|143|}
{2010006001|XXGobject_psameas_object|217|0|360|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|1|0|}143|133|}
{2010006001|XXGobject_psameas_object|218|0|361|0|{dedup1|dedup1|1|0|}143|133|}
{2010006001|XXGobject_psameas_object|219|0|362|0|{dedup_keyword1|dedup_keyword1|1|0|}143|133|}
{2010006001|XXGobject_psameas_object|220|0|363|0|{dedup_positional1|dedup_positional1|1|0|}143|133|}
{2010006001|XXGobject_psameas_object|221|0|364|0|{matchoptional_keyword1|matchoptional_keyword1|1|0|}143|133|}
{2010006001|XXGobject_psameas_object|222|0|365|0|{matchoptional_positional1|matchoptional_positional1|1|0|}143|133|}
{2010006001|XXGobject_psameas_object|223|0|366|0|{metadata|in1_metadata|1|0|}143|133|}
{2010006001|XXGobject_psameas_object|224|0|367|0|{override_key1|override_key1|1|0|}143|133|}
{2010006001|XXGobject_psameas_object|225|0|368|0|{record_match_required1|record_match_required1|1|0|}143|133|}
{2010006001|XXGobject_psameas_object|226|0|369|0|{record_match_required_not1|record_match_required_not1|1|0|}143|133|}
{2010006001|XXGobject_psameas_object|227|0|370|0|{record_required1|record_required1|1|0|}143|133|}
{2010006001|XXGobject_psameas_object|228|0|371|0|{record_required_keyword1|record_required_keyword1|1|0|}143|133|}
{2010006001|XXGobject_psameas_object|229|0|372|0|{record_required_positional1|record_required_positional1|1|0|}143|133|}
{2010006001|XXGobject_psameas_object|230|0|373|0|{select1|select1|1|0|}143|133|}
{2010006001|XXGobject_psameas_object|231|0|374|0|{select_keyword1|select_keyword1|1|0|}143|133|}
{2010006001|XXGobject_psameas_object|232|0|375|0|{select_positional1|select_positional1|1|0|}143|133|}
{2010006001|XXGobject_psameas_object|233|0|376|0|{Layout|Layout|0|0|}122|144|}
{2010211001|XXGvertex_iport_iport|234|0|378|0|{0|write|}144|145|}
{2010214001|XXGiport_src_flow|235|0|380|0|{0|}145|117|}
{2010007001|XXGobject_proto_object|236|0|381|0|{}144|146|}
{2010211001|XXGvertex_iport_iport|237|0|383|0|{0|write|}146|147|}
{2010006001|XXGobject_psameas_object|238|0|385|0|{metadata|write_metadata|1|0|}147|146|}
{2010006001|XXGobject_psameas_object|239|0|386|0|{in0_metadata|write_metadata|0|0|}122|144|}
{2010006001|XXGobject_psameas_object|240|0|387|0|{in1_metadata|read_metadata|0|0|}122|148|}
{2010212001|XXGvertex_oport_oport|241|0|389|0|{0|read|}148|149|}
{2010213001|XXGoport_dst_flow|242|0|391|0|{0|}149|120|}
{2010007001|XXGobject_proto_object|243|0|392|0|{}148|150|}
{2010212001|XXGvertex_oport_oport|244|0|394|0|{0|read|}150|151|}
{2010006001|XXGobject_psameas_object|245|0|396|0|{metadata|read_metadata|1|0|}151|150|}
{2010006001|XXGobject_psameas_object|246|0|397|0|{out_metadata|write_metadata|0|0|}122|144|}
{2010006001|XXGobject_psameas_object|247|0|398|0|{reject0_metadata|write_metadata|0|0|}122|144|}
{2010006001|XXGobject_psameas_object|248|0|399|0|{reject1_metadata|read_metadata|0|0|}122|148|}
{2010006001|XXGobject_psameas_object|249|0|400|0|{unused0_metadata|write_metadata|0|0|}122|144|}
{2010006001|XXGobject_psameas_object|250|0|401|0|{unused1_metadata|read_metadata|0|0|}122|148|}
{2010601001|XXGgraph_vertex_vertex|251|0|402|0|{Merge|}113|152|}
{2010212001|XXGvertex_oport_oport|252|0|404|0|{0|out|}152|153|}
{2010211001|XXGvertex_iport_iport|253|0|406|0|{0|in|}152|154|}
{2010214001|XXGiport_src_flow|254|0|408|0|{0|}154|118|}
{2010007001|XXGobject_proto_object|255|0|409|0|{}152|155|}
{2010212001|XXGvertex_oport_oport|256|0|411|0|{0|out|}155|156|}
{2010006001|XXGobject_psameas_object|257|0|413|0|{metadata|out_metadata|1|0|}156|155|}
{2010211001|XXGvertex_iport_iport|258|0|414|0|{0|in|}155|157|}
{2010006001|XXGobject_psameas_object|259|0|416|0|{metadata|in_metadata|1|0|}157|155|}
{2010006001|XXGobject_psameas_object|260|0|417|0|{Layout|Layout|0|0|}152|158|}
{2010211001|XXGvertex_iport_iport|261|0|419|0|{0|write|}158|159|}
{2010214001|XXGiport_src_flow|262|0|421|0|{0|}159|25|}
{2010007001|XXGobject_proto_object|263|0|422|0|{}158|160|}
{2010211001|XXGvertex_iport_iport|264|0|424|0|{0|write|}160|161|}
{2010006001|XXGobject_psameas_object|265|0|426|0|{metadata|write_metadata|1|0|}161|160|}
{2010006001|XXGobject_psameas_object|266|0|427|0|{write_metadata|write_metadata|0|0|}158|144|}
{2010006001|XXGobject_psameas_object|267|0|428|0|{in_metadata|write_metadata|0|0|}152|144|}
{2010006001|XXGobject_psameas_object|268|0|429|0|{out_metadata|write_metadata|0|0|}152|144|}
{2010601001|XXGgraph_vertex_vertex|269|0|430|0|{PBKS_NK_|}113|162|}
{2010604001|XXGgraph_flow_flow|270|0|432|0|{Flow_1|}162|163|}
{2010601001|XXGgraph_vertex_vertex|271|0|434|0|{Partition_by_Key|}162|164|}
{2010212001|XXGvertex_oport_oport|272|0|436|0|{0|out|}164|165|}
{2010213001|XXGoport_dst_flow|273|0|438|0|{0|}165|163|}
{2010211001|XXGvertex_iport_iport|274|0|439|0|{0|in|}164|166|}
{2010006001|XXGobject_psameas_object|275|0|441|0|{in_metadata|read_metadata|0|0|}164|148|}
{2010006001|XXGobject_psameas_object|276|0|442|0|{out_metadata|read_metadata|0|0|}164|148|}
{2010601001|XXGgraph_vertex_vertex|277|0|443|0|{Sort|}162|167|}
{2010212001|XXGvertex_oport_oport|278|0|445|0|{0|out|}167|168|}
{2010211001|XXGvertex_iport_iport|279|0|447|0|{0|in|}167|169|}
{2010214001|XXGiport_src_flow|280|0|449|0|{0|}169|163|}
{2010006001|XXGobject_psameas_object|281|0|450|0|{in_metadata|read_metadata|0|0|}167|148|}
{2010006001|XXGobject_psameas_object|282|0|451|0|{out_metadata|read_metadata|0|0|}167|148|}
{2010212001|XXGvertex_oport_oport|283|0|452|0|{0|out0|}162|170|}
{2010216002|XXGoport_binding_oport|284|0|454|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}170|168|}
{2010213001|XXGoport_dst_flow|285|0|455|0|{0|}170|121|}
{2010211001|XXGvertex_iport_iport|286|0|456|0|{0|in0|}162|171|}
{2010215002|XXGiport_binding_iport|287|0|458|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}171|166|}
{2010214001|XXGiport_src_flow|288|0|459|0|{0|}171|120|}
{2010007001|XXGobject_proto_object|289|0|460|0|{}162|172|}
{2010604001|XXGgraph_flow_flow|290|0|462|0|{Flow_1|}172|173|}
{2010601001|XXGgraph_vertex_vertex|291|0|464|0|{Partition_by_Key|}172|174|}
{2010212001|XXGvertex_oport_oport|292|0|466|0|{0|out|}174|175|}
{2010213001|XXGoport_dst_flow|293|0|468|0|{0|}175|173|}
{2010211001|XXGvertex_iport_iport|294|0|469|0|{0|in|}174|176|}
{2010007001|XXGobject_proto_object|295|0|471|0|{}174|177|}
{2010212001|XXGvertex_oport_oport|296|0|473|0|{0|out|}177|178|}
{2010006001|XXGobject_psameas_object|297|0|475|0|{metadata|out_metadata|1|0|}178|177|}
{2010211001|XXGvertex_iport_iport|298|0|476|0|{0|in|}177|179|}
{2010006001|XXGobject_psameas_object|299|0|478|0|{metadata|in_metadata|1|0|}179|177|}
{2010006001|XXGobject_psameas_object|300|0|479|0|{Layout|InputLayout|1|0|}174|172|}
{2010006001|XXGobject_psameas_object|301|0|480|0|{key|Key|1|0|}174|172|}
{2010601001|XXGgraph_vertex_vertex|302|0|481|0|{Sort|}172|180|}
{2010212001|XXGvertex_oport_oport|303|0|483|0|{0|out|}180|181|}
{2010211001|XXGvertex_iport_iport|304|0|485|0|{0|in|}180|182|}
{2010214001|XXGiport_src_flow|305|0|487|0|{0|}182|173|}
{2010007001|XXGobject_proto_object|306|0|488|0|{}180|183|}
{2010212001|XXGvertex_oport_oport|307|0|490|0|{0|out|}183|184|}
{2010006001|XXGobject_psameas_object|308|0|492|0|{metadata|out_metadata|1|0|}184|183|}
{2010211001|XXGvertex_iport_iport|309|0|493|0|{0|in|}183|185|}
{2010006001|XXGobject_psameas_object|310|0|495|0|{metadata|in_metadata|1|0|}185|183|}
{2010006001|XXGobject_psameas_object|311|0|496|0|{Layout|OutputLayout|1|0|}180|172|}
{2010006001|XXGobject_psameas_object|312|0|497|0|{key|Key|1|0|}180|172|}
{2010006001|XXGobject_psameas_object|313|0|498|0|{max_core|Max_core|1|0|}180|172|}
{2010212001|XXGvertex_oport_oport|314|0|499|0|{0|out0|}172|186|}
{2010216002|XXGoport_binding_oport|315|0|501|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}186|181|}
{2010211001|XXGvertex_iport_iport|316|0|502|0|{0|in0|}172|187|}
{2010215002|XXGiport_binding_iport|317|0|504|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}187|176|}
{2010006001|XXGobject_psameas_object|318|0|505|0|{InputLayout|Layout|0|0|}162|148|}
{2010006001|XXGobject_psameas_object|319|0|506|0|{OutputLayout|Layout|0|0|}162|144|}
{2010601001|XXGgraph_vertex_vertex|320|0|507|0|{PBKS_on_NK_|}113|188|}
{2010604001|XXGgraph_flow_flow|321|0|509|0|{Flow_1|}188|189|}
{2010601001|XXGgraph_vertex_vertex|322|0|511|0|{Partition_by_Key|}188|190|}
{2010212001|XXGvertex_oport_oport|323|0|513|0|{0|out|}190|191|}
{2010213001|XXGoport_dst_flow|324|0|515|0|{0|}191|189|}
{2010211001|XXGvertex_iport_iport|325|0|516|0|{0|in|}190|192|}
{2010006001|XXGobject_psameas_object|326|0|518|0|{in_metadata|write_metadata|0|0|}190|193|}
{2010211001|XXGvertex_iport_iport|327|0|520|0|{0|write|}193|194|}
{2010214001|XXGiport_src_flow|328|0|522|0|{0|}194|16|}
{2010007001|XXGobject_proto_object|329|0|523|0|{}193|195|}
{2010211001|XXGvertex_iport_iport|330|0|525|0|{0|write|}195|196|}
{2010006001|XXGobject_psameas_object|331|0|527|0|{metadata|write_metadata|1|0|}196|195|}
{2010006001|XXGobject_psameas_object|332|0|528|0|{out_metadata|write_metadata|0|0|}190|193|}
{2010601001|XXGgraph_vertex_vertex|333|0|529|0|{Sort|}188|197|}
{2010212001|XXGvertex_oport_oport|334|0|531|0|{0|out|}197|198|}
{2010211001|XXGvertex_iport_iport|335|0|533|0|{0|in|}197|199|}
{2010214001|XXGiport_src_flow|336|0|535|0|{0|}199|189|}
{2010006001|XXGobject_psameas_object|337|0|536|0|{in_metadata|write_metadata|0|0|}197|193|}
{2010006001|XXGobject_psameas_object|338|0|537|0|{out_metadata|write_metadata|0|0|}197|193|}
{2010212001|XXGvertex_oport_oport|339|0|538|0|{0|out0|}188|200|}
{2010216002|XXGoport_binding_oport|340|0|540|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}200|198|}
{2010213001|XXGoport_dst_flow|341|0|541|0|{0|}200|119|}
{2010211001|XXGvertex_iport_iport|342|0|542|0|{0|in0|}188|201|}
{2010215002|XXGiport_binding_iport|343|0|544|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}201|192|}
{2010007001|XXGobject_proto_object|344|0|545|0|{}188|202|}
{2010604001|XXGgraph_flow_flow|345|0|547|0|{Flow_1|}202|203|}
{2010601001|XXGgraph_vertex_vertex|346|0|549|0|{Partition_by_Key|}202|204|}
{2010212001|XXGvertex_oport_oport|347|0|551|0|{0|out|}204|205|}
{2010213001|XXGoport_dst_flow|348|0|553|0|{0|}205|203|}
{2010211001|XXGvertex_iport_iport|349|0|554|0|{0|in|}204|206|}
{2010007001|XXGobject_proto_object|350|0|556|0|{}204|207|}
{2010212001|XXGvertex_oport_oport|351|0|558|0|{0|out|}207|208|}
{2010006001|XXGobject_psameas_object|352|0|560|0|{metadata|out_metadata|1|0|}208|207|}
{2010211001|XXGvertex_iport_iport|353|0|561|0|{0|in|}207|209|}
{2010006001|XXGobject_psameas_object|354|0|563|0|{metadata|in_metadata|1|0|}209|207|}
{2010006001|XXGobject_psameas_object|355|0|564|0|{Layout|InputLayout|1|0|}204|202|}
{2010006001|XXGobject_psameas_object|356|0|565|0|{key|Key|1|0|}204|202|}
{2010601001|XXGgraph_vertex_vertex|357|0|566|0|{Sort|}202|210|}
{2010212001|XXGvertex_oport_oport|358|0|568|0|{0|out|}210|211|}
{2010211001|XXGvertex_iport_iport|359|0|570|0|{0|in|}210|212|}
{2010214001|XXGiport_src_flow|360|0|572|0|{0|}212|203|}
{2010007001|XXGobject_proto_object|361|0|573|0|{}210|213|}
{2010212001|XXGvertex_oport_oport|362|0|575|0|{0|out|}213|214|}
{2010006001|XXGobject_psameas_object|363|0|577|0|{metadata|out_metadata|1|0|}214|213|}
{2010211001|XXGvertex_iport_iport|364|0|578|0|{0|in|}213|215|}
{2010006001|XXGobject_psameas_object|365|0|580|0|{metadata|in_metadata|1|0|}215|213|}
{2010006001|XXGobject_psameas_object|366|0|581|0|{Layout|OutputLayout|1|0|}210|202|}
{2010006001|XXGobject_psameas_object|367|0|582|0|{key|Key|1|0|}210|202|}
{2010006001|XXGobject_psameas_object|368|0|583|0|{max_core|Max_core|1|0|}210|202|}
{2010212001|XXGvertex_oport_oport|369|0|584|0|{0|out0|}202|216|}
{2010216002|XXGoport_binding_oport|370|0|586|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}216|211|}
{2010211001|XXGvertex_iport_iport|371|0|587|0|{0|in0|}202|217|}
{2010215002|XXGiport_binding_iport|372|0|589|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}217|206|}
{2010006001|XXGobject_psameas_object|373|0|590|0|{InputLayout|Layout|0|0|}188|218|}
{2010212001|XXGvertex_oport_oport|374|0|592|0|{0|out|}218|219|}
{2010213001|XXGoport_dst_flow|375|0|594|0|{0|}219|26|}
{2010213001|XXGoport_dst_flow|376|0|595|0|{1|}219|16|}
{2010211001|XXGvertex_iport_iport|377|0|596|0|{0|in|}218|220|}
{2010214001|XXGiport_src_flow|378|0|598|0|{0|}220|24|}
{2010007001|XXGobject_proto_object|379|0|599|0|{}218|221|}
{2010212001|XXGvertex_oport_oport|380|0|601|0|{0|out|}221|222|}
{2010006001|XXGobject_psameas_object|381|0|603|0|{metadata|out_metadata|1|0|}222|221|}
{2010211001|XXGvertex_iport_iport|382|0|604|0|{0|in|}221|223|}
{2010006001|XXGobject_psameas_object|383|0|606|0|{metadata|in_metadata|1|0|}223|221|}
{2010006001|XXGobject_psameas_object|384|0|607|0|{in_metadata|write_metadata|0|0|}218|193|}
{2010006001|XXGobject_psameas_object|385|0|608|0|{out_metadata|write_metadata|0|0|}218|193|}
{2010006001|XXGobject_psameas_object|386|0|609|0|{OutputLayout|Layout|0|0|}188|144|}
{2010601001|XXGgraph_vertex_vertex|387|0|610|0|{RAW_MFS_File|}113|148|}
{2010601001|XXGgraph_vertex_vertex|388|0|611|0|{Replicate|}113|224|}
{2010212001|XXGvertex_oport_oport|389|0|613|0|{0|out|}224|225|}
{2010213001|XXGoport_dst_flow|390|0|615|0|{0|}225|117|}
{2010213001|XXGoport_dst_flow|391|0|616|0|{1|}225|118|}
{2010211001|XXGvertex_iport_iport|392|0|617|0|{0|in|}224|226|}
{2010214001|XXGiport_src_flow|393|0|619|0|{0|}226|116|}
{2010007001|XXGobject_proto_object|394|0|620|0|{}224|227|}
{2010212001|XXGvertex_oport_oport|395|0|622|0|{0|out|}227|228|}
{2010006001|XXGobject_psameas_object|396|0|624|0|{metadata|out_metadata|1|0|}228|227|}
{2010211001|XXGvertex_iport_iport|397|0|625|0|{0|in|}227|229|}
{2010006001|XXGobject_psameas_object|398|0|627|0|{metadata|in_metadata|1|0|}229|227|}
{2010006001|XXGobject_psameas_object|399|0|628|0|{Layout|Layout|0|0|}224|144|}
{2010006001|XXGobject_psameas_object|400|0|629|0|{in_metadata|write_metadata|0|0|}224|144|}
{2010006001|XXGobject_psameas_object|401|0|630|0|{out_metadata|write_metadata|0|0|}224|144|}
{2010601001|XXGgraph_vertex_vertex|402|0|631|0|{Temp_RAW_MFS_File|}113|144|}
{2010212001|XXGvertex_oport_oport|403|0|632|0|{0|out1|}113|230|}
{2010216002|XXGoport_binding_oport|404|0|634|0|{.5|.5|{0|}14556|}230|153|}
{2010213001|XXGoport_dst_flow|405|0|635|0|{0|}230|25|}
{2010211001|XXGvertex_iport_iport|406|0|636|0|{0|in0|}113|231|}
{2010215002|XXGiport_binding_iport|407|0|638|0|{.5|.5|{0|}14555|}231|201|}
{2010214001|XXGiport_src_flow|408|0|639|0|{0|}231|26|}
{2010601001|XXGgraph_vertex_vertex|409|0|640|0|{Create_zero_byte_Source_Clean_Lookup_if_no_files_to_process_|}1|232|}
{2010212001|XXGvertex_oport_oport|410|0|642|0|{0|out|}232|233|}
{2010211001|XXGvertex_iport_iport|411|0|644|0|{0|in|}232|234|}
{2010007001|XXGobject_proto_object|412|0|646|0|{}232|235|}
{2010212001|XXGvertex_oport_oport|413|0|648|0|{0|out|}235|236|}
{2010006001|XXGobject_psameas_object|414|0|650|0|{metadata|out_metadata|1|0|}236|235|}
{2010211001|XXGvertex_iport_iport|415|0|651|0|{0|in|}235|237|}
{2010006001|XXGobject_psameas_object|416|0|653|0|{metadata|in_metadata|1|0|}237|235|}
{2010601001|XXGgraph_vertex_vertex|417|0|654|0|{Get_Job_Log_Formatted_|}1|95|}
{2010601001|XXGgraph_vertex_vertex|418|0|655|0|{List_files|}1|99|}
{2010601001|XXGgraph_vertex_vertex|419|0|656|0|{Optional_Clean|}1|60|}
{2010601001|XXGgraph_vertex_vertex|420|0|657|0|{Optional_Cons_Lookup|}1|158|}
{2010601001|XXGgraph_vertex_vertex|421|0|658|0|{Optional_Lookup|}1|193|}
{2010601001|XXGgraph_vertex_vertex|422|0|659|0|{Optional_Source|}1|56|}
{2010601001|XXGgraph_vertex_vertex|423|0|660|0|{PBRR|}1|238|}
{2010212001|XXGvertex_oport_oport|424|0|662|0|{0|out|}238|239|}
{2010213001|XXGoport_dst_flow|425|0|664|0|{0|}239|27|}
{2010211001|XXGvertex_iport_iport|426|0|665|0|{0|in|}238|240|}
{2010214001|XXGiport_src_flow|427|0|667|0|{0|}240|28|}
{2010007001|XXGobject_proto_object|428|0|668|0|{}238|241|}
{2010212001|XXGvertex_oport_oport|429|0|670|0|{0|out|}241|242|}
{2010006001|XXGobject_psameas_object|430|0|672|0|{metadata|out_metadata|1|0|}242|241|}
{2010211001|XXGvertex_iport_iport|431|0|673|0|{0|in|}241|243|}
{2010006001|XXGobject_psameas_object|432|0|675|0|{metadata|in_metadata|1|0|}243|241|}
{2010006001|XXGobject_psameas_object|433|0|676|0|{Layout|Layout|0|0|}238|95|}
{2010006001|XXGobject_psameas_object|434|0|677|0|{in_metadata|out_metadata|0|0|}238|79|}
{2010006001|XXGobject_psameas_object|435|0|678|0|{out_metadata|out_metadata|0|0|}238|79|}
{2010601001|XXGgraph_vertex_vertex|436|0|679|0|{Parse_Log_and_Validate_Count_s_|}1|244|}
{2010212001|XXGvertex_oport_oport|437|0|681|0|{0|out0|}244|245|}
{2010213001|XXGoport_dst_flow|438|0|683|0|{0|}245|19|}
{2010212001|XXGvertex_oport_oport|439|0|684|0|{1|reject0|}244|246|}
{2010212001|XXGvertex_oport_oport|440|0|686|0|{2|error0|}244|247|}
{2010212001|XXGvertex_oport_oport|441|0|688|0|{3|log|}244|248|}
{2010211001|XXGvertex_iport_iport|442|0|690|0|{0|in|}244|249|}
{2010214001|XXGiport_src_flow|443|0|692|0|{0|}249|22|}
{2010007001|XXGobject_proto_object|444|0|693|0|{}244|250|}
{2010212001|XXGvertex_oport_oport|445|0|695|0|{0|out0|}250|251|}
{2010006001|XXGobject_psameas_object|446|0|697|0|{metadata|out0_metadata|1|0|}251|250|}
{2010006001|XXGobject_psameas_object|447|0|698|0|{transform0|transform0|1|0|}251|250|}
{2010212001|XXGvertex_oport_oport|448|0|699|0|{1|reject0|}250|252|}
{2010006001|XXGobject_psameas_object|449|0|701|0|{metadata|reject0_metadata|1|0|}252|250|}
{2010212001|XXGvertex_oport_oport|450|0|702|0|{2|error0|}250|253|}
{2010006001|XXGobject_psameas_object|451|0|704|0|{metadata|error0_metadata|1|0|}253|250|}
{2010212001|XXGvertex_oport_oport|452|0|705|0|{3|log|}250|254|}
{2010006001|XXGobject_psameas_object|453|0|707|0|{metadata|log_metadata|1|0|}254|250|}
{2010211001|XXGvertex_iport_iport|454|0|708|0|{0|in|}250|255|}
{2010006001|XXGobject_psameas_object|455|0|710|0|{metadata|in_metadata|1|0|}255|250|}
{2010006001|XXGobject_psameas_object|456|0|711|0|{Layout|Layout|0|0|}244|95|}
{2010006001|XXGobject_psameas_object|457|0|712|0|{in_metadata|log_metadata|0|0|}244|79|}
{2010006001|XXGobject_psameas_object|458|0|713|0|{out0_metadata|write_metadata|0|0|}244|95|}
{2010006001|XXGobject_psameas_object|459|0|714|0|{reject0_metadata|log_metadata|0|0|}244|79|}
{2010601001|XXGgraph_vertex_vertex|460|0|715|0|{Read_Multiple_Files|}1|79|}
{2010601001|XXGgraph_vertex_vertex|461|0|716|0|{Replicate_1|}1|218|}
{2010601001|XXGgraph_vertex_vertex|462|0|717|0|{Update_Watermark_Timestamp|}1|256|}
{2010212001|XXGvertex_oport_oport|463|0|719|0|{0|out|}256|257|}
{2010211001|XXGvertex_iport_iport|464|0|721|0|{0|in|}256|258|}
{2010007001|XXGobject_proto_object|465|0|723|0|{}256|259|}
{2010212001|XXGvertex_oport_oport|466|0|725|0|{0|out|}259|260|}
{2010006001|XXGobject_psameas_object|467|0|727|0|{metadata|out_metadata|1|0|}260|259|}
{2010211001|XXGvertex_iport_iport|468|0|728|0|{0|in|}259|261|}
{2010006001|XXGobject_psameas_object|469|0|730|0|{metadata|in_metadata|1|0|}261|259|}
{2010601001|XXGgraph_vertex_vertex|470|0|731|0|{Version_Log|}1|262|}
{2010605001|XXGgraph_legend_legend|471|0|733|0|{0|}262|263|}
{2010241001|XXGlegend_face_face|472|0|735|0|{}263|264|}
{2010605001|XXGgraph_legend_legend|473|0|737|0|{1|}262|265|}
{2010241001|XXGlegend_face_face|474|0|739|0|{}265|266|}
{2010605001|XXGgraph_legend_legend|475|0|741|0|{2|}262|267|}
{2010241001|XXGlegend_face_face|476|0|743|0|{}267|268|}
{2010605001|XXGgraph_legend_legend|477|0|745|0|{3|}262|269|}
{2010241001|XXGlegend_face_face|478|0|747|0|{}269|270|}
{2010605001|XXGgraph_legend_legend|479|0|749|0|{4|}262|271|}
{2010241001|XXGlegend_face_face|480|0|751|0|{}271|272|}
{2010605001|XXGgraph_legend_legend|481|0|753|0|{5|}262|273|}
{2010241001|XXGlegend_face_face|482|0|755|0|{}273|274|}
{2010605001|XXGgraph_legend_legend|483|0|757|0|{6|}262|275|}
{2010241001|XXGlegend_face_face|484|0|759|0|{}275|276|}
{2010605001|XXGgraph_legend_legend|485|0|761|0|{7|}262|277|}
{2010241001|XXGlegend_face_face|486|0|763|0|{}277|278|}
{2010605001|XXGgraph_legend_legend|487|0|765|0|{8|}262|279|}
{2010241001|XXGlegend_face_face|488|0|767|0|{}279|280|}
{2010605001|XXGgraph_legend_legend|489|0|769|0|{9|}262|281|}
{2010241001|XXGlegend_face_face|490|0|771|0|{}281|282|}
{2010605001|XXGgraph_legend_legend|491|0|773|0|{10|}262|283|}
{2010241001|XXGlegend_face_face|492|0|775|0|{}283|284|}
{2010605001|XXGgraph_legend_legend|493|0|777|0|{11|}262|285|}
{2010241001|XXGlegend_face_face|494|0|779|0|{}285|286|}
{2010605001|XXGgraph_legend_legend|495|0|781|0|{12|}262|287|}
{2010241001|XXGlegend_face_face|496|0|783|0|{}287|288|}
{2010605001|XXGgraph_legend_legend|497|0|785|0|{13|}262|289|}
{2010241001|XXGlegend_face_face|498|0|787|0|{}289|290|}
{2010605001|XXGgraph_legend_legend|499|0|789|0|{14|}262|291|}
{2010241001|XXGlegend_face_face|500|0|791|0|{}291|292|}
{2010605001|XXGgraph_legend_legend|501|0|793|0|{15|}262|293|}
{2010241001|XXGlegend_face_face|502|0|795|0|{}293|294|}
{2010605001|XXGgraph_legend_legend|503|0|797|0|{16|}262|295|}
{2010241001|XXGlegend_face_face|504|0|799|0|{}295|296|}
{2010605001|XXGgraph_legend_legend|505|0|801|0|{17|}262|297|}
{2010241001|XXGlegend_face_face|506|0|803|0|{}297|298|}
{2010601001|XXGgraph_vertex_vertex|507|0|805|0|{prepare_output_1|}1|299|}
{2010605001|XXGgraph_legend_legend|508|0|807|0|{0|}299|300|}
{2010241001|XXGlegend_face_face|509|0|809|0|{}300|301|}
{2010605001|XXGgraph_legend_legend|510|0|811|0|{1|}299|302|}
{2010241001|XXGlegend_face_face|511|0|813|0|{}302|303|}
{2010605001|XXGgraph_legend_legend|512|0|815|0|{2|}299|304|}
{2010241001|XXGlegend_face_face|513|0|817|0|{}304|305|}
{2010605001|XXGgraph_legend_legend|514|0|819|0|{3|}299|306|}
{2010241001|XXGlegend_face_face|515|0|821|0|{}306|307|}
{2010604001|XXGgraph_flow_flow|516|0|823|0|{Flow_1|}299|47|}
{2010604001|XXGgraph_flow_flow|517|0|824|0|{Flow_2|}299|45|}
{2010604001|XXGgraph_flow_flow|518|0|825|0|{Flow_3|}299|308|}
{2010604001|XXGgraph_flow_flow|519|0|827|0|{Flow_4|}299|66|}
{2010604001|XXGgraph_flow_flow|520|0|828|0|{Flow_5|}299|309|}
{2010604001|XXGgraph_flow_flow|521|0|830|0|{Flow_6|}299|310|}
{2010604001|XXGgraph_flow_flow|522|0|832|0|{Flow_7|}299|43|}
{2010604001|XXGgraph_flow_flow|523|0|833|0|{Flow_8|}299|311|}
{2010601001|XXGgraph_vertex_vertex|524|0|835|0|{Copy_Out|}299|312|}
{2010212001|XXGvertex_oport_oport|525|0|837|0|{0|out|}312|313|}
{2010211001|XXGvertex_iport_iport|526|0|839|0|{0|in|}312|314|}
{2010214001|XXGiport_src_flow|527|0|841|0|{0|}314|43|}
{2010006001|XXGobject_psameas_object|528|0|842|0|{Layout|Layout|0|0|}312|56|}
{2010006001|XXGobject_psameas_object|529|0|843|0|{in_metadata|write_metadata|0|0|}312|56|}
{2010006001|XXGobject_psameas_object|530|0|844|0|{out_metadata|write_metadata|0|0|}312|56|}
{2010601001|XXGgraph_vertex_vertex|531|0|845|0|{Copy_Out_|}299|315|}
{2010212001|XXGvertex_oport_oport|532|0|847|0|{0|out|}315|316|}
{2010211001|XXGvertex_iport_iport|533|0|849|0|{0|in|}315|317|}
{2010214001|XXGiport_src_flow|534|0|851|0|{0|}317|45|}
{2010006001|XXGobject_psameas_object|535|0|852|0|{Layout|Layout|0|0|}315|60|}
{2010006001|XXGobject_psameas_object|536|0|853|0|{in_metadata|write_metadata|0|0|}315|60|}
{2010006001|XXGobject_psameas_object|537|0|854|0|{out_metadata|write_metadata|0|0|}315|60|}
{2010601001|XXGgraph_vertex_vertex|538|0|855|0|{Dedup_and_Fix_Intervals|}299|318|}
{2010605001|XXGgraph_legend_legend|539|0|857|0|{0|}318|319|}
{2010241001|XXGlegend_face_face|540|0|859|0|{}319|320|}
{2010605001|XXGgraph_legend_legend|541|0|861|0|{1|}318|321|}
{2010241001|XXGlegend_face_face|542|0|863|0|{}321|322|}
{2010605001|XXGgraph_legend_legend|543|0|865|0|{2|}318|323|}
{2010241001|XXGlegend_face_face|544|0|867|0|{}323|324|}
{2010605001|XXGgraph_legend_legend|545|0|869|0|{3|}318|325|}
{2010241001|XXGlegend_face_face|546|0|871|0|{}325|326|}
{2010605001|XXGgraph_legend_legend|547|0|873|0|{4|}318|327|}
{2010241001|XXGlegend_face_face|548|0|875|0|{}327|328|}
{2010604001|XXGgraph_flow_flow|549|0|877|0|{Flow_1|}318|329|}
{2010604001|XXGgraph_flow_flow|550|0|879|0|{Flow_2|}318|330|}
{2010604001|XXGgraph_flow_flow|551|0|881|0|{Flow_3|}318|331|}
{2010604001|XXGgraph_flow_flow|552|0|883|0|{Flow_4|}318|332|}
{2010604001|XXGgraph_flow_flow|553|0|885|0|{Flow_6|}318|333|}
{2010604001|XXGgraph_flow_flow|554|0|887|0|{Flow_7|}318|334|}
{2010601001|XXGgraph_vertex_vertex|555|0|889|0|{Dedup_by_NK_Eff_Date|}318|335|}
{2010212001|XXGvertex_oport_oport|556|0|891|0|{0|out|}335|336|}
{2010213001|XXGoport_dst_flow|557|0|893|0|{0|}336|331|}
{2010212001|XXGvertex_oport_oport|558|0|894|0|{1|dup|}335|337|}
{2010212001|XXGvertex_oport_oport|559|0|896|0|{2|reject|}335|338|}
{2010212001|XXGvertex_oport_oport|560|0|898|0|{3|error|}335|339|}
{2010212001|XXGvertex_oport_oport|561|0|900|0|{4|log|}335|340|}
{2010211001|XXGvertex_iport_iport|562|0|902|0|{0|in|}335|341|}
{2010214001|XXGiport_src_flow|563|0|904|0|{0|}341|329|}
{2010006001|XXGobject_psameas_object|564|0|905|0|{Layout|Layout|0|0|}335|64|}
{2010006001|XXGobject_psameas_object|565|0|906|0|{dup_metadata|write_metadata|0|0|}335|64|}
{2010006001|XXGobject_psameas_object|566|0|907|0|{in_metadata|write_metadata|0|0|}335|64|}
{2010006001|XXGobject_psameas_object|567|0|908|0|{out_metadata|write_metadata|0|0|}335|64|}
{2010006001|XXGobject_psameas_object|568|0|909|0|{reject_metadata|write_metadata|0|0|}335|64|}
{2010601001|XXGgraph_vertex_vertex|569|0|910|0|{Parition_by_Related_or_NK|}318|342|}
{2010212001|XXGvertex_oport_oport|570|0|912|0|{0|out|}342|343|}
{2010213001|XXGoport_dst_flow|571|0|914|0|{0|}343|330|}
{2010211001|XXGvertex_iport_iport|572|0|915|0|{0|in|}342|344|}
{2010006001|XXGobject_psameas_object|573|0|917|0|{Layout|Layout|0|0|}342|41|}
{2010006001|XXGobject_psameas_object|574|0|918|0|{out_metadata|write_metadata|0|0|}342|64|}
{2010601001|XXGgraph_vertex_vertex|575|0|919|0|{Replicate|}318|345|}
{2010212001|XXGvertex_oport_oport|576|0|921|0|{0|out|}345|346|}
{2010211001|XXGvertex_iport_iport|577|0|923|0|{0|in|}345|347|}
{2010214001|XXGiport_src_flow|578|0|925|0|{0|}347|334|}
{2010006001|XXGobject_psameas_object|579|0|926|0|{Layout|Layout|0|0|}345|64|}
{2010006001|XXGobject_psameas_object|580|0|927|0|{in_metadata|write_metadata|0|0|}345|64|}
{2010006001|XXGobject_psameas_object|581|0|928|0|{out_metadata|write_metadata|0|0|}345|64|}
{2010601001|XXGgraph_vertex_vertex|582|0|929|0|{Rollup_Adjoining_Eff_Dates|}318|348|}
{2010212001|XXGvertex_oport_oport|583|0|931|0|{0|out|}348|349|}
{2010213001|XXGoport_dst_flow|584|0|933|0|{0|}349|334|}
{2010212001|XXGvertex_oport_oport|585|0|934|0|{1|reject|}348|350|}
{2010212001|XXGvertex_oport_oport|586|0|936|0|{2|error|}348|351|}
{2010212001|XXGvertex_oport_oport|587|0|938|0|{3|log|}348|352|}
{2010211001|XXGvertex_iport_iport|588|0|940|0|{0|in|}348|353|}
{2010214001|XXGiport_src_flow|589|0|942|0|{0|}353|333|}
{2010006001|XXGobject_psameas_object|590|0|943|0|{Layout|Layout|0|0|}348|64|}
{2010006001|XXGobject_psameas_object|591|0|944|0|{in_metadata|write_metadata|0|0|}348|64|}
{2010006001|XXGobject_psameas_object|592|0|945|0|{out_metadata|write_metadata|0|0|}348|64|}
{2010006001|XXGobject_psameas_object|593|0|946|0|{reject_metadata|write_metadata|0|0|}348|64|}
{2010601001|XXGgraph_vertex_vertex|594|0|947|0|{Scan_to_Fix_Overlapping_Dates|}318|354|}
{2010212001|XXGvertex_oport_oport|595|0|949|0|{0|out|}354|355|}
{2010213001|XXGoport_dst_flow|596|0|951|0|{0|}355|332|}
{2010212001|XXGvertex_oport_oport|597|0|952|0|{1|reject|}354|356|}
{2010212001|XXGvertex_oport_oport|598|0|954|0|{2|error|}354|357|}
{2010212001|XXGvertex_oport_oport|599|0|956|0|{3|log|}354|358|}
{2010211001|XXGvertex_iport_iport|600|0|958|0|{0|in|}354|359|}
{2010214001|XXGiport_src_flow|601|0|960|0|{0|}359|331|}
{2010006001|XXGobject_psameas_object|602|0|961|0|{Layout|Layout|0|0|}354|64|}
{2010006001|XXGobject_psameas_object|603|0|962|0|{in_metadata|write_metadata|0|0|}354|64|}
{2010006001|XXGobject_psameas_object|604|0|963|0|{out_metadata|write_metadata|0|0|}354|64|}
{2010006001|XXGobject_psameas_object|605|0|964|0|{reject_metadata|write_metadata|0|0|}354|64|}
{2010601001|XXGgraph_vertex_vertex|606|0|965|0|{Sort_for_Dedup|}318|360|}
{2010212001|XXGvertex_oport_oport|607|0|967|0|{0|out|}360|361|}
{2010213001|XXGoport_dst_flow|608|0|969|0|{0|}361|329|}
{2010211001|XXGvertex_iport_iport|609|0|970|0|{0|in|}360|362|}
{2010214001|XXGiport_src_flow|610|0|972|0|{0|}362|330|}
{2010006001|XXGobject_psameas_object|611|0|973|0|{Layout|Layout|0|0|}360|64|}
{2010006001|XXGobject_psameas_object|612|0|974|0|{in_metadata|write_metadata|0|0|}360|64|}
{2010006001|XXGobject_psameas_object|613|0|975|0|{out_metadata|write_metadata|0|0|}360|64|}
{2010601001|XXGgraph_vertex_vertex|614|0|976|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}318|363|}
{2010212001|XXGvertex_oport_oport|615|0|978|0|{0|out|}363|364|}
{2010213001|XXGoport_dst_flow|616|0|980|0|{0|}364|333|}
{2010211001|XXGvertex_iport_iport|617|0|981|0|{0|in|}363|365|}
{2010214001|XXGiport_src_flow|618|0|983|0|{0|}365|332|}
{2010006001|XXGobject_psameas_object|619|0|984|0|{Layout|Layout|0|0|}363|64|}
{2010006001|XXGobject_psameas_object|620|0|985|0|{in_metadata|write_metadata|0|0|}363|64|}
{2010006001|XXGobject_psameas_object|621|0|986|0|{out_metadata|write_metadata|0|0|}363|64|}
{2010601001|XXGgraph_vertex_vertex|622|0|987|0|{Testing|}318|366|}
{2010605001|XXGgraph_legend_legend|623|0|989|0|{0|}366|367|}
{2010241001|XXGlegend_face_face|624|0|991|0|{}367|368|}
{2010604001|XXGgraph_flow_flow|625|0|993|0|{Flow_1|}366|369|}
{2010604001|XXGgraph_flow_flow|626|0|995|0|{Flow_8|}366|370|}
{2010601001|XXGgraph_vertex_vertex|627|0|997|0|{Create|}366|371|}
{2010212001|XXGvertex_oport_oport|628|0|999|0|{0|out|}371|372|}
{2010213001|XXGoport_dst_flow|629|0|1001|0|{0|}372|370|}
{2010212001|XXGvertex_oport_oport|630|0|1002|0|{1|error|}371|373|}
{2010212001|XXGvertex_oport_oport|631|0|1004|0|{2|log|}371|374|}
{2010601001|XXGgraph_vertex_vertex|632|0|1006|0|{Dups|}366|375|}
{2010211001|XXGvertex_iport_iport|633|0|1008|0|{0|write|}375|376|}
{2010601001|XXGgraph_vertex_vertex|634|0|1010|0|{Merge|}366|377|}
{2010212001|XXGvertex_oport_oport|635|0|1012|0|{0|out|}377|378|}
{2010213001|XXGoport_dst_flow|636|0|1014|0|{0|}378|369|}
{2010211001|XXGvertex_iport_iport|637|0|1015|0|{0|in|}377|379|}
{2010601001|XXGgraph_vertex_vertex|638|0|1017|0|{Partition_by_Round_robin|}366|380|}
{2010212001|XXGvertex_oport_oport|639|0|1019|0|{0|out|}380|381|}
{2010211001|XXGvertex_iport_iport|640|0|1021|0|{0|in|}380|382|}
{2010214001|XXGiport_src_flow|641|0|1023|0|{0|}382|370|}
{2010006001|XXGobject_psameas_object|642|0|1024|0|{in_metadata|out_metadata|0|0|}380|371|}
{2010006001|XXGobject_psameas_object|643|0|1025|0|{out_metadata|out_metadata|0|0|}380|371|}
{2010601001|XXGgraph_vertex_vertex|644|0|1026|0|{stdout|}366|383|}
{2010211001|XXGvertex_iport_iport|645|0|1028|0|{0|write|}383|384|}
{2010214001|XXGiport_src_flow|646|0|1030|0|{0|}384|369|}
{2010212001|XXGvertex_oport_oport|647|0|1031|0|{0|out|}366|385|}
{2010216002|XXGoport_binding_oport|648|0|1033|0|{.5|.5|{10|242000|104000|262000|104000|262000|124000|39000|124000|19000|124000|}6786|}385|381|}
{2010211001|XXGvertex_iport_iport|649|0|1034|0|{0|in0|}366|386|}
{2010215002|XXGiport_binding_iport|650|0|1036|0|{.5|.5|{10|322000|179000|302000|179000|302000|124000|820000|124000|840000|124000|}6784|}386|379|}
{2010211001|XXGvertex_iport_iport|651|0|1037|0|{1|in1|}366|387|}
{2010215002|XXGiport_binding_iport|652|0|1039|0|{.5|.5|{12|429000|60000|429000|40000|429000|40000|429000|42000|429000|42000|429000|22000|}6785|}387|376|}
{2010212001|XXGvertex_oport_oport|653|0|1040|0|{0|out|}318|388|}
{2010216002|XXGoport_binding_oport|654|0|1042|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6838|}388|346|}
{2010213001|XXGoport_dst_flow|655|0|1043|0|{0|}388|308|}
{2010213001|XXGoport_dst_flow|656|0|1044|0|{1|}388|310|}
{2010212001|XXGvertex_oport_oport|657|0|1045|0|{1|dups|}318|389|}
{2010216002|XXGoport_binding_oport|658|0|1047|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6839|}389|337|}
{2010213001|XXGoport_dst_flow|659|0|1048|0|{0|}389|66|}
{2010211001|XXGvertex_iport_iport|660|0|1049|0|{0|in|}318|390|}
{2010215002|XXGiport_binding_iport|661|0|1051|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6837|}390|344|}
{2010214001|XXGiport_src_flow|662|0|1052|0|{0|}390|47|}
{2010006001|XXGobject_psameas_object|663|0|1053|0|{INPUT_DML|write_metadata|0|0|}318|64|}
{2010601001|XXGgraph_vertex_vertex|664|0|1054|0|{Dups|}299|64|}
{2010601001|XXGgraph_vertex_vertex|665|0|1055|0|{Gather|}299|391|}
{2010212001|XXGvertex_oport_oport|666|0|1057|0|{0|out|}391|392|}
{2010213001|XXGoport_dst_flow|667|0|1059|0|{0|}392|311|}
{2010211001|XXGvertex_iport_iport|668|0|1060|0|{0|in|}391|393|}
{2010214001|XXGiport_src_flow|669|0|1062|0|{0|}393|310|}
{2010006001|XXGobject_psameas_object|670|0|1063|0|{in_metadata|write_metadata|0|0|}391|193|}
{2010006001|XXGobject_psameas_object|671|0|1064|0|{out_metadata|write_metadata|0|0|}391|193|}
{2010601001|XXGgraph_vertex_vertex|672|0|1065|0|{Gather_|}299|394|}
{2010212001|XXGvertex_oport_oport|673|0|1067|0|{0|out|}394|395|}
{2010211001|XXGvertex_iport_iport|674|0|1069|0|{0|in|}394|396|}
{2010214001|XXGiport_src_flow|675|0|1071|0|{0|}396|309|}
{2010214001|XXGiport_src_flow|676|0|1072|0|{1|}396|311|}
{2010006001|XXGobject_psameas_object|677|0|1073|0|{Layout|Layout|0|0|}394|218|}
{2010006001|XXGobject_psameas_object|678|0|1074|0|{in_metadata|write_metadata|0|0|}394|193|}
{2010006001|XXGobject_psameas_object|679|0|1075|0|{out_metadata|write_metadata|0|0|}394|193|}
{2010601001|XXGgraph_vertex_vertex|680|0|1076|0|{Map_to_Output|}299|41|}
{2010601001|XXGgraph_vertex_vertex|681|0|1077|0|{Merge|}299|397|}
{2010212001|XXGvertex_oport_oport|682|0|1079|0|{0|out|}397|398|}
{2010213001|XXGoport_dst_flow|683|0|1081|0|{0|}398|309|}
{2010211001|XXGvertex_iport_iport|684|0|1082|0|{0|in|}397|399|}
{2010214001|XXGiport_src_flow|685|0|1084|0|{0|}399|308|}
{2010006001|XXGobject_psameas_object|686|0|1085|0|{in_metadata|write_metadata|0|0|}397|193|}
{2010006001|XXGobject_psameas_object|687|0|1086|0|{out_metadata|write_metadata|0|0|}397|193|}
{2010212001|XXGvertex_oport_oport|688|0|1087|0|{0|source|}299|400|}
{2010216002|XXGoport_binding_oport|689|0|1089|0|{.5|1.0|{8|840000|104000|860000|104000|890000|104000|910000|104000|}9983|}400|313|}
{2010213001|XXGoport_dst_flow|690|0|1090|0|{0|}400|20|}
{2010212001|XXGvertex_oport_oport|691|0|1091|0|{1|clean|}299|401|}
{2010216002|XXGoport_binding_oport|692|0|1093|0|{.5|1.0|{12|835000|229000|855000|229000|890000|229000|890000|269000|890000|269000|910000|269000|}9984|}401|316|}
{2010213001|XXGoport_dst_flow|693|0|1094|0|{0|}401|21|}
{2010212001|XXGvertex_oport_oport|694|0|1095|0|{2|lookup|}299|402|}
{2010216002|XXGoport_binding_oport|695|0|1097|0|{.5|.5|{12|862000|384000|882000|384000|886000|384000|886000|439000|890000|439000|910000|439000|}9985|}402|395|}
{2010213001|XXGoport_dst_flow|696|0|1098|0|{0|}402|24|}
{2010211001|XXGvertex_iport_iport|697|0|1099|0|{0|in0|}299|403|}
{2010215002|XXGiport_binding_iport|698|0|1101|0|{.5|.5|{12|67000|229000|47000|229000|43000|229000|43000|269000|39000|269000|19000|269000|}9982|}403|55|}
{2010214001|XXGiport_src_flow|699|0|1102|0|{0|}403|13|}
{2010007001|XXGobject_proto_object|700|0|1103|0|{}299|404|}
{2010605001|XXGgraph_legend_legend|701|0|1105|0|{0|}404|405|}
{2010241001|XXGlegend_face_face|702|0|1107|0|{}405|406|}
{2010605001|XXGgraph_legend_legend|703|0|1109|0|{1|}404|407|}
{2010241001|XXGlegend_face_face|704|0|1111|0|{}407|408|}
{2010605001|XXGgraph_legend_legend|705|0|1113|0|{2|}404|409|}
{2010241001|XXGlegend_face_face|706|0|1115|0|{}409|410|}
{2010605001|XXGgraph_legend_legend|707|0|1117|0|{3|}404|411|}
{2010241001|XXGlegend_face_face|708|0|1119|0|{}411|412|}
{2010604001|XXGgraph_flow_flow|709|0|1121|0|{Flow_1|}404|413|}
{2010604001|XXGgraph_flow_flow|710|0|1123|0|{Flow_2|}404|414|}
{2010604001|XXGgraph_flow_flow|711|0|1125|0|{Flow_3|}404|415|}
{2010604001|XXGgraph_flow_flow|712|0|1127|0|{Flow_4|}404|416|}
{2010604001|XXGgraph_flow_flow|713|0|1129|0|{Flow_5|}404|417|}
{2010604001|XXGgraph_flow_flow|714|0|1131|0|{Flow_6|}404|418|}
{2010604001|XXGgraph_flow_flow|715|0|1133|0|{Flow_7|}404|419|}
{2010604001|XXGgraph_flow_flow|716|0|1135|0|{Flow_8|}404|420|}
{2010601001|XXGgraph_vertex_vertex|717|0|1137|0|{Copy_Out|}404|421|}
{2010212001|XXGvertex_oport_oport|718|0|1139|0|{0|out|}421|422|}
{2010211001|XXGvertex_iport_iport|719|0|1141|0|{0|in|}421|423|}
{2010214001|XXGiport_src_flow|720|0|1143|0|{0|}423|419|}
{2010007001|XXGobject_proto_object|721|0|1144|0|{}421|424|}
{2010212001|XXGvertex_oport_oport|722|0|1146|0|{0|out|}424|425|}
{2010006001|XXGobject_psameas_object|723|0|1148|0|{metadata|out_metadata|1|0|}425|424|}
{2010211001|XXGvertex_iport_iport|724|0|1149|0|{0|in|}424|426|}
{2010006001|XXGobject_psameas_object|725|0|1151|0|{metadata|in_metadata|1|0|}426|424|}
{2010601001|XXGgraph_vertex_vertex|726|0|1152|0|{Copy_Out_|}404|427|}
{2010212001|XXGvertex_oport_oport|727|0|1154|0|{0|out|}427|428|}
{2010211001|XXGvertex_iport_iport|728|0|1156|0|{0|in|}427|429|}
{2010214001|XXGiport_src_flow|729|0|1158|0|{0|}429|414|}
{2010007001|XXGobject_proto_object|730|0|1159|0|{}427|430|}
{2010212001|XXGvertex_oport_oport|731|0|1161|0|{0|out|}430|431|}
{2010006001|XXGobject_psameas_object|732|0|1163|0|{metadata|out_metadata|1|0|}431|430|}
{2010211001|XXGvertex_iport_iport|733|0|1164|0|{0|in|}430|432|}
{2010006001|XXGobject_psameas_object|734|0|1166|0|{metadata|in_metadata|1|0|}432|430|}
{2010601001|XXGgraph_vertex_vertex|735|0|1167|0|{Dedup_and_Fix_Intervals|}404|433|}
{2010605001|XXGgraph_legend_legend|736|0|1169|0|{0|}433|434|}
{2010241001|XXGlegend_face_face|737|0|1171|0|{}434|435|}
{2010605001|XXGgraph_legend_legend|738|0|1173|0|{1|}433|436|}
{2010241001|XXGlegend_face_face|739|0|1175|0|{}436|437|}
{2010605001|XXGgraph_legend_legend|740|0|1177|0|{2|}433|438|}
{2010241001|XXGlegend_face_face|741|0|1179|0|{}438|439|}
{2010605001|XXGgraph_legend_legend|742|0|1181|0|{3|}433|440|}
{2010241001|XXGlegend_face_face|743|0|1183|0|{}440|441|}
{2010605001|XXGgraph_legend_legend|744|0|1185|0|{4|}433|442|}
{2010241001|XXGlegend_face_face|745|0|1187|0|{}442|443|}
{2010604001|XXGgraph_flow_flow|746|0|1189|0|{Flow_1|}433|444|}
{2010604001|XXGgraph_flow_flow|747|0|1191|0|{Flow_2|}433|445|}
{2010604001|XXGgraph_flow_flow|748|0|1193|0|{Flow_3|}433|446|}
{2010604001|XXGgraph_flow_flow|749|0|1195|0|{Flow_4|}433|447|}
{2010604001|XXGgraph_flow_flow|750|0|1197|0|{Flow_6|}433|448|}
{2010604001|XXGgraph_flow_flow|751|0|1199|0|{Flow_7|}433|449|}
{2010601001|XXGgraph_vertex_vertex|752|0|1201|0|{Dedup_by_NK_Eff_Date|}433|450|}
{2010212001|XXGvertex_oport_oport|753|0|1203|0|{0|out|}450|451|}
{2010213001|XXGoport_dst_flow|754|0|1205|0|{0|}451|446|}
{2010212001|XXGvertex_oport_oport|755|0|1206|0|{1|dup|}450|452|}
{2010212001|XXGvertex_oport_oport|756|0|1208|0|{2|reject|}450|453|}
{2010212001|XXGvertex_oport_oport|757|0|1210|0|{3|error|}450|454|}
{2010212001|XXGvertex_oport_oport|758|0|1212|0|{4|log|}450|455|}
{2010211001|XXGvertex_iport_iport|759|0|1214|0|{0|in|}450|456|}
{2010214001|XXGiport_src_flow|760|0|1216|0|{0|}456|444|}
{2010601001|XXGgraph_vertex_vertex|761|0|1217|0|{Parition_by_Related_or_NK|}433|457|}
{2010212001|XXGvertex_oport_oport|762|0|1219|0|{0|out|}457|458|}
{2010213001|XXGoport_dst_flow|763|0|1221|0|{0|}458|445|}
{2010211001|XXGvertex_iport_iport|764|0|1222|0|{0|in|}457|459|}
{2010601001|XXGgraph_vertex_vertex|765|0|1224|0|{Replicate|}433|460|}
{2010212001|XXGvertex_oport_oport|766|0|1226|0|{0|out|}460|461|}
{2010211001|XXGvertex_iport_iport|767|0|1228|0|{0|in|}460|462|}
{2010214001|XXGiport_src_flow|768|0|1230|0|{0|}462|449|}
{2010601001|XXGgraph_vertex_vertex|769|0|1231|0|{Rollup_Adjoining_Eff_Dates|}433|463|}
{2010212001|XXGvertex_oport_oport|770|0|1233|0|{0|out|}463|464|}
{2010213001|XXGoport_dst_flow|771|0|1235|0|{0|}464|449|}
{2010212001|XXGvertex_oport_oport|772|0|1236|0|{1|reject|}463|465|}
{2010212001|XXGvertex_oport_oport|773|0|1238|0|{2|error|}463|466|}
{2010212001|XXGvertex_oport_oport|774|0|1240|0|{3|log|}463|467|}
{2010211001|XXGvertex_iport_iport|775|0|1242|0|{0|in|}463|468|}
{2010214001|XXGiport_src_flow|776|0|1244|0|{0|}468|448|}
{2010601001|XXGgraph_vertex_vertex|777|0|1245|0|{Scan_to_Fix_Overlapping_Dates|}433|469|}
{2010212001|XXGvertex_oport_oport|778|0|1247|0|{0|out|}469|470|}
{2010213001|XXGoport_dst_flow|779|0|1249|0|{0|}470|447|}
{2010212001|XXGvertex_oport_oport|780|0|1250|0|{1|reject|}469|471|}
{2010212001|XXGvertex_oport_oport|781|0|1252|0|{2|error|}469|472|}
{2010212001|XXGvertex_oport_oport|782|0|1254|0|{3|log|}469|473|}
{2010211001|XXGvertex_iport_iport|783|0|1256|0|{0|in|}469|474|}
{2010214001|XXGiport_src_flow|784|0|1258|0|{0|}474|446|}
{2010601001|XXGgraph_vertex_vertex|785|0|1259|0|{Sort_for_Dedup|}433|475|}
{2010212001|XXGvertex_oport_oport|786|0|1261|0|{0|out|}475|476|}
{2010213001|XXGoport_dst_flow|787|0|1263|0|{0|}476|444|}
{2010211001|XXGvertex_iport_iport|788|0|1264|0|{0|in|}475|477|}
{2010214001|XXGiport_src_flow|789|0|1266|0|{0|}477|445|}
{2010601001|XXGgraph_vertex_vertex|790|0|1267|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}433|478|}
{2010212001|XXGvertex_oport_oport|791|0|1269|0|{0|out|}478|479|}
{2010213001|XXGoport_dst_flow|792|0|1271|0|{0|}479|448|}
{2010211001|XXGvertex_iport_iport|793|0|1272|0|{0|in|}478|480|}
{2010214001|XXGiport_src_flow|794|0|1274|0|{0|}480|447|}
{2010601001|XXGgraph_vertex_vertex|795|0|1275|0|{Testing|}433|481|}
{2010605001|XXGgraph_legend_legend|796|0|1277|0|{0|}481|482|}
{2010241001|XXGlegend_face_face|797|0|1279|0|{}482|483|}
{2010604001|XXGgraph_flow_flow|798|0|1281|0|{Flow_1|}481|484|}
{2010604001|XXGgraph_flow_flow|799|0|1283|0|{Flow_8|}481|485|}
{2010601001|XXGgraph_vertex_vertex|800|0|1285|0|{Create|}481|486|}
{2010212001|XXGvertex_oport_oport|801|0|1287|0|{0|out|}486|487|}
{2010213001|XXGoport_dst_flow|802|0|1289|0|{0|}487|485|}
{2010212001|XXGvertex_oport_oport|803|0|1290|0|{1|error|}486|488|}
{2010212001|XXGvertex_oport_oport|804|0|1292|0|{2|log|}486|489|}
{2010601001|XXGgraph_vertex_vertex|805|0|1294|0|{Dups|}481|490|}
{2010211001|XXGvertex_iport_iport|806|0|1296|0|{0|write|}490|491|}
{2010601001|XXGgraph_vertex_vertex|807|0|1298|0|{Merge|}481|492|}
{2010212001|XXGvertex_oport_oport|808|0|1300|0|{0|out|}492|493|}
{2010213001|XXGoport_dst_flow|809|0|1302|0|{0|}493|484|}
{2010211001|XXGvertex_iport_iport|810|0|1303|0|{0|in|}492|494|}
{2010601001|XXGgraph_vertex_vertex|811|0|1305|0|{Partition_by_Round_robin|}481|495|}
{2010212001|XXGvertex_oport_oport|812|0|1307|0|{0|out|}495|496|}
{2010211001|XXGvertex_iport_iport|813|0|1309|0|{0|in|}495|497|}
{2010214001|XXGiport_src_flow|814|0|1311|0|{0|}497|485|}
{2010601001|XXGgraph_vertex_vertex|815|0|1312|0|{stdout|}481|498|}
{2010211001|XXGvertex_iport_iport|816|0|1314|0|{0|write|}498|499|}
{2010214001|XXGiport_src_flow|817|0|1316|0|{0|}499|484|}
{2010212001|XXGvertex_oport_oport|818|0|1317|0|{0|out|}481|500|}
{2010216002|XXGoport_binding_oport|819|0|1319|0|{.5|.5|{10|242000|104000|262000|104000|262000|124000|39000|124000|19000|124000|}6786|}500|496|}
{2010211001|XXGvertex_iport_iport|820|0|1320|0|{0|in0|}481|501|}
{2010215002|XXGiport_binding_iport|821|0|1322|0|{.5|.5|{10|322000|179000|302000|179000|302000|124000|820000|124000|840000|124000|}6784|}501|494|}
{2010211001|XXGvertex_iport_iport|822|0|1323|0|{1|in1|}481|502|}
{2010215002|XXGiport_binding_iport|823|0|1325|0|{.5|.5|{12|429000|60000|429000|40000|429000|40000|429000|42000|429000|42000|429000|22000|}6785|}502|491|}
{2010212001|XXGvertex_oport_oport|824|0|1326|0|{0|out|}433|503|}
{2010216002|XXGoport_binding_oport|825|0|1328|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6801|}503|461|}
{2010213001|XXGoport_dst_flow|826|0|1329|0|{0|}503|415|}
{2010213001|XXGoport_dst_flow|827|0|1330|0|{1|}503|418|}
{2010212001|XXGvertex_oport_oport|828|0|1331|0|{1|dups|}433|504|}
{2010216002|XXGoport_binding_oport|829|0|1333|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6802|}504|452|}
{2010213001|XXGoport_dst_flow|830|0|1334|0|{0|}504|416|}
{2010211001|XXGvertex_iport_iport|831|0|1335|0|{0|in|}433|505|}
{2010215002|XXGiport_binding_iport|832|0|1337|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6800|}505|459|}
{2010214001|XXGiport_src_flow|833|0|1338|0|{0|}505|413|}
{2010007001|XXGobject_proto_object|834|0|1339|0|{}433|506|}
{2010605001|XXGgraph_legend_legend|835|0|1341|0|{0|}506|507|}
{2010241001|XXGlegend_face_face|836|0|1343|0|{}507|508|}
{2010605001|XXGgraph_legend_legend|837|0|1345|0|{1|}506|509|}
{2010241001|XXGlegend_face_face|838|0|1347|0|{}509|510|}
{2010605001|XXGgraph_legend_legend|839|0|1349|0|{2|}506|511|}
{2010241001|XXGlegend_face_face|840|0|1351|0|{}511|512|}
{2010605001|XXGgraph_legend_legend|841|0|1353|0|{3|}506|513|}
{2010241001|XXGlegend_face_face|842|0|1355|0|{}513|514|}
{2010605001|XXGgraph_legend_legend|843|0|1357|0|{4|}506|515|}
{2010241001|XXGlegend_face_face|844|0|1359|0|{}515|516|}
{2010604001|XXGgraph_flow_flow|845|0|1361|0|{Flow_1|}506|517|}
{2010604001|XXGgraph_flow_flow|846|0|1363|0|{Flow_2|}506|518|}
{2010604001|XXGgraph_flow_flow|847|0|1365|0|{Flow_3|}506|519|}
{2010604001|XXGgraph_flow_flow|848|0|1367|0|{Flow_4|}506|520|}
{2010604001|XXGgraph_flow_flow|849|0|1369|0|{Flow_6|}506|521|}
{2010604001|XXGgraph_flow_flow|850|0|1371|0|{Flow_7|}506|522|}
{2010601001|XXGgraph_vertex_vertex|851|0|1373|0|{Dedup_by_NK_Eff_Date|}506|523|}
{2010212001|XXGvertex_oport_oport|852|0|1375|0|{0|out|}523|524|}
{2010213001|XXGoport_dst_flow|853|0|1377|0|{0|}524|519|}
{2010212001|XXGvertex_oport_oport|854|0|1378|0|{1|dup|}523|525|}
{2010212001|XXGvertex_oport_oport|855|0|1380|0|{2|reject|}523|526|}
{2010212001|XXGvertex_oport_oport|856|0|1382|0|{3|error|}523|527|}
{2010212001|XXGvertex_oport_oport|857|0|1384|0|{4|log|}523|528|}
{2010211001|XXGvertex_iport_iport|858|0|1386|0|{0|in|}523|529|}
{2010214001|XXGiport_src_flow|859|0|1388|0|{0|}529|517|}
{2010007001|XXGobject_proto_object|860|0|1389|0|{}523|530|}
{2010212001|XXGvertex_oport_oport|861|0|1391|0|{0|out|}530|531|}
{2010006001|XXGobject_psameas_object|862|0|1393|0|{metadata|out_metadata|1|0|}531|530|}
{2010212001|XXGvertex_oport_oport|863|0|1394|0|{1|dup|}530|532|}
{2010006001|XXGobject_psameas_object|864|0|1396|0|{metadata|dup_metadata|1|0|}532|530|}
{2010212001|XXGvertex_oport_oport|865|0|1397|0|{2|reject|}530|533|}
{2010006001|XXGobject_psameas_object|866|0|1399|0|{metadata|reject_metadata|1|0|}533|530|}
{2010212001|XXGvertex_oport_oport|867|0|1400|0|{3|error|}530|534|}
{2010006001|XXGobject_psameas_object|868|0|1402|0|{metadata|error_metadata|1|0|}534|530|}
{2010212001|XXGvertex_oport_oport|869|0|1403|0|{4|log|}530|535|}
{2010006001|XXGobject_psameas_object|870|0|1405|0|{metadata|log_metadata|1|0|}535|530|}
{2010211001|XXGvertex_iport_iport|871|0|1406|0|{0|in|}530|536|}
{2010006001|XXGobject_psameas_object|872|0|1408|0|{metadata|in_metadata|1|0|}536|530|}
{2010601001|XXGgraph_vertex_vertex|873|0|1409|0|{Parition_by_Related_or_NK|}506|537|}
{2010212001|XXGvertex_oport_oport|874|0|1411|0|{0|out|}537|538|}
{2010213001|XXGoport_dst_flow|875|0|1413|0|{0|}538|518|}
{2010211001|XXGvertex_iport_iport|876|0|1414|0|{0|in|}537|539|}
{2010007001|XXGobject_proto_object|877|0|1416|0|{}537|540|}
{2010212001|XXGvertex_oport_oport|878|0|1418|0|{0|out|}540|541|}
{2010006001|XXGobject_psameas_object|879|0|1420|0|{metadata|out_metadata|1|0|}541|540|}
{2010211001|XXGvertex_iport_iport|880|0|1421|0|{0|in|}540|542|}
{2010006001|XXGobject_psameas_object|881|0|1423|0|{metadata|in_metadata|1|0|}542|540|}
{2010006001|XXGobject_psameas_object|882|0|1424|0|{in_metadata|INPUT_DML|1|0|}537|506|}
{2010601001|XXGgraph_vertex_vertex|883|0|1425|0|{Replicate|}506|543|}
{2010212001|XXGvertex_oport_oport|884|0|1427|0|{0|out|}543|544|}
{2010211001|XXGvertex_iport_iport|885|0|1429|0|{0|in|}543|545|}
{2010214001|XXGiport_src_flow|886|0|1431|0|{0|}545|522|}
{2010007001|XXGobject_proto_object|887|0|1432|0|{}543|546|}
{2010212001|XXGvertex_oport_oport|888|0|1434|0|{0|out|}546|547|}
{2010006001|XXGobject_psameas_object|889|0|1436|0|{metadata|out_metadata|1|0|}547|546|}
{2010211001|XXGvertex_iport_iport|890|0|1437|0|{0|in|}546|548|}
{2010006001|XXGobject_psameas_object|891|0|1439|0|{metadata|in_metadata|1|0|}548|546|}
{2010601001|XXGgraph_vertex_vertex|892|0|1440|0|{Rollup_Adjoining_Eff_Dates|}506|549|}
{2010212001|XXGvertex_oport_oport|893|0|1442|0|{0|out|}549|550|}
{2010213001|XXGoport_dst_flow|894|0|1444|0|{0|}550|522|}
{2010212001|XXGvertex_oport_oport|895|0|1445|0|{1|reject|}549|551|}
{2010212001|XXGvertex_oport_oport|896|0|1447|0|{2|error|}549|552|}
{2010212001|XXGvertex_oport_oport|897|0|1449|0|{3|log|}549|553|}
{2010211001|XXGvertex_iport_iport|898|0|1451|0|{0|in|}549|554|}
{2010214001|XXGiport_src_flow|899|0|1453|0|{0|}554|521|}
{2010007001|XXGobject_proto_object|900|0|1454|0|{}549|555|}
{2010212001|XXGvertex_oport_oport|901|0|1456|0|{0|out|}555|556|}
{2010006001|XXGobject_psameas_object|902|0|1458|0|{metadata|out_metadata|1|0|}556|555|}
{2010212001|XXGvertex_oport_oport|903|0|1459|0|{1|reject|}555|557|}
{2010006001|XXGobject_psameas_object|904|0|1461|0|{metadata|reject_metadata|1|0|}557|555|}
{2010212001|XXGvertex_oport_oport|905|0|1462|0|{2|error|}555|558|}
{2010006001|XXGobject_psameas_object|906|0|1464|0|{metadata|error_metadata|1|0|}558|555|}
{2010212001|XXGvertex_oport_oport|907|0|1465|0|{3|log|}555|559|}
{2010006001|XXGobject_psameas_object|908|0|1467|0|{metadata|log_metadata|1|0|}559|555|}
{2010211001|XXGvertex_iport_iport|909|0|1468|0|{0|in|}555|560|}
{2010006001|XXGobject_psameas_object|910|0|1470|0|{metadata|in_metadata|1|0|}560|555|}
{2010601001|XXGgraph_vertex_vertex|911|0|1471|0|{Scan_to_Fix_Overlapping_Dates|}506|561|}
{2010212001|XXGvertex_oport_oport|912|0|1473|0|{0|out|}561|562|}
{2010213001|XXGoport_dst_flow|913|0|1475|0|{0|}562|520|}
{2010212001|XXGvertex_oport_oport|914|0|1476|0|{1|reject|}561|563|}
{2010212001|XXGvertex_oport_oport|915|0|1478|0|{2|error|}561|564|}
{2010212001|XXGvertex_oport_oport|916|0|1480|0|{3|log|}561|565|}
{2010211001|XXGvertex_iport_iport|917|0|1482|0|{0|in|}561|566|}
{2010214001|XXGiport_src_flow|918|0|1484|0|{0|}566|519|}
{2010007001|XXGobject_proto_object|919|0|1485|0|{}561|567|}
{2010212001|XXGvertex_oport_oport|920|0|1487|0|{0|out|}567|568|}
{2010006001|XXGobject_psameas_object|921|0|1489|0|{metadata|out_metadata|1|0|}568|567|}
{2010212001|XXGvertex_oport_oport|922|0|1490|0|{1|reject|}567|569|}
{2010006001|XXGobject_psameas_object|923|0|1492|0|{metadata|reject_metadata|1|0|}569|567|}
{2010212001|XXGvertex_oport_oport|924|0|1493|0|{2|error|}567|570|}
{2010006001|XXGobject_psameas_object|925|0|1495|0|{metadata|error_metadata|1|0|}570|567|}
{2010212001|XXGvertex_oport_oport|926|0|1496|0|{3|log|}567|571|}
{2010006001|XXGobject_psameas_object|927|0|1498|0|{metadata|log_metadata|1|0|}571|567|}
{2010211001|XXGvertex_iport_iport|928|0|1499|0|{0|in|}567|572|}
{2010006001|XXGobject_psameas_object|929|0|1501|0|{metadata|in_metadata|1|0|}572|567|}
{2010601001|XXGgraph_vertex_vertex|930|0|1502|0|{Sort_for_Dedup|}506|573|}
{2010212001|XXGvertex_oport_oport|931|0|1504|0|{0|out|}573|574|}
{2010213001|XXGoport_dst_flow|932|0|1506|0|{0|}574|517|}
{2010211001|XXGvertex_iport_iport|933|0|1507|0|{0|in|}573|575|}
{2010214001|XXGiport_src_flow|934|0|1509|0|{0|}575|518|}
{2010007001|XXGobject_proto_object|935|0|1510|0|{}573|576|}
{2010212001|XXGvertex_oport_oport|936|0|1512|0|{0|out|}576|577|}
{2010006001|XXGobject_psameas_object|937|0|1514|0|{metadata|out_metadata|1|0|}577|576|}
{2010211001|XXGvertex_iport_iport|938|0|1515|0|{0|in|}576|578|}
{2010006001|XXGobject_psameas_object|939|0|1517|0|{metadata|in_metadata|1|0|}578|576|}
{2010601001|XXGgraph_vertex_vertex|940|0|1518|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}506|579|}
{2010212001|XXGvertex_oport_oport|941|0|1520|0|{0|out|}579|580|}
{2010213001|XXGoport_dst_flow|942|0|1522|0|{0|}580|521|}
{2010211001|XXGvertex_iport_iport|943|0|1523|0|{0|in|}579|581|}
{2010214001|XXGiport_src_flow|944|0|1525|0|{0|}581|520|}
{2010007001|XXGobject_proto_object|945|0|1526|0|{}579|582|}
{2010212001|XXGvertex_oport_oport|946|0|1528|0|{0|out|}582|583|}
{2010006001|XXGobject_psameas_object|947|0|1530|0|{metadata|out_metadata|1|0|}583|582|}
{2010211001|XXGvertex_iport_iport|948|0|1531|0|{0|in|}582|584|}
{2010006001|XXGobject_psameas_object|949|0|1533|0|{metadata|in_metadata|1|0|}584|582|}
{2010601001|XXGgraph_vertex_vertex|950|0|1534|0|{Testing|}506|585|}
{2010605001|XXGgraph_legend_legend|951|0|1536|0|{0|}585|586|}
{2010241001|XXGlegend_face_face|952|0|1538|0|{}586|587|}
{2010604001|XXGgraph_flow_flow|953|0|1540|0|{Flow_1|}585|588|}
{2010604001|XXGgraph_flow_flow|954|0|1542|0|{Flow_8|}585|589|}
{2010601001|XXGgraph_vertex_vertex|955|0|1544|0|{Create|}585|590|}
{2010212001|XXGvertex_oport_oport|956|0|1546|0|{0|out|}590|591|}
{2010213001|XXGoport_dst_flow|957|0|1548|0|{0|}591|589|}
{2010212001|XXGvertex_oport_oport|958|0|1549|0|{1|error|}590|592|}
{2010212001|XXGvertex_oport_oport|959|0|1551|0|{2|log|}590|593|}
{2010007001|XXGobject_proto_object|960|0|1553|0|{}590|594|}
{2010212001|XXGvertex_oport_oport|961|0|1555|0|{0|out|}594|595|}
{2010006001|XXGobject_psameas_object|962|0|1557|0|{metadata|out_metadata|1|0|}595|594|}
{2010212001|XXGvertex_oport_oport|963|0|1558|0|{1|error|}594|596|}
{2010006001|XXGobject_psameas_object|964|0|1560|0|{metadata|error_metadata|1|0|}596|594|}
{2010212001|XXGvertex_oport_oport|965|0|1561|0|{2|log|}594|597|}
{2010006001|XXGobject_psameas_object|966|0|1563|0|{metadata|log_metadata|1|0|}597|594|}
{2010601001|XXGgraph_vertex_vertex|967|0|1564|0|{Dups|}585|598|}
{2010211001|XXGvertex_iport_iport|968|0|1566|0|{0|write|}598|599|}
{2010007001|XXGobject_proto_object|969|0|1568|0|{}598|600|}
{2010211001|XXGvertex_iport_iport|970|0|1570|0|{0|write|}600|601|}
{2010006001|XXGobject_psameas_object|971|0|1572|0|{metadata|write_metadata|1|0|}601|600|}
{2010601001|XXGgraph_vertex_vertex|972|0|1573|0|{Merge|}585|602|}
{2010212001|XXGvertex_oport_oport|973|0|1575|0|{0|out|}602|603|}
{2010213001|XXGoport_dst_flow|974|0|1577|0|{0|}603|588|}
{2010211001|XXGvertex_iport_iport|975|0|1578|0|{0|in|}602|604|}
{2010007001|XXGobject_proto_object|976|0|1580|0|{}602|605|}
{2010212001|XXGvertex_oport_oport|977|0|1582|0|{0|out|}605|606|}
{2010006001|XXGobject_psameas_object|978|0|1584|0|{metadata|out_metadata|1|0|}606|605|}
{2010211001|XXGvertex_iport_iport|979|0|1585|0|{0|in|}605|607|}
{2010006001|XXGobject_psameas_object|980|0|1587|0|{metadata|in_metadata|1|0|}607|605|}
{2010601001|XXGgraph_vertex_vertex|981|0|1588|0|{Partition_by_Round_robin|}585|608|}
{2010212001|XXGvertex_oport_oport|982|0|1590|0|{0|out|}608|609|}
{2010211001|XXGvertex_iport_iport|983|0|1592|0|{0|in|}608|610|}
{2010214001|XXGiport_src_flow|984|0|1594|0|{0|}610|589|}
{2010007001|XXGobject_proto_object|985|0|1595|0|{}608|611|}
{2010212001|XXGvertex_oport_oport|986|0|1597|0|{0|out|}611|612|}
{2010006001|XXGobject_psameas_object|987|0|1599|0|{metadata|out_metadata|1|0|}612|611|}
{2010211001|XXGvertex_iport_iport|988|0|1600|0|{0|in|}611|613|}
{2010006001|XXGobject_psameas_object|989|0|1602|0|{metadata|in_metadata|1|0|}613|611|}
{2010601001|XXGgraph_vertex_vertex|990|0|1603|0|{stdout|}585|614|}
{2010211001|XXGvertex_iport_iport|991|0|1605|0|{0|write|}614|615|}
{2010214001|XXGiport_src_flow|992|0|1607|0|{0|}615|588|}
{2010007001|XXGobject_proto_object|993|0|1608|0|{}614|616|}
{2010211001|XXGvertex_iport_iport|994|0|1610|0|{0|write|}616|617|}
{2010006001|XXGobject_psameas_object|995|0|1612|0|{metadata|write_metadata|1|0|}617|616|}
{2010212001|XXGvertex_oport_oport|996|0|1613|0|{0|out|}585|618|}
{2010216002|XXGoport_binding_oport|997|0|1615|0|{.5|.5|{10|242000|104000|262000|104000|262000|124000|39000|124000|19000|124000|}6786|}618|609|}
{2010211001|XXGvertex_iport_iport|998|0|1616|0|{0|in0|}585|619|}
{2010215002|XXGiport_binding_iport|999|0|1618|0|{.5|.5|{10|322000|179000|302000|179000|302000|124000|820000|124000|840000|124000|}6784|}619|604|}
{2010211001|XXGvertex_iport_iport|1000|0|1619|0|{1|in1|}585|620|}
{2010215002|XXGiport_binding_iport|1001|0|1621|0|{.5|.5|{12|429000|60000|429000|40000|429000|40000|429000|42000|429000|42000|429000|22000|}6785|}620|599|}
{2010212001|XXGvertex_oport_oport|1002|0|1622|0|{0|out|}506|621|}
{2010216002|XXGoport_binding_oport|1003|0|1624|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6801|}621|544|}
{2010212001|XXGvertex_oport_oport|1004|0|1625|0|{1|dups|}506|622|}
{2010216002|XXGoport_binding_oport|1005|0|1627|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6802|}622|525|}
{2010211001|XXGvertex_iport_iport|1006|0|1628|0|{0|in|}506|623|}
{2010215002|XXGiport_binding_iport|1007|0|1630|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6800|}623|539|}
{2010006001|XXGobject_psameas_object|1008|0|1631|0|{INPUT_DML|write_metadata|0|0|}433|624|}
{2010211001|XXGvertex_iport_iport|1009|0|1633|0|{0|write|}624|625|}
{2010214001|XXGiport_src_flow|1010|0|1635|0|{0|}625|416|}
{2010007001|XXGobject_proto_object|1011|0|1636|0|{}624|626|}
{2010211001|XXGvertex_iport_iport|1012|0|1638|0|{0|write|}626|627|}
{2010006001|XXGobject_psameas_object|1013|0|1640|0|{metadata|write_metadata|1|0|}627|626|}
{2010601001|XXGgraph_vertex_vertex|1014|0|1641|0|{Dups|}404|624|}
{2010601001|XXGgraph_vertex_vertex|1015|0|1642|0|{Gather|}404|628|}
{2010212001|XXGvertex_oport_oport|1016|0|1644|0|{0|out|}628|629|}
{2010213001|XXGoport_dst_flow|1017|0|1646|0|{0|}629|420|}
{2010211001|XXGvertex_iport_iport|1018|0|1647|0|{0|in|}628|630|}
{2010214001|XXGiport_src_flow|1019|0|1649|0|{0|}630|418|}
{2010007001|XXGobject_proto_object|1020|0|1650|0|{}628|631|}
{2010212001|XXGvertex_oport_oport|1021|0|1652|0|{0|out|}631|632|}
{2010006001|XXGobject_psameas_object|1022|0|1654|0|{metadata|out_metadata|1|0|}632|631|}
{2010211001|XXGvertex_iport_iport|1023|0|1655|0|{0|in|}631|633|}
{2010006001|XXGobject_psameas_object|1024|0|1657|0|{metadata|in_metadata|1|0|}633|631|}
{2010601001|XXGgraph_vertex_vertex|1025|0|1658|0|{Gather_|}404|634|}
{2010212001|XXGvertex_oport_oport|1026|0|1660|0|{0|out|}634|635|}
{2010211001|XXGvertex_iport_iport|1027|0|1662|0|{0|in|}634|636|}
{2010214001|XXGiport_src_flow|1028|0|1664|0|{0|}636|417|}
{2010214001|XXGiport_src_flow|1029|0|1665|0|{1|}636|420|}
{2010007001|XXGobject_proto_object|1030|0|1666|0|{}634|637|}
{2010212001|XXGvertex_oport_oport|1031|0|1668|0|{0|out|}637|638|}
{2010006001|XXGobject_psameas_object|1032|0|1670|0|{metadata|out_metadata|1|0|}638|637|}
{2010211001|XXGvertex_iport_iport|1033|0|1671|0|{0|in|}637|639|}
{2010006001|XXGobject_psameas_object|1034|0|1673|0|{metadata|in_metadata|1|0|}639|637|}
{2010601001|XXGgraph_vertex_vertex|1035|0|1674|0|{Map_to_Output|}404|640|}
{2010212001|XXGvertex_oport_oport|1036|0|1676|0|{0|source|}640|641|}
{2010213001|XXGoport_dst_flow|1037|0|1678|0|{0|}641|419|}
{2010212001|XXGvertex_oport_oport|1038|0|1679|0|{1|clean|}640|642|}
{2010213001|XXGoport_dst_flow|1039|0|1681|0|{0|}642|414|}
{2010212001|XXGvertex_oport_oport|1040|0|1682|0|{2|lkp|}640|643|}
{2010213001|XXGoport_dst_flow|1041|0|1684|0|{0|}643|413|}
{2010212001|XXGvertex_oport_oport|1042|0|1685|0|{3|reject0|}640|644|}
{2010212001|XXGvertex_oport_oport|1043|0|1687|0|{4|reject1|}640|645|}
{2010212001|XXGvertex_oport_oport|1044|0|1689|0|{5|reject2|}640|646|}
{2010212001|XXGvertex_oport_oport|1045|0|1691|0|{6|error0|}640|647|}
{2010212001|XXGvertex_oport_oport|1046|0|1693|0|{7|error1|}640|648|}
{2010212001|XXGvertex_oport_oport|1047|0|1695|0|{8|error2|}640|649|}
{2010212001|XXGvertex_oport_oport|1048|0|1697|0|{9|log|}640|650|}
{2010211001|XXGvertex_iport_iport|1049|0|1699|0|{0|in|}640|651|}
{2010007001|XXGobject_proto_object|1050|0|1701|0|{}640|652|}
{2010212001|XXGvertex_oport_oport|1051|0|1703|0|{0|source|}652|653|}
{2010006001|XXGobject_psameas_object|1052|0|1705|0|{metadata|out0_metadata|1|0|}653|652|}
{2010006001|XXGobject_psameas_object|1053|0|1706|0|{transform0|transform0|1|0|}653|652|}
{2010212001|XXGvertex_oport_oport|1054|0|1707|0|{1|clean|}652|654|}
{2010006001|XXGobject_psameas_object|1055|0|1709|0|{metadata|out1_metadata|1|0|}654|652|}
{2010006001|XXGobject_psameas_object|1056|0|1710|0|{transform1|transform1|1|0|}654|652|}
{2010212001|XXGvertex_oport_oport|1057|0|1711|0|{2|lkp|}652|655|}
{2010006001|XXGobject_psameas_object|1058|0|1713|0|{metadata|out2_metadata|1|0|}655|652|}
{2010006001|XXGobject_psameas_object|1059|0|1714|0|{transform2|transform2|1|0|}655|652|}
{2010212001|XXGvertex_oport_oport|1060|0|1715|0|{3|reject0|}652|656|}
{2010006001|XXGobject_psameas_object|1061|0|1717|0|{metadata|reject0_metadata|1|0|}656|652|}
{2010212001|XXGvertex_oport_oport|1062|0|1718|0|{4|reject1|}652|657|}
{2010006001|XXGobject_psameas_object|1063|0|1720|0|{metadata|reject1_metadata|1|0|}657|652|}
{2010212001|XXGvertex_oport_oport|1064|0|1721|0|{5|reject2|}652|658|}
{2010006001|XXGobject_psameas_object|1065|0|1723|0|{metadata|reject2_metadata|1|0|}658|652|}
{2010212001|XXGvertex_oport_oport|1066|0|1724|0|{6|error0|}652|659|}
{2010006001|XXGobject_psameas_object|1067|0|1726|0|{metadata|error0_metadata|1|0|}659|652|}
{2010212001|XXGvertex_oport_oport|1068|0|1727|0|{7|error1|}652|660|}
{2010006001|XXGobject_psameas_object|1069|0|1729|0|{metadata|error1_metadata|1|0|}660|652|}
{2010212001|XXGvertex_oport_oport|1070|0|1730|0|{8|error2|}652|661|}
{2010006001|XXGobject_psameas_object|1071|0|1732|0|{metadata|error2_metadata|1|0|}661|652|}
{2010212001|XXGvertex_oport_oport|1072|0|1733|0|{9|log|}652|662|}
{2010006001|XXGobject_psameas_object|1073|0|1735|0|{metadata|log_metadata|1|0|}662|652|}
{2010211001|XXGvertex_iport_iport|1074|0|1736|0|{0|in|}652|663|}
{2010006001|XXGobject_psameas_object|1075|0|1738|0|{metadata|in_metadata|1|0|}663|652|}
{2010601001|XXGgraph_vertex_vertex|1076|0|1739|0|{Merge|}404|664|}
{2010212001|XXGvertex_oport_oport|1077|0|1741|0|{0|out|}664|665|}
{2010213001|XXGoport_dst_flow|1078|0|1743|0|{0|}665|417|}
{2010211001|XXGvertex_iport_iport|1079|0|1744|0|{0|in|}664|666|}
{2010214001|XXGiport_src_flow|1080|0|1746|0|{0|}666|415|}
{2010007001|XXGobject_proto_object|1081|0|1747|0|{}664|667|}
{2010212001|XXGvertex_oport_oport|1082|0|1749|0|{0|out|}667|668|}
{2010006001|XXGobject_psameas_object|1083|0|1751|0|{metadata|out_metadata|1|0|}668|667|}
{2010211001|XXGvertex_iport_iport|1084|0|1752|0|{0|in|}667|669|}
{2010006001|XXGobject_psameas_object|1085|0|1754|0|{metadata|in_metadata|1|0|}669|667|}
{2010212001|XXGvertex_oport_oport|1086|0|1755|0|{0|source|}404|670|}
{2010216002|XXGoport_binding_oport|1087|0|1757|0|{.5|1.0|{8|840000|104000|860000|104000|890000|104000|910000|104000|}9906|}670|422|}
{2010212001|XXGvertex_oport_oport|1088|0|1758|0|{1|clean|}404|671|}
{2010216002|XXGoport_binding_oport|1089|0|1760|0|{.5|1.0|{12|835000|229000|855000|229000|890000|229000|890000|269000|890000|269000|910000|269000|}9907|}671|428|}
{2010212001|XXGvertex_oport_oport|1090|0|1761|0|{2|lookup|}404|672|}
{2010216002|XXGoport_binding_oport|1091|0|1763|0|{.5|.5|{12|862000|384000|882000|384000|886000|384000|886000|439000|890000|439000|910000|439000|}9908|}672|635|}
{2010211001|XXGvertex_iport_iport|1092|0|1764|0|{0|in0|}404|673|}
{2010215002|XXGiport_binding_iport|1093|0|1766|0|{.5|.5|{12|67000|229000|47000|229000|43000|229000|43000|269000|39000|269000|19000|269000|}9905|}673|651|}
{2010109001|XXGobject_property_value|1094|0|1767|0|{0|TrackingThumbprint|72|}1|674|}
