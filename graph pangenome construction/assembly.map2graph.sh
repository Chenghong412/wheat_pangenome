#!/bin/sh
for i in CS2.1 Aikang58 ArinaLrFor Attraktion Fielder Jagger Julius Kariega Lancer Landmark Mace Norin61 Renan Spelt Stanley SYMattis Zang1817 Cadenza Claire Paragon Robigus Weebill1
do
minigraph genomewide.graph.gfa ${i}.genome.fa > ${i}.map2graph.gaf
done

