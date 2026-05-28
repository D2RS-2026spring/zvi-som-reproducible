# 数据加载脚本
library(tidyverse)

data <- read_csv("../data/pcp_removal_data.csv")

# 固定处理组顺序
data$treatment <- factor(data$treatment, levels = data$treatment)

# 保存处理后的数据
saveRDS(data, "../data/pcp_data.rds")

print("数据加载完成！")
print(data)
