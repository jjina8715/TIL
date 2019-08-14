#문제26
L1 <- list(name="scott", sal=3000)
result1<- L1[["sal"]]
#문제27
L2 <- list("scott", c(100,200,300))
#문제28
L3<-list(c(3,5,7), c("A", "B", "C"))
L3
L3[[2]][1]<-"Alpha"
#문제29
L4<-list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4[["alpha"]]+10
#문제30
L5<-list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))
mean(c(unlist(L5[["math"]]), 
       unlist(L5[["writing"]]),unlist(L5[["reading"]])))
#제어문
#문제1
grade<-sample(1:6,1)
ifelse(grade>=1&&grade<=3, paste(grade, "학년은 저학년입니다."),
       ifelse(grade>=4&&grade<=6, paste(grade, "학년은 고학년입니다.")))
#문제2
choice<-sample(1:5,1)
cat("결과값: ", switch(EXPR = choice, 300+5,300-50,300*50,500/50,300%%50))
#문제3
time<-32150 
cat(floor(time/360),"시간 ", floor(time%%360/60),"분 ", time%%360%%60, "초", sep="")
#문제4
count<-sample(1:10, 1)
deco<-sample(1:3, 1)
char<-ifelse(deco==1, "*",
             ifelse(deco==2, "$",
                    ifelse(deco==3, "#")))
i <- 1
while(i<=count){
  cat(deco, "")
  i<-i+1
}
#문제5
score<-sample(0:100, 1)
test<-as.character(floor(score/10))
level<-switch(EXPR = test, "6"="D등급","7"="C등급", "8"="B등급",
              "9"="A등급", "10"="A등급","F등급")
cat(score,"점은",level,"입니다.")
#문제6
(alpha<-paste(LETTERS, letters, sep=""))
