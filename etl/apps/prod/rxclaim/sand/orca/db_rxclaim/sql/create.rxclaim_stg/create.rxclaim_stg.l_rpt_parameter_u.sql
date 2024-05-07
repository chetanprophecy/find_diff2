DROP TABLE ${STAGING_SCHEMA}.l_rpt_parameter_u;

CREATE TABLE ${STAGING_SCHEMA}.l_rpt_parameter_u
( rpt_parm_sk                      BIGINT
, parm_nm                          VARCHAR(50)
, parm_datatyp                     VARCHAR(20)
, parm_format                      VARCHAR(20)
, parm_value                       DECIMAL(15,2)
, parm_grp                         VARCHAR(30)
, parm_desc                        VARCHAR(500)
, rng_lo_lmt                       DECIMAL(15,2)
, rng_upper_lmt                    DECIMAL(15,2)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

