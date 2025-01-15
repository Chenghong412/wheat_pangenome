#!/bin/sh
perl /statistic_scripts/core/filter_nonzero_rows.pl
cat nonzero_rows.txt |cut -f1 > nonzero_rows_og
cat nonzero_rows_og > core_OG
perl /statistic_scripts/core/stat.pl nonzero_rows_og Orthogroups.tsv > nonzero_rows_og_Orthogroups.tsv
