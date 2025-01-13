#!/bin/sh
perl stat_all_genefamily.pl > stat.OG_all.txt
cat stat.OG_all.txt  |awk '{print $3"\t"$6 }'|awk '{$1=18-$1;print $2"\t"$2}' > pan-gene.txt #18为物种数目

<<'COMMENT'
#the format of pan-gene.txt is as follows:
Number of Genomes        Pan genes      Type
1       4305    Private
2       14146   Dispensable
3       7616    Dispensable
……
17      5696    Soft-core
18      13958   Soft-core
19      32529   Core
COMMENT


Rscript stat_pan-genome_type.R



