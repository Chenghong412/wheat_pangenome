library('pheatmap')
 library(stringr)
df <- read.csv('output_file.txt', header = TRUE, stringsAsFactors = FALSE, row.names = 1,sep="\t")
tmm <- df[,1:18]
pdf(file='pan_pav.pdf',20,80)
pheatmap(tmm,
 color = colorRampPalette(c("turquoise3", "yellow", "lightpink2"), bias=0.6)(100),
 cluster_row = FALSE,
 cluster_cols = FALSE,
show_colnames = FALSE,
 show_rownames = FALSE,
 display_numbers = FALSE,
 cellwidth = 45, cellheight = 0.05,
 fontsize_row = 5,
fontsize_col = 5 )
dev.off()


