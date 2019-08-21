library(dplyr)

exam<-read.csv("csv_exam.csv")

exam
#조건에 맞는 데이터만 추출
exam %>% filter(class==1)
exam %>% filter(class %in% c(1,3,5))
#필요한 변수만 추출
exam %>% select(math)
exam %>% select(-math)
exam %>% 
  filter(class==1) %>% 
    select(english)
exam %>% select(id, math) %>% head
#순서대로 정렬
exam %>% arrange(math)
exam %>% arrange(desc(math))
#파생변수 추가
exam %>% mutate(total=math+english+science) %>% head
exam %>% mutate(total=math+english+science) %>% arrange(total) %>% head
#집단별로 요약
exam %>% summarise(mean_math=mean(math)) #전체
exam %>% group_by(class) %>%              #집지
  summarise(mean_math=mean(math),
            sum_math=sum(math),
            median_math=median(math),
            n=n())

install.packages("ggplot2")
str(ggplot2::mpg)
mpg<-as.data.frame(ggplot2::mpg)

#각 집단 별로 다시 집단 나누기
mpg %>% 
  group_by(manufacturer, drv) %>% #회사별 구방방식별
  summarise(mean_cty=mean(cty)) %>% #cty 평균 산출
  head

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="suv") %>% 
  mutate(tot=(cty+hwy)/2) %>% 
  summarise(mean_tot=mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)


#데이터 합치기
#반별 담임교사 명단 생성
name<-data.frame(class=c(1,2,3,4,5), teacher=c("kim", "lee","park","choi","jung"))
exam_new<-left_join(exam,name,by="class") #가로로 합치기 + bind_cols()
#세로로 합치기
group_a<-data.frame(id=c(1,2,3,4,5), test=c(60,80,70,90,85))
group_b<-data.frame(id=c(6,7,8,9,10), test=c(70,83,65,95,80))
group_all<-bind_rows(group_a,group_a) 

one<-data.frame(x=c(1:1000000), y=c(1:1000000))
two<-data.frame(x=c(1:1000000), y=c(1:1000000))
system.time(rbind(one,two))
system.time(bind_rows(one,two))
system.time(cbind(one,two))
system.time(bind_cols(one,two))

#데이터 정제
#결측치
df<-data.frame(sex=c("M","F",NA,"M","F"), score=c(5,4,3,4,NA))
is.na(df)
table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))
mean(df$score)
sum(df$score)
df %>% filter(is.na(score))
df %>% filter(!is.na(score))

df_nomiss<-df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)
df_nomiss<-df %>% filter(!is.na(score)&!is.na(sex))
df_nomiss
df_nomiss2<-na.omit(df)
df_nomiss2

mean(df$score, na.rm = T)
sum(df$score, na.rm=T)
exam<-read.csv("csv_exam.csv")
eaxm[c(3,8,15),"math"]<-NA
exam %>% summarise(mean_math=mean(math))
exam %>% summarise(mean_math=mean(math,na.rm=T))
exam %>% summarise(mean_math=mean(math,na.rm=T),
                   sum_math=sum(math,na.rm=T),
                   median_math=median(math,na.rm = T))
exam$math<-ifelse(is.na(exam$math),55,exam$math)
table(is.na(exam$math))
mean(exam$math)

#이상치
outlier<-data.frame(sex=c(1,2,1,3,2,1),score=c(5,4,3,4,2,6))
table(outlier$sex)
table(outlier$score)
outlier$sex<-ifelse(outlier$sex==3,NA,outlier$sex)
outlier$score<-ifelse(outlier$score>5,NA,outlier$score)
outlier
outlier %>% filter(!is.na(sex)&!is.na(score)) %>% 
  group_by(sex) %>% summarise(mean_score=mean(score))

mpg<-as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats
mpg$hwy<-ifelse(mpg$hwy<12|mpg$hwy>37,NA,mpg$hwy)
table(is.na(mpg$hwy))
mpg %>% group_by(drv) %>% summarise(mean_hwy=mean(hwy,na.rm = T))
