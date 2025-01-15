#!/bin/sh
perl /statistic_scripts/soft-core/filter_rows_with_zeros.pl
cat rows_with_zeros.txt |cut -f1 > nonzero_rows_og
cp nonzero_rows_og soft-core_OG
perl /statistic_scripts//soft-core/stat.pl nonzero_rows_og Orthogroups.tsv > nonzero_rows_og_Orthogroups.tsv
