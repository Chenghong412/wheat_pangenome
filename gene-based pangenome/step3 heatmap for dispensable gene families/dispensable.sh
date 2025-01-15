#!/bin/sh
perl /statistic_scripts/dispensable/filter_rows_with_zeros.pl
cat rows_with_zeros_1.txt |cut -f1 > nonzero_rows_og
cp  nonzero_rows_og dispensable_OG
perl /statistic_scripts/dispensable/stat.pl nonzero_rows_og Orthogroups.tsv > nonzero_rows_og_Orthogroups.tsv
