SELECT RCPRDP.SZEFC4 AS "gpi_id_number",
       RCPRDP.SZNZDT AS "effective_date",
       RCPRDP.SZN0DT AS "termination_date",
       RCPRDP.SZOZS3 AS "multisource",
       RCPRDP.SZPBS3 AS "maintenance_drug"
FROM   ${SCHEMA_NAME}.RCPRDP RCPRDP
WHERE  TRIM(RCPRDP.SZOWS3) = 'A'
