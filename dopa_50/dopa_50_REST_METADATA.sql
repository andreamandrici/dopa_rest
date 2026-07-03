--CREATE SCHEMA dopa_50;
--GRANT USAGE ON SCHEMA dopa_50 TO h05ibexro;

--------------------------------------------------------------------------------
-- DROP (TOP DOWN)
--------------------------------------------------------------------------------
-- FUNCTIONS
DROP FUNCTION IF EXISTS dopa_50.get_dopa_function_output_parameters(text,text,text,text,text) CASCADE;
DROP FUNCTION IF EXISTS dopa_50.get_dopa_function_input_parameters(text,text) CASCADE;
DROP FUNCTION IF EXISTS dopa_50.get_dopa_function_source_list() CASCADE;
DROP FUNCTION IF EXISTS dopa_50.get_dopa_function_reporting_level_list() CASCADE;
DROP FUNCTION IF EXISTS dopa_50.get_dopa_function_theme_list() CASCADE;
DROP FUNCTION IF EXISTS dopa_50.get_dopa_function_list(text,text,text) CASCADE;
-- VIEWS
DROP VIEW IF EXISTS dopa_50.v_dopa_function_output_parameters CASCADE;
DROP VIEW IF EXISTS dopa_50.v_dopa_function_input_parameters CASCADE;
DROP VIEW IF EXISTS dopa_50.v_dopa_sources CASCADE;
DROP VIEW IF EXISTS dopa_50.v_dopa_function CASCADE;
-------------------------------------------------------------------------------
-- CREATE
--------------------------------------------------------------------------------
-- VIEWS (BOTTOM UP)
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW dopa_50.v_dopa_function_input_parameters
AS
SELECT a.schema_name,
a.function_name,
a.parameter_name,
a.parameter_description,
a.parameter_type,
a.parameter_def_value,
a.parameter_compulsory,
a.ordinal_position
FROM dopa_50.dopa_function_parameter_list a
WHERE a.parameter_mode_io = 'IN'::text AND a.published IS TRUE
ORDER BY a.schema_name, a.function_name, a.ordinal_position;
GRANT ALL ON TABLE dopa_50.v_dopa_function_input_parameters TO h05ibex;
GRANT SELECT ON TABLE dopa_50.v_dopa_function_input_parameters TO h05ibexro;
----------------------------------------------------------------------------
CREATE OR REPLACE VIEW dopa_50.v_dopa_function_output_parameters
AS
SELECT a.schema_name,
a.function_name,
a.parameter_name,
a.parameter_description,
a.parameter_theme,
a.parameter_reporting_level,
a.parameter_source,
a.parameter_type,
a.ordinal_position
FROM dopa_50.dopa_function_parameter_list a
WHERE a.parameter_mode_io = 'OUT'::text AND a.published IS TRUE
ORDER BY a.schema_name, a.function_name, a.ordinal_position;
GRANT ALL ON TABLE dopa_50.v_dopa_function_output_parameters TO h05ibex;
GRANT SELECT ON TABLE dopa_50.v_dopa_function_output_parameters TO h05ibexro;
----------------------------------------------------------------------------
CREATE OR REPLACE VIEW dopa_50.v_dopa_function
AS
WITH f_theme AS (
SELECT DISTINCT a.schema_name,
a.function_name,
array_agg(DISTINCT a.theme ORDER BY a.theme) AS function_theme
FROM ( SELECT DISTINCT a1.schema_name,
a1.function_name,
unnest(string_to_array(lower(a1.parameter_theme), ','::text)) AS theme
FROM dopa_50.dopa_function_parameter_list a1
WHERE a1.parameter_mode_io = 'OUT'::text AND a1.parameter_theme IS NOT NULL) a
GROUP BY a.schema_name, a.function_name
ORDER BY a.schema_name, a.function_name
), f_rlevel AS (
SELECT DISTINCT a.schema_name,
a.function_name,
array_agg(DISTINCT a.rlevel ORDER BY a.rlevel) AS function_reporting_level
FROM ( SELECT DISTINCT a1.schema_name,
a1.function_name,
unnest(string_to_array(a1.parameter_reporting_level, ','::text)) AS rlevel
FROM dopa_50.dopa_function_parameter_list a1
WHERE a1.parameter_mode_io = 'OUT'::text AND a1.parameter_reporting_level IS NOT NULL) a
GROUP BY a.schema_name, a.function_name
ORDER BY a.schema_name, a.function_name
), f_source AS (
SELECT DISTINCT a.schema_name,
a.function_name,
array_agg(DISTINCT a.psource ORDER BY a.psource) AS function_source
FROM ( SELECT DISTINCT a1.schema_name,
a1.function_name,
unnest(string_to_array(a1.parameter_source, ','::text)) AS psource
FROM dopa_50.dopa_function_parameter_list a1
WHERE a1.parameter_mode_io = 'OUT'::text AND a1.parameter_source IS NOT NULL) a
GROUP BY a.schema_name, a.function_name
ORDER BY a.schema_name, a.function_name
)
SELECT DISTINCT b.schema_name,
b.function_name,
b.function_description,
f_theme.function_theme,
f_rlevel.function_reporting_level,
f_source.function_source,
(('https://dopa.jrc.ec.europa.eu/restapi/api/'::text || b.schema_name) || '/'::text) || replace(b.function_name, '()'::text, ''::text) AS function_link
FROM dopa_50.dopa_function_parameter_list b
LEFT JOIN f_theme USING (schema_name, function_name)
LEFT JOIN f_rlevel USING (schema_name, function_name)
LEFT JOIN f_source USING (schema_name, function_name)
WHERE b.published IS TRUE
ORDER BY b.schema_name, b.function_name;
GRANT ALL ON TABLE dopa_50.v_dopa_function TO h05ibex;
GRANT SELECT ON TABLE dopa_50.v_dopa_function TO h05ibexro;
----------------------------------------------------------------------------
CREATE OR REPLACE VIEW dopa_50.v_dopa_sources
AS
SELECT class_function_parameter_source.source_name,
class_function_parameter_source.source_version,
class_function_parameter_source.source_description,
class_function_parameter_source.source_reference,
class_function_parameter_source.source_link,
class_function_parameter_source.source_disclaimer
FROM dopa_50.class_function_parameter_source
WHERE (class_function_parameter_source.source_name IN ( SELECT DISTINCT unnest(v_dopa_function.function_source) AS unnest
	   FROM dopa_50.v_dopa_function))
ORDER BY class_function_parameter_source.source_name;
GRANT ALL ON TABLE dopa_50.v_dopa_sources TO h05ibex;
GRANT SELECT ON TABLE dopa_50.v_dopa_sources TO h05ibexro;
--------------------------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_function_list(
	theme text DEFAULT NULL::text,
	rlevel text DEFAULT NULL::text,
	dsource text DEFAULT NULL::text)
    RETURNS SETOF dopa_50.v_dopa_function 
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
m_theme text := (SELECT ARRAY_TO_STRING(ARRAY_AGG(''''||a||''''),',') FROM (SELECT a FROM regexp_split_to_table(theme, ',') AS a) tb);
m_level text := (SELECT ARRAY_TO_STRING(ARRAY_AGG(''''||a||''''),',') FROM (SELECT a FROM regexp_split_to_table(rlevel, ',') AS a) tb);
m_source text := (SELECT ARRAY_TO_STRING(ARRAY_AGG(''''||a||''''),',') FROM (SELECT a FROM regexp_split_to_table(dsource, ',') AS a) tb);
sql TEXT;
BEGIN
sql :='
SELECT * FROM dopa_50.v_dopa_function
WHERE function_description IS NOT NULL AND function_theme IS NOT NULL';
IF theme IS NOT NULL THEN sql := sql || ' AND ARRAY['||m_theme||'] && function_theme '; END IF;
IF rlevel IS NOT NULL THEN sql := sql || ' AND ARRAY['||m_level||'] && function_reporting_level '; END IF;
IF dsource IS NOT NULL THEN sql := sql || ' AND ARRAY['||m_source||'] && function_source '; END IF;
sql := sql || ' ORDER BY schema_name,function_name;';
RETURN QUERY EXECUTE sql;
END;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_function_list(text, text, text) TO h05ibex;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_function_list(text, text, text) TO h05ibexro;
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_function_theme_list(
	)
    RETURNS TABLE(function_theme text) 
    LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
RETURN QUERY EXECUTE 'SELECT DISTINCT UNNEST(function_theme) function_theme FROM dopa_50.v_dopa_function ORDER BY function_theme;';
END;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_function_theme_list() TO h05ibex;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_function_theme_list() TO h05ibexro;
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_function_reporting_level_list(
	)
    RETURNS TABLE(function_reporting_level text) 
    LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
RETURN QUERY EXECUTE 'SELECT DISTINCT UNNEST(function_reporting_level) function_reporting_level FROM dopa_50.v_dopa_function ORDER BY function_reporting_level;';
END;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_function_reporting_level_list() TO h05ibex;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_function_reporting_level_list() TO h05ibexro;
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_function_source_list(
	)
    RETURNS SETOF dopa_50.v_dopa_sources 
    LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
RETURN QUERY EXECUTE 'SELECT * FROM dopa_50.v_dopa_sources';
END;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_function_source_list() TO h05ibex;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_function_source_list() TO h05ibexro;
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_function_input_parameters(
	fname text DEFAULT NULL::text,
	pname text DEFAULT NULL::text)
    RETURNS SETOF dopa_50.v_dopa_function_input_parameters 
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
sql TEXT;
BEGIN
sql :='
SELECT * FROM dopa_50.v_dopa_function_input_parameters
WHERE parameter_description IS NOT NULL';
IF fname IS NOT NULL THEN sql := sql || ' AND function_name ILIKE ''%'||fname||'%'' '; END IF;
IF pname IS NOT NULL THEN sql := sql || ' AND parameter_name ILIKE ''%'||pname||'%'' '; END IF;
sql := sql || ' ORDER BY schema_name,function_name,ordinal_position;';
RETURN QUERY EXECUTE sql;
END;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_function_input_parameters(text, text) TO h05ibex;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_function_input_parameters(text, text) TO h05ibexro;
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_function_output_parameters(
	fname text DEFAULT NULL::text,
	pname text DEFAULT NULL::text,
	ptheme text DEFAULT NULL::text,
	rlevel text DEFAULT NULL::text,
	dsource text DEFAULT NULL::text)
    RETURNS SETOF dopa_50.v_dopa_function_output_parameters 
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
sql TEXT;
BEGIN
sql :='
SELECT * FROM dopa_50.v_dopa_function_output_parameters
WHERE parameter_description IS NOT NULL';
IF fname IS NOT NULL THEN sql := sql || ' AND function_name ILIKE ''%'||fname||'%'' '; END IF;
IF pname IS NOT NULL THEN sql := sql || ' AND parameter_name ILIKE ''%'||pname||'%'' '; END IF;
IF ptheme IS NOT NULL THEN sql := sql || ' AND parameter_theme ILIKE ''%'||ptheme||'%'' '; END IF;
IF rlevel IS NOT NULL THEN sql := sql || ' AND parameter_reporting_level ILIKE ''%'||rlevel||'%'' '; END IF;
IF dsource IS NOT NULL THEN sql := sql || ' AND parameter_source ILIKE ''%'||dsource||'%'' '; END IF;
sql := sql || ' ORDER BY schema_name,function_name,ordinal_position;';
RETURN QUERY EXECUTE sql;
END;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_function_output_parameters(text, text, text, text, text) TO h05ibex;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_function_output_parameters(text, text, text, text, text) TO h05ibexro;

