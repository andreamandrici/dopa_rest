#!/bin/bash
####################################################################################################################################################

# TIMER START
START_T1=$(date +%s)

####################################################################################################################################################

# PARAMETERS
source workflow_parameters.conf

# prepare function list_key_values
sql_p_f_list_key_value=$(cat<<EOF
DROP FUNCTION IF EXISTS ${SCH}.get_list_key_value(text,text,text,bool);
CREATE FUNCTION ${SCH}.get_list_key_value(sch text,tbl text,col text,typ boolean DEFAULT TRUE)
RETURNS text LANGUAGE 'plpgsql' AS
\$BODY\$
DECLARE
tout text;
sql text;
BEGIN
sql :='SELECT ';
IF typ IS TRUE THEN sql := sql||'STRING_AGG(CONCAT(''"''||column_name||''" ''||data_type),'', '')';
ELSE sql := sql||'STRING_AGG(CONCAT(''"''||column_name||''"''),'', '')';END IF;
sql := sql||' FROM
(
SELECT ordinal_position,column_name,data_type
FROM information_schema.columns
WHERE table_schema = \$1 AND table_name = \$2 AND column_name != \$3
) a;';
EXECUTE sql USING sch,tbl,col,typ INTO tout;
RETURN tout;
END
\$BODY\$;
COMMENT ON FUNCTION ${SCH}.get_list_key_value(text,text,text,bool) is 'input parameters are: schema, table, field to EXCLUDE, include data type';
EOF
)

# execute function list_key_values
psql ${dbpar2} -c "$sql_p_f_list_key_value"

# prepare table tjson
sql_p_t_json=$(cat<<EOF
DROP TABLE IF EXISTS ${SCH}.tjson;
CREATE TABLE ${SCH}.tjson AS
SELECT country_id,ARRAY_TO_JSON(ARRAY_AGG(row_to_json(a))) ecoregion_in_country 
FROM ${SCH}.ecoregion_in_country a
GROUP BY country_id ORDER BY country_id;
EOF
)

# execute table tjson
psql ${dbpar2} -c "$sql_p_t_json"

# aggregate json
list=`psql ${dbpar2} -t -c "SELECT ${SCH}.get_list_key_value('${SCH}','ecoregion_in_country','country_id');"`

# prepare function get_json
sql_p_f_get_json=$(cat<<EOF
DROP TABLE IF EXISTS ${SCH}.ujson_template CASCADE;
CREATE TABLE ${SCH}.ujson_template AS
SELECT a.country_id,t.*
FROM
	(SELECT country_id,json_array_elements(ecoregion_in_country) ecoregion_in_country FROM ${SCH}.tjson) a,
	json_to_record(a.ecoregion_in_country)
	AS t(${list})
ORDER BY country_id LIMIT 0;
DROP FUNCTION IF EXISTS ${SCH}.get_json(text,text,text);
CREATE FUNCTION ${SCH}.get_json(sch text,tbl text,col text)
RETURNS SETOF ${SCH}.ujson_template LANGUAGE 'sql' AS
\$BODY\$;
SELECT a.country_id,t.*
FROM
	(SELECT country_id,json_array_elements(ecoregion_in_country) ecoregion_in_country FROM ${SCH}.tjson) a,
	json_to_record(a.ecoregion_in_country)
	AS t(${list})
ORDER BY country_id;
\$BODY\$;
EOF
)

# execute function get_json
psql ${dbpar2} -c "$sql_p_f_get_json"

echo "analysis done"
# stop timer
END_T1=$(date +%s)
TOTAL_DIFF=$(($END_T1 - $START_T1))
echo "TOTAL SCRIPT TIME: $TOTAL_DIFF"
