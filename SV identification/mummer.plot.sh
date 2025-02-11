#!/bin/sh
show-coords -c out.filtered.delta > out.filtered.coords  
dotplot.R -i out.filtered.coords  -o ${query}_vs_${ref}.${chr}.out -a  ${query} -b ${ref} -s -x -m 5000 -l -q 100000 -r $chr
 