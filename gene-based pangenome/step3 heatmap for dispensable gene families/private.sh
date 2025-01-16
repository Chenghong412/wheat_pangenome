#!/bin/sh
perl /statistic_scripts/private/filter_rows_with_zeros.pl
cat rows_with_zeros.txt |cut -f1 > nonzero_rows_og
cp nonzero_rows_og private_OG
perl /statistic_scripts/private/stat.pl nonzero_rows_og /Orthofinder_output/Orthogroups.tsv > nonzero_rows_og_Orthogroups.tsv
