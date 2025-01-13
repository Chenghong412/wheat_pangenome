#step1 simulation
#the output includes several files, such as core.n1.txt, core.n2.txt, and core.n3.txt
perl stat_core.pl #simulate the core-gene family number with the increase of accessions (1 to number of accessions)
perl stat_pan.pl #simulate the pan-gene family number with the increase of accessions (1 to number of accessions)


#step2 merge the output of step1
for d in {1..19}
do
i="n"$d
paste core.${i}.txt pan.${i}.txt |awk '{print  "'${i}',"$2 "," $4}' > ${i}_paste
done
cat *paste |sed 's/n//g' > pan_gene.txt


#step3 diagramming
Rscript plot_pan_core.R 