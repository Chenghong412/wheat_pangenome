library(ggplot2)
library(grid)

# 读取数据
data <- read.table("pan-gene.txt", header=TRUE, sep="\t")

colors = c("Dispensable"="turquoise3", "Soft-core"="wheat2", "Private"="darkseagreen3", "Core"="lightpink2")
bar_color = "grey66"

# 柱状图
bar_plot <- ggplot(data, aes(x=factor(Number.of.Genomes), y=Pan.genes)) +
  geom_bar(stat="identity", fill=bar_color) +
  geom_bar(aes(y=ifelse(Pan.genes>0, -400, NA), fill=Type), stat="identity", show.legend=FALSE) +
  geom_text(aes(label=Pan.genes), position=position_dodge(width=0.9), vjust=-0.5) +
  coord_cartesian(ylim=c(-400, max(data$Pan.genes) + 4000)) +
  theme_minimal() +
  labs(x="Number of Genomes", y="Number of Pan genes") +
  theme(legend.position=c(0.2, -0.1), legend.direction="horizontal") +
  scale_fill_manual(values=colors) +
  scale_y_continuous(breaks=c(-400, 0, seq(0, max(data$Pan.genes), by=5000)))

# 饼图数据
pie_data <- aggregate(Pan.genes ~ Type, data=data, sum)

# 饼图
pie_plot <- ggplot(pie_data, aes(x="", y=Pan.genes, fill=Type)) +
  geom_bar(stat="identity", width=1, show.legend=FALSE) +
  coord_polar(theta="y") +
  theme_void() +
  geom_label(aes(label=scales::percent(Pan.genes/sum(pie_data$Pan.genes))), position = position_stack(vjust=0.5)) +
  scale_fill_manual(values=colors)

# 绘制柱状图
print(bar_plot)

# 将饼图绘制在柱状图的中心
vp <- viewport(width=0.4, height=0.4, just=c("center", "center"))
print(pie_plot, vp=vp)

# 保存图形到PDF
pdf("combined_pan_gene_distribution.pdf", width=10, height=6)
print(bar_plot)
print(pie_plot, vp=vp)
dev.off()

