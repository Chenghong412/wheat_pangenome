#!/bin/sh
for i in core soft-core dispensable private
do
awk -v type=$i '$1!~/group/ {print type,$0}' /03.heatmap/${i}_count.txt >> all_pan_stat_4type.txt
done
cat header all_pan_stat_4type.txt > all_pan_stat_4type_count #header was the same with Orthofinder_output/Orthogroups.GeneCount.tsv
mv all_pan_stat_4type_count all_pan_stat_4type.txt
perl stat_num_to_1.pl
