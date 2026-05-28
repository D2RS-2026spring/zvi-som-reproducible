# 绘图脚本
library(tidyverse)

data <- readRDS("../data/pcp_data.rds")

# 添加标签
data <- data %>%
  mutate(label = case_when(
    treatment == "Control" ~ "Control",
    treatment == "nZVI100" ~ "nZVI",
    treatment == "Strain_L3" ~ "Strain L3",
    treatment == "Strain_L3+SE" ~ "L3 + SE",
    treatment == "Strain_L3+HA" ~ "L3 + HA",
    treatment == "Strain_L3+nZVI100+SE" ~ "L3 + nZVI + SE",
    treatment == "Strain_L3+nZVI100+HA" ~ "L3 + nZVI + HA"
  ))

# 绘图
p <- ggplot(data, aes(x = label, y = removal_efficiency)) +
  geom_col(fill = "steelblue", width = 0.7) +
  geom_errorbar(aes(ymin = removal_efficiency - sd, 
                    ymax = removal_efficiency + sd),
                width = 0.2) +
  labs(title = "PCP去除效率对比",
       x = "处理组", y = "PCP去除效率 (%)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# 保存图片
ggsave("../output/figure_reproduced.png", p, width = 8, height = 5)

print("图片已保存！")
