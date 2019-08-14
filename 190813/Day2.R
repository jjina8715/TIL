x2<-matrix(1:8, nrow=3); x2
apply(x2, 2, sum); apply(x2, 2, sum)  
?apply
apply(x2, 1, max) #행단위
apply(x2, 1, min)
apply(x2, 1, mean)

apply(x2, 2, max) #열단위
apply(x2, 2, min)
apply(x2, 2, mean)

#배열
a1 <- array(1:30, dim=c(2,3,5))

a1
a1[1,3,4]
a1[,,3]
a1[,2,]
a1[1,,]

#factor
score <-c(1,3,2,4,2,1,3,5,1,3,3,3)
class(score)
summary(score)

#factor 만드는 방법: factor함수 호출
f_score <- factor(score)
f_score

#summary of factor show the number of each levels
summary(f_score)
levels(f_score)
class(f_score)
data <- c("월","수","토","월","목","화")
summary(data)

day <- factor(data)
summary(day)

# 내장 데이터셋
data()
iris
View(iris)
str(iris)
summary(iris)

#Dataframe
no <- c(1,2,3,4)
name <- c('Apple','Banana','Peach','Berry')
qty <- c(5,2,7,9)
price <- c(500,200,200,500)
fruit <- data.frame(no, name, qty, price)
str(fruit) #많이 사용
fruit
View(fruit)

#vector form
fruit[1,]
fruit[-1,]
fruit[,2]
fruit[,3]
fruit[, c(3,4)]
fruit[3,2]
fruit[3,1]

fruit[,3]
fruit[3] #데이터 프레임 형식 유지

#vector form
fruit$qty #이름 지정
fruit[[3]]

str(fruit$qty)
str(fruit[3])

# dataframe exam1
english <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)
classnum <- c(1,1,2,2)
df_midterm <- data.frame(english, math, classnum)
df_midterm
str(df_midterm)
colnames(df_midterm); 
rownames(df_midterm); 
names(df_midterm)
mean(df_midterm$english)
mean(df_midterm$math)
df_midterm2 <- data.frame(
  c(90, 80, 60, 70), c(50, 60, 100, 20), c(1,1,2,2))
colnames(df_midterm2); rownames(df_midterm2); names(df_midterm2)
df_midterm2
df_midterm2 <- data.frame(
  영어=c(90, 80, 60, 70), 수학=c(50, 60, 100, 20), 
  클래스=c(1,1,2,2))
df_midterm2
df_midterm2$영어

df <- data.frame(var1=c(4,3,8), var2=c(2,6)) # 오류
df <- data.frame(var1=c(4,3,8), var2=c(2,6,1))
str(df)
df$var_sum <- df$var1 + df$var2
df$var_mean <- df$var_sum/2
df$result <- ifelse(df$var1>df$var2, 
                    "var1이 크다", "var1이 작다")
df
getwd()

#csv파일열기
score <- read.csv("score.csv")
score
str(score)
score$sum <- score$math+score$english+score$science
score$result <- ifelse(score$sum >= 200, "pass", "fail")
score

summary(score$result)
table(score$result)
summary(factor(score$result))
score$result <- factor(score$result); str(score)
summary(score)

score$id = as.character(score$id)
score$class = factor(score$class)
score$grade <- ifelse(score$sum>=230, "A",
                     ifelse(score$sum>=215,"B",
                            ifelse(score$sum>=200, "C", "D")));

# order() 와 sort()
v <- c(10,3,7,4,8)
sort(v)
order(v)

emp <- read.csv(file.choose(), stringsAsFactors = FALSE)
emp; str(emp);

# 1. emp에서 직원 이름
emp$ename
emp[,2]
emp[,"ename"]
emp[,2, drop=FALSE] 
emp[,"ename",drop=F] 
emp[2]
emp["ename"] 

# 2. emp에서 직원이름, 잡, 샐러리
emp[,c(2,3,6)]
emp[,c("ename","job","sal")]
subset(emp,select = c(ename, job, sal))

# 3. emp에서 1,2,3 행 들만
emp[1:3,]
emp[c(1,2,3),]

# 4. ename이 "KING"인 직원의 모든 정보
emp[9,] 
emp$ename=="KING"
subset(emp,subset= emp$ename=="KING")
subset(emp,emp$ename=="KING") 
emp[c(F,F,F,F,F,F,F,F,T,F,F,F,F,F,F,F,F,F,F,F),]
emp[emp$ename=="KING",] 

# 5. select ename,sal from emp where sal>=2000
subset(emp, select=c("ename","sal"), subset= emp$sal>= 2000)
emp[emp$sal>=2000,c("ename","sal")]

# 6. select ename,sal from emp where sal between 2000 and 3000
subset(emp, select=c("ename","sal"), subset=(sal>=2000 & sal<=3000))
emp[emp$sal>=2000 & emp$sal <=3000, c("ename","sal")]

#LIST
lds <- list(1,2,3)
lds
lds+100
lds[1]
lds[1]+10
lds[[1]]+10
names(lds) <- LETTERS[1:3]
lds
lds[[2]]
lds[["B"]]
lds$B

a<-list(
  a=1:3,
  b="a string",
  c=pi,
  d=list(-1,-5)
)
a
a[1]#list
a[[1]]#vector 
a$a
a[[1]][1]
a$a[1]

a[1]+1
a[[1]]+1

unlist(a[1])

paste("I'm","Duli","!!")

fruit <- c("Apple", "Banana", "Strawberry")
food <- c("Pie","Juice", "Cake")
paste(fruit, food)

paste(fruit, food, sep="")
paste(fruit, food, sep=":::")
paste(fruit, food, sep="", collapse="-")
paste(fruit, food, sep="", collapse="")
paste(fruit, food, collapse=",")

site<-"http://movie.naver.com/movie/point/af/list.nhn?page="
pageNum <- 10
url <- paste(site, pageNum, sep="")
url

#지금까지 만들어진 데이터set와 함수 저장
ls()
length(ls())
save(list=ls(),file="all.RData") # varience will save in "all.rda" of rexam
rm(list=ls())
ls()
load("all.RData")

#read file data
nums <- scan("sample_num.txt")
word_ansi <- scan("sample_ansi.txt",what="")
words_utf8 <- scan("sample_utf8.txt", what="",encoding="UTF-8")
lines_ansi <- readLines("sample_ansi.txt")
lines_utf8 <- readLines("sample_utf8.txt",encoding="UTF-8")

df2 <- read.table("product_click.log")

#제어문
#if else
randomNum <-sample(1:10,1)
if(randomNum>5){
  cat(randomNum,":5보다 크군요","\n")
}else{
  cat(randomNum,":5보다 작거나 같군요","\n")
}

if(randomNum%%2){
  cat(randomNum,":홀수","\n")
}else{
  cat(randomNum,":짝수","\n")
}


if(randomNum%%2 == 1){
  cat(randomNum,":홀수","\n")
}else{
  cat(randomNum,":짝수","\n")
}

score <- c(50)
if (score >=90){
  cat(score,"는 A등급입니다","\n")
}else if (score >=80){
  cat(score,"는 B등급입니다","\n")
}else if (score >=70){
  cat(score,"는 C등급입니다","\n")
}else if (score >=60){
  cat(score,"는 D등급입니다","\n")
}else {
  cat(score,"는 F등급입니다","\n")
}

#for문
#for 실습
for(data in month.name)print(data);
for(data in month.name)print(data);print("ㅋㅋ")
for(data in month.name){print(data);print("ㅋㅋ")}

for(n in 1:5)cat("hello?","\n");

for(i in 1:5){
  for(j in 1:5){
    cat("i=",i,"j=",j,"\n")
  }
}

for(i in 1:9){
  for(j in 1:9){
    # if(i*j>30) break;
    cat(i,"*",j,"=",i*j,"\t")
  }
  cat("\n")
}

bb <- F
for(i in 1:9){
  for(j in 1:9){
    if(i*j>30){
      bb<-T
      break
    } 
    cat(i,"*",j,"=",i*j,"\t")
  }
  cat("\n")
  if(bb) #bb가 TRUE이면
    break
}

#while문
i<-1
while(i <= 10){
  cat(i,"\n")
  i <- i+1
}
cat("종료 후 :",i,"\n")

i<-1
while (i<=10) {  
  cat(i,"\n");
}

i<-1
while (i<=10) {
  cat(i,"\n")
  i<-i+2
}

i<-1
while (i<=10) {
  cat(i,"\n")
  i<-i+1
}

#switch 문
month <- sample(1:12,1)
month <- print(paste(month,"월",sep=""))
result <- switch(EXPR=month,
                 "12월"=,"1월"=,"2월"="겨울",
                 "3월"=,"4월"=,"5월"="봄",
                 "6월"=,"7"=,"8월"="여름",
                 "가을")
cat(month,"는 ",result,"입니다","\n",sep="")
ls()
num <- sample(1:10,1)
num
(switch(EXPR = num,"A","B","C","D"))

for(num in 1:10){
  cat(num,":",switch(EXPR = num,"A","B","C","D"),"\n")
}

for(num in 1:10){
  #num<-paste(num,"",sep = "")
  #num<-as.character(num)
  num<-paste(num,"")
  cat(num,":",switch(EXPR = num,"7"="A","8"="B","9"="C","10"="D", "ㅋ"),"\n")
}
