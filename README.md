# dopa_rest

Extract the whole archive.
Edit file `02_populate_tables.sql`, and modify paths in the lines with keywords "locura,burmini,mazinga,grecia" (choose WIN or LINUX version, commenting the unwanted with "--").
In PGAdmin, execute in sequence:
1. `01_create_infrastructure.sql`, which creates
	+ schema `mtz_results`
	+ tables
		+ `country`
		+ `ecoregion_in_country`
2.  `02_create_infrastructure.sql`, which creates
      
