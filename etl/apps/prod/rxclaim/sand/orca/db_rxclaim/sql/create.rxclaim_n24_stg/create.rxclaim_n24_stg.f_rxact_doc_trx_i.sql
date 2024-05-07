DROP TABLE ${STAGING_SCHEMA}.f_rxact_doc_trx_i;

CREATE TABLE ${STAGING_SCHEMA}.f_rxact_doc_trx_i
( ratxn_trx_nbr                    BIGINT
, ratsv_seq_nbr                    INTEGER
, radmt_recipient                  CHAR(1)
, radmt_seq_nbr                    INTEGER
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, radmt_communication_order        CHAR(1)
, radmt_intervention_src           CHAR(1)
, radmt_reason                     VARCHAR(2)
, radmt_creat_dt                   DATE
, radmt_communication_typ          CHAR(1)
, radmt_communication_id           VARCHAR(25)
, radmt_comm_id_oth                VARCHAR(25)
, radmt_cc3_mbr                    VARCHAR(25)
, radmt_cc2_prov                   VARCHAR(25)
, radmt_cc1_pbr                    VARCHAR(25)
, radmt_doc_ref_id                 VARCHAR(15)
, radmt_stat                       CHAR(1)
, radmt_vld                        CHAR(1)
, radmt_recipient_first_nm         VARCHAR(15)
, radmt_recipient_middle_init      CHAR(1)
, radmt_recipient_last_nm          VARCHAR(25)
, radmt_recipient_email            VARCHAR(80)
, radmt_recipient_fax              DECIMAL(10)
, radmt_recipient_addr_1           VARCHAR(55)
, radmt_recipient_addr_2           VARCHAR(55)
, radmt_recipient_city             VARCHAR(30)
, radmt_recipient_st               VARCHAR(3)
, radmt_recipient_zip              VARCHAR(11)
, radmt_recipient_country          VARCHAR(4)
, cag_sk                           BIGINT
, radmt_req_dt                     DATE
, radmt_req_tm                     TIMESTAMP
, radmt_req_sts                    CHAR(1)
, radmt_comp_sts                   CHAR(1)
, radmt_ovrd_temp_sched            VARCHAR(10)
, radmt_doc_rel_dt                 DATE
, radmt_rel_dt                     DATE
, radmt_validation_stat            CHAR(1)
, radmt_doc_print_dt               DATE
, radmt_doc_print_tm               TIMESTAMP
, add_dt                           DATE
, chg_dt                           DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

