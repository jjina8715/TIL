#7-1
mpg_copy<-mpg %>% mutate(efficiency=cty+hwy)
#7-2
mpg_copy<-mpg_copy %>% mutate(mean_efficiency=efficiency/2)
#7-3
mpg_copy %>% select(model,mean_efficiency) %>% 
  arrange(desc(mean_efficiency)) %>% head(3)
#7-4
mpg %>% mutate(efficiency=cty+hwy,mean_efficiency=efficiency/2) %>% 
  select(model,mean_efficiency) %>%
  arrange(desc(mean_efficiency)) %>% head(3)

#8-1
mpg %>% group_by(class) %>% summarise(mean_cty=mean(cty))
#8-2
mpg %>% group_by(class) %>% summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty))
#8-3
mpg %>% group_by(manufacturer) %>% summarise(mean_hwy=mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% head(3)
#8-4
mpg %>% filter(class=="compact") %>% group_by(manufacturer) %>% 
  summarise(cnt_create=n()) %>% arrange(desc(cnt_create))

#9
fuel<-data.frame(fl=c("c","d","e","p","r"),
                 price_fl=c(2.35,2.38,2.11,2.76,2.22),
                 stringsAsFactors = F)
fuel
#9-1
mpg<-left_join(mpg,fuel,by="fl")
#9-2
mpg %>% select(model,fl,price_fl) %>% head(5)

#10-1
midwest<-midwest %>% mutate(percent_minority=(poptotal-popadults)/poptotal*100)
#10-2
midwest %>% arrange(desc(percent_minority)) %>% 
  select(county) %>% head(5)
#10-3
midwest<-midwest %>% mutate(minority_rank=ifelse(percent_minority>=40,"large",
                                                 ifelse(percent_minority>=30,"middle","small")))
midwest %>% select(minority_rank,county) %>% 
  group_by(minority_rank) %>% summarise(cnt=n())
#10-4
midwest<-midwest %>% mutate(percent_asian=popasian/poptotal*100)
midwest %>% select(state,county,percent_asian) %>% 
  arrange(percent_asian) %>% head(10)

#11
mpg[c(65,124,131,153,212),"hwy"]<-NA
#11-1
table(is.na(mpg$drv))
table(is.na(mpg$hwy))
#11-2
mpg %>% filter(!is.na(hwy)) %>% group_by(drv) %>%
  summarise(mean_hwy=mean(hwy)) %>% arrange(desc(mean_hwy))

#12
mpg[c(10,14,58,93),"drv"]<-"k"
mpg[c(29,43,129,203),"cty"]<-c(3,4,38,42)
#12-1
table(mpg$drv)
mpg$drv<-ifelse(mpg$drv %in% "k",NA,mpg$drv)
#12-2
boxplot(mpg$cty)
boxplot(mpg$cty)$stat
mpg$cty<-ifelse(mpg$cty<9|mpg$cty>26, NA, mpg$cty)
#12-3
mpg %>% filter(!is.na(cty)&!is.na(drv)) %>% group_by(drv) %>% 
  summarise(mean_cty=mean(cty))
#12-4