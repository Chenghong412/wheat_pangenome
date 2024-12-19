#!/bin/sh
orthofinder -f ./ -M msa -A mafft -T fasttree -a 40 -t 40 -S diamond
#./ directory should include the protein sequences of all the assemblies in fasta format