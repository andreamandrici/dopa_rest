
--WORKS WITH 03e_create_outputs

--makes the list
WITH
b1 AS (
SELECT ordinal_position,column_name,data_type
FROM information_schema.columns
WHERE table_schema = 'mtz_results' AND table_name ='ecoregion_in_country'
AND column_name != 'country_id'
)
SELECT STRING_AGG(CONCAT('"'||column_name||'" '||data_type),', ') FROM b1

--extract values
SELECT a2.country_id,t.*
FROM
	(SELECT country_id,json_array_elements(ecoregion_in_country) ecoregion_in_country FROM mtz_results.country_all_inds) a2,
	json_to_record(a2.ecoregion_in_country)
-- the list from above
	AS t("eco_id" integer, "eco_name" text, "source" text, "country_eco_sqkm" double precision, "country_eco_prot_sqkm" double precision, "country_eco_prot_perc_country_eco" numeric, "country_eco_perc_country_tot" numeric, "country_eco_prot_perc_country_tot" numeric, "country_eco_prot_perc_country_prot" numeric, "country_eco_perc_ecoregion_tot" numeric, "country_eco_prot_perc_ecoregion_tot" numeric, "country_eco_prot_perc_ecoregion_prot" numeric)
--
ORDER BY country_id,eco_id

