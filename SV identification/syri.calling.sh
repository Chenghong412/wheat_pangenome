ref=Fielder
for query in CS2.1 Aikang58 ArinaLrFor Attraktion Jagger Julius Kariega Lancer Landmark Mace Norin61 Renan Spelt Stanley SYMattis Zang1817
do
for chr in chr1A chr2A chr3A chr4A chr5A chr6A chr7A chr1B chr2B chr3B chr4B chr5B chr6B chr7B chr1D chr2D chr3D chr4D chr5D chr6D chr7D
do
pref=${query}_vs_${ref}
pref2=${query}_vs_${ref}.${chr}
ref_genome=Wheat_${ref}.${chr}.fa
query_genome=Wheat_${query}.${chr}.fa
delta=/nucmer/${pref2}.i90.l200.1filter.delta
coords=/nucmer/${pref2}.i90.l200.1filter.syri.coords
syri -c ${coords} -d ${delta} -r ${ref_genome} -q ${query_genome} --nosnp --prefix ${pref2}.i90.l200
delta-filter -m -i 90 -l 100 out.delta > out.filtered.delta     # Remove small and lower quality alignments
show-coords -THrd out.filtered.delta > out.filtered.coords      # Convert alignment information to a .TSV format as required by SyRI, -THrd is required.
done
done
