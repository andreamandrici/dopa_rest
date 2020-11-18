-- tab1
COPY mtz_results.country(country_id, country_name, country_iso3, country_iso2, country_un_m49, status, area_tot_km2, area_prot_km2, area_prot_perc, area_terr_km2, area_terr_perc, area_prot_terr_km2, area_prot_terr_perc, area_mar_km2, area_mar_perc, area_prot_mar_km2, area_prot_mar_perc)
FROM
----------------------------------------------------------------------
--locura
'/home/felixwolf/gitproject/dopa_rest/sql/country.csv' --LINUX VERSION
--'C:\gitproject\opa_rest\sql\country.csv' --WINSOZZ VERSION
--burmini
----------------------------------------------------------------------
WITH DELIMITER '|' NULL AS 'NULL'  CSV HEADER;
-- tab2
COPY mtz_results.ecoregion_in_country(country_id,eco_id,eco_name,source,country_eco_sqkm,country_eco_prot_sqkm,country_eco_prot_perc_country_eco,country_eco_perc_country_tot,country_eco_prot_perc_country_tot,country_eco_prot_perc_country_prot,country_eco_perc_ecoregion_tot,country_eco_prot_perc_ecoregion_tot,country_eco_prot_perc_ecoregion_prot)
FROM
----------------------------------------------------------------------
--mazinga
'/home/felixwolf/gitproject/dopa_rest/sql/ecoregion_in_country.csv' --LINUX VERSION
--'C:\gitproject\opa_rest\sql\ecoregion_in_country.csv' --WINSOZZ VERSION
--grecia
----------------------------------------------------------------------
WITH DELIMITER '|' NULL AS 'NULL'  CSV HEADER;