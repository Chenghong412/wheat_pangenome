library(tidyr)
library(dplyr)
library(ggplot2)

# 读取数据
data <- read.csv("pan_gene.txt", header = TRUE)

# 转换数据为长格式
long_data <- data %>%
  gather(key = "Variable", value = "Value", -Category)

# 绘制图形
p <- ggplot(long_data, aes(x = Category, y = Value, fill = Variable)) +
  geom_boxplot(aes(group = interaction(Category, Variable)), position = position_dodge(width = 0), width = 0.7) +
  geom_smooth(aes(group = Variable, color = Variable), method = "loess", se = FALSE, position = position_dodge(width = 0)) +
  labs(title = "Boxplot with Trend Line by Category and Value", y = "Value", x="Category") +
  theme_minimal()

print(p)

# 保存为PDF
ggsave("output_boxplot_trend_4.pdf", plot = p, width = 10, height = 7)

