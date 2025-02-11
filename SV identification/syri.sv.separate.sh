#!/bin/sh
#There are 12 SV types in Syri 

for query in CS2.1 Aikang58 ArinaLrFor Attraktion Jagger Julius Kariega Lancer Landmark Mace Norin61 Renan Spelt Stanley SYMattis Zang1817
do
for i in DUP INVDP
do
cd /vol3/agis/chengshifeng_group/chenghong/pangenome/02.sv/syri/nucmer
mkdir $i
awk -v type=$i '$11==type && $12=="copyloss"' ${query}_vs_Fielder.genomewide.i90.l200syri.out |sort -k1.4,1.4n -k1.5,1.5 -k2,2n >  ./$i/${query}_vs_Fielder.genomewide.${i}_absense
awk -v type=$i '$11==type && $12=="copygain"'  ${query}_vs_Fielder.genomewide.i90.l200syri.out |sort -k1.4,1.4n -k1.5,1.5 -k2,2n >  ./$i/${query}_vs_Fielder.genomewide.${i}_presense
done
done

#NOTAL 
for query in CS2.1 Aikang58 ArinaLrFor Attraktion Jagger Julius Kariega Lancer Landmark Mace Norin61 Renan Spelt Stanley SYMattis Zang1817
do
for i in NOTAL
do
cd /vol3/agis/chengshifeng_group/chenghong/pangenome/02.sv/syri/nucmer
mkdir $i
awk '$6=="-"'  ${query}_vs_Fielder.genomewide.i90.l200syri.out |sort -k1.4,1.4n -k1.5,1.5 -k2,2n >  ./$i/${query}_vs_Fielder.genomewide.${i}_absense
awk '$1=="-"'  ${query}_vs_Fielder.genomewide.i90.l200syri.out |sort -k1.4,1.4n -k1.5,1.5 -k2,2n >  ./$i/${query}_vs_Fielder.genomewide.${i}_presense
done
done

#INS 
for query in CS2.1 Aikang58 ArinaLrFor Attraktion Jagger Julius Kariega Lancer Landmark Mace Norin61 Renan Spelt Stanley SYMattis Zang1817
do
for i in INS
do
cd /vol3/agis/chengshifeng_group/chenghong/pangenome/02.sv/syri/nucmer
mkdir $i
awk -v type=$i '$11==type' ${query}_vs_Fielder.genomewide.i90.l200syri.out |sort -k1.4,1.4n -k1.5,1.5 -k2,2n > ./$i/${query}_vs_Fielder.genomewide.${i}
done
done
