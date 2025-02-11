#!/bin/sh
show-coords -c out.filtered.delta > out.filtered.coords      # Convert alignment information to the format required by plotting, -c is required
plotsr \
         --sr sut.filtered.coords  \
         --genomes genomes.txt -o output.pdf -v -S 0.5 -W70 -H 10 -d 300 -f 8

#The format of genomes.txt file is as follows:
Fielder.chrsize.bed     Fielder ft:cl;lw:2;lc:#ff0000 #ft,file type;cl for lw,line width;lc,line color;
Aikang58.chrsize.bed    Aikang58        ft:cl;lw:2;lc:#ff0000