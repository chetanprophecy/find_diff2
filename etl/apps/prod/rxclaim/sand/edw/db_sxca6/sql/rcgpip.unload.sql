SELECT RCGPIP.SUEFC4 AS "gpi_id_number",
       RCGPIP.SUB4T3 AS "gpi_name",
       RCGPIP.SUBMDT AS "chg_date"
FROM   ${SCHEMA_NAME}.RCGPIP RCGPIP
