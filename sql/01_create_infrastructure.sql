DROP SCHEMA IF EXISTS mtz_results CASCADE;CREATE SCHEMA mtz_results;
DROP TABLE IF EXISTS mtz_results.country;
CREATE TABLE mtz_results.country
(
    country_id integer,
    country_name text,
    country_iso3 text,
    country_iso2 text,
    country_un_m49 text,
    status text,
    area_tot_km2 double precision,
    area_prot_km2 double precision,
    area_prot_perc numeric,
    area_terr_km2 double precision,
    area_terr_perc numeric,
    area_prot_terr_km2 double precision,
    area_prot_terr_perc numeric,
    area_mar_km2 double precision,
    area_mar_perc numeric,
    area_prot_mar_km2 double precision,
    area_prot_mar_perc numeric
);
DROP TABLE IF EXISTS mtz_results.ecoregion_in_country;
CREATE TABLE mtz_results.ecoregion_in_country
(
    country_id integer,
    eco_id integer,
    eco_name text,
    source text,
    country_eco_sqkm double precision,
    country_eco_prot_sqkm double precision,
    country_eco_prot_perc_country_eco numeric,
    country_eco_perc_country_tot numeric,
    country_eco_prot_perc_country_tot numeric,
    country_eco_prot_perc_country_prot numeric,
    country_eco_perc_ecoregion_tot numeric,
    country_eco_prot_perc_ecoregion_tot numeric,
    country_eco_prot_perc_ecoregion_prot numeric
);
