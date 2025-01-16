# 导入 ggplot2 包
library(ggplot2)

# 读取数据文件
data <- read.table("Fla-pan--gene-number-tr.txt", header = TRUE, stringsAsFactors = FALSE)
 type_colors <- c("darkseagreen2","turquoise3", "wheat2", "lightpink2")


# 定义物种顺序

species_order <- c("Flaveria_floridana.longest.pep","Flaveria_brownii.longest.pep","Flaveria_cronquistii.longest.pep","Flaveria_oppositifolia.longest.pep","Flaveria_linearis.longest.pep","Flaveria_palmeri.longest.pep","Flaveria_pringlei.longest.pep","Flaveria_anomala.longest.pep","Flaveria_chlorifolia.longest.pep","Flaveria_vaginata.longest.pep","Flaveria_pubescens.longest.pep","Flaveria_kochiana.longest.pep","Flaveria_angustifolia.longest.pep","Flaveria_sonorensis.longest.pep","Flaveria_campestris.longest.pep","Flaveria_trinervia.longest.pep","Flaveria_robusta.longest.pep","Flaveria_bidentis.longest.pep")
# 使用 factor 函数为 Orthogroup 列重新赋值，按照物种顺序排序
data$Orthogroup <- factor(data$Orthogroup, levels = species_order)

# 使用 gather 函数将数据从宽格式转换为长格式
data_long <- tidyr::gather(data, key = "Type", value = "Count", -Orthogroup)

# 创建堆叠柱状图，将 Type 设置为 fill
plot <- ggplot(data_long, aes(x = Orthogroup, y = Count, fill = Type)) +
  geom_bar(stat = "identity") +
  labs(title = "不同类型基因数量", x = "Orthogroup", y = "数量") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
 scale_fill_manual(values = type_colors)#  scale_fill_brewer(palette = "Set3")  # 使用 Set3 颜色调色板

# 保存为 PDF 文件
ggsave("gene_counts_stacked.pdf", plot, device = "pdf")

