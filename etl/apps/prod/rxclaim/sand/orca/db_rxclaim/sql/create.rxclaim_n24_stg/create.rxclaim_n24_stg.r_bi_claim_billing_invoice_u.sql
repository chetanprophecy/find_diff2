DROP TABLE ${STAGING_SCHEMA}.r_bi_claim_billing_invoice_u;

CREATE TABLE ${STAGING_SCHEMA}.r_bi_claim_billing_invoice_u
( claim_nbr                        DECIMAL(19) NOT NULL
, claim_seq_nbr                    INTEGER NOT NULL
, claim_stat                       CHAR(1) NOT NULL
, bi_invoice_sk                    BIGINT NOT NULL
, inv_nbr                          BIGINT NOT NULL
, cag_sk                           BIGINT NOT NULL
, carrier_sk                       BIGINT
, carrier_acct_sk                  BIGINT
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (INV_NBR);

