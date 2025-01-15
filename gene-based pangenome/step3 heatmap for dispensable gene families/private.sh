#!/bin/sh
perl /vol3/agis/chengshifeng_group/chenghong/script/pangene/3.PAV/step1/private/filter_rows_with_zeros.pl
cat rows_with_zeros.txt |cut -f1 > nonzero_rows_og
cp nonzero_rows_og private_OG
perl /vol3/agis/chengshifeng_group/chenghong/script/pangene/3.PAV/step1/private/stat.pl nonzero_rows_og Orthogroups.tsv > nonzero_rows_og_Orthogroups.tsv
