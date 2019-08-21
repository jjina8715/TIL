library(dplyr)
#1
install.packages("ggplot2")
str(ggplot2::mpg)
mpg<-as.data.frame(ggplot2::mpg)
#1-1
dim(mpg)
#1-2
mpg %>% head(10)
#1-3
mpg %>% tail(10)
#1-4
View(mpg)
#1-5
summary(mpg)
#1-6
str(mpg)

#2-1
mpg<-rename(mpg, city=cty,highway=hwy)
#2-2
mpg %>% head(5)

#3-1
midwest<-as.data.frame(ggplot2::midwest)
str(midwest)
head(midwest)
#3-2
midwest<-rename(midwest, total=poptotal, asian=popasian)
#3-3
midwest<-midwest %>% mutate(persent_asian=asian/total*100)
#3-4
avg<-mean(midwest$persent_asian)
midwest<-midwest %>% mutate(scale_asian=ifelse(persent>avg, "large", "small"))

#4-1
mpg %>% filter(displ<=4) %>% 
  summarise(mean_highway=mean(highway)) 
mpg %>% filter(displ>=5) %>% 
  summarise(mean_highway=mean(highway))
#4-2
mpg %>% filter(manufacturer=="audi") %>% 
  summarise(mean_sity=mean(city))
mpg %>% filter(manufacturer=="toyota") %>% 
  summarise(mean_sity=mean(city))
#4-3
mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda")) %>% 
  summarise(mean_highway = mean(highway))

#5-1
mpg_city<-mpg %>% select(class, city)
head(mpg_city)
#5-2
mpg_city %>% filter(class %in% c("suv", "compact")) %>% 
  group_by(class) %>% arrange(desc(city)) %>% head(10)
  
#6-1
mpg %>% filter(manufacturer=="audi") %>% 
  arrange(desc(highway)) %>% 
  head(5) %>% 
  select(model)
  
  


