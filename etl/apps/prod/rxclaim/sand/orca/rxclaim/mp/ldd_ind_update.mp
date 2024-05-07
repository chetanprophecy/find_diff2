@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|9|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|206|rel_count|405|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|DB_RXCLAIM_DBC|$DB_RXCLAIM_DB/$DB_RXCLAIM_DBMS.rxclaim.main.dbc|3|9|RFK||{0|}}
{30001002|XXparameter|DB_RXCLAIM_STAGING_DBC|$DB_RXCLAIM_DB/$DB_RXCLAIM_DBMS.rxclaim.stg.dbc|3|9|RFK||{0|}}
{30001002|XXparameter|LDD_INSERT_FILE_NAME|$[ (date("YYYYMMDD"))(today() ) ]|3|9|RFK||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|ldd_ind_update|npaluri1|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1771000|716000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.2.0|{5|1|1|1|1|1|}Job 'ldd_ind_update' Execution Status Report

Job completed successfully at Tuesday, June 27, 2023 21:37:36
Run performed by user npaluri1
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@IDW_QA_Mahesh||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@0|.5|.5|{0|}1701|17|}}
{2010210004|XXGflow|6|0|11|0|{@{}@0|.5|.5|{0|}1697|17|}}
{2010210004|XXGflow|7|0|13|0|{@{}@0|.5|.5|{0|}1680|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@0|.5|.5|{0|}1634|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@0|.5|.5|{0|}1682|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@0|.5|.5|{0|}1683|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@0|.5|.5|{0|}1675|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@0|.5|.5|{0|}1690|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@0|.5|.5|{0|}1703|2578|}}
{2010210004|XXGflow|14|0|27|0|{@{}@0|.5|.5|{0|}1644|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@0|.5|.5|{0|}1669|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@0|.5|.5|{0|}1631|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@0|.5|.5|{0|}1643|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@0|.5|.5|{0|}1698|17|}}
{2010210004|XXGflow|19|0|37|0|{@{}@0|.5|.5|{0|}1632|17|}}
{2010210004|XXGflow|20|0|39|0|{@{}@0|.5|.5|{0|}1630|17|}}
{2010210004|XXGflow|21|0|41|0|{@{}@0|.5|.5|{0|}1688|17|}}
{2010210004|XXGflow|22|0|43|0|{@{}@0|.5|.5|{0|}1486|17|}}
{2010505005|XXGtvertex|23|0|45|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_Table.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 84 subkind 68 parts [vector]]]|3|9||@{0|}}
{30001002|XXparameter|config_file|$DB_RXCLAIM_DBC|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|2|$|@{0|}}
{30001002|XXparameter|table_spec_kind|select|3|1|l|@{0|}}
{30001002|XXparameter|table_spec|SELECT  C.*,string_to_int(to_char(to_date(LDD_EFF_DT,'YYYY-MM-DD'), 'YYYYMMDD'), 10) AS LDD_EFF_DT_SK,
string_to_int(to_char(to_date(LDD_TERM_DT,'YYYY-MM-DD'), 'YYYYMMDD'), 10) AS LDD_TERM_DT_SK,B.* 
FROM SANDBOX..NP_060_LDD_CUSTOM_FILE C JOIN 
ORX_IDW_DM_PRD..D_PRODUCT_ADJUD B
ON C.NDC = B.PROD_ID
WHERE FLAG='A';|3|3|c|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|/* DML Generated for SQL: SELECT  C.*,string_to_int(to_char(to_date(LDD_EFF_DT,'YYYY-MM-DD'), 'YYYYMMDD'), 10) AS LDD_EFF_DT_SK,
string_to_int(to_char(to_date(LDD_TERM_DT,'YYYY-MM-DD'), 'YYYYMMDD'), 10) AS LDD_TERM_DT_SK,B.* 
FROM SANDBOX..NP_060_LDD_CUSTOM_FILE C JOIN 
ORX_IDW_DM_PRD..D_PRODUCT_ADJUD B
ON C.NDC = B.PROD_ID
WHERE FLAG='A';
 * On: Tue Jun 27 06:08:31 2023
 */
record
  utf8 string("\\x01", maximum_length=400) gpi /*NVARCHAR(100) NOT NULL*/;
  utf8 string("\\x01", maximum_length=400) ndc /*NVARCHAR(100) NOT NULL*/;
  utf8 string("\\x01", maximum_length=400) drug_name /*NVARCHAR(100) NOT NULL*/;
  utf8 string("\\x01", maximum_length=400) therapeutic_class /*NVARCHAR(100) NOT NULL*/;
  utf8 string("\\x01", maximum_length=400) ldd_status_change = NULL("") /*NVARCHAR(100)*/;
  utf8 string("\\x01", maximum_length=400) comments = NULL("") /*NVARCHAR(100)*/;
  utf8 string("\\x01", maximum_length=400) ldd_eff_dt /*NVARCHAR(100) NOT NULL*/;
  utf8 string("\\x01", maximum_length=400) ldd_term_dt = NULL("") /*NVARCHAR(100)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) flag = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) ldd_eff_dt_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) ldd_term_dt_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) prod_adjud_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) prod_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) prod_id_qlfr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=70) prod_nm = NULL("") /*VARCHAR(70)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8) ahfs_cd = NULL("") /*VARCHAR(8)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_3rd_prty_excpn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11) drg_admin_rte_hitsb_desc = NULL("") /*VARCHAR(11)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_clsfctn_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_dea_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) drg_drg_intrctn_desc = NULL("") /*VARCHAR(80)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_fda_thrpc_eqvlc_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_grp_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30) drg_lbl_nm = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_maint_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_maint_src = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_mfrr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5) drg_ndc_lblr_cd = NULL("") /*VARCHAR(5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_ndc_pkg_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_ndc_prod_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11) drg_ndc_id = NULL("") /*VARCHAR(11)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_rx_otc_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) drg_stat_cd = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) drg_strngth_qty = NULL("") /*DECIMAL(11,3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_strngth_uom_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6) drg_sub_class_cd = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_unit_dose_use_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) gcn_no = NULL("") /*INTEGER*/;
  decimal("\\x01",0) gcn_seq_no = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=60) gen_nm = NULL("") /*VARCHAR(60)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) gen_medspn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) gen_ind_ovrd_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) gpi_list_qlfr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14) gpi_no = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_grp_gpi_02_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_class_gpi_04_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6) drg_sub_class_gpi_06_cd = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8) drg_bsic_nm_gpi_08_cd = NULL("") /*VARCHAR(8)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_extd_nm_gpi_10_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12) drg_dosag_frm_gpi_12_cd = NULL("") /*VARCHAR(12)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) dsg_frm_id = NULL("") /*VARCHAR(4)*/;
  decimal("\\x01",0) dise_cat_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) dise_cat_nm /*VARCHAR(80) NOT NULL*/;
  decimal("\\x01",0) thrpc_class_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) thrpc_class_nm /*VARCHAR(80) NOT NULL*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) wac_amt = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) wkrs_comp_alt_prod_cd = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) wkrs_comp_alt_prod_typ_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) prod_pref_list_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) admin_rte_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0) src_env_sk /*BIGINT NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") insert_ts /*TIMESTAMP(6) NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") update_ts /*TIMESTAMP(6) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) insert_uid = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) update_uid = NULL("") /*VARCHAR(20)*/;
  decimal("\\x01",0) run_id = NULL("") /*BIGINT*/;
  decimal("\\x01",0) rec_stat_cd = NULL("") /*BYTEINT*/;
  decimal("\\x01",0) prod_status_rule_tbl_id_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_ldd_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_biosim_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) sec_flg = NULL("") /*SMALLINT*/;
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
}}@0|Input Table|30000|60000|0|0|0|0|1702|Custom_File|Ab Initio Software|Built-in 2.2:|1|100|0||6||37121|}}
{2010203004|XXGoport|24|0|47|0|{@{}@0|0|0|0|read|0.0|@@@2448|0|}}
{2010203004|XXGoport|25|0|50|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010505005|XXGtvertex|26|0|52|0|{Unloads data records from a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|HelpID|HICOMP_INPUT_TABLE|3|2|H$||{0|}}
{30001002|XXparameter|config_file||22|2|RFf$||{0|}}
{30001002|XXparameter|table_spec||32|3|RFc||{0|}}
{30001002|XXparameter|table_spec_kind|table|15|1|RFl||{3|table|insert|select|}}
{30001002|XXparameter|db_is_ole|value dbms mssql True value dbms msjet True value dbms msaccess True value dbms oledb True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ora_interface.condition|param_exact dbms oracle mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface_new|FastExport|15|1|Fl|Unload data via api or utility|{5|api|FastExport|PT_export|PT_selector|PT_api_export|}}
{30001002|XXparameter|ter_interface_new.condition|param_exact dbms teradata mode input version 2.12:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface|sameas ter_interface_new|3|13|v||{0|}}
{30001002|XXparameter|ter_interface.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2eee_interface.condition|param_exact dbms db2eee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2ee_interface.condition|param_exact dbms db2ee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2_interface.condition|param_exact dbms db2 mode input version 3.2.4.r21:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss_interface_old.condition|param_exact dbms db2uss mode input version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss_interface.condition|param_exact dbms db2uss mode input version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_impl|sameas db2uss_interface sameas db2uss_interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss_interface_impl.condition|param_exact dbms db2uss mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mssql_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|mssql_interface.condition|param_exact dbms mssql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msjet_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msjet_interface.condition|param_exact dbms msjet mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msaccess_interface.condition|param_exact dbms msaccess mode input|3|15|P?|@{0|}}
{30001002|XXparameter|oledb_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|oledb_interface.condition|param_exact dbms oledb mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ole_interface|sameas mssql_interface sameas msjet_interface sameas msaccess_interface sameas oledb_interface|3|13|v||{0|}}
{30001002|XXparameter|ole_interface.condition|param_exact db_is_ole True mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_interface.condition|param_exact dbms odbc mode input|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|greenplum_interface.condition|param_exact dbms greenplum mode input|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|postgresql_interface.condition|param_exact dbms postgresql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|psqlodbc_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|psqlodbc_interface.condition|param_exact dbms psqlodbc mode input|3|15|P?|@{0|}}
{30001002|XXparameter|redshift_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|redshift_interface.condition|param_exact dbms redshift mode input|3|15|P?|@{0|}}
{30001002|XXparameter|snow_interface|api|15|1|Fl|Unload data via api or utility|{2|api|staged_unload|}}
{30001002|XXparameter|snow_interface.condition|param_exact dbms snowflake mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybase_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|sybase_interface.condition|param_exact dbms sybase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq_interface.condition|param_exact dbms sybaseiq mode input|3|15|P?|@{0|}}
{30001002|XXparameter|informix_interface|api|15|1|Fl|Unload data via api or utility|{4|api|dbaccess_serial|dbaccess_xps|pload|}}
{30001002|XXparameter|informix_interface.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ims_interface_old.condition|param_exact dbms ims mode input version :3.1.6.r26|3|15|P?|@{0|}}
{30001002|XXparameter|ims_interface|api|15|1|Fl|Unload data via api (local) or via IMS connect(remote) |{2|api|ims_connect|}}
{30001002|XXparameter|ims_interface.condition|param_exact dbms ims mode input version 3.1.6.r27:|3|15|P?|@{0|}}
{30001002|XXparameter|adabas_interface|api|15|1|Fl|Unload data via api or from backup tape|{2|api|backup_tape|}}
{30001002|XXparameter|adabas_interface.condition|param_exact dbms adabas mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mongo_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|mongo_interface.condition|param_exact dbms mongo mode input version 3.2.3.r18.0:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|hbase_interface.condition|param_exact dbms hbase mode input version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|cassandra_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|cassandra_interface.condition|param_exact dbms cassandra mode input version 3.3.2.r8:|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|nza_interface_old.condition|param_exact dbms netezza mode input version :2.15.7.m99|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface|api|15|1|Fl|Unload data via api or remote external table|{2|api|external_table|}}
{30001002|XXparameter|nza_interface.condition|param_exact dbms netezza mode input version 2.15.8:|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_impl|sameas nza_interface sameas nza_interface_old|3|13|v||{0|}}
{30001002|XXparameter|nza_interface_impl.condition|param_exact dbms netezza mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2_400_interface.condition|param_exact dbms db2_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_400_interface.condition|param_exact dbms odbc_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|aster_interface|api|15|1|Fl|Unload data via api or utility|{2|api|ncluster_export|}}
{30001002|XXparameter|aster_interface.condition|param_exact dbms aster mode input|3|15|P?|@{0|}}
{30001002|XXparameter|hana_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|hana_interface.condition|param_exact dbms hana mode input version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|jdbc_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|jdbc_interface.condition|param_exact dbms jdbc mode input version 3.3.2.r8:|3|15|P?|@{0|}}
{30001002|XXparameter|hive_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|hive_interface.condition|param_exact dbms hive mode input version 3.3.4:|3|15|P?|@{0|}}
{30001002|XXparameter|impala_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|impala_interface.condition|param_exact dbms impala mode input version 3.3.5.r19:|3|15|P?|@{0|}}
{30001002|XXparameter|ora__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|ora__interface.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter__interface|Multiload|15|1|Fl|Load data using api or utility|{11|api|Fastload|Multiload|Tpump|PT_load|PT_update|PT_stream|PT_inserter|PT_api_load|PT_api_update|PT_api_stream|}}
{30001002|XXparameter|ter__interface.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2eee__interface.condition|param_exact dbms db2eee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2ee__interface.condition|param_exact dbms db2ee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2__interface.condition|param_exact dbms db2 mode output version 3.2.4.r21:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_old|api|15|1|Fl|Load data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss__interface_old.condition|param_exact dbms db2uss mode output version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface|api|15|1|Fl|Load data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss__interface.condition|param_exact dbms db2uss mode output version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_impl|sameas db2uss__interface sameas db2uss__interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss__interface_impl.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface|utility|15|1|Fl|Load data using api, utility or bulkload|{3|api|utility|bulkload|}}
{30001002|XXparameter|mssql__interface.condition|param_exact dbms mssql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|mssql__interface_bad_choice.condition|param_exact dbms mssql mode output param_exact mssql__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|msjet__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msjet__interface.condition|param_exact dbms msjet mode output|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msaccess__interface.condition|param_exact dbms msaccess mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface|api|15|1|Fl|Load data using api or bulkload|{2|api|bulkload|}}
{30001002|XXparameter|oledb__interface.condition|param_exact dbms oledb mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|oledb__interface_bad_choice.condition|param_exact dbms oledb mode output param_exact oledb__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|ole__interface|sameas mssql__interface sameas msjet__interface sameas msaccess__interface sameas oledb__interface|3|13|v||{0|}}
{30001002|XXparameter|ole__interface.condition|param_exact db_is_ole True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|odbc__interface.condition|param_exact dbms odbc mode output|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum__interface|copy|15|1|Fl|Load data using api or utility|{3|api|copy|gpfdist|}}
{30001002|XXparameter|greenplum__interface.condition|param_exact dbms greenplum mode output|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql__interface|copy|15|1|Fl|Load data using api or utility|{2|api|copy|}}
{30001002|XXparameter|postgresql__interface.condition|param_exact dbms postgresql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|psqlodbc__interface|api|15|1|Fl|For utility loads, manually set the DBMS type parameter on the Data pane to Postgresql, Greenplum or Redshift and press 'NO' when asked if you want to resolve a conflict.  Do NOT change the dbms tag in the dbc file itself.|{1|api|}}
{30001002|XXparameter|psqlodbc__interface.condition|param_exact dbms psqlodbc mode output|3|15|P?|@{0|}}
{30001002|XXparameter|redshift__interface|copy|15|1|Fl|Load data using api or utility|{3|api|copy|copy_via_ssh|}}
{30001002|XXparameter|redshift__interface.condition|param_exact dbms redshift mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybase__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybase__interface.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq__interface.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|informix__interface|api|15|1|Fl|Load data using api or utility|{5|api|dbload|dbaccess_xps|pload|dbaccess_serial|}}
{30001002|XXparameter|informix__interface.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|adabas__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|adabas__interface.condition|param_exact dbms adabas mode output|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface_old|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|nza__interface_old.condition|param_exact dbms netezza mode output version :3.2.3.m99|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface|external_table|15|1|Fl|Load data using api, utility, or remote external table|{3|api|utility|external_table|}}
{30001002|XXparameter|nza__interface.condition|param_exact dbms netezza mode output version 3.2.4:|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface_impl|sameas nza__interface sameas nza__interface_old|3|13|v||{0|}}
{30001002|XXparameter|nza__interface_impl.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2_400__interface.condition|param_exact dbms db2_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|odbc_400__interface.condition|param_exact dbms odbc_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|aster__interface|api|15|1|Fl|Load data using api or utility|{2|api|ncluster_loader|}}
{30001002|XXparameter|aster__interface.condition|param_exact dbms aster mode output|3|15|P?|@{0|}}
{30001002|XXparameter|snow__interface|api|15|1|Fl|Load data using api mode or files-in-a-stage|{2|api|staged_load|}}
{30001002|XXparameter|snow__interface.condition|param_exact dbms snowflake mode output|3|15|P?|@{0|}}
{30001002|XXparameter|hana__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|hana__interface.condition|param_exact dbms hana mode output version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|hbase__interface.condition|param_exact dbms hbase mode output version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|cassandra__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|cassandra__interface.condition|param_exact dbms cassandra mode output version 3.3.2.r8:|3|15|P?|@{0|}}
{30001002|XXparameter|jdbc__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|jdbc__interface.condition|param_exact dbms jdbc mode output version 3.3.2.r8:|3|15|P?|@{0|}}
{30001002|XXparameter|hive__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|hive__interface.condition|param_exact dbms hive mode output version 3.3.4:|3|15|P?|@{0|}}
{30001002|XXparameter|impala__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|impala__interface.condition|param_exact dbms impala mode output version 3.3.5.r19:|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_param_must_exist|1|3|2|H$||{0|}}
{30001002|XXparameter|not_ims|value dbms ims False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_adabas|value dbms ims False value dbms adabas False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_unusual_dbms|value dbms ims False value dbms adabas False value dbms mongo False value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_iq|value dbms sybaseiq False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_hbase|value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_cassandra|value dbms cassandra False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|is_iq_util|value not_iq True False value sybaseiq_interface api False default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_iqutil|value not_ims False False value is_iq_util True False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_num_error|value interface_out api False value dbms netezza True value dbms oracle True value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms db2uss True value dbms sybase True value dbms sybaseiq True value dbms db2_400 True value dbms odbc_400 True value informix__interface dbload True value informix__interface pload True value informix__interface dbaccess_xps True value mssql__interface utility True value dbms cassandra True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_rows_per_commit|value interface_out api False value interface_out bulkload False value dbms oracle True value dbms mssql True value dbms sybase True value dbms sybaseiq True value informix__interface dbload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|db2eee_or_db2ee|value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_native_options|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value nza__interface_impl utility True value nza__interface_impl external_table True value nza__interface_impl api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False value db2ee__interface utility True value db2ee__interface api False value db2eee__interface utility True value db2eee__interface api False value db2__interface utility True value db2__interface api False value db2uss__interface_impl utility True value db2uss__interface_impl api False value db2uss_interface_impl api False value utility DSNTIIAUL False value utility UNLOAD True value nza_interface external_table True value nza_interface api False value cassandra__interface utility True value cassandra__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_control_file|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite|True|13|1|l||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite.condition|mode input param_exact not_unusual_dbms True param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ablocal_expr|value nza_interface external_table True value utility DSNTIAUL True value utility UNLOAD False value old_ablocal_prerequisite True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_gen_ldr_datatypes|value db2eee_or_db2ee True True value dbms db2uss True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ftype_pref_nondelimited|value field_type_preference delimited False value field_type_preference fixed True value field_type_preference variable True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_batchsize|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|no_partition_name|True|13|1|l||{0|}}
{30001002|XXparameter|no_partition_name.condition|param_exact dbms sybase version :3.1.1|3|15|P?|@{0|}}
{30001002|XXparameter|supports_partition_name|value ora__interface utility True value ora__interface api False value no_partition_name True False value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_reject_threshold|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_package|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_logging|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_logfile|value ter_util True True value interface_out copy True value interface_out copy_via_ssh True value interface_out gpfdist True value interface_out staged_load True value interface_out ncluster_loader True value interface_in staged_unload True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_api_load_transforms|value interface_out api True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_api_load_transforms.condition|version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_api_encrypt_data|True|13|1|l||{0|}}
{30001002|XXparameter|ter_api_encrypt_data.condition|param_exact dbms teradata version 3.0.2:|3|15|P?|@{0|}}
{30001002|XXparameter|api_encrypt_data_helper|sameas ter_api_encrypt_data default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_encrypt_data|value api_encrypt_data_helper True True value ter_util True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|interface_in|sameas ora_interface sameas ter_interface sameas db2eee_interface sameas db2ee_interface sameas db2_interface sameas db2uss_interface_impl sameas db2_400_interface sameas ole_interface sameas odbc_interface sameas odbc_400_interface sameas snow_interface sameas sybase_interface sameas sybaseiq_interface sameas informix_interface sameas ims_interface_old sameas ims_interface sameas adabas_interface sameas nza_interface_impl sameas mysql_interface sameas postgresql_interface sameas psqlodbc_interface sameas greenplum_interface sameas redshift_interface sameas vertica_interface sameas aster_interface sameas mongo_interface sameas hana_interface sameas hbase_interface sameas cassandra_interface sameas jdbc_interface sameas hive_interface sameas impala_interface|3|13|v||{0|}}
{30001002|XXparameter|interface_in.condition|mode input|3|15|P?|@{0|}}
{30001002|XXparameter|interface_out|sameas ora__interface sameas ter__interface sameas db2eee__interface sameas db2ee__interface sameas db2__interface sameas db2uss__interface_impl sameas db2_400__interface sameas ole__interface sameas odbc__interface sameas odbc_400__interface sameas sybase__interface sameas sybaseiq__interface sameas informix__interface sameas adabas__interface sameas nza__interface_impl sameas mysql__interface sameas psqlodbc__interface sameas postgresql__interface sameas greenplum__interface sameas redshift__interface sameas vertica__interface sameas aster__interface sameas snow__interface sameas hana__interface sameas hbase__interface sameas cassandra__interface sameas jdbc__interface sameas hive__interface sameas impala__interface|3|13|v||{0|}}
{30001002|XXparameter|interface_out.condition|mode output|3|15|P?|@{0|}}
{30001002|XXparameter|interface|sameas interface_in sameas interface_out|3|13|Kv||{0|}}
{30001002|XXparameter|fixed_size_dml|False|13|1|RFOl|Generate fixed size DML when possible|{0|}}
{30001002|XXparameter|fixed_size_dml.condition|param_exact not_ims_or_adabas True version :2.12.2.m4|3|15|P?|@{0|}}
{30001002|XXparameter|field_type_preference|delimited|15|1|RFKl|Format of generated dml|{3|delimited|variable|fixed|}}
{30001002|XXparameter|field_type_preference.condition|param_exact not_unusual_dbms True version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|generate_loader_datatypes|False|13|1|FKl|Any non-delimited data types in generated DML will be compatible with the utility loader.|{0|}}
{30001002|XXparameter|generate_loader_datatypes.condition|param_exact supports_gen_ldr_datatypes True param_exact ftype_pref_nondelimited True version 2.14.64:|3|15|P?|@{0|}}
{30001002|XXparameter|column_delimiter||3|2|FK$|Default generated column delimiter|{0|}}
{30001002|XXparameter|column_delimiter.condition|param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|encrypt_data|False|13|1|FKl|Encrypt data between database client and server (if possible)|{0|}}
{30001002|XXparameter|encrypt_data.condition|param_exact supports_encrypt_data True|3|15|P?|@{0|}}
{30001002|XXparameter|dml_with_default_values|none|15|1|RFKl|Generate dml with db default values (if possible)|{3|none|null_preferred|default_preferred|}}
{30001002|XXparameter|dml_with_default_values.condition|param_exact not_unusual_dbms True param_exact not_cassandra True version 3.2.3.r18.0:|3|15|P?|@{0|}}
{30001002|XXparameter|logfile||18|2|FK$|Name of file to store utility log information (optional)|{0|}}
{30001002|XXparameter|logfile.condition|param_exact supports_logfile True|3|15|P?|@{0|}}
{30001002|XXparameter|max_rows||1|2|FK$|Maximum rows to unload|{0|}}
{30001002|XXparameter|max_rows.condition|mode input param_exact not_ims_or_iqutil True|3|15|P?|@{0|}}
{30001002|XXparameter|ablocal_expr||3|2|FK$|DML expression for ABLOCAL() in select|{0|}}
{30001002|XXparameter|ablocal_expr.condition|param_exact supports_ablocal_expr True|3|15|P?|@{0|}}
{30001002|XXparameter|remove_delimiters|False|13|1|RFOl|Remove delimiters found in data|{0|}}
{30001002|XXparameter|remove_delimiters.condition|param_exact interface api mode input version 2.7: param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|delimiter_replacement||3|2|FK$|Replacement for field delimiters found in data|{0|}}
{30001002|XXparameter|delimiter_replacement.condition|param_exact interface api mode input version 2.7: param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|non_ansimode||13|1|RFKl|If true, process the select statement using Teradata semantics (like Fast Export/PT Export does); false means use Ansi semantics|{0|}}
{30001002|XXparameter|non_ansimode.condition|param_exact ter_interface api version 2.15.2:|3|15|P?|@{0|}}
{30001002|XXparameter|num_errors|50|1|2|FK$|Maximum number of errors allowed|{0|}}
{30001002|XXparameter|num_errors.condition|mode output param_exact supports_num_error True|3|15|P?|@{0|}}
{30001002|XXparameter|commitNumber||1|2|FK$|Number of records per commit checkpoint|{0|}}
{30001002|XXparameter|commitNumber.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|commitTable||24|3|FKc|Database table to store commit progress|{0|}}
{30001002|XXparameter|commitTable.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|jobid||25|3|FKc|For special purpose use only - see 'Help'|{0|}}
{30001002|XXparameter|jobid.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|ignoreDuplicates|False|13|1|Fl|if true, ignore unique constraint violations|{0|}}
{30001002|XXparameter|ignoreDuplicates.condition|mode output param_exact interface api param_exact not_hbase True param_exact not_cassandra True version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|no_actions_ok|value ignoreDuplicates True True value ignoreDuplicates False False default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|no_actions_ok.condition|mode output param_exact interface api version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize||1|2|FK$|Size of batch when using array mode|{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize.condition|mode output param_exact interface api version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|rows_per_commit||1|2|FK$|Rows per commit|{0|}}
{30001002|XXparameter|rows_per_commit.condition|mode output param_exact supports_rows_per_commit True|3|15|P?|@{0|}}
{30001002|XXparameter|batch_size|4096|1|2|FK$|Records processed in each batch|{0|}}
{30001002|XXparameter|batch_size.condition|mode output param_exact supports_batchsize True|3|15|P?|@{0|}}
{30001002|XXparameter|is_serial|False|13|1|FKl|Set to true to specify a serial load.|{0|}}
{30001002|XXparameter|is_serial.condition|mode output param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|file_type|delimited|15|1|FKl|Format of data to be loaded. If 'fixed', Output Table reformats the data to the loader's specifications.|{2|delimited|fixed|}}
{30001002|XXparameter|file_type.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.67:|3|15|P?|@{0|}}
{30001002|XXparameter|file_type_modifier||25|3|FKc|Enter desired file type modifiers.|{0|}}
{30001002|XXparameter|file_type_modifier.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|copy_target||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|copy_target.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|row_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|row_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|save_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|save_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|data_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|data_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|sort_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|sort_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|hold_quiesce|False|13|1|FKl|Set to True to leave the utility in quiesced exclusive state.|{0|}}
{30001002|XXparameter|hold_quiesce.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|cpu_parallelism|1|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|cpu_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|disk_parallelism|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|disk_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|recoverable|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|recoverable.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|indexing_mode|autoselect|15|1|FKl|Refer to DB2 UDB documentation for description.|{4|autoselect|rebuild|incremental|deferred|}}
{30001002|XXparameter|indexing_mode.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|access_level|allow_no_access|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|allow_no_access|allow_read_access|}}
{30001002|XXparameter|access_level.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_tablespace||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|use_tablespace.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.101:|3|15|P?|@{0|}}
{30001002|XXparameter|lock_with_force|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|lock_with_force.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|check_pending|deferred|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|immediate|deferred|}}
{30001002|XXparameter|check_pending.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|statsopt|none|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|none|use_profile|}}
{30001002|XXparameter|statsopt.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_exception_table|False|13|1|FKl|Set to True to use exception table.|{0|}}
{30001002|XXparameter|use_exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|exception_table||25|3|FKc|Use only if you want to explicity specify the name for the exception table.|{0|}}
{30001002|XXparameter|exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|aster_dummy|a|3|2|$||{0|}}
{30001002|XXparameter|aster_util_in|value aster_interface api False value aster_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util_in.condition|param_exact dbms aster mode input|3|15|P?|@{0|}}
{30001002|XXparameter|aster_util_out|value aster__interface api False value aster__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util_out.condition|param_exact dbms aster mode output|3|15|P?|@{0|}}
{30001002|XXparameter|aster_util|value aster_util_in True True value aster_util_out True True value aster_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util.condition|param_exact dbms aster|3|15|P?|@{0|}}
{30001002|XXparameter|uses_legacy_inheritance|False|13|1|FKl|Set to True if table uses legacy parent/child inheritance |{0|}}
{30001002|XXparameter|uses_legacy_inheritance.condition|param_exact aster_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|allow_errors|False|13|1|FKl|If true, write errors to error table OR (if false) abort load on first error|{0|}}
{30001002|XXparameter|allow_errors.condition|param_exact aster_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|error_table||3|2|FK$|User-specified errtable name (optional)|{0|}}
{30001002|XXparameter|error_table.condition|param_exact allow_errors True|3|15|P?|@{0|}}
{30001002|XXparameter|label||3|2|FK$|Optional string to identify errors from this load in error table|{0|}}
{30001002|XXparameter|label.condition|param_exact allow_errors True|3|15|P?|@{0|}}
{30001002|XXparameter|like_postg|value dbms postgresql True value dbms greenplum True value dbms redshift True value dbms Redshift True default constant False|13|13|v||{0|}}
{30001002|XXparameter|db_type|sameas dbms|3|13|Kv|psqlodbc needs this param set|{0|}}
{30001002|XXparameter|db_type.condition|mode output param_exact like_postg True|3|15|P?|@{0|}}
{30001002|XXparameter|gpfdist_log_prefix||18|2|FK$|Use this to override the log file path prefix in the gpdfdist configuration file (optional)|{0|}}
{30001002|XXparameter|gpfdist_log_prefix.condition|param_exact greenplum__interface gpfdist|3|15|P?|@{0|}}
{30001002|XXparameter|stage_name||3|2|FK$|optional name of stage.  If specified, MUST be in format defined for dbc file's default_stage parameter.|{0|}}
{30001002|XXparameter|stage_name.condition|param_exact dbms snowflake param_exact interface staged_*|3|15|P?|@{0|}}
{30001002|XXparameter|put_parallel_threads||1|2|FK$|Number of threads to use with PUT command|{0|}}
{30001002|XXparameter|put_parallel_threads.condition|param_exact dbms snowflake param_exact interface staged_load|3|15|P?|@{0|}}
{30001002|XXparameter|inf_dummy|a|3|2|$||{0|}}
{30001002|XXparameter|inf_util_in|value informix_interface api False value informix_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_in.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util_out|value informix__interface api False value informix__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_out.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util|value inf_util_in True True value inf_util_out True True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util.condition|param_exact dbms informix|3|15|P?|@{0|}}
{30001002|XXparameter|inf_use_rej|value informix__interface dbaccess_xps True value informix__interface dbload True value informix__interface pload True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_use_rej.condition|param_exact inf_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|idelim|\||3|2|FK$|One-character delimiter for Informix utilities|{0|}}
{30001002|XXparameter|idelim.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pdqpriority||3|2|FK$|DEFAULT, LOW, HIGH, ...|{0|}}
{30001002|XXparameter|pdqpriority.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|jobname||3|2|RFK$|Jobname for High-performance Load/Unload|{0|}}
{30001002|XXparameter|jobname.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|pload_job_method|new|15|1|RFKl||{3|new|overwrite|reuse|}}
{30001002|XXparameter|pload_job_method.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|isolation||3|2|FK$|'set isolation' choices: DIRTY READ, COMMITTED READ, ...|{0|}}
{30001002|XXparameter|isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|ansi_isolation|default|15|1|FKl|'set transaction' isolation choices|{5|default|READ COMMITTED|REPEATABLE READ|SERIALIZABLE|READ UNCOMMITTED|}}
{30001002|XXparameter|ansi_isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|force_raw|False|13|1|FKl|If true, temporarily alters table log mode to RAW|{0|}}
{30001002|XXparameter|force_raw.condition|param_exact inf_util_out True param_exact informix__interface dbaccess_xps|3|15|P?|@{0|}}
{30001002|XXparameter|rejectfile||3|2|RFK$|Rejectfile specification for Informix load utility|{0|}}
{30001002|XXparameter|rejectfile.condition|param_exact inf_use_rej True|3|15|P?|@{0|}}
{30001002|XXparameter|dummy1|a|3|2|$||{0|}}
{30001002|XXparameter|ter_util_in|value ter_interface api False value ter_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util_out|value ter__interface api False value ter__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util|value ter_util_in True True value ter_util_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_in|value ter_interface WB_* True value ter_interface PT_* True value ter_interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_out|value ter__interface WB_* True value ter__interface PT_* True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb|value ter_wb_in True True value ter_wb_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_fload|value ter__interface Fastload True value ter__interface WB_load True value ter__interface PT_load True value ter__interface PT_api_load True value ter__interface AB_Fastload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_fload.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_tpump|value ter__interface Tpump True value ter__interface WB_stream True value ter__interface PT_stream True value ter__interface PT_api_stream True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_tpump.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_m_or_t|value ter__interface PT_inserter False value ter_is_fload False True value ter_is_fload True False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_m_or_t.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_mload_only|value ter__interface Multiload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_mload_only.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_show_brief|value ter_m_or_t True True value ter_util_in True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_show_brief.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|brief|True|13|1|FKl|Ask utility to generate brief log info if TRUE|{0|}}
{30001002|XXparameter|brief.condition|param_exact ter_show_brief True|3|15|P?|@{0|}}
{30001002|XXparameter|sleep|6|1|2|FK$|Minutes to wait before retrying logon|{0|}}
{30001002|XXparameter|sleep.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|tenacity|0|1|2|FK$|Maximum hours to attempt logon before utility gives up|{0|}}
{30001002|XXparameter|tenacity.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|sessions||3|2|FK$|Number of  sessions|{0|}}
{30001002|XXparameter|sessions.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|instances|1|1|2|FK$|Number of Parallel Transporter operator instances|{0|}}
{30001002|XXparameter|instances.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|logtab_name||3|2|FK$|User-specified logtable name (optional)|{0|}}
{30001002|XXparameter|logtab_name.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|no_spool|False|13|1|FKl|If True, do not spool output if possible|{0|}}
{30001002|XXparameter|no_spool.condition|param_exact ter_util_in True version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|use_load_isolation|False|13|1|FKl|Use Teradata load isolation capability when loading data|{0|}}
{30001002|XXparameter|use_load_isolation.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|tablewait|0|1|2|FK$|Number of hours to wait on other load tasks before utility gives up|{0|}}
{30001002|XXparameter|tablewait.condition|param_exact ter_is_mload_only True|3|15|P?|@{0|}}
{30001002|XXparameter|vartext|False|13|1|FKl|Send data to Teradata load utility in VARTEXT mode|{0|}}
{30001002|XXparameter|vartext.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|delim|\||3|2|FK$|delimiter for Teradata load utility|{0|}}
{30001002|XXparameter|delim.condition|param_exact vartext True|3|15|P?|@{0|}}
{30001002|XXparameter|np_axsmod_dir||26|2|RFK$|Name of directory for Named Pipe AXSMOD storage (required)|{0|}}
{30001002|XXparameter|np_axsmod_dir.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|checkpoint||1|2|FK$|Checkpoint rate to be used by Teradata utility|{0|}}
{30001002|XXparameter|checkpoint.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|worktab_name||3|2|FK$|User-specified worktable name (optional)|{0|}}
{30001002|XXparameter|worktab_name.condition|param_exact ter_util_out True param_exact ter_m_or_t True param_exact ter_is_tpump False|3|15|P?|@{0|}}
{30001002|XXparameter|errtab_name||3|2|FK$|User-specified errtable name (optional) [will have 1,2.. appended]|{0|}}
{30001002|XXparameter|errtab_name.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|macrodb||3|2|FK$|Database to use for Tpump macro creation and usage|{0|}}
{30001002|XXparameter|macrodb.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|errlimit||1|2|FK$|number errors allowed|{0|}}
{30001002|XXparameter|errlimit.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|errpercent||1|2|FK$|% errors allowed|{0|}}
{30001002|XXparameter|errpercent.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_dupl_rows|False|13|1|FKl|If true, ignore duplicate rows on insert|{0|}}
{30001002|XXparameter|ignore_dupl_rows.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|serialize|False|13|1|FKl|Guarantee serializability of operations on the same key if true|{0|}}
{30001002|XXparameter|serialize.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|pack|1|1|2|FK$|# of records to pack into a Tpump request or a TPT Update buffer|{0|}}
{30001002|XXparameter|pack.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|rate||1|2|FK$|# of statements per minute to send to Teradata database|{0|}}
{30001002|XXparameter|rate.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|trace_directory||26|2|FK$|directory for trace/debug info (optional)|{0|}}
{30001002|XXparameter|trace_directory.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|axsmod_tracelevel|None|3|2|FK$|for axsmod debugging|{0|}}
{30001002|XXparameter|axsmod_tracelevel.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pt_tracelevel|None|3|2|FK$|for Parallel Transporter (was TWB) debugging|{0|}}
{30001002|XXparameter|pt_tracelevel.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|ora_util_out|value ora__interface utility True value ora__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_util_out.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oracle_max_kb||1|2|FK$|max kilobytes for each parallel unload select|{0|}}
{30001002|XXparameter|oracle_max_kb.condition|param_exact dbms oracle mode input version 2.10.12.m12:|3|15|P?|@{0|}}
{30001002|XXparameter|parallel_mode|rowid|15|1|RFKl|method of automatic parallelism|{3|rowid|subpartition|partition|}}
{30001002|XXparameter|parallel_mode.condition|param_exact dbms oracle mode input version 2.14:|3|15|P?|@{0|}}
{30001002|XXparameter|include_partitions||17|2|FKf$|Optional list of partitions to extract|{0|}}
{30001002|XXparameter|include_partitions.condition|param_exact dbms oracle mode input version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|flashback_queries|False|13|1|FKl|Employ Oracle flashback queries|{0|}}
{30001002|XXparameter|flashback_queries.condition|param_exact dbms oracle mode input version 3.2.6.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|system_change_number||1|2|FK$|optional System Change Number|{0|}}
{30001002|XXparameter|system_change_number.condition|param_exact flashback_queries True version 3.2.6.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|direct|True|13|1|RFOl|Use SQL*Loader Direct Mode|{0|}}
{30001002|XXparameter|direct.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|num_discards||1|2|FK$|# discards allowed|{0|}}
{30001002|XXparameter|num_discards.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|bindsize||1|2|FK$|SQL*Loader BINDSIZE setting|{0|}}
{30001002|XXparameter|bindsize.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|control_file||17|2|FKf$|Optional database load utility control file|{0|}}
{30001002|XXparameter|control_file.condition|param_exact supports_control_file True version 2.7:|3|15|P?|@{0|}}
{30001002|XXparameter|partition_name||3|2|FK$|Database partition name|{0|}}
{30001002|XXparameter|partition_name.condition|param_exact supports_partition_name True|3|15|P?|@{0|}}
{30001002|XXparameter|native_options||25|3|FKc|Optional commands passed directly to the database load utility.|{0|}}
{30001002|XXparameter|native_options.condition|param_exact supports_native_options True|3|15|P?|@{0|}}
{30001002|XXparameter|syb_util_out|value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|syb_util_out.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_util_out|value sybaseiq__interface utility True value sybaseiq__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|sybaseiq_util_out.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|row_delimited_by|if appropriate|15|1|FKl|Generate ROW DELIMITED BY clause in control file when appropriate.|{2|if appropriate|never|}}
{30001002|XXparameter|row_delimited_by.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|quoted_identifiers|always|15|1|FKl|Quote column names in generated control file.|{2|always|never|}}
{30001002|XXparameter|quoted_identifiers.condition|param_exact sybaseiq_util_out True version :3.0.3.r14|3|15|P?|@{0|}}
{30001002|XXparameter|supports_constraint|True|13|1|Kl||{0|}}
{30001002|XXparameter|supports_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|unique_constraint|True|13|1|FKl|If True, include UNIQUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|unique_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|null_constraint|True|13|1|FKl|If True, include NULL as a load constraint to ignore.|{0|}}
{30001002|XXparameter|null_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|foreign_key_constraint|False|13|1|FKl|If True, include FOREIGN KEY as a load constraint to ignore.|{0|}}
{30001002|XXparameter|foreign_key_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|data_value_constraint|False|13|1|FKl|If True, include DATA VALUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|data_value_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ims_api_in|value ims_interface_old api True value ims_interface api True value ims_interface ims_connect False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ims_api_in.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_remote_in|value ims_interface ims_connect True value ims_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ims_remote_in.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_api_or_remote_in|value ims_api_in True True value ims_remote_in True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|batch_mode|DLI|15|1|RFKl|Run standalone batch or in a batch message processing region|{2|DLI|BMP|}}
{30001002|XXparameter|batch_mode.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|parent_segment_data|key_only|15|1|RFKl|Unload just the keys from parents, or all the data|{2|key_only|full_segment|}}
{30001002|XXparameter|parent_segment_data.condition|param_exact ims_api_or_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|generate_unique_key|False|13|1|FKl|Generate a unique for segments with no unique key|{0|}}
{30001002|XXparameter|generate_unique_key.condition|param_exact ims_api_or_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_ims_path_command|m_db ims_path|3|2|$|Command to generate list of segments|{0|}}
{30001002|XXparameter|_ab_ims_path_command_params|config_file positional table_spec keyword|3|2|$|List of parameters for path command|{0|}}
{30001002|XXparameter|ims_path|generated _ab_ims_path_command page_change|3|13|FHv|List of segments from root to segment|{0|}}
{30001002|XXparameter|ims_path.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|ims_path.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ssa_||3|2|FK$|SSA qualifier for this segment|{0|}}
{30001002|XXparameter|ssa_.index|ims_path|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.index_name|ssa_|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_parameters||3|2|FK$|Other ims parameters|{0|}}
{30001002|XXparameter|ims_parameters.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|alternate_psbname||3|2|FK$|Alternate PSB name to use when starting DFSRRC00|{0|}}
{30001002|XXparameter|alternate_psbname.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|ims_batch_size|10|1|2|RFK$|Number of records to request per call|{0|}}
{30001002|XXparameter|ims_batch_size.condition|param_exact ims_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|file_number||1|2|FK$|Set to valid file number to bypass PREDICT for file number lookup.|{0|}}
{30001002|XXparameter|file_number.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|backup_dataset||3|2|FK$|DSN of backup tape|{0|}}
{30001002|XXparameter|backup_dataset.condition|mode input param_exact dbms adabas param_exact adabas_interface backup_tape|3|15|P?|@{0|}}
{30001002|XXparameter|file_password||3|2|FK$|Adabas password in encrypted form (m_passwd).|{0|}}
{30001002|XXparameter|file_password.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|nza_util_out|value nza__interface_impl utility True value nza__interface_impl external_table True value nza__interface_impl api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|nza_util_out.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|local_log_path||3|2|FK$|local path to log directory mapped from NPS server|{0|}}
{30001002|XXparameter|local_log_path.condition|version :3.2.0|3|15|P?|@{0|}}
{30001002|XXparameter|server_log_path||3|2|FK$|path on NPS server to log directory|{0|}}
{30001002|XXparameter|server_log_path.condition|version :3.2.0|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_util_out|value db2uss__interface_impl utility True value db2uss__interface_impl api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|db2uss_util_out.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|utility|DSNTIAUL|15|1|FKl|IBM utility used to unload the database|{2|DSNTIAUL|UNLOAD|}}
{30001002|XXparameter|utility.condition|mode input param_exact db2uss_interface_impl utility version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|supports_utility_id|value db2uss_util_out True True value utility UNLOAD True value utility DSNTIAUL False default constant False|13|13|v||{0|}}
{30001002|XXparameter|utility_ID||3|2|FK$|Unique ID for DB2 utility job|{0|}}
{30001002|XXparameter|utility_ID.condition|param_exact interface utility param_exact supports_utility_id True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|temp_dataset||28|2|FK$|MVS dataset for UNLOAD output|{0|}}
{30001002|XXparameter|temp_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|image_copy_dataset||28|2|FK$|Optional DB/2 image copy dataset or datasets from which to unload data|{0|}}
{30001002|XXparameter|image_copy_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|tablespace||3|2|FK$|If unloading from an image copy dataset, the name of the tablespace which contains the data from the target table|{0|}}
{30001002|XXparameter|tablespace.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|partition||3|2|FK$|If unloading from a partitioned table, the partition number or range to unload|{0|}}
{30001002|XXparameter|partition.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 3.5.2.r9:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSREC_dataset||28|2|FK$|MVS dataset for utility input|{0|}}
{30001002|XXparameter|SYSREC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSDISC_dataset||28|2|FK$|Optional MVS dataset for utility rejects|{0|}}
{30001002|XXparameter|SYSDISC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSERR_dataset||28|2|FK$|Optional MVS dataset for utility error output|{0|}}
{30001002|XXparameter|SYSERR_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSUT1_dataset||28|2|FK$|Optional MVS work dataset for sort input|{0|}}
{30001002|XXparameter|SYSUT1_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SORTOUT_dataset||28|2|FK$|Optional MVS work dataset for sort output|{0|}}
{30001002|XXparameter|SORTOUT_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSMAP_dataset||28|2|FK$|Optional MVS work dataset for utility error processing|{0|}}
{30001002|XXparameter|SYSMAP_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSCOPY_dataset||28|2|FK$|Optional MVS dataset for an inline image copy|{0|}}
{30001002|XXparameter|SYSCOPY_dataset.condition|param_exact db2uss_util_out True version 3.5.3.r11:|3|15|P?|@{0|}}
{30001002|XXparameter|use_mssql_bulk_out|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|keep_identity|False|13|1|FKl|When "True" user must provide values for identity columns.|{0|}}
{30001002|XXparameter|keep_identity.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|keep_nulls|False|13|1|FKl|When "true" a null input value will store a null, not the column default value.|{0|}}
{30001002|XXparameter|keep_nulls.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|hints||3|2|FK$|The same as the "-h" option to bcp.|{0|}}
{30001002|XXparameter|hints.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|as400_util_out|value db2_400__interface utility True value db2_400__interface api False value odbc_400__interface utility True value odbc_400__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|hostname||3|2|FK$|Name of AS/400 system|{0|}}
{30001002|XXparameter|hostname.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|rebuild_loader|False|13|1|FKl|If True, rebuild the RPG table loader program on the AS/400.|{0|}}
{30001002|XXparameter|rebuild_loader.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_data_path||3|2|FK$|Location, on the AS/400, where data will be landed|{0|}}
{30001002|XXparameter|ifs_data_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_dml_path||3|2|FK$|Location, on the AS/400, where dml files will be landed|{0|}}
{30001002|XXparameter|ifs_dml_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|mongo_api_in|value mongo_interface api True default constant False|13|13|v||{0|}}
{30001002|XXparameter|mongo_api_in.condition|param_exact dbms mongo mode input|3|15|P?|@{0|}}
{30001002|XXparameter|continue_on_bad_type|False|13|1|RFKl|False will abort if a Mongo document is read which cannot be translated into the port DML.  True will skip the document and continue processing.|{0|}}
{30001002|XXparameter|continue_on_bad_type.condition|param_exact mongo_api_in True version 3.2.3.r18:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_api|value interface_out utility False value dbms hbase True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|hbase_utility|value interface_out utility True value dbms hbase True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|filterstring||3|2|FK$|Thrift filterstring|{0|}}
{30001002|XXparameter|filterstring.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|columns||3|2|FK$|List of column names to load or unload; names are <family>:<qualifier> and separated by spaces|{0|}}
{30001002|XXparameter|columns.condition|param_exact dbms hbase param_exact hbase_api True|3|15|P?|@{0|}}
{30001002|XXparameter|timestamp||1|2|FK$|target timestamp (8-byte signed integer)|{0|}}
{30001002|XXparameter|timestamp.condition|param_exact dbms hbase|3|15|P?|@{0|}}
{30001002|XXparameter|start_rowkey||3|2|FK$|lower rowkey bound (inclusive) to unload|{0|}}
{30001002|XXparameter|start_rowkey.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|stop_rowkey||3|2|FK$|upper rowkey bound (exclusive) to unload|{0|}}
{30001002|XXparameter|stop_rowkey.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|skip_WAL|False|13|1|FKl|omit write to HBase WAL|{0|}}
{30001002|XXparameter|skip_WAL.condition|param_exact dbms hbase mode output param_exact hbase_api True|3|15|P?|@{0|}}
{30001002|XXparameter|sort_rowkeys|True|13|1|FKl|Sort incoming record stream on rowkey|{0|}}
{30001002|XXparameter|sort_rowkeys.condition|param_exact dbms hbase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sort_columns|True|13|1|FKl|Sort value vectors in each record on family and column names|{0|}}
{30001002|XXparameter|sort_columns.condition|param_exact dbms hbase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|default_family||3|2|FK$|default column_family (used for flat record format only)|{0|}}
{30001002|XXparameter|default_family.condition|param_exact dbms hbase|3|15|P?|@{0|}}
{30001002|XXparameter|rowkey_field||3|2|FK$|field name for rowkey (used for flat record format only)|{0|}}
{30001002|XXparameter|rowkey_field.condition|param_exact dbms hbase|3|15|P?|@{0|}}
{30001002|XXparameter|tmp_file_mode|660|3|2|FK$|octal file mode must allow read by HBase server|{0|}}
{30001002|XXparameter|tmp_file_mode.condition|param_exact dbms hbase param_exact hbase_utility True param_exact hbase_api False|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_configfile||3|2|FK$|optional configuration file used by HBase for load|{0|}}
{30001002|XXparameter|hbase_configfile.condition|param_exact dbms hbase param_exact hbase_utility True param_exact hbase_api False|3|15|P?|@{0|}}
{30001002|XXparameter|cassandra_api|value interface_out utility False value dbms cassandra True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|cassandra_utility|value interface_out utility True value dbms cassandra True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|chunksize||1|2|FK$|Chunk size for worker processes|{0|}}
{30001002|XXparameter|chunksize.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ingestrate||1|2|FK$|Approx. ingest rate|{0|}}
{30001002|XXparameter|ingestrate.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|max_batchsize||1|2|FK$|Max size of import batch|{0|}}
{30001002|XXparameter|max_batchsize.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|min_batchsize||1|2|FK$|Min size of import batch|{0|}}
{30001002|XXparameter|min_batchsize.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|num_processes||1|2|FK$|Number of worker processes|{0|}}
{30001002|XXparameter|num_processes.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ttl_seconds||1|2|FK$|Time to live in seconds|{0|}}
{30001002|XXparameter|ttl_seconds.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_escaped_by||3|2|FK$|[SQL statement modifier] A string (usually, one-character) defining a character escape sequence.  If non-empty, the SQL statement used for loading the data will be modified accordingly.  A given database's rules may be fairly complex -- read its documentation if you specify any value here.|{0|}}
{30001002|XXparameter|ss_escaped_by.condition|mode output param_exact supports_ss_escaped_by True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_escaped_by|value mysql__interface utility True value mysql__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_string_for_null||3|2|FK$|[SQL statement modifier] The string representing the database NULL.  An empty string here means just that, not the database-specific default, which has to be specified explicitly.  Read the database documentation for a bulk-insert SQL statement to find the latter.|{0|}}
{30001002|XXparameter|ss_string_for_null.condition|mode output param_exact supports_ss_string_for_null True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_string_for_null|value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_appendix||3|2|FK$|[SQL statement modifier] A free-form string going to the end of the SQL statement.  An arbitrary string to be appended to the end of the SQL statement used for data  loading (e.g. DIRECT).  Use this carefully to experiment with loading options:  there is no guarantee that the modified statement will work or result in a better  performance.  Read the database documentation and watch logs to understand the  possible modifications here and their operational impact.|{0|}}
{30001002|XXparameter|ss_appendix.condition|mode output param_exact supports_ss_appendix True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_appendix|value mysql__interface utility True value mysql__interface api False value postgresql__interface copy True value postgresql__interface api False value greenplum__interface api False value greenplum__interface copy True value greenplum__interface gpfdist True value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|mysql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|mysql_interface.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_in|value mysql_interface utility True value mysql_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_in.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|mysql__interface.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_out|value mysql__interface utility True value mysql__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_out.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_duplicate_rows_handling|ignore|15|1|FKl|[SQL statement modifier] Handling of input rows that duplicate existing rows on unique key values.  With 'ignore', input rows that duplicate an existing row on a unique key value are skipped.  With 'replace', input rows replace existing rows.|{2|ignore|replace|}}
{30001002|XXparameter|ss_duplicate_rows_handling.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_character_set||3|2|FK$|[SQL statement modifier] Character set that MySQL uses to interpret the incoming data flow.  If not specified, determined by MySQL server 'character_set_database' system variable.|{0|}}
{30001002|XXparameter|ss_character_set.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|vertica_interface.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_in|value vertica_interface utility True value vertica_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_in.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|vertica__interface.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_out|value vertica__interface utility True value vertica__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_out.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|gendml_param_names|column_delimiter fixed_size_dml field_type_preference dml_with_default_values generate_loader_datatypes ablocal_expr parent_segment_data generate_unique_key file_password file_number|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params|ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss|ablocal_expr db2uss_util_out utility|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss.condition|param_exact dbms db2uss|3|15|P?|@{0|}}
{30001002|XXparameter|m_db_layout_param_names|sameas m_db_layout_params_db2uss sameas m_db_layout_params|3|13|Hv||{0|}}
{30001002|XXparameter|m_db_dump_param_names|remove_delimiters delimiter_replacement ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|dbms||3|2|RF$|Database|{0|}}
{30001002|XXparameter|override_mpname|value dbms ims itable-ims value dbms mongo itable-mongo default dollar_substitution itable|3|13|v||{0|}}
{30001002|XXparameter|override_mpname.display_name|override-mpname|3|9|P|@{0|}}
{30001002|XXparameter|override_mpname.condition|mode input mode input|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Functions for deciding whether to abort or retry a transaction|{0|}}
{30001002|XXparameter|package.condition|mode output param_exact supports_package True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold.condition|mode output param_exact supports_reject_threshold True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|mode output param_exact supports_logging True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_error_group|value interface api True value mssql__interface bulkload True value ter_util True True value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16: mode output param_exact supports_error_group True|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|_ab_insert_statement_supported|value dbms ims False value dbms adabas False value interface_out api True value dbms teradata True value dbms informix True value dbms aster True value dbms mongo False value dbms hbase False value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|_ab_select_statement_supported|value dbms "" True value dbms ims False value dbms adabas False value dbms mongo False value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|$[[record kind 84 subkind 68 parts [vector]]]|9|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|table_spec.custom_editor_key|SelectEditor|3|9|P|@{0|}}
}}@0|Input Table|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|}}
{2010203004|XXGoport|27|0|54|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2448|0|}}
{2010203004|XXGoport|28|0|57|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|29|0|62|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|record
decimal("\\x01",0) prod_adjud_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) prod_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) prod_id_qlfr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=70) prod_nm = NULL("") /*VARCHAR(70)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8) ahfs_cd = NULL("") /*VARCHAR(8)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_3rd_prty_excpn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11) drg_admin_rte_hitsb_desc = NULL("") /*VARCHAR(11)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_clsfctn_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_dea_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) drg_drg_intrctn_desc = NULL("") /*VARCHAR(80)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_fda_thrpc_eqvlc_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_grp_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30) drg_lbl_nm = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_maint_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_maint_src = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_mfrr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5) drg_ndc_lblr_cd = NULL("") /*VARCHAR(5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_ndc_pkg_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_ndc_prod_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11) drg_ndc_id = NULL("") /*VARCHAR(11)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_rx_otc_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) drg_stat_cd = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) drg_strngth_qty = NULL("") /*DECIMAL(11,3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_strngth_uom_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6) drg_sub_class_cd = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_unit_dose_use_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) gcn_no = NULL("") /*INTEGER*/;
  decimal("\\x01",0) gcn_seq_no = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=60) gen_nm = NULL("") /*VARCHAR(60)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) gen_medspn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) gen_ind_ovrd_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) gpi_list_qlfr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14) gpi_no = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_grp_gpi_02_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_class_gpi_04_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6) drg_sub_class_gpi_06_cd = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8) drg_bsic_nm_gpi_08_cd = NULL("") /*VARCHAR(8)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_extd_nm_gpi_10_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12) drg_dosag_frm_gpi_12_cd = NULL("") /*VARCHAR(12)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) dsg_frm_id = NULL("") /*VARCHAR(4)*/;
  decimal("\\x01",0) dise_cat_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) dise_cat_nm /*VARCHAR(80) NOT NULL*/;
  decimal("\\x01",0) thrpc_class_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) thrpc_class_nm /*VARCHAR(80) NOT NULL*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) wac_amt = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) wkrs_comp_alt_prod_cd = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) wkrs_comp_alt_prod_typ_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) prod_pref_list_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) admin_rte_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0) src_env_sk /*BIGINT NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") insert_ts /*TIMESTAMP(6) NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") update_ts /*TIMESTAMP(6) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) insert_uid = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) update_uid = NULL("") /*VARCHAR(20)*/;
  decimal("\\x01",0) run_id = NULL("") /*BIGINT*/;
  decimal("\\x01",0) rec_stat_cd = NULL("") /*BYTEINT*/;
  decimal("\\x01",0) prod_status_rule_tbl_id_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_ldd_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) derived_drg_ldd_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_biosim_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) sec_flg = NULL("") /*SMALLINT*/;
  decimal("\\x01",0) claim_nbr = NULL("") /*BIGINT*/;
  decimal("\\x01",0) claim_seq_nbr = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) claim_stat_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) claim_prod_adjud_sk /*BIGINT NOT NULL*/;
  decimal("\\x01",0) filled_dt_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) claim_src_env_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) sbm_dt_sk = NULL("") /*BIGINT*/;
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL/LDD_IND_Update.txt", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|mode|0x0063|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL/LDD_IND_Update.txt|3|2|$|@{0|}}
}}@0|Output File|812000|146500|0|0|0|0|1487|D_PRD_ADJ & Fact Details|Ab Initio Software|@1|100|-1||6||257|-1|-1|}}
{2010203004|XXGoport|30|0|64|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|31|0|67|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|32|0|70|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|translate_format|False|13|1|Fl|If true, translate the file format.|{0|}}
{30001002|XXparameter|translate_format.condition|version 4.0.0.r1.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|'uninterpreted' (raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant False|13|13|Hv|Hidden condition for deciding hadoop-codec visibility|{0|}}
{30001002|XXparameter|hadoopy_condition.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param_exact hadoopy_condition True param_exact translate_format True|3|15|P?|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|_propagate_through|@3|9|FHK||{0|}}
}}@0|Output File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|33|0|72|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|34|0|75|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|35|0|79|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|/* Do Not Edit.  This file is generated automatically by combining
 * "$PUB_DXF_DML/split_header.type2.dml", "$AI_DML/dxf_header.dml", any "$ADDITIONAL_FIELDS_DML",
 * and "/~$PUB_DATAHUB_DML/ids_common/ids_common.d_product_adjud.dml".
 * Changing the target DML and re-running "$AI_PSET/setup.ilm/setup.ilm.ctrx_d_adjud.pset" will update this file.
 */

type opt_nk_ids_rxclaim_l_disease_category_t =
record
  string("\\x01",charset="iso-8859-15", maximum_length=80) dise_cat_nm = NULL("") /*VARCHAR(80)*/;
end;

type opt_nk_ids_rxclaim_l_therapeutic_class_t =
record
  string("\\x01",charset="iso-8859-15", maximum_length=80) thrpc_class_nm = NULL("") /*VARCHAR(80)*/;
end;

type opt_nk_ids_rxclaim_l_prod_status_rule_t =
record
  string("\\x01",charset="iso-8859-15", maximum_length=13) prod_status_rule_tbl_id = NULL("") /*VARCHAR(13) NOT NULL*/;
end;

type split_ids_common_d_product_adjud_t =
record
  decimal(1) is_equal = 0;
  decimal(1) drop_record = 0;
  datetime("YYYY-MM-DD HH24:MI:SS") matching__eff_dt = NULL("");
  little endian integer(8)  dxf_src_dataset_id =  0/*\@ BizName:'DXF Source Dataset ID' BizComment:'The surrogate key for the DXF Process Log entry for this source.' \@*/;
  unsigned integer(8)  dxf_src_rec_cnt =  0/*\@ BizName:'DXF Source Record Count' BizComment:'Starts at 1 each time the Source File Name changes.' \@*/;
  little endian integer(2)  dxf_src_sys_id =  0/*\@ BizName:'DXF Source System ID' BizComment:'The numeric identifier of this source.' \@*/;
  string(unsigned integer(1))  dxf_src_file_name =  ""/*\@ BizName:'DXF Source File Name' BizComment:'The name of the source file, relative to $AI_SERIAL_PENDING.' \@*/;
  unsigned integer(8)    dxf_hk_part1 =    0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)    dxf_hk_part2 =    0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
  integer(8)    dxf_sk =    0 /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01",0)     prod_adjud_sk = NULL("") /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20)     prod_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)     prod_id_qlfr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=70)     prod_nm = NULL("") /*VARCHAR(70)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8)     ahfs_cd = NULL("") /*VARCHAR(8)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)     drg_3rd_prty_excpn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11)     drg_admin_rte_hitsb_desc = NULL("") /*VARCHAR(11)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4)     drg_clsfctn_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)     drg_dea_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80)     drg_drg_intrctn_desc = NULL("") /*VARCHAR(80)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)     drg_fda_thrpc_eqvlc_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)     drg_grp_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)     drg_lbl_nm = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)     drg_maint_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)     drg_maint_src = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)     drg_mfrr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5)     drg_ndc_lblr_cd = NULL("") /*VARCHAR(5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)     drg_ndc_pkg_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4)     drg_ndc_prod_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11)     drg_ndc_id = NULL("") /*VARCHAR(11)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)     drg_rx_otc_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)     drg_stat_cd = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved)     drg_strngth_qty = NULL("") /*DECIMAL(11,3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)     drg_strngth_uom_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6)     drg_sub_class_cd = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)     drg_unit_dose_use_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)     gcn_no = NULL("") /*INTEGER*/;
  decimal("\\x01",0)     gcn_seq_no = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=60)     gen_nm = NULL("") /*VARCHAR(60)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)     gen_medspn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)     gen_ind_ovrd_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)     gpi_list_qlfr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14)     gpi_no = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)     drg_grp_gpi_02_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4)     drg_class_gpi_04_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6)     drg_sub_class_gpi_06_cd = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8)     drg_bsic_nm_gpi_08_cd = NULL("") /*VARCHAR(8)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)     drg_extd_nm_gpi_10_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12)     drg_dosag_frm_gpi_12_cd = NULL("") /*VARCHAR(12)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4)     dsg_frm_id = NULL("") /*VARCHAR(4)*/;
  decimal("\\x01",0)     dise_cat_sk = NULL("") /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80)     dise_cat_nm = NULL("") /*VARCHAR(80) NOT NULL*/;
  decimal("\\x01",0)     thrpc_class_sk = NULL("") /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80)     thrpc_class_nm = NULL("") /*VARCHAR(80) NOT NULL*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)     wac_amt = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)     wkrs_comp_alt_prod_cd = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)     wkrs_comp_alt_prod_typ_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)     prod_pref_list_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)     admin_rte_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0)     src_env_sk = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)     prod_status_rule_tbl_id_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)     drg_ldd_ind = NULL("") /*VARCHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)     drg_biosim_ind = NULL("") /*VARCHAR(1)*/;
  decimal("\\x01",0)     sec_flg = NULL("") /*SMALLINT*/;
end;

metadata type =
record
  split_ids_common_d_product_adjud_t d_prod_adj;
  opt_nk_ids_rxclaim_l_disease_category_t des_ctgry_adj;
  opt_nk_ids_rxclaim_l_therapeutic_class_t thrptc_cgry_adj;
  opt_nk_ids_rxclaim_l_prod_status_rule_t prd_sts_rule;
  string(1)   newline = "\\n";
  end;|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/split/split.ctrx_d_adjud.ids_common.d_product_adjud.20230627123456.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS/split/split.ctrx_d_adjud.ids_common.d_product_adjud.20230627123456.dat.gz|3|2|$|@{0|}}
}}@2|Output File|1213000|389500|0|0|0|0|1704|D_Prod_Adjud_Insert|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|36|0|81|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|37|0|84|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|translate_format|False|13|1|Fl|If true, translate the file format.|{0|}}
{30001002|XXparameter|translate_format.condition|version 4.0.0.r1.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|'uninterpreted' (raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant False|13|13|Hv|Hidden condition for deciding hadoop-codec visibility|{0|}}
{30001002|XXparameter|hadoopy_condition.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param_exact hadoopy_condition True param_exact translate_format True|3|15|P?|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Output File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|38|0|86|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|39|0|89|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|record
decimal("\\x01",0) prod_adjud_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) prod_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) prod_id_qlfr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=70) prod_nm = NULL("") /*VARCHAR(70)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8) ahfs_cd = NULL("") /*VARCHAR(8)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_3rd_prty_excpn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11) drg_admin_rte_hitsb_desc = NULL("") /*VARCHAR(11)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_clsfctn_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_dea_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) drg_drg_intrctn_desc = NULL("") /*VARCHAR(80)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_fda_thrpc_eqvlc_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_grp_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30) drg_lbl_nm = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_maint_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_maint_src = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_mfrr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5) drg_ndc_lblr_cd = NULL("") /*VARCHAR(5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_ndc_pkg_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_ndc_prod_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11) drg_ndc_id = NULL("") /*VARCHAR(11)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_rx_otc_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) drg_stat_cd = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) drg_strngth_qty = NULL("") /*DECIMAL(11,3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_strngth_uom_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6) drg_sub_class_cd = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_unit_dose_use_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) gcn_no = NULL("") /*INTEGER*/;
  decimal("\\x01",0) gcn_seq_no = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=60) gen_nm = NULL("") /*VARCHAR(60)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) gen_medspn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) gen_ind_ovrd_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) gpi_list_qlfr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14) gpi_no = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_grp_gpi_02_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_class_gpi_04_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6) drg_sub_class_gpi_06_cd = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8) drg_bsic_nm_gpi_08_cd = NULL("") /*VARCHAR(8)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_extd_nm_gpi_10_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12) drg_dosag_frm_gpi_12_cd = NULL("") /*VARCHAR(12)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) dsg_frm_id = NULL("") /*VARCHAR(4)*/;
  decimal("\\x01",0) dise_cat_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) dise_cat_nm /*VARCHAR(80) NOT NULL*/;
  decimal("\\x01",0) thrpc_class_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) thrpc_class_nm /*VARCHAR(80) NOT NULL*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) wac_amt = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) wkrs_comp_alt_prod_cd = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) wkrs_comp_alt_prod_typ_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) prod_pref_list_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) admin_rte_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0) src_env_sk /*BIGINT NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") insert_ts /*TIMESTAMP(6) NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") update_ts /*TIMESTAMP(6) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) insert_uid = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) update_uid = NULL("") /*VARCHAR(20)*/;
  decimal("\\x01",0) run_id = NULL("") /*BIGINT*/;
  decimal("\\x01",0) rec_stat_cd = NULL("") /*BYTEINT*/;
  decimal("\\x01",0) prod_status_rule_tbl_id_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_ldd_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_biosim_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) sec_flg = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) ind = NULL("") /*CHAR(1)*/;
  end;|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL/dedup_ldd_ind.txt", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|mode|0x0063|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL/dedup_ldd_ind.txt|3|2|$|@{0|}}
}}@1|Output File|499000|330000|0|0|0|0|1670|D_Prod_Adjud_Layout|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|40|0|91|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|41|0|94|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|42|0|97|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|translate_format|False|13|1|Fl|If true, translate the file format.|{0|}}
{30001002|XXparameter|translate_format.condition|version 4.0.0.r1.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|'uninterpreted' (raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant False|13|13|Hv|Hidden condition for deciding hadoop-codec visibility|{0|}}
{30001002|XXparameter|hadoopy_condition.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param_exact hadoopy_condition True param_exact translate_format True|3|15|P?|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|_propagate_through|@3|9|FHK||{0|}}
}}@0|Output File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|43|0|99|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|44|0|102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|45|0|106|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|record
decimal("\\x01",0) prod_adjud_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) prod_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) prod_id_qlfr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=70) prod_nm = NULL("") /*VARCHAR(70)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8) ahfs_cd = NULL("") /*VARCHAR(8)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_3rd_prty_excpn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11) drg_admin_rte_hitsb_desc = NULL("") /*VARCHAR(11)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_clsfctn_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_dea_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) drg_drg_intrctn_desc = NULL("") /*VARCHAR(80)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_fda_thrpc_eqvlc_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_grp_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30) drg_lbl_nm = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_maint_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_maint_src = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_mfrr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5) drg_ndc_lblr_cd = NULL("") /*VARCHAR(5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_ndc_pkg_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_ndc_prod_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11) drg_ndc_id = NULL("") /*VARCHAR(11)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_rx_otc_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) drg_stat_cd = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) drg_strngth_qty = NULL("") /*DECIMAL(11,3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_strngth_uom_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6) drg_sub_class_cd = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_unit_dose_use_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) gcn_no = NULL("") /*INTEGER*/;
  decimal("\\x01",0) gcn_seq_no = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=60) gen_nm = NULL("") /*VARCHAR(60)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) gen_medspn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) gen_ind_ovrd_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) gpi_list_qlfr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14) gpi_no = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_grp_gpi_02_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_class_gpi_04_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6) drg_sub_class_gpi_06_cd = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8) drg_bsic_nm_gpi_08_cd = NULL("") /*VARCHAR(8)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_extd_nm_gpi_10_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12) drg_dosag_frm_gpi_12_cd = NULL("") /*VARCHAR(12)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) dsg_frm_id = NULL("") /*VARCHAR(4)*/;
  decimal("\\x01",0) dise_cat_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) dise_cat_nm /*VARCHAR(80) NOT NULL*/;
  decimal("\\x01",0) thrpc_class_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) thrpc_class_nm /*VARCHAR(80) NOT NULL*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) wac_amt = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) wkrs_comp_alt_prod_cd = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) wkrs_comp_alt_prod_typ_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) prod_pref_list_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) admin_rte_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0) src_env_sk /*BIGINT NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") insert_ts /*TIMESTAMP(6) NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") update_ts /*TIMESTAMP(6) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) insert_uid = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) update_uid = NULL("") /*VARCHAR(20)*/;
  decimal("\\x01",0) run_id = NULL("") /*BIGINT*/;
  decimal("\\x01",0) rec_stat_cd = NULL("") /*BYTEINT*/;
  decimal("\\x01",0) prod_status_rule_tbl_id_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_ldd_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_biosim_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) sec_flg = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) ind = NULL("") /*CHAR(1)*/;
  end;|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL/ldd_ind_update_records.txt", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL/ldd_ind_update_records.txt|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0063|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
}}@2|Output File|1200000|280000|0|0|0|0|1691|D_Prod_Adjud_Update|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|46|0|108|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|47|0|111|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|48|0|114|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|translate_format|False|13|1|Fl|If true, translate the file format.|{0|}}
{30001002|XXparameter|translate_format.condition|version 4.0.0.r1.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|'uninterpreted' (raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant False|13|13|Hv|Hidden condition for deciding hadoop-codec visibility|{0|}}
{30001002|XXparameter|hadoopy_condition.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param_exact hadoopy_condition True param_exact translate_format True|3|15|P?|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|_propagate_through|@3|9|FHK||{0|}}
}}@0|Output File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|49|0|116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|50|0|119|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|51|0|123|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{prod_adjud_sk; prod_id; prod_id_qlfr; prod_nm; ahfs_cd; drg_3rd_prty_excpn_ind; drg_admin_rte_hitsb_desc; drg_clsfctn_cd; drg_dea_cd; drg_drg_intrctn_desc; drg_fda_thrpc_eqvlc_cd; drg_grp_cd; drg_lbl_nm; drg_maint_cd; drg_maint_src; drg_mfrr_nm; drg_ndc_lblr_cd; drg_ndc_pkg_cd; drg_ndc_prod_cd; drg_ndc_id; drg_rx_otc_ind; drg_stat_cd; drg_strngth_qty; drg_strngth_uom_cd; drg_sub_class_cd; drg_unit_dose_use_ind; gcn_no; gcn_seq_no; gen_nm; gen_medspn_ind; gen_ind_ovrd_ind; gpi_list_qlfr_nm; gpi_no; drg_grp_gpi_02_cd; drg_class_gpi_04_cd; drg_sub_class_gpi_06_cd; drg_bsic_nm_gpi_08_cd; drg_extd_nm_gpi_10_cd; drg_dosag_frm_gpi_12_cd; dsg_frm_id; dise_cat_sk; dise_cat_nm; thrpc_class_sk; thrpc_class_nm; wac_amt; wkrs_comp_alt_prod_cd; wkrs_comp_alt_prod_typ_cd; prod_pref_list_id; admin_rte_cd; src_env_sk; insert_ts; update_ts; insert_uid; update_uid; run_id; rec_stat_cd; prod_status_rule_tbl_id_sk; drg_ldd_ind; derived_drg_ldd_ind descending; drg_biosim_ind; sec_flg\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Dedup Sorted|1387000|130000|0|0|0|0|1684|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|52|0|125|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|53|0|128|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|54|0|130|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|55|0|132|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|56|0|134|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|57|0|136|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|58|0|139|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
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
{2010203004|XXGoport|59|0|141|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|60|0|144|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|61|0|147|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|62|0|150|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|63|0|153|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|64|0|156|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|65|0|160|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|record
decimal("\\x01",0) prod_adjud_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) prod_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) prod_id_qlfr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=70) prod_nm = NULL("") /*VARCHAR(70)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8) ahfs_cd = NULL("") /*VARCHAR(8)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_3rd_prty_excpn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11) drg_admin_rte_hitsb_desc = NULL("") /*VARCHAR(11)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_clsfctn_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_dea_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) drg_drg_intrctn_desc = NULL("") /*VARCHAR(80)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_fda_thrpc_eqvlc_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_grp_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30) drg_lbl_nm = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_maint_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_maint_src = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_mfrr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5) drg_ndc_lblr_cd = NULL("") /*VARCHAR(5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_ndc_pkg_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_ndc_prod_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11) drg_ndc_id = NULL("") /*VARCHAR(11)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_rx_otc_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) drg_stat_cd = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) drg_strngth_qty = NULL("") /*DECIMAL(11,3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_strngth_uom_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6) drg_sub_class_cd = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_unit_dose_use_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) gcn_no = NULL("") /*INTEGER*/;
  decimal("\\x01",0) gcn_seq_no = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=60) gen_nm = NULL("") /*VARCHAR(60)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) gen_medspn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) gen_ind_ovrd_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) gpi_list_qlfr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14) gpi_no = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_grp_gpi_02_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_class_gpi_04_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6) drg_sub_class_gpi_06_cd = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8) drg_bsic_nm_gpi_08_cd = NULL("") /*VARCHAR(8)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_extd_nm_gpi_10_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12) drg_dosag_frm_gpi_12_cd = NULL("") /*VARCHAR(12)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) dsg_frm_id = NULL("") /*VARCHAR(4)*/;
  decimal("\\x01",0) dise_cat_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) dise_cat_nm /*VARCHAR(80) NOT NULL*/;
  decimal("\\x01",0) thrpc_class_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) thrpc_class_nm /*VARCHAR(80) NOT NULL*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) wac_amt = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) wkrs_comp_alt_prod_cd = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) wkrs_comp_alt_prod_typ_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) prod_pref_list_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) admin_rte_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0) src_env_sk /*BIGINT NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") insert_ts /*TIMESTAMP(6) NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") update_ts /*TIMESTAMP(6) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) insert_uid = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) update_uid = NULL("") /*VARCHAR(20)*/;
  decimal("\\x01",0) run_id = NULL("") /*BIGINT*/;
  decimal("\\x01",0) rec_stat_cd = NULL("") /*BYTEINT*/;
  decimal("\\x01",0) prod_status_rule_tbl_id_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_ldd_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) derived_drg_ldd_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_biosim_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) sec_flg = NULL("") /*SMALLINT*/;
  end;|3|1|l|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Reformat|948000|140500|0|0|0|0|1424|Reformat-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||36865|1|{1|0|}}}
{2010203004|XXGoport|66|0|162|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|67|0|165|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|68|0|167|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|69|0|169|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|70|0|171|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|71|0|174|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|72|0|176|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|73|0|180|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|74|0|183|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|75|0|186|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|76|0|189|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010505005|XXGtvertex|77|0|198|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_Table.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 84 subkind 68 parts [vector]]]|3|9||@{0|}}
{30001002|XXparameter|config_file|$DB_RXCLAIM_DBC|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|2|$|@{0|}}
{30001002|XXparameter|table_spec_kind|select|3|1|l|@{0|}}
{30001002|XXparameter|table_spec|SELECT CLAIM_NBR,CLAIM_SEQ_NBR,CLAIM_STAT_ID, PROD_ADJUD_SK, FILLED_DT_SK,SRC_ENV_SK,SBM_DT_SK FROM ORX_IDW_DM_PRD..F_CLAIM_TRANSACTION
WHERE PROD_ADJUD_SK IN (SELECT DISTINCT PROD_ADJUD_SK FROM 
SANDBOX..NP_060_LDD_CUSTOM_FILE C JOIN 
ORX_IDW_DM_PRD..D_PRODUCT_ADJUD B
ON C.NDC = B.PROD_ID);|3|3|c|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|/* DML Generated for SQL: SELECT CLAIM_NBR,CLAIM_SEQ_NBR,CLAIM_STAT_ID, PROD_ADJUD_SK, FILLED_DT_SK,SRC_ENV_SK,SBM_DT_SK FROM ORX_IDW_DM_PRD..F_CLAIM_TRANSACTION
WHERE PROD_ADJUD_SK IN (SELECT DISTINCT PROD_ADJUD_SK FROM 
SANDBOX..NP_030_LDD_CUSTOM_FILE C JOIN 
ORX_IDW_DM_PRD..D_PRODUCT_ADJUD B
ON C.NDC = B.PROD_ID);
 * On: Fri May 26 08:14:39 2023
 */
record
  decimal("\\x01",0) claim_nbr = NULL("") /*BIGINT*/;
  decimal("\\x01",0) claim_seq_nbr = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) claim_stat_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) prod_adjud_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) filled_dt_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) src_env_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) sbm_dt_sk = NULL("") /*BIGINT*/;
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
}}@0|Input Table|25000|235000|0|0|0|0|1689|Fact|Ab Initio Software|Built-in 2.2:|1|1000000|0||6||4353|}}
{2010203004|XXGoport|78|0|200|0|{@{}@0|0|0|0|read|0.0|@@@2448|0|}}
{2010203004|XXGoport|79|0|203|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010505005|XXGtvertex|80|0|205|0|{Unloads data records from a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|HelpID|HICOMP_INPUT_TABLE|3|2|H$||{0|}}
{30001002|XXparameter|config_file||22|2|RFf$||{0|}}
{30001002|XXparameter|table_spec||32|3|RFc||{0|}}
{30001002|XXparameter|table_spec_kind|table|15|1|RFl||{3|table|insert|select|}}
{30001002|XXparameter|db_is_ole|value dbms mssql True value dbms msjet True value dbms msaccess True value dbms oledb True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ora_interface.condition|param_exact dbms oracle mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface_new|FastExport|15|1|Fl|Unload data via api or utility|{5|api|FastExport|PT_export|PT_selector|PT_api_export|}}
{30001002|XXparameter|ter_interface_new.condition|param_exact dbms teradata mode input version 2.12:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface|sameas ter_interface_new|3|13|v||{0|}}
{30001002|XXparameter|ter_interface.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2eee_interface.condition|param_exact dbms db2eee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2ee_interface.condition|param_exact dbms db2ee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2_interface.condition|param_exact dbms db2 mode input version 3.2.4.r21:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss_interface_old.condition|param_exact dbms db2uss mode input version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss_interface.condition|param_exact dbms db2uss mode input version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_impl|sameas db2uss_interface sameas db2uss_interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss_interface_impl.condition|param_exact dbms db2uss mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mssql_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|mssql_interface.condition|param_exact dbms mssql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msjet_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msjet_interface.condition|param_exact dbms msjet mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msaccess_interface.condition|param_exact dbms msaccess mode input|3|15|P?|@{0|}}
{30001002|XXparameter|oledb_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|oledb_interface.condition|param_exact dbms oledb mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ole_interface|sameas mssql_interface sameas msjet_interface sameas msaccess_interface sameas oledb_interface|3|13|v||{0|}}
{30001002|XXparameter|ole_interface.condition|param_exact db_is_ole True mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_interface.condition|param_exact dbms odbc mode input|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|greenplum_interface.condition|param_exact dbms greenplum mode input|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|postgresql_interface.condition|param_exact dbms postgresql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|psqlodbc_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|psqlodbc_interface.condition|param_exact dbms psqlodbc mode input|3|15|P?|@{0|}}
{30001002|XXparameter|redshift_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|redshift_interface.condition|param_exact dbms redshift mode input|3|15|P?|@{0|}}
{30001002|XXparameter|snow_interface|api|15|1|Fl|Unload data via api or utility|{2|api|staged_unload|}}
{30001002|XXparameter|snow_interface.condition|param_exact dbms snowflake mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybase_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|sybase_interface.condition|param_exact dbms sybase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq_interface.condition|param_exact dbms sybaseiq mode input|3|15|P?|@{0|}}
{30001002|XXparameter|informix_interface|api|15|1|Fl|Unload data via api or utility|{4|api|dbaccess_serial|dbaccess_xps|pload|}}
{30001002|XXparameter|informix_interface.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ims_interface_old.condition|param_exact dbms ims mode input version :3.1.6.r26|3|15|P?|@{0|}}
{30001002|XXparameter|ims_interface|api|15|1|Fl|Unload data via api (local) or via IMS connect(remote) |{2|api|ims_connect|}}
{30001002|XXparameter|ims_interface.condition|param_exact dbms ims mode input version 3.1.6.r27:|3|15|P?|@{0|}}
{30001002|XXparameter|adabas_interface|api|15|1|Fl|Unload data via api or from backup tape|{2|api|backup_tape|}}
{30001002|XXparameter|adabas_interface.condition|param_exact dbms adabas mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mongo_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|mongo_interface.condition|param_exact dbms mongo mode input version 3.2.3.r18.0:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|hbase_interface.condition|param_exact dbms hbase mode input version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|cassandra_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|cassandra_interface.condition|param_exact dbms cassandra mode input version 3.3.2.r8:|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|nza_interface_old.condition|param_exact dbms netezza mode input version :2.15.7.m99|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface|api|15|1|Fl|Unload data via api or remote external table|{2|api|external_table|}}
{30001002|XXparameter|nza_interface.condition|param_exact dbms netezza mode input version 2.15.8:|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_impl|sameas nza_interface sameas nza_interface_old|3|13|v||{0|}}
{30001002|XXparameter|nza_interface_impl.condition|param_exact dbms netezza mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2_400_interface.condition|param_exact dbms db2_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_400_interface.condition|param_exact dbms odbc_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|aster_interface|api|15|1|Fl|Unload data via api or utility|{2|api|ncluster_export|}}
{30001002|XXparameter|aster_interface.condition|param_exact dbms aster mode input|3|15|P?|@{0|}}
{30001002|XXparameter|hana_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|hana_interface.condition|param_exact dbms hana mode input version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|jdbc_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|jdbc_interface.condition|param_exact dbms jdbc mode input version 3.3.2.r8:|3|15|P?|@{0|}}
{30001002|XXparameter|hive_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|hive_interface.condition|param_exact dbms hive mode input version 3.3.4:|3|15|P?|@{0|}}
{30001002|XXparameter|impala_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|impala_interface.condition|param_exact dbms impala mode input version 3.3.5.r19:|3|15|P?|@{0|}}
{30001002|XXparameter|ora__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|ora__interface.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter__interface|Multiload|15|1|Fl|Load data using api or utility|{11|api|Fastload|Multiload|Tpump|PT_load|PT_update|PT_stream|PT_inserter|PT_api_load|PT_api_update|PT_api_stream|}}
{30001002|XXparameter|ter__interface.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2eee__interface.condition|param_exact dbms db2eee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2ee__interface.condition|param_exact dbms db2ee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2__interface.condition|param_exact dbms db2 mode output version 3.2.4.r21:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_old|api|15|1|Fl|Load data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss__interface_old.condition|param_exact dbms db2uss mode output version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface|api|15|1|Fl|Load data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss__interface.condition|param_exact dbms db2uss mode output version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_impl|sameas db2uss__interface sameas db2uss__interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss__interface_impl.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface|utility|15|1|Fl|Load data using api, utility or bulkload|{3|api|utility|bulkload|}}
{30001002|XXparameter|mssql__interface.condition|param_exact dbms mssql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|mssql__interface_bad_choice.condition|param_exact dbms mssql mode output param_exact mssql__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|msjet__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msjet__interface.condition|param_exact dbms msjet mode output|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msaccess__interface.condition|param_exact dbms msaccess mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface|api|15|1|Fl|Load data using api or bulkload|{2|api|bulkload|}}
{30001002|XXparameter|oledb__interface.condition|param_exact dbms oledb mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|oledb__interface_bad_choice.condition|param_exact dbms oledb mode output param_exact oledb__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|ole__interface|sameas mssql__interface sameas msjet__interface sameas msaccess__interface sameas oledb__interface|3|13|v||{0|}}
{30001002|XXparameter|ole__interface.condition|param_exact db_is_ole True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|odbc__interface.condition|param_exact dbms odbc mode output|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum__interface|copy|15|1|Fl|Load data using api or utility|{3|api|copy|gpfdist|}}
{30001002|XXparameter|greenplum__interface.condition|param_exact dbms greenplum mode output|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql__interface|copy|15|1|Fl|Load data using api or utility|{2|api|copy|}}
{30001002|XXparameter|postgresql__interface.condition|param_exact dbms postgresql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|psqlodbc__interface|api|15|1|Fl|For utility loads, manually set the DBMS type parameter on the Data pane to Postgresql, Greenplum or Redshift and press 'NO' when asked if you want to resolve a conflict.  Do NOT change the dbms tag in the dbc file itself.|{1|api|}}
{30001002|XXparameter|psqlodbc__interface.condition|param_exact dbms psqlodbc mode output|3|15|P?|@{0|}}
{30001002|XXparameter|redshift__interface|copy|15|1|Fl|Load data using api or utility|{3|api|copy|copy_via_ssh|}}
{30001002|XXparameter|redshift__interface.condition|param_exact dbms redshift mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybase__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybase__interface.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq__interface.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|informix__interface|api|15|1|Fl|Load data using api or utility|{5|api|dbload|dbaccess_xps|pload|dbaccess_serial|}}
{30001002|XXparameter|informix__interface.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|adabas__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|adabas__interface.condition|param_exact dbms adabas mode output|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface_old|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|nza__interface_old.condition|param_exact dbms netezza mode output version :3.2.3.m99|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface|external_table|15|1|Fl|Load data using api, utility, or remote external table|{3|api|utility|external_table|}}
{30001002|XXparameter|nza__interface.condition|param_exact dbms netezza mode output version 3.2.4:|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface_impl|sameas nza__interface sameas nza__interface_old|3|13|v||{0|}}
{30001002|XXparameter|nza__interface_impl.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2_400__interface.condition|param_exact dbms db2_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|odbc_400__interface.condition|param_exact dbms odbc_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|aster__interface|api|15|1|Fl|Load data using api or utility|{2|api|ncluster_loader|}}
{30001002|XXparameter|aster__interface.condition|param_exact dbms aster mode output|3|15|P?|@{0|}}
{30001002|XXparameter|snow__interface|api|15|1|Fl|Load data using api mode or files-in-a-stage|{2|api|staged_load|}}
{30001002|XXparameter|snow__interface.condition|param_exact dbms snowflake mode output|3|15|P?|@{0|}}
{30001002|XXparameter|hana__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|hana__interface.condition|param_exact dbms hana mode output version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|hbase__interface.condition|param_exact dbms hbase mode output version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|cassandra__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|cassandra__interface.condition|param_exact dbms cassandra mode output version 3.3.2.r8:|3|15|P?|@{0|}}
{30001002|XXparameter|jdbc__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|jdbc__interface.condition|param_exact dbms jdbc mode output version 3.3.2.r8:|3|15|P?|@{0|}}
{30001002|XXparameter|hive__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|hive__interface.condition|param_exact dbms hive mode output version 3.3.4:|3|15|P?|@{0|}}
{30001002|XXparameter|impala__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|impala__interface.condition|param_exact dbms impala mode output version 3.3.5.r19:|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_param_must_exist|1|3|2|H$||{0|}}
{30001002|XXparameter|not_ims|value dbms ims False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_adabas|value dbms ims False value dbms adabas False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_unusual_dbms|value dbms ims False value dbms adabas False value dbms mongo False value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_iq|value dbms sybaseiq False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_hbase|value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_cassandra|value dbms cassandra False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|is_iq_util|value not_iq True False value sybaseiq_interface api False default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_iqutil|value not_ims False False value is_iq_util True False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_num_error|value interface_out api False value dbms netezza True value dbms oracle True value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms db2uss True value dbms sybase True value dbms sybaseiq True value dbms db2_400 True value dbms odbc_400 True value informix__interface dbload True value informix__interface pload True value informix__interface dbaccess_xps True value mssql__interface utility True value dbms cassandra True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_rows_per_commit|value interface_out api False value interface_out bulkload False value dbms oracle True value dbms mssql True value dbms sybase True value dbms sybaseiq True value informix__interface dbload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|db2eee_or_db2ee|value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_native_options|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value nza__interface_impl utility True value nza__interface_impl external_table True value nza__interface_impl api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False value db2ee__interface utility True value db2ee__interface api False value db2eee__interface utility True value db2eee__interface api False value db2__interface utility True value db2__interface api False value db2uss__interface_impl utility True value db2uss__interface_impl api False value db2uss_interface_impl api False value utility DSNTIIAUL False value utility UNLOAD True value nza_interface external_table True value nza_interface api False value cassandra__interface utility True value cassandra__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_control_file|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite|True|13|1|l||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite.condition|mode input param_exact not_unusual_dbms True param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ablocal_expr|value nza_interface external_table True value utility DSNTIAUL True value utility UNLOAD False value old_ablocal_prerequisite True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_gen_ldr_datatypes|value db2eee_or_db2ee True True value dbms db2uss True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ftype_pref_nondelimited|value field_type_preference delimited False value field_type_preference fixed True value field_type_preference variable True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_batchsize|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|no_partition_name|True|13|1|l||{0|}}
{30001002|XXparameter|no_partition_name.condition|param_exact dbms sybase version :3.1.1|3|15|P?|@{0|}}
{30001002|XXparameter|supports_partition_name|value ora__interface utility True value ora__interface api False value no_partition_name True False value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_reject_threshold|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_package|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_logging|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_logfile|value ter_util True True value interface_out copy True value interface_out copy_via_ssh True value interface_out gpfdist True value interface_out staged_load True value interface_out ncluster_loader True value interface_in staged_unload True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_api_load_transforms|value interface_out api True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_api_load_transforms.condition|version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_api_encrypt_data|True|13|1|l||{0|}}
{30001002|XXparameter|ter_api_encrypt_data.condition|param_exact dbms teradata version 3.0.2:|3|15|P?|@{0|}}
{30001002|XXparameter|api_encrypt_data_helper|sameas ter_api_encrypt_data default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_encrypt_data|value api_encrypt_data_helper True True value ter_util True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|interface_in|sameas ora_interface sameas ter_interface sameas db2eee_interface sameas db2ee_interface sameas db2_interface sameas db2uss_interface_impl sameas db2_400_interface sameas ole_interface sameas odbc_interface sameas odbc_400_interface sameas snow_interface sameas sybase_interface sameas sybaseiq_interface sameas informix_interface sameas ims_interface_old sameas ims_interface sameas adabas_interface sameas nza_interface_impl sameas mysql_interface sameas postgresql_interface sameas psqlodbc_interface sameas greenplum_interface sameas redshift_interface sameas vertica_interface sameas aster_interface sameas mongo_interface sameas hana_interface sameas hbase_interface sameas cassandra_interface sameas jdbc_interface sameas hive_interface sameas impala_interface|3|13|v||{0|}}
{30001002|XXparameter|interface_in.condition|mode input|3|15|P?|@{0|}}
{30001002|XXparameter|interface_out|sameas ora__interface sameas ter__interface sameas db2eee__interface sameas db2ee__interface sameas db2__interface sameas db2uss__interface_impl sameas db2_400__interface sameas ole__interface sameas odbc__interface sameas odbc_400__interface sameas sybase__interface sameas sybaseiq__interface sameas informix__interface sameas adabas__interface sameas nza__interface_impl sameas mysql__interface sameas psqlodbc__interface sameas postgresql__interface sameas greenplum__interface sameas redshift__interface sameas vertica__interface sameas aster__interface sameas snow__interface sameas hana__interface sameas hbase__interface sameas cassandra__interface sameas jdbc__interface sameas hive__interface sameas impala__interface|3|13|v||{0|}}
{30001002|XXparameter|interface_out.condition|mode output|3|15|P?|@{0|}}
{30001002|XXparameter|interface|sameas interface_in sameas interface_out|3|13|Kv||{0|}}
{30001002|XXparameter|fixed_size_dml|False|13|1|RFOl|Generate fixed size DML when possible|{0|}}
{30001002|XXparameter|fixed_size_dml.condition|param_exact not_ims_or_adabas True version :2.12.2.m4|3|15|P?|@{0|}}
{30001002|XXparameter|field_type_preference|delimited|15|1|RFKl|Format of generated dml|{3|delimited|variable|fixed|}}
{30001002|XXparameter|field_type_preference.condition|param_exact not_unusual_dbms True version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|generate_loader_datatypes|False|13|1|FKl|Any non-delimited data types in generated DML will be compatible with the utility loader.|{0|}}
{30001002|XXparameter|generate_loader_datatypes.condition|param_exact supports_gen_ldr_datatypes True param_exact ftype_pref_nondelimited True version 2.14.64:|3|15|P?|@{0|}}
{30001002|XXparameter|column_delimiter||3|2|FK$|Default generated column delimiter|{0|}}
{30001002|XXparameter|column_delimiter.condition|param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|encrypt_data|False|13|1|FKl|Encrypt data between database client and server (if possible)|{0|}}
{30001002|XXparameter|encrypt_data.condition|param_exact supports_encrypt_data True|3|15|P?|@{0|}}
{30001002|XXparameter|dml_with_default_values|none|15|1|RFKl|Generate dml with db default values (if possible)|{3|none|null_preferred|default_preferred|}}
{30001002|XXparameter|dml_with_default_values.condition|param_exact not_unusual_dbms True param_exact not_cassandra True version 3.2.3.r18.0:|3|15|P?|@{0|}}
{30001002|XXparameter|logfile||18|2|FK$|Name of file to store utility log information (optional)|{0|}}
{30001002|XXparameter|logfile.condition|param_exact supports_logfile True|3|15|P?|@{0|}}
{30001002|XXparameter|max_rows||1|2|FK$|Maximum rows to unload|{0|}}
{30001002|XXparameter|max_rows.condition|mode input param_exact not_ims_or_iqutil True|3|15|P?|@{0|}}
{30001002|XXparameter|ablocal_expr||3|2|FK$|DML expression for ABLOCAL() in select|{0|}}
{30001002|XXparameter|ablocal_expr.condition|param_exact supports_ablocal_expr True|3|15|P?|@{0|}}
{30001002|XXparameter|remove_delimiters|False|13|1|RFOl|Remove delimiters found in data|{0|}}
{30001002|XXparameter|remove_delimiters.condition|param_exact interface api mode input version 2.7: param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|delimiter_replacement||3|2|FK$|Replacement for field delimiters found in data|{0|}}
{30001002|XXparameter|delimiter_replacement.condition|param_exact interface api mode input version 2.7: param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|non_ansimode||13|1|RFKl|If true, process the select statement using Teradata semantics (like Fast Export/PT Export does); false means use Ansi semantics|{0|}}
{30001002|XXparameter|non_ansimode.condition|param_exact ter_interface api version 2.15.2:|3|15|P?|@{0|}}
{30001002|XXparameter|num_errors|50|1|2|FK$|Maximum number of errors allowed|{0|}}
{30001002|XXparameter|num_errors.condition|mode output param_exact supports_num_error True|3|15|P?|@{0|}}
{30001002|XXparameter|commitNumber||1|2|FK$|Number of records per commit checkpoint|{0|}}
{30001002|XXparameter|commitNumber.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|commitTable||24|3|FKc|Database table to store commit progress|{0|}}
{30001002|XXparameter|commitTable.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|jobid||25|3|FKc|For special purpose use only - see 'Help'|{0|}}
{30001002|XXparameter|jobid.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|ignoreDuplicates|False|13|1|Fl|if true, ignore unique constraint violations|{0|}}
{30001002|XXparameter|ignoreDuplicates.condition|mode output param_exact interface api param_exact not_hbase True param_exact not_cassandra True version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|no_actions_ok|value ignoreDuplicates True True value ignoreDuplicates False False default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|no_actions_ok.condition|mode output param_exact interface api version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize||1|2|FK$|Size of batch when using array mode|{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize.condition|mode output param_exact interface api version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|rows_per_commit||1|2|FK$|Rows per commit|{0|}}
{30001002|XXparameter|rows_per_commit.condition|mode output param_exact supports_rows_per_commit True|3|15|P?|@{0|}}
{30001002|XXparameter|batch_size|4096|1|2|FK$|Records processed in each batch|{0|}}
{30001002|XXparameter|batch_size.condition|mode output param_exact supports_batchsize True|3|15|P?|@{0|}}
{30001002|XXparameter|is_serial|False|13|1|FKl|Set to true to specify a serial load.|{0|}}
{30001002|XXparameter|is_serial.condition|mode output param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|file_type|delimited|15|1|FKl|Format of data to be loaded. If 'fixed', Output Table reformats the data to the loader's specifications.|{2|delimited|fixed|}}
{30001002|XXparameter|file_type.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.67:|3|15|P?|@{0|}}
{30001002|XXparameter|file_type_modifier||25|3|FKc|Enter desired file type modifiers.|{0|}}
{30001002|XXparameter|file_type_modifier.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|copy_target||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|copy_target.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|row_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|row_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|save_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|save_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|data_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|data_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|sort_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|sort_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|hold_quiesce|False|13|1|FKl|Set to True to leave the utility in quiesced exclusive state.|{0|}}
{30001002|XXparameter|hold_quiesce.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|cpu_parallelism|1|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|cpu_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|disk_parallelism|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|disk_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|recoverable|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|recoverable.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|indexing_mode|autoselect|15|1|FKl|Refer to DB2 UDB documentation for description.|{4|autoselect|rebuild|incremental|deferred|}}
{30001002|XXparameter|indexing_mode.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|access_level|allow_no_access|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|allow_no_access|allow_read_access|}}
{30001002|XXparameter|access_level.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_tablespace||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|use_tablespace.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.101:|3|15|P?|@{0|}}
{30001002|XXparameter|lock_with_force|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|lock_with_force.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|check_pending|deferred|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|immediate|deferred|}}
{30001002|XXparameter|check_pending.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|statsopt|none|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|none|use_profile|}}
{30001002|XXparameter|statsopt.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_exception_table|False|13|1|FKl|Set to True to use exception table.|{0|}}
{30001002|XXparameter|use_exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|exception_table||25|3|FKc|Use only if you want to explicity specify the name for the exception table.|{0|}}
{30001002|XXparameter|exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|aster_dummy|a|3|2|$||{0|}}
{30001002|XXparameter|aster_util_in|value aster_interface api False value aster_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util_in.condition|param_exact dbms aster mode input|3|15|P?|@{0|}}
{30001002|XXparameter|aster_util_out|value aster__interface api False value aster__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util_out.condition|param_exact dbms aster mode output|3|15|P?|@{0|}}
{30001002|XXparameter|aster_util|value aster_util_in True True value aster_util_out True True value aster_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util.condition|param_exact dbms aster|3|15|P?|@{0|}}
{30001002|XXparameter|uses_legacy_inheritance|False|13|1|FKl|Set to True if table uses legacy parent/child inheritance |{0|}}
{30001002|XXparameter|uses_legacy_inheritance.condition|param_exact aster_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|allow_errors|False|13|1|FKl|If true, write errors to error table OR (if false) abort load on first error|{0|}}
{30001002|XXparameter|allow_errors.condition|param_exact aster_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|error_table||3|2|FK$|User-specified errtable name (optional)|{0|}}
{30001002|XXparameter|error_table.condition|param_exact allow_errors True|3|15|P?|@{0|}}
{30001002|XXparameter|label||3|2|FK$|Optional string to identify errors from this load in error table|{0|}}
{30001002|XXparameter|label.condition|param_exact allow_errors True|3|15|P?|@{0|}}
{30001002|XXparameter|like_postg|value dbms postgresql True value dbms greenplum True value dbms redshift True value dbms Redshift True default constant False|13|13|v||{0|}}
{30001002|XXparameter|db_type|sameas dbms|3|13|Kv|psqlodbc needs this param set|{0|}}
{30001002|XXparameter|db_type.condition|mode output param_exact like_postg True|3|15|P?|@{0|}}
{30001002|XXparameter|gpfdist_log_prefix||18|2|FK$|Use this to override the log file path prefix in the gpdfdist configuration file (optional)|{0|}}
{30001002|XXparameter|gpfdist_log_prefix.condition|param_exact greenplum__interface gpfdist|3|15|P?|@{0|}}
{30001002|XXparameter|stage_name||3|2|FK$|optional name of stage.  If specified, MUST be in format defined for dbc file's default_stage parameter.|{0|}}
{30001002|XXparameter|stage_name.condition|param_exact dbms snowflake param_exact interface staged_*|3|15|P?|@{0|}}
{30001002|XXparameter|put_parallel_threads||1|2|FK$|Number of threads to use with PUT command|{0|}}
{30001002|XXparameter|put_parallel_threads.condition|param_exact dbms snowflake param_exact interface staged_load|3|15|P?|@{0|}}
{30001002|XXparameter|inf_dummy|a|3|2|$||{0|}}
{30001002|XXparameter|inf_util_in|value informix_interface api False value informix_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_in.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util_out|value informix__interface api False value informix__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_out.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util|value inf_util_in True True value inf_util_out True True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util.condition|param_exact dbms informix|3|15|P?|@{0|}}
{30001002|XXparameter|inf_use_rej|value informix__interface dbaccess_xps True value informix__interface dbload True value informix__interface pload True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_use_rej.condition|param_exact inf_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|idelim|\||3|2|FK$|One-character delimiter for Informix utilities|{0|}}
{30001002|XXparameter|idelim.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pdqpriority||3|2|FK$|DEFAULT, LOW, HIGH, ...|{0|}}
{30001002|XXparameter|pdqpriority.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|jobname||3|2|RFK$|Jobname for High-performance Load/Unload|{0|}}
{30001002|XXparameter|jobname.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|pload_job_method|new|15|1|RFKl||{3|new|overwrite|reuse|}}
{30001002|XXparameter|pload_job_method.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|isolation||3|2|FK$|'set isolation' choices: DIRTY READ, COMMITTED READ, ...|{0|}}
{30001002|XXparameter|isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|ansi_isolation|default|15|1|FKl|'set transaction' isolation choices|{5|default|READ COMMITTED|REPEATABLE READ|SERIALIZABLE|READ UNCOMMITTED|}}
{30001002|XXparameter|ansi_isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|force_raw|False|13|1|FKl|If true, temporarily alters table log mode to RAW|{0|}}
{30001002|XXparameter|force_raw.condition|param_exact inf_util_out True param_exact informix__interface dbaccess_xps|3|15|P?|@{0|}}
{30001002|XXparameter|rejectfile||3|2|RFK$|Rejectfile specification for Informix load utility|{0|}}
{30001002|XXparameter|rejectfile.condition|param_exact inf_use_rej True|3|15|P?|@{0|}}
{30001002|XXparameter|dummy1|a|3|2|$||{0|}}
{30001002|XXparameter|ter_util_in|value ter_interface api False value ter_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util_out|value ter__interface api False value ter__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util|value ter_util_in True True value ter_util_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_in|value ter_interface WB_* True value ter_interface PT_* True value ter_interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_out|value ter__interface WB_* True value ter__interface PT_* True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb|value ter_wb_in True True value ter_wb_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_fload|value ter__interface Fastload True value ter__interface WB_load True value ter__interface PT_load True value ter__interface PT_api_load True value ter__interface AB_Fastload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_fload.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_tpump|value ter__interface Tpump True value ter__interface WB_stream True value ter__interface PT_stream True value ter__interface PT_api_stream True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_tpump.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_m_or_t|value ter__interface PT_inserter False value ter_is_fload False True value ter_is_fload True False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_m_or_t.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_mload_only|value ter__interface Multiload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_mload_only.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_show_brief|value ter_m_or_t True True value ter_util_in True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_show_brief.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|brief|True|13|1|FKl|Ask utility to generate brief log info if TRUE|{0|}}
{30001002|XXparameter|brief.condition|param_exact ter_show_brief True|3|15|P?|@{0|}}
{30001002|XXparameter|sleep|6|1|2|FK$|Minutes to wait before retrying logon|{0|}}
{30001002|XXparameter|sleep.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|tenacity|0|1|2|FK$|Maximum hours to attempt logon before utility gives up|{0|}}
{30001002|XXparameter|tenacity.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|sessions||3|2|FK$|Number of  sessions|{0|}}
{30001002|XXparameter|sessions.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|instances|1|1|2|FK$|Number of Parallel Transporter operator instances|{0|}}
{30001002|XXparameter|instances.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|logtab_name||3|2|FK$|User-specified logtable name (optional)|{0|}}
{30001002|XXparameter|logtab_name.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|no_spool|False|13|1|FKl|If True, do not spool output if possible|{0|}}
{30001002|XXparameter|no_spool.condition|param_exact ter_util_in True version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|use_load_isolation|False|13|1|FKl|Use Teradata load isolation capability when loading data|{0|}}
{30001002|XXparameter|use_load_isolation.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|tablewait|0|1|2|FK$|Number of hours to wait on other load tasks before utility gives up|{0|}}
{30001002|XXparameter|tablewait.condition|param_exact ter_is_mload_only True|3|15|P?|@{0|}}
{30001002|XXparameter|vartext|False|13|1|FKl|Send data to Teradata load utility in VARTEXT mode|{0|}}
{30001002|XXparameter|vartext.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|delim|\||3|2|FK$|delimiter for Teradata load utility|{0|}}
{30001002|XXparameter|delim.condition|param_exact vartext True|3|15|P?|@{0|}}
{30001002|XXparameter|np_axsmod_dir||26|2|RFK$|Name of directory for Named Pipe AXSMOD storage (required)|{0|}}
{30001002|XXparameter|np_axsmod_dir.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|checkpoint||1|2|FK$|Checkpoint rate to be used by Teradata utility|{0|}}
{30001002|XXparameter|checkpoint.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|worktab_name||3|2|FK$|User-specified worktable name (optional)|{0|}}
{30001002|XXparameter|worktab_name.condition|param_exact ter_util_out True param_exact ter_m_or_t True param_exact ter_is_tpump False|3|15|P?|@{0|}}
{30001002|XXparameter|errtab_name||3|2|FK$|User-specified errtable name (optional) [will have 1,2.. appended]|{0|}}
{30001002|XXparameter|errtab_name.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|macrodb||3|2|FK$|Database to use for Tpump macro creation and usage|{0|}}
{30001002|XXparameter|macrodb.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|errlimit||1|2|FK$|number errors allowed|{0|}}
{30001002|XXparameter|errlimit.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|errpercent||1|2|FK$|% errors allowed|{0|}}
{30001002|XXparameter|errpercent.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_dupl_rows|False|13|1|FKl|If true, ignore duplicate rows on insert|{0|}}
{30001002|XXparameter|ignore_dupl_rows.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|serialize|False|13|1|FKl|Guarantee serializability of operations on the same key if true|{0|}}
{30001002|XXparameter|serialize.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|pack|1|1|2|FK$|# of records to pack into a Tpump request or a TPT Update buffer|{0|}}
{30001002|XXparameter|pack.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|rate||1|2|FK$|# of statements per minute to send to Teradata database|{0|}}
{30001002|XXparameter|rate.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|trace_directory||26|2|FK$|directory for trace/debug info (optional)|{0|}}
{30001002|XXparameter|trace_directory.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|axsmod_tracelevel|None|3|2|FK$|for axsmod debugging|{0|}}
{30001002|XXparameter|axsmod_tracelevel.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pt_tracelevel|None|3|2|FK$|for Parallel Transporter (was TWB) debugging|{0|}}
{30001002|XXparameter|pt_tracelevel.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|ora_util_out|value ora__interface utility True value ora__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_util_out.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oracle_max_kb||1|2|FK$|max kilobytes for each parallel unload select|{0|}}
{30001002|XXparameter|oracle_max_kb.condition|param_exact dbms oracle mode input version 2.10.12.m12:|3|15|P?|@{0|}}
{30001002|XXparameter|parallel_mode|rowid|15|1|RFKl|method of automatic parallelism|{3|rowid|subpartition|partition|}}
{30001002|XXparameter|parallel_mode.condition|param_exact dbms oracle mode input version 2.14:|3|15|P?|@{0|}}
{30001002|XXparameter|include_partitions||17|2|FKf$|Optional list of partitions to extract|{0|}}
{30001002|XXparameter|include_partitions.condition|param_exact dbms oracle mode input version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|flashback_queries|False|13|1|FKl|Employ Oracle flashback queries|{0|}}
{30001002|XXparameter|flashback_queries.condition|param_exact dbms oracle mode input version 3.2.6.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|system_change_number||1|2|FK$|optional System Change Number|{0|}}
{30001002|XXparameter|system_change_number.condition|param_exact flashback_queries True version 3.2.6.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|direct|True|13|1|RFOl|Use SQL*Loader Direct Mode|{0|}}
{30001002|XXparameter|direct.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|num_discards||1|2|FK$|# discards allowed|{0|}}
{30001002|XXparameter|num_discards.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|bindsize||1|2|FK$|SQL*Loader BINDSIZE setting|{0|}}
{30001002|XXparameter|bindsize.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|control_file||17|2|FKf$|Optional database load utility control file|{0|}}
{30001002|XXparameter|control_file.condition|param_exact supports_control_file True version 2.7:|3|15|P?|@{0|}}
{30001002|XXparameter|partition_name||3|2|FK$|Database partition name|{0|}}
{30001002|XXparameter|partition_name.condition|param_exact supports_partition_name True|3|15|P?|@{0|}}
{30001002|XXparameter|native_options||25|3|FKc|Optional commands passed directly to the database load utility.|{0|}}
{30001002|XXparameter|native_options.condition|param_exact supports_native_options True|3|15|P?|@{0|}}
{30001002|XXparameter|syb_util_out|value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|syb_util_out.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_util_out|value sybaseiq__interface utility True value sybaseiq__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|sybaseiq_util_out.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|row_delimited_by|if appropriate|15|1|FKl|Generate ROW DELIMITED BY clause in control file when appropriate.|{2|if appropriate|never|}}
{30001002|XXparameter|row_delimited_by.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|quoted_identifiers|always|15|1|FKl|Quote column names in generated control file.|{2|always|never|}}
{30001002|XXparameter|quoted_identifiers.condition|param_exact sybaseiq_util_out True version :3.0.3.r14|3|15|P?|@{0|}}
{30001002|XXparameter|supports_constraint|True|13|1|Kl||{0|}}
{30001002|XXparameter|supports_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|unique_constraint|True|13|1|FKl|If True, include UNIQUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|unique_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|null_constraint|True|13|1|FKl|If True, include NULL as a load constraint to ignore.|{0|}}
{30001002|XXparameter|null_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|foreign_key_constraint|False|13|1|FKl|If True, include FOREIGN KEY as a load constraint to ignore.|{0|}}
{30001002|XXparameter|foreign_key_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|data_value_constraint|False|13|1|FKl|If True, include DATA VALUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|data_value_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ims_api_in|value ims_interface_old api True value ims_interface api True value ims_interface ims_connect False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ims_api_in.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_remote_in|value ims_interface ims_connect True value ims_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ims_remote_in.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_api_or_remote_in|value ims_api_in True True value ims_remote_in True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|batch_mode|DLI|15|1|RFKl|Run standalone batch or in a batch message processing region|{2|DLI|BMP|}}
{30001002|XXparameter|batch_mode.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|parent_segment_data|key_only|15|1|RFKl|Unload just the keys from parents, or all the data|{2|key_only|full_segment|}}
{30001002|XXparameter|parent_segment_data.condition|param_exact ims_api_or_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|generate_unique_key|False|13|1|FKl|Generate a unique for segments with no unique key|{0|}}
{30001002|XXparameter|generate_unique_key.condition|param_exact ims_api_or_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_ims_path_command|m_db ims_path|3|2|$|Command to generate list of segments|{0|}}
{30001002|XXparameter|_ab_ims_path_command_params|config_file positional table_spec keyword|3|2|$|List of parameters for path command|{0|}}
{30001002|XXparameter|ims_path|generated _ab_ims_path_command page_change|3|13|FHv|List of segments from root to segment|{0|}}
{30001002|XXparameter|ims_path.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|ims_path.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ssa_||3|2|FK$|SSA qualifier for this segment|{0|}}
{30001002|XXparameter|ssa_.index|ims_path|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.index_name|ssa_|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_parameters||3|2|FK$|Other ims parameters|{0|}}
{30001002|XXparameter|ims_parameters.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|alternate_psbname||3|2|FK$|Alternate PSB name to use when starting DFSRRC00|{0|}}
{30001002|XXparameter|alternate_psbname.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|ims_batch_size|10|1|2|RFK$|Number of records to request per call|{0|}}
{30001002|XXparameter|ims_batch_size.condition|param_exact ims_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|file_number||1|2|FK$|Set to valid file number to bypass PREDICT for file number lookup.|{0|}}
{30001002|XXparameter|file_number.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|backup_dataset||3|2|FK$|DSN of backup tape|{0|}}
{30001002|XXparameter|backup_dataset.condition|mode input param_exact dbms adabas param_exact adabas_interface backup_tape|3|15|P?|@{0|}}
{30001002|XXparameter|file_password||3|2|FK$|Adabas password in encrypted form (m_passwd).|{0|}}
{30001002|XXparameter|file_password.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|nza_util_out|value nza__interface_impl utility True value nza__interface_impl external_table True value nza__interface_impl api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|nza_util_out.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|local_log_path||3|2|FK$|local path to log directory mapped from NPS server|{0|}}
{30001002|XXparameter|local_log_path.condition|version :3.2.0|3|15|P?|@{0|}}
{30001002|XXparameter|server_log_path||3|2|FK$|path on NPS server to log directory|{0|}}
{30001002|XXparameter|server_log_path.condition|version :3.2.0|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_util_out|value db2uss__interface_impl utility True value db2uss__interface_impl api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|db2uss_util_out.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|utility|DSNTIAUL|15|1|FKl|IBM utility used to unload the database|{2|DSNTIAUL|UNLOAD|}}
{30001002|XXparameter|utility.condition|mode input param_exact db2uss_interface_impl utility version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|supports_utility_id|value db2uss_util_out True True value utility UNLOAD True value utility DSNTIAUL False default constant False|13|13|v||{0|}}
{30001002|XXparameter|utility_ID||3|2|FK$|Unique ID for DB2 utility job|{0|}}
{30001002|XXparameter|utility_ID.condition|param_exact interface utility param_exact supports_utility_id True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|temp_dataset||28|2|FK$|MVS dataset for UNLOAD output|{0|}}
{30001002|XXparameter|temp_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|image_copy_dataset||28|2|FK$|Optional DB/2 image copy dataset or datasets from which to unload data|{0|}}
{30001002|XXparameter|image_copy_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|tablespace||3|2|FK$|If unloading from an image copy dataset, the name of the tablespace which contains the data from the target table|{0|}}
{30001002|XXparameter|tablespace.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|partition||3|2|FK$|If unloading from a partitioned table, the partition number or range to unload|{0|}}
{30001002|XXparameter|partition.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 3.5.2.r9:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSREC_dataset||28|2|FK$|MVS dataset for utility input|{0|}}
{30001002|XXparameter|SYSREC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSDISC_dataset||28|2|FK$|Optional MVS dataset for utility rejects|{0|}}
{30001002|XXparameter|SYSDISC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSERR_dataset||28|2|FK$|Optional MVS dataset for utility error output|{0|}}
{30001002|XXparameter|SYSERR_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSUT1_dataset||28|2|FK$|Optional MVS work dataset for sort input|{0|}}
{30001002|XXparameter|SYSUT1_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SORTOUT_dataset||28|2|FK$|Optional MVS work dataset for sort output|{0|}}
{30001002|XXparameter|SORTOUT_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSMAP_dataset||28|2|FK$|Optional MVS work dataset for utility error processing|{0|}}
{30001002|XXparameter|SYSMAP_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSCOPY_dataset||28|2|FK$|Optional MVS dataset for an inline image copy|{0|}}
{30001002|XXparameter|SYSCOPY_dataset.condition|param_exact db2uss_util_out True version 3.5.3.r11:|3|15|P?|@{0|}}
{30001002|XXparameter|use_mssql_bulk_out|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|keep_identity|False|13|1|FKl|When "True" user must provide values for identity columns.|{0|}}
{30001002|XXparameter|keep_identity.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|keep_nulls|False|13|1|FKl|When "true" a null input value will store a null, not the column default value.|{0|}}
{30001002|XXparameter|keep_nulls.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|hints||3|2|FK$|The same as the "-h" option to bcp.|{0|}}
{30001002|XXparameter|hints.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|as400_util_out|value db2_400__interface utility True value db2_400__interface api False value odbc_400__interface utility True value odbc_400__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|hostname||3|2|FK$|Name of AS/400 system|{0|}}
{30001002|XXparameter|hostname.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|rebuild_loader|False|13|1|FKl|If True, rebuild the RPG table loader program on the AS/400.|{0|}}
{30001002|XXparameter|rebuild_loader.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_data_path||3|2|FK$|Location, on the AS/400, where data will be landed|{0|}}
{30001002|XXparameter|ifs_data_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_dml_path||3|2|FK$|Location, on the AS/400, where dml files will be landed|{0|}}
{30001002|XXparameter|ifs_dml_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|mongo_api_in|value mongo_interface api True default constant False|13|13|v||{0|}}
{30001002|XXparameter|mongo_api_in.condition|param_exact dbms mongo mode input|3|15|P?|@{0|}}
{30001002|XXparameter|continue_on_bad_type|False|13|1|RFKl|False will abort if a Mongo document is read which cannot be translated into the port DML.  True will skip the document and continue processing.|{0|}}
{30001002|XXparameter|continue_on_bad_type.condition|param_exact mongo_api_in True version 3.2.3.r18:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_api|value interface_out utility False value dbms hbase True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|hbase_utility|value interface_out utility True value dbms hbase True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|filterstring||3|2|FK$|Thrift filterstring|{0|}}
{30001002|XXparameter|filterstring.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|columns||3|2|FK$|List of column names to load or unload; names are <family>:<qualifier> and separated by spaces|{0|}}
{30001002|XXparameter|columns.condition|param_exact dbms hbase param_exact hbase_api True|3|15|P?|@{0|}}
{30001002|XXparameter|timestamp||1|2|FK$|target timestamp (8-byte signed integer)|{0|}}
{30001002|XXparameter|timestamp.condition|param_exact dbms hbase|3|15|P?|@{0|}}
{30001002|XXparameter|start_rowkey||3|2|FK$|lower rowkey bound (inclusive) to unload|{0|}}
{30001002|XXparameter|start_rowkey.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|stop_rowkey||3|2|FK$|upper rowkey bound (exclusive) to unload|{0|}}
{30001002|XXparameter|stop_rowkey.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|skip_WAL|False|13|1|FKl|omit write to HBase WAL|{0|}}
{30001002|XXparameter|skip_WAL.condition|param_exact dbms hbase mode output param_exact hbase_api True|3|15|P?|@{0|}}
{30001002|XXparameter|sort_rowkeys|True|13|1|FKl|Sort incoming record stream on rowkey|{0|}}
{30001002|XXparameter|sort_rowkeys.condition|param_exact dbms hbase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sort_columns|True|13|1|FKl|Sort value vectors in each record on family and column names|{0|}}
{30001002|XXparameter|sort_columns.condition|param_exact dbms hbase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|default_family||3|2|FK$|default column_family (used for flat record format only)|{0|}}
{30001002|XXparameter|default_family.condition|param_exact dbms hbase|3|15|P?|@{0|}}
{30001002|XXparameter|rowkey_field||3|2|FK$|field name for rowkey (used for flat record format only)|{0|}}
{30001002|XXparameter|rowkey_field.condition|param_exact dbms hbase|3|15|P?|@{0|}}
{30001002|XXparameter|tmp_file_mode|660|3|2|FK$|octal file mode must allow read by HBase server|{0|}}
{30001002|XXparameter|tmp_file_mode.condition|param_exact dbms hbase param_exact hbase_utility True param_exact hbase_api False|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_configfile||3|2|FK$|optional configuration file used by HBase for load|{0|}}
{30001002|XXparameter|hbase_configfile.condition|param_exact dbms hbase param_exact hbase_utility True param_exact hbase_api False|3|15|P?|@{0|}}
{30001002|XXparameter|cassandra_api|value interface_out utility False value dbms cassandra True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|cassandra_utility|value interface_out utility True value dbms cassandra True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|chunksize||1|2|FK$|Chunk size for worker processes|{0|}}
{30001002|XXparameter|chunksize.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ingestrate||1|2|FK$|Approx. ingest rate|{0|}}
{30001002|XXparameter|ingestrate.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|max_batchsize||1|2|FK$|Max size of import batch|{0|}}
{30001002|XXparameter|max_batchsize.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|min_batchsize||1|2|FK$|Min size of import batch|{0|}}
{30001002|XXparameter|min_batchsize.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|num_processes||1|2|FK$|Number of worker processes|{0|}}
{30001002|XXparameter|num_processes.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ttl_seconds||1|2|FK$|Time to live in seconds|{0|}}
{30001002|XXparameter|ttl_seconds.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_escaped_by||3|2|FK$|[SQL statement modifier] A string (usually, one-character) defining a character escape sequence.  If non-empty, the SQL statement used for loading the data will be modified accordingly.  A given database's rules may be fairly complex -- read its documentation if you specify any value here.|{0|}}
{30001002|XXparameter|ss_escaped_by.condition|mode output param_exact supports_ss_escaped_by True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_escaped_by|value mysql__interface utility True value mysql__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_string_for_null||3|2|FK$|[SQL statement modifier] The string representing the database NULL.  An empty string here means just that, not the database-specific default, which has to be specified explicitly.  Read the database documentation for a bulk-insert SQL statement to find the latter.|{0|}}
{30001002|XXparameter|ss_string_for_null.condition|mode output param_exact supports_ss_string_for_null True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_string_for_null|value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_appendix||3|2|FK$|[SQL statement modifier] A free-form string going to the end of the SQL statement.  An arbitrary string to be appended to the end of the SQL statement used for data  loading (e.g. DIRECT).  Use this carefully to experiment with loading options:  there is no guarantee that the modified statement will work or result in a better  performance.  Read the database documentation and watch logs to understand the  possible modifications here and their operational impact.|{0|}}
{30001002|XXparameter|ss_appendix.condition|mode output param_exact supports_ss_appendix True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_appendix|value mysql__interface utility True value mysql__interface api False value postgresql__interface copy True value postgresql__interface api False value greenplum__interface api False value greenplum__interface copy True value greenplum__interface gpfdist True value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|mysql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|mysql_interface.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_in|value mysql_interface utility True value mysql_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_in.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|mysql__interface.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_out|value mysql__interface utility True value mysql__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_out.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_duplicate_rows_handling|ignore|15|1|FKl|[SQL statement modifier] Handling of input rows that duplicate existing rows on unique key values.  With 'ignore', input rows that duplicate an existing row on a unique key value are skipped.  With 'replace', input rows replace existing rows.|{2|ignore|replace|}}
{30001002|XXparameter|ss_duplicate_rows_handling.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_character_set||3|2|FK$|[SQL statement modifier] Character set that MySQL uses to interpret the incoming data flow.  If not specified, determined by MySQL server 'character_set_database' system variable.|{0|}}
{30001002|XXparameter|ss_character_set.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|vertica_interface.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_in|value vertica_interface utility True value vertica_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_in.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|vertica__interface.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_out|value vertica__interface utility True value vertica__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_out.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|gendml_param_names|column_delimiter fixed_size_dml field_type_preference dml_with_default_values generate_loader_datatypes ablocal_expr parent_segment_data generate_unique_key file_password file_number|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params|ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss|ablocal_expr db2uss_util_out utility|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss.condition|param_exact dbms db2uss|3|15|P?|@{0|}}
{30001002|XXparameter|m_db_layout_param_names|sameas m_db_layout_params_db2uss sameas m_db_layout_params|3|13|Hv||{0|}}
{30001002|XXparameter|m_db_dump_param_names|remove_delimiters delimiter_replacement ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|dbms||3|2|RF$|Database|{0|}}
{30001002|XXparameter|override_mpname|value dbms ims itable-ims value dbms mongo itable-mongo default dollar_substitution itable|3|13|v||{0|}}
{30001002|XXparameter|override_mpname.display_name|override-mpname|3|9|P|@{0|}}
{30001002|XXparameter|override_mpname.condition|mode input mode input|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Functions for deciding whether to abort or retry a transaction|{0|}}
{30001002|XXparameter|package.condition|mode output param_exact supports_package True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold.condition|mode output param_exact supports_reject_threshold True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|mode output param_exact supports_logging True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_error_group|value interface api True value mssql__interface bulkload True value ter_util True True value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16: mode output param_exact supports_error_group True|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|_ab_insert_statement_supported|value dbms ims False value dbms adabas False value interface_out api True value dbms teradata True value dbms informix True value dbms aster True value dbms mongo False value dbms hbase False value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|_ab_select_statement_supported|value dbms "" True value dbms ims False value dbms adabas False value dbms mongo False value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|$[[record kind 84 subkind 68 parts [vector]]]|9|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|table_spec.custom_editor_key|SelectEditor|3|9|P|@{0|}}
}}@0|Input Table|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|}}
{2010203004|XXGoport|81|0|207|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2448|0|}}
{2010203004|XXGoport|82|0|210|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|83|0|215|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Join.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{prod_adjud_sk\}|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform|out :: join(in0, in1) =
begin
  out.* :1: in0.*;
  out.derived_drg_ldd_ind :: if( in1.filled_dt_sk>=in0.ldd_eff_dt_sk and (is_null(in0.ldd_term_dt_sk) or in1.filled_dt_sk<=in0.ldd_term_dt_sk)) 
 'Y' else 'N';
  out.* :2: in1.*;
  out.drg_ldd_ind :: if(is_null(in0.drg_ldd_ind) or (in0.drg_ldd_ind=='-') ) 'N' else in0.drg_ldd_ind;
  out.drg_biosim_ind :: if(is_null(in0.drg_biosim_ind) or (in0.drg_biosim_ind=='-') ) 'N' else in0.drg_biosim_ind;
  out.claim_src_env_sk :: in1.src_env_sk;
  out.claim_prod_adjud_sk :: in1.prod_adjud_sk;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Join|447000|131500|0|0|0|0|1633|Join on prod_adjud_sk|Ab Initio Software|Built-in 1.0:|1|100|0||6||36865|1|{1|0|}}}
{2010203004|XXGoport|84|0|217|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|85|0|220|0|{@{}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|86|0|222|0|{@{}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|87|0|224|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|88|0|226|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|89|0|228|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|90|0|230|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|91|0|232|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|92|0|234|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|93|0|237|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|94|0|240|0|{Performs inner, outer, and semi-joins with multiple flows of data records. It maximizes performance by loading input data records into main memory.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?join|3|1|Hl||{0|}}
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
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|port_analysis|legacy_xfr;reject*=in*; unused*=in*; error*=^error|3|2|H$||{0|}}
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
{30001002|XXparameter|operation6|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
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
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,unused[*],reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: unused = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Join|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|95|0|242|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|96|0|245|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|97|0|248|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|98|0|251|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|99|0|254|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|100|0|257|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|101|0|260|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|102|0|263|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|103|0|266|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
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
{2010202004|XXGiport|104|0|284|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
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
{2010501005|XXGpvertex|105|0|310|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Database/Run_SQL.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|DBConfigFile|$DB_RXCLAIM_DBC|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|netezza|3|2|$|@{0|}}
{30001002|XXparameter|SQLFile|UPDATE ORX_IDW_DM_PRD..D_PRODUCT_ADJUD T
SET T.DRG_LDD_IND=S.DRG_LDD_IND,
T.UPDATE_TS=CURRENT_TIMESTAMP,
T.UPDATE_UID='LDD_IND_UPD'
FROM ORX_IDW_DM_ETL_PRD..D_PRODUCT_ADJUD_LDD S
WHERE T.PROD_ADJUD_SK=S.PROD_ADJUD_SK AND T.DRG_LDD_IND<>S.DRG_LDD_IND;|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
}}@4|Run SQL|1015000|553000|0|0|0|0|1700|LDD and BIOSIM Update stmts|Ab Initio Software|Built-in 2.2:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|106|0|312|0|{@{}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|107|0|314|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|108|0|316|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|109|0|318|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|110|0|320|0|{@{}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|111|0|322|0|{Executes SQL statements in a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|db-runsql|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/db_v2/bin/db-runsql|3|2|H$||{0|}}
{30001002|XXparameter|continuous|False|13|1|FKl|If true, makes this a Continuous Run SQL component|{0|}}
{30001002|XXparameter|continuous.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|DBConfigFile||22|2|RFOf$|Database Description File|{0|}}
{30001002|XXparameter|dbms||3|2|RF$|Database|{0|}}
{30001002|XXparameter|transaction_group||3|2|FK$|Name of the transaction group for participation in a shared transaction. Graph folding must be enabled.|{0|}}
{30001002|XXparameter|transaction_group.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|interface|api|15|1|FKl|Run commands using utility or via api|{2|api|utility|}}
{30001002|XXparameter|ansimode|True|13|1|FKl|Teradata: Use ANSI semantics if True; BTET semantics if False|{0|}}
{30001002|XXparameter|ansimode.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_drop_table_errors|False|13|1|FKl|Ignore failures from drop table statements|{0|}}
{30001002|XXparameter|ignore_drop_table_errors.condition|param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|num_errors|0|1|2|FK$|Maximum errors allowed|{0|}}
{30001002|XXparameter|num_errors.condition|param_exact interface api version :3.0.3.r14|3|15|P?|@{0|}}
{30001002|XXparameter|SQLFile|~null|32|2|FOf$|File with SQL to run|{0|}}
{30001002|XXparameter|ter_api_encrypt_data|True|13|1|l||{0|}}
{30001002|XXparameter|ter_api_encrypt_data.condition|param_exact dbms teradata param_exact interface api version 3.0.2:|3|15|P?|@{0|}}
{30001002|XXparameter|api_encrypt_data_helper|sameas ter_api_encrypt_data default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_encrypt_data|value api_encrypt_data_helper True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|encrypt_data|False|13|1|FKl|Encrypt data between database client and server (if possible)|{0|}}
{30001002|XXparameter|encrypt_data.condition|param_exact supports_encrypt_data True|3|15|P?|@{0|}}
{30001002|XXparameter|native_options_impl|value dbms netezza True value dbms mssql True value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|native_options_impl.condition|param_exact interface utility|3|15|P?|@{0|}}
{30001002|XXparameter|native_options||25|3|FKc|Optional commands passed directly to the database SQL utility.|{0|}}
{30001002|XXparameter|native_options.condition|param_exact native_options_impl True version 3.0.5.1:|3|15|P?|@{0|}}
{30001002|XXparameter|analyze_dependencies|True|13|1|Fl|Perform dependency analysis on the SQL in this component|{0|}}
{30001002|XXparameter|sql_analysis|SQLFile|3|2|H$||{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|param_exact interface api version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|version 3.0.3.r15: param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|version 3.0.3.r15: param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|rollback_all_rejects|False|13|1|Fl|In transactional section only, always rollback on reject|{0|}}
{30001002|XXparameter|rollback_all_rejects.condition|param reject-threshold Never*|3|15|P?|@{0|}}
{30001002|XXparameter|rollback_all_rejects_keyword|value reject-threshold Abort* False value reject-threshold Use* False sameas rollback_all_rejects default constant False|13|13|Kv|transactional reject behavior|{0|}}
{30001002|XXparameter|rollback_all_rejects_keyword.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit_keyword.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|num_errors maximum_errors limit_keyword limit ramp_keyword ramp rollback_all_rejects_keyword rollback_all_rejects|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|override_mpname|value continuous True db-runsql-continuous value continuous False db-runsql|3|13|v||{0|}}
{30001002|XXparameter|override_mpname.display_name|override-mpname|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|param_exact interface api version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|param_exact interface api version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|LayoutFlags|idb|3|2|H$|Enable Database Layouts|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? nobatch,publisher : nonrecoverable|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata_local|value_in_version :3.2.5.r23 recordstring(';')astmt;end value_in_version 3.2.5.r24: recordstring(';',charset='x-ab-internal')astmt;end|7|13|v|SQL statement format|{0|}}
{30001002|XXparameter|in_metadata|$in_metadata_local|7|2|F$|SQL statement format|{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; string('', charset='x-ab-internal') error_message; string('', charset='x-ab-internal') record_number; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_operations|4|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|$[[record kind 78 subkind 68 parts [vector]]]|9|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Run SQL|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|112|0|324|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|113|0|327|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|114|0|330|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|115|0|333|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|116|0|336|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=|SQL statement format|{0|}}
}}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|117|0|341|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{d_prod_adj.prod_id\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@2|Partition by Key|1090000|400000|0|0|0|0|1407|Partition by Key|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|118|0|343|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|119|0|346|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|120|0|349|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
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
{2010203004|XXGoport|121|0|351|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|122|0|354|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|123|0|357|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select|ind=='I'|3|2|$|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
  out.d_prod_adj.* :: in.*;
  out.d_prod_adj.is_equal :: 0;
  out.d_prod_adj.drop_record :: 0;
  out.d_prod_adj.matching__eff_dt :: NULL;
  out.d_prod_adj.dxf_src_dataset_id :: 0;
  out.d_prod_adj.dxf_src_rec_cnt :: 0;
  out.d_prod_adj.dxf_src_sys_id :: in.src_env_sk;
  out.d_prod_adj.dxf_src_file_name :: "";
  out.d_prod_adj.dxf_hk_part1 :: 0;
  out.d_prod_adj.dxf_hk_part2 :: 0;
  out.d_prod_adj.dxf_sk :: 0;
  out.d_prod_adj.prod_adjud_sk :: -1;
  out.prd_sts_rule.prod_status_rule_tbl_id :: NULL;
  out.des_ctgry_adj.dise_cat_nm :: in.dise_cat_sk;
  out.thrptc_cgry_adj.thrpc_class_nm :: in.thrpc_class_sk;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@2|Reformat|862000|381500|0|0|0|0|1645|Reformat-3|Ab Initio Software|Built-in 1.0:|1|100|0||6||36865|1|{1|0|}}}
{2010203004|XXGoport|124|0|359|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|125|0|362|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|126|0|364|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|127|0|366|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|128|0|368|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|129|0|371|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|130|0|373|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|131|0|377|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|132|0|380|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|133|0|383|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|134|0|386|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|135|0|389|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@2|Replicate|659000|340000|0|0|0|0|1400|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|136|0|391|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|137|0|395|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|138|0|398|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|139|0|400|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|140|0|403|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|141|0|414|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@3|Reformat|1389000|270000|0|0|0|0|1699|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|142|0|416|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|143|0|419|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|144|0|421|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|145|0|423|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|146|0|425|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|147|0|428|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|148|0|430|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|149|0|434|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|150|0|437|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|151|0|440|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|152|0|443|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010505005|XXGtvertex|153|0|446|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_Table.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 84 subkind 68 parts [vector]]]|3|9||@{0|}}
{30001002|XXparameter|config_file|$DB_RXCLAIM_STAGING_DBC|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|mode|0x000A|3|2|$|@{0|}}
{30001002|XXparameter|table_spec|D_PRODUCT_ADJUD_LDD|3|3|c|@{0|}}
{30001002|XXparameter|write_metadata|/* DML Generated for SQL: SELECT * FROM D_PRODUCT_ADJUD_U
 * On: Tue May 23 08:58:14 2023
 */
record
  decimal("\\x01",0) prod_adjud_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) prod_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) prod_id_qlfr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=70) prod_nm = NULL("") /*VARCHAR(70)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8) ahfs_cd = NULL("") /*VARCHAR(8)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_3rd_prty_excpn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11) drg_admin_rte_hitsb_desc = NULL("") /*VARCHAR(11)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_clsfctn_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_dea_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) drg_drg_intrctn_desc = NULL("") /*VARCHAR(80)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_fda_thrpc_eqvlc_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_grp_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30) drg_lbl_nm = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_maint_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_maint_src = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_mfrr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5) drg_ndc_lblr_cd = NULL("") /*VARCHAR(5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_ndc_pkg_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_ndc_prod_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11) drg_ndc_id = NULL("") /*VARCHAR(11)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_rx_otc_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) drg_stat_cd = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) drg_strngth_qty = NULL("") /*DECIMAL(11,3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_strngth_uom_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6) drg_sub_class_cd = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_unit_dose_use_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) gcn_no = NULL("") /*INTEGER*/;
  decimal("\\x01",0) gcn_seq_no = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=60) gen_nm = NULL("") /*VARCHAR(60)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) gen_medspn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) gen_ind_ovrd_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) gpi_list_qlfr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14) gpi_no = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_grp_gpi_02_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) drg_class_gpi_04_cd = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6) drg_sub_class_gpi_06_cd = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8) drg_bsic_nm_gpi_08_cd = NULL("") /*VARCHAR(8)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_extd_nm_gpi_10_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12) drg_dosag_frm_gpi_12_cd = NULL("") /*VARCHAR(12)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) dsg_frm_id = NULL("") /*VARCHAR(4)*/;
  decimal("\\x01",0) dise_cat_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) dise_cat_nm /*VARCHAR(80) NOT NULL*/;
  decimal("\\x01",0) thrpc_class_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=80) thrpc_class_nm /*VARCHAR(80) NOT NULL*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) wac_amt = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) wkrs_comp_alt_prod_cd = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) wkrs_comp_alt_prod_typ_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) prod_pref_list_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) admin_rte_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0) src_env_sk /*BIGINT NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") insert_ts /*TIMESTAMP(6) NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") update_ts /*TIMESTAMP(6) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) insert_uid = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) update_uid = NULL("") /*VARCHAR(20)*/;
  decimal("\\x01",0) run_id = NULL("") /*BIGINT*/;
  decimal("\\x01",0) rec_stat_cd = NULL("") /*BYTEINT*/;
  decimal("\\x01",0) prod_status_rule_tbl_id_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_ldd_ind = NULL("") /*VARCHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_biosim_ind = NULL("") /*VARCHAR(1)*/;
  decimal("\\x01",0) sec_flg = NULL("") /*SMALLINT*/;
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|nza__interface|api|3|1|l|@{0|}}
}}@3|Input Table|1620000|275000|0|0|0|0|1692|staging_table|Ab Initio Software|Built-in 2.2:|1|100|0||6||37121|}}
{2010203004|XXGoport|154|0|448|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|155|0|450|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|156|0|452|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010202004|XXGiport|157|0|454|0|{@{}@0|0|0|0|write|0.0|@@@1936|0|}}
{2010505005|XXGtvertex|158|0|457|0|{Unloads data records from a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|HelpID|HICOMP_INPUT_TABLE|3|2|H$||{0|}}
{30001002|XXparameter|config_file||22|2|RFf$||{0|}}
{30001002|XXparameter|table_spec||32|3|RFc||{0|}}
{30001002|XXparameter|table_spec_kind|table|15|1|RFl||{3|table|insert|select|}}
{30001002|XXparameter|db_is_ole|value dbms mssql True value dbms msjet True value dbms msaccess True value dbms oledb True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ora_interface.condition|param_exact dbms oracle mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface_new|FastExport|15|1|Fl|Unload data via api or utility|{5|api|FastExport|PT_export|PT_selector|PT_api_export|}}
{30001002|XXparameter|ter_interface_new.condition|param_exact dbms teradata mode input version 2.12:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface|sameas ter_interface_new|3|13|v||{0|}}
{30001002|XXparameter|ter_interface.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2eee_interface.condition|param_exact dbms db2eee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2ee_interface.condition|param_exact dbms db2ee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2_interface.condition|param_exact dbms db2 mode input version 3.2.4.r21:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss_interface_old.condition|param_exact dbms db2uss mode input version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss_interface.condition|param_exact dbms db2uss mode input version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_impl|sameas db2uss_interface sameas db2uss_interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss_interface_impl.condition|param_exact dbms db2uss mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mssql_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|mssql_interface.condition|param_exact dbms mssql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msjet_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msjet_interface.condition|param_exact dbms msjet mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msaccess_interface.condition|param_exact dbms msaccess mode input|3|15|P?|@{0|}}
{30001002|XXparameter|oledb_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|oledb_interface.condition|param_exact dbms oledb mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ole_interface|sameas mssql_interface sameas msjet_interface sameas msaccess_interface sameas oledb_interface|3|13|v||{0|}}
{30001002|XXparameter|ole_interface.condition|param_exact db_is_ole True mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_interface.condition|param_exact dbms odbc mode input|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|greenplum_interface.condition|param_exact dbms greenplum mode input|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|postgresql_interface.condition|param_exact dbms postgresql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|psqlodbc_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|psqlodbc_interface.condition|param_exact dbms psqlodbc mode input|3|15|P?|@{0|}}
{30001002|XXparameter|redshift_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|redshift_interface.condition|param_exact dbms redshift mode input|3|15|P?|@{0|}}
{30001002|XXparameter|snow_interface|api|15|1|Fl|Unload data via api or utility|{2|api|staged_unload|}}
{30001002|XXparameter|snow_interface.condition|param_exact dbms snowflake mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybase_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|sybase_interface.condition|param_exact dbms sybase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq_interface.condition|param_exact dbms sybaseiq mode input|3|15|P?|@{0|}}
{30001002|XXparameter|informix_interface|api|15|1|Fl|Unload data via api or utility|{4|api|dbaccess_serial|dbaccess_xps|pload|}}
{30001002|XXparameter|informix_interface.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ims_interface_old.condition|param_exact dbms ims mode input version :3.1.6.r26|3|15|P?|@{0|}}
{30001002|XXparameter|ims_interface|api|15|1|Fl|Unload data via api (local) or via IMS connect(remote) |{2|api|ims_connect|}}
{30001002|XXparameter|ims_interface.condition|param_exact dbms ims mode input version 3.1.6.r27:|3|15|P?|@{0|}}
{30001002|XXparameter|adabas_interface|api|15|1|Fl|Unload data via api or from backup tape|{2|api|backup_tape|}}
{30001002|XXparameter|adabas_interface.condition|param_exact dbms adabas mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mongo_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|mongo_interface.condition|param_exact dbms mongo mode input version 3.2.3.r18.0:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|hbase_interface.condition|param_exact dbms hbase mode input version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|cassandra_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|cassandra_interface.condition|param_exact dbms cassandra mode input version 3.3.2.r8:|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|nza_interface_old.condition|param_exact dbms netezza mode input version :2.15.7.m99|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface|api|15|1|Fl|Unload data via api or remote external table|{2|api|external_table|}}
{30001002|XXparameter|nza_interface.condition|param_exact dbms netezza mode input version 2.15.8:|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_impl|sameas nza_interface sameas nza_interface_old|3|13|v||{0|}}
{30001002|XXparameter|nza_interface_impl.condition|param_exact dbms netezza mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2_400_interface.condition|param_exact dbms db2_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_400_interface.condition|param_exact dbms odbc_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|aster_interface|api|15|1|Fl|Unload data via api or utility|{2|api|ncluster_export|}}
{30001002|XXparameter|aster_interface.condition|param_exact dbms aster mode input|3|15|P?|@{0|}}
{30001002|XXparameter|hana_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|hana_interface.condition|param_exact dbms hana mode input version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|jdbc_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|jdbc_interface.condition|param_exact dbms jdbc mode input version 3.3.2.r8:|3|15|P?|@{0|}}
{30001002|XXparameter|hive_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|hive_interface.condition|param_exact dbms hive mode input version 3.3.4:|3|15|P?|@{0|}}
{30001002|XXparameter|impala_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|impala_interface.condition|param_exact dbms impala mode input version 3.3.5.r19:|3|15|P?|@{0|}}
{30001002|XXparameter|ora__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|ora__interface.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter__interface|Multiload|15|1|Fl|Load data using api or utility|{11|api|Fastload|Multiload|Tpump|PT_load|PT_update|PT_stream|PT_inserter|PT_api_load|PT_api_update|PT_api_stream|}}
{30001002|XXparameter|ter__interface.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2eee__interface.condition|param_exact dbms db2eee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2ee__interface.condition|param_exact dbms db2ee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2__interface.condition|param_exact dbms db2 mode output version 3.2.4.r21:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_old|api|15|1|Fl|Load data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss__interface_old.condition|param_exact dbms db2uss mode output version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface|api|15|1|Fl|Load data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss__interface.condition|param_exact dbms db2uss mode output version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_impl|sameas db2uss__interface sameas db2uss__interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss__interface_impl.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface|utility|15|1|Fl|Load data using api, utility or bulkload|{3|api|utility|bulkload|}}
{30001002|XXparameter|mssql__interface.condition|param_exact dbms mssql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|mssql__interface_bad_choice.condition|param_exact dbms mssql mode output param_exact mssql__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|msjet__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msjet__interface.condition|param_exact dbms msjet mode output|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msaccess__interface.condition|param_exact dbms msaccess mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface|api|15|1|Fl|Load data using api or bulkload|{2|api|bulkload|}}
{30001002|XXparameter|oledb__interface.condition|param_exact dbms oledb mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|oledb__interface_bad_choice.condition|param_exact dbms oledb mode output param_exact oledb__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|ole__interface|sameas mssql__interface sameas msjet__interface sameas msaccess__interface sameas oledb__interface|3|13|v||{0|}}
{30001002|XXparameter|ole__interface.condition|param_exact db_is_ole True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|odbc__interface.condition|param_exact dbms odbc mode output|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum__interface|copy|15|1|Fl|Load data using api or utility|{3|api|copy|gpfdist|}}
{30001002|XXparameter|greenplum__interface.condition|param_exact dbms greenplum mode output|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql__interface|copy|15|1|Fl|Load data using api or utility|{2|api|copy|}}
{30001002|XXparameter|postgresql__interface.condition|param_exact dbms postgresql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|psqlodbc__interface|api|15|1|Fl|For utility loads, manually set the DBMS type parameter on the Data pane to Postgresql, Greenplum or Redshift and press 'NO' when asked if you want to resolve a conflict.  Do NOT change the dbms tag in the dbc file itself.|{1|api|}}
{30001002|XXparameter|psqlodbc__interface.condition|param_exact dbms psqlodbc mode output|3|15|P?|@{0|}}
{30001002|XXparameter|redshift__interface|copy|15|1|Fl|Load data using api or utility|{3|api|copy|copy_via_ssh|}}
{30001002|XXparameter|redshift__interface.condition|param_exact dbms redshift mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybase__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybase__interface.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq__interface.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|informix__interface|api|15|1|Fl|Load data using api or utility|{5|api|dbload|dbaccess_xps|pload|dbaccess_serial|}}
{30001002|XXparameter|informix__interface.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|adabas__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|adabas__interface.condition|param_exact dbms adabas mode output|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface_old|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|nza__interface_old.condition|param_exact dbms netezza mode output version :3.2.3.m99|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface|external_table|15|1|Fl|Load data using api, utility, or remote external table|{3|api|utility|external_table|}}
{30001002|XXparameter|nza__interface.condition|param_exact dbms netezza mode output version 3.2.4:|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface_impl|sameas nza__interface sameas nza__interface_old|3|13|v||{0|}}
{30001002|XXparameter|nza__interface_impl.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2_400__interface.condition|param_exact dbms db2_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|odbc_400__interface.condition|param_exact dbms odbc_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|aster__interface|api|15|1|Fl|Load data using api or utility|{2|api|ncluster_loader|}}
{30001002|XXparameter|aster__interface.condition|param_exact dbms aster mode output|3|15|P?|@{0|}}
{30001002|XXparameter|snow__interface|api|15|1|Fl|Load data using api mode or files-in-a-stage|{2|api|staged_load|}}
{30001002|XXparameter|snow__interface.condition|param_exact dbms snowflake mode output|3|15|P?|@{0|}}
{30001002|XXparameter|hana__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|hana__interface.condition|param_exact dbms hana mode output version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|hbase__interface.condition|param_exact dbms hbase mode output version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|cassandra__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|cassandra__interface.condition|param_exact dbms cassandra mode output version 3.3.2.r8:|3|15|P?|@{0|}}
{30001002|XXparameter|jdbc__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|jdbc__interface.condition|param_exact dbms jdbc mode output version 3.3.2.r8:|3|15|P?|@{0|}}
{30001002|XXparameter|hive__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|hive__interface.condition|param_exact dbms hive mode output version 3.3.4:|3|15|P?|@{0|}}
{30001002|XXparameter|impala__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|impala__interface.condition|param_exact dbms impala mode output version 3.3.5.r19:|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_param_must_exist|1|3|2|H$||{0|}}
{30001002|XXparameter|not_ims|value dbms ims False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_adabas|value dbms ims False value dbms adabas False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_unusual_dbms|value dbms ims False value dbms adabas False value dbms mongo False value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_iq|value dbms sybaseiq False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_hbase|value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_cassandra|value dbms cassandra False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|is_iq_util|value not_iq True False value sybaseiq_interface api False default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_iqutil|value not_ims False False value is_iq_util True False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_num_error|value interface_out api False value dbms netezza True value dbms oracle True value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms db2uss True value dbms sybase True value dbms sybaseiq True value dbms db2_400 True value dbms odbc_400 True value informix__interface dbload True value informix__interface pload True value informix__interface dbaccess_xps True value mssql__interface utility True value dbms cassandra True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_rows_per_commit|value interface_out api False value interface_out bulkload False value dbms oracle True value dbms mssql True value dbms sybase True value dbms sybaseiq True value informix__interface dbload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|db2eee_or_db2ee|value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_native_options|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value nza__interface_impl utility True value nza__interface_impl external_table True value nza__interface_impl api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False value db2ee__interface utility True value db2ee__interface api False value db2eee__interface utility True value db2eee__interface api False value db2__interface utility True value db2__interface api False value db2uss__interface_impl utility True value db2uss__interface_impl api False value db2uss_interface_impl api False value utility DSNTIIAUL False value utility UNLOAD True value nza_interface external_table True value nza_interface api False value cassandra__interface utility True value cassandra__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_control_file|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite|True|13|1|l||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite.condition|mode input param_exact not_unusual_dbms True param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ablocal_expr|value nza_interface external_table True value utility DSNTIAUL True value utility UNLOAD False value old_ablocal_prerequisite True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_gen_ldr_datatypes|value db2eee_or_db2ee True True value dbms db2uss True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ftype_pref_nondelimited|value field_type_preference delimited False value field_type_preference fixed True value field_type_preference variable True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_batchsize|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|no_partition_name|True|13|1|l||{0|}}
{30001002|XXparameter|no_partition_name.condition|param_exact dbms sybase version :3.1.1|3|15|P?|@{0|}}
{30001002|XXparameter|supports_partition_name|value ora__interface utility True value ora__interface api False value no_partition_name True False value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_reject_threshold|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_package|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_logging|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_logfile|value ter_util True True value interface_out copy True value interface_out copy_via_ssh True value interface_out gpfdist True value interface_out staged_load True value interface_out ncluster_loader True value interface_in staged_unload True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_api_load_transforms|value interface_out api True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_api_load_transforms.condition|version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_api_encrypt_data|True|13|1|l||{0|}}
{30001002|XXparameter|ter_api_encrypt_data.condition|param_exact dbms teradata version 3.0.2:|3|15|P?|@{0|}}
{30001002|XXparameter|api_encrypt_data_helper|sameas ter_api_encrypt_data default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_encrypt_data|value api_encrypt_data_helper True True value ter_util True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|interface_in|sameas ora_interface sameas ter_interface sameas db2eee_interface sameas db2ee_interface sameas db2_interface sameas db2uss_interface_impl sameas db2_400_interface sameas ole_interface sameas odbc_interface sameas odbc_400_interface sameas snow_interface sameas sybase_interface sameas sybaseiq_interface sameas informix_interface sameas ims_interface_old sameas ims_interface sameas adabas_interface sameas nza_interface_impl sameas mysql_interface sameas postgresql_interface sameas psqlodbc_interface sameas greenplum_interface sameas redshift_interface sameas vertica_interface sameas aster_interface sameas mongo_interface sameas hana_interface sameas hbase_interface sameas cassandra_interface sameas jdbc_interface sameas hive_interface sameas impala_interface|3|13|v||{0|}}
{30001002|XXparameter|interface_in.condition|mode input|3|15|P?|@{0|}}
{30001002|XXparameter|interface_out|sameas ora__interface sameas ter__interface sameas db2eee__interface sameas db2ee__interface sameas db2__interface sameas db2uss__interface_impl sameas db2_400__interface sameas ole__interface sameas odbc__interface sameas odbc_400__interface sameas sybase__interface sameas sybaseiq__interface sameas informix__interface sameas adabas__interface sameas nza__interface_impl sameas mysql__interface sameas psqlodbc__interface sameas postgresql__interface sameas greenplum__interface sameas redshift__interface sameas vertica__interface sameas aster__interface sameas snow__interface sameas hana__interface sameas hbase__interface sameas cassandra__interface sameas jdbc__interface sameas hive__interface sameas impala__interface|3|13|v||{0|}}
{30001002|XXparameter|interface_out.condition|mode output|3|15|P?|@{0|}}
{30001002|XXparameter|interface|sameas interface_in sameas interface_out|3|13|Kv||{0|}}
{30001002|XXparameter|fixed_size_dml|False|13|1|RFOl|Generate fixed size DML when possible|{0|}}
{30001002|XXparameter|fixed_size_dml.condition|param_exact not_ims_or_adabas True version :2.12.2.m4|3|15|P?|@{0|}}
{30001002|XXparameter|field_type_preference|delimited|15|1|RFKl|Format of generated dml|{3|delimited|variable|fixed|}}
{30001002|XXparameter|field_type_preference.condition|param_exact not_unusual_dbms True version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|generate_loader_datatypes|False|13|1|FKl|Any non-delimited data types in generated DML will be compatible with the utility loader.|{0|}}
{30001002|XXparameter|generate_loader_datatypes.condition|param_exact supports_gen_ldr_datatypes True param_exact ftype_pref_nondelimited True version 2.14.64:|3|15|P?|@{0|}}
{30001002|XXparameter|column_delimiter||3|2|FK$|Default generated column delimiter|{0|}}
{30001002|XXparameter|column_delimiter.condition|param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|encrypt_data|False|13|1|FKl|Encrypt data between database client and server (if possible)|{0|}}
{30001002|XXparameter|encrypt_data.condition|param_exact supports_encrypt_data True|3|15|P?|@{0|}}
{30001002|XXparameter|dml_with_default_values|none|15|1|RFKl|Generate dml with db default values (if possible)|{3|none|null_preferred|default_preferred|}}
{30001002|XXparameter|dml_with_default_values.condition|param_exact not_unusual_dbms True param_exact not_cassandra True version 3.2.3.r18.0:|3|15|P?|@{0|}}
{30001002|XXparameter|logfile||18|2|FK$|Name of file to store utility log information (optional)|{0|}}
{30001002|XXparameter|logfile.condition|param_exact supports_logfile True|3|15|P?|@{0|}}
{30001002|XXparameter|max_rows||1|2|FK$|Maximum rows to unload|{0|}}
{30001002|XXparameter|max_rows.condition|mode input param_exact not_ims_or_iqutil True|3|15|P?|@{0|}}
{30001002|XXparameter|ablocal_expr||3|2|FK$|DML expression for ABLOCAL() in select|{0|}}
{30001002|XXparameter|ablocal_expr.condition|param_exact supports_ablocal_expr True|3|15|P?|@{0|}}
{30001002|XXparameter|remove_delimiters|False|13|1|RFOl|Remove delimiters found in data|{0|}}
{30001002|XXparameter|remove_delimiters.condition|param_exact interface api mode input version 2.7: param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|delimiter_replacement||3|2|FK$|Replacement for field delimiters found in data|{0|}}
{30001002|XXparameter|delimiter_replacement.condition|param_exact interface api mode input version 2.7: param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|non_ansimode||13|1|RFKl|If true, process the select statement using Teradata semantics (like Fast Export/PT Export does); false means use Ansi semantics|{0|}}
{30001002|XXparameter|non_ansimode.condition|param_exact ter_interface api version 2.15.2:|3|15|P?|@{0|}}
{30001002|XXparameter|num_errors|50|1|2|FK$|Maximum number of errors allowed|{0|}}
{30001002|XXparameter|num_errors.condition|mode output param_exact supports_num_error True|3|15|P?|@{0|}}
{30001002|XXparameter|commitNumber||1|2|FK$|Number of records per commit checkpoint|{0|}}
{30001002|XXparameter|commitNumber.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|commitTable||24|3|FKc|Database table to store commit progress|{0|}}
{30001002|XXparameter|commitTable.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|jobid||25|3|FKc|For special purpose use only - see 'Help'|{0|}}
{30001002|XXparameter|jobid.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|ignoreDuplicates|False|13|1|Fl|if true, ignore unique constraint violations|{0|}}
{30001002|XXparameter|ignoreDuplicates.condition|mode output param_exact interface api param_exact not_hbase True param_exact not_cassandra True version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|no_actions_ok|value ignoreDuplicates True True value ignoreDuplicates False False default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|no_actions_ok.condition|mode output param_exact interface api version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize||1|2|FK$|Size of batch when using array mode|{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize.condition|mode output param_exact interface api version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|rows_per_commit||1|2|FK$|Rows per commit|{0|}}
{30001002|XXparameter|rows_per_commit.condition|mode output param_exact supports_rows_per_commit True|3|15|P?|@{0|}}
{30001002|XXparameter|batch_size|4096|1|2|FK$|Records processed in each batch|{0|}}
{30001002|XXparameter|batch_size.condition|mode output param_exact supports_batchsize True|3|15|P?|@{0|}}
{30001002|XXparameter|is_serial|False|13|1|FKl|Set to true to specify a serial load.|{0|}}
{30001002|XXparameter|is_serial.condition|mode output param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|file_type|delimited|15|1|FKl|Format of data to be loaded. If 'fixed', Output Table reformats the data to the loader's specifications.|{2|delimited|fixed|}}
{30001002|XXparameter|file_type.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.67:|3|15|P?|@{0|}}
{30001002|XXparameter|file_type_modifier||25|3|FKc|Enter desired file type modifiers.|{0|}}
{30001002|XXparameter|file_type_modifier.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|copy_target||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|copy_target.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|row_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|row_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|save_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|save_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|data_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|data_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|sort_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|sort_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|hold_quiesce|False|13|1|FKl|Set to True to leave the utility in quiesced exclusive state.|{0|}}
{30001002|XXparameter|hold_quiesce.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|cpu_parallelism|1|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|cpu_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|disk_parallelism|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|disk_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|recoverable|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|recoverable.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|indexing_mode|autoselect|15|1|FKl|Refer to DB2 UDB documentation for description.|{4|autoselect|rebuild|incremental|deferred|}}
{30001002|XXparameter|indexing_mode.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|access_level|allow_no_access|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|allow_no_access|allow_read_access|}}
{30001002|XXparameter|access_level.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_tablespace||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|use_tablespace.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.101:|3|15|P?|@{0|}}
{30001002|XXparameter|lock_with_force|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|lock_with_force.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|check_pending|deferred|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|immediate|deferred|}}
{30001002|XXparameter|check_pending.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|statsopt|none|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|none|use_profile|}}
{30001002|XXparameter|statsopt.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_exception_table|False|13|1|FKl|Set to True to use exception table.|{0|}}
{30001002|XXparameter|use_exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|exception_table||25|3|FKc|Use only if you want to explicity specify the name for the exception table.|{0|}}
{30001002|XXparameter|exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|aster_dummy|a|3|2|$||{0|}}
{30001002|XXparameter|aster_util_in|value aster_interface api False value aster_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util_in.condition|param_exact dbms aster mode input|3|15|P?|@{0|}}
{30001002|XXparameter|aster_util_out|value aster__interface api False value aster__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util_out.condition|param_exact dbms aster mode output|3|15|P?|@{0|}}
{30001002|XXparameter|aster_util|value aster_util_in True True value aster_util_out True True value aster_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util.condition|param_exact dbms aster|3|15|P?|@{0|}}
{30001002|XXparameter|uses_legacy_inheritance|False|13|1|FKl|Set to True if table uses legacy parent/child inheritance |{0|}}
{30001002|XXparameter|uses_legacy_inheritance.condition|param_exact aster_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|allow_errors|False|13|1|FKl|If true, write errors to error table OR (if false) abort load on first error|{0|}}
{30001002|XXparameter|allow_errors.condition|param_exact aster_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|error_table||3|2|FK$|User-specified errtable name (optional)|{0|}}
{30001002|XXparameter|error_table.condition|param_exact allow_errors True|3|15|P?|@{0|}}
{30001002|XXparameter|label||3|2|FK$|Optional string to identify errors from this load in error table|{0|}}
{30001002|XXparameter|label.condition|param_exact allow_errors True|3|15|P?|@{0|}}
{30001002|XXparameter|like_postg|value dbms postgresql True value dbms greenplum True value dbms redshift True value dbms Redshift True default constant False|13|13|v||{0|}}
{30001002|XXparameter|db_type|sameas dbms|3|13|Kv|psqlodbc needs this param set|{0|}}
{30001002|XXparameter|db_type.condition|mode output param_exact like_postg True|3|15|P?|@{0|}}
{30001002|XXparameter|gpfdist_log_prefix||18|2|FK$|Use this to override the log file path prefix in the gpdfdist configuration file (optional)|{0|}}
{30001002|XXparameter|gpfdist_log_prefix.condition|param_exact greenplum__interface gpfdist|3|15|P?|@{0|}}
{30001002|XXparameter|stage_name||3|2|FK$|optional name of stage.  If specified, MUST be in format defined for dbc file's default_stage parameter.|{0|}}
{30001002|XXparameter|stage_name.condition|param_exact dbms snowflake param_exact interface staged_*|3|15|P?|@{0|}}
{30001002|XXparameter|put_parallel_threads||1|2|FK$|Number of threads to use with PUT command|{0|}}
{30001002|XXparameter|put_parallel_threads.condition|param_exact dbms snowflake param_exact interface staged_load|3|15|P?|@{0|}}
{30001002|XXparameter|inf_dummy|a|3|2|$||{0|}}
{30001002|XXparameter|inf_util_in|value informix_interface api False value informix_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_in.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util_out|value informix__interface api False value informix__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_out.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util|value inf_util_in True True value inf_util_out True True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util.condition|param_exact dbms informix|3|15|P?|@{0|}}
{30001002|XXparameter|inf_use_rej|value informix__interface dbaccess_xps True value informix__interface dbload True value informix__interface pload True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_use_rej.condition|param_exact inf_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|idelim|\||3|2|FK$|One-character delimiter for Informix utilities|{0|}}
{30001002|XXparameter|idelim.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pdqpriority||3|2|FK$|DEFAULT, LOW, HIGH, ...|{0|}}
{30001002|XXparameter|pdqpriority.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|jobname||3|2|RFK$|Jobname for High-performance Load/Unload|{0|}}
{30001002|XXparameter|jobname.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|pload_job_method|new|15|1|RFKl||{3|new|overwrite|reuse|}}
{30001002|XXparameter|pload_job_method.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|isolation||3|2|FK$|'set isolation' choices: DIRTY READ, COMMITTED READ, ...|{0|}}
{30001002|XXparameter|isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|ansi_isolation|default|15|1|FKl|'set transaction' isolation choices|{5|default|READ COMMITTED|REPEATABLE READ|SERIALIZABLE|READ UNCOMMITTED|}}
{30001002|XXparameter|ansi_isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|force_raw|False|13|1|FKl|If true, temporarily alters table log mode to RAW|{0|}}
{30001002|XXparameter|force_raw.condition|param_exact inf_util_out True param_exact informix__interface dbaccess_xps|3|15|P?|@{0|}}
{30001002|XXparameter|rejectfile||3|2|RFK$|Rejectfile specification for Informix load utility|{0|}}
{30001002|XXparameter|rejectfile.condition|param_exact inf_use_rej True|3|15|P?|@{0|}}
{30001002|XXparameter|dummy1|a|3|2|$||{0|}}
{30001002|XXparameter|ter_util_in|value ter_interface api False value ter_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util_out|value ter__interface api False value ter__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util|value ter_util_in True True value ter_util_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_in|value ter_interface WB_* True value ter_interface PT_* True value ter_interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_out|value ter__interface WB_* True value ter__interface PT_* True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb|value ter_wb_in True True value ter_wb_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_fload|value ter__interface Fastload True value ter__interface WB_load True value ter__interface PT_load True value ter__interface PT_api_load True value ter__interface AB_Fastload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_fload.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_tpump|value ter__interface Tpump True value ter__interface WB_stream True value ter__interface PT_stream True value ter__interface PT_api_stream True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_tpump.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_m_or_t|value ter__interface PT_inserter False value ter_is_fload False True value ter_is_fload True False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_m_or_t.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_mload_only|value ter__interface Multiload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_mload_only.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_show_brief|value ter_m_or_t True True value ter_util_in True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_show_brief.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|brief|True|13|1|FKl|Ask utility to generate brief log info if TRUE|{0|}}
{30001002|XXparameter|brief.condition|param_exact ter_show_brief True|3|15|P?|@{0|}}
{30001002|XXparameter|sleep|6|1|2|FK$|Minutes to wait before retrying logon|{0|}}
{30001002|XXparameter|sleep.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|tenacity|0|1|2|FK$|Maximum hours to attempt logon before utility gives up|{0|}}
{30001002|XXparameter|tenacity.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|sessions||3|2|FK$|Number of  sessions|{0|}}
{30001002|XXparameter|sessions.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|instances|1|1|2|FK$|Number of Parallel Transporter operator instances|{0|}}
{30001002|XXparameter|instances.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|logtab_name||3|2|FK$|User-specified logtable name (optional)|{0|}}
{30001002|XXparameter|logtab_name.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|no_spool|False|13|1|FKl|If True, do not spool output if possible|{0|}}
{30001002|XXparameter|no_spool.condition|param_exact ter_util_in True version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|use_load_isolation|False|13|1|FKl|Use Teradata load isolation capability when loading data|{0|}}
{30001002|XXparameter|use_load_isolation.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|tablewait|0|1|2|FK$|Number of hours to wait on other load tasks before utility gives up|{0|}}
{30001002|XXparameter|tablewait.condition|param_exact ter_is_mload_only True|3|15|P?|@{0|}}
{30001002|XXparameter|vartext|False|13|1|FKl|Send data to Teradata load utility in VARTEXT mode|{0|}}
{30001002|XXparameter|vartext.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|delim|\||3|2|FK$|delimiter for Teradata load utility|{0|}}
{30001002|XXparameter|delim.condition|param_exact vartext True|3|15|P?|@{0|}}
{30001002|XXparameter|np_axsmod_dir||26|2|RFK$|Name of directory for Named Pipe AXSMOD storage (required)|{0|}}
{30001002|XXparameter|np_axsmod_dir.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|checkpoint||1|2|FK$|Checkpoint rate to be used by Teradata utility|{0|}}
{30001002|XXparameter|checkpoint.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|worktab_name||3|2|FK$|User-specified worktable name (optional)|{0|}}
{30001002|XXparameter|worktab_name.condition|param_exact ter_util_out True param_exact ter_m_or_t True param_exact ter_is_tpump False|3|15|P?|@{0|}}
{30001002|XXparameter|errtab_name||3|2|FK$|User-specified errtable name (optional) [will have 1,2.. appended]|{0|}}
{30001002|XXparameter|errtab_name.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|macrodb||3|2|FK$|Database to use for Tpump macro creation and usage|{0|}}
{30001002|XXparameter|macrodb.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|errlimit||1|2|FK$|number errors allowed|{0|}}
{30001002|XXparameter|errlimit.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|errpercent||1|2|FK$|% errors allowed|{0|}}
{30001002|XXparameter|errpercent.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_dupl_rows|False|13|1|FKl|If true, ignore duplicate rows on insert|{0|}}
{30001002|XXparameter|ignore_dupl_rows.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|serialize|False|13|1|FKl|Guarantee serializability of operations on the same key if true|{0|}}
{30001002|XXparameter|serialize.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|pack|1|1|2|FK$|# of records to pack into a Tpump request or a TPT Update buffer|{0|}}
{30001002|XXparameter|pack.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|rate||1|2|FK$|# of statements per minute to send to Teradata database|{0|}}
{30001002|XXparameter|rate.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|trace_directory||26|2|FK$|directory for trace/debug info (optional)|{0|}}
{30001002|XXparameter|trace_directory.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|axsmod_tracelevel|None|3|2|FK$|for axsmod debugging|{0|}}
{30001002|XXparameter|axsmod_tracelevel.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pt_tracelevel|None|3|2|FK$|for Parallel Transporter (was TWB) debugging|{0|}}
{30001002|XXparameter|pt_tracelevel.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|ora_util_out|value ora__interface utility True value ora__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_util_out.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oracle_max_kb||1|2|FK$|max kilobytes for each parallel unload select|{0|}}
{30001002|XXparameter|oracle_max_kb.condition|param_exact dbms oracle mode input version 2.10.12.m12:|3|15|P?|@{0|}}
{30001002|XXparameter|parallel_mode|rowid|15|1|RFKl|method of automatic parallelism|{3|rowid|subpartition|partition|}}
{30001002|XXparameter|parallel_mode.condition|param_exact dbms oracle mode input version 2.14:|3|15|P?|@{0|}}
{30001002|XXparameter|include_partitions||17|2|FKf$|Optional list of partitions to extract|{0|}}
{30001002|XXparameter|include_partitions.condition|param_exact dbms oracle mode input version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|flashback_queries|False|13|1|FKl|Employ Oracle flashback queries|{0|}}
{30001002|XXparameter|flashback_queries.condition|param_exact dbms oracle mode input version 3.2.6.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|system_change_number||1|2|FK$|optional System Change Number|{0|}}
{30001002|XXparameter|system_change_number.condition|param_exact flashback_queries True version 3.2.6.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|direct|True|13|1|RFOl|Use SQL*Loader Direct Mode|{0|}}
{30001002|XXparameter|direct.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|num_discards||1|2|FK$|# discards allowed|{0|}}
{30001002|XXparameter|num_discards.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|bindsize||1|2|FK$|SQL*Loader BINDSIZE setting|{0|}}
{30001002|XXparameter|bindsize.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|control_file||17|2|FKf$|Optional database load utility control file|{0|}}
{30001002|XXparameter|control_file.condition|param_exact supports_control_file True version 2.7:|3|15|P?|@{0|}}
{30001002|XXparameter|partition_name||3|2|FK$|Database partition name|{0|}}
{30001002|XXparameter|partition_name.condition|param_exact supports_partition_name True|3|15|P?|@{0|}}
{30001002|XXparameter|native_options||25|3|FKc|Optional commands passed directly to the database load utility.|{0|}}
{30001002|XXparameter|native_options.condition|param_exact supports_native_options True|3|15|P?|@{0|}}
{30001002|XXparameter|syb_util_out|value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|syb_util_out.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_util_out|value sybaseiq__interface utility True value sybaseiq__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|sybaseiq_util_out.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|row_delimited_by|if appropriate|15|1|FKl|Generate ROW DELIMITED BY clause in control file when appropriate.|{2|if appropriate|never|}}
{30001002|XXparameter|row_delimited_by.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|quoted_identifiers|always|15|1|FKl|Quote column names in generated control file.|{2|always|never|}}
{30001002|XXparameter|quoted_identifiers.condition|param_exact sybaseiq_util_out True version :3.0.3.r14|3|15|P?|@{0|}}
{30001002|XXparameter|supports_constraint|True|13|1|Kl||{0|}}
{30001002|XXparameter|supports_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|unique_constraint|True|13|1|FKl|If True, include UNIQUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|unique_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|null_constraint|True|13|1|FKl|If True, include NULL as a load constraint to ignore.|{0|}}
{30001002|XXparameter|null_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|foreign_key_constraint|False|13|1|FKl|If True, include FOREIGN KEY as a load constraint to ignore.|{0|}}
{30001002|XXparameter|foreign_key_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|data_value_constraint|False|13|1|FKl|If True, include DATA VALUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|data_value_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ims_api_in|value ims_interface_old api True value ims_interface api True value ims_interface ims_connect False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ims_api_in.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_remote_in|value ims_interface ims_connect True value ims_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ims_remote_in.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_api_or_remote_in|value ims_api_in True True value ims_remote_in True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|batch_mode|DLI|15|1|RFKl|Run standalone batch or in a batch message processing region|{2|DLI|BMP|}}
{30001002|XXparameter|batch_mode.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|parent_segment_data|key_only|15|1|RFKl|Unload just the keys from parents, or all the data|{2|key_only|full_segment|}}
{30001002|XXparameter|parent_segment_data.condition|param_exact ims_api_or_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|generate_unique_key|False|13|1|FKl|Generate a unique for segments with no unique key|{0|}}
{30001002|XXparameter|generate_unique_key.condition|param_exact ims_api_or_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_ims_path_command|m_db ims_path|3|2|$|Command to generate list of segments|{0|}}
{30001002|XXparameter|_ab_ims_path_command_params|config_file positional table_spec keyword|3|2|$|List of parameters for path command|{0|}}
{30001002|XXparameter|ims_path|generated _ab_ims_path_command page_change|3|13|FHv|List of segments from root to segment|{0|}}
{30001002|XXparameter|ims_path.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|ims_path.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ssa_||3|2|FK$|SSA qualifier for this segment|{0|}}
{30001002|XXparameter|ssa_.index|ims_path|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.index_name|ssa_|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_parameters||3|2|FK$|Other ims parameters|{0|}}
{30001002|XXparameter|ims_parameters.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|alternate_psbname||3|2|FK$|Alternate PSB name to use when starting DFSRRC00|{0|}}
{30001002|XXparameter|alternate_psbname.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|ims_batch_size|10|1|2|RFK$|Number of records to request per call|{0|}}
{30001002|XXparameter|ims_batch_size.condition|param_exact ims_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|file_number||1|2|FK$|Set to valid file number to bypass PREDICT for file number lookup.|{0|}}
{30001002|XXparameter|file_number.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|backup_dataset||3|2|FK$|DSN of backup tape|{0|}}
{30001002|XXparameter|backup_dataset.condition|mode input param_exact dbms adabas param_exact adabas_interface backup_tape|3|15|P?|@{0|}}
{30001002|XXparameter|file_password||3|2|FK$|Adabas password in encrypted form (m_passwd).|{0|}}
{30001002|XXparameter|file_password.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|nza_util_out|value nza__interface_impl utility True value nza__interface_impl external_table True value nza__interface_impl api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|nza_util_out.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|local_log_path||3|2|FK$|local path to log directory mapped from NPS server|{0|}}
{30001002|XXparameter|local_log_path.condition|version :3.2.0|3|15|P?|@{0|}}
{30001002|XXparameter|server_log_path||3|2|FK$|path on NPS server to log directory|{0|}}
{30001002|XXparameter|server_log_path.condition|version :3.2.0|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_util_out|value db2uss__interface_impl utility True value db2uss__interface_impl api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|db2uss_util_out.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|utility|DSNTIAUL|15|1|FKl|IBM utility used to unload the database|{2|DSNTIAUL|UNLOAD|}}
{30001002|XXparameter|utility.condition|mode input param_exact db2uss_interface_impl utility version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|supports_utility_id|value db2uss_util_out True True value utility UNLOAD True value utility DSNTIAUL False default constant False|13|13|v||{0|}}
{30001002|XXparameter|utility_ID||3|2|FK$|Unique ID for DB2 utility job|{0|}}
{30001002|XXparameter|utility_ID.condition|param_exact interface utility param_exact supports_utility_id True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|temp_dataset||28|2|FK$|MVS dataset for UNLOAD output|{0|}}
{30001002|XXparameter|temp_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|image_copy_dataset||28|2|FK$|Optional DB/2 image copy dataset or datasets from which to unload data|{0|}}
{30001002|XXparameter|image_copy_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|tablespace||3|2|FK$|If unloading from an image copy dataset, the name of the tablespace which contains the data from the target table|{0|}}
{30001002|XXparameter|tablespace.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|partition||3|2|FK$|If unloading from a partitioned table, the partition number or range to unload|{0|}}
{30001002|XXparameter|partition.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 3.5.2.r9:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSREC_dataset||28|2|FK$|MVS dataset for utility input|{0|}}
{30001002|XXparameter|SYSREC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSDISC_dataset||28|2|FK$|Optional MVS dataset for utility rejects|{0|}}
{30001002|XXparameter|SYSDISC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSERR_dataset||28|2|FK$|Optional MVS dataset for utility error output|{0|}}
{30001002|XXparameter|SYSERR_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSUT1_dataset||28|2|FK$|Optional MVS work dataset for sort input|{0|}}
{30001002|XXparameter|SYSUT1_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SORTOUT_dataset||28|2|FK$|Optional MVS work dataset for sort output|{0|}}
{30001002|XXparameter|SORTOUT_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSMAP_dataset||28|2|FK$|Optional MVS work dataset for utility error processing|{0|}}
{30001002|XXparameter|SYSMAP_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSCOPY_dataset||28|2|FK$|Optional MVS dataset for an inline image copy|{0|}}
{30001002|XXparameter|SYSCOPY_dataset.condition|param_exact db2uss_util_out True version 3.5.3.r11:|3|15|P?|@{0|}}
{30001002|XXparameter|use_mssql_bulk_out|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|keep_identity|False|13|1|FKl|When "True" user must provide values for identity columns.|{0|}}
{30001002|XXparameter|keep_identity.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|keep_nulls|False|13|1|FKl|When "true" a null input value will store a null, not the column default value.|{0|}}
{30001002|XXparameter|keep_nulls.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|hints||3|2|FK$|The same as the "-h" option to bcp.|{0|}}
{30001002|XXparameter|hints.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|as400_util_out|value db2_400__interface utility True value db2_400__interface api False value odbc_400__interface utility True value odbc_400__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|hostname||3|2|FK$|Name of AS/400 system|{0|}}
{30001002|XXparameter|hostname.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|rebuild_loader|False|13|1|FKl|If True, rebuild the RPG table loader program on the AS/400.|{0|}}
{30001002|XXparameter|rebuild_loader.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_data_path||3|2|FK$|Location, on the AS/400, where data will be landed|{0|}}
{30001002|XXparameter|ifs_data_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_dml_path||3|2|FK$|Location, on the AS/400, where dml files will be landed|{0|}}
{30001002|XXparameter|ifs_dml_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|mongo_api_in|value mongo_interface api True default constant False|13|13|v||{0|}}
{30001002|XXparameter|mongo_api_in.condition|param_exact dbms mongo mode input|3|15|P?|@{0|}}
{30001002|XXparameter|continue_on_bad_type|False|13|1|RFKl|False will abort if a Mongo document is read which cannot be translated into the port DML.  True will skip the document and continue processing.|{0|}}
{30001002|XXparameter|continue_on_bad_type.condition|param_exact mongo_api_in True version 3.2.3.r18:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_api|value interface_out utility False value dbms hbase True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|hbase_utility|value interface_out utility True value dbms hbase True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|filterstring||3|2|FK$|Thrift filterstring|{0|}}
{30001002|XXparameter|filterstring.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|columns||3|2|FK$|List of column names to load or unload; names are <family>:<qualifier> and separated by spaces|{0|}}
{30001002|XXparameter|columns.condition|param_exact dbms hbase param_exact hbase_api True|3|15|P?|@{0|}}
{30001002|XXparameter|timestamp||1|2|FK$|target timestamp (8-byte signed integer)|{0|}}
{30001002|XXparameter|timestamp.condition|param_exact dbms hbase|3|15|P?|@{0|}}
{30001002|XXparameter|start_rowkey||3|2|FK$|lower rowkey bound (inclusive) to unload|{0|}}
{30001002|XXparameter|start_rowkey.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|stop_rowkey||3|2|FK$|upper rowkey bound (exclusive) to unload|{0|}}
{30001002|XXparameter|stop_rowkey.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|skip_WAL|False|13|1|FKl|omit write to HBase WAL|{0|}}
{30001002|XXparameter|skip_WAL.condition|param_exact dbms hbase mode output param_exact hbase_api True|3|15|P?|@{0|}}
{30001002|XXparameter|sort_rowkeys|True|13|1|FKl|Sort incoming record stream on rowkey|{0|}}
{30001002|XXparameter|sort_rowkeys.condition|param_exact dbms hbase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sort_columns|True|13|1|FKl|Sort value vectors in each record on family and column names|{0|}}
{30001002|XXparameter|sort_columns.condition|param_exact dbms hbase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|default_family||3|2|FK$|default column_family (used for flat record format only)|{0|}}
{30001002|XXparameter|default_family.condition|param_exact dbms hbase|3|15|P?|@{0|}}
{30001002|XXparameter|rowkey_field||3|2|FK$|field name for rowkey (used for flat record format only)|{0|}}
{30001002|XXparameter|rowkey_field.condition|param_exact dbms hbase|3|15|P?|@{0|}}
{30001002|XXparameter|tmp_file_mode|660|3|2|FK$|octal file mode must allow read by HBase server|{0|}}
{30001002|XXparameter|tmp_file_mode.condition|param_exact dbms hbase param_exact hbase_utility True param_exact hbase_api False|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_configfile||3|2|FK$|optional configuration file used by HBase for load|{0|}}
{30001002|XXparameter|hbase_configfile.condition|param_exact dbms hbase param_exact hbase_utility True param_exact hbase_api False|3|15|P?|@{0|}}
{30001002|XXparameter|cassandra_api|value interface_out utility False value dbms cassandra True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|cassandra_utility|value interface_out utility True value dbms cassandra True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|chunksize||1|2|FK$|Chunk size for worker processes|{0|}}
{30001002|XXparameter|chunksize.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ingestrate||1|2|FK$|Approx. ingest rate|{0|}}
{30001002|XXparameter|ingestrate.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|max_batchsize||1|2|FK$|Max size of import batch|{0|}}
{30001002|XXparameter|max_batchsize.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|min_batchsize||1|2|FK$|Min size of import batch|{0|}}
{30001002|XXparameter|min_batchsize.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|num_processes||1|2|FK$|Number of worker processes|{0|}}
{30001002|XXparameter|num_processes.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ttl_seconds||1|2|FK$|Time to live in seconds|{0|}}
{30001002|XXparameter|ttl_seconds.condition|param_exact dbms cassandra mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_escaped_by||3|2|FK$|[SQL statement modifier] A string (usually, one-character) defining a character escape sequence.  If non-empty, the SQL statement used for loading the data will be modified accordingly.  A given database's rules may be fairly complex -- read its documentation if you specify any value here.|{0|}}
{30001002|XXparameter|ss_escaped_by.condition|mode output param_exact supports_ss_escaped_by True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_escaped_by|value mysql__interface utility True value mysql__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_string_for_null||3|2|FK$|[SQL statement modifier] The string representing the database NULL.  An empty string here means just that, not the database-specific default, which has to be specified explicitly.  Read the database documentation for a bulk-insert SQL statement to find the latter.|{0|}}
{30001002|XXparameter|ss_string_for_null.condition|mode output param_exact supports_ss_string_for_null True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_string_for_null|value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_appendix||3|2|FK$|[SQL statement modifier] A free-form string going to the end of the SQL statement.  An arbitrary string to be appended to the end of the SQL statement used for data  loading (e.g. DIRECT).  Use this carefully to experiment with loading options:  there is no guarantee that the modified statement will work or result in a better  performance.  Read the database documentation and watch logs to understand the  possible modifications here and their operational impact.|{0|}}
{30001002|XXparameter|ss_appendix.condition|mode output param_exact supports_ss_appendix True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_appendix|value mysql__interface utility True value mysql__interface api False value postgresql__interface copy True value postgresql__interface api False value greenplum__interface api False value greenplum__interface copy True value greenplum__interface gpfdist True value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|mysql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|mysql_interface.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_in|value mysql_interface utility True value mysql_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_in.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|mysql__interface.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_out|value mysql__interface utility True value mysql__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_out.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_duplicate_rows_handling|ignore|15|1|FKl|[SQL statement modifier] Handling of input rows that duplicate existing rows on unique key values.  With 'ignore', input rows that duplicate an existing row on a unique key value are skipped.  With 'replace', input rows replace existing rows.|{2|ignore|replace|}}
{30001002|XXparameter|ss_duplicate_rows_handling.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_character_set||3|2|FK$|[SQL statement modifier] Character set that MySQL uses to interpret the incoming data flow.  If not specified, determined by MySQL server 'character_set_database' system variable.|{0|}}
{30001002|XXparameter|ss_character_set.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|vertica_interface.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_in|value vertica_interface utility True value vertica_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_in.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|vertica__interface.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_out|value vertica__interface utility True value vertica__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_out.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|gendml_param_names|column_delimiter fixed_size_dml field_type_preference dml_with_default_values generate_loader_datatypes ablocal_expr parent_segment_data generate_unique_key file_password file_number|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params|ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss|ablocal_expr db2uss_util_out utility|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss.condition|param_exact dbms db2uss|3|15|P?|@{0|}}
{30001002|XXparameter|m_db_layout_param_names|sameas m_db_layout_params_db2uss sameas m_db_layout_params|3|13|Hv||{0|}}
{30001002|XXparameter|m_db_dump_param_names|remove_delimiters delimiter_replacement ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|dbms||3|2|RF$|Database|{0|}}
{30001002|XXparameter|override_mpname|value dbms ims itable-ims value dbms mongo itable-mongo default dollar_substitution itable|3|13|v||{0|}}
{30001002|XXparameter|override_mpname.display_name|override-mpname|3|9|P|@{0|}}
{30001002|XXparameter|override_mpname.condition|mode input mode input|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Functions for deciding whether to abort or retry a transaction|{0|}}
{30001002|XXparameter|package.condition|mode output param_exact supports_package True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold.condition|mode output param_exact supports_reject_threshold True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|mode output param_exact supports_logging True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_error_group|value interface api True value mssql__interface bulkload True value ter_util True True value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16: mode output param_exact supports_error_group True|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|_ab_insert_statement_supported|value dbms ims False value dbms adabas False value interface_out api True value dbms teradata True value dbms informix True value dbms aster True value dbms mongo False value dbms hbase False value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|_ab_select_statement_supported|value dbms "" True value dbms ims False value dbms adabas False value dbms mongo False value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|$[[record kind 84 subkind 68 parts [vector]]]|9|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")
metadata type: reject = write
metadata type: error = remote("$AB_HOME/include/error-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|table_spec.custom_editor_key|SelectEditor|3|9|P|@{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|9|Hn|False means use legacy string newline format|{0|}}
}}@0|Input Table|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|}}
{2010203004|XXGoport|159|0|459|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|160|0|462|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|161|0|465|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010202004|XXGiport|162|0|468|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|163|0|478|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select|ind=='U'|3|2|$|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Reformat|857000|271500|0|0|0|0|1677|Reformat-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||36865|1|{1|0|}}}
{2010203004|XXGoport|164|0|480|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|165|0|483|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|166|0|485|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|167|0|487|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|168|0|489|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|169|0|492|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|170|0|494|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|171|0|498|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|172|0|501|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|173|0|504|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|174|0|507|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|175|0|516|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Scan.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{prod_adjud_sk\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|out :: scan(in) =
begin
  out.* :: in.*;
  out.drg_ldd_ind :: in.derived_drg_ldd_ind;
  out.ind::if (count(in.prod_adjud_sk)==1) 'U' else 'I';
end;|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Scan|1604000|120000|0|0|0|0|1681|Scan|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|176|0|518|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|177|0|521|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|178|0|523|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|179|0|525|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|180|0|527|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|181|0|530|0|{Generates a series of cumulative summary records--such as year-to-date totals--for groups of data records.  Scan in memory maximizes performance by keeping intermediate results in main memory.  Scan sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?scan|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not ordered or grouped. In this case, SCAN processes the data in-memory without sorting it.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.condition|version 2.4.16:|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|12|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation7|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation8|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation9|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation11|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|operation12|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Scan|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|182|0|532|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|183|0|535|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|184|0|538|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|185|0|541|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|186|0|544|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|187|0|551|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{prod_adjud_sk; prod_id; prod_id_qlfr; prod_nm; ahfs_cd; drg_3rd_prty_excpn_ind; drg_admin_rte_hitsb_desc; drg_clsfctn_cd; drg_dea_cd; drg_drg_intrctn_desc; drg_fda_thrpc_eqvlc_cd; drg_grp_cd; drg_lbl_nm; drg_maint_cd; drg_maint_src; drg_mfrr_nm; drg_ndc_lblr_cd; drg_ndc_pkg_cd; drg_ndc_prod_cd; drg_ndc_id; drg_rx_otc_ind; drg_stat_cd; drg_strngth_qty; drg_strngth_uom_cd; drg_sub_class_cd; drg_unit_dose_use_ind; gcn_no; gcn_seq_no; gen_nm; gen_medspn_ind; gen_ind_ovrd_ind; gpi_list_qlfr_nm; gpi_no; drg_grp_gpi_02_cd; drg_class_gpi_04_cd; drg_sub_class_gpi_06_cd; drg_bsic_nm_gpi_08_cd; drg_extd_nm_gpi_10_cd; drg_dosag_frm_gpi_12_cd; dsg_frm_id; dise_cat_sk; dise_cat_nm; thrpc_class_sk; thrpc_class_nm; wac_amt; wkrs_comp_alt_prod_cd; wkrs_comp_alt_prod_typ_cd; prod_pref_list_id; admin_rte_cd; src_env_sk; insert_ts; update_ts; insert_uid; update_uid; run_id; rec_stat_cd; prod_status_rule_tbl_id_sk; drg_ldd_ind; derived_drg_ldd_ind descending; drg_biosim_ind; sec_flg\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Sort|1208000|140500|0|0|0|0|1635|Sort-3|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|188|0|553|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|189|0|556|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|190|0|559|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|191|0|561|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|192|0|564|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|193|0|570|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{prod_adjud_sk\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|154000|57000|0|0|0|0|1472|srt_cf_prod_adjud_sk|Ab Initio Software|Built-in 1.0:|1|100|0||6||36865|1|{1|0|}}}
{2010203004|XXGoport|194|0|572|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|195|0|575|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|196|0|578|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|197|0|580|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|198|0|583|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|199|0|589|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{prod_adjud_sk\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|149000|230000|0|0|0|0|1399|srt_fact_prod_adjud_sk|Ab Initio Software|Built-in 1.0:|1|100|0||6||36865|1|{1|0|}}}
{2010203004|XXGoport|200|0|591|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|201|0|594|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|202|0|597|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|203|0|599|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|204|0|602|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010110002|XXGconstant|205|0|609|0|{@{}@{1|8353656|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_10|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_11|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_12|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_13|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_14|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_15|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_16|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_17|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_18|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_19|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_2|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_20|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_21|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_3|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_4|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_5|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_6|}1|22|}
{2010601001|XXGgraph_vertex_vertex|22|0|44|0|{Custom_File|}1|23|}
{2010212001|XXGvertex_oport_oport|23|0|46|0|{0|read|}23|24|}
{2010213001|XXGoport_dst_flow|24|0|48|0|{0|}24|5|}
{2010212001|XXGvertex_oport_oport|25|0|49|0|{1|log|}23|25|}
{2010007001|XXGobject_proto_object|26|0|51|0|{}23|26|}
{2010212001|XXGvertex_oport_oport|27|0|53|0|{0|read|}26|27|}
{2010006001|XXGobject_psameas_object|28|0|55|0|{metadata|read_metadata|1|0|}27|26|}
{2010212001|XXGvertex_oport_oport|29|0|56|0|{1|log|}26|28|}
{2010006001|XXGobject_psameas_object|30|0|58|0|{metadata|log_metadata|1|0|}28|26|}
{2010006001|XXGobject_psameas_object|31|0|59|0|{Layout|table_spec|0|1|}26|26|}
{2010006001|XXGobject_psameas_object|32|0|60|0|{Layout|table_spec|0|1|}23|23|}
{2010601001|XXGgraph_vertex_vertex|33|0|61|0|{D_PRD_ADJ_Fact_Details|}1|29|}
{2010212001|XXGvertex_oport_oport|34|0|63|0|{0|read|}29|30|}
{2010213001|XXGoport_dst_flow|35|0|65|0|{0|}30|22|}
{2010211001|XXGvertex_iport_iport|36|0|66|0|{0|write|}29|31|}
{2010214001|XXGiport_src_flow|37|0|68|0|{0|}31|19|}
{2010007001|XXGobject_proto_object|38|0|69|0|{}29|32|}
{2010212001|XXGvertex_oport_oport|39|0|71|0|{0|read|}32|33|}
{2010006001|XXGobject_psameas_object|40|0|73|0|{metadata|read_metadata|1|0|}33|32|}
{2010211001|XXGvertex_iport_iport|41|0|74|0|{0|write|}32|34|}
{2010006001|XXGobject_psameas_object|42|0|76|0|{metadata|write_metadata|1|0|}34|32|}
{2010006001|XXGobject_psameas_object|43|0|77|0|{read_metadata|write_metadata|0|0|}29|29|}
{2010601001|XXGgraph_vertex_vertex|44|0|78|0|{D_Prod_Adjud_Insert|}1|35|}
{2010211001|XXGvertex_iport_iport|45|0|80|0|{0|write|}35|36|}
{2010214001|XXGiport_src_flow|46|0|82|0|{0|}36|13|}
{2010007001|XXGobject_proto_object|47|0|83|0|{}35|37|}
{2010211001|XXGvertex_iport_iport|48|0|85|0|{0|write|}37|38|}
{2010006001|XXGobject_psameas_object|49|0|87|0|{metadata|write_metadata|1|0|}38|37|}
{2010601001|XXGgraph_vertex_vertex|50|0|88|0|{D_Prod_Adjud_Layout|}1|39|}
{2010212001|XXGvertex_oport_oport|51|0|90|0|{0|read|}39|40|}
{2010213001|XXGoport_dst_flow|52|0|92|0|{0|}40|15|}
{2010211001|XXGvertex_iport_iport|53|0|93|0|{0|write|}39|41|}
{2010214001|XXGiport_src_flow|54|0|95|0|{0|}41|7|}
{2010007001|XXGobject_proto_object|55|0|96|0|{}39|42|}
{2010212001|XXGvertex_oport_oport|56|0|98|0|{0|read|}42|43|}
{2010006001|XXGobject_psameas_object|57|0|100|0|{metadata|read_metadata|1|0|}43|42|}
{2010211001|XXGvertex_iport_iport|58|0|101|0|{0|write|}42|44|}
{2010006001|XXGobject_psameas_object|59|0|103|0|{metadata|write_metadata|1|0|}44|42|}
{2010006001|XXGobject_psameas_object|60|0|104|0|{read_metadata|write_metadata|0|0|}39|39|}
{2010601001|XXGgraph_vertex_vertex|61|0|105|0|{D_Prod_Adjud_Update|}1|45|}
{2010212001|XXGvertex_oport_oport|62|0|107|0|{0|read|}45|46|}
{2010213001|XXGoport_dst_flow|63|0|109|0|{0|}46|6|}
{2010211001|XXGvertex_iport_iport|64|0|110|0|{0|write|}45|47|}
{2010214001|XXGiport_src_flow|65|0|112|0|{0|}47|12|}
{2010007001|XXGobject_proto_object|66|0|113|0|{}45|48|}
{2010212001|XXGvertex_oport_oport|67|0|115|0|{0|read|}48|49|}
{2010006001|XXGobject_psameas_object|68|0|117|0|{metadata|read_metadata|1|0|}49|48|}
{2010211001|XXGvertex_iport_iport|69|0|118|0|{0|write|}48|50|}
{2010006001|XXGobject_psameas_object|70|0|120|0|{metadata|write_metadata|1|0|}50|48|}
{2010006001|XXGobject_psameas_object|71|0|121|0|{read_metadata|write_metadata|0|0|}45|45|}
{2010601001|XXGgraph_vertex_vertex|72|0|122|0|{Dedup_Sorted|}1|51|}
{2010212001|XXGvertex_oport_oport|73|0|124|0|{0|out|}51|52|}
{2010213001|XXGoport_dst_flow|74|0|126|0|{0|}52|10|}
{2010212001|XXGvertex_oport_oport|75|0|127|0|{1|dup|}51|53|}
{2010212001|XXGvertex_oport_oport|76|0|129|0|{2|reject|}51|54|}
{2010212001|XXGvertex_oport_oport|77|0|131|0|{3|error|}51|55|}
{2010212001|XXGvertex_oport_oport|78|0|133|0|{4|log|}51|56|}
{2010211001|XXGvertex_iport_iport|79|0|135|0|{0|in|}51|57|}
{2010214001|XXGiport_src_flow|80|0|137|0|{0|}57|9|}
{2010007001|XXGobject_proto_object|81|0|138|0|{}51|58|}
{2010212001|XXGvertex_oport_oport|82|0|140|0|{0|out|}58|59|}
{2010006001|XXGobject_psameas_object|83|0|142|0|{metadata|out_metadata|1|0|}59|58|}
{2010212001|XXGvertex_oport_oport|84|0|143|0|{1|dup|}58|60|}
{2010006001|XXGobject_psameas_object|85|0|145|0|{metadata|dup_metadata|1|0|}60|58|}
{2010212001|XXGvertex_oport_oport|86|0|146|0|{2|reject|}58|61|}
{2010006001|XXGobject_psameas_object|87|0|148|0|{metadata|reject_metadata|1|0|}61|58|}
{2010212001|XXGvertex_oport_oport|88|0|149|0|{3|error|}58|62|}
{2010006001|XXGobject_psameas_object|89|0|151|0|{metadata|error_metadata|1|0|}62|58|}
{2010212001|XXGvertex_oport_oport|90|0|152|0|{4|log|}58|63|}
{2010006001|XXGobject_psameas_object|91|0|154|0|{metadata|log_metadata|1|0|}63|58|}
{2010211001|XXGvertex_iport_iport|92|0|155|0|{0|in|}58|64|}
{2010006001|XXGobject_psameas_object|93|0|157|0|{metadata|in_metadata|1|0|}64|58|}
{2010006001|XXGobject_psameas_object|94|0|158|0|{Layout|Layout|0|0|}51|39|}
{2010006001|XXGobject_psameas_object|95|0|159|0|{dup_metadata|out0_metadata|0|0|}51|65|}
{2010212001|XXGvertex_oport_oport|96|0|161|0|{0|out0|}65|66|}
{2010213001|XXGoport_dst_flow|97|0|163|0|{0|}66|8|}
{2010212001|XXGvertex_oport_oport|98|0|164|0|{1|reject0|}65|67|}
{2010212001|XXGvertex_oport_oport|99|0|166|0|{2|error0|}65|68|}
{2010212001|XXGvertex_oport_oport|100|0|168|0|{3|log|}65|69|}
{2010211001|XXGvertex_iport_iport|101|0|170|0|{0|in|}65|70|}
{2010214001|XXGiport_src_flow|102|0|172|0|{0|}70|22|}
{2010007001|XXGobject_proto_object|103|0|173|0|{}65|71|}
{2010212001|XXGvertex_oport_oport|104|0|175|0|{0|out0|}71|72|}
{2010006001|XXGobject_psameas_object|105|0|177|0|{metadata|out0_metadata|1|0|}72|71|}
{2010006001|XXGobject_psameas_object|106|0|178|0|{transform0|transform0|1|0|}72|71|}
{2010212001|XXGvertex_oport_oport|107|0|179|0|{1|reject0|}71|73|}
{2010006001|XXGobject_psameas_object|108|0|181|0|{metadata|reject0_metadata|1|0|}73|71|}
{2010212001|XXGvertex_oport_oport|109|0|182|0|{2|error0|}71|74|}
{2010006001|XXGobject_psameas_object|110|0|184|0|{metadata|error0_metadata|1|0|}74|71|}
{2010212001|XXGvertex_oport_oport|111|0|185|0|{3|log|}71|75|}
{2010006001|XXGobject_psameas_object|112|0|187|0|{metadata|log_metadata|1|0|}75|71|}
{2010211001|XXGvertex_iport_iport|113|0|188|0|{0|in|}71|76|}
{2010006001|XXGobject_psameas_object|114|0|190|0|{metadata|in_metadata|1|0|}76|71|}
{2010006001|XXGobject_psameas_object|115|0|191|0|{Layout|Layout|0|0|}65|39|}
{2010006001|XXGobject_psameas_object|116|0|192|0|{in_metadata|write_metadata|0|0|}65|29|}
{2010006001|XXGobject_psameas_object|117|0|193|0|{reject0_metadata|write_metadata|0|0|}65|29|}
{2010006001|XXGobject_psameas_object|118|0|194|0|{in_metadata|out0_metadata|0|0|}51|65|}
{2010006001|XXGobject_psameas_object|119|0|195|0|{out_metadata|out0_metadata|0|0|}51|65|}
{2010006001|XXGobject_psameas_object|120|0|196|0|{reject_metadata|out0_metadata|0|0|}51|65|}
{2010601001|XXGgraph_vertex_vertex|121|0|197|0|{Fact|}1|77|}
{2010212001|XXGvertex_oport_oport|122|0|199|0|{0|read|}77|78|}
{2010213001|XXGoport_dst_flow|123|0|201|0|{0|}78|21|}
{2010212001|XXGvertex_oport_oport|124|0|202|0|{1|log|}77|79|}
{2010007001|XXGobject_proto_object|125|0|204|0|{}77|80|}
{2010212001|XXGvertex_oport_oport|126|0|206|0|{0|read|}80|81|}
{2010006001|XXGobject_psameas_object|127|0|208|0|{metadata|read_metadata|1|0|}81|80|}
{2010212001|XXGvertex_oport_oport|128|0|209|0|{1|log|}80|82|}
{2010006001|XXGobject_psameas_object|129|0|211|0|{metadata|log_metadata|1|0|}82|80|}
{2010006001|XXGobject_psameas_object|130|0|212|0|{Layout|table_spec|0|1|}80|80|}
{2010006001|XXGobject_psameas_object|131|0|213|0|{Layout|table_spec|0|1|}77|77|}
{2010601001|XXGgraph_vertex_vertex|132|0|214|0|{Join_on_prod_adjud_sk|}1|83|}
{2010212001|XXGvertex_oport_oport|133|0|216|0|{0|out|}83|84|}
{2010213001|XXGoport_dst_flow|134|0|218|0|{0|}84|19|}
{2010212001|XXGvertex_oport_oport|135|0|219|0|{1|unused0|}83|85|}
{2010212001|XXGvertex_oport_oport|136|0|221|0|{2|unused1|}83|86|}
{2010212001|XXGvertex_oport_oport|137|0|223|0|{3|reject0|}83|87|}
{2010212001|XXGvertex_oport_oport|138|0|225|0|{4|reject1|}83|88|}
{2010212001|XXGvertex_oport_oport|139|0|227|0|{5|error0|}83|89|}
{2010212001|XXGvertex_oport_oport|140|0|229|0|{6|error1|}83|90|}
{2010212001|XXGvertex_oport_oport|141|0|231|0|{7|log|}83|91|}
{2010211001|XXGvertex_iport_iport|142|0|233|0|{0|in0|}83|92|}
{2010214001|XXGiport_src_flow|143|0|235|0|{0|}92|20|}
{2010211001|XXGvertex_iport_iport|144|0|236|0|{1|in1|}83|93|}
{2010214001|XXGiport_src_flow|145|0|238|0|{0|}93|16|}
{2010007001|XXGobject_proto_object|146|0|239|0|{}83|94|}
{2010212001|XXGvertex_oport_oport|147|0|241|0|{0|out|}94|95|}
{2010006001|XXGobject_psameas_object|148|0|243|0|{metadata|out_metadata|1|0|}95|94|}
{2010212001|XXGvertex_oport_oport|149|0|244|0|{1|unused0|}94|96|}
{2010006001|XXGobject_psameas_object|150|0|246|0|{metadata|unused0_metadata|1|0|}96|94|}
{2010212001|XXGvertex_oport_oport|151|0|247|0|{2|unused1|}94|97|}
{2010006001|XXGobject_psameas_object|152|0|249|0|{metadata|unused1_metadata|1|0|}97|94|}
{2010212001|XXGvertex_oport_oport|153|0|250|0|{3|reject0|}94|98|}
{2010006001|XXGobject_psameas_object|154|0|252|0|{metadata|reject0_metadata|1|0|}98|94|}
{2010212001|XXGvertex_oport_oport|155|0|253|0|{4|reject1|}94|99|}
{2010006001|XXGobject_psameas_object|156|0|255|0|{metadata|reject1_metadata|1|0|}99|94|}
{2010212001|XXGvertex_oport_oport|157|0|256|0|{5|error0|}94|100|}
{2010006001|XXGobject_psameas_object|158|0|258|0|{metadata|error0_metadata|1|0|}100|94|}
{2010212001|XXGvertex_oport_oport|159|0|259|0|{6|error1|}94|101|}
{2010006001|XXGobject_psameas_object|160|0|261|0|{metadata|error1_metadata|1|0|}101|94|}
{2010212001|XXGvertex_oport_oport|161|0|262|0|{7|log|}94|102|}
{2010006001|XXGobject_psameas_object|162|0|264|0|{metadata|log_metadata|1|0|}102|94|}
{2010211001|XXGvertex_iport_iport|163|0|265|0|{0|in0|}94|103|}
{2010006001|XXGobject_psameas_object|164|0|267|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|1|0|}103|94|}
{2010006001|XXGobject_psameas_object|165|0|268|0|{dedup0|dedup0|1|0|}103|94|}
{2010006001|XXGobject_psameas_object|166|0|269|0|{dedup_keyword0|dedup_keyword0|1|0|}103|94|}
{2010006001|XXGobject_psameas_object|167|0|270|0|{dedup_positional0|dedup_positional0|1|0|}103|94|}
{2010006001|XXGobject_psameas_object|168|0|271|0|{matchoptional_keyword0|matchoptional_keyword0|1|0|}103|94|}
{2010006001|XXGobject_psameas_object|169|0|272|0|{matchoptional_positional0|matchoptional_positional0|1|0|}103|94|}
{2010006001|XXGobject_psameas_object|170|0|273|0|{metadata|in0_metadata|1|0|}103|94|}
{2010006001|XXGobject_psameas_object|171|0|274|0|{override_key0|override_key0|1|0|}103|94|}
{2010006001|XXGobject_psameas_object|172|0|275|0|{record_match_required0|record_match_required0|1|0|}103|94|}
{2010006001|XXGobject_psameas_object|173|0|276|0|{record_match_required_not0|record_match_required_not0|1|0|}103|94|}
{2010006001|XXGobject_psameas_object|174|0|277|0|{record_required0|record_required0|1|0|}103|94|}
{2010006001|XXGobject_psameas_object|175|0|278|0|{record_required_keyword0|record_required_keyword0|1|0|}103|94|}
{2010006001|XXGobject_psameas_object|176|0|279|0|{record_required_positional0|record_required_positional0|1|0|}103|94|}
{2010006001|XXGobject_psameas_object|177|0|280|0|{select0|select0|1|0|}103|94|}
{2010006001|XXGobject_psameas_object|178|0|281|0|{select_keyword0|select_keyword0|1|0|}103|94|}
{2010006001|XXGobject_psameas_object|179|0|282|0|{select_positional0|select_positional0|1|0|}103|94|}
{2010211001|XXGvertex_iport_iport|180|0|283|0|{1|in1|}94|104|}
{2010006001|XXGobject_psameas_object|181|0|285|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|1|0|}104|94|}
{2010006001|XXGobject_psameas_object|182|0|286|0|{dedup1|dedup1|1|0|}104|94|}
{2010006001|XXGobject_psameas_object|183|0|287|0|{dedup_keyword1|dedup_keyword1|1|0|}104|94|}
{2010006001|XXGobject_psameas_object|184|0|288|0|{dedup_positional1|dedup_positional1|1|0|}104|94|}
{2010006001|XXGobject_psameas_object|185|0|289|0|{matchoptional_keyword1|matchoptional_keyword1|1|0|}104|94|}
{2010006001|XXGobject_psameas_object|186|0|290|0|{matchoptional_positional1|matchoptional_positional1|1|0|}104|94|}
{2010006001|XXGobject_psameas_object|187|0|291|0|{metadata|in1_metadata|1|0|}104|94|}
{2010006001|XXGobject_psameas_object|188|0|292|0|{override_key1|override_key1|1|0|}104|94|}
{2010006001|XXGobject_psameas_object|189|0|293|0|{record_match_required1|record_match_required1|1|0|}104|94|}
{2010006001|XXGobject_psameas_object|190|0|294|0|{record_match_required_not1|record_match_required_not1|1|0|}104|94|}
{2010006001|XXGobject_psameas_object|191|0|295|0|{record_required1|record_required1|1|0|}104|94|}
{2010006001|XXGobject_psameas_object|192|0|296|0|{record_required_keyword1|record_required_keyword1|1|0|}104|94|}
{2010006001|XXGobject_psameas_object|193|0|297|0|{record_required_positional1|record_required_positional1|1|0|}104|94|}
{2010006001|XXGobject_psameas_object|194|0|298|0|{select1|select1|1|0|}104|94|}
{2010006001|XXGobject_psameas_object|195|0|299|0|{select_keyword1|select_keyword1|1|0|}104|94|}
{2010006001|XXGobject_psameas_object|196|0|300|0|{select_positional1|select_positional1|1|0|}104|94|}
{2010006001|XXGobject_psameas_object|197|0|301|0|{Layout|Layout|0|0|}83|29|}
{2010006001|XXGobject_psameas_object|198|0|302|0|{in0_metadata|read_metadata|0|0|}83|23|}
{2010006001|XXGobject_psameas_object|199|0|303|0|{in1_metadata|read_metadata|0|0|}83|77|}
{2010006001|XXGobject_psameas_object|200|0|304|0|{out_metadata|write_metadata|0|0|}83|29|}
{2010006001|XXGobject_psameas_object|201|0|305|0|{reject0_metadata|read_metadata|0|0|}83|23|}
{2010006001|XXGobject_psameas_object|202|0|306|0|{reject1_metadata|read_metadata|0|0|}83|77|}
{2010006001|XXGobject_psameas_object|203|0|307|0|{unused0_metadata|read_metadata|0|0|}83|23|}
{2010006001|XXGobject_psameas_object|204|0|308|0|{unused1_metadata|read_metadata|0|0|}83|77|}
{2010601001|XXGgraph_vertex_vertex|205|0|309|0|{LDD_and_BIOSIM_Update_stmts|}1|105|}
{2010212001|XXGvertex_oport_oport|206|0|311|0|{0|out|}105|106|}
{2010212001|XXGvertex_oport_oport|207|0|313|0|{1|reject|}105|107|}
{2010212001|XXGvertex_oport_oport|208|0|315|0|{2|error|}105|108|}
{2010212001|XXGvertex_oport_oport|209|0|317|0|{3|log|}105|109|}
{2010211001|XXGvertex_iport_iport|210|0|319|0|{0|in|}105|110|}
{2010007001|XXGobject_proto_object|211|0|321|0|{}105|111|}
{2010212001|XXGvertex_oport_oport|212|0|323|0|{0|out|}111|112|}
{2010006001|XXGobject_psameas_object|213|0|325|0|{metadata|out_metadata|1|0|}112|111|}
{2010212001|XXGvertex_oport_oport|214|0|326|0|{1|reject|}111|113|}
{2010006001|XXGobject_psameas_object|215|0|328|0|{metadata|reject_metadata|1|0|}113|111|}
{2010212001|XXGvertex_oport_oport|216|0|329|0|{2|error|}111|114|}
{2010006001|XXGobject_psameas_object|217|0|331|0|{metadata|error_metadata|1|0|}114|111|}
{2010212001|XXGvertex_oport_oport|218|0|332|0|{3|log|}111|115|}
{2010006001|XXGobject_psameas_object|219|0|334|0|{metadata|log_metadata|1|0|}115|111|}
{2010211001|XXGvertex_iport_iport|220|0|335|0|{0|in|}111|116|}
{2010006001|XXGobject_psameas_object|221|0|337|0|{metadata|in_metadata|1|0|}116|111|}
{2010006001|XXGobject_psameas_object|222|0|338|0|{out_metadata|in_metadata|0|0|}105|105|}
{2010006001|XXGobject_psameas_object|223|0|339|0|{reject_metadata|in_metadata|0|0|}105|105|}
{2010601001|XXGgraph_vertex_vertex|224|0|340|0|{Partition_by_Key|}1|117|}
{2010212001|XXGvertex_oport_oport|225|0|342|0|{0|out|}117|118|}
{2010213001|XXGoport_dst_flow|226|0|344|0|{0|}118|13|}
{2010211001|XXGvertex_iport_iport|227|0|345|0|{0|in|}117|119|}
{2010214001|XXGiport_src_flow|228|0|347|0|{0|}119|14|}
{2010007001|XXGobject_proto_object|229|0|348|0|{}117|120|}
{2010212001|XXGvertex_oport_oport|230|0|350|0|{0|out|}120|121|}
{2010006001|XXGobject_psameas_object|231|0|352|0|{metadata|out_metadata|1|0|}121|120|}
{2010211001|XXGvertex_iport_iport|232|0|353|0|{0|in|}120|122|}
{2010006001|XXGobject_psameas_object|233|0|355|0|{metadata|in_metadata|1|0|}122|120|}
{2010006001|XXGobject_psameas_object|234|0|356|0|{Layout|Layout|0|0|}117|123|}
{2010212001|XXGvertex_oport_oport|235|0|358|0|{0|out0|}123|124|}
{2010213001|XXGoport_dst_flow|236|0|360|0|{0|}124|14|}
{2010212001|XXGvertex_oport_oport|237|0|361|0|{1|reject0|}123|125|}
{2010212001|XXGvertex_oport_oport|238|0|363|0|{2|error0|}123|126|}
{2010212001|XXGvertex_oport_oport|239|0|365|0|{3|log|}123|127|}
{2010211001|XXGvertex_iport_iport|240|0|367|0|{0|in|}123|128|}
{2010214001|XXGiport_src_flow|241|0|369|0|{0|}128|17|}
{2010007001|XXGobject_proto_object|242|0|370|0|{}123|129|}
{2010212001|XXGvertex_oport_oport|243|0|372|0|{0|out0|}129|130|}
{2010006001|XXGobject_psameas_object|244|0|374|0|{metadata|out0_metadata|1|0|}130|129|}
{2010006001|XXGobject_psameas_object|245|0|375|0|{transform0|transform0|1|0|}130|129|}
{2010212001|XXGvertex_oport_oport|246|0|376|0|{1|reject0|}129|131|}
{2010006001|XXGobject_psameas_object|247|0|378|0|{metadata|reject0_metadata|1|0|}131|129|}
{2010212001|XXGvertex_oport_oport|248|0|379|0|{2|error0|}129|132|}
{2010006001|XXGobject_psameas_object|249|0|381|0|{metadata|error0_metadata|1|0|}132|129|}
{2010212001|XXGvertex_oport_oport|250|0|382|0|{3|log|}129|133|}
{2010006001|XXGobject_psameas_object|251|0|384|0|{metadata|log_metadata|1|0|}133|129|}
{2010211001|XXGvertex_iport_iport|252|0|385|0|{0|in|}129|134|}
{2010006001|XXGobject_psameas_object|253|0|387|0|{metadata|in_metadata|1|0|}134|129|}
{2010006001|XXGobject_psameas_object|254|0|388|0|{Layout|Layout|0|0|}123|135|}
{2010212001|XXGvertex_oport_oport|255|0|390|0|{0|out|}135|136|}
{2010213001|XXGoport_dst_flow|256|0|392|0|{0|}136|11|}
{2010213001|XXGoport_dst_flow|257|0|393|0|{1|}136|17|}
{2010211001|XXGvertex_iport_iport|258|0|394|0|{0|in|}135|137|}
{2010214001|XXGiport_src_flow|259|0|396|0|{0|}137|15|}
{2010007001|XXGobject_proto_object|260|0|397|0|{}135|138|}
{2010212001|XXGvertex_oport_oport|261|0|399|0|{0|out|}138|139|}
{2010006001|XXGobject_psameas_object|262|0|401|0|{metadata|out_metadata|1|0|}139|138|}
{2010211001|XXGvertex_iport_iport|263|0|402|0|{0|in|}138|140|}
{2010006001|XXGobject_psameas_object|264|0|404|0|{metadata|in_metadata|1|0|}140|138|}
{2010006001|XXGobject_psameas_object|265|0|405|0|{Layout|Layout|0|0|}135|39|}
{2010006001|XXGobject_psameas_object|266|0|406|0|{in_metadata|write_metadata|0|0|}135|39|}
{2010006001|XXGobject_psameas_object|267|0|407|0|{out_metadata|write_metadata|0|0|}135|39|}
{2010006001|XXGobject_psameas_object|268|0|408|0|{in_metadata|write_metadata|0|0|}123|39|}
{2010006001|XXGobject_psameas_object|269|0|409|0|{out0_metadata|write_metadata|0|0|}123|35|}
{2010006001|XXGobject_psameas_object|270|0|410|0|{reject0_metadata|write_metadata|0|0|}123|39|}
{2010006001|XXGobject_psameas_object|271|0|411|0|{in_metadata|write_metadata|0|0|}117|35|}
{2010006001|XXGobject_psameas_object|272|0|412|0|{out_metadata|write_metadata|0|0|}117|35|}
{2010601001|XXGgraph_vertex_vertex|273|0|413|0|{Reformat|}1|141|}
{2010212001|XXGvertex_oport_oport|274|0|415|0|{0|out0|}141|142|}
{2010213001|XXGoport_dst_flow|275|0|417|0|{0|}142|18|}
{2010212001|XXGvertex_oport_oport|276|0|418|0|{1|reject0|}141|143|}
{2010212001|XXGvertex_oport_oport|277|0|420|0|{2|error0|}141|144|}
{2010212001|XXGvertex_oport_oport|278|0|422|0|{3|log|}141|145|}
{2010211001|XXGvertex_iport_iport|279|0|424|0|{0|in|}141|146|}
{2010214001|XXGiport_src_flow|280|0|426|0|{0|}146|6|}
{2010007001|XXGobject_proto_object|281|0|427|0|{}141|147|}
{2010212001|XXGvertex_oport_oport|282|0|429|0|{0|out0|}147|148|}
{2010006001|XXGobject_psameas_object|283|0|431|0|{metadata|out0_metadata|1|0|}148|147|}
{2010006001|XXGobject_psameas_object|284|0|432|0|{transform0|transform0|1|0|}148|147|}
{2010212001|XXGvertex_oport_oport|285|0|433|0|{1|reject0|}147|149|}
{2010006001|XXGobject_psameas_object|286|0|435|0|{metadata|reject0_metadata|1|0|}149|147|}
{2010212001|XXGvertex_oport_oport|287|0|436|0|{2|error0|}147|150|}
{2010006001|XXGobject_psameas_object|288|0|438|0|{metadata|error0_metadata|1|0|}150|147|}
{2010212001|XXGvertex_oport_oport|289|0|439|0|{3|log|}147|151|}
{2010006001|XXGobject_psameas_object|290|0|441|0|{metadata|log_metadata|1|0|}151|147|}
{2010211001|XXGvertex_iport_iport|291|0|442|0|{0|in|}147|152|}
{2010006001|XXGobject_psameas_object|292|0|444|0|{metadata|in_metadata|1|0|}152|147|}
{2010006001|XXGobject_psameas_object|293|0|445|0|{Layout|Layout|0|0|}141|153|}
{2010212001|XXGvertex_oport_oport|294|0|447|0|{0|log|}153|154|}
{2010212001|XXGvertex_oport_oport|295|0|449|0|{1|reject|}153|155|}
{2010212001|XXGvertex_oport_oport|296|0|451|0|{2|error|}153|156|}
{2010211001|XXGvertex_iport_iport|297|0|453|0|{0|write|}153|157|}
{2010214001|XXGiport_src_flow|298|0|455|0|{0|}157|18|}
{2010007001|XXGobject_proto_object|299|0|456|0|{}153|158|}
{2010212001|XXGvertex_oport_oport|300|0|458|0|{0|log|}158|159|}
{2010006001|XXGobject_psameas_object|301|0|460|0|{metadata|log_metadata|1|0|}159|158|}
{2010212001|XXGvertex_oport_oport|302|0|461|0|{1|reject|}158|160|}
{2010006001|XXGobject_psameas_object|303|0|463|0|{metadata|reject_metadata|1|0|}160|158|}
{2010212001|XXGvertex_oport_oport|304|0|464|0|{2|error|}158|161|}
{2010006001|XXGobject_psameas_object|305|0|466|0|{metadata|error_metadata|1|0|}161|158|}
{2010211001|XXGvertex_iport_iport|306|0|467|0|{0|write|}158|162|}
{2010006001|XXGobject_psameas_object|307|0|469|0|{metadata|write_metadata|1|0|}162|158|}
{2010006001|XXGobject_psameas_object|308|0|470|0|{Layout|table_spec|0|1|}158|158|}
{2010006001|XXGobject_psameas_object|309|0|471|0|{Layout|table_spec|0|1|}153|153|}
{2010006001|XXGobject_psameas_object|310|0|472|0|{reject_metadata|write_metadata|0|0|}153|153|}
{2010006001|XXGobject_psameas_object|311|0|473|0|{in_metadata|write_metadata|0|0|}141|45|}
{2010006001|XXGobject_psameas_object|312|0|474|0|{out0_metadata|write_metadata|0|0|}141|153|}
{2010006001|XXGobject_psameas_object|313|0|475|0|{reject0_metadata|write_metadata|0|0|}141|45|}
{2010601001|XXGgraph_vertex_vertex|314|0|476|0|{Reformat_1|}1|65|}
{2010601001|XXGgraph_vertex_vertex|315|0|477|0|{Reformat_2|}1|163|}
{2010212001|XXGvertex_oport_oport|316|0|479|0|{0|out0|}163|164|}
{2010213001|XXGoport_dst_flow|317|0|481|0|{0|}164|12|}
{2010212001|XXGvertex_oport_oport|318|0|482|0|{1|reject0|}163|165|}
{2010212001|XXGvertex_oport_oport|319|0|484|0|{2|error0|}163|166|}
{2010212001|XXGvertex_oport_oport|320|0|486|0|{3|log|}163|167|}
{2010211001|XXGvertex_iport_iport|321|0|488|0|{0|in|}163|168|}
{2010214001|XXGiport_src_flow|322|0|490|0|{0|}168|11|}
{2010007001|XXGobject_proto_object|323|0|491|0|{}163|169|}
{2010212001|XXGvertex_oport_oport|324|0|493|0|{0|out0|}169|170|}
{2010006001|XXGobject_psameas_object|325|0|495|0|{metadata|out0_metadata|1|0|}170|169|}
{2010006001|XXGobject_psameas_object|326|0|496|0|{transform0|transform0|1|0|}170|169|}
{2010212001|XXGvertex_oport_oport|327|0|497|0|{1|reject0|}169|171|}
{2010006001|XXGobject_psameas_object|328|0|499|0|{metadata|reject0_metadata|1|0|}171|169|}
{2010212001|XXGvertex_oport_oport|329|0|500|0|{2|error0|}169|172|}
{2010006001|XXGobject_psameas_object|330|0|502|0|{metadata|error0_metadata|1|0|}172|169|}
{2010212001|XXGvertex_oport_oport|331|0|503|0|{3|log|}169|173|}
{2010006001|XXGobject_psameas_object|332|0|505|0|{metadata|log_metadata|1|0|}173|169|}
{2010211001|XXGvertex_iport_iport|333|0|506|0|{0|in|}169|174|}
{2010006001|XXGobject_psameas_object|334|0|508|0|{metadata|in_metadata|1|0|}174|169|}
{2010006001|XXGobject_psameas_object|335|0|509|0|{Layout|Layout|0|0|}163|45|}
{2010006001|XXGobject_psameas_object|336|0|510|0|{in_metadata|write_metadata|0|0|}163|39|}
{2010006001|XXGobject_psameas_object|337|0|511|0|{out0_metadata|write_metadata|0|0|}163|45|}
{2010006001|XXGobject_psameas_object|338|0|512|0|{reject0_metadata|write_metadata|0|0|}163|39|}
{2010601001|XXGgraph_vertex_vertex|339|0|513|0|{Reformat_3|}1|123|}
{2010601001|XXGgraph_vertex_vertex|340|0|514|0|{Replicate|}1|135|}
{2010601001|XXGgraph_vertex_vertex|341|0|515|0|{Scan|}1|175|}
{2010212001|XXGvertex_oport_oport|342|0|517|0|{0|out|}175|176|}
{2010213001|XXGoport_dst_flow|343|0|519|0|{0|}176|7|}
{2010212001|XXGvertex_oport_oport|344|0|520|0|{1|reject|}175|177|}
{2010212001|XXGvertex_oport_oport|345|0|522|0|{2|error|}175|178|}
{2010212001|XXGvertex_oport_oport|346|0|524|0|{3|log|}175|179|}
{2010211001|XXGvertex_iport_iport|347|0|526|0|{0|in|}175|180|}
{2010214001|XXGiport_src_flow|348|0|528|0|{0|}180|10|}
{2010007001|XXGobject_proto_object|349|0|529|0|{}175|181|}
{2010212001|XXGvertex_oport_oport|350|0|531|0|{0|out|}181|182|}
{2010006001|XXGobject_psameas_object|351|0|533|0|{metadata|out_metadata|1|0|}182|181|}
{2010212001|XXGvertex_oport_oport|352|0|534|0|{1|reject|}181|183|}
{2010006001|XXGobject_psameas_object|353|0|536|0|{metadata|reject_metadata|1|0|}183|181|}
{2010212001|XXGvertex_oport_oport|354|0|537|0|{2|error|}181|184|}
{2010006001|XXGobject_psameas_object|355|0|539|0|{metadata|error_metadata|1|0|}184|181|}
{2010212001|XXGvertex_oport_oport|356|0|540|0|{3|log|}181|185|}
{2010006001|XXGobject_psameas_object|357|0|542|0|{metadata|log_metadata|1|0|}185|181|}
{2010211001|XXGvertex_iport_iport|358|0|543|0|{0|in|}181|186|}
{2010006001|XXGobject_psameas_object|359|0|545|0|{metadata|in_metadata|1|0|}186|181|}
{2010006001|XXGobject_psameas_object|360|0|546|0|{Layout|Layout|0|0|}175|39|}
{2010006001|XXGobject_psameas_object|361|0|547|0|{in_metadata|out0_metadata|0|0|}175|65|}
{2010006001|XXGobject_psameas_object|362|0|548|0|{out_metadata|write_metadata|0|0|}175|39|}
{2010006001|XXGobject_psameas_object|363|0|549|0|{reject_metadata|out0_metadata|0|0|}175|65|}
{2010601001|XXGgraph_vertex_vertex|364|0|550|0|{Sort_3|}1|187|}
{2010212001|XXGvertex_oport_oport|365|0|552|0|{0|out|}187|188|}
{2010213001|XXGoport_dst_flow|366|0|554|0|{0|}188|9|}
{2010211001|XXGvertex_iport_iport|367|0|555|0|{0|in|}187|189|}
{2010214001|XXGiport_src_flow|368|0|557|0|{0|}189|8|}
{2010007001|XXGobject_proto_object|369|0|558|0|{}187|190|}
{2010212001|XXGvertex_oport_oport|370|0|560|0|{0|out|}190|191|}
{2010006001|XXGobject_psameas_object|371|0|562|0|{metadata|out_metadata|1|0|}191|190|}
{2010211001|XXGvertex_iport_iport|372|0|563|0|{0|in|}190|192|}
{2010006001|XXGobject_psameas_object|373|0|565|0|{metadata|in_metadata|1|0|}192|190|}
{2010006001|XXGobject_psameas_object|374|0|566|0|{Layout|Layout|0|0|}187|39|}
{2010006001|XXGobject_psameas_object|375|0|567|0|{in_metadata|out0_metadata|0|0|}187|65|}
{2010006001|XXGobject_psameas_object|376|0|568|0|{out_metadata|out0_metadata|0|0|}187|65|}
{2010601001|XXGgraph_vertex_vertex|377|0|569|0|{srt_cf_prod_adjud_sk|}1|193|}
{2010212001|XXGvertex_oport_oport|378|0|571|0|{0|out|}193|194|}
{2010213001|XXGoport_dst_flow|379|0|573|0|{0|}194|20|}
{2010211001|XXGvertex_iport_iport|380|0|574|0|{0|in|}193|195|}
{2010214001|XXGiport_src_flow|381|0|576|0|{0|}195|5|}
{2010007001|XXGobject_proto_object|382|0|577|0|{}193|196|}
{2010212001|XXGvertex_oport_oport|383|0|579|0|{0|out|}196|197|}
{2010006001|XXGobject_psameas_object|384|0|581|0|{metadata|out_metadata|1|0|}197|196|}
{2010211001|XXGvertex_iport_iport|385|0|582|0|{0|in|}196|198|}
{2010006001|XXGobject_psameas_object|386|0|584|0|{metadata|in_metadata|1|0|}198|196|}
{2010006001|XXGobject_psameas_object|387|0|585|0|{Layout|Layout|0|0|}193|29|}
{2010006001|XXGobject_psameas_object|388|0|586|0|{in_metadata|read_metadata|0|0|}193|23|}
{2010006001|XXGobject_psameas_object|389|0|587|0|{out_metadata|read_metadata|0|0|}193|23|}
{2010601001|XXGgraph_vertex_vertex|390|0|588|0|{srt_fact_prod_adjud_sk|}1|199|}
{2010212001|XXGvertex_oport_oport|391|0|590|0|{0|out|}199|200|}
{2010213001|XXGoport_dst_flow|392|0|592|0|{0|}200|16|}
{2010211001|XXGvertex_iport_iport|393|0|593|0|{0|in|}199|201|}
{2010214001|XXGiport_src_flow|394|0|595|0|{0|}201|21|}
{2010007001|XXGobject_proto_object|395|0|596|0|{}199|202|}
{2010212001|XXGvertex_oport_oport|396|0|598|0|{0|out|}202|203|}
{2010006001|XXGobject_psameas_object|397|0|600|0|{metadata|out_metadata|1|0|}203|202|}
{2010211001|XXGvertex_iport_iport|398|0|601|0|{0|in|}202|204|}
{2010006001|XXGobject_psameas_object|399|0|603|0|{metadata|in_metadata|1|0|}204|202|}
{2010006001|XXGobject_psameas_object|400|0|604|0|{Layout|Layout|0|0|}199|29|}
{2010006001|XXGobject_psameas_object|401|0|605|0|{in_metadata|read_metadata|0|0|}199|77|}
{2010006001|XXGobject_psameas_object|402|0|606|0|{out_metadata|read_metadata|0|0|}199|77|}
{2010601001|XXGgraph_vertex_vertex|403|0|607|0|{staging_table|}1|153|}
{2010109001|XXGobject_property_value|404|0|608|0|{0|TrackingThumbprint|72|}1|205|}
