@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|126|rel_count|212|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|comment_00|####################################|3|1|Kl||{0|}}
{30001002|XXparameter|comment_01|# BEGIN QUERY ENGINE v2 INTERFACE PARAMETERS      #|3|1|Kl||{0|}}
{30001002|XXparameter|comment_02|####################################|3|1|Kl||{0|}}
{30001002|XXparameter|DATA_SOURCE_DML|$\{AI_DML\}/rt200p_enriched.dml|7|9|RFKf||{0|}}
{30001002|XXparameter|DATA_SOURCE_DML_REDUCED|$AI_DML/rt200p_enriched_reduced.dml|7|9|FK|This is the first level reduced dml , Supply the path of this dml via input parameter|{0|}}
{30001002|XXparameter|DATA_SOURCE_DML_REDUCED_STEP2|$[string_replace(DATA_SOURCE_DML_REDUCED, "_reduced.dml", "_reduced_step2.dml")]|3|9|K|The step broken  strip down version of main dataset , Highly optimized , highly focussed on performence|{0|}}
{30001002|XXparameter|DATA_SOURCE_DML_REDUCED_STEP3|$[string_replace(DATA_SOURCE_DML_REDUCED, "_reduced.dml", "_reduced_step3.dml")]|3|9|K|@{0|}}
{30001002|XXparameter|DATA_SOURCE_NAME|claimsinfo_rxclaim|3|9|RFK||{0|}}
{30001002|XXparameter|DATA_URL|$AI_MFS|18|9|RFK||{0|}}
{30001002|XXparameter|AB_SQL_DML_PREAMBLE||20|9|FK||{0|}}
{30001002|XXparameter|OUTPUT_DML|record
  string("\\x01")  mxukc2;
  decimal("\\x01")  mxlhnb, mxoen1;
  string("\\x01")  mxumc2, mxunc2;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxd8c3;
  decimal(17,0)  mxs5nb;
  decimal(5,0)  mxs6nb;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxzsst;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxoyc7;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqgsu;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxg3u1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxo2u1;
  date("YYYYMMDD")  mxtdnb;
  date("YYYYMM")  mxjjnc;
  string("\\x01",charset="iso-8859-15", maximum_length=8)  mxmuu1;
  date("YYYYMMDD")  mxdmda;
  decimal("\\x01")  mxjknc;
  string("\\x01",charset="iso-8859-15", maximum_length=8)  mxmvu1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  b_g_flag;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  phr_price_type_rollup;
  decimal(13,2)  pre_awp, post_awp;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  cob_flag, compound_flag, high_awp, non_drug_flag, ltc_flag, in_house_pharmacy_flag, otc_flag;
  string("\\x01",charset="utf-16le", maximum_length=100)  client_name;
  string("\\x01",charset="utf-16le", maximum_length=50)  chain_name;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  spec_claim_flag, pharmacy_30_90_day_flag;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  clt_price_type_rollup;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  retail_mail_spec_flag;
  string("\\x01",charset="iso-8859-15", maximum_length=50)  lob = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=25)  l_org_flag;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  briova_flag, catamaran_home_delivery_flag;
  string("\\x01",charset="utf-16le", maximum_length=6)  pharm_parent_id_chain_rollup_id;
  string("\\x01",charset="utf-16le", maximum_length=23)  pharmacy_group;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  vaccine_drug_flag;
  string("\\x01",charset="iso-8859-15", maximum_length=50)  chain_code, pogname, parent_org_id;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxefc3;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxumst, mxulst, mxukst;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxt2c1;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxumc1;
  decimal("\\x01")  mxconc;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxhlu1;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxgec5;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxhmu1;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxgfc5;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxelc3;
  decimal("\\x01")  mxoln1;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxfrc5;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxmwu1;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxmxu1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxmyu1;
  decimal("\\x01")  mxdpda;
  string("\\x01",charset="iso-8859-15", maximum_length=11)  mxg6u1;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxeac3, mxt8c1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxevsu;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxecc3;
  string("\\x01",charset="iso-8859-15", maximum_length=25)  mxebc3;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxedc3;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxdacd;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxegc3;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxt3c1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxmrlcd;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxt4c1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxg9c3;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxhcc3;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqhsu;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxewc3;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxuac1;
  string("\\x01",charset="iso-8859-15", maximum_length=12)  mxilc7;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mximc7;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxinc7;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxlnsu;
  string("\\x01",charset="iso-8859-15", maximum_length=55)  mxxctx;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxeuc3;
  string("\\x01",charset="iso-8859-15", maximum_length=25)  mxevc3;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxfasu;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxqisu;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxf5c5;
  string("\\x01",charset="iso-8859-15", maximum_length=9)  mxf1c5;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxqjsu;
  decimal("\\x01")  mxcrnc;
  string("\\x01",charset="iso-8859-15", maximum_length=9)  mxfqc5;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxfdsu;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxf6c5, mxe0c3;
  string("\\x01",charset="iso-8859-15", maximum_length=12)  mxezc3;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxftc5, mxdccd;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxjfc7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxlysu;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqksu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxf2c5, mxozc7, mxjhc7, mxjgc7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxe4su;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqlsu;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxikp2;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqmsu;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxilp2;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqnsu;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mximp2;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqosu;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxinp2;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxtzc1, mxt0c1;
  decimal("\\x01".2, maximum_length=7, sign_reserved)  mxhgp2;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxioc7;
  decimal("\\x01")  mxjnnc, mxjlnc;
  string("\\x01",charset="iso-8859-15", maximum_length=13)  mxipc7;
  decimal("\\x01")  mxjmnc;
  string("\\x01",charset="iso-8859-15", maximum_length=14)  mxiqc7;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxirc7;
  string("\\x01",charset="iso-8859-15", maximum_length=13)  mxisc7, mxitc7;
  decimal("\\x01")  mxjonc;
  string("\\x01",charset="iso-8859-15", maximum_length=13)  mxiuc7;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxivc7;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxe7su;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxujst;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxo0c7;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxf4c5;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxckp2;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxfbsu;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxfcsu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxf3c5;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxe3su;
  string("\\x01",charset="iso-8859-15", maximum_length=13)  mxo1c7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxeusu;
  string("\\x01",charset="iso-8859-15", maximum_length=18)  mxwstx;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxexsu;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxb9bl, mxccbl, mxbubl, mxbsbl, mxb6bl, mxcabl, mxcebl, mxbwbl;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqpsu;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxqqsu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxo2c7, mxo3c7, mxo4c7, mxo5c7;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxo6c7;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxo7c7, mxo8c7;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqrsu;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxt7c1, mxzvst;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxo9c7, mxf8c5;
  string("\\x01",charset="iso-8859-15", maximum_length=4)  mxblu1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxlzsu;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxcbbl, mxb7bl, mxbvbl, mxbrbl, mxb5bl, mxb8bl, mxcdbl, mxbtbl;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxqssu, mxlosu, mxlpsu, mxlqsu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxpac7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxe6su, mxe5su;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxiyc7;
  decimal("\\x01")  mxjpnc;
  string("\\x01",charset="iso-8859-15", maximum_length=13)  mxizc7;
  decimal("\\x01")  mxjqnc, mxjrnc;
  string("\\x01",charset="iso-8859-15", maximum_length=14)  mxi0c7;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxiwc7, mxixc7;
  string("\\x01",charset="iso-8859-15", maximum_length=13)  mxi1c7;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxi2c7;
  string("\\x01",charset="iso-8859-15", maximum_length=13)  mxi3c7;
  decimal("\\x01".2, maximum_length=7, sign_reserved)  mxhhp2;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxi4c7, mxaecd, mxe1c3;
  string("\\x01",charset="iso-8859-15", maximum_length=8)  mxpbc7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxzyst;
  decimal("\\x01")  mxiyhk;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxuic1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxlrsu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxuhc1, mxbqu1, mxugc1, mxi5c7, mxi6c7, mxbnu1, mxi7c7, mxpcc7;
  string("\\x01",charset="iso-8859-15", maximum_length=11)  mxekc3;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxi8c7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxlssu;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxunc1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxltsu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxpdc7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxztst, mxlxsu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxjdc7, mxjcc7;
  decimal("\\x01")  mxjsnc;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxpec7;
  string("\\x01",charset="iso-8859-15", maximum_length=13)  mxfsc5;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxe1su;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxi9c7, mxemc3;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxubc1;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxjac7;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxeoc3;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxmzu1;
  string("\\x01",charset="iso-8859-15", maximum_length=25)  mxenc3;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxepc3;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxlusu;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxracd;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxqusu;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxg9u1;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxesc3;
  string("\\x01",charset="iso-8859-15", maximum_length=25)  mxerc3;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxetc3;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxf9c5, mxeqc3;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxqvsu;
  string("\\x01",charset="iso-8859-15", maximum_length=16)  mxpfc7;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqwsu;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxl6su;
  string("\\x01",charset="iso-8859-15", maximum_length=8)  mxtxc1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxl0su, mxl1su;
  decimal("\\x01".5, maximum_length=15, sign_reserved)  mxiop2;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxl2su, mxl3su, mxupst, mxd0c3;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqxsu;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxd1c3;
  decimal("\\x01")  mxaznb;
  string("\\x01",charset="iso-8859-15", maximum_length=4)  mxfdc3;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxfgc3;
  string("\\x01",charset="iso-8859-15", maximum_length=11)  mxpgc7;
  string("\\x01",charset="iso-8859-15", maximum_length=4)  mxtwc1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxddea;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxfic3, mxpacd;
  string("\\x01",charset="iso-8859-15", maximum_length=30)  mxhau1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxfkc3, mxqysu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxdgcd;
  string("\\x01",charset="iso-8859-15", maximum_length=5)  mxe5c3;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxe7c3;
  string("\\x01",charset="iso-8859-15", maximum_length=4)  mxe6c3;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxfjc3;
  decimal("\\x01".3, maximum_length=13, sign_reserved)  mxa9nb;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxbpu1;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxjbc7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxffc3, mxlvsu;
  decimal("\\x01")  mxa0nb, mxa1nb;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxe9c3, mxfac3;
  string("\\x01",charset="iso-8859-15", maximum_length=60)  mxxktx;
  string("\\x01",charset="iso-8859-15", maximum_length=14)  mxwqtx;
  decimal("\\x01")  mxacbl;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxqzsu, mxl4su, mxl5su, mxe0su;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxt9c1;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxt5c1;
  decimal("\\x01")  mxa4nb;
  string("\\x01",charset="iso-8859-15", maximum_length=70)  mxxjtx;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxfec3;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxphc7, mxakvn;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxe9su;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxtyc1;
  string("\\x01",charset="iso-8859-15", maximum_length=25)  mxd9c3;
  decimal("\\x01")  mxanun, mxo9hh;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxadvn;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxd5c3;
  string("\\x01",charset="iso-8859-15", maximum_length=30)  mxbku1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxetsu;
  decimal("\\x01")  mxbwtm;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxdzc3;
  decimal("\\x01")  mxg8da, mxg9da, mxdqda, mxdoda, mxoin1;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxq0su;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxt1c1;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxt6c1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxulc1;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxbmu1;
  string("\\x01",charset="iso-8859-15", maximum_length=30)  mxm0u1;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxg7u1;
  string("\\x01",charset="iso-8859-15", maximum_length=25)  mxm1u1;
  decimal("\\x01")  mxcchk;
  string("\\x01",charset="iso-8859-15", maximum_length=14)  mxgac5;
  decimal("\\x01")  mxcbhk;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxo3u1;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxpic7;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxq1su;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxo4u1;
  string("\\x01",charset="iso-8859-15", maximum_length=12)  mxjec7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxq2su;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxf0c5;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxq3su, mxeysu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxa2nb;
  decimal("\\x01")  mxcpnc;
  decimal("\\x01".3, maximum_length=13, sign_reserved)  mxcqnc;
  decimal("\\x01")  mxojn1;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxdyc3;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxgcc3, mxgdc3, mxgec3;
  decimal("\\x01")  mxpdn1;
  string("\\x01",charset="iso-8859-15", maximum_length=8)  mxfwc5;
  string("\\x01",charset="iso-8859-15", maximum_length=12)  mxdxc3;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxujc1;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxufc1, mxd2c3, mxpjc7, mxq4su, mxq5su, mxezsu;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxe8su;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxuost;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxhbu1, mxhcu1, mxhdu1;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxheu1, mxhfu1;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxgdu1, mxgeu1, mxgfu1;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxg5u1, mxa1p2;
  decimal("\\x01")  mxn2n1, mxa6nb, mxa7nb, mxjtnc, mxjunc;
  decimal("\\x01".5, maximum_length=15, sign_reserved)  mxhip2, mxhjp2, mxonn1;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxipp2;
  decimal("\\x01".5, maximum_length=15, sign_reserved)  mxhop2, mxdhv1;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxiqp2;
  decimal("\\x01".5, maximum_length=15, sign_reserved)  mxdiv1, mxbmpr;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxfuc5, mxukc1;
  decimal("\\x01".3, maximum_length=13, sign_reserved)  mxa3nb;
  decimal("\\x01".3, maximum_length=16, sign_reserved)  mxohn1;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxhkp2, mxaobl, mxiwp2, mxixp2, mxiyp2, mxalbl, mxcnp2, mxakbl;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxe2su;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxirp2, mxafbl, mxambl, mxaibl, mxanbl, mxisp2, mxaebl, mxapbl, mxarbl, mxitp2, mxahbl, mxiup2, mxivp2, mxizp2, mxaqbl, mxi0p2, mxagbl, mxajbl, mxbybl;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxz2st;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxfxc5;
  decimal("\\x01".5, maximum_length=15, sign_reserved)  mxhpp2;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxfyc5;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxlwsu;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxb4bl, mxi1p2, mxi2p2, mxi3p2, mxkynb, mxhpva, mxbobl, mxcmp2, mxhova, mxi4p2, mxifva, mxhlva, mxhqva, mxb3bl, mxhrva, mxieva, mxi5p2, mxdlv1, mxbqbl, mxucva, mxi6p2, mxi7p2, mxbpbl, mxcncd, mxbzbl, mxhnva, mxi8p2, mxi9p2, mxjap2;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxo4n1;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxfvc5, mxgoc5;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxhlp2, mxjbp2, mxkznb, mxjcp2, mxjdp2, mxh9va, mxclp2, mxo0n1, mxhmp2, mxhnp2, mxjep2, mxovn1, mxoyn1, mxo5n1, mxo2n1, mxoun1, mxjfp2, mxibva, mxb2bl, mxjgp2, mxoxn1, mxjhp2, mxjip2;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxggc5, mxghc5;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxb1bl, mxown1, mxbxbl, mxozn1, mxjjp2, mxjkp2, mxjlp2, mxjmp2, mxjnp2, mxjop2, mxjpp2, mxa2bl, mxcfbl, mxazbl, mxaybl;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxa6bl;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxatbl, mxawbl, mxa0bl, mxa1bl, mxasbl, mxa3bl, mxa5bl, mxavbl, mxa4bl, mxaubl, mxaxbl, mxjqp2, mxjrp2, mxjsp2, mxjtp2, mxjup2, mxadbl, mxblbl, mxjvp2, mxbhbl, mxjwp2, mxbdbl, mxbebl, mxbcbl, mxa8bl, mxbbbl, mxbfbl, mxbgbl, mxa7bl, mxbibl, mxbkbl, mxjxp2, mxbabl, mxjyp2, mxbjbl, mxbmbl, mxbnbl, mxa9bl, mxjzp2, mxj0p2, mxj1p2, mxj2p2, mxj3p2, mxj4p2, mxoqn1, mxorn1, mxdjv1, mxoon1, mxj5p2, mxdkv1;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxuqc1;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxdsv1, mxosn1, mxb0bl, mxopn1, mxotn1, mxj6p2;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  source_environment;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  rebill_cost_source = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill_cost_type_cde = NULL("");
  decimal("\\x01".5, maximum_length=15, sign_reserved)  rebill_cst_typ_unit_cost = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill_dispensing_fee = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=14)  rebill_drg_cst_comp_sch = NULL("");
  decimal("\\x01")  rebill_drgcstcompsch_seq = NULL("");
  decimal("\\x01".2, maximum_length=7, sign_reserved)  rebill_drug_cost_percent = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=13)  rebill_drug_cost_sched = NULL("");
  decimal("\\x01")  rebill_drugcostsched_seq = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill_fee_schedule_name = NULL("");
  decimal("\\x01")  rebill_fee_schedule_stp = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill_flat_sls_tax_amt = NULL(""), rebill_incentive_amount = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill_incnt_fee_sch_nme = NULL("");
  decimal("\\x01")  rebill_incnt_fee_sch_stp = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill_ingredient_cost = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill_price_sched_name = NULL("");
  decimal("\\x01")  rebill_price_sched_step = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=13)  rebill_price_table_name = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill_price_type = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill_sls_tax_amt_paid = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=6)  rebill_tax_schedule_name = NULL("");
  decimal("\\x01")  rebill_tax_schedule_stp = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill_total_amount = NULL(""), rebill_total_other_amt = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=1)  rebill2_cost_source = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill2_cost_type_cde = NULL("");
  decimal("\\x01".5, maximum_length=15, sign_reserved)  rebill2_cst_typ_unit_cost = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill2_dispensing_fee = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=14)  rebill2_drg_cst_comp_sch = NULL("");
  decimal("\\x01")  rebill2_drgcstcompsch_seq = NULL("");
  decimal("\\x01".2, maximum_length=7, sign_reserved)  rebill2_drug_cost_percent = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=13)  rebill2_drug_cost_sched = NULL("");
  decimal("\\x01")  rebill2_drugcostsched_seq = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill2_fee_schedule_name = NULL("");
  decimal("\\x01")  rebill2_fee_schedule_stp = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill2_flat_sls_tax_amt = NULL(""), rebill2_incentive_amount = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill2_incnt_fee_sch_nme = NULL("");
  decimal("\\x01")  rebill2_incnt_fee_sch_stp = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill2_ingredient_cost = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill2_price_sched_name = NULL("");
  decimal("\\x01")  rebill2_price_sched_step = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=13)  rebill2_price_table_name = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill2_price_type = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill2_sls_tax_amt_paid = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=6)  rebill2_tax_schedule_name = NULL("");
  decimal("\\x01")  rebill2_tax_schedule_stp = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill2_total_amount = NULL(""), rebill2_total_other_amt = NULL("");
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")  rebill_change_datetime = NULL(""), rebill_add_datetime = NULL("");
  string("\\x01")  Pharm_Direct_Flag = NULL(""), Indian_Tribal_Flag = NULL(""), Flag_340B = NULL(""), Home_Infusion_Flag = NULL(""), Historical_Flag = NULL(""), LegacyOrg_Hist_Flag = NULL(""), DMR_Flag = NULL(""), NonDrug_Flag = NULL(""), Pharm_Parent_Org = NULL(""), Inhouse_Flag = NULL("");
  decimal("\\x01")  Clt_Ing_Cst_Prior_MinCopay = NULL(""), Phr_Ing_Cst_Prior_MinCopay = NULL("");
  string("\\x01")  HighAWP_CM_Medispan = NULL(""), HighAWP_CM_Generic = NULL("");
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")  record_load_datetime = NULL(""), record_update_datetime = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=2)  record_load_reason, record_update_reason;
  string("\\x01",charset="iso-8859-15", maximum_length=25)  record_load_crm_ref_id, record_update_crm_ref_id;
  decimal("\\x01")  composite_last_seq;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  lgcy_rxt_db_cd;
  decimal("\\x01")  rxt_src_envrt_id = NULL("");
  string(3)  rxt_src_envrt_nm = NULL("");
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")  rxt_create_dttm;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  rxt_create_uid = NULL("");
  decimal("\\x01")  rxt_create_run_id = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=20)  rxt_create_dbuid;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")  rxt_updt_dttm;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  rxt_updt_uid = NULL("");
  decimal("\\x01")  rxt_updt_run_id = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=20)  rxt_updt_dbuid;
  decimal("\\x01")  rxt_rec_stat_cd = NULL("");
end|7|9|FK||{0|}}
{30001002|XXparameter|OUTPUT_COL_NM|$[record_info_item(OUTPUT_DML,item = "name") ]|3|9|K|@{0|}}
{30001002|XXparameter|REDUCED_COL|$[record_info_item(read_file(DATA_SOURCE_DML_REDUCED),item = "name")]|3|9|K|@{0|}}
{30001002|XXparameter|REDUCED_COL_STEP_2|$[record_info_item(read_file(DATA_SOURCE_DML_REDUCED_STEP2),item = "name")]|3|9|K|@{0|}}
{30001002|XXparameter|REDUCED_COL_STEP_3|$[record_info_item(read_file(DATA_SOURCE_DML_REDUCED_STEP3),item = "name")]|3|9|K|This is mostly used for file updates , deletes and count|{0|}}
{30001002|XXparameter|AB_SQL_RESERVED_FIELDS_DML|record
end|7|9|RFK||{0|}}
{30001002|XXparameter|DATA_SOURCE_REQUESTED_FIELDS_DML|record
  string("\\x01")  mxukc2;
  decimal("\\x01")  mxlhnb, mxoen1;
  string("\\x01")  mxumc2, mxunc2;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxd8c3;
  decimal(17,0)  mxs5nb;
  decimal(5,0)  mxs6nb;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxzsst;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxoyc7;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqgsu;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxg3u1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxo2u1;
  date("YYYYMMDD")  mxtdnb;
  date("YYYYMM")  mxjjnc;
  string("\\x01",charset="iso-8859-15", maximum_length=8)  mxmuu1;
  date("YYYYMMDD")  mxdmda;
  decimal("\\x01")  mxjknc;
  string("\\x01",charset="iso-8859-15", maximum_length=8)  mxmvu1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  b_g_flag;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  phr_price_type_rollup;
  decimal(13,2)  pre_awp, post_awp;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   cob_flag, compound_flag, high_awp, non_drug_flag, ltc_flag, in_house_pharmacy_flag, otc_flag;
  string("\\x01",charset="utf-16le", maximum_length=100)   client_name;
  unicode string("\\x01", maximum_length=50)   chain_name;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   spec_claim_flag, pharmacy_30_90_day_flag;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  clt_price_type_rollup;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   retail_mail_spec_flag;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   lob = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=25)   l_org_flag;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   briova_flag, catamaran_home_delivery_flag;
  unicode string("\\x01", maximum_length=6)   pharm_parent_id_chain_rollup_id;
  unicode string("\\x01", maximum_length=23)  pharmacy_group;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   vaccine_drug_flag;
  string("\\x01",charset="iso-8859-15", maximum_length=50)  chain_code, pogname, parent_org_id;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxefc3;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxumst, mxulst, mxukst;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxt2c1;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxumc1;
  decimal("\\x01")  mxconc;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxhlu1;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxgec5;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxhmu1;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxgfc5;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxelc3;
  decimal("\\x01")  mxoln1;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxfrc5;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxmwu1;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxmxu1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxmyu1;
  decimal("\\x01")  mxdpda;
  string("\\x01",charset="iso-8859-15", maximum_length=11)  mxg6u1;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxeac3, mxt8c1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxevsu;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxecc3;
  string("\\x01",charset="iso-8859-15", maximum_length=25)  mxebc3;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxedc3;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxdacd;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxegc3;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxt3c1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxmrlcd;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxt4c1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxg9c3;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxhcc3;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqhsu;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxewc3;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxuac1;
  string("\\x01",charset="iso-8859-15", maximum_length=12)  mxilc7;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mximc7;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxinc7;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxlnsu;
  string("\\x01",charset="iso-8859-15", maximum_length=55)  mxxctx;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxeuc3;
  string("\\x01",charset="iso-8859-15", maximum_length=25)  mxevc3;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxfasu;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxqisu;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxf5c5;
  string("\\x01",charset="iso-8859-15", maximum_length=9)  mxf1c5;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxqjsu;
  decimal("\\x01")  mxcrnc;
  string("\\x01",charset="iso-8859-15", maximum_length=9)  mxfqc5;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxfdsu;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxf6c5, mxe0c3;
  string("\\x01",charset="iso-8859-15", maximum_length=12)  mxezc3;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxftc5, mxdccd;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxjfc7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxlysu;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqksu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxf2c5, mxozc7, mxjhc7, mxjgc7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxe4su;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqlsu;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxikp2;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqmsu;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxilp2;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqnsu;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mximp2;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqosu;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxinp2;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxtzc1, mxt0c1;
  decimal("\\x01".2, maximum_length=7, sign_reserved)  mxhgp2;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxioc7;
  decimal("\\x01")  mxjnnc, mxjlnc;
  string("\\x01",charset="iso-8859-15", maximum_length=13)  mxipc7;
  decimal("\\x01")  mxjmnc;
  string("\\x01",charset="iso-8859-15", maximum_length=14)  mxiqc7;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxirc7;
  string("\\x01",charset="iso-8859-15", maximum_length=13)  mxisc7, mxitc7;
  decimal("\\x01")  mxjonc;
  string("\\x01",charset="iso-8859-15", maximum_length=13)  mxiuc7;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxivc7;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxe7su;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxujst;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxo0c7;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxf4c5;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxckp2;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxfbsu;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxfcsu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxf3c5;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxe3su;
  string("\\x01",charset="iso-8859-15", maximum_length=13)  mxo1c7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxeusu;
  string("\\x01",charset="iso-8859-15", maximum_length=18)  mxwstx;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxexsu;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxb9bl, mxccbl, mxbubl, mxbsbl, mxb6bl, mxcabl, mxcebl, mxbwbl;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqpsu;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxqqsu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxo2c7, mxo3c7, mxo4c7, mxo5c7;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxo6c7;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxo7c7, mxo8c7;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqrsu;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxt7c1, mxzvst;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxo9c7, mxf8c5;
  string("\\x01",charset="iso-8859-15", maximum_length=4)  mxblu1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxlzsu;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxcbbl, mxb7bl, mxbvbl, mxbrbl, mxb5bl, mxb8bl, mxcdbl, mxbtbl;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxqssu, mxlosu, mxlpsu, mxlqsu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxpac7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxe6su, mxe5su;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxiyc7;
  decimal("\\x01")  mxjpnc;
  string("\\x01",charset="iso-8859-15", maximum_length=13)  mxizc7;
  decimal("\\x01")  mxjqnc, mxjrnc;
  string("\\x01",charset="iso-8859-15", maximum_length=14)  mxi0c7;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxiwc7, mxixc7;
  string("\\x01",charset="iso-8859-15", maximum_length=13)  mxi1c7;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxi2c7;
  string("\\x01",charset="iso-8859-15", maximum_length=13)  mxi3c7;
  decimal("\\x01".2, maximum_length=7, sign_reserved)  mxhhp2;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxi4c7, mxaecd, mxe1c3;
  string("\\x01",charset="iso-8859-15", maximum_length=8)  mxpbc7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxzyst;
  decimal("\\x01")  mxiyhk;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxuic1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxlrsu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxuhc1, mxbqu1, mxugc1, mxi5c7, mxi6c7, mxbnu1, mxi7c7, mxpcc7;
  string("\\x01",charset="iso-8859-15", maximum_length=11)  mxekc3;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxi8c7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxlssu;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxunc1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxltsu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxpdc7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxztst, mxlxsu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxjdc7, mxjcc7;
  decimal("\\x01")  mxjsnc;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxpec7;
  string("\\x01",charset="iso-8859-15", maximum_length=13)  mxfsc5;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxe1su;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxi9c7, mxemc3;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxubc1;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxjac7;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxeoc3;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxmzu1;
  string("\\x01",charset="iso-8859-15", maximum_length=25)  mxenc3;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxepc3;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxlusu;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxracd;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxqusu;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxg9u1;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxesc3;
  string("\\x01",charset="iso-8859-15", maximum_length=25)  mxerc3;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxetc3;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxf9c5, mxeqc3;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxqvsu;
  string("\\x01",charset="iso-8859-15", maximum_length=16)  mxpfc7;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqwsu;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxl6su;
  string("\\x01",charset="iso-8859-15", maximum_length=8)  mxtxc1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxl0su, mxl1su;
  decimal("\\x01".5, maximum_length=15, sign_reserved)  mxiop2;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxl2su, mxl3su, mxupst, mxd0c3;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxqxsu;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxd1c3;
  decimal("\\x01")  mxaznb;
  string("\\x01",charset="iso-8859-15", maximum_length=4)  mxfdc3;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxfgc3;
  string("\\x01",charset="iso-8859-15", maximum_length=11)  mxpgc7;
  string("\\x01",charset="iso-8859-15", maximum_length=4)  mxtwc1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxddea;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxfic3, mxpacd;
  string("\\x01",charset="iso-8859-15", maximum_length=30)  mxhau1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxfkc3, mxqysu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxdgcd;
  string("\\x01",charset="iso-8859-15", maximum_length=5)  mxe5c3;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxe7c3;
  string("\\x01",charset="iso-8859-15", maximum_length=4)  mxe6c3;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxfjc3;
  decimal("\\x01".3, maximum_length=13, sign_reserved)  mxa9nb;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxbpu1;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxjbc7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxffc3, mxlvsu;
  decimal("\\x01")  mxa0nb, mxa1nb;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxe9c3, mxfac3;
  string("\\x01",charset="iso-8859-15", maximum_length=60)  mxxktx;
  string("\\x01",charset="iso-8859-15", maximum_length=14)  mxwqtx;
  decimal("\\x01")  mxacbl;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxqzsu, mxl4su, mxl5su, mxe0su;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxt9c1;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxt5c1;
  decimal("\\x01")  mxa4nb;
  string("\\x01",charset="iso-8859-15", maximum_length=70)  mxxjtx;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxfec3;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxphc7, mxakvn;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxe9su;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxtyc1;
  string("\\x01",charset="iso-8859-15", maximum_length=25)  mxd9c3;
  decimal("\\x01")  mxanun, mxo9hh;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxadvn;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxd5c3;
  string("\\x01",charset="iso-8859-15", maximum_length=30)  mxbku1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxetsu;
  decimal("\\x01")  mxbwtm;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxdzc3;
  decimal("\\x01")  mxg8da, mxg9da, mxdqda, mxdoda, mxoin1;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxq0su;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxt1c1;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxt6c1;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxulc1;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxbmu1;
  string("\\x01",charset="iso-8859-15", maximum_length=30)  mxm0u1;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxg7u1;
  string("\\x01",charset="iso-8859-15", maximum_length=25)  mxm1u1;
  decimal("\\x01")  mxcchk;
  string("\\x01",charset="iso-8859-15", maximum_length=14)  mxgac5;
  decimal("\\x01")  mxcbhk;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxo3u1;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxpic7;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxq1su;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  mxo4u1;
  string("\\x01",charset="iso-8859-15", maximum_length=12)  mxjec7;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxq2su;
  string("\\x01",charset="iso-8859-15", maximum_length=6)  mxf0c5;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxq3su, mxeysu;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxa2nb;
  decimal("\\x01")  mxcpnc;
  decimal("\\x01".3, maximum_length=13, sign_reserved)  mxcqnc;
  decimal("\\x01")  mxojn1;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxdyc3;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  mxgcc3, mxgdc3, mxgec3;
  decimal("\\x01")  mxpdn1;
  string("\\x01",charset="iso-8859-15", maximum_length=8)  mxfwc5;
  string("\\x01",charset="iso-8859-15", maximum_length=12)  mxdxc3;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxujc1;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxufc1, mxd2c3, mxpjc7, mxq4su, mxq5su, mxezsu;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxe8su;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxuost;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxhbu1, mxhcu1, mxhdu1;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxheu1, mxhfu1;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  mxgdu1, mxgeu1, mxgfu1;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxg5u1, mxa1p2;
  decimal("\\x01")  mxn2n1, mxa6nb, mxa7nb, mxjtnc, mxjunc;
  decimal("\\x01".5, maximum_length=15, sign_reserved)  mxhip2, mxhjp2, mxonn1;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxipp2;
  decimal("\\x01".5, maximum_length=15, sign_reserved)  mxhop2, mxdhv1;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxiqp2;
  decimal("\\x01".5, maximum_length=15, sign_reserved)  mxdiv1, mxbmpr;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxfuc5, mxukc1;
  decimal("\\x01".3, maximum_length=13, sign_reserved)  mxa3nb;
  decimal("\\x01".3, maximum_length=16, sign_reserved)  mxohn1;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxhkp2, mxaobl, mxiwp2, mxixp2, mxiyp2, mxalbl, mxcnp2, mxakbl;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxe2su;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxirp2, mxafbl, mxambl, mxaibl, mxanbl, mxisp2, mxaebl, mxapbl, mxarbl, mxitp2, mxahbl, mxiup2, mxivp2, mxizp2, mxaqbl, mxi0p2, mxagbl, mxajbl, mxbybl;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxz2st;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxfxc5;
  decimal("\\x01".5, maximum_length=15, sign_reserved)  mxhpp2;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxfyc5;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxlwsu;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxb4bl, mxi1p2, mxi2p2, mxi3p2, mxkynb, mxhpva, mxbobl, mxcmp2, mxhova, mxi4p2, mxifva, mxhlva, mxhqva, mxb3bl, mxhrva, mxieva, mxi5p2, mxdlv1, mxbqbl, mxucva, mxi6p2, mxi7p2, mxbpbl, mxcncd, mxbzbl, mxhnva, mxi8p2, mxi9p2, mxjap2;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxo4n1;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxfvc5, mxgoc5;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxhlp2, mxjbp2, mxkznb, mxjcp2, mxjdp2, mxh9va, mxclp2, mxo0n1, mxhmp2, mxhnp2, mxjep2, mxovn1, mxoyn1, mxo5n1, mxo2n1, mxoun1, mxjfp2, mxibva, mxb2bl, mxjgp2, mxoxn1, mxjhp2, mxjip2;
  string("\\x01",charset="iso-8859-15", maximum_length=10)  mxggc5, mxghc5;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxb1bl, mxown1, mxbxbl, mxozn1, mxjjp2, mxjkp2, mxjlp2, mxjmp2, mxjnp2, mxjop2, mxjpp2, mxa2bl, mxcfbl, mxazbl, mxaybl;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  mxa6bl;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxatbl, mxawbl, mxa0bl, mxa1bl, mxasbl, mxa3bl, mxa5bl, mxavbl, mxa4bl, mxaubl, mxaxbl, mxjqp2, mxjrp2, mxjsp2, mxjtp2, mxjup2, mxadbl, mxblbl, mxjvp2, mxbhbl, mxjwp2, mxbdbl, mxbebl, mxbcbl, mxa8bl, mxbbbl, mxbfbl, mxbgbl, mxa7bl, mxbibl, mxbkbl, mxjxp2, mxbabl, mxjyp2, mxbjbl, mxbmbl, mxbnbl, mxa9bl, mxjzp2, mxj0p2, mxj1p2, mxj2p2, mxj3p2, mxj4p2, mxoqn1, mxorn1, mxdjv1, mxoon1, mxj5p2, mxdkv1;
  string("\\x01",charset="iso-8859-15", maximum_length=2)  mxuqc1;
  decimal("\\x01".2, maximum_length=11, sign_reserved)  mxdsv1, mxosn1, mxb0bl, mxopn1, mxotn1, mxj6p2;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  source_environment;
  string("\\x01",charset="iso-8859-15", maximum_length=1)  rebill_cost_source = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill_cost_type_cde = NULL("");
  decimal("\\x01".5, maximum_length=15, sign_reserved)  rebill_cst_typ_unit_cost = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill_dispensing_fee = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=14)  rebill_drg_cst_comp_sch = NULL("");
  decimal("\\x01")  rebill_drgcstcompsch_seq = NULL("");
  decimal("\\x01".2, maximum_length=7, sign_reserved)  rebill_drug_cost_percent = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=13)  rebill_drug_cost_sched = NULL("");
  decimal("\\x01")  rebill_drugcostsched_seq = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill_fee_schedule_name = NULL("");
  decimal("\\x01")  rebill_fee_schedule_stp = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill_flat_sls_tax_amt = NULL(""), rebill_incentive_amount = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill_incnt_fee_sch_nme = NULL("");
  decimal("\\x01")  rebill_incnt_fee_sch_stp = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill_ingredient_cost = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill_price_sched_name = NULL("");
  decimal("\\x01")  rebill_price_sched_step = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=13)  rebill_price_table_name = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill_price_type = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill_sls_tax_amt_paid = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=6)  rebill_tax_schedule_name = NULL("");
  decimal("\\x01")  rebill_tax_schedule_stp = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill_total_amount = NULL(""), rebill_total_other_amt = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=1)  rebill2_cost_source = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill2_cost_type_cde = NULL("");
  decimal("\\x01".5, maximum_length=15, sign_reserved)  rebill2_cst_typ_unit_cost = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill2_dispensing_fee = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=14)  rebill2_drg_cst_comp_sch = NULL("");
  decimal("\\x01")  rebill2_drgcstcompsch_seq = NULL("");
  decimal("\\x01".2, maximum_length=7, sign_reserved)  rebill2_drug_cost_percent = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=13)  rebill2_drug_cost_sched = NULL("");
  decimal("\\x01")  rebill2_drugcostsched_seq = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill2_fee_schedule_name = NULL("");
  decimal("\\x01")  rebill2_fee_schedule_stp = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill2_flat_sls_tax_amt = NULL(""), rebill2_incentive_amount = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill2_incnt_fee_sch_nme = NULL("");
  decimal("\\x01")  rebill2_incnt_fee_sch_stp = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill2_ingredient_cost = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill2_price_sched_name = NULL("");
  decimal("\\x01")  rebill2_price_sched_step = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=13)  rebill2_price_table_name = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=10)  rebill2_price_type = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill2_sls_tax_amt_paid = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=6)  rebill2_tax_schedule_name = NULL("");
  decimal("\\x01")  rebill2_tax_schedule_stp = NULL("");
  decimal("\\x01".2, maximum_length=11, sign_reserved)  rebill2_total_amount = NULL(""), rebill2_total_other_amt = NULL("");
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")  rebill_change_datetime = NULL(""), rebill_add_datetime = NULL("");
  string("\\x01")  Pharm_Direct_Flag = NULL(""), Indian_Tribal_Flag = NULL(""), Flag_340B = NULL(""), Home_Infusion_Flag = NULL(""), Historical_Flag = NULL(""), LegacyOrg_Hist_Flag = NULL(""), DMR_Flag = NULL(""), NonDrug_Flag = NULL(""), Pharm_Parent_Org = NULL(""), Inhouse_Flag = NULL("");
  decimal("\\x01")  Clt_Ing_Cst_Prior_MinCopay = NULL(""), Phr_Ing_Cst_Prior_MinCopay = NULL("");
  string("\\x01")  HighAWP_CM_Medispan = NULL(""), HighAWP_CM_Generic = NULL("");
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")  record_load_datetime = NULL(""), record_update_datetime = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=2)  record_load_reason, record_update_reason;
  string("\\x01",charset="iso-8859-15", maximum_length=25)  record_load_crm_ref_id, record_update_crm_ref_id;
  decimal("\\x01")  composite_last_seq;
  string("\\x01",charset="iso-8859-15", maximum_length=3)  lgcy_rxt_db_cd;
  decimal("\\x01")  rxt_src_envrt_id = NULL("");
  string(3)  rxt_src_envrt_nm = NULL("");
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")  rxt_create_dttm;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  rxt_create_uid = NULL("");
  decimal("\\x01")  rxt_create_run_id = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=20)  rxt_create_dbuid;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")  rxt_updt_dttm;
  string("\\x01",charset="iso-8859-15", maximum_length=20)  rxt_updt_uid = NULL("");
  decimal("\\x01")  rxt_updt_run_id = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=20)  rxt_updt_dbuid;
  decimal("\\x01")  rxt_rec_stat_cd = NULL("");
end|7|9|RFK||{0|}}
{30001002|XXparameter|DATA_SOURCE_FILTER_EXPRESSION|(((mxtdnb>=((date('YYYY-MM-DD'))'2016-01-01')) and (mxtdnb<=((date('YYYY-MM-DD'))'2016-01-03'))) and (mxs5nb member [vector 160016161825006,160014713256018,160011446240011,160011252018010,160013482985004,160014990154007,160015459422107,160013470479111,160014868391007,160012614518139,160012999958022,153518415634048,160011864786127,160016305606049,153575419081030,160014276595015,160014496735015,160014739395039,160013972387013,160015172997015,160011562487045,160015411558016,160014183761140,160013616932008,160013523002015,160015975640008,160013864077009,160013174105134,160012884273039,160012008423112,160011803483024,160015263642018,160014046639127,160013152415014,160013373461013,160014588690019,153528341997005,160018480874026,160013380993006,160014289378024,160016045018019,160014713256018,160011446240011,160011252018010,160013482985004,160014990154007,160015459422107,160013470479111,160014868391007,160012614518139,160012999958022,153518415634048,160011864786127,160016305606049,153575419081030,160014276595015,160014496735015,160014739395039,160013972387013,160015172997015,160011562487045,160015411558016,160014183761140,160013616932008,160013523002015,160015975640008,160013864077009,160013174105134,160012884273039,160012008423112,160011803483024,160015263642018,160014046639127,160013152415014,160013373461013,160014588690019,153528341997005,160018480874026,160013380993006,160014289378024,160016045018019]))|20|9|RFK||{0|}}
{30001002|XXparameter|DATA_SOURCE_FILTER_EXPRESSION_FIELDS_DML|record
  decimal(17,0)  mxs5nb;
  date("YYYYMMDD")  mxtdnb;
end|7|9|RFK||{0|}}
{30001002|XXparameter|DATA_SOURCE_QE_VECTOR_CONSTRUCTOR|[ vector
(qe_term_type)[record 
  field_name 'mxtdnb'
  field_op '>='
  field_values [vector (datetime('YYYY-MM-DD HH24:MI:SS.nnnnnn'))((date('YYYY-MM-DD'))'2016-01-01')]
  field_connective_op 'AND'
  field_connective_op_lvl 1],
(qe_term_type)[record 
  field_name 'mxtdnb'
  field_op '<='
  field_values [vector (datetime('YYYY-MM-DD HH24:MI:SS.nnnnnn'))((date('YYYY-MM-DD'))'2016-01-03')]
  field_connective_op 'AND'
  field_connective_op_lvl 1],
(qe_term_type)[record 
  field_name 'mxs5nb'
  field_op 'IN'
  field_values [ vector (decimal('')) 160016161825006, (decimal(''))160014713256018, (decimal(''))160011446240011, (decimal(''))160011252018010, (decimal(''))160013482985004, (decimal(''))160014990154007, (decimal(''))160015459422107, (decimal(''))160013470479111, (decimal(''))160014868391007, (decimal(''))160012614518139, (decimal(''))160012999958022, (decimal(''))153518415634048, (decimal(''))160011864786127, (decimal(''))160016305606049, (decimal(''))153575419081030, (decimal(''))160014276595015, (decimal(''))160014496735015, (decimal(''))160014739395039, (decimal(''))160013972387013, (decimal(''))160015172997015, (decimal(''))160011562487045, (decimal(''))160015411558016, (decimal(''))160014183761140, (decimal(''))160013616932008, (decimal(''))160013523002015, (decimal(''))160015975640008, (decimal(''))160013864077009, (decimal(''))160013174105134, (decimal(''))160012884273039, (decimal(''))160012008423112, (decimal(''))160011803483024, (decimal(''))160015263642018, (decimal(''))160014046639127, (decimal(''))160013152415014, (decimal(''))160013373461013, (decimal(''))160014588690019, (decimal(''))153528341997005, (decimal(''))160018480874026, (decimal(''))160013380993006, (decimal(''))160014289378024, (decimal(''))160016045018019, (decimal(''))160014713256018, (decimal(''))160011446240011, (decimal(''))160011252018010, (decimal(''))160013482985004, (decimal(''))160014990154007, (decimal(''))160015459422107, (decimal(''))160013470479111, (decimal(''))160014868391007, (decimal(''))160012614518139, (decimal(''))160012999958022, (decimal(''))153518415634048, (decimal(''))160011864786127, (decimal(''))160016305606049, (decimal(''))153575419081030, (decimal(''))160014276595015, (decimal(''))160014496735015, (decimal(''))160014739395039, (decimal(''))160013972387013, (decimal(''))160015172997015, (decimal(''))160011562487045, (decimal(''))160015411558016, (decimal(''))160014183761140, (decimal(''))160013616932008, (decimal(''))160013523002015, (decimal(''))160015975640008, (decimal(''))160013864077009, (decimal(''))160013174105134, (decimal(''))160012884273039, (decimal(''))160012008423112, (decimal(''))160011803483024, (decimal(''))160015263642018, (decimal(''))160014046639127, (decimal(''))160013152415014, (decimal(''))160013373461013, (decimal(''))160014588690019, (decimal(''))153528341997005, (decimal(''))160018480874026, (decimal(''))160013380993006, (decimal(''))160014289378024, (decimal(''))160016045018019]
  field_connective_op ''
  field_connective_op_lvl 0]]
|20|9|RFK||{0|}}
{30001002|XXparameter|DATA_SOURCE_QE_EXPRESSION|(( /*(date("YYYYMMDD"))*/mxtdnb >=  (datetime('YYYY-MM-DD HH24:MI:SS.nnnnnn'))((date('YYYY-MM-DD'))'2016-01-01') ) and ( /*(date("YYYYMMDD"))*/mxtdnb <=  (datetime('YYYY-MM-DD HH24:MI:SS.nnnnnn'))((date('YYYY-MM-DD'))'2016-01-03') ) and (/*(decimal(17,0))*/mxs5nb member [vector  (decimal('')) 160016161825006,  (decimal(''))160014713256018,  (decimal(''))160011446240011,  (decimal(''))160011252018010,  (decimal(''))160013482985004,  (decimal(''))160014990154007,  (decimal(''))160015459422107,  (decimal(''))160013470479111,  (decimal(''))160014868391007,  (decimal(''))160012614518139,  (decimal(''))160012999958022,  (decimal(''))153518415634048,  (decimal(''))160011864786127,  (decimal(''))160016305606049,  (decimal(''))153575419081030,  (decimal(''))160014276595015,  (decimal(''))160014496735015,  (decimal(''))160014739395039,  (decimal(''))160013972387013,  (decimal(''))160015172997015,  (decimal(''))160011562487045,  (decimal(''))160015411558016,  (decimal(''))160014183761140,  (decimal(''))160013616932008,  (decimal(''))160013523002015,  (decimal(''))160015975640008,  (decimal(''))160013864077009,  (decimal(''))160013174105134,  (decimal(''))160012884273039,  (decimal(''))160012008423112,  (decimal(''))160011803483024,  (decimal(''))160015263642018,  (decimal(''))160014046639127,  (decimal(''))160013152415014,  (decimal(''))160013373461013,  (decimal(''))160014588690019,  (decimal(''))153528341997005,  (decimal(''))160018480874026,  (decimal(''))160013380993006,  (decimal(''))160014289378024,  (decimal(''))160016045018019,  (decimal(''))160014713256018,  (decimal(''))160011446240011,  (decimal(''))160011252018010,  (decimal(''))160013482985004,  (decimal(''))160014990154007,  (decimal(''))160015459422107,  (decimal(''))160013470479111,  (decimal(''))160014868391007,  (decimal(''))160012614518139,  (decimal(''))160012999958022,  (decimal(''))153518415634048,  (decimal(''))160011864786127,  (decimal(''))160016305606049,  (decimal(''))153575419081030,  (decimal(''))160014276595015,  (decimal(''))160014496735015,  (decimal(''))160014739395039,  (decimal(''))160013972387013,  (decimal(''))160015172997015,  (decimal(''))160011562487045,  (decimal(''))160015411558016,  (decimal(''))160014183761140,  (decimal(''))160013616932008,  (decimal(''))160013523002015,  (decimal(''))160015975640008,  (decimal(''))160013864077009,  (decimal(''))160013174105134,  (decimal(''))160012884273039,  (decimal(''))160012008423112,  (decimal(''))160011803483024,  (decimal(''))160015263642018,  (decimal(''))160014046639127,  (decimal(''))160013152415014,  (decimal(''))160013373461013,  (decimal(''))160014588690019,  (decimal(''))153528341997005,  (decimal(''))160018480874026,  (decimal(''))160013380993006,  (decimal(''))160014289378024,  (decimal(''))160016045018019]))  |20|9|RFK||{0|}}
{30001002|XXparameter|AB_SQL_USERNAME|msingh|3|9|FK||{0|}}
{30001002|XXparameter|security_filter|1|20|9|FK||{0|}}
{30001002|XXparameter|security_mapping||8|9|FK||{0|}}
{30001002|XXparameter|comment_40|####################################|3|1|Kl||{0|}}
{30001002|XXparameter|comment_41|# END     QUERY ENGINE v2 INTERFACE PARAMETERS     #|3|1|Kl||{0|}}
{30001002|XXparameter|comment_42|####################################|3|1|Kl||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|USE_REDUCED_DATASET_ID|$[ if( DATA_SOURCE_QE_EXPRESSION == '1' && OUTPUT_COL_NM[0]!="_ab_subgraph_dummy") 99
else if(length_of(vector_difference(OUTPUT_COL_NM,REDUCED_COL_STEP_3))==0  or OUTPUT_COL_NM[0]=="_ab_subgraph_dummy" ) 1
else if(length_of(vector_difference(OUTPUT_COL_NM,REDUCED_COL_STEP_2))==0  ) 2
else if (length_of(vector_difference(OUTPUT_COL_NM,REDUCED_COL))==0) 3
else 4 ]|3|9|K|@{0|}}
{30001002|XXparameter|DATA_SOURCE_DML_EXPANDED|$[ if(USE_REDUCED_DATASET_ID== 1 ) expand_type(read_file(DATA_SOURCE_DML_REDUCED_STEP3)) 
  else if(USE_REDUCED_DATASET_ID== 2 ) expand_type(read_file(DATA_SOURCE_DML_REDUCED_STEP2))
  else if(USE_REDUCED_DATASET_ID== 3 ) expand_type(read_file(DATA_SOURCE_DML_REDUCED))
  else expand_type(DATA_SOURCE_DML)
]|3|9|RK||{0|}}
{30001002|XXparameter|AB_QE_QUERY_FIELDS_DML|include "~$ABSQL_DML/qe_term_type.dml";

metadata type = 
record
  qe_term_type[decimal(6,0)] _ab_qe_query;
end;|3|9|RK||{0|}}
{30001002|XXparameter|AB_QE_QUERY_FIELDS_DML_RESOLVED|$[ expand_type(AB_QE_QUERY_FIELDS_DML) ]|7|9|RK||{0|}}
{30001002|XXparameter|AB_SUBGRAPH_PLUMBING_FIELDS_DML|$[ join_types(AB_QE_QUERY_FIELDS_DML_RESOLVED, AB_SQL_RESERVED_FIELDS_DML) ]|7|9|RK||{0|}}
{30001002|XXparameter|DATA_SOURCE_AND_PLUMBING_FIELDS_DML|$[ DATA_SOURCE_DML_EXPANDED ]|7|9|RK||{0|}}
{30001002|XXparameter|FINAL_FILTER_EXPRESSION|($\{security_filter\}) && ($\{DATA_SOURCE_FILTER_EXPRESSION\}) && ($\{DATA_SOURCE_QE_EXPRESSION\})|20|9|RK||{0|}}
{30001002|XXparameter|USER_PARAMETERS|########################################|3|1|Kl|@{0|}}
{30001002|XXparameter|INDEX_COL|mxtdnb|3|9|FK|The field which is used as index for creating split icff files|{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|ICFF_KEY|mxs5nb|3|2|FK$|@{0|}}
{30001002|XXparameter|FILE_SUBDIR|rxclaim_adjud|3|9|FK|Subdirectory where splitted icff have been created|{0|}}
{30001002|XXparameter|FILE_MASK|rxclaim_adjudication_|3|2|FK$|The Mask of icff files|{0|}}
{30001002|XXparameter|MIN_TXN_DATE|20130101|3|2|RFK$|Start date for which queries will generate a range to read files|{0|}}
{30001002|XXparameter|MAX_TXN_DATE|$[(date("YYYYMMDD")) now1()]|3|9|RFK|End date for which queries will generate a range to read files|{0|}}
{30001002|XXparameter|PICK_FILE_ONE|$[
begin
let decimal(",") count_file_vec_len=length_of(directory_listing(string_concat(DATA_URL,"/",FILE_SUBDIR,"/"), string_concat(FILE_MASK,"*.dat.gz")) );
result :: directory_listing(string_concat(DATA_URL,"/",FILE_SUBDIR,"/"), string_concat(FILE_MASK,"*.dat.gz"))[count_file_vec_len - 1];
end
]|3|9|K|This file has to be read|{0|}}
{30001002|XXparameter|mpcmodtime|1455384624|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|!ab_compatibility|3.2.4.1|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@1178000|302000|0|0|1510000|554000|26|icff_seq_and_index_read|Mukesh.Singh||1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1510000|648000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.3|{1|0|}@|@@@@31634943|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Query-It||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@80|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Component will split record based
 on icff key so that for every 
icff key it perform one 
lookup at a time|662000|507000|0|0|0|0|2256|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@Component will split record based
Lookup operation ICFF is performed 
here .|927000|522000|0|0|0|0|2257|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@If Query is not using ICFF key 
This router will route to 
sequential scan method|657000|87000|0|0|0|0|2258|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|8421504|100|0|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{8|227000|229000|247000|229000|269000|229000|290000|229000|}1867|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}1860|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{8|787000|224000|807000|224000|834000|224000|855000|224000|}1888|530|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}2259|17|}}
{2010243001|XXGwatcher|15|0|29|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}2248|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{12|1103000|224000|1123000|224000|1154000|224000|1154000|239000|1185000|239000|1206000|239000|}1889|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{0|}2250|17|}}
{2010243001|XXGwatcher|19|0|37|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{0|}2260|17|}}
{2010501005|XXGpvertex|21|0|41|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@540000|195000|723000|204000|54000|41000|1804|Broadcast|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|22|0|43|0|{@{}@776000|219000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|23|0|46|0|{@{}@713000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|24|0|49|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1367003041|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|25|0|51|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|26|0|54|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|27|0|57|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|/* This type is optional.*/
// type temporary_type = NULL_TYPE;


/* This function is optional. */
/*Number of records to output.  Either this function or finished() must be defined.*/
out::length(in)=
begin
  out :: 1 + in.end_date - in.start_date;
end;

/*Do computation*/
out::normalize(in,index)=
begin
  out.day :: in.start_date + index;
  out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|include "~$ABSQL_DML/qe_term_type.dml";
metadata type = 
record
  date("YYYY-MM-DD") day;
  qe_term_type[decimal(6,0)] _ab_qe_query;
  integer(8) _ab_seqno;
end;|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@281000|155000|301000|175000|123000|107000|1861|Generate Days in Range|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|28|0|59|0|{@{}@423000|224000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|29|0|62|0|{@{}@319000|281000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|30|0|64|0|{@{}@359000|281000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|31|0|66|0|{@{}@399000|281000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|32|0|68|0|{@{}@291000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|33|0|71|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1367003041|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|34|0|73|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|35|0|76|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|36|0|79|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|37|0|82|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|38|0|85|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|39|0|88|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|include "~$ABSQL_DML/qe_term_type.dml";

out::reformat(in)=
begin
  let qe_term_type term;
  //resonable defaults - for the possible time period for which the daily files exist
  //TODO - walk directory structure to figure out available date ranges. Optionally parameterize so that can be configured from Query>It admin UI.
  
  let date("YYYYMMDD") start_date = '$\{MIN_TXN_DATE\}'; 
  let date("YYYYMMDD") end_date = '$\{MAX_TXN_DATE\}'; 

  for (let qe_term_type term in in._ab_qe_query)
  begin
    if (term.field_name == '$\{INDEX_COL\}')
        begin
           let date("YYYYMMDD") val = (datetime("YYYY-MM-DD HH24:MI:SS.NNNNNN"))(string(''))term.field_values[0];
           if ((term.field_op == '<=' or term.field_op == '<') and (end_date > val))
              end_date = val;
           else if ((term.field_op == '>=' or term.field_op == '>') and (start_date < val))
              start_date = val;
           else if (term.field_op == '=')
             begin
               start_date = val;
               end_date = val;
             end;
        end;
  end;
  out.start_date :: start_date;
  out.end_date :: end_date;
  out.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|out0_metadata|include "~$ABSQL_DML/qe_term_type.dml";

metadata type = 
record
  date("YYYY-MM-DD") start_date;
  date("YYYY-MM-DD") end_date; 
  qe_term_type[decimal(6,0)] _ab_qe_query;
  integer(8) _ab_seqno;
end;|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
}}@0|@74367|167317|94000|187000|123000|89000|1868|Reformat Query|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|40|0|90|0|{@{}@216000|224000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|41|0|93|0|{@{}@109000|275000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|42|0|95|0|{@{}@149000|275000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|43|0|97|0|{@{}@189000|275000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|44|0|99|0|{@{}@84000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|45|0|101|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|output_index_signature|int out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
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
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1271210992|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|46|0|103|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|47|0|107|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|48|0|110|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|49|0|113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|50|0|116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|51|0|121|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0||3|8|=|@{0|}}
{30001002|XXparameter|select||3|8|=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|=|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@1127000|190000|1217000|185000|132000|107000|1887|Final Filter and Masking|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|52|0|123|0|{@{}@1348000|234000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|53|0|125|0|{@{}@1239000|291000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|54|0|127|0|{@{}@1279000|291000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|55|0|129|0|{@{}@1319000|291000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|56|0|131|0|{@{}@1207000|234000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|57|0|135|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1367003041|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|58|0|137|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|59|0|141|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|60|0|144|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|61|0|147|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|62|0|150|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|63|0|153|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|//Identify which data or index file to use , based on output of query
let string("\\x01") FILE_SUB_DIR=  if( $\{USE_REDUCED_DATASET_ID\} == 99 ) "/$\{FILE_SUBDIR\}"
                                  else if( $\{USE_REDUCED_DATASET_ID\} == 1 ) "/$\{FILE_SUBDIR\}_reduced_step3"  
                                  else if( $\{USE_REDUCED_DATASET_ID\} == 2 ) "/$\{FILE_SUBDIR\}_reduced_step2"  
                                  else if( $\{USE_REDUCED_DATASET_ID\} == 3 ) "/$\{FILE_SUBDIR\}_reduced" 
                                  else  "/$\{FILE_SUBDIR\}" ;
let lookup_identifier_type current_lookup = allocate() ; 

out::finished(in, index) =
begin
let decimal("") key_val=string_lrtrim(in.key);
let string("") path=string_concat("$\{DATA_URL\}", FILE_SUB_DIR , "/$\{FILE_MASK\}", (string(""))(date("YYYYMMDD"))in.day);
let string("") datafile=this_partition_path(path + ".dat.gz");
let string("") indexfile=this_partition_path(path + ".idx");
current_lookup = first_without_error(lookup_load(datafile,indexfile, "ICFF_TEMPLATE"),lookup_not_loaded());
out :: if (index == 0 and current_lookup != lookup_not_loaded() ) is_null(lookup(current_lookup,"ICFF_TEMPLATE",key_val))  //In case missing data or index file lookup not loaded function will save the day.
       else if (current_lookup != lookup_not_loaded()) is_null(lookup_next(current_lookup,"ICFF_TEMPLATE"))
       else 1;
end;

out::normalize(in, index) =
begin
//get the record format for lookup  
let
$\{DATA_SOURCE_DML_EXPANDED\} lookup_record_type=NULL;
lookup_previous(current_lookup,"ICFF_TEMPLATE"); // Go back to where finished was prior to calling lookup or lookup_next
lookup_record_type = lookup_next(current_lookup,"ICFF_TEMPLATE");
 
//Output the record

out.* :1: lookup_record_type.*;

end;|3|3|c|@{0|}}
{30001002|XXparameter|out_metadata|$[ DATA_SOURCE_DML_EXPANDED ]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/rt270p.dat.gz|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@948000|397000|0|0|0|0|2261|Normalize :Index SCAN by lookup|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|64|0|155|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|65|0|158|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|66|0|160|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|67|0|162|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|68|0|164|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|69|0|167|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|70|0|169|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|71|0|172|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|72|0|175|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|73|0|178|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|74|0|181|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|75|0|184|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform|include "~$ABSQL_DML/qe_term_type.dml";
 let decimal("") val=0;
 let integer(3) i=0;
out :: length(in) =
begin

  for (let qe_term_type term in in._ab_qe_query)
  begin
    if (term.field_name == '$\{ICFF_KEY\}')
        begin
            val = length_of(term.field_values);
        end;
  end;
  out :: val;
end;

out :: normalize(in, index) =
begin
let qe_term_type ab_query_value;
let string("")[10000] ivec = allocate();
for (let qe_term_type term in in._ab_qe_query)
  begin
    if (term.field_name == '$\{ICFF_KEY\}')
          begin
           for(i ,i <= index ) 
              begin
                ivec[index] = term.field_values[index];
               end;
           end;
    end;
out.day :: in.day;
out.key :: ivec[index];
end;|3|3|c|@{0|}}
{30001002|XXparameter|out_metadata|record
  date("YYYY-MM-DD") day;
  string("") key;
end|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata|include "~$ABSQL_DML/qe_term_type.dml";
metadata type = 
record
  date("YYYY-MM-DD") day;
  qe_term_type[decimal(6,0)] _ab_qe_query;
  integer(8) _ab_seqno;
end;|3|1|l|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@687000|400000|0|0|0|0|2246|Normalize :Split index col|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|76|0|186|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|77|0|189|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|78|0|191|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|79|0|193|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|80|0|195|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|81|0|198|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|82|0|200|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|83|0|203|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|84|0|206|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|85|0|209|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|86|0|212|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|87|0|224|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|$DATA_SOURCE_DML_EXPANDED|3|2|$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|keep_on_disk|True|3|1|l|@{0|}}
}}@0|@282000|40500|0|0|0|0|2264|ICFF_TEMPLATE|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010503005|XXGfvertex|88|0|226|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010501005|XXGpvertex|89|0|230|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|type input_type = $\{DATA_SOURCE_DML_EXPANDED\};


let string("\\x01") FILE_SUB_DIR=  if( $\{USE_REDUCED_DATASET_ID\} == 99 ) "/$\{FILE_SUBDIR\}"
                                  else if( $\{USE_REDUCED_DATASET_ID\} == 1 ) "/$\{FILE_SUBDIR\}_reduced_step3"  
                                  else if( $\{USE_REDUCED_DATASET_ID\} == 2 ) "/$\{FILE_SUBDIR\}_reduced_step2"  
                                  else if( $\{USE_REDUCED_DATASET_ID\} == 3 ) "/$\{FILE_SUBDIR\}_reduced" 
                                  else  "/$\{FILE_SUBDIR\}" ;


/*extract filename from input record*/
filename::get_filename(in)=
begin
  let dt_rec = decode_date_record(in.day);
  
  filename :: if( $\{USE_REDUCED_DATASET_ID\} == 99 )  string_concat(this_partition_path("$\{DATA_URL\}"), FILE_SUB_DIR ,"/","$\{PICK_FILE_ONE\}" ) 
               else string_concat(this_partition_path("$\{DATA_URL\}"), FILE_SUB_DIR , "/$\{FILE_MASK\}", (string(""))(date("YYYYMMDD"))in.day, ".dat.gz");
end;

/* This function is optional. */
/*Create output record*/
out::reformat(read,filename,in)=
begin
  out.* :: read.*;
  out.* :1: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|Layout|$\{DATA_URL\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
{30001002|XXparameter|fileerror_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|file_missing|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|file_unavailable|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|filename_error|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@911000|14000|866000|179000|227000|113000|1890|Read Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|90|0|232|0|{@{}@1092000|219000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|91|0|235|0|{@{}@884000|291000|11000|11000|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|92|0|237|0|{@{}@924000|291000|11000|11000|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|93|0|239|0|{@{}@964000|291000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|94|0|241|0|{@{}@1004000|291000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|95|0|243|0|{@{}@1044000|291000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|96|0|245|0|{@{}@856000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|97|0|248|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{30001002|XXparameter|compressed|False|13|1|FKl|If True, reads compressed input files|{0|}}
{30001002|XXparameter|compressed.condition|version 2.12.2.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|read_as_single_record|False|13|1|FKl|If True, reads each file as one record, adding an initial 8-byte size|{0|}}
{30001002|XXparameter|read_as_single_record.condition|param_exact read-blocks False version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|read_blocks|False|13|1|FKl|If True, reads each file as a series of blocks, adding an initial 8-byte size to each block|{0|}}
{30001002|XXparameter|read_blocks.display_name|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.keyword|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.condition|param_exact read_as_single_record False version 2.14.25:|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|8|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation2|optional out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation2_analysis|optional long finished_out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation3|optional out::reformat(read, filename, in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|optional out::reformat(read, filename, in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional read::repair_input(rawbytes, filename)|3|2|H$|Repair malformed input record from file|{0|}}
{30001002|XXparameter|operation4_analysis|NULL|3|2|H$||{0|}}
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
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|filereject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|fileerror_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,filereject,fileerror,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1367003023|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: filereject = in
metadata type: fileerror = "string('\\\\n')"
metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|98|0|250|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|99|0|253|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|100|0|256|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|101|0|259|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|102|0|262|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|103|0|265|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|104|0|268|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|105|0|275|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|output_index|include "~$ABSQL_DML/qe_term_type.dml";
 let decimal("") val=0;
/*Function returning index of output port*/
output_index_out::output_index(in)=
begin

  for (let qe_term_type term in in._ab_qe_query)
  begin
    if (term.field_name == '$\{ICFF_KEY\}')
        begin
            val = length_of(term.field_values);
        end;
  end;
  output_index_out:: if ( val >  400 or val == 0 ) 0  else 1;
end;|3|3|c|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@693000|155000|0|0|0|0|2249|Router : Index or seq|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|106|0|277|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|107|0|280|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|108|0|283|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|109|0|285|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|110|0|287|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|111|0|289|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|112|0|291|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|113|0|293|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|114|0|296|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|115|0|298|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|116|0|302|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|117|0|306|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|118|0|309|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|119|0|312|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|120|0|315|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|121|0|318|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|122|0|321|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|123|0|330|0|{@{}@0|0|0|0|out|.3860294117647059|@@@14736|0|}}
{2010202004|XXGiport|124|0|333|0|{@{}@0|0|0|0|in|.3951310861423221|@@@14096|0|}}
{2010110002|XXGconstant|125|0|336|0|{@{}@{1|9422578|}}}
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
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_1|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_2|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_3|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_4|}1|14|}
{2010244001|XXGflow_watcher_watcher|14|0|28|0|{}14|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_5|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_6|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_7|}1|18|}
{2010244001|XXGflow_watcher_watcher|18|0|36|0|{}18|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_8|}1|20|}
{2010601001|XXGgraph_vertex_vertex|20|0|40|0|{Broadcast|}1|21|}
{2010212001|XXGvertex_oport_oport|21|0|42|0|{0|out|}21|22|}
{2010213001|XXGoport_dst_flow|22|0|44|0|{0|}22|13|}
{2010211001|XXGvertex_iport_iport|23|0|45|0|{0|in|}21|23|}
{2010214001|XXGiport_src_flow|24|0|47|0|{0|}23|12|}
{2010007001|XXGobject_proto_object|25|0|48|0|{}21|24|}
{2010212001|XXGvertex_oport_oport|26|0|50|0|{0|out|}24|25|}
{2010006001|XXGobject_psameas_object|27|0|52|0|{metadata|out_metadata|1|0|}25|24|}
{2010211001|XXGvertex_iport_iport|28|0|53|0|{0|in|}24|26|}
{2010006001|XXGobject_psameas_object|29|0|55|0|{metadata|in_metadata|1|0|}26|24|}
{2010006001|XXGobject_psameas_object|30|0|56|0|{in_metadata|out_metadata|0|0|}21|27|}
{2010212001|XXGvertex_oport_oport|31|0|58|0|{0|out|}27|28|}
{2010213001|XXGoport_dst_flow|32|0|60|0|{0|}28|12|}
{2010212001|XXGvertex_oport_oport|33|0|61|0|{1|reject|}27|29|}
{2010212001|XXGvertex_oport_oport|34|0|63|0|{2|error|}27|30|}
{2010212001|XXGvertex_oport_oport|35|0|65|0|{3|log|}27|31|}
{2010211001|XXGvertex_iport_iport|36|0|67|0|{0|in|}27|32|}
{2010214001|XXGiport_src_flow|37|0|69|0|{0|}32|11|}
{2010007001|XXGobject_proto_object|38|0|70|0|{}27|33|}
{2010212001|XXGvertex_oport_oport|39|0|72|0|{0|out|}33|34|}
{2010006001|XXGobject_psameas_object|40|0|74|0|{metadata|out_metadata|1|0|}34|33|}
{2010212001|XXGvertex_oport_oport|41|0|75|0|{1|reject|}33|35|}
{2010006001|XXGobject_psameas_object|42|0|77|0|{metadata|reject_metadata|1|0|}35|33|}
{2010212001|XXGvertex_oport_oport|43|0|78|0|{2|error|}33|36|}
{2010006001|XXGobject_psameas_object|44|0|80|0|{metadata|error_metadata|1|0|}36|33|}
{2010212001|XXGvertex_oport_oport|45|0|81|0|{3|log|}33|37|}
{2010006001|XXGobject_psameas_object|46|0|83|0|{metadata|log_metadata|1|0|}37|33|}
{2010211001|XXGvertex_iport_iport|47|0|84|0|{0|in|}33|38|}
{2010006001|XXGobject_psameas_object|48|0|86|0|{metadata|in_metadata|1|0|}38|33|}
{2010006001|XXGobject_psameas_object|49|0|87|0|{in_metadata|out0_metadata|0|0|}27|39|}
{2010212001|XXGvertex_oport_oport|50|0|89|0|{0|out0|}39|40|}
{2010213001|XXGoport_dst_flow|51|0|91|0|{0|}40|11|}
{2010212001|XXGvertex_oport_oport|52|0|92|0|{1|reject0|}39|41|}
{2010212001|XXGvertex_oport_oport|53|0|94|0|{2|error0|}39|42|}
{2010212001|XXGvertex_oport_oport|54|0|96|0|{3|log|}39|43|}
{2010211001|XXGvertex_iport_iport|55|0|98|0|{0|in|}39|44|}
{2010007001|XXGobject_proto_object|56|0|100|0|{}39|45|}
{2010212001|XXGvertex_oport_oport|57|0|102|0|{0|out0|}45|46|}
{2010006001|XXGobject_psameas_object|58|0|104|0|{metadata|out0_metadata|1|0|}46|45|}
{2010006001|XXGobject_psameas_object|59|0|105|0|{transform0|transform0|1|0|}46|45|}
{2010212001|XXGvertex_oport_oport|60|0|106|0|{1|reject0|}45|47|}
{2010006001|XXGobject_psameas_object|61|0|108|0|{metadata|reject0_metadata|1|0|}47|45|}
{2010212001|XXGvertex_oport_oport|62|0|109|0|{2|error0|}45|48|}
{2010006001|XXGobject_psameas_object|63|0|111|0|{metadata|error0_metadata|1|0|}48|45|}
{2010212001|XXGvertex_oport_oport|64|0|112|0|{3|log|}45|49|}
{2010006001|XXGobject_psameas_object|65|0|114|0|{metadata|log_metadata|1|0|}49|45|}
{2010211001|XXGvertex_iport_iport|66|0|115|0|{0|in|}45|50|}
{2010006001|XXGobject_psameas_object|67|0|117|0|{metadata|in_metadata|1|0|}50|45|}
{2010006001|XXGobject_psameas_object|68|0|118|0|{reject_metadata|out0_metadata|0|0|}27|39|}
{2010006001|XXGobject_psameas_object|69|0|119|0|{out_metadata|out_metadata|0|0|}21|27|}
{2010601001|XXGgraph_vertex_vertex|70|0|120|0|{Final_Filter_and_Masking|}1|51|}
{2010212001|XXGvertex_oport_oport|71|0|122|0|{0|out0|}51|52|}
{2010212001|XXGvertex_oport_oport|72|0|124|0|{1|reject0|}51|53|}
{2010212001|XXGvertex_oport_oport|73|0|126|0|{2|error0|}51|54|}
{2010212001|XXGvertex_oport_oport|74|0|128|0|{3|log|}51|55|}
{2010211001|XXGvertex_iport_iport|75|0|130|0|{0|in|}51|56|}
{2010214001|XXGiport_src_flow|76|0|132|0|{0|}56|17|}
{2010214001|XXGiport_src_flow|77|0|133|0|{1|}56|20|}
{2010007001|XXGobject_proto_object|78|0|134|0|{}51|57|}
{2010212001|XXGvertex_oport_oport|79|0|136|0|{0|out0|}57|58|}
{2010006001|XXGobject_psameas_object|80|0|138|0|{metadata|out0_metadata|1|0|}58|57|}
{2010006001|XXGobject_psameas_object|81|0|139|0|{transform0|transform0|1|0|}58|57|}
{2010212001|XXGvertex_oport_oport|82|0|140|0|{1|reject0|}57|59|}
{2010006001|XXGobject_psameas_object|83|0|142|0|{metadata|reject0_metadata|1|0|}59|57|}
{2010212001|XXGvertex_oport_oport|84|0|143|0|{2|error0|}57|60|}
{2010006001|XXGobject_psameas_object|85|0|145|0|{metadata|error0_metadata|1|0|}60|57|}
{2010212001|XXGvertex_oport_oport|86|0|146|0|{3|log|}57|61|}
{2010006001|XXGobject_psameas_object|87|0|148|0|{metadata|log_metadata|1|0|}61|57|}
{2010211001|XXGvertex_iport_iport|88|0|149|0|{0|in|}57|62|}
{2010006001|XXGobject_psameas_object|89|0|151|0|{metadata|in_metadata|1|0|}62|57|}
{2010006001|XXGobject_psameas_object|90|0|152|0|{Layout|Layout|0|0|}51|63|}
{2010212001|XXGvertex_oport_oport|91|0|154|0|{0|out|}63|64|}
{2010213001|XXGoport_dst_flow|92|0|156|0|{0|}64|20|}
{2010212001|XXGvertex_oport_oport|93|0|157|0|{1|reject|}63|65|}
{2010212001|XXGvertex_oport_oport|94|0|159|0|{2|error|}63|66|}
{2010212001|XXGvertex_oport_oport|95|0|161|0|{3|log|}63|67|}
{2010211001|XXGvertex_iport_iport|96|0|163|0|{0|in|}63|68|}
{2010214001|XXGiport_src_flow|97|0|165|0|{0|}68|14|}
{2010007001|XXGobject_proto_object|98|0|166|0|{}63|69|}
{2010212001|XXGvertex_oport_oport|99|0|168|0|{0|out|}69|70|}
{2010006001|XXGobject_psameas_object|100|0|170|0|{metadata|out_metadata|1|0|}70|69|}
{2010212001|XXGvertex_oport_oport|101|0|171|0|{1|reject|}69|71|}
{2010006001|XXGobject_psameas_object|102|0|173|0|{metadata|reject_metadata|1|0|}71|69|}
{2010212001|XXGvertex_oport_oport|103|0|174|0|{2|error|}69|72|}
{2010006001|XXGobject_psameas_object|104|0|176|0|{metadata|error_metadata|1|0|}72|69|}
{2010212001|XXGvertex_oport_oport|105|0|177|0|{3|log|}69|73|}
{2010006001|XXGobject_psameas_object|106|0|179|0|{metadata|log_metadata|1|0|}73|69|}
{2010211001|XXGvertex_iport_iport|107|0|180|0|{0|in|}69|74|}
{2010006001|XXGobject_psameas_object|108|0|182|0|{metadata|in_metadata|1|0|}74|69|}
{2010006001|XXGobject_psameas_object|109|0|183|0|{in_metadata|out_metadata|0|0|}63|75|}
{2010212001|XXGvertex_oport_oport|110|0|185|0|{0|out|}75|76|}
{2010213001|XXGoport_dst_flow|111|0|187|0|{0|}76|14|}
{2010212001|XXGvertex_oport_oport|112|0|188|0|{1|reject|}75|77|}
{2010212001|XXGvertex_oport_oport|113|0|190|0|{2|error|}75|78|}
{2010212001|XXGvertex_oport_oport|114|0|192|0|{3|log|}75|79|}
{2010211001|XXGvertex_iport_iport|115|0|194|0|{0|in|}75|80|}
{2010214001|XXGiport_src_flow|116|0|196|0|{0|}80|18|}
{2010007001|XXGobject_proto_object|117|0|197|0|{}75|81|}
{2010212001|XXGvertex_oport_oport|118|0|199|0|{0|out|}81|82|}
{2010006001|XXGobject_psameas_object|119|0|201|0|{metadata|out_metadata|1|0|}82|81|}
{2010212001|XXGvertex_oport_oport|120|0|202|0|{1|reject|}81|83|}
{2010006001|XXGobject_psameas_object|121|0|204|0|{metadata|reject_metadata|1|0|}83|81|}
{2010212001|XXGvertex_oport_oport|122|0|205|0|{2|error|}81|84|}
{2010006001|XXGobject_psameas_object|123|0|207|0|{metadata|error_metadata|1|0|}84|81|}
{2010212001|XXGvertex_oport_oport|124|0|208|0|{3|log|}81|85|}
{2010006001|XXGobject_psameas_object|125|0|210|0|{metadata|log_metadata|1|0|}85|81|}
{2010211001|XXGvertex_iport_iport|126|0|211|0|{0|in|}81|86|}
{2010006001|XXGobject_psameas_object|127|0|213|0|{metadata|in_metadata|1|0|}86|81|}
{2010006001|XXGobject_psameas_object|128|0|214|0|{Layout|Layout|0|0|}75|63|}
{2010006001|XXGobject_psameas_object|129|0|215|0|{reject_metadata|in_metadata|0|0|}75|75|}
{2010006001|XXGobject_psameas_object|130|0|216|0|{reject_metadata|out_metadata|0|0|}63|75|}
{2010006001|XXGobject_psameas_object|131|0|217|0|{in_metadata|out_metadata|0|0|}51|63|}
{2010006001|XXGobject_psameas_object|132|0|218|0|{out0_metadata|OUTPUT_DML|1|0|}51|1|}
{2010006001|XXGobject_psameas_object|133|0|219|0|{reject0_metadata|out_metadata|0|0|}51|63|}
{2010006001|XXGobject_psameas_object|134|0|220|0|{select|FINAL_FILTER_EXPRESSION|1|0|}51|1|}
{2010006001|XXGobject_psameas_object|135|0|221|0|{transform0|security_mapping|1|0|}51|1|}
{2010601001|XXGgraph_vertex_vertex|136|0|222|0|{Generate_Days_in_Range|}1|27|}
{2010601001|XXGgraph_vertex_vertex|137|0|223|0|{ICFF_TEMPLATE|}1|87|}
{2010007001|XXGobject_proto_object|138|0|225|0|{}87|88|}
{2010601001|XXGgraph_vertex_vertex|139|0|227|0|{Normalize_Index_SCAN_by_lookup|}1|63|}
{2010601001|XXGgraph_vertex_vertex|140|0|228|0|{Normalize_Split_index_col|}1|75|}
{2010601001|XXGgraph_vertex_vertex|141|0|229|0|{Read_Multiple_Files|}1|89|}
{2010212001|XXGvertex_oport_oport|142|0|231|0|{0|out|}89|90|}
{2010213001|XXGoport_dst_flow|143|0|233|0|{0|}90|17|}
{2010212001|XXGvertex_oport_oport|144|0|234|0|{1|filereject|}89|91|}
{2010212001|XXGvertex_oport_oport|145|0|236|0|{2|fileerror|}89|92|}
{2010212001|XXGvertex_oport_oport|146|0|238|0|{3|reject|}89|93|}
{2010212001|XXGvertex_oport_oport|147|0|240|0|{4|error|}89|94|}
{2010212001|XXGvertex_oport_oport|148|0|242|0|{5|log|}89|95|}
{2010211001|XXGvertex_iport_iport|149|0|244|0|{0|in|}89|96|}
{2010214001|XXGiport_src_flow|150|0|246|0|{0|}96|16|}
{2010007001|XXGobject_proto_object|151|0|247|0|{}89|97|}
{2010212001|XXGvertex_oport_oport|152|0|249|0|{0|out|}97|98|}
{2010006001|XXGobject_psameas_object|153|0|251|0|{metadata|out_metadata|1|0|}98|97|}
{2010212001|XXGvertex_oport_oport|154|0|252|0|{1|filereject|}97|99|}
{2010006001|XXGobject_psameas_object|155|0|254|0|{metadata|filereject_metadata|1|0|}99|97|}
{2010212001|XXGvertex_oport_oport|156|0|255|0|{2|fileerror|}97|100|}
{2010006001|XXGobject_psameas_object|157|0|257|0|{metadata|fileerror_metadata|1|0|}100|97|}
{2010212001|XXGvertex_oport_oport|158|0|258|0|{3|reject|}97|101|}
{2010006001|XXGobject_psameas_object|159|0|260|0|{metadata|reject_metadata|1|0|}101|97|}
{2010212001|XXGvertex_oport_oport|160|0|261|0|{4|error|}97|102|}
{2010006001|XXGobject_psameas_object|161|0|263|0|{metadata|error_metadata|1|0|}102|97|}
{2010212001|XXGvertex_oport_oport|162|0|264|0|{5|log|}97|103|}
{2010006001|XXGobject_psameas_object|163|0|266|0|{metadata|log_metadata|1|0|}103|97|}
{2010211001|XXGvertex_iport_iport|164|0|267|0|{0|in|}97|104|}
{2010006001|XXGobject_psameas_object|165|0|269|0|{metadata|in_metadata|1|0|}104|97|}
{2010006001|XXGobject_psameas_object|166|0|270|0|{filereject_metadata|out_metadata|0|0|}89|27|}
{2010006001|XXGobject_psameas_object|167|0|271|0|{in_metadata|out_metadata|0|0|}89|27|}
{2010006001|XXGobject_psameas_object|168|0|272|0|{out_metadata|DATA_SOURCE_AND_PLUMBING_FIELDS_DML|1|0|}89|1|}
{2010601001|XXGgraph_vertex_vertex|169|0|273|0|{Reformat_Query|}1|39|}
{2010601001|XXGgraph_vertex_vertex|170|0|274|0|{Router_Index_or_seq|}1|105|}
{2010212001|XXGvertex_oport_oport|171|0|276|0|{0|out0|}105|106|}
{2010213001|XXGoport_dst_flow|172|0|278|0|{0|}106|16|}
{2010212001|XXGvertex_oport_oport|173|0|279|0|{1|out1|}105|107|}
{2010213001|XXGoport_dst_flow|174|0|281|0|{0|}107|18|}
{2010212001|XXGvertex_oport_oport|175|0|282|0|{2|reject0|}105|108|}
{2010212001|XXGvertex_oport_oport|176|0|284|0|{3|reject1|}105|109|}
{2010212001|XXGvertex_oport_oport|177|0|286|0|{4|error0|}105|110|}
{2010212001|XXGvertex_oport_oport|178|0|288|0|{5|error1|}105|111|}
{2010212001|XXGvertex_oport_oport|179|0|290|0|{6|log|}105|112|}
{2010211001|XXGvertex_iport_iport|180|0|292|0|{0|in|}105|113|}
{2010214001|XXGiport_src_flow|181|0|294|0|{0|}113|13|}
{2010007001|XXGobject_proto_object|182|0|295|0|{}105|114|}
{2010212001|XXGvertex_oport_oport|183|0|297|0|{0|out0|}114|115|}
{2010006001|XXGobject_psameas_object|184|0|299|0|{metadata|out0_metadata|1|0|}115|114|}
{2010006001|XXGobject_psameas_object|185|0|300|0|{transform0|transform0|1|0|}115|114|}
{2010212001|XXGvertex_oport_oport|186|0|301|0|{1|out1|}114|116|}
{2010006001|XXGobject_psameas_object|187|0|303|0|{metadata|out1_metadata|1|0|}116|114|}
{2010006001|XXGobject_psameas_object|188|0|304|0|{transform1|transform1|1|0|}116|114|}
{2010212001|XXGvertex_oport_oport|189|0|305|0|{2|reject0|}114|117|}
{2010006001|XXGobject_psameas_object|190|0|307|0|{metadata|reject0_metadata|1|0|}117|114|}
{2010212001|XXGvertex_oport_oport|191|0|308|0|{3|reject1|}114|118|}
{2010006001|XXGobject_psameas_object|192|0|310|0|{metadata|reject1_metadata|1|0|}118|114|}
{2010212001|XXGvertex_oport_oport|193|0|311|0|{4|error0|}114|119|}
{2010006001|XXGobject_psameas_object|194|0|313|0|{metadata|error0_metadata|1|0|}119|114|}
{2010212001|XXGvertex_oport_oport|195|0|314|0|{5|error1|}114|120|}
{2010006001|XXGobject_psameas_object|196|0|316|0|{metadata|error1_metadata|1|0|}120|114|}
{2010212001|XXGvertex_oport_oport|197|0|317|0|{6|log|}114|121|}
{2010006001|XXGobject_psameas_object|198|0|319|0|{metadata|log_metadata|1|0|}121|114|}
{2010211001|XXGvertex_iport_iport|199|0|320|0|{0|in|}114|122|}
{2010006001|XXGobject_psameas_object|200|0|322|0|{metadata|in_metadata|1|0|}122|114|}
{2010006001|XXGobject_psameas_object|201|0|323|0|{Layout|Layout|0|0|}105|89|}
{2010006001|XXGobject_psameas_object|202|0|324|0|{in_metadata|out_metadata|0|0|}105|27|}
{2010006001|XXGobject_psameas_object|203|0|325|0|{out0_metadata|out_metadata|0|0|}105|27|}
{2010006001|XXGobject_psameas_object|204|0|326|0|{out1_metadata|in_metadata|0|0|}105|75|}
{2010006001|XXGobject_psameas_object|205|0|327|0|{reject0_metadata|out_metadata|0|0|}105|27|}
{2010006001|XXGobject_psameas_object|206|0|328|0|{reject1_metadata|out_metadata|0|0|}105|27|}
{2010212001|XXGvertex_oport_oport|207|0|329|0|{0|out|}1|123|}
{2010216002|XXGoport_binding_oport|208|0|331|0|{.5|.5|{12|1358000|239000|1378000|239000|1443000|239000|1443000|229000|1509000|229000|1529000|229000|}2263|}123|52|}
{2010211001|XXGvertex_iport_iport|209|0|332|0|{0|in|}1|124|}
{2010215002|XXGiport_binding_iport|210|0|334|0|{.5|.5|{12|84000|229000|64000|229000|52000|229000|52000|234000|40000|234000|20000|234000|}2262|}124|44|}
{2010109001|XXGobject_property_value|211|0|335|0|{0|TrackingThumbprint|72|}1|125|}
