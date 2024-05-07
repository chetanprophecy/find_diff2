SELECT RCPIDP.S4EFC4 AS "gpi_id_number",
       RCPIDP.S4E6C4 AS "product_id",
       RCPIDP.S4NQS3 AS "product_type_code",
       RCPIDP.S4XVS3 AS "product_status",
       RCPIDP.S4COT3 AS "name_ext",
       RCPIDP.S4CNT3 AS "description_abbrev"
FROM   ${SCHEMA_NAME}.RCPIDP RCPIDP
WHERE  TRIM(RCPIDP.S4XVS3) = 'A' AND TRIM(RCPIDP.S4NQS3) = '03'
