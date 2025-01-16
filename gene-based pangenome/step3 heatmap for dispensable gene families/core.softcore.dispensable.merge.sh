#!/bin/sh
perl /statistic_scripts/stat.pl core_OG /Orthofinder_output/Orthogroups.GeneCount.tsv |cut -f1-21 > core_count.txt
perl /statistic_scripts/stat_1.pl soft-core_OG Orthogroups.GeneCount.tsv |cut -f1-21  > soft-core_count.txt
perl /statistic_scripts/stat_12.pl dispensable_OG Orthogroups.GeneCount.tsv |cut -f1-21  > dispensable_count.txt
cat core_count.txt soft-core_count.txt dispensable_count.txt > all_pan_stat_pav.txt
perl /statistic_scripts/stat_num_to_1.pl
