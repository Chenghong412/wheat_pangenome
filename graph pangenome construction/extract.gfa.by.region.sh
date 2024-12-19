#!/bin/sh
cat regions.bed |while read line #the first 3 columns of regions.bed are chromosome, start and end.
do
chr=`echo $line |awk '{print $1}'`
start=`echo $line |awk '{print $2}'`
end=`echo $line |awk '{print $3}'`
gfatools view -R ${chr}:${start}-${end} $input_dir/graph.pangenome.gfa > ${chr}_${start}_${end}.gfa
done
