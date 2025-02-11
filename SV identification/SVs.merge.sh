#!/bin/sh
SURVIVOR merge syri.vcf.list 1000 2 1 1 0 0 merged.vcf
#1000 indicates the maximum distance between SVs allowed to merge (1000bp); 2 indicates that only output the SV identified by both tools; 1 indicates that only output the SVs identified  as the same SV type by boty tools; 1 means that only the SV in the same direction identified by both tools is output; 30 means that only SVs with a length greater than 30bp is considered