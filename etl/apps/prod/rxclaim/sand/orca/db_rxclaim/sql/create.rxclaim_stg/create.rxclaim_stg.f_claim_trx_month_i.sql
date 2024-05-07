DROP TABLE ${STAGING_SCHEMA}.f_claim_trx_month_i;

CREATE TABLE ${STAGING_SCHEMA}.f_claim_trx_month_i
( claim_nbr                        BIGINT
, claim_seq_nbr                    INTEGER
, claim_stat_id                    CHAR(1)
, cag_sk                           BIGINT
, mbr_sk                           BIGINT
, injectable_ind_sk                BIGINT
, clt_formulary_sk                 BIGINT
, risk_pool_sk                     BIGINT
, prior_auth_sk                    BIGINT
, rxsol_formulary_sk               BIGINT
, dmr_ind_sk                       BIGINT
, custom_client_ind_sk             BIGINT
, claim_origination_code_sk        BIGINT
, injectable_ind                   CHAR(1)
, clt_formulary_flg                CHAR(1)
, risk_pool_id                     CHAR(1)
, prior_auth_id                    CHAR(1)
, rxsol_formulary_id               CHAR(1)
, claim_origin_cd                  CHAR(1)
, ntpn_ind                         CHAR(1)
, reported_gap_discount_amt        DECIMAL(9,2)
, dmr_ind                          CHAR(1)
, custom_client_ind                CHAR(1)
, sbm_dt                           DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, tier_level                       INTEGER
, client_cost_tier_amt             VARCHAR(2)
);

