---------------------------------------------------------------------------------------------
-- FUNCTION: dopa_50.get_dopa_species_list(bigint, text, text, text, text, text, text, boolean, text, text, text, boolean, text, text, text, text, text)
---------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS dopa_50.get_dopa_species_list(bigint, text, text, text, text, text, text, boolean, text, text, text, boolean, text, text, text, text, text);
---------------------------------------------------------------------------------------------
-- MATERIALIZED VIEW
---------------------------------------------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS dopa_50.dopa_species_list_template;
CREATE MATERIALIZED VIEW IF NOT EXISTS dopa_50.dopa_species_list_template
AS
SELECT
dopa_species.id_no,
dopa_species.phylum,
dopa_species.class,
dopa_species.order_,
dopa_species.family,
dopa_species.genus,
dopa_species.binomial,
dopa_species.endemic,
dopa_species.range_sqkm,
dopa_species.prot_range_sqkm,
round((COALESCE(dopa_species.prot_range_sqkm, 0::double precision) / dopa_species.range_sqkm * 100::double precision)::numeric, 2) AS prot_range_perc_tot_range,
dopa_species.ecosystems,
dopa_species.category,
dopa_species.threatened,
dopa_species.country,
dopa_species.country_n,
dopa_species.conservation_needed,
dopa_species.habitats,
dopa_species.research_needed,
dopa_species.stresses,
dopa_species.threats,
dopa_species.usetrade
FROM dopa_50.dopa_species
LIMIT 0;
GRANT SELECT ON TABLE dopa_50.dopa_species_list_template TO h05ibexro;
---------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_species_list(
	id_no bigint DEFAULT NULL::bigint,
	class text DEFAULT NULL::text,
	order_ text DEFAULT NULL::text,
	family text DEFAULT NULL::text,
	genus text DEFAULT NULL::text,
	binomial text DEFAULT NULL::text,
	category text DEFAULT NULL::text,
	threatened boolean DEFAULT NULL::boolean,
	ecosystems text DEFAULT NULL::text,
	habitats text DEFAULT NULL::text,
	country text DEFAULT NULL::text,
	endemic boolean DEFAULT NULL::boolean,
	stresses text DEFAULT NULL::text,
	threats text DEFAULT NULL::text,
	research_needed text DEFAULT NULL::text,
	conservation_needed text DEFAULT NULL::text,
	usetrade text DEFAULT NULL::text)
    RETURNS SETOF dopa_50.dopa_species_list_template 
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
    sql TEXT := '
        SELECT
            id_no,
            phylum,
            class,
            order_,
            family,
            genus,
            binomial,
            endemic,
            range_sqkm,
            prot_range_sqkm,
            ROUND((COALESCE(prot_range_sqkm,0)/range_sqkm*100)::numeric,2) AS prot_range_perc_tot_range,
            ecosystems,
            category,
            threatened,
            country,
            country_n,
            conservation_needed,
            habitats,
            research_needed,
            stresses,
            threats,
            usetrade
        FROM dopa_50.dopa_species
        WHERE 1=1';
BEGIN
    IF id_no IS NOT NULL THEN sql := sql || ' AND id_no = ' || id_no; END IF;
    IF class IS NOT NULL THEN sql := sql || ' AND class ILIKE ''%' || class || '%'''; END IF;
    IF order_ IS NOT NULL THEN sql := sql || ' AND order_ ILIKE ''%' || order_ || '%'''; END IF;
    IF family IS NOT NULL THEN sql := sql || ' AND family ILIKE ''%' || family || '%'''; END IF;
    IF genus IS NOT NULL THEN sql := sql || ' AND genus ILIKE ''%' || genus || '%'''; END IF;
    IF binomial IS NOT NULL THEN sql := sql || ' AND binomial ILIKE ''%' || binomial || '%'''; END IF;
    IF category IS NOT NULL THEN
        sql := sql || ' AND category IN (' ||
            (SELECT STRING_AGG(quote_literal(a), ',') FROM regexp_split_to_table(UPPER(category), ',') AS a) || ')';
    END IF;
    IF threatened IS NOT NULL THEN sql := sql || ' AND threatened IS ' || threatened; END IF;
    IF ecosystems IS NOT NULL THEN
        sql := sql || ' AND ARRAY[' || (SELECT STRING_AGG(quote_literal(a), ',') FROM regexp_split_to_table(LOWER(ecosystems), ',') AS a) || '] && ecosystems';
    END IF;
    IF habitats IS NOT NULL THEN
        sql := sql || ' AND ARRAY[' || (SELECT STRING_AGG(quote_literal(a), ',') FROM regexp_split_to_table(habitats, ',') AS a) || '] && habitats';
    END IF;
    IF country IS NOT NULL THEN
        sql := sql || ' AND ARRAY[' || (SELECT STRING_AGG(quote_literal(a), ',') FROM regexp_split_to_table(UPPER(country), ',') AS a) || '] && country';
    END IF;
    IF endemic IS NOT NULL THEN sql := sql || ' AND endemic IS ' || endemic; END IF;
    IF stresses IS NOT NULL THEN
        sql := sql || ' AND ARRAY[' || (SELECT STRING_AGG(quote_literal(a), ',') FROM regexp_split_to_table(stresses, ',') AS a) || '] && stresses';
    END IF;
    IF threats IS NOT NULL THEN
        sql := sql || ' AND ARRAY[' || (SELECT STRING_AGG(quote_literal(a), ',') FROM regexp_split_to_table(threats, ',') AS a) || '] && threats';
    END IF;
    IF research_needed IS NOT NULL THEN
        sql := sql || ' AND ARRAY[' || (SELECT STRING_AGG(quote_literal(a), ',') FROM regexp_split_to_table(research_needed, ',') AS a) || '] && research_needed';
    END IF;
    IF conservation_needed IS NOT NULL THEN
        sql := sql || ' AND ARRAY[' || (SELECT STRING_AGG(quote_literal(a), ',') FROM regexp_split_to_table(conservation_needed, ',') AS a) || '] && conservation_needed';
    END IF;
    IF usetrade IS NOT NULL THEN
        sql := sql || ' AND ARRAY[' || (SELECT STRING_AGG(a, ',') FROM regexp_split_to_table(usetrade, ',') AS a) || ']::integer[] && usetrade';
    END IF;

    sql := sql || ' ORDER BY o,id_no;';
    RETURN QUERY EXECUTE sql;
END;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_species_list(bigint, text, text, text, text, text, text, boolean, text, text, text, boolean, text, text, text, text, text) TO h05ibexro;
COMMENT ON FUNCTION dopa_50.get_dopa_species_list(bigint, text, text, text, text, text, text, boolean, text, text, text, boolean, text, text, text, text, text)
    IS '
Input parameters are:
- id_no bigint (default: NULL): filters by one single species id 
- class text (default: NULL): filters by class. Is not case sensitive, and accepts partial values 
  (eg: ''MAMMALIA'', ''Mammalia'' or ''mamm'' are all valid)
- order_ text (default: NULL): filters by order. Is not case sensitive, and accepts partial values 
  (eg: ''CARNIVORA'', ''Carnivora'' or ''carn'' are all valid)
- family text (default: NULL): filters by family. Is not case sensitive, and accepts partial values 
  (eg: ''CANIDAE'', ''Canidae'' or ''can'' are all valid)
- genus text (default: NULL): filters by genus. Is not case sensitive, and accepts partial values 
  (eg: ''CANIS'', ''Canis'' or ''can'' are all valid)
- binomial text (default: NULL): filters by species. Is not case sensitive, and accepts partial values 
  (eg: ''Canis lupus'', ''canis lupus'' or ''canis lup'' are all valid)
- category text (default: NULL): filters by IUCN category. Is not case sensitive, and accepts single values 
  or lists (eg: ''CR'',''Vu'' or ''CR,vu'' are all valid). 
  The service "get_list_categories" returns the list of used categories
- threatened boolean (default: NULL): filters by threatened species 
  (Critically Endangered, Endangered and Vulnerable IUCN categories). 
  Is not case sensitive (eg: TRUE or false are both valid)
- ecosystems text (default: NULL): filters by ecosystem (marine, terrestrial, freshwater). 
  Is not case sensitive, accepts single values or lists and uses overlap operator 
  (eg: ''marine'',''Terrestrial'' or ''terrestrial,Freshwater'' are all valid; 
   ''marine'' returns: {marine},{marine,terrestrial},etc...; 
   ''marine,terrestrial'' returns: {marine},{terrestrial},{marine,terrestrial},etc...)
- habitats text (default: NULL): filters by habitat code. 
  Accepts single values or lists and uses overlap operator 
  (eg: ''1.6'' or ''1.6,14.4'' are both valid; 
   ''1.6'' returns: {1.6},{1.6,1.14},etc...; 
   ''1.6,1.14'' returns: {1.6},{1.14},{1.6,1.14},etc...). 
  The service "get_list_habitats" returns the code/names pairs for used habitats
- country text (default: NULL): filters by country code. Is not case sensitive, accepts single values or lists 
  and uses overlap operator (eg: ''IT'', ''fr'' or ''It,FR'' are all valid; 
   ''IT'' returns: {IT},{IT,FR},etc...; 
   ''IT,FR'' returns: {IT},{FR},{IT,FR},etc...). 
  The service "get_list_countries" returns the code/names pairs for used countries
- endemic boolean (default: NULL): filters by endemic species (n_country = 1). 
  Is not case sensitive (eg: TRUE or false are both valid)
- stresses text (default: NULL): filters by stress code. 
  Accepts single values or lists and uses overlap operator 
  (eg: ''1.2'' or ''1.2,2.1'' are both valid; 
   ''1.2'' returns: {1.2},{1.2,2.1},etc...; 
   ''1.2,2.1'' returns: {1.2},{2.1},{1.2,2.1},etc...). 
  The service "get_list_stresses" returns the code/names pairs for used stresses
- threats text (default: NULL): filters by threat code. 
  Accepts single values or lists and uses overlap operator 
  (eg: ''1.2'' or ''1.2,2.1'' are both valid; 
   ''1.2'' returns: {1.2},{1.2,2.1},etc...; 
   ''1.2,2.1'' returns: {1.2},{2.1},{1.2,2.1},etc...). 
  The service "get_list_threats" returns the code/names pairs for used threats
- research_needed text (default: NULL): filters by research needed code. 
  Accepts single values or lists and uses overlap operator 
  (eg: ''1.2'' or ''1.2,2.1'' are both valid; 
   ''1.2'' returns: {1.2},{1.2,2.1},etc...; 
   ''1.2,2.1'' returns: {1.2},{2.1},{1.2,2.1},etc...). 
  The service "get_list_research_needed" returns the code/names pairs for used research needed
- conservation_needed text (default: NULL): filters by conservation needed code. 
  Accepts single values or lists and uses overlap operator 
  (eg: ''1.2'' or ''1.2,2.1'' are both valid; 
   ''1.2'' returns: {1.2},{1.2,2.1},etc...; 
   ''1.2,2.1'' returns: {1.2},{2.1},{1.2,2.1},etc...). 
  The service "get_list_conservation_needed" returns the code/names pairs for used conservation needed
- usetrade text (default: NULL): filters by usetrade code. 
  Accepts single values or lists and uses overlap operator 
  (eg: ''1'' or ''15'' are both valid; 
   ''1'' returns: {1},{1,15},etc...; 
   ''1,15'' returns: {1},{15},{1,15},etc...). 
  The service "get_list_usetrade" returns the code/names pairs for used usetrade

Output parameters are:
- id_no bigint
- phylum text
- class text
- order_ text
- family text
- genus text
- binomial text
- endemic boolean
- range_sqkm double precision
- prot_range_sqkm double precision
- prot_range_perc_tot_range numeric
- ecosystems text[]
- category text
- threatened boolean
- country text[]
- country_n integer
- conservation_needed text[]
- habitats text[]
- research_needed text[]
- stresses text[]
- threats text[]
- usetrade integer[]
';

------------------------------------------------------------------------------------------
-- FUNCTION: dopa_50.get_dopa_species()
------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS dopa_50.get_dopa_species(bigint);
------------------------------------------------------------------------------------------
-- MATERIALIZED: dopa_50.dopa_species_template
------------------------------------------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS dopa_50.dopa_species_template;
CREATE MATERIALIZED VIEW IF NOT EXISTS dopa_50.dopa_species_template
AS
 WITH a AS (
         SELECT dopa_species.id_no,
            dopa_species.class,
            dopa_species.order_,
            dopa_species.family,
            dopa_species.genus,
            dopa_species.binomial,
            dopa_species.category,
            dopa_species.threatened,
            dopa_species.country_n,
            dopa_species.endemic,
            t.ecosystems,
            t.habitats,
            t.country,
            t.stresses,
            t.threats,
            t.research_needed,
            t.conservation_needed,
            t.usetrade
           FROM dopa_50.dopa_species,
            LATERAL UNNEST(dopa_species.ecosystems, dopa_species.habitats, dopa_species.country, dopa_species.stresses, dopa_species.threats, dopa_species.research_needed, dopa_species.conservation_needed, dopa_species.usetrade) t(ecosystems, habitats, country, stresses, threats, research_needed, conservation_needed, usetrade)
          WHERE dopa_species.id_no = 3746
        )
 SELECT a.id_no,
    a.class,
    a.order_,
    a.family,
    a.genus,
    a.binomial,
    a.category,
    a.threatened,
    a.country_n,
    a.endemic,
    a.ecosystems,
    b.code AS habitat_code,
    b.name AS habitat_name,
    c.code AS country_code,
    c.name AS country_name,
    d.code AS stress_code,
    d.name AS stress_name,
    e.code AS threat_code,
    e.name AS threat_name,
    f.code AS research_needed_code,
    f.name AS research_needed_name,
    g.code AS conservation_needed_code,
    g.name AS conservation_needed_name,
    h.code AS usetrade_code,
    h.name AS usetrade_name
   FROM a
     LEFT JOIN dopa_50.class_species_habitat b ON a.habitats = b.code
     LEFT JOIN dopa_50.class_species_country c ON a.country = c.code
     LEFT JOIN dopa_50.class_species_stress d ON a.stresses = d.code
     LEFT JOIN dopa_50.class_species_threat e ON a.threats = e.code
     LEFT JOIN dopa_50.class_species_research_needed f ON a.research_needed = f.code
     LEFT JOIN dopa_50.class_species_conservation_needed g ON a.conservation_needed = g.code
     LEFT JOIN dopa_50.class_species_usetrade h ON a.usetrade = h.code
  ORDER BY a.ecosystems, b.code, c.code, d.code, e.code, f.code, g.code, h.code
 LIMIT 0;
GRANT SELECT ON TABLE dopa_50.dopa_species_template TO h05ibexro;
---------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_species(
	id_no bigint DEFAULT NULL::bigint)
    RETURNS SETOF dopa_50.dopa_species_template 
    LANGUAGE 'sql'
AS $BODY$
    WITH a AS (
        SELECT
            s.id_no, s.class, s.order_, s.family, s.genus, s.binomial,
            s.category, s.threatened, s.country_n, s.endemic,
            u.ecosystems, u.habitats, u.country, u.stresses,
            u.threats, u.research_needed, u.conservation_needed, u.usetrade
        FROM dopa_50.dopa_species s
        LEFT JOIN LATERAL UNNEST(
            s.ecosystems,
            s.habitats,
            s.country,
            s.stresses,
            s.threats,
            s.research_needed,
            s.conservation_needed,
            s.usetrade
        ) AS u(
            ecosystems,
            habitats,
            country,
            stresses,
            threats,
            research_needed,
            conservation_needed,
            usetrade
        ) ON TRUE
        WHERE s.id_no = $1          -- parametro rinominato
    )
    SELECT
        a.id_no, a.class, a.order_, a.family, a.genus, a.binomial,
        a.category, a.threatened, a.country_n, a.endemic, a.ecosystems,
        b.code AS habitat_code, b.name AS habitat_name,
        c.code AS country_code, c.name AS country_name,
        d.code AS stress_code, d.name AS stress_name,
        e.code AS threat_code, e.name AS threat_name,
        f.code AS research_needed_code, f.name AS research_needed_name,
        g.code AS conservation_needed_code, g.name AS conservation_needed_name,
        h.code AS usetrade_code, h.name AS usetrade_name
    FROM a
    LEFT JOIN dopa_50.class_species_habitat b   ON a.habitats = b.code
    LEFT JOIN dopa_50.class_species_country c   ON a.country  = c.code
    LEFT JOIN dopa_50.class_species_stress d    ON a.stresses = d.code
    LEFT JOIN dopa_50.class_species_threat e    ON a.threats  = e.code
    LEFT JOIN dopa_50.class_species_research_needed f ON a.research_needed = f.code
    LEFT JOIN dopa_50.class_species_conservation_needed g ON a.conservation_needed = g.code
    LEFT JOIN dopa_50.class_species_usetrade h  ON a.usetrade = h.code
    ORDER BY ecosystems, habitat_code, country_code, stress_code,
             threat_code, research_needed_code, conservation_needed_code, usetrade_code;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_species(bigint) TO h05ibexro;
COMMENT ON FUNCTION dopa_50.get_dopa_species(bigint)
    IS 'Shows for a single species direct and related detailed attributes';

--------------------------------------------------------------------------------
-- FUNCTION: dopa_50.get_dopa_species_list_habitat()
--------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS dopa_50.get_dopa_species_list_habitat();
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_species_list_habitat(
	)
    RETURNS TABLE(cl1 integer, cl2 integer, cl3 integer, code text, name text) 
    LANGUAGE 'sql'
AS $BODY$
    SELECT 
        NULLIF(split_part(code, '.', 1), '')::integer AS cl1,
        NULLIF(split_part(code, '.', 2), '')::integer AS cl2,
        NULLIF(split_part(code, '.', 3), '')::integer AS cl3,
        code,
        name
    FROM dopa_50.class_species_habitat;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_species_list_habitat() TO h05ibexro;
COMMENT ON FUNCTION dopa_50.get_dopa_species_list_habitat()
    IS 'Shows list of EXISTING habitats with classification levels derived from code';
