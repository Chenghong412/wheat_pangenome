#!/bin/sh
busco -i ${sample}.ref.fa -c 5 -o ${sample}_genome_busco -m geno -l embryophyta_odb10 -f --offline

#busco evaluation was performed for both nucleotide and protein sequence

