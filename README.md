# dopa_rest

Extract the whole archive (be aware: is UTF8).

Edit file `02_populate_tables.sql`, and modify paths in the blocks marked with keywords "locura,mazinga" (choose WIN or LINUX version, commenting the unwanted with "--").

In PGAdmin, execute in sequence:

1. `01_create_infrastructure.sql`, which creates
	+ schema `mtz_results`
	+ tables
		+ `country`
		+ `ecoregion_in_country`
2.  `02_create_infrastructure.sql`, which populates the above tables;

3. execute alternatively: 03(a/b/c)_create_outputs.sql

4. execute:
	+ `SELECT * FROM mtz_results.country_all_inds;` (check the field ecoregion_in_country)
	+ `SELECT * FROM mtz_results.get_country_all_inds();` -- check the field ecoregion_in_country
	+ `SELECT * FROM mtz_results.get_country_ecoregion_stats();`

5. discuss it together.

A.	

      
