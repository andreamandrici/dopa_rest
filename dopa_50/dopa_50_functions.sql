--------------------------------------------------------------------
-- FUNCTION: dopa_50.get_dopa_country_all_inds(text, text)
--------------------------------------------------------------------
DROP FUNCTION IF EXISTS dopa_50.get_dopa_country_all_inds(text,text);
--------------------------------------------------------------------
-- Naterialized View: dopa_50.dopa_country_all_inds_template
--------------------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS dopa_50.dopa_country_all_inds_template;
CREATE MATERIALIZED VIEW IF NOT EXISTS dopa_50.dopa_country_all_inds_template
AS
 SELECT
 	dopa_country_all_inds.country_id,
    dopa_country_all_inds.country_name,
    dopa_country_all_inds.iso3,
    dopa_country_all_inds.iso2,
    dopa_country_all_inds.status,
    dopa_country_all_inds.country_tot_v_sqkm,
    dopa_country_all_inds.country_tot_sqkm,
    dopa_country_all_inds.country_prot_sqkm,
    dopa_country_all_inds.country_prot_perc_country_tot,
    dopa_country_all_inds.country_land_sqkm,
    dopa_country_all_inds.country_land_perc_country_tot,
    dopa_country_all_inds.country_land_prot_sqkm,
    dopa_country_all_inds.country_land_prot_perc_country_land,
    dopa_country_all_inds.country_marine_sqkm,
    dopa_country_all_inds.country_marine_perc_country_tot,
    dopa_country_all_inds.country_marine_prot_sqkm,
    dopa_country_all_inds.country_marine_prot_perc_country_marine,
    dopa_country_all_inds.protconn,
    dopa_country_all_inds.kba_n_tot,
    dopa_country_all_inds.kba_n_fully_prot,
    dopa_country_all_inds.kba_n_partially_prot,
    dopa_country_all_inds.kba_n_not_protected,
    dopa_country_all_inds.kba_avg_prot_perc_tot,
    dopa_country_all_inds.mta_perc_n_ecoregions_in_country,
    dopa_country_all_inds.pa_list,
    dopa_country_all_inds.pa_count,
    dopa_country_all_inds.agb_min_c_mg_total,
    dopa_country_all_inds.agb_max_c_mg_total,
    dopa_country_all_inds.agb_mean_c_mg_total,
    dopa_country_all_inds.agb_tot_c_pg_total,
    dopa_country_all_inds.agb_min_c_mg_prot,
    dopa_country_all_inds.agb_max_c_mg_prot,
    dopa_country_all_inds.agb_mean_c_mg_prot,
    dopa_country_all_inds.agb_tot_c_pg_prot,
    dopa_country_all_inds.agb_min_c_mg_unprot,
    dopa_country_all_inds.agb_max_c_mg_unprot,
    dopa_country_all_inds.agb_mean_c_mg_unprot,
    dopa_country_all_inds.agb_tot_c_pg_unprot,
    dopa_country_all_inds.bgb_min_c_mg_total,
    dopa_country_all_inds.bgb_max_c_mg_total,
    dopa_country_all_inds.bgb_mean_c_mg_total,
    dopa_country_all_inds.bgb_tot_c_pg_total,
    dopa_country_all_inds.bgb_min_c_mg_prot,
    dopa_country_all_inds.bgb_max_c_mg_prot,
    dopa_country_all_inds.bgb_mean_c_mg_prot,
    dopa_country_all_inds.bgb_tot_c_pg_prot,
    dopa_country_all_inds.bgb_min_c_mg_unprot,
    dopa_country_all_inds.bgb_max_c_mg_unprot,
    dopa_country_all_inds.bgb_mean_c_mg_unprot,
    dopa_country_all_inds.bgb_tot_c_pg_unprot,
    dopa_country_all_inds.dwc_min_c_mg_total,
    dopa_country_all_inds.dwc_max_c_mg_total,
    dopa_country_all_inds.dwc_mean_c_mg_total,
    dopa_country_all_inds.dwc_tot_c_pg_total,
    dopa_country_all_inds.dwc_min_c_mg_prot,
    dopa_country_all_inds.dwc_max_c_mg_prot,
    dopa_country_all_inds.dwc_mean_c_mg_prot,
    dopa_country_all_inds.dwc_tot_c_pg_prot,
    dopa_country_all_inds.dwc_min_c_mg_unprot,
    dopa_country_all_inds.dwc_max_c_mg_unprot,
    dopa_country_all_inds.dwc_mean_c_mg_unprot,
    dopa_country_all_inds.dwc_tot_c_pg_unprot,
    dopa_country_all_inds.ltc_min_c_mg_total,
    dopa_country_all_inds.ltc_max_c_mg_total,
    dopa_country_all_inds.ltc_mean_c_mg_total,
    dopa_country_all_inds.ltc_tot_c_pg_total,
    dopa_country_all_inds.ltc_min_c_mg_prot,
    dopa_country_all_inds.ltc_max_c_mg_prot,
    dopa_country_all_inds.ltc_mean_c_mg_prot,
    dopa_country_all_inds.ltc_tot_c_pg_prot,
    dopa_country_all_inds.ltc_min_c_mg_unprot,
    dopa_country_all_inds.ltc_max_c_mg_unprot,
    dopa_country_all_inds.ltc_mean_c_mg_unprot,
    dopa_country_all_inds.ltc_tot_c_pg_unprot,
    dopa_country_all_inds.gsoc_min_c_mg_total,
    dopa_country_all_inds.gsoc_max_c_mg_total,
    dopa_country_all_inds.gsoc_mean_c_mg_total,
    dopa_country_all_inds.gsoc_tot_c_pg_total,
    dopa_country_all_inds.gsoc_min_c_mg_prot,
    dopa_country_all_inds.gsoc_max_c_mg_prot,
    dopa_country_all_inds.gsoc_mean_c_mg_prot,
    dopa_country_all_inds.gsoc_tot_c_pg_prot,
    dopa_country_all_inds.gsoc_min_c_mg_unprot,
    dopa_country_all_inds.gsoc_max_c_mg_unprot,
    dopa_country_all_inds.gsoc_mean_c_mg_unprot,
    dopa_country_all_inds.gsoc_tot_c_pg_unprot,
    dopa_country_all_inds.carbon_min_c_mg_total,
    dopa_country_all_inds.carbon_max_c_mg_total,
    dopa_country_all_inds.carbon_mean_c_mg_total,
    dopa_country_all_inds.carbon_tot_c_pg_total,
    dopa_country_all_inds.carbon_min_c_mg_prot,
    dopa_country_all_inds.carbon_max_c_mg_prot,
    dopa_country_all_inds.carbon_mean_c_mg_prot,
    dopa_country_all_inds.carbon_tot_c_pg_prot,
    dopa_country_all_inds.carbon_min_c_mg_unprot,
    dopa_country_all_inds.carbon_max_c_mg_unprot,
    dopa_country_all_inds.carbon_mean_c_mg_unprot,
    dopa_country_all_inds.carbon_tot_c_pg_unprot,
    dopa_country_all_inds.elev_min,
    dopa_country_all_inds.elev_max,
    dopa_country_all_inds.elev_mean,
    dopa_country_all_inds.gfc_gain_sqkm,
    dopa_country_all_inds.gfc_gain_prot_sqkm,
    dopa_country_all_inds.gfc_gain_perc_tot,
    dopa_country_all_inds.gfc_gain_prot_perc_tot,
    dopa_country_all_inds.gfc_loss_sqkm,
    dopa_country_all_inds.gfc_loss_prot_sqkm,
    dopa_country_all_inds.gfc_loss_perc_tot,
    dopa_country_all_inds.gfc_loss_prot_perc_tot,
    dopa_country_all_inds.gfc_treecover_land_sqkm,
    dopa_country_all_inds.gfc_treecover_land_perc_country_land,
    dopa_country_all_inds.gfc_treecover_land_prot_sqkm,
    dopa_country_all_inds.gfc_treecover_land_prot_perc_country_land,
    dopa_country_all_inds.gfc_treecover_land_prot_perc_country_land_prot,
    dopa_country_all_inds.gfc_treecover_land_prot_perc_gfc_treecover_land,
    dopa_country_all_inds.water_p_now_sqkm,
    dopa_country_all_inds.water_p_1985_sqkm,
    dopa_country_all_inds.water_p_netchange_sqkm,
    dopa_country_all_inds.water_p_netchange_perc_first_epoch,
    dopa_country_all_inds.water_p_prot_now_sqkm,
    dopa_country_all_inds.water_p_prot_1985_sqkm,
    dopa_country_all_inds.water_p_prot_netchange_sqkm,
    dopa_country_all_inds.water_p_prot_netchange_perc_first_epoch,
    dopa_country_all_inds.water_s_now_sqkm,
    dopa_country_all_inds.water_s_1985_sqkm,
    dopa_country_all_inds.water_s_netchange_sqkm,
    dopa_country_all_inds.water_s_netchange_perc_first_epoch,
    dopa_country_all_inds.water_s_prot_now_sqkm,
    dopa_country_all_inds.water_s_prot_1985_sqkm,
    dopa_country_all_inds.water_s_prot_netchange_sqkm,
    dopa_country_all_inds.water_s_prot_netchange_perc_first_epoch,
    dopa_country_all_inds.land_sqkm,
    dopa_country_all_inds.land_prot_sqkm,
    dopa_country_all_inds.lpd_null_sqkm,
    dopa_country_all_inds.lpd_null_perc_land_sqkm,
    dopa_country_all_inds.lpd_severe_sqkm,
    dopa_country_all_inds.lpd_severe_perc_land_sqkm,
    dopa_country_all_inds.lpd_moderate_sqkm,
    dopa_country_all_inds.lpd_moderate_perc_land_sqkm,
    dopa_country_all_inds.lpd_stable_stressed_sqkm,
    dopa_country_all_inds.lpd_stable_perc_land_sqkm,
    dopa_country_all_inds.lpd_stable_sqkm,
    dopa_country_all_inds.lpd_stable_stressed_perc_land_sqkm,
    dopa_country_all_inds.lpd_increased_sqkm,
    dopa_country_all_inds.lpd_increased_perc_land_sqkm,
    dopa_country_all_inds.lpd_prot_null_sqkm,
    dopa_country_all_inds.lpd_prot_null_perc_land_prot_sqkm,
    dopa_country_all_inds.lpd_prot_severe_sqkm,
    dopa_country_all_inds.lpd_prot_severe_perc_land_prot_sqkm,
    dopa_country_all_inds.lpd_prot_moderate_sqkm,
    dopa_country_all_inds.lpd_prot_moderate_perc_land_prot_sqkm,
    dopa_country_all_inds.lpd_prot_stable_stressed_sqkm,
    dopa_country_all_inds.lpd_prot_stable_perc_land_prot_sqkm,
    dopa_country_all_inds.lpd_prot_stable_sqkm,
    dopa_country_all_inds.lpd_prot_stable_stressed_perc_land_prot_sqkm,
    dopa_country_all_inds.lpd_prot_increased_sqkm,
    dopa_country_all_inds.lpd_prot_increased_perc_land_prot_sqkm,
    dopa_country_all_inds.mspa_core_1995_sqkm,
    dopa_country_all_inds.mspa_non_natural_1995_sqkm,
    dopa_country_all_inds.mspa_edge_1995_sqkm,
    dopa_country_all_inds.mspa_core_perforation_1995_sqkm,
    dopa_country_all_inds.mspa_islet_1995_sqkm,
    dopa_country_all_inds.mspa_linear_1995_sqkm,
    dopa_country_all_inds.mspa_core_2000_sqkm,
    dopa_country_all_inds.mspa_non_natural_2000_sqkm,
    dopa_country_all_inds.mspa_edge_2000_sqkm,
    dopa_country_all_inds.mspa_core_perforation_2000_sqkm,
    dopa_country_all_inds.mspa_islet_2000_sqkm,
    dopa_country_all_inds.mspa_linear_2000_sqkm,
    dopa_country_all_inds.mspa_core_2005_sqkm,
    dopa_country_all_inds.mspa_non_natural_2005_sqkm,
    dopa_country_all_inds.mspa_edge_2005_sqkm,
    dopa_country_all_inds.mspa_core_perforation_2005_sqkm,
    dopa_country_all_inds.mspa_islet_2005_sqkm,
    dopa_country_all_inds.mspa_linear_2005_sqkm,
    dopa_country_all_inds.mspa_core_2010_sqkm,
    dopa_country_all_inds.mspa_non_natural_2010_sqkm,
    dopa_country_all_inds.mspa_edge_2010_sqkm,
    dopa_country_all_inds.mspa_core_perforation_2010_sqkm,
    dopa_country_all_inds.mspa_islet_2010_sqkm,
    dopa_country_all_inds.mspa_linear_2010_sqkm,
    dopa_country_all_inds.mspa_core_2015_sqkm,
    dopa_country_all_inds.mspa_non_natural_2015_sqkm,
    dopa_country_all_inds.mspa_edge_2015_sqkm,
    dopa_country_all_inds.mspa_core_perforation_2015_sqkm,
    dopa_country_all_inds.mspa_islet_2015_sqkm,
    dopa_country_all_inds.mspa_linear_2015_sqkm,
    dopa_country_all_inds.lcc_esa_country_land_sqkm,
    dopa_country_all_inds.lcc_esa_country_land_prot_sqkm,
    dopa_country_all_inds.lcc_esa_lc1_1995,
    dopa_country_all_inds.lcc_esa_lc1_2020,
    dopa_country_all_inds.lcc_esa_land_sqkm,
    dopa_country_all_inds.lcc_esa_land_prot_sqkm,
    dopa_country_all_inds.lc_copernicus_code,
    dopa_country_all_inds.lc_copernicus_tot_sqkm,
    dopa_country_all_inds.lc_copernicus_prot_sqkm,
    dopa_country_all_inds.lc_copernicus_land_sqkm,
    dopa_country_all_inds.lc_copernicus_land_prot_sqkm,
    dopa_country_all_inds.lc_copernicus_marine_sqkm,
    dopa_country_all_inds.lc_copernicus_marine_prot_sqkm,
    dopa_country_all_inds.lc_copernicus_land_natural_sqkm,
    dopa_country_all_inds.lc_copernicus_land_natural_prot_sqkm,
    dopa_country_all_inds.lc_copernicus_land_forest_sqkm,
    dopa_country_all_inds.lc_copernicus_land_forest_prot_sqkm,
    dopa_country_all_inds.lc_copernicus_land_water_sqkm,
    dopa_country_all_inds.lc_copernicus_land_water_prot_sqkm
   FROM dopa_50.dopa_country_all_inds
 LIMIT 0;
GRANT SELECT ON TABLE dopa_50.dopa_country_all_inds_template TO h05ibexro;
--------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_country_all_inds(
	country_code text DEFAULT NULL::text,
	code_type text DEFAULT 'iso3'::text)
    RETURNS SETOF dopa_50.dopa_country_all_inds_template 
    LANGUAGE 'sql'
AS $BODY$
    SELECT
	country_id,
	country_name,
	iso3,
	iso2,
	status,
	country_tot_v_sqkm,
	country_tot_sqkm,
	country_prot_sqkm,
	country_prot_perc_country_tot,
	country_land_sqkm,
	country_land_perc_country_tot,
	country_land_prot_sqkm,
	country_land_prot_perc_country_land,
	country_marine_sqkm,
	country_marine_perc_country_tot,
	country_marine_prot_sqkm,
	country_marine_prot_perc_country_marine,
	protconn,
	kba_n_tot,
	kba_n_fully_prot,
	kba_n_partially_prot,
	kba_n_not_protected,
	kba_avg_prot_perc_tot,
	mta_perc_n_ecoregions_in_country,
	pa_list,
	pa_count,
	agb_min_c_mg_total,
	agb_max_c_mg_total,
	agb_mean_c_mg_total,
	agb_tot_c_pg_total,
	agb_min_c_mg_prot,
	agb_max_c_mg_prot,
	agb_mean_c_mg_prot,
	agb_tot_c_pg_prot,
	agb_min_c_mg_unprot,
	agb_max_c_mg_unprot,
	agb_mean_c_mg_unprot,
	agb_tot_c_pg_unprot,
	bgb_min_c_mg_total,
	bgb_max_c_mg_total,
	bgb_mean_c_mg_total,
	bgb_tot_c_pg_total,
	bgb_min_c_mg_prot,
	bgb_max_c_mg_prot,
	bgb_mean_c_mg_prot,
	bgb_tot_c_pg_prot,
	bgb_min_c_mg_unprot,
	bgb_max_c_mg_unprot,
	bgb_mean_c_mg_unprot,
	bgb_tot_c_pg_unprot,
	dwc_min_c_mg_total,
	dwc_max_c_mg_total,
	dwc_mean_c_mg_total,
	dwc_tot_c_pg_total,
	dwc_min_c_mg_prot,
	dwc_max_c_mg_prot,
	dwc_mean_c_mg_prot,
	dwc_tot_c_pg_prot,
	dwc_min_c_mg_unprot,
	dwc_max_c_mg_unprot,
	dwc_mean_c_mg_unprot,
	dwc_tot_c_pg_unprot,
	ltc_min_c_mg_total,
	ltc_max_c_mg_total,
	ltc_mean_c_mg_total,
	ltc_tot_c_pg_total,
	ltc_min_c_mg_prot,
	ltc_max_c_mg_prot,
	ltc_mean_c_mg_prot,
	ltc_tot_c_pg_prot,
	ltc_min_c_mg_unprot,
	ltc_max_c_mg_unprot,
	ltc_mean_c_mg_unprot,
	ltc_tot_c_pg_unprot,
	gsoc_min_c_mg_total,
	gsoc_max_c_mg_total,
	gsoc_mean_c_mg_total,
	gsoc_tot_c_pg_total,
	gsoc_min_c_mg_prot,
	gsoc_max_c_mg_prot,
	gsoc_mean_c_mg_prot,
	gsoc_tot_c_pg_prot,
	gsoc_min_c_mg_unprot,
	gsoc_max_c_mg_unprot,
	gsoc_mean_c_mg_unprot,
	gsoc_tot_c_pg_unprot,
	carbon_min_c_mg_total,
	carbon_max_c_mg_total,
	carbon_mean_c_mg_total,
	carbon_tot_c_pg_total,
	carbon_min_c_mg_prot,
	carbon_max_c_mg_prot,
	carbon_mean_c_mg_prot,
	carbon_tot_c_pg_prot,
	carbon_min_c_mg_unprot,
	carbon_max_c_mg_unprot,
	carbon_mean_c_mg_unprot,
	carbon_tot_c_pg_unprot,
	elev_min,
	elev_max,
	elev_mean,
	gfc_gain_sqkm,
	gfc_gain_prot_sqkm,
	gfc_gain_perc_tot,
	gfc_gain_prot_perc_tot,
	gfc_loss_sqkm,
	gfc_loss_prot_sqkm,
	gfc_loss_perc_tot,
	gfc_loss_prot_perc_tot,
	gfc_treecover_land_sqkm,
	gfc_treecover_land_perc_country_land,
	gfc_treecover_land_prot_sqkm,
	gfc_treecover_land_prot_perc_country_land,
	gfc_treecover_land_prot_perc_country_land_prot,
	gfc_treecover_land_prot_perc_gfc_treecover_land,
	water_p_now_sqkm,
	water_p_1985_sqkm,
	water_p_netchange_sqkm,
	water_p_netchange_perc_first_epoch,
	water_p_prot_now_sqkm,
	water_p_prot_1985_sqkm,
	water_p_prot_netchange_sqkm,
	water_p_prot_netchange_perc_first_epoch,
	water_s_now_sqkm,
	water_s_1985_sqkm,
	water_s_netchange_sqkm,
	water_s_netchange_perc_first_epoch,
	water_s_prot_now_sqkm,
	water_s_prot_1985_sqkm,
	water_s_prot_netchange_sqkm,
	water_s_prot_netchange_perc_first_epoch,
	land_sqkm,
	land_prot_sqkm,
	lpd_null_sqkm,
	lpd_null_perc_land_sqkm,
	lpd_severe_sqkm,
	lpd_severe_perc_land_sqkm,
	lpd_moderate_sqkm,
	lpd_moderate_perc_land_sqkm,
	lpd_stable_stressed_sqkm,
	lpd_stable_perc_land_sqkm,
	lpd_stable_sqkm,
	lpd_stable_stressed_perc_land_sqkm,
	lpd_increased_sqkm,
	lpd_increased_perc_land_sqkm,
	lpd_prot_null_sqkm,
	lpd_prot_null_perc_land_prot_sqkm,
	lpd_prot_severe_sqkm,
	lpd_prot_severe_perc_land_prot_sqkm,
	lpd_prot_moderate_sqkm,
	lpd_prot_moderate_perc_land_prot_sqkm,
	lpd_prot_stable_stressed_sqkm,
	lpd_prot_stable_perc_land_prot_sqkm,
	lpd_prot_stable_sqkm,
	lpd_prot_stable_stressed_perc_land_prot_sqkm,
	lpd_prot_increased_sqkm,
	lpd_prot_increased_perc_land_prot_sqkm,
	mspa_core_1995_sqkm,
	mspa_non_natural_1995_sqkm,
	mspa_edge_1995_sqkm,
	mspa_core_perforation_1995_sqkm,
	mspa_islet_1995_sqkm,
	mspa_linear_1995_sqkm,
	mspa_core_2000_sqkm,
	mspa_non_natural_2000_sqkm,
	mspa_edge_2000_sqkm,
	mspa_core_perforation_2000_sqkm,
	mspa_islet_2000_sqkm,
	mspa_linear_2000_sqkm,
	mspa_core_2005_sqkm,
	mspa_non_natural_2005_sqkm,
	mspa_edge_2005_sqkm,
	mspa_core_perforation_2005_sqkm,
	mspa_islet_2005_sqkm,
	mspa_linear_2005_sqkm,
	mspa_core_2010_sqkm,
	mspa_non_natural_2010_sqkm,
	mspa_edge_2010_sqkm,
	mspa_core_perforation_2010_sqkm,
	mspa_islet_2010_sqkm,
	mspa_linear_2010_sqkm,
	mspa_core_2015_sqkm,
	mspa_non_natural_2015_sqkm,
	mspa_edge_2015_sqkm,
	mspa_core_perforation_2015_sqkm,
	mspa_islet_2015_sqkm,
	mspa_linear_2015_sqkm,
	lcc_esa_country_land_sqkm,
	lcc_esa_country_land_prot_sqkm,
	lcc_esa_lc1_1995,
	lcc_esa_lc1_2020,
	lcc_esa_land_sqkm,
	lcc_esa_land_prot_sqkm,
	lc_copernicus_code,
	lc_copernicus_tot_sqkm,
	lc_copernicus_prot_sqkm,
	lc_copernicus_land_sqkm,
	lc_copernicus_land_prot_sqkm,
	lc_copernicus_marine_sqkm,
	lc_copernicus_marine_prot_sqkm,
	lc_copernicus_land_natural_sqkm,
	lc_copernicus_land_natural_prot_sqkm,
	lc_copernicus_land_forest_sqkm,
	lc_copernicus_land_forest_prot_sqkm,
	lc_copernicus_land_water_sqkm,
	lc_copernicus_land_water_prot_sqkm
    FROM dopa_50.dopa_country_all_inds
    WHERE country_code IS NULL
       OR UPPER(country_code) = CASE 
                                   WHEN code_type = 'iso2' THEN iso2
                                   ELSE iso3
                                 END
    ORDER BY country_id;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_country_all_inds(text, text) TO h05ibex;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_country_all_inds(text, text) TO h05ibexro;
COMMENT ON FUNCTION dopa_50.get_dopa_country_all_inds(text, text)
    IS 'ISO2/ISO3 country code (not case sensitive, accepts single values; e.g., ''IT'', ''fr'', ''FR|IT'').
code_type: ''iso2'' or ''iso3'' (default ''iso3''), defines which column to filter on.';
--------------------------------------------------------------------
-- FUNCTION: dopa_50.get_dopa_wdpa_all_inds(integer)
--------------------------------------------------------------------
DROP FUNCTION IF EXISTS dopa_50.get_dopa_wdpa_all_inds(integer);
--------------------------------------------------------------------
-- Naterialized View: dopa_50.dopa_wdpa_all_inds_template
--------------------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS dopa_50.dopa_wdpa_all_inds_template;
CREATE MATERIALIZED VIEW IF NOT EXISTS dopa_50.dopa_wdpa_all_inds_template AS
SELECT
	dopa_wdpa_all_inds.wdpaid,
	dopa_wdpa_all_inds.pa_name,
	dopa_wdpa_all_inds.desig_eng,
	dopa_wdpa_all_inds.iucn_cat,
	dopa_wdpa_all_inds.marine,
	dopa_wdpa_all_inds.is_n2k,
	dopa_wdpa_all_inds.iso3,
	dopa_wdpa_all_inds.type,
	dopa_wdpa_all_inds.area_geo,
	dopa_wdpa_all_inds.pa_rtot_sqkm,
	dopa_wdpa_all_inds.agb_min_c_mg,
	dopa_wdpa_all_inds.agb_max_c_mg,
	dopa_wdpa_all_inds.agb_mean_c_mg,
	dopa_wdpa_all_inds.agb_tot_c_mg,
	dopa_wdpa_all_inds.bgb_min_c_mg,
	dopa_wdpa_all_inds.bgb_max_c_mg,
	dopa_wdpa_all_inds.bgb_mean_c_mg,
	dopa_wdpa_all_inds.bgb_tot_c_mg,
	dopa_wdpa_all_inds.dwc_min_c_mg,
	dopa_wdpa_all_inds.dwc_max_c_mg,
	dopa_wdpa_all_inds.dwc_mean_c_mg,
	dopa_wdpa_all_inds.dwc_tot_c_mg,
	dopa_wdpa_all_inds.ltc_min_c_mg,
	dopa_wdpa_all_inds.ltc_max_c_mg,
	dopa_wdpa_all_inds.ltc_mean_c_mg,
	dopa_wdpa_all_inds.ltc_tot_c_mg,
	dopa_wdpa_all_inds.gsoc_min_c_mg,
	dopa_wdpa_all_inds.gsoc_max_c_mg,
	dopa_wdpa_all_inds.gsoc_mean_c_mg,
	dopa_wdpa_all_inds.gsoc_tot_c_mg,
	dopa_wdpa_all_inds.carbon_min_c_mg,
	dopa_wdpa_all_inds.carbon_max_c_mg,
	dopa_wdpa_all_inds.carbon_mean_c_mg,
	dopa_wdpa_all_inds.carbon_tot_c_mg,
	dopa_wdpa_all_inds.cli_tmax_01,
	dopa_wdpa_all_inds.cli_tmax_02,
	dopa_wdpa_all_inds.cli_tmax_03,
	dopa_wdpa_all_inds.cli_tmax_04,
	dopa_wdpa_all_inds.cli_tmax_05,
	dopa_wdpa_all_inds.cli_tmax_06,
	dopa_wdpa_all_inds.cli_tmax_07,
	dopa_wdpa_all_inds.cli_tmax_08,
	dopa_wdpa_all_inds.cli_tmax_09,
	dopa_wdpa_all_inds.cli_tmax_10,
	dopa_wdpa_all_inds.cli_tmax_11,
	dopa_wdpa_all_inds.cli_tmax_12,
	dopa_wdpa_all_inds.cli_tmean_01,
	dopa_wdpa_all_inds.cli_tmean_02,
	dopa_wdpa_all_inds.cli_tmean_03,
	dopa_wdpa_all_inds.cli_tmean_04,
	dopa_wdpa_all_inds.cli_tmean_05,
	dopa_wdpa_all_inds.cli_tmean_06,
	dopa_wdpa_all_inds.cli_tmean_07,
	dopa_wdpa_all_inds.cli_tmean_08,
	dopa_wdpa_all_inds.cli_tmean_09,
	dopa_wdpa_all_inds.cli_tmean_10,
	dopa_wdpa_all_inds.cli_tmean_11,
	dopa_wdpa_all_inds.cli_tmean_12,
	dopa_wdpa_all_inds.cli_tmin_01,
	dopa_wdpa_all_inds.cli_tmin_02,
	dopa_wdpa_all_inds.cli_tmin_03,
	dopa_wdpa_all_inds.cli_tmin_04,
	dopa_wdpa_all_inds.cli_tmin_05,
	dopa_wdpa_all_inds.cli_tmin_06,
	dopa_wdpa_all_inds.cli_tmin_07,
	dopa_wdpa_all_inds.cli_tmin_08,
	dopa_wdpa_all_inds.cli_tmin_09,
	dopa_wdpa_all_inds.cli_tmin_10,
	dopa_wdpa_all_inds.cli_tmin_11,
	dopa_wdpa_all_inds.cli_tmin_12,
	dopa_wdpa_all_inds.cli_prec_01,
	dopa_wdpa_all_inds.cli_prec_02,
	dopa_wdpa_all_inds.cli_prec_03,
	dopa_wdpa_all_inds.cli_prec_04,
	dopa_wdpa_all_inds.cli_prec_05,
	dopa_wdpa_all_inds.cli_prec_06,
	dopa_wdpa_all_inds.cli_prec_07,
	dopa_wdpa_all_inds.cli_prec_08,
	dopa_wdpa_all_inds.cli_prec_09,
	dopa_wdpa_all_inds.cli_prec_10,
	dopa_wdpa_all_inds.cli_prec_11,
	dopa_wdpa_all_inds.cli_prec_12,
	dopa_wdpa_all_inds.elev_min,
	dopa_wdpa_all_inds.elev_max,
	dopa_wdpa_all_inds.elev_mean,
	dopa_wdpa_all_inds.gfc_gain_sqkm,
	dopa_wdpa_all_inds.gfc_gain_perc_tot,
	dopa_wdpa_all_inds.gfc_loss_sqkm,
	dopa_wdpa_all_inds.gfc_loss_perc_tot,
	dopa_wdpa_all_inds.gfc_treecover_land_sqkm,
	dopa_wdpa_all_inds.gfc_treecover_land_perc_pa_land,
	dopa_wdpa_all_inds.hdi_freq,
	dopa_wdpa_all_inds.hdi_awhd,
	dopa_wdpa_all_inds.mhdi,
	dopa_wdpa_all_inds.water_p_now_sqkm,
	dopa_wdpa_all_inds.water_p_1985_sqkm,
	dopa_wdpa_all_inds.water_p_netchange_sqkm,
	dopa_wdpa_all_inds.water_p_netchange_perc_first_epoch,
	dopa_wdpa_all_inds.water_s_now_sqkm,
	dopa_wdpa_all_inds.water_s_1985_sqkm,
	dopa_wdpa_all_inds.water_s_netchange_sqkm,
	dopa_wdpa_all_inds.water_s_netchange_perc_first_epoch,
	dopa_wdpa_all_inds.lpd_null_sqkm,
	dopa_wdpa_all_inds.lpd_null_perc_tot_sqkm,
	dopa_wdpa_all_inds.lpd_severe_sqkm,
	dopa_wdpa_all_inds.lpd_severe_perc_tot_sqkm,
	dopa_wdpa_all_inds.lpd_moderate_sqkm,
	dopa_wdpa_all_inds.lpd_moderate_perc_tot_sqkm,
	dopa_wdpa_all_inds.lpd_stable_stressed_sqkm,
	dopa_wdpa_all_inds.lpd_stable_perc_tot_sqkm,
	dopa_wdpa_all_inds.lpd_stable_sqkm,
	dopa_wdpa_all_inds.lpd_stable_stressed_perc_tot_sqkm,
	dopa_wdpa_all_inds.lpd_increased_sqkm,
	dopa_wdpa_all_inds.lpd_increased_perc_tot_sqkm,
	dopa_wdpa_all_inds.mspa_core_1995_sqkm,
	dopa_wdpa_all_inds.mspa_non_natural_1995_sqkm,
	dopa_wdpa_all_inds.mspa_edge_1995_sqkm,
	dopa_wdpa_all_inds.mspa_core_perforation_1995_sqkm,
	dopa_wdpa_all_inds.mspa_islet_1995_sqkm,
	dopa_wdpa_all_inds.mspa_linear_1995_sqkm,
	dopa_wdpa_all_inds.mspa_core_2000_sqkm,
	dopa_wdpa_all_inds.mspa_non_natural_2000_sqkm,
	dopa_wdpa_all_inds.mspa_edge_2000_sqkm,
	dopa_wdpa_all_inds.mspa_core_perforation_2000_sqkm,
	dopa_wdpa_all_inds.mspa_islet_2000_sqkm,
	dopa_wdpa_all_inds.mspa_linear_2000_sqkm,
	dopa_wdpa_all_inds.mspa_core_2005_sqkm,
	dopa_wdpa_all_inds.mspa_non_natural_2005_sqkm,
	dopa_wdpa_all_inds.mspa_edge_2005_sqkm,
	dopa_wdpa_all_inds.mspa_core_perforation_2005_sqkm,
	dopa_wdpa_all_inds.mspa_islet_2005_sqkm,
	dopa_wdpa_all_inds.mspa_linear_2005_sqkm,
	dopa_wdpa_all_inds.mspa_core_2010_sqkm,
	dopa_wdpa_all_inds.mspa_non_natural_2010_sqkm,
	dopa_wdpa_all_inds.mspa_edge_2010_sqkm,
	dopa_wdpa_all_inds.mspa_core_perforation_2010_sqkm,
	dopa_wdpa_all_inds.mspa_islet_2010_sqkm,
	dopa_wdpa_all_inds.mspa_linear_2010_sqkm,
	dopa_wdpa_all_inds.mspa_core_2015_sqkm,
	dopa_wdpa_all_inds.mspa_non_natural_2015_sqkm,
	dopa_wdpa_all_inds.mspa_edge_2015_sqkm,
	dopa_wdpa_all_inds.mspa_core_perforation_2015_sqkm,
	dopa_wdpa_all_inds.mspa_islet_2015_sqkm,
	dopa_wdpa_all_inds.mspa_linear_2015_sqkm,
	dopa_wdpa_all_inds.p_agriculture_pa_perc_tot,
	dopa_wdpa_all_inds.p_builtup_pa_sqkm,
	dopa_wdpa_all_inds.p_builtup_pa_perc_land,
	dopa_wdpa_all_inds.p_population_pa_last_epoch_sum,
	dopa_wdpa_all_inds.p_population_pa_last_epoch_density,
	dopa_wdpa_all_inds.p_population_pa_density_change,
	dopa_wdpa_all_inds.p_population_pa_change_perc_first_epoch,
	dopa_wdpa_all_inds.p_road_pa_perc_tot,
	dopa_wdpa_all_inds.lc_esa_code,
	dopa_wdpa_all_inds.lc_esa_1995_sqkm,
	dopa_wdpa_all_inds.lc_esa_2000_sqkm,
	dopa_wdpa_all_inds.lc_esa_2005_sqkm,
	dopa_wdpa_all_inds.lc_esa_2010_sqkm,
	dopa_wdpa_all_inds.lc_esa_2015_sqkm,
	dopa_wdpa_all_inds.lc_esa_2020_sqkm,
	dopa_wdpa_all_inds.lcc_esa_pa_tot_sqkm,
	dopa_wdpa_all_inds.lcc_esa_lc1_1995,
	dopa_wdpa_all_inds.lcc_esa_lc1_2020,
	dopa_wdpa_all_inds.lcc_esa_sqkm,
	dopa_wdpa_all_inds.lc_copernicus_code,
	dopa_wdpa_all_inds.lc_copernicus_tot_sqkm
FROM dopa_50.dopa_wdpa_all_inds
LIMIT 0;
GRANT SELECT ON TABLE dopa_50.dopa_wdpa_all_inds_template TO h05ibexro;
--------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_wdpa_all_inds(
	wdpaid integer DEFAULT NULL::integer)
    RETURNS SETOF dopa_50.dopa_wdpa_all_inds_template 
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
sql TEXT;
BEGIN
sql :='
SELECT * FROM dopa_50.dopa_wdpa_all_inds';
IF wdpaid IS NOT NULL THEN
			sql := sql || ' WHERE wdpaid = $1;';
ELSE	sql := sql || ';';
END IF;
RETURN QUERY EXECUTE sql USING wdpaid;
END;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_wdpa_all_inds(integer) TO h05ibexro;
--------------------------------------------------------------------
-- FUNCTION: dopa_50.get_dopa_country_pa_count(text, boolean)
--------------------------------------------------------------------
DROP FUNCTION IF EXISTS dopa_50.get_dopa_country_pa_count(text, boolean);
--------------------------------------------------------------------
-- View: dopa_50.dopa_country_pa_count_template
--------------------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS dopa_50.dopa_country_pa_count_template;
CREATE MATERIALIZED VIEW IF NOT EXISTS dopa_50.dopa_country_pa_count_template AS
 WITH a0 AS (
         SELECT DISTINCT a.iso3
           FROM dopa_50.dopa_wdpa_all_inds a
          WHERE a.iso3 ~~* 'ITA'::text
        ), a1 AS (
         SELECT dopa_wdpa_all_inds.iso3,
            dopa_wdpa_all_inds.wdpaid AS pa,
            dopa_wdpa_all_inds.marine,
            dopa_wdpa_all_inds.type,
            sum(dopa_wdpa_all_inds.area_geo) AS sqkm
           FROM dopa_50.dopa_wdpa_all_inds
          WHERE dopa_wdpa_all_inds.iso3 ~~* '%ITA%'::text
          GROUP BY dopa_wdpa_all_inds.iso3, dopa_wdpa_all_inds.wdpaid, dopa_wdpa_all_inds.marine, dopa_wdpa_all_inds.type
        ), b1 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count
           FROM a1
          GROUP BY a1.iso3
        ), b2 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_o1
           FROM a1
          WHERE a1.sqkm > 1::double precision
          GROUP BY a1.iso3
        ), b3 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_points
           FROM a1
          WHERE a1.type = 'Point'::text
          GROUP BY a1.iso3
        ), b4 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_points_o1
           FROM a1
          WHERE a1.type = 'Point'::text AND a1.sqkm > 1::double precision
          GROUP BY a1.iso3
        ), b5 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_polygons
           FROM a1
          WHERE a1.type = 'Polygon'::text
          GROUP BY a1.iso3
        ), b6 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_polygons_o1
           FROM a1
          WHERE a1.type = 'Polygon'::text AND a1.sqkm > 1::double precision
          GROUP BY a1.iso3
        ), b7 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_points_terrestrial
           FROM a1
          WHERE a1.type = 'Point'::text AND a1.marine = 0
          GROUP BY a1.iso3
        ), b8 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_points_terrestrial_o1
           FROM a1
          WHERE a1.type = 'Point'::text AND a1.marine = 0 AND a1.sqkm > 1::double precision
          GROUP BY a1.iso3
        ), b9 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_points_marine
           FROM a1
          WHERE a1.type = 'Point'::text AND a1.marine = 2
          GROUP BY a1.iso3
        ), b10 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_points_marine_o1
           FROM a1
          WHERE a1.type = 'Point'::text AND a1.marine = 2 AND a1.sqkm > 1::double precision
          GROUP BY a1.iso3
        ), b11 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_points_coastal
           FROM a1
          WHERE a1.type = 'Point'::text AND a1.marine = 1
          GROUP BY a1.iso3
        ), b12 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_points_coastal_o1
           FROM a1
          WHERE a1.type = 'Point'::text AND a1.marine = 1
          GROUP BY a1.iso3
        ), b13 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_polygons_terrestrial
           FROM a1
          WHERE a1.type = 'Polygon'::text AND a1.marine = 0
          GROUP BY a1.iso3
        ), b14 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_polygons_terrestrial_o1
           FROM a1
          WHERE a1.type = 'Polygon'::text AND a1.marine = 0 AND a1.sqkm > 1::double precision
          GROUP BY a1.iso3
        ), b15 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_polygons_marine
           FROM a1
          WHERE a1.type = 'Polygon'::text AND a1.marine = 2
          GROUP BY a1.iso3
        ), b16 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_polygons_marine_o1
           FROM a1
          WHERE a1.type = 'Polygon'::text AND a1.marine = 2 AND a1.sqkm > 1::double precision
          GROUP BY a1.iso3
        ), b17 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_polygons_coastal
           FROM a1
          WHERE a1.type = 'Polygon'::text AND a1.marine = 1
          GROUP BY a1.iso3
        ), b18 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_polygons_coastal_o1
           FROM a1
          WHERE a1.type = 'Polygon'::text AND a1.marine = 1 AND a1.sqkm > 1::double precision
          GROUP BY a1.iso3
        ), c0 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_terrestrial_below_1
           FROM a1
          WHERE a1.marine < 2 AND a1.sqkm <= 1::double precision
          GROUP BY a1.iso3
        ), c1 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_terrestrial_1_10
           FROM a1
          WHERE a1.marine < 2 AND a1.sqkm > 1::double precision AND a1.sqkm <= 10::double precision
          GROUP BY a1.iso3
        ), c2 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_terrestrial_10_100
           FROM a1
          WHERE a1.marine < 2 AND a1.sqkm > 10::double precision AND a1.sqkm <= 100::double precision
          GROUP BY a1.iso3
        ), c3 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_terrestrial_100_1000
           FROM a1
          WHERE a1.marine < 2 AND a1.sqkm > 100::double precision AND a1.sqkm <= 1000::double precision
          GROUP BY a1.iso3
        ), c4 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_terrestrial_1000_10000
           FROM a1
          WHERE a1.marine < 2 AND a1.sqkm > 1000::double precision AND a1.sqkm <= 10000::double precision
          GROUP BY a1.iso3
        ), c5 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_terrestrial_10000_100000
           FROM a1
          WHERE a1.marine < 2 AND a1.sqkm > 10000::double precision AND a1.sqkm <= 100000::double precision
          GROUP BY a1.iso3
        ), c6 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_terrestrial_over_100000
           FROM a1
          WHERE a1.marine < 2 AND a1.sqkm > 100000::double precision
          GROUP BY a1.iso3
        ), c70 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_marine_below_1
           FROM a1
          WHERE a1.marine = 2 AND a1.sqkm <= 1::double precision
          GROUP BY a1.iso3
        ), c7 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_marine_1_10
           FROM a1
          WHERE a1.marine = 2 AND a1.sqkm > 1::double precision AND a1.sqkm <= 10::double precision
          GROUP BY a1.iso3
        ), c8 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_marine_10_100
           FROM a1
          WHERE a1.marine = 2 AND a1.sqkm > 10::double precision AND a1.sqkm <= 100::double precision
          GROUP BY a1.iso3
        ), c9 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_marine_100_1000
           FROM a1
          WHERE a1.marine = 2 AND a1.sqkm > 100::double precision AND a1.sqkm <= 1000::double precision
          GROUP BY a1.iso3
        ), c10 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_marine_1000_10000
           FROM a1
          WHERE a1.marine = 2 AND a1.sqkm > 1000::double precision AND a1.sqkm <= 10000::double precision
          GROUP BY a1.iso3
        ), c11 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_marine_10000_100000
           FROM a1
          WHERE a1.marine = 2 AND a1.sqkm > 10000::double precision AND a1.sqkm <= 100000::double precision
          GROUP BY a1.iso3
        ), c12 AS (
         SELECT a1.iso3,
            count(a1.pa)::numeric AS pa_count_marine_over_100000
           FROM a1
          WHERE a1.marine = 2 AND a1.sqkm > 100000::double precision
          GROUP BY a1.iso3
        )
 SELECT a0.iso3,
    b1.pa_count,
    b2.pa_count_o1,
    b3.pa_count_points,
    b4.pa_count_points_o1,
    b5.pa_count_polygons,
    b6.pa_count_polygons_o1,
    b7.pa_count_points_terrestrial,
    b8.pa_count_points_terrestrial_o1,
    b9.pa_count_points_marine,
    b10.pa_count_points_marine_o1,
    b11.pa_count_points_coastal,
    b12.pa_count_points_coastal_o1,
    b13.pa_count_polygons_terrestrial,
    b14.pa_count_polygons_terrestrial_o1,
    b15.pa_count_polygons_marine,
    b16.pa_count_polygons_marine_o1,
    b17.pa_count_polygons_coastal,
    b18.pa_count_polygons_coastal_o1,
    c0.pa_count_terrestrial_below_1,
    c1.pa_count_terrestrial_1_10,
    c2.pa_count_terrestrial_10_100,
    c3.pa_count_terrestrial_100_1000,
    c4.pa_count_terrestrial_1000_10000,
    c5.pa_count_terrestrial_10000_100000,
    c6.pa_count_terrestrial_over_100000,
    c70.pa_count_marine_below_1,
    c7.pa_count_marine_1_10,
    c8.pa_count_marine_10_100,
    c9.pa_count_marine_100_1000,
    c10.pa_count_marine_1000_10000,
    c11.pa_count_marine_10000_100000,
    c12.pa_count_marine_over_100000
   FROM a0
     LEFT JOIN b1 USING (iso3)
     LEFT JOIN b2 USING (iso3)
     LEFT JOIN b3 USING (iso3)
     LEFT JOIN b4 USING (iso3)
     LEFT JOIN b5 USING (iso3)
     LEFT JOIN b6 USING (iso3)
     LEFT JOIN b7 USING (iso3)
     LEFT JOIN b8 USING (iso3)
     LEFT JOIN b9 USING (iso3)
     LEFT JOIN b10 USING (iso3)
     LEFT JOIN b11 USING (iso3)
     LEFT JOIN b12 USING (iso3)
     LEFT JOIN b13 USING (iso3)
     LEFT JOIN b14 USING (iso3)
     LEFT JOIN b15 USING (iso3)
     LEFT JOIN b16 USING (iso3)
     LEFT JOIN b17 USING (iso3)
     LEFT JOIN b18 USING (iso3)
     LEFT JOIN c0 USING (iso3)
     LEFT JOIN c1 USING (iso3)
     LEFT JOIN c2 USING (iso3)
     LEFT JOIN c3 USING (iso3)
     LEFT JOIN c4 USING (iso3)
     LEFT JOIN c5 USING (iso3)
     LEFT JOIN c6 USING (iso3)
     LEFT JOIN c70 USING (iso3)
     LEFT JOIN c7 USING (iso3)
     LEFT JOIN c8 USING (iso3)
     LEFT JOIN c9 USING (iso3)
     LEFT JOIN c10 USING (iso3)
     LEFT JOIN c11 USING (iso3)
     LEFT JOIN c12 USING (iso3)
  WHERE a0.iso3 ~~* '%ITA%'::text
 LIMIT 0;
GRANT SELECT ON TABLE dopa_50.dopa_country_pa_count_template TO h05ibexro;
--------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_country_pa_count(
	iso3 text DEFAULT NULL::text,
	status_multi boolean DEFAULT false)
    RETURNS SETOF dopa_50.dopa_country_pa_count_template 
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
sql TEXT;
BEGIN
sql := 'WITH a0 AS (SELECT DISTINCT iso3::text FROM dopa_50.dopa_wdpa_all_inds';
IF iso3 IS NOT NULL THEN
		IF status_multi IS FALSE THEN sql := sql || ' WHERE iso3 = $1 ),';
		ELSE sql := sql || ' WHERE iso3 ILIKE ''%'||$1||'%'' ),';
		END IF;
	ELSE sql := sql || '),';
END IF;
sql := sql || '
a1 AS (SELECT iso3,wdpaid pa,marine,type,SUM(area_geo) sqkm FROM dopa_50.dopa_wdpa_all_inds';
IF iso3 IS NOT NULL THEN sql := sql || ' WHERE iso3 ILIKE ''%'||$1||'%''';
END IF;
sql := sql || ' 
GROUP BY iso3,pa,marine,type),
b1 AS (SELECT iso3,COUNT(pa)::numeric pa_count FROM a1 GROUP BY iso3),
b2 AS (SELECT iso3,COUNT(pa)::numeric pa_count_o1 FROM a1 WHERE sqkm > 1 GROUP BY iso3 ),
b3 AS (SELECT iso3,COUNT(pa)::numeric pa_count_points FROM a1 WHERE type=''Point'' GROUP BY iso3),
b4 AS (SELECT iso3,COUNT(pa)::numeric pa_count_points_o1 FROM a1 WHERE type=''Point'' AND sqkm > 1 GROUP BY iso3),
b5 AS (SELECT iso3,COUNT(pa)::numeric pa_count_polygons FROM a1 WHERE type=''Polygon'' GROUP BY iso3),
b6 AS (SELECT iso3,COUNT(pa)::numeric pa_count_polygons_o1 FROM a1 WHERE type=''Polygon'' AND sqkm > 1 GROUP BY iso3),
b7 AS (SELECT iso3,COUNT(pa)::numeric pa_count_points_terrestrial FROM a1 WHERE type=''Point'' AND marine=0 GROUP BY iso3),
b8 AS (SELECT iso3,COUNT(pa)::numeric pa_count_points_terrestrial_o1 FROM a1 WHERE type=''Point'' AND marine=0 AND sqkm > 1 GROUP BY iso3),
b9 AS (SELECT iso3,COUNT(pa)::numeric pa_count_points_marine FROM a1 WHERE type=''Point'' AND marine=2 GROUP BY iso3),
b10 AS (SELECT iso3,COUNT(pa)::numeric pa_count_points_marine_o1 FROM a1 WHERE type=''Point'' AND marine=2 AND sqkm > 1 GROUP BY iso3),
b11 AS (SELECT iso3,COUNT(pa)::numeric pa_count_points_coastal FROM a1 WHERE type=''Point'' AND marine=1 GROUP BY iso3),
b12 AS (SELECT iso3,COUNT(pa)::numeric pa_count_points_coastal_o1 FROM a1 WHERE type=''Point'' AND marine=1 GROUP BY iso3),
b13 AS (SELECT iso3,COUNT(pa)::numeric pa_count_polygons_terrestrial FROM a1 WHERE type=''Polygon'' AND marine=0 GROUP BY iso3),
b14 AS (SELECT iso3,COUNT(pa)::numeric pa_count_polygons_terrestrial_o1 FROM a1 WHERE type=''Polygon'' AND marine=0 AND sqkm > 1 GROUP BY iso3),
b15 AS (SELECT iso3,COUNT(pa)::numeric pa_count_polygons_marine FROM a1 WHERE type=''Polygon'' AND marine=2 GROUP BY iso3),
b16 AS (SELECT iso3,COUNT(pa)::numeric pa_count_polygons_marine_o1 FROM a1 WHERE type=''Polygon'' AND marine=2 AND sqkm > 1 GROUP BY iso3),
b17 AS (SELECT iso3,COUNT(pa)::numeric pa_count_polygons_coastal FROM a1 WHERE type=''Polygon'' AND marine=1 GROUP BY iso3),
b18 AS (SELECT iso3,COUNT(pa)::numeric pa_count_polygons_coastal_o1 FROM a1 WHERE type=''Polygon'' AND marine=1 AND sqkm > 1 GROUP BY iso3),
c0 AS (SELECT iso3,COUNT(pa)::numeric pa_count_terrestrial_below_1 FROM a1 WHERE marine<2 AND sqkm <=1 GROUP BY iso3),--------------------------------------------- ADDED
c1 AS (SELECT iso3,COUNT(pa)::numeric pa_count_terrestrial_1_10 FROM a1 WHERE marine<2 AND sqkm >= 1 AND sqkm <= 10 GROUP BY iso3),
c2 AS (SELECT iso3,COUNT(pa)::numeric pa_count_terrestrial_10_100 FROM a1 WHERE marine<2 AND sqkm > 10 AND  sqkm <= 100 GROUP BY iso3),
c3 AS (SELECT iso3,COUNT(pa)::numeric pa_count_terrestrial_100_1000 FROM a1 WHERE marine<2 AND sqkm > 100 AND  sqkm <= 1000 GROUP BY iso3),
c4 AS (SELECT iso3,COUNT(pa)::numeric pa_count_terrestrial_1000_10000 FROM a1 WHERE marine<2 AND sqkm > 1000 AND  sqkm <= 10000 GROUP BY iso3),
c5 AS (SELECT iso3,COUNT(pa)::numeric pa_count_terrestrial_10000_100000 FROM a1 WHERE marine<2 AND sqkm > 10000 AND sqkm <= 100000 GROUP BY iso3),
c6 AS (SELECT iso3,COUNT(pa)::numeric pa_count_terrestrial_over_100000 FROM a1 WHERE marine<2 AND sqkm > 100000  GROUP BY iso3),
c70 AS (SELECT iso3,COUNT(pa)::numeric pa_count_marine_below_1 FROM a1 WHERE marine=2 AND sqkm <=1 GROUP BY iso3),------------------------------------------------- ADDED
c7 AS (SELECT iso3,COUNT(pa)::numeric pa_count_marine_1_10 FROM a1 WHERE marine=2 AND sqkm >= 1 AND sqkm <= 10 GROUP BY iso3),
c8 AS (SELECT iso3,COUNT(pa)::numeric pa_count_marine_10_100 FROM a1 WHERE marine=2 AND sqkm > 10 AND  sqkm <= 100 GROUP BY iso3),
c9 AS (SELECT iso3,COUNT(pa)::numeric pa_count_marine_100_1000 FROM a1 WHERE marine=2 AND sqkm > 100 AND  sqkm <= 1000 GROUP BY iso3),
c10 AS (SELECT iso3,COUNT(pa)::numeric pa_count_marine_1000_10000 FROM a1 WHERE marine=2 AND sqkm > 1000 AND  sqkm <= 10000 GROUP BY iso3),
c11 AS (SELECT iso3,COUNT(pa)::numeric pa_count_marine_10000_100000 FROM a1 WHERE marine=2 AND sqkm > 10000 AND sqkm <= 100000 GROUP BY iso3),
c12 AS (SELECT iso3,COUNT(pa)::numeric pa_count_marine_over_100000 FROM a1 WHERE marine=2 AND sqkm > 100000  GROUP BY iso3)
SELECT * FROM a0
LEFT JOIN b1 USING(iso3)
LEFT JOIN b2 USING(iso3)
LEFT JOIN b3 USING(iso3)
LEFT JOIN b4 USING(iso3)
LEFT JOIN b5 USING(iso3)
LEFT JOIN b6 USING(iso3)
LEFT JOIN b7 USING(iso3)
LEFT JOIN b8 USING(iso3)
LEFT JOIN b9 USING(iso3)
LEFT JOIN b10 USING(iso3)
LEFT JOIN b11 USING(iso3)
LEFT JOIN b12 USING(iso3)
LEFT JOIN b13 USING(iso3)
LEFT JOIN b14 USING(iso3)
LEFT JOIN b15 USING(iso3)
LEFT JOIN b16 USING(iso3)
LEFT JOIN b17 USING(iso3)
LEFT JOIN b18 USING(iso3)
LEFT JOIN c0 USING(iso3)--------------------------------------------- ADDED
LEFT JOIN c1 USING(iso3)
LEFT JOIN c2 USING(iso3)
LEFT JOIN c3 USING(iso3)
LEFT JOIN c4 USING(iso3)
LEFT JOIN c5 USING(iso3)
LEFT JOIN c6 USING(iso3)
LEFT JOIN c70 USING(iso3)--------------------------------------------- ADDED
LEFT JOIN c7 USING(iso3)
LEFT JOIN c8 USING(iso3)
LEFT JOIN c9 USING(iso3)
LEFT JOIN c10 USING(iso3)
LEFT JOIN c11 USING(iso3)
LEFT JOIN c12 USING(iso3)
;';
RETURN QUERY EXECUTE sql USING iso3,status_multi;
END;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_country_pa_count(text, boolean) TO h05ibex;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_country_pa_count(text, boolean) TO h05ibexro;
COMMENT ON FUNCTION dopa_50.get_dopa_country_pa_count(text, boolean) IS 
'Calculate number of protected areas in country (using iso3 reported by WCMC), with different aggregations (poly, points; terrestrial, marine, coastal; area over x sqkm); It reports the number of multi-country protected areas included in calculation.'
;
--------------------------------------------------------------------
--FUNCTION: dopa_50.get_dopa_country_lcc_esa(text, text)
--------------------------------------------------------------------
DROP FUNCTION IF EXISTS dopa_50.get_dopa_country_lcc_esa(text, text) CASCADE;
--------------------------------------------------------------------
--FUNCTION: dopa_50.dopa_country_lcc_esa_template(text, text)
--------------------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS dopa_50.dopa_country_lcc_esa_template;
CREATE MATERIALIZED VIEW IF NOT EXISTS dopa_50.dopa_country_lcc_esa_template AS
WITH lca AS (
SELECT
a.country_id,
a.country_name,
a.iso3,
a.iso2,
a.status,
t.lc1_1995,
t.lc1_2020,
t.land_sqkm,
t.land_prot_sqkm,
t.ordinality
FROM dopa_50.dopa_country_all_inds a,
LATERAL UNNEST(a.lcc_esa_lc1_1995, a.lcc_esa_lc1_2020, a.lcc_esa_land_sqkm, a.lcc_esa_land_prot_sqkm) WITH ORDINALITY t(lc1_1995, lc1_2020, land_sqkm, land_prot_sqkm, ordinality)
),
lccodes AS (
SELECT DISTINCT class_lc_esa.lc1_code,
class_lc_esa.lc1_class AS lc1
FROM dopa_50.class_lc_esa
WHERE class_lc_esa.lc1_code IS NOT NULL
ORDER BY class_lc_esa.lc1_code
),
countries AS (
SELECT DISTINCT
a.country_id,
a.iso3,
a.iso2,
a.status
FROM lca a
),
ids AS (
SELECT y.y
FROM generate_series(1, 4) y(y)
),
countries_years_id AS (
SELECT
a.country_id,
a.iso3,
a.iso2,
a.status,
b.y AS y1,
c.y AS y2
FROM countries a,
ids b,
ids c
ORDER BY a.country_id, b.y, c.y
),
"out" AS (
SELECT
a.country_id,
a.iso3,
a.iso2,
a.status,
a.y1,
a.y2,
c.lc1 AS lc1_1995,
d.lc1 AS lc1_2020,
b.land_sqkm::numeric AS land_sqkm,
b.land_prot_sqkm::numeric AS land_prot_sqkm
FROM countries_years_id a
JOIN lca b ON a.country_id = b.country_id AND a.y1 = b.lc1_1995 AND a.y2 = b.lc1_2020
JOIN lccodes c ON a.y1 = c.lc1_code
JOIN lccodes d ON a.y2 = d.lc1_code
WHERE a.y1 <> a.y2
ORDER BY a.country_id, a.y1, a.y2
)
SELECT "out".country_id,
"out".iso3,
"out".iso2,
"out".status,
"out".y1,
"out".lc1_1995,
"out".y2,
"out".lc1_2020,
"out".land_sqkm AS lcc_sqkm,
"out".land_prot_sqkm AS lcc_prot_sqkm
FROM "out"
ORDER BY "out".country_id, "out".y1, "out".y2
LIMIT 0;
GRANT SELECT ON TABLE dopa_50.dopa_country_lcc_esa_template TO h05ibexro;
----------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_country_lcc_esa(
    country_code text DEFAULT NULL,
    code_type text DEFAULT 'iso3'
)
RETURNS SETOF dopa_50.dopa_country_lcc_esa_template
LANGUAGE plpgsql
AS $BODY$

DECLARE
sql TEXT;

BEGIN

sql := '
WITH lca AS (
    SELECT
        a.country_id,
        a.country_name,
        a.iso3,
        a.iso2,
        a.status,
        t.lc1_1995,
        t.lc1_2020,
        t.land_sqkm,
        t.land_prot_sqkm,
        t.ordinality
    FROM dopa_50.dopa_country_all_inds a,
    LATERAL UNNEST(
        a.lcc_esa_lc1_1995,
        a.lcc_esa_lc1_2020,
        a.lcc_esa_land_sqkm,
        a.lcc_esa_land_prot_sqkm
    ) WITH ORDINALITY t(
        lc1_1995,
        lc1_2020,
        land_sqkm,
        land_prot_sqkm
    )
    WHERE
        $1 IS NULL
        OR UPPER($1) = CASE
            WHEN ' || quote_literal(code_type) || ' = ''iso2'' THEN a.iso2
            ELSE a.iso3
        END
),
lccodes AS (
    SELECT DISTINCT
        lc1_code,
        lc1_class AS lc1
    FROM dopa_50.class_lc_esa
    WHERE lc1_code IS NOT NULL
),
countries AS (
    SELECT DISTINCT
        country_id,
        iso3,
        iso2,
        status
    FROM lca
),
ids AS (
    SELECT generate_series(1,4) AS y
),
countries_years_id AS (
    SELECT
        a.country_id,
        a.iso3,
        a.iso2,
        a.status,
        b.y AS y1,
        c.y AS y2
    FROM countries a,
    ids b,
    ids c
),
out AS (
    SELECT
        a.country_id,
        a.iso3,
        a.iso2,
        a.status,
        a.y1,
        a.y2,
        c.lc1 AS lc1_1995,
        d.lc1 AS lc1_2020,
        b.land_sqkm::numeric AS lcc_sqkm,
        b.land_prot_sqkm::numeric AS lcc_prot_sqkm
    FROM countries_years_id a
    JOIN lca b
        ON a.country_id = b.country_id
       AND a.y1 = b.lc1_1995
       AND a.y2 = b.lc1_2020
    JOIN lccodes c ON a.y1 = c.lc1_code
    JOIN lccodes d ON a.y2 = d.lc1_code
    WHERE a.y1 <> a.y2
)

SELECT
country_id,
iso3,
iso2,
status,
y1,
lc1_1995,
y2,
lc1_2020,
lcc_sqkm,
lcc_prot_sqkm
FROM out
ORDER BY country_id, y1, y2;
';
RETURN QUERY EXECUTE sql USING country_code;
END;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_country_lcc_esa(text, text) TO h05ibexro;
-------------------------------------------------------------------------------------
-- FUNCTION: dopa_50.get_dopa_country_lcc_esa_percent()
-------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS dopa_50.get_dopa_country_lcc_esa_percent(text, text);
-------------------------------------------------------------------------------------
-- MATERIALIZED VIEW: dopa_50.dopa_country_lcc_esa_percent_template
-------------------------------------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS dopa_50.dopa_country_lcc_esa_percent_template;
CREATE MATERIALIZED VIEW IF NOT EXISTS dopa_50.dopa_country_lcc_esa_percent_template AS
WITH lcc AS (
    SELECT
        country_id,
        SUM(lcc_sqkm) AS lcc_sqkm,
        SUM(lcc_prot_sqkm) AS lcc_prot_sqkm
    FROM dopa_50.get_dopa_country_lcc_esa()
    GROUP BY country_id
),
out AS (
    SELECT
        a.country_id,
        a.iso3,
        a.iso2,
        a.status,
        a.lcc_esa_country_land_sqkm,
        a.lcc_esa_country_land_prot_sqkm,

        lcc.lcc_sqkm,

        (lcc.lcc_sqkm::double precision /
            NULLIF(a.lcc_esa_country_land_sqkm,0) * 100)::numeric
            AS lcc_perc_country_land,

        lcc.lcc_prot_sqkm,

        (lcc.lcc_prot_sqkm::double precision /
            NULLIF(a.lcc_esa_country_land_prot_sqkm,0) * 100)::numeric
            AS lcc_prot_perc_country_land_prot

    FROM dopa_50.dopa_country_all_inds a
    JOIN lcc USING (country_id)
)
SELECT *
FROM out
LIMIT 0;

GRANT SELECT ON TABLE dopa_50.dopa_country_lcc_esa_percent_template
TO h05ibexro;
-------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_country_lcc_esa_percent(
    country_code text DEFAULT NULL,
    code_type text DEFAULT 'iso3'
)
RETURNS SETOF dopa_50.dopa_country_lcc_esa_percent_template
LANGUAGE plpgsql
AS $BODY$

DECLARE
sql TEXT;

BEGIN

sql := '
WITH lcc AS (
    SELECT
        country_id,
        SUM(lcc_sqkm) AS lcc_sqkm,
        SUM(lcc_prot_sqkm) AS lcc_prot_sqkm
    FROM dopa_50.get_dopa_country_lcc_esa(';

IF country_code IS NOT NULL THEN
    sql := sql || 'UPPER($1), ' || quote_literal(code_type);
ELSE
    sql := sql || 'NULL, ' || quote_literal(code_type);
END IF;

sql := sql || '
    )
    GROUP BY country_id
),

out AS (
    SELECT
        a.country_id,
        a.iso3,
        a.iso2,
        a.status,
        a.lcc_esa_country_land_sqkm,
        a.lcc_esa_country_land_prot_sqkm,

        lcc.lcc_sqkm,

        (lcc.lcc_sqkm::double precision /
            NULLIF(a.lcc_esa_country_land_sqkm,0) * 100)::numeric
            AS lcc_perc_country_land,

        lcc.lcc_prot_sqkm,

        (lcc.lcc_prot_sqkm::double precision /
            NULLIF(a.lcc_esa_country_land_prot_sqkm,0) * 100)::numeric
            AS lcc_prot_perc_country_land_prot

    FROM dopa_50.dopa_country_all_inds a
    JOIN lcc USING (country_id)
)

SELECT
country_id,
iso3,
iso2,
status,
lcc_esa_country_land_sqkm,
lcc_esa_country_land_prot_sqkm,
lcc_sqkm,
lcc_perc_country_land,
lcc_prot_sqkm,
lcc_prot_perc_country_land_prot
FROM out
ORDER BY country_id;
';

RETURN QUERY EXECUTE sql USING country_code;

END;
$BODY$;

GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_country_lcc_esa_percent(text, text) TO h05ibexro;
--------------------------------------------------------------------------------
-- FUNCTION: dopa_50.get_dopa_country_lc_copernicus()
--------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS dopa_50.get_dopa_country_lc_copernicus(text,text,integer);
--------------------------------------------------------------------------------
-- MATERIALIZED VIEW dopa_50.dopa_country_lc_copernicus_template
--------------------------------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS dopa_50.dopa_country_lc_copernicus_template;
CREATE MATERIALIZED VIEW IF NOT EXISTS dopa_50.dopa_country_lc_copernicus_template
AS
 WITH lca AS (
         SELECT a.country_id,
            a.country_name,
            a.iso3,
            a.iso2,
            a.status,
            t.lc_code,
            t.lc_tot_sqkm,
            t.lc_prot_sqkm,
            t.lc_land_sqkm,
            t.lc_land_prot_sqkm,
            t.lc_marine_sqkm,
            t.lc_marine_prot_sqkm,
            t.ordinality
           FROM dopa_50.dopa_country_all_inds a,
            LATERAL UNNEST(a.lc_copernicus_code, a.lc_copernicus_tot_sqkm, a.lc_copernicus_prot_sqkm, a.lc_copernicus_land_sqkm, a.lc_copernicus_land_prot_sqkm, a.lc_copernicus_marine_sqkm, a.lc_copernicus_marine_prot_sqkm) WITH ORDINALITY t(lc_code, lc_tot_sqkm, lc_prot_sqkm, lc_land_sqkm, lc_land_prot_sqkm, lc_marine_sqkm, lc_marine_prot_sqkm, ordinality)
          WHERE a.country_id = 143
        ), lc0 AS (
         SELECT class_lc_copernicus.lc_code AS lcag_code,
            class_lc_copernicus.lc_class AS lc,
            class_lc_copernicus.lc_code,
            class_lc_copernicus.lc_rgb AS rgb
           FROM dopa_50.class_lc_copernicus
        ), lc2 AS (
         SELECT class_lc_copernicus.lc2_code AS lcag_code,
            class_lc_copernicus.lc2_class AS lc,
            class_lc_copernicus.lc_code,
            class_lc_copernicus.lc2_rgb AS rgb
           FROM dopa_50.class_lc_copernicus
        ), country_land_tot_surface AS (
         SELECT lca.country_id,
            sum(lca.lc_tot_sqkm) AS country_tot_sqkm,
            sum(lca.lc_prot_sqkm) AS country_prot_sqkm,
            sum(lca.lc_land_sqkm) AS country_land_sqkm,
            sum(lca.lc_land_prot_sqkm) AS country_land_prot_sqkm,
            sum(lca.lc_marine_sqkm) AS country_marine_sqkm,
            sum(lca.lc_marine_prot_sqkm) AS country_marine_prot_sqkm
           FROM lca
          GROUP BY lca.country_id
        ), "out" AS (
         SELECT a.country_id,
            c.country_tot_sqkm::numeric AS country_tot_sqkm,
            c.country_prot_sqkm::numeric AS country_prot_sqkm,
            c.country_land_sqkm::numeric AS country_land_sqkm,
            c.country_land_prot_sqkm::numeric AS country_land_prot_sqkm,
            c.country_marine_sqkm::numeric AS country_marine_sqkm,
            c.country_marine_prot_sqkm::numeric AS country_marine_prot_sqkm,
            b.lcag_code AS lc_class,
            b.lc AS label,
            ('rgb('::text || b.rgb) || ')'::text AS color,
            round(sum(a.lc_tot_sqkm)::numeric, 2) AS lc_tot_sqkm,
            round((sum(a.lc_tot_sqkm) / c.country_tot_sqkm * 100::double precision)::numeric, 2) AS lc_tot_perc_country_tot,
            round(sum(a.lc_prot_sqkm)::numeric, 2) AS lc_prot_sqkm,
            round((sum(a.lc_prot_sqkm) / c.country_tot_sqkm * 100::double precision)::numeric, 2) AS lc_prot_perc_country_tot,
            round((sum(a.lc_prot_sqkm) / c.country_prot_sqkm * 100::double precision)::numeric, 2) AS lc_prot_perc_country_prot,
            round(sum(a.lc_land_sqkm)::numeric, 2) AS lc_land_sqkm,
            round((sum(a.lc_land_sqkm) / c.country_land_sqkm * 100::double precision)::numeric, 2) AS lc_land_perc_country_land,
            round(sum(a.lc_land_prot_sqkm)::numeric, 2) AS lc_land_prot_sqkm,
            round((sum(a.lc_land_prot_sqkm) / c.country_land_sqkm * 100::double precision)::numeric, 2) AS lc_land_prot_perc_country_land,
            round((sum(a.lc_land_prot_sqkm) / c.country_land_prot_sqkm * 100::double precision)::numeric, 2) AS lc_land_prot_perc_country_land_prot,
            round(sum(a.lc_marine_sqkm)::numeric, 2) AS lc_marine_sqkm,
            round((sum(a.lc_marine_sqkm) / c.country_marine_sqkm * 100::double precision)::numeric, 2) AS lc_marine_perc_country_marine,
            round(sum(a.lc_marine_prot_sqkm)::numeric, 2) AS lc_marine_prot_sqkm,
            round((sum(a.lc_marine_prot_sqkm) / c.country_marine_sqkm * 100::double precision)::numeric, 2) AS lc_marine_prot_perc_country_marine,
            round((sum(a.lc_marine_prot_sqkm) / c.country_marine_prot_sqkm * 100::double precision)::numeric, 2) AS lc_marine_prot_perc_country_marine_prot
           FROM lca a
             JOIN lc2 b ON a.lc_code = b.lc_code
             JOIN country_land_tot_surface c USING (country_id)
          GROUP BY a.country_id, b.lcag_code, b.lc, b.rgb, c.country_tot_sqkm, c.country_prot_sqkm, c.country_land_sqkm, c.country_land_prot_sqkm, c.country_marine_sqkm, c.country_marine_prot_sqkm
          ORDER BY b.lcag_code
        )
 SELECT "out".country_id,
    "out".country_tot_sqkm,
    "out".country_prot_sqkm,
    "out".country_land_sqkm,
    "out".country_land_prot_sqkm,
    "out".country_marine_sqkm,
    "out".country_marine_prot_sqkm,
    "out".lc_class,
    "out".label,
    "out".color,
    "out".lc_tot_sqkm,
    "out".lc_tot_perc_country_tot,
    "out".lc_prot_sqkm,
    "out".lc_prot_perc_country_tot,
    "out".lc_prot_perc_country_prot,
    "out".lc_land_sqkm,
    "out".lc_land_perc_country_land,
    "out".lc_land_prot_sqkm,
    "out".lc_land_prot_perc_country_land,
    "out".lc_land_prot_perc_country_land_prot,
    "out".lc_marine_sqkm,
    "out".lc_marine_perc_country_marine,
    "out".lc_marine_prot_sqkm,
    "out".lc_marine_prot_perc_country_marine,
    "out".lc_marine_prot_perc_country_marine_prot
   FROM "out"
 LIMIT 0;
GRANT SELECT ON TABLE dopa_50.dopa_country_lc_copernicus_template TO h05ibexro;
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_country_lc_copernicus(
    country_code text DEFAULT NULL,
    code_type text DEFAULT 'iso3',
    agg integer DEFAULT 0
)
RETURNS SETOF dopa_50.dopa_country_lc_copernicus_template
LANGUAGE plpgsql
AS $BODY$
DECLARE
sql TEXT;
BEGIN

sql := '
WITH lca AS (
    SELECT country_id,country_name,iso3,iso2,status,t.*
    FROM dopa_50.dopa_country_all_inds a,
    UNNEST(lc_copernicus_code,
           lc_copernicus_tot_sqkm,
           lc_copernicus_prot_sqkm,
           lc_copernicus_land_sqkm,
           lc_copernicus_land_prot_sqkm,
           lc_copernicus_marine_sqkm,
           lc_copernicus_marine_prot_sqkm)
    WITH ORDINALITY AS t(
        lc_code,lc_tot_sqkm,lc_prot_sqkm,
        lc_land_sqkm,lc_land_prot_sqkm,
        lc_marine_sqkm,lc_marine_prot_sqkm
    )
';

IF country_code IS NOT NULL THEN

    IF lower(code_type) = 'iso2' THEN
        sql := sql || ' WHERE UPPER(iso2)=UPPER($1)';
    ELSE
        sql := sql || ' WHERE UPPER(iso3)=UPPER($1)';
    END IF;

END IF;

sql := sql || '
),
lc0 AS(
    SELECT lc_code lcag_code,lc_class lc,lc_code,lc_rgb rgb
    FROM dopa_50.class_lc_copernicus
),
lc2 AS(
    SELECT lc2_code lcag_code,lc2_class lc,lc_code,lc2_rgb rgb
    FROM dopa_50.class_lc_copernicus
),
country_land_tot_surface AS (
    SELECT country_id,
           SUM(lc_tot_sqkm)country_tot_sqkm,
           SUM(lc_prot_sqkm)country_prot_sqkm,
           SUM(lc_land_sqkm)country_land_sqkm,
           SUM(lc_land_prot_sqkm)country_land_prot_sqkm,
           SUM(lc_marine_sqkm)country_marine_sqkm,
           SUM(lc_marine_prot_sqkm)country_marine_prot_sqkm
    FROM lca GROUP BY country_id
),
out AS (
    SELECT
        a.country_id,
        c.country_tot_sqkm::numeric,
        c.country_prot_sqkm::numeric,
        c.country_land_sqkm::numeric,
        c.country_land_prot_sqkm::numeric,
        c.country_marine_sqkm::numeric,
        c.country_marine_prot_sqkm::numeric,
        b.lcag_code lc_class,
        b.lc lc,
        ''rgb(''||b.rgb||'')'' color,
        round((SUM(a.lc_tot_sqkm))::numeric,2) lc_tot_sqkm,
        round(((SUM(a.lc_tot_sqkm)/c.country_tot_sqkm)*100)::numeric,2) lc_tot_perc_country_tot,
        round((SUM(a.lc_prot_sqkm))::numeric,2) lc_prot_sqkm,
        round(((SUM(a.lc_prot_sqkm)/c.country_tot_sqkm)*100)::numeric,2) lc_prot_perc_country_tot,
        round(((SUM(a.lc_prot_sqkm)/c.country_prot_sqkm)*100)::numeric,2) lc_prot_perc_country_prot,
        round((SUM(a.lc_land_sqkm))::numeric,2) lc_land_sqkm,
        round(((SUM(a.lc_land_sqkm)/c.country_land_sqkm)*100)::numeric,2) lc_land_perc_country_land,
        round((SUM(a.lc_land_prot_sqkm))::numeric,2) lc_land_prot_sqkm,
        round(((SUM(a.lc_land_prot_sqkm)/c.country_land_sqkm)*100)::numeric,2) lc_land_prot_perc_country_land,
        round(((SUM(a.lc_land_prot_sqkm)/c.country_land_prot_sqkm)*100)::numeric,2) lc_land_prot_perc_country_land_prot,
        round((SUM(a.lc_marine_sqkm))::numeric,2) lc_marine_sqkm,
        round(((SUM(a.lc_marine_sqkm)/c.country_marine_sqkm)*100)::numeric,2) lc_marine_perc_country_marine,
        round((SUM(a.lc_marine_prot_sqkm))::numeric,2) lc_marine_prot_sqkm,
        round(((SUM(a.lc_marine_prot_sqkm)/c.country_marine_sqkm)*100)::numeric,2) lc_marine_prot_perc_country_marine,
        round(((SUM(a.lc_marine_prot_sqkm)/c.country_marine_prot_sqkm)*100)::numeric,2) lc_marine_prot_perc_country_marine_prot
    FROM lca a
    JOIN lc'||agg||' b ON a.lc_code=b.lc_code
    JOIN country_land_tot_surface c USING(country_id)
    GROUP BY a.country_id,b.lcag_code,b.lc,b.rgb,
             c.country_tot_sqkm,c.country_prot_sqkm,
             c.country_land_sqkm,c.country_land_prot_sqkm,
             c.country_marine_sqkm,c.country_marine_prot_sqkm
)
SELECT * FROM out ORDER BY country_id, lc_class;
';

RETURN QUERY EXECUTE sql USING country_code;

END;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_country_lc_copernicus(text, text, integer) TO h05ibexro;
--------------------------------------------------------------------------------------------------------
-- FUNCTION: dopa_50.get_dopa_wdpa_country_codes_unnested()
--------------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS dopa_50.get_dopa_wdpa_country_codes_unnested(boolean, boolean) CASCADE;
--------------------------------------------------------------------------------------------------------
-- MATERIALIZED VIEW dopa_50.att_pa
--------------------------------------------------------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS dopa_50.att_pa CASCADE;
CREATE MATERIALIZED VIEW dopa_50.att_pa AS
SELECT
wdpaid pa,
pa_name,
desig_eng,
iucn_cat,
marine,
is_n2k,
iso3,
type,
area_geo
FROM dopa_50.dopa_wdpa_all_inds
ORDER BY wdpaid;
GRANT SELECT ON TABLE dopa_50.att_pa TO h05ibexro;
--------------------------------------------------------------------------------------------------------
-- MATERIALIZED VIEW dopa_50.att_country
--------------------------------------------------------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS dopa_50.att_country;CREATE MATERIALIZED VIEW dopa_50.att_country AS
SELECT
country_id country,
country_name,
iso3,
iso2,
status
FROM dopa_50.dopa_country_all_inds
ORDER BY country_id;
GRANT SELECT ON TABLE dopa_50.att_country TO h05ibexro;
--------------------------------------------------------------------------------------------------------
-- MATERIALIZED VIEW dopa_50.dopa_wdpa_country_codes_unnested_template
--------------------------------------------------------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS dopa_50.dopa_wdpa_country_codes_unnested_template;
CREATE MATERIALIZED VIEW IF NOT EXISTS dopa_50.dopa_wdpa_country_codes_unnested_template
AS
 WITH unnested AS (
         SELECT a_1.pa AS wdpaid,
            unnest(string_to_array(a_1.iso3::text, ';'::text)) AS iso3,
            'y'::text AS multi
           FROM dopa_50.att_pa a_1
          WHERE a_1.area_geo >= 1::double precision AND a_1.type = 'Polygon'::text AND a_1.iso3::text ~~ '%;%'::text
        UNION
         SELECT a_1.pa AS wdpaid,
            a_1.iso3,
            'n'::text AS multi
           FROM dopa_50.att_pa a_1
          WHERE a_1.area_geo >= 1::double precision AND a_1.type = 'Polygon'::text AND a_1.iso3::text !~~ '%;%'::text
  ORDER BY 1, 2
        )
 SELECT a.wdpaid,
    c.pa_name,
    b.country_name,
    a.iso3,
    b.iso2,
    c.area_geo,
    a.multi
   FROM unnested a
     JOIN dopa_50.att_country b ON a.iso3 = b.iso3
     JOIN dopa_50.att_pa c ON a.wdpaid = c.pa
  ORDER BY a.wdpaid, a.iso3
 LIMIT 0;
 GRANT SELECT  ON TABLE dopa_50.dopa_wdpa_country_codes_unnested_template TO h05ibexro;
---------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_wdpa_country_codes_unnested(
	multi boolean DEFAULT false,
	point boolean DEFAULT false)
    RETURNS SETOF dopa_50.dopa_wdpa_country_codes_unnested_template 
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
multi boolean := $1;
point boolean:= $2;
sql TEXT;  
BEGIN
sql := '
WITH unnested AS (
SELECT
a.pa wdpaid,
unnest(string_to_array(a.iso3,'';'')) iso3,
''y''::text multi
FROM dopa_50.att_pa a
WHERE a.area_geo >= 1 AND a.iso3 LIKE ''%;%''
UNION
SELECT
a.pa wdpaid,
iso3,
''n''::text multi
FROM dopa_50.att_pa a
WHERE a.area_geo >= 1 AND a.iso3 NOT LIKE ''%;%''
)
SELECT
a.wdpaid,
c.pa_name,
b.country_name,
a.iso3,
b.iso2::text,
c.area_geo,
a.multi
FROM unnested a
JOIN dopa_50.att_country b ON a.iso3=b.iso3
JOIN dopa_50.att_pa c ON a.wdpaid=c.pa
WHERE a.wdpaid IS NOT NULL';
IF multi IS FALSE THEN sql := sql ||' AND a.multi = ''n'' ';
END IF;
IF point IS FALSE THEN sql := sql ||' AND c.type != ''Point'' ';
END IF;
sql := sql || '
ORDER BY wdpaid,a.iso3;
';
RETURN QUERY EXECUTE sql USING multi,point;
END;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_wdpa_country_codes_unnested(boolean, boolean) TO h05ibexro;
COMMENT ON FUNCTION dopa_50.get_dopa_wdpa_country_codes_unnested(boolean, boolean)
    IS 'Country codes (iso3,iso2,un_m49) and Country name (country_name) for each protected area (wdpaid,pa_name); Multicountry areas, unnested and redundant, are marked as multi=yes; Can include multi (default=no) and points (default=no)||pressures.get_*_country_*,hdi.get_thdi_country_pa,administrative_units.f_pop_country_pa_stats';
-----------------------------------------------------------------------------------------------------------
-- FUNCTION: dopa_50.get_dopa_country_pa_normalized_indicator()
-----------------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS dopa_50.get_dopa_country_pa_normalized_indicator(text, text);
-----------------------------------------------------------------------------------------------------------
-- MATERIALIZED VIEW dopa_50.dopa_country_pa_normalized_indicator_template
-----------------------------------------------------------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS dopa_50.dopa_country_pa_normalized_indicator_template;
CREATE MATERIALIZED VIEW IF NOT EXISTS dopa_50.dopa_country_pa_normalized_indicator_template
AS
 WITH unnested AS (
         SELECT get_dopa_wdpa_country_codes_unnested.wdpaid,
            get_dopa_wdpa_country_codes_unnested.pa_name,
            get_dopa_wdpa_country_codes_unnested.country_name,
            get_dopa_wdpa_country_codes_unnested.iso3,
            get_dopa_wdpa_country_codes_unnested.iso2,
            get_dopa_wdpa_country_codes_unnested.area_geo,
            get_dopa_wdpa_country_codes_unnested.multi
           FROM dopa_50.get_dopa_wdpa_country_codes_unnested() get_dopa_wdpa_country_codes_unnested(wdpaid, pa_name, country_name, iso3, iso2, area_geo, multi)
        ), press_atts AS (
         SELECT a.wdpaid,
            a.pa_name,
            a.country_name,
            a.iso3,
            a.iso2,
            a.area_geo,
            a.multi,
            b.p_agriculture_pa_perc_tot::numeric AS ind
           FROM unnested a
             LEFT JOIN dopa_50.dopa_wdpa_all_inds b ON a.wdpaid = b.wdpaid
          WHERE b.p_agriculture_pa_perc_tot IS NOT NULL
          ORDER BY a.wdpaid
        ), range_country AS (
         SELECT press_atts.iso3,
            max(press_atts.ind) AS max_ind,
            min(press_atts.ind) AS min_ind,
            max(press_atts.ind) - min(press_atts.ind) AS range_country,
            count(press_atts.wdpaid) AS count_wdpaid
           FROM press_atts
          GROUP BY press_atts.iso3
          ORDER BY press_atts.iso3
        ), normalized AS (
         SELECT a.wdpaid,
            a.pa_name,
            a.country_name,
            a.iso3,
            a.iso2,
            a.area_geo,
            a.multi,
            a.ind,
                CASE
                    WHEN b.min_ind = b.max_ind AND a.ind <> 0::numeric THEN 100.00
                    WHEN b.min_ind = b.max_ind AND a.ind = 0::numeric THEN 0.00
                    ELSE round(100::numeric * ((a.ind - b.min_ind) / b.range_country), 2)
                END AS normalized_ind
           FROM press_atts a
             JOIN range_country b ON a.iso3 = b.iso3
        ), normalized_avg AS (
         SELECT normalized.iso3,
            round(avg(normalized.normalized_ind), 2) AS normalized_avg_ind
           FROM normalized
          GROUP BY normalized.iso3
          ORDER BY normalized.iso3
        ), final_pressure AS (
         SELECT rank() OVER (PARTITION BY a.iso3 ORDER BY a.normalized_ind DESC, a.wdpaid)::integer AS country_rank,
            a.wdpaid,
            a.iso3,
            a.iso2,
            a.ind,
            a.normalized_ind,
            b.normalized_avg_ind
           FROM normalized a
             JOIN normalized_avg b ON a.iso3 = b.iso3
          ORDER BY a.iso3, (rank() OVER (PARTITION BY a.iso3 ORDER BY a.normalized_ind DESC, a.wdpaid)::integer)
        )
 SELECT final_pressure.country_rank,
    final_pressure.wdpaid,
    final_pressure.iso3,
    final_pressure.iso2,
    round(final_pressure.ind, 2) AS ind,
    final_pressure.normalized_ind,
    final_pressure.normalized_avg_ind
   FROM final_pressure
 LIMIT 0;
GRANT SELECT ON TABLE dopa_50.dopa_country_pa_normalized_indicator_template TO h05ibexro;
----------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_country_pa_normalized_indicator(
	indicator text DEFAULT 'p_agriculture_pa_perc_tot'::text,
	country_code text DEFAULT NULL::text)
    RETURNS SETOF dopa_50.dopa_country_pa_normalized_indicator_template 
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
   sql TEXT;
	i_iso TEXT;
BEGIN
sql :='
WITH
unnested AS (
SELECT * FROM dopa_50.get_dopa_wdpa_country_codes_unnested()
';
IF country_code IS NOT NULL THEN
	sql := sql || ' WHERE UPPER(iso3)=UPPER($2)';
END IF;
sql := sql || '),
press_atts AS (
SELECT
a.*,
b.'||$1||'::numeric ind
FROM unnested a
LEFT JOIN dopa_50.dopa_wdpa_all_inds b
ON a.wdpaid=b.wdpaid
WHERE b.'||$1||' IS NOT NULL
ORDER BY wdpaid),
range_country AS (
SELECT
iso3,
MAX(ind) max_ind,
MIN(ind) min_ind,
MAX(ind)-MIN(ind) range_country,
COUNT(wdpaid) count_wdpaid
FROM press_atts
GROUP BY iso3
ORDER by iso3),
normalized AS (
SELECT
a.*,
CASE
WHEN b.min_ind=b.max_ind AND a.ind !=0 THEN 100.00
WHEN b.min_ind=b.max_ind AND a.ind =0 THEN 0.00
ELSE ROUND(100*((a.ind-b.min_ind)/b.range_country)::numeric,2)
END normalized_ind
FROM press_atts a
JOIN range_country b ON a.iso3=b.iso3
),
normalized_avg AS (
SELECT
iso3,
ROUND(AVG(normalized_ind)::numeric,2) normalized_avg_ind
FROM normalized
GROUP BY iso3
ORDER BY iso3),
final_pressure AS (
SELECT
(rank() over (PARTITION BY a.iso3 ORDER BY normalized_ind';
IF $1 IN (
	'p_agriculture_pa_perc_tot',
	'p_agriculture_bu_perc_tot',
	'p_builtup_pa_sqkm',
	'p_builtup_pa_perc_land',
	'p_builtup_bu_sqkm',
	'p_builtup_bu_perc_land',
	'p_population_pa_change_perc_first_epoch',
	'p_population_bu_change_perc_first_epoch',
	'p_population_pa_density_change',
	'p_population_bu_density_change',
	'p_population_pa_last_epoch_density',
	'p_population_bu_last_epoch_density',
	'p_road_pa_perc_tot',
	'p_road_bu_perc_tot'
) THEN
	sql := sql || ' DESC';
	ELSE sql := sql || ' ASC';
END IF;
sql := sql ||
',wdpaid))::integer as country_rank,
a.wdpaid,
a.iso3,
a.iso2::text,
a.ind,
a.normalized_ind,
b.normalized_avg_ind
FROM normalized a
JOIN normalized_avg b ON a.iso3=b.iso3
ORDER BY iso3,country_rank)
SELECT
country_rank,
wdpaid,
iso3,
iso2,
ROUND(ind,2) ind,
normalized_ind,
normalized_avg_ind
FROM final_pressure;';
RETURN QUERY EXECUTE sql USING "indicator",country_code;
END;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_country_pa_normalized_indicator(text, text) TO h05ibexro;
COMMENT ON FUNCTION dopa_50.get_dopa_country_pa_normalized_indicator(text, text)
    IS 'Returns normalized indicator with ranking for protected areas or buffers in country (to be implemented next, replaces all pressures)||REST,DOPA_EXPLORER,f_pop_all_normalized_pressures';
-------------------------------------------------------------------------------------------
-- FUNCTION: dopa_50.get_dopa_wdpa_lcc_esa()
-------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS dopa_50.get_dopa_wdpa_lcc_esa(integer);
-------------------------------------------------------------------------------------------
-- MATERIALIZED dopa_50.dopa_wdpa_lcc_esa_template
-------------------------------------------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS dopa_50.dopa_wdpa_lcc_esa_template;
CREATE MATERIALIZED VIEW IF NOT EXISTS dopa_50.dopa_wdpa_lcc_esa_template
AS
 WITH lca AS (
         SELECT a.wdpaid,
            t.lc1_1995,
            t.lc1_2020,
            t.lcc_sqkm,
            t.ordinality
           FROM dopa_50.dopa_wdpa_all_inds a,
            LATERAL UNNEST(a.lcc_esa_lc1_1995, a.lcc_esa_lc1_2020, a.lcc_esa_sqkm) WITH ORDINALITY t(lc1_1995, lc1_2020, lcc_sqkm, ordinality)
          WHERE a.wdpaid = 32671
        ), lccodes AS (
         SELECT DISTINCT class_lc_esa.lc1_code,
            class_lc_esa.lc1_class AS lc1
           FROM dopa_50.class_lc_esa
          WHERE class_lc_esa.lc1_code IS NOT NULL
          ORDER BY class_lc_esa.lc1_code
        ), pas AS (
         SELECT att_pa.pa AS wdpaid,
            att_pa.pa_name,
            att_pa.desig_eng,
            att_pa.iucn_cat,
            att_pa.marine,
            att_pa.is_n2k,
            att_pa.iso3,
            att_pa.type
           FROM dopa_50.att_pa
          WHERE att_pa.pa = 32671
        ), ids AS (
         SELECT y.y
           FROM generate_series(1, 4) y(y)
        ), pas_years_id AS (
         SELECT a.wdpaid,
            a.pa_name,
            a.desig_eng,
            a.iucn_cat,
            a.marine,
            a.is_n2k,
            a.iso3,
            a.type,
            b.y AS y1,
            c.y AS y2
           FROM pas a,
            ids b,
            ids c
          ORDER BY a.wdpaid, b.y, c.y
        ), "out" AS (
         SELECT a.wdpaid,
            a.pa_name,
            a.desig_eng,
            a.iucn_cat,
            a.marine,
            a.is_n2k,
            a.iso3,
            a.type,
            a.y1,
            a.y2,
            c.lc1 AS lc1_1995,
            d.lc1 AS lc1_2020,
            b.lcc_sqkm::numeric AS lcc_sqkm
           FROM pas_years_id a
             JOIN lca b ON a.wdpaid = b.wdpaid AND a.y1 = b.lc1_1995 AND a.y2 = b.lc1_2020
             JOIN lccodes c ON a.y1 = c.lc1_code
             JOIN lccodes d ON a.y2 = d.lc1_code
          WHERE a.y1 <> a.y2
          ORDER BY a.wdpaid, a.y1, a.y2
        )
 SELECT "out".wdpaid,
    "out".pa_name,
    "out".desig_eng,
    "out".iucn_cat,
    "out".marine,
    "out".is_n2k,
    "out".iso3,
    "out".type,
    "out".y1,
    "out".lc1_1995,
    "out".y2,
    "out".lc1_2020,
    "out".lcc_sqkm
   FROM "out"
 LIMIT 0;
GRANT SELECT ON TABLE dopa_50.dopa_wdpa_lcc_esa_template TO h05ibexro;
-----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_wdpa_lcc_esa(
	wdpaid integer DEFAULT NULL::integer)
    RETURNS SETOF dopa_50.dopa_wdpa_lcc_esa_template 
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
sql TEXT;
BEGIN
sql :='
WITH
lca AS (SELECT a.wdpaid,t.*
FROM dopa_50.dopa_wdpa_all_inds a,
UNNEST(lcc_esa_lc1_1995,lcc_esa_lc1_2020,lcc_esa_sqkm )
WITH ORDINALITY AS
t(lc1_1995,lc1_2020,lcc_sqkm)';
IF wdpaid IS NOT NULL THEN 
sql := sql || ' WHERE wdpaid = $1';
END IF;
sql := sql || '
),
lccodes AS (SELECT DISTINCT lc1_code,lc1_class lc1 FROM dopa_50.class_lc_esa WHERE lc1_code IS NOT NULL ORDER BY lc1_code),
pas AS (SELECT pa wdpaid,pa_name,desig_eng,iucn_cat,marine,is_n2k,iso3,type FROM dopa_50.att_pa';
IF wdpaid IS NOT NULL THEN 
sql := sql || ' WHERE pa = $1';
END IF;
sql := sql || '
),
ids AS (SELECT * FROM generate_series(1,4) y),
pas_years_id AS (SELECT a.*,b.y y1,c.y y2 FROM pas a,ids b,ids c ORDER BY wdpaid,y1,y2),
out AS (
SELECT
a.*,
c.lc1 lc1_1995,
d.lc1 lc1_2020,
b.lcc_sqkm::numeric lcc_sqkm
FROM pas_years_id a
JOIN lca b ON a.wdpaid=b.wdpaid AND a.y1=b.lc1_1995 AND a.y2=b.lc1_2020
JOIN lccodes c ON a.y1=c.lc1_code
JOIN lccodes d ON a.y2=d.lc1_code
WHERE a.y1<>a.y2
ORDER BY a.wdpaid,a.y1,a.y2
)
SELECT wdpaid,pa_name,desig_eng,iucn_cat,marine,is_n2k,iso3,type,y1,lc1_1995,y2,lc1_2020,lcc_sqkm FROM out 
ORDER BY wdpaid,y1,y2
;';
RETURN QUERY EXECUTE sql USING wdpaid;
END;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_wdpa_lcc_esa(integer) TO h05ibexro;
-----------------------------------------------------------------------------------------------------------------------
-- FUNCTION: dopa_50.get_dopa_wdpa_lcc_esa_percent()
-----------------------------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS dopa_50.get_dopa_wdpa_lcc_esa_percent(integer);
-----------------------------------------------------------------------------------------------------------------------
-- MATERIALIZED VIEW: dopa_50.dopa_wdpa_lcc_esa_percent_template
-----------------------------------------------------------------------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS dopa_50.dopa_wdpa_lcc_esa_percent_template;
CREATE MATERIALIZED VIEW IF NOT EXISTS dopa_50.dopa_wdpa_lcc_esa_percent_template
TABLESPACE pg_default
AS
 WITH lcc AS (
         SELECT get_dopa_wdpa_lcc_esa.wdpaid,
            sum(get_dopa_wdpa_lcc_esa.lcc_sqkm) AS lcc_sqkm
           FROM dopa_50.get_dopa_wdpa_lcc_esa() get_dopa_wdpa_lcc_esa(wdpaid, pa_name, desig_eng, iucn_cat, marine, is_n2k, iso3, type, y1, lc1_1995, y2, lc1_2020, lcc_sqkm)
          GROUP BY get_dopa_wdpa_lcc_esa.wdpaid
        ), "out" AS (
         SELECT a.wdpaid,
            a.pa_name,
            a.desig_eng,
            a.iucn_cat,
            a.marine,
            a.is_n2k,
            a.iso3,
            a.type,
            a.lcc_esa_pa_tot_sqkm,
            lcc.lcc_sqkm,
            (lcc.lcc_sqkm::double precision / a.lcc_esa_pa_tot_sqkm * 100::double precision)::numeric AS lcc_perc_wdpa_tot
           FROM dopa_50.dopa_wdpa_all_inds a
             JOIN lcc USING (wdpaid)
        )
 SELECT "out".wdpaid,
    "out".pa_name,
    "out".desig_eng,
    "out".iucn_cat,
    "out".marine,
    "out".is_n2k,
    "out".iso3,
    "out".type,
    "out".lcc_esa_pa_tot_sqkm,
    "out".lcc_sqkm,
    "out".lcc_perc_wdpa_tot
   FROM "out"
  ORDER BY "out".wdpaid
 LIMIT 0
;
GRANT SELECT ON TABLE dopa_50.dopa_wdpa_lcc_esa_percent_template TO h05ibexro;
-----------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_wdpa_lcc_esa_percent(
	wdpaid integer DEFAULT NULL::integer)
    RETURNS SETOF dopa_50.dopa_wdpa_lcc_esa_percent_template 
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
sql TEXT;
BEGIN
sql :='
WITH
lcc AS (SELECT wdpaid,SUM(lcc_sqkm)lcc_sqkm FROM dopa_50.get_dopa_wdpa_lcc_esa(';
IF wdpaid IS NOT NULL THEN sql := sql || '$1';
END IF;
sql := sql || '
) GROUP BY wdpaid),
out AS (
SELECT wdpaid,pa_name,desig_eng,iucn_cat,marine,is_n2k,iso3,type,lcc_esa_pa_tot_sqkm,
lcc_sqkm,
(lcc_sqkm/lcc_esa_pa_tot_sqkm*100)::numeric lcc_perc_wdpa_tot
FROM dopa_50.dopa_wdpa_all_inds a JOIN lcc USING(wdpaid))
SELECT * FROM out
ORDER BY wdpaid;';
RETURN QUERY EXECUTE sql USING wdpaid;
END;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_wdpa_lcc_esa_percent(integer) TO h05ibexro;
-------------------------------------------------------------------------------------------
-- FUNCTION: dopa_50.get_dopa_wdpa_lc_esa()
-------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS dopa_50.get_dopa_wdpa_lc_esa(integer, integer);
-------------------------------------------------------------------------------------------
-- MATERIALIZED: dopa_50.dopa_wdpa_lc_esa_template
-------------------------------------------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS dopa_50.dopa_wdpa_lc_esa_template;
CREATE MATERIALIZED VIEW IF NOT EXISTS dopa_50.dopa_wdpa_lc_esa_template
AS
 WITH lca AS (
         SELECT a_1.wdpaid,
            a_1.pa_name,
            a_1.desig_eng,
            a_1.iucn_cat,
            a_1.marine,
            a_1.is_n2k,
            a_1.iso3,
            a_1.type,
            t.lc_code,
            t.lc_1995_sqkm,
            t.lc_2000_sqkm,
            t.lc_2005_sqkm,
            t.lc_2010_sqkm,
            t.lc_2015_sqkm,
            t.lc_2020_sqkm,
            t.ordinality
           FROM dopa_50.dopa_wdpa_all_inds a_1,
            LATERAL UNNEST(a_1.lc_esa_code, a_1.lc_esa_1995_sqkm, a_1.lc_esa_2000_sqkm, a_1.lc_esa_2005_sqkm, a_1.lc_esa_2010_sqkm, a_1.lc_esa_2015_sqkm, a_1.lc_esa_2020_sqkm) WITH ORDINALITY t(lc_code, lc_1995_sqkm, lc_2000_sqkm, lc_2005_sqkm, lc_2010_sqkm, lc_2015_sqkm, lc_2020_sqkm, ordinality)
          WHERE a_1.wdpaid = 32671
          ORDER BY a_1.wdpaid, t.lc_code
        ), lc0 AS (
         SELECT class_lc_esa.lc_code AS lcag_code,
            class_lc_esa.lc_class AS lc,
            class_lc_esa.lc_code,
            class_lc_esa.lc_rgb AS rgb
           FROM dopa_50.class_lc_esa
        ), lc1 AS (
         SELECT class_lc_esa.lc1_code AS lcag_code,
            class_lc_esa.lc1_class AS lc,
            class_lc_esa.lc_code,
            class_lc_esa.lc1_rgb AS rgb
           FROM dopa_50.class_lc_esa
        ), lc2 AS (
         SELECT class_lc_esa.lc2_code AS lcag_code,
            class_lc_esa.lc2_class AS lc,
            class_lc_esa.lc_code,
            class_lc_esa.lc2_rgb AS rgb
           FROM dopa_50.class_lc_esa
        ), lc3 AS (
         SELECT class_lc_esa.lc3_code AS lcag_code,
            class_lc_esa.lc3_class AS lc,
            class_lc_esa.lc_code,
            class_lc_esa.lc3_rgb AS rgb
           FROM dopa_50.class_lc_esa
        ), t_tots AS (
         SELECT lca.wdpaid,
            sum(lca.lc_1995_sqkm) AS tot_1995_sqkm,
            sum(lca.lc_2000_sqkm) AS tot_2000_sqkm,
            sum(lca.lc_2005_sqkm) AS tot_2005_sqkm,
            sum(lca.lc_2010_sqkm) AS tot_2010_sqkm,
            sum(lca.lc_2015_sqkm) AS tot_2015_sqkm,
            sum(lca.lc_2020_sqkm) AS tot_2020_sqkm
           FROM lca
          GROUP BY lca.wdpaid
        )
 SELECT a.wdpaid,
    a.pa_name,
    a.desig_eng,
    a.iucn_cat,
    a.marine,
    a.is_n2k,
    a.iso3,
    a.type,
    b.lcag_code AS lc_class,
    b.lc AS label,
    ('rgb('::text || b.rgb) || ')'::text AS color,
    c.tot_1995_sqkm,
    sum(a.lc_1995_sqkm) AS lc_1995_sqkm,
    sum(a.lc_1995_sqkm) / c.tot_1995_sqkm * 100::double precision AS lc_perc_tot_1995,
    c.tot_2000_sqkm,
    sum(a.lc_2000_sqkm) AS lc_2000_sqkm,
    sum(a.lc_2000_sqkm) / c.tot_2000_sqkm * 100::double precision AS lc_perc_tot_2000,
    c.tot_2005_sqkm,
    sum(a.lc_2005_sqkm) AS lc_2005_sqkm,
    sum(a.lc_2005_sqkm) / c.tot_2005_sqkm * 100::double precision AS lc_perc_tot_2005,
    c.tot_2010_sqkm,
    sum(a.lc_2010_sqkm) AS lc_2010_sqkm,
    sum(a.lc_2010_sqkm) / c.tot_2010_sqkm * 100::double precision AS lc_perc_tot_2010,
    c.tot_2015_sqkm,
    sum(a.lc_2015_sqkm) AS lc_2015_sqkm,
    sum(a.lc_2015_sqkm) / c.tot_2015_sqkm * 100::double precision AS lc_perc_tot_2015,
    c.tot_2020_sqkm,
    sum(a.lc_2020_sqkm) AS lc_2020_sqkm,
    sum(a.lc_2020_sqkm) / c.tot_2020_sqkm * 100::double precision AS lc_perc_tot_2020
   FROM lca a
     JOIN lc0 b USING (lc_code)
     JOIN t_tots c USING (wdpaid)
  GROUP BY a.wdpaid, a.pa_name, a.desig_eng, a.iucn_cat, a.marine, a.is_n2k, a.iso3, a.type, b.lcag_code, b.lc, b.rgb, c.tot_1995_sqkm, c.tot_2000_sqkm, c.tot_2005_sqkm, c.tot_2010_sqkm, c.tot_2015_sqkm, c.tot_2020_sqkm
  ORDER BY a.wdpaid, b.lcag_code
 LIMIT 0;
GRANT SELECT ON TABLE dopa_50.dopa_wdpa_lc_esa_template TO h05ibexro;
--------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_wdpa_lc_esa(
	wdpaid integer DEFAULT NULL::integer,
	agg integer DEFAULT 0)
    RETURNS SETOF dopa_50.dopa_wdpa_lc_esa_template 
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
sql TEXT;
BEGIN
sql :='
WITH
lca AS (
SELECT wdpaid,pa_name,desig_eng,iucn_cat,marine,is_n2k,iso3,type,
t.*
FROM dopa_50.dopa_wdpa_all_inds a,
UNNEST(lc_esa_code,lc_esa_1995_sqkm,lc_esa_2000_sqkm,lc_esa_2005_sqkm,lc_esa_2010_sqkm,lc_esa_2015_sqkm,lc_esa_2020_sqkm) WITH ORDINALITY
AS t(lc_code,lc_1995_sqkm,lc_2000_sqkm,lc_2005_sqkm,lc_2010_sqkm,lc_2015_sqkm,lc_2020_sqkm)';
IF wdpaid IS NOT NULL THEN
sql := sql || ' WHERE a.wdpaid= '||$1||'';
END IF;
sql := sql || '
ORDER BY wdpaid,lc_code
),
lc0 AS(SELECT lc_code lcag_code,lc_class lc,lc_code,lc_rgb rgb FROM dopa_50.class_lc_esa),
lc1 AS(SELECT lc1_code lcag_code,lc1_class lc,lc_code,lc1_rgb rgb FROM dopa_50.class_lc_esa),
lc2 AS(SELECT lc2_code lcag_code,lc2_class lc,lc_code,lc2_rgb rgb FROM dopa_50.class_lc_esa),
lc3 AS(SELECT lc3_code lcag_code,lc3_class lc,lc_code,lc3_rgb rgb FROM dopa_50.class_lc_esa),
t_tots AS (
SELECT wdpaid,
SUM(lc_1995_sqkm) tot_1995_sqkm,
SUM(lc_2000_sqkm) tot_2000_sqkm,
SUM(lc_2005_sqkm) tot_2005_sqkm,
SUM(lc_2010_sqkm) tot_2010_sqkm,
SUM(lc_2015_sqkm) tot_2015_sqkm,
SUM(lc_2020_sqkm) tot_2020_sqkm
FROM lca GROUP BY wdpaid)
SELECT
a.wdpaid,a.pa_name,a.desig_eng,a.iucn_cat,a.marine,a.is_n2k,a.iso3,a.type,
b.lcag_code lc_class,b.lc "label",''rgb(''||b.rgb||'')'' color,
tot_1995_sqkm,SUM(lc_1995_sqkm)lc_1995_sqkm,(SUM(lc_1995_sqkm)/tot_1995_sqkm*100) lc_perc_tot_1995,
tot_2000_sqkm,SUM(lc_2000_sqkm)lc_2000_sqkm,(SUM(lc_2000_sqkm)/tot_2000_sqkm*100) lc_perc_tot_2000,
tot_2005_sqkm,SUM(lc_2005_sqkm)lc_2005_sqkm,(SUM(lc_2005_sqkm)/tot_2005_sqkm*100) lc_perc_tot_2005,
tot_2010_sqkm,SUM(lc_2010_sqkm)lc_2010_sqkm,(SUM(lc_2010_sqkm)/tot_2010_sqkm*100) lc_perc_tot_2010,
tot_2015_sqkm,SUM(lc_2015_sqkm)lc_2015_sqkm,(SUM(lc_2015_sqkm)/tot_2015_sqkm*100) lc_perc_tot_2015,
tot_2020_sqkm,SUM(lc_2020_sqkm)lc_2020_sqkm,(SUM(lc_2020_sqkm)/tot_2020_sqkm*100) lc_perc_tot_2020
FROM lca a
JOIN lc'||$2||' b ON a.lc_code=b.lc_code
JOIN t_tots c USING(wdpaid) 
GROUP BY a.wdpaid,a.pa_name,a.desig_eng,a.iucn_cat,a.marine,a.is_n2k,a.iso3,a.type,b.lcag_code,b.lc,b.rgb,
c.tot_1995_sqkm,c.tot_2000_sqkm,c.tot_2005_sqkm,c.tot_2010_sqkm,c.tot_2015_sqkm,c.tot_2020_sqkm
ORDER BY wdpaid,lc_class
';
RETURN QUERY EXECUTE sql USING wdpaid,agg;
END;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_wdpa_lc_esa(integer,integer) TO h05ibexro;
---------------------------------------------------------------------------------------------------------------
-- FUNCTION: dopa_50.get_dopa_wdpa_lc_copernicus(integer, integer)
---------------------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS dopa_50.get_dopa_wdpa_lc_copernicus(integer, integer);
---------------------------------------------------------------------------------------------------------------
-- MATERIALIZED VIEW: dopa_50.dopa_wdpa_lc_copernicus_template;
---------------------------------------------------------------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS dopa_50.dopa_wdpa_lc_copernicus_template;
CREATE MATERIALIZED VIEW IF NOT EXISTS dopa_50.dopa_wdpa_lc_copernicus_template
TABLESPACE pg_default
AS
 WITH lca AS (
         SELECT a.wdpaid,
            a.pa_name,
            a.desig_eng,
            a.iucn_cat,
            a.marine,
            a.is_n2k,
            a.iso3,
            a.type,
            a.area_geo,
            t.lc_code,
            t.lc_sqkm,
            t.ordinality
           FROM dopa_50.dopa_wdpa_all_inds a,
            LATERAL UNNEST(a.lc_copernicus_code, a.lc_copernicus_tot_sqkm) WITH ORDINALITY t(lc_code, lc_sqkm, ordinality)
          WHERE a.wdpaid = 32671
        ), lc0 AS (
         SELECT class_lc_copernicus.lc_code AS lcag_code,
            class_lc_copernicus.lc_class AS lc,
            class_lc_copernicus.lc_code,
            class_lc_copernicus.lc_rgb AS rgb
           FROM dopa_50.class_lc_copernicus
        ), lc2 AS (
         SELECT class_lc_copernicus.lc2_code AS lcag_code,
            class_lc_copernicus.lc2_class AS lc,
            class_lc_copernicus.lc_code,
            class_lc_copernicus.lc2_rgb AS rgb
           FROM dopa_50.class_lc_copernicus
        ), pa_tot_surface AS (
         SELECT lca.wdpaid,
            sum(lca.lc_sqkm) AS tot_sqkm
           FROM lca
          GROUP BY lca.wdpaid
        ), "out" AS (
         SELECT a.wdpaid,
            c.tot_sqkm::numeric AS tot_sqkm,
            b.lcag_code AS lc_class,
            b.lc AS label,
            ('rgb('::text || b.rgb) || ')'::text AS color,
            round(sum(a.lc_sqkm)::numeric, 2) AS lc_sqkm,
            round((sum(a.lc_sqkm) / c.tot_sqkm * 100::double precision)::numeric, 2) AS lc_sqkm_perc_tot_sqkm
           FROM lca a
             JOIN lc2 b ON a.lc_code = b.lc_code
             JOIN pa_tot_surface c USING (wdpaid)
          WHERE a.lc_sqkm > 0::double precision
          GROUP BY a.wdpaid, b.lcag_code, b.lc, b.rgb, c.tot_sqkm
          ORDER BY b.lcag_code
        )
 SELECT "out".wdpaid,
    "out".tot_sqkm,
    "out".lc_class,
    "out".label,
    "out".color,
    "out".lc_sqkm,
    "out".lc_sqkm_perc_tot_sqkm
   FROM "out"
 LIMIT 0;
GRANT SELECT ON TABLE dopa_50.dopa_wdpa_lc_copernicus_template TO h05ibexro;
--------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dopa_50.get_dopa_wdpa_lc_copernicus(
	wdpaid integer DEFAULT NULL::integer,
	agg integer DEFAULT 0)
    RETURNS SETOF dopa_50.dopa_wdpa_lc_copernicus_template 
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
sql TEXT;
BEGIN
sql :='
WITH
lca AS (SELECT wdpaid,pa_name,desig_eng,iucn_cat,marine,is_n2k,iso3,type,area_geo,t.* FROM dopa_50.dopa_wdpa_all_inds a,
UNNEST(lc_copernicus_code,lc_copernicus_tot_sqkm) WITH ORDINALITY AS t(lc_code,lc_sqkm)';
IF wdpaid IS NOT NULL THEN
sql := sql || ' WHERE a.wdpaid= '||$1||'';
END IF;
sql := sql || '
),
lc0 AS(SELECT lc_code lcag_code,lc_class lc,lc_code,lc_rgb rgb FROM dopa_50.class_lc_copernicus),
lc2 AS(SELECT lc2_code lcag_code,lc2_class lc,lc_code,lc2_rgb rgb FROM dopa_50.class_lc_copernicus),
pa_tot_surface AS (SELECT wdpaid,SUM(lc_sqkm) tot_sqkm FROM lca GROUP BY wdpaid),
out AS (
SELECT
a.wdpaid,c.tot_sqkm::numeric,
b.lcag_code lc_class,b.lc "label",''rgb(''||b.rgb||'')'' color,
round((SUM(a.lc_sqkm))::numeric,2) lc_sqkm,
round(((SUM(a.lc_sqkm)/c.tot_sqkm)*100)::numeric,2) lc_sqkm_perc_tot_sqkm
FROM lca a
JOIN lc'||$2||' b ON a.lc_code=b.lc_code
JOIN pa_tot_surface c USING(wdpaid)
WHERE b.lcag_code IS NOT NULL
GROUP BY a.wdpaid,b.lcag_code,b.lc,b.rgb,c.tot_sqkm
ORDER BY lc_class)
SELECT * FROM out';
RETURN QUERY EXECUTE sql USING wdpaid,agg;
END;
$BODY$;
GRANT EXECUTE ON FUNCTION dopa_50.get_dopa_wdpa_lc_copernicus(integer, integer) TO h05ibexro;
------------------------------------------------------------------------------------------------------