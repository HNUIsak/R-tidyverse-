setwd("D:\\Github_Code\\R-tidyverse-\\配套数据")
# ggplot的语法包括10个部件：
# 
# 数据 (data)
# 映射 (mapping)
# 几何对象 (geom)
# 标度 (scale)
# 统计变换 (stats)
# 坐标系 (coord)
# 位置调整 (Position adjustments)
# 分面 (facet)
# 主题 (theme)
# 输出 (output)
# 其中前3个是必须的，其他部件ggplot2会自动帮你做好它认为"最优"的配置，当然也都可以手动定制。

# ggplot2基本绘图模板：
# ggplot(data = <DATA>,        
#        mapping = aes(<MAPPINGS>)) +        
#   <GEOM_FUNCTION>(        
#     mapping = aes(<MAPPINGS>),        
#     stat = <STAT>,        
#     position = <POSITION>) +        
#   <SCALE_FUNCTION> +        
#   <COORDINATE_FUNCTION> +        
#   <FACET_FUNCTION> +        
#   <THEME_FUNCTION>
# 注意： 添加图层的加号只能放在行尾，而不能放在下一行行头。

#2.mapping


#3.geom
# ggplot2提供了50余种 "几何对象"，不同的几何对象支持的美学会有些不同，但均以 geom_xxxx() 的方式命名，常用的有：
# 
# geom_point(): 散点图
# geom_line(): 折线图
# geom_smooth(): 光滑（拟合）曲线
# geom_bar()/geom_col(): 条形图
# geom_histogram(): 直方图
# geom_density(): 概率密度图
# geom_boxplot(): 箱线图
# geom_abline()/geom_hline()/geom_vline: 参考直线

load("ecostats.rda")
head(ecostats)
#针对分省数据绘制人均GDP与年份之间的折线图，若不区分省份，每个年份都对应31个省份人均GDP值
ggplot(ecostats,aes(x=Year,y=gdpPercap))+
  geom_line()
#应该区分不同省份，这就需要显式地映射分组美学
ggplot(ecostats,aes(Year,gdpPercap))+
  geom_line(aes(group=Region),alpha=0.2)+
  geom_smooth(se=F,linewidth=1.2)

#4.scale标度
# 标度函数控制几何对象中的标度映射：不只是x, y轴，还有color, fill, shape, size产生的图例。它们是数据中的连续或分类变量的可视化表示，这需要关联到标度，所以要用到映射
# 用scale_*_continuous()修改连续变量坐标轴的刻度和标签：
# 
# 参数breaks设置各个刻度的位置
# 参数labels设置各个刻度对应的标签
install.packages("showtext")
library(showtext)
font_add("heiti", "simhei.ttf")
showtext_auto()
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  scale_y_continuous(breaks = seq(15, 40, by = 10), labels = c("一五","二五","三五"))


