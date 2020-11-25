SELECT
(ecoregion_in_country->>'eco_id')::numeric as eco_id,
(ecoregion_in_country->>'eco_name')::text as eco_name,
(ecoregion_in_country->>'source')::text as source,
(ecoregion_in_country->>'country_eco_sqkm')::numeric as country_eco_sqkm,
(ecoregion_in_country->>'country_eco_prot_sqkm')::numeric as country_eco_prot_sqkm,
(ecoregion_in_country->>'country_eco_prot_perc_country_eco')::numeric as country_eco_prot_perc_country_eco,
(ecoregion_in_country->>'country_eco_perc_country_tot')::numeric as country_eco_prot_perc_country_tot,
(ecoregion_in_country->>'country_eco_prot_perc_country_tot')::numeric as country_eco_prot_perc_country_tot,
(ecoregion_in_country->>'country_eco_prot_perc_country_prot')::numeric as country_eco_prot_perc_country_prot,
(ecoregion_in_country->>'country_eco_perc_ecoregion_tot')::numeric as country_eco_perc_ecoregion_tot,
(ecoregion_in_country->>'country_eco_prot_perc_ecoregion_tot')::numeric as country_eco_prot_perc_ecoregion_tot,
(ecoregion_in_country->>'country_eco_prot_perc_ecoregion_prot')::numeric as country_eco_prot_perc_ecoregion_prot
FROM (SELECT UNNEST(ecoregion_in_country) ecoregion_in_country FROM mtz_results.country_all_inds WHERE country_id = 183) a;