#!/bin/sh
nucmer --maxmatch -c 100 -b 500 -l 50 refgenome qrygenome       # genome or chromosome alignment. 
delta-filter -m -i 90 -l 100 out.delta > out.filtered.delta     # Remove small and lower quality alignments
show-coords -THrd out.filtered.delta > out.filtered.coords      # Convert alignment information to a .TSV format as required by SyRI, -THrd is required.