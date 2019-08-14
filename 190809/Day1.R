x<-c(1,4,6,8,9); x
x[6]
  x[2]
summary(x)  
LETTERSmonth.name
month.abb
api
pi
(x<-1:10);
(z1<-10:1);
(z2<--5:5)
range(x)
(z3<-seq(1,20, 2))
(z4<-seq(20))
sample(1:20, 3)
sample(z2, 3)
names(x) <- LETTERS[1:10]
rainfall <- c(21.6, 23.6, 45.8, 77.0, 102.2, 
              133.3, 327.9, 348.0, 137.6, 49.3, 53.0, 24.9)
rm(v1); rm(z1); rm(z2); rm(z3); rm(z4);
rainfall>100
rainfall<100
rainfall[rainfall>100]
which(rainfall>100)
month.abb[which(rainfall>100)]
month.korname<-c("1월", "2월", "3월", "4월", 
                  "5월", "6월", "7월", "8월",
                 "9월", "10월", "11월", "12월")
month.korname[which(rainfall>100)]
which.max(rainfall)

seq(1:10)
x[x > 5] # x[c(F,F,T,T,T)]

#매트릭스
(vec1<-c(1,2,3))
(vec2<-c(4,5,6))
(vec3<-c(7,8,9))
mat1<-rbind(vec1,vec2,vec3); mat1
mat2<-cbind(vec1,vec2,vec3); mat2
mat1[1,1]
mat1[2,]
mat1[,3]
mat1[1,1,drop=F]
mat1[2,,drop=F]
mat1[,3,drop=F]
rownames(mat1) <-NULL
colnames(mat2) <-NULL
mat1;mat2;
rownames(mat1) <-c("row1", "row2", "row3")
colnames(mat2) <-c("col1", "col2", "col3")
mat1;mat2;
chars<-letters[1:10]
mat1<-matrix(chars)
mat1; dim(mat1)
mat2<-matrix(chars, nrow=1)
mat2
mat3<-matrix(chars, nrow=5)
mat3
mat4<-matrix(chars, nrow=5, byrow=T)
mat4
mat5<-matrix(chars, ncol=5)
mat5
mat6<-matrix(chars, ncol=5, byrow=T)
mat6
mat7 <- matrix(chars, nrow=3, ncol=5)
mat7
mat8<-matrix(chars, nrow=3)
mat8
x1<-matrix(1:8, nrow=2); x1
x1<-x1*3;x1
sum(x1);min(x1); max(x1); mean(x1)
x2<-matrix(1:8, nrow=3); x2
mat1;max(mat1);min(mat1);
sum(mat1);mean(mat1);median(mat1)

mean(x2); sum(x2)
mean(x2[2,])
sum(x2[2,])
rowSums(x2); colSums(x2)
x2

