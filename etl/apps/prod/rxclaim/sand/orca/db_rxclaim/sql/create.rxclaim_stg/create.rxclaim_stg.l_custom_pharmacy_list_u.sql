DROP TABLE ${STAGING_SCHEMA}.l_custom_pharmacy_list_u;

CREATE TABLE ${STAGING_SCHEMA}.l_custom_pharmacy_list_u
( custom_phr_list_sk               BIGINT NOT NULL
, phr_id                           VARCHAR(50)
, phr_typ_id                       VARCHAR(10)
, phr_typ_nm                       VARCHAR(50)
, mail_ord_phr_ind                 CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

