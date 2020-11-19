# dopa_rest

Extract the whole archive (be aware: is UTF8).

In PGAdmin, execute in sequence:

1. `01_create_infrastructure.sql`, which creates
	+ schema `mtz_results`
	+ tables
		+ `country`
		+ `ecoregion_in_country`
2.  + `02a_populate_table_country.sql`
	+ `02b_populate_table_ecoregion_in_country.sql`
	which populate the above tables. ALTERNATIVELY: edit file `02_populate_tables.sql` (and modify paths in the blocks marked with keywords "locura","mazinga"- choose WIN or LINUX version, commenting the unwanted one with "--"), and execute it. 

3. execute alternatively: 03(a/b/c/d)_create_outputs.sql

4. execute:
	+ `SELECT * FROM mtz_results.country_all_inds;` --(check the field ecoregion_in_country)
	+ `SELECT * FROM mtz_results.get_country_all_inds();` -- check the field ecoregion_in_country
	+ `SELECT * FROM mtz_results.get_country_ecoregions_stats();`

5. discuss it together.

A.	

