library(ggplot2)
library(dplyr)
#Q1. 
ggplot(mpg, aes(x=cty,y=hwy)) + geom_point(size=2, color="red")
ggsave("result1.png")

#Q2.
ggplot(mpg, aes(x=class)) + geom_bar(fill=rainbow(7)) + theme_light()
ggsave("result2.png")

#Q3. 
data <- midwest %>% filter(poptotal<=500000 & popasian<=10000)
ggplot(data, aes(x=poptotal, y=popasian)) + geom_point(aes(colours="red"))
ggsave("result3.png")

#Q4. 
data <- subset(mpg, select=c(class, cty),
              subset=(class %in% c("compact", "subcompact", "suv")))
ggplot(data, aes(x=class,y=cty)) + geom_boxplot()
ggsave("result4.png")

#Q5. 
product_click <- read.table("product_click.log", header=TRUE)
ggplot(product_click, aes(x=pid)) + geom_bar(fill=rainbow(15)) + theme_light()
ggsave("result5.png")

#Q6.
ggplot(product_click, aes(x=pid)) + geom_bar(fill=rainbow(15)) + theme_light()
product_click <- product_click %>% mutate(요일명 = weekdays(as.Date(as.character(time),'%Y%m%d')))

ggplot(data=product_click, aes(x=요일명)) + geom_bar(aes(fill=요일명))
ggsave("result6.png")

