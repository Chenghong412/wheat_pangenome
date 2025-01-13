#!/bin/sh
source activate /anaconda3/envs/edta
export TMPDIR=/tmp

#step1 TE annotation for each chromosome of each assembly
for chr in chr1A chr1B chr1D chr2A chr2B chr2D chr3A chr3B chr3D chr4A chr4B chr4D chr5A chr5B chr5D chr6A chr6B chr6D chr7A chr7B chr7D
do
/anaconda3/envs/edta/bin/EDTA.pl --genome ${sample}/${sample}.${chr}.fa --species others --step all -t 20 --sensitive 1 --anno 1 --evaluate 1 --force 1 --overwrite 1
done


#step2 integration of results for each chromosome
perl TEanno.sum.merge.pl ${sample}.TEanno.sum.filelist ${sample}.TEanno.sum.merge $sample


