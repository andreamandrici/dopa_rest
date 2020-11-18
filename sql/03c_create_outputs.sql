-- CLEANUP
DROP TABLE IF EXISTS mtz_results.country_all_inds CASCADE;
DROP TABLE IF EXISTS mtz_results.country_all_inds_template CASCADE;
DROP TABLE IF EXISTS mtz_results.country_ecoregions_stats_template CASCADE;
-- CREATE TABLE country_all_inds
CREATE TABLE mtz_results.country_all_inds AS
SELECT * FROM mtz_results.country
LEFT JOIN (
		SELECT country_id,array_to_json(ARRAY_AGG((b.*))) ecoregion_in_country
		FROM mtz_results.ecoregion_in_country b GROUP BY country_id
		) c
USING(country_id)
ORDER BY country_id;

-- CREATE TEMPLATE country_all_inds_template
CREATE TABLE mtz_results.country_all_inds_template AS SELECT * FROM mtz_results.country_all_inds LIMIT 0;
-- CREATE FUNCTION get_country_all_inds
CREATE FUNCTION mtz_results.get_country_all_inds()
RETURNS SETOF mtz_results.country_all_inds_template LANGUAGE SQL AS $BODY$ SELECT * FROM mtz_results.country_all_inds; $BODY$;
-- CREATE TEMPLATE country_ecoregions_stats_template
CREATE TABLE mtz_results.country_ecoregions_stats_template AS SELECT STRING_TO_ARRAY(json_array_elements_text(ecoregion_in_country),',') ecoregion_in_country FROM mtz_results.country_all_inds LIMIT 0;
-- CREATE FUNCTION get_country_ecoregions_stats
CREATE FUNCTION mtz_results.get_country_ecoregions_stats()
RETURNS SETOF mtz_results.country_ecoregions_stats_template LANGUAGE SQL AS $BODY$ SELECT STRING_TO_ARRAY(json_array_elements_text(ecoregion_in_country),',') ecoregion_in_country FROM mtz_results.country_all_inds; $BODY$;
