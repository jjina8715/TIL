today<-Sys.Date()
format(today, "%d %B %Y")
weekdays(today)
months(today)
quarters(today)
Sys.Date()
Sys.time()
unclass(today)
Sys.timezone()
as.Date('1/15/2018',format='%m/%d/%Y')

x1<-'2019-01-10'
as.Date(x1,'%Y-%m-%d')
strptime(x1,"%Y-%m-%d")

x2<-"20180601"
as.Date(x2,'%Y-%m-%d')
strptime(x2,"%Y-%m-%d")

as.Date("2018/01/01 08:00:00")
as.POSIXct("2018/01/01 08:00:00")
as.POSIXlt("2018/01/01 08:00:00")

t<-Sys.time()
ct<-as.POSIXct(t)
lt<-as.POSIXlt(t)
unclass(ct)
unclass(lt)
lt$mon
lt$hour
lt$year+100
as.POSIXct(1449594437,origin="1970-01-01")
as.POSIXlt(1449594437,origin="1970-01-01")

#1
birth<-as.Date('1996-06-12','%Y-%m-%d')
weekdays(birth)
#2
today-birth
#3
chris<-as.Date('2019-12-25','%Y-%m-%d')
weekdays(chris)
chris_lt<-as.POSIXlt(chris)
chris_lt$wday
#4
first<-as.Date('2020-01-01','%Y-%m-%d')
weekdays(first)
#5
format(today, "오늘은 %Y년 %m월 %d일입니다.")

#apply계열 함수
d<-matrix(1:9, ncol=3);d
apply(d,1,sum)
apply(d,2,sum)

weight<-c(65,55,380,72.2,51,NA)
height<-c(170,155,NA,173,161,166)
gender<-c("M","F","M","M","F","F")
df<-data.frame(w=weight, h=height);df

apply(df,1,sum,na.rm=T)
apply(df,2,sum,na.rm=T)

str(lapply(df,sum,na.rm=T))
str(sapply(df,sum,na.rm=T))
tapply(df$w,gender,mean,na.rm=T)
tapply(1:6, gender,sum,na.rm=T)
mapply(paste,1:5,LETTERS[1:5], month.abb[1:5])

count<-1
myf<-function(x,wt=T){
  print(paste0(x," (",count,")"))
  Sys.sleep(3)
  if(wt)
    r<-paste0("*",x,"*")
  else
    r<-paste0("#",x,"#")
  count<<-count+1
  return(r)
}
sapply(df$w, myf)
sapply(df$w, myf, F)
(rr1<-sapply(df$w, myf, wt=F))
str(rr1)
count<-1
(rr2<-sapply(df,myf))
str(rr2)
rr2[1,1]
rr2[1,"w"]

#stringr
install.packages("stringr")
library(stringr)

fruits<-c('apple','Apple','banana','pineapple')
str_detect(fruits, regex('a',ignore_case=T))
str_detect(fruits,'^a')
str_detect(fruits,'^[aA]')
str_detect(fruits, regex('a',ignore_case=T))
str_count(fruits, 'a')
str_c('apple','banana', collapse = '')
str_c(fruits,' name is ', fruits)
str_dup(fruits,3)
str_length(fruits)
str_locate('apple','a')
str_locate(fruits,'a')
str_replace('apple','p','*')
str_replace_all('apple','p','*')
f<-str_c('apple','/','banana')
str_split(f,'/')
str_sub(f,start = 3, end=6)

#시각화
국어<- c(4,7,6,8,5,5,9,10,4,10)  
plot(국어)

plot(국어, type="o", col="blue")       
title(main="성적그래프", col.main="red", font.main=4) 

국어 <- c(4,7,6,8,5,5,9,10,4,10)
수학 <- c(7,4,7,3,8,10,4,10,5,7)

plot(국어, type="o", col="blue")
lines(수학, type="o", pch=16, lty=2, col="red")     
title(main="성적그래프", col.main="red", font.main=4)

국어 <- c(4,7,6,8,5,5,9,10,4,10)
par(mar=c(1,1,1,1), mfrow=c(4,2))

plot(국어, type="p", col="blue", main="type = p", xaxt="n", yaxt="n")
plot(국어, type="l", col="blue", main="type = l", xaxt="n", yaxt="n")
plot(국어, type="b", col="blue", main="type = b", xaxt="n", yaxt="n")
plot(국어, type="c", col="blue", main="type = c", xaxt="n", yaxt="n")
plot(국어, type="o", col="blue", main="type = o", xaxt="n", yaxt="n")
plot(국어, type="h", col="blue", main="type = h", xaxt="n", yaxt="n")
plot(국어, type="s", col="blue", main="type = s", xaxt="n", yaxt="n")
plot(국어, type="S", col="blue", main="type = S", xaxt="n", yaxt="n")

국어 <- c(4,7,6,8,5,5,9,10,4,10); 
수학 <- c(7,4,7,3,8,10,4,10,5,7)
par(mar=c(5,5,5,5), mfrow=c(1,1))
plot(국어, type="o", col="blue", ylim=c(0,10), axes=FALSE, ann=FALSE) 

# x, y 축 추가하기
axis(1, at=1:10, lab=c("01","02","03","04", "05","06","07","08","09","10")) # x축 추가
axis(2, at=c(0,2,4,6,8,10))  # y축 추가

# 그래프 추가하고, 그래프에 박스 그리기
lines(수학, type="o", pch=16, lty=2, col="red")    
box()   # 박스 그리기

# 그래프 제목, 축의 제목, 범례 나타내기
title(main="성적그래프", col.main="red", font.main=4) 
title(xlab="학번", col.lab=rgb(0,1,0))
title(ylab="점수", col.lab=rgb(1,0,0)) 
legend(1, 10, c("국어","수학"), cex=0.8, col=c("blue","red"), pch=c(21,16), lty=c(1,2))  


(성적 <- read.table("성적.txt", header=TRUE));

plot(성적$학번, 성적$국어, main="성적그래프", xlab="학번", ylab="점수",  xlim=c(0, 11), ylim=c(0, 11)) 

ymax <- max(성적[3:5]) #성적 데이터 중에서 최대값을 찾는다(y 축의 크기 제한)
ymax
pcols<- c("red","blue","green")
#png(filename="성적.png", height=400, width=700, bg="white") # 출력을 png파일로 설정
plot(성적$국어, type="o", col=pcols[1], ylim=c(0, ymax), axes=FALSE, ann=FALSE)
axis(1, at=1:10, lab=c("01","02","03","04","05","06","07","08","09","10"))
axis(2, at=c(0,2,4,6,8,10))
box()
lines(성적$수학, type="o", pch=16, lty=2, col=pcols[2])
lines(성적$영어, type="o", pch=23, lty=3, col=pcols[3] )
title(main="성적그래프", col.main="red", font.main=4)
title(xlab="학번", col.lab=rgb(1,0,0))
title(ylab="점수", col.lab=rgb(0,0,1))
legend(1, ymax, names(성적)[c(3,4,5)], cex=0.8, col=pcols, pch=c(21,16,23), lty=c(1,2,3))
#dev.off()
#dev.copy(png,"mytest.png"); dev.off()


# 막대그래프 그리기
barplot(국어)

coldens <- seq(from=10, to=100, by=10)   # 막대그래프의 색밀도 설정을 위한 벡터
xname <- 성적$학번;                       # X 축 값 설정위한  벡터
barplot(성적$국어, main="성적그래프", xlab="학번", ylab="점수", border="red", col="green", density=coldens, names.arg=xname)

# 학생의 각 과목에 대한 각각의 점수에 대한 그래프
성적1<- 성적[3:5]                                           
barplot(as.matrix(성적1), main="성적그래프", ylab="점수", beside=T, col=rainbow(10))

# 학생의 각 과목에 대한 합계 점수에 대한 그래프
xname <- 성적$학번;    #  x축 레이블용 벡터
par(xpd=T, mar=par()$mar+c(0,0,0,4));   # 우측에 범례가 들어갈 여백을 확보
barplot(t(성적1), main="성적그래프", ylab="점수", col=rainbow(3), space=0.1, cex.axis=0.8, names.arg=xname, cex=0.8)
legend(11,30, names(성적1), cex=0.8, fill=rainbow(3));

# 학생의 각 과목에 대한 합계 점수에 대한 그래프(가로막대 그래프)
xname <- 성적$학번;    #  x축 레이블용 벡터
#t() : 행과 열의 위치를 바꾼다
barplot(t(성적1), main="성적그래프", ylab="학번", col=rainbow(3), space=0.1, cex.axis=0.8, names.arg=xname, cex=0.8, horiz=T);
legend(30,11, names(성적1), cex=0.8, fill=rainbow(3));

# 파이그래프
(성적 <- read.table("성적.txt", header=TRUE));
pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10))
pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10), main="국어성적", edges=10)
pie(성적$국어, labels=paste(성적$성명,"\n","(",성적$국어,")"), col=rainbow(10), clockwise=T)
