DROP TABLE ${STAGING_SCHEMA}.d_member_adjustment_i;

CREATE TABLE ${STAGING_SCHEMA}.d_member_adjustment_i
( mad_sk                           BIGINT
, mbr_sk                           BIGINT
, cag_sk                           BIGINT
, carrier_sk                       BIGINT
, mbr_id                           VARCHAR(20) NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
, account_id                       VARCHAR(40) NOT NULL
, employer_group_id                VARCHAR(30) NOT NULL
, mad_adjtmnt_dt                   DATE NOT NULL
, mad_seq_nbr                      SMALLINT NOT NULL
, mad_stat_cd                      CHAR(1) NOT NULL
, acm_accumultn_cd                 VARCHAR(10) NOT NULL
, adj_adjtmnt_cd                   VARCHAR(10) NOT NULL
, mad_adjtmnt_amt                  DECIMAL(9,2) NOT NULL
, mad_ben_ded_typ_cd               CHAR(1) NOT NULL
, mad_clt_bnft_cd                  VARCHAR(10) NOT NULL
, mad_rec_ts                       TIMESTAMP NOT NULL
, mad_rec_order                    BIGINT NOT NULL
, mad_rec_id                       VARCHAR(50) NOT NULL
, mad_amt_typ_cd                   CHAR(1) NOT NULL
, mad_sender_typ_cd                CHAR(1) NOT NULL
, mad_sender_id                    VARCHAR(10) NOT NULL
, mad_sender_desc                  VARCHAR(50) NOT NULL
, mad_sender_claim_nbr             VARCHAR(50) NOT NULL
, mad_sender_claim_seq_nbr         VARCHAR(5) NOT NULL
, mad_sender_claim_stat_cd         CHAR(1) NOT NULL
, mad_sender_ts                    TIMESTAMP NOT NULL
, mad_adj_time                     TIME NOT NULL
, mad_adj_ms                       SMALLINT NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT NOT NULL
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (MBR_SK);

