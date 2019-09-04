install.packages("DBI")
install.packages("RJDBC")
library(DBI)
library(RJDBC)

drv<-JDBC("oracle.jdbc.driver.OracleDriver", "C:/ojdbc6.jar")
conn<-dbConnect(drv, "jdbc:oracle:thin:@localhost:1521:xe", "jdbctest","jdbctest")
conn

dbListTables(conn)

#data read
result1<-dbReadTable(conn, "VISITOR") #테이블은 대문자
class(result1)

result2<-dbGetQuery(conn, "select * from VISITOR")
class(result2)

rs<-dbSendQuery(conn, "select * from VISITOR")
class(rs)
ret1<-dbFetch(rs, 1)
ret2<-dbFetch(rs, 2)

#data create&insert/ insert
dbWriteTable(conn, "book", data.frame(bookname=c("자바의 정석", "하둡 완벽 입문", "이것이 리눅스다"),
                                      price=c(30000, 25000, 32000)))
dbWriteTable(conn, "cars", head(cars, 3))

dbSendUpdate(conn, "INSERT INTO VISITOR VALUES ('R언어', sysdate, 'R언어로 데이터를 입력해요', visitor_seq.nextval)")
dbSendUpdate(conn, "INSERT INTO VISITOR VALUES ('하둡', sysdate, '대용량 데이터 분산저장 & 처리기술', visitor_seq.nextval)")

#data insert/ update
dbSendUpdate(conn, "INSERT INTO CARS(speed, dist) values(1,1)")
dbSendUpdate(conn, "INSERT INTO CARS(speed, dist) values(2,2)")
dbReadTable(conn, "CARS")
dbSendUpdate(conn, "update CARS set dist=dist*100 where speed=1")
dbReadTable(conn, "CARS")
dbSendUpdate(conn, "update CARS set dist=dist*3 where speed=1")
dbReadTable(conn, "CARS")

# table delete
dbRemoveTable(conn, "CARS")


#예제
df<-read.table("product_click.log", stringsAsFactors = F)
names(df)<-c("click_time","pid")
df$click_time<-as.character(df$click_time)
dbWriteTable(conn, "PRODUCTLOG", df)
result4<-dbReadTable(conn, "PRODUCTLOG")
result4

dbWriteTable(conn, "MTCARS", mtcars)
rs<-dbSendQuery(conn, "select * from mtcars where cyl=4")
rs
dbFetch(rs)
dbClearResult(rs)

rs<-dbSendQuery(conn, "select * from mtcars")
ret1<-dbFetch(rs, 10)
ret2<-dbFetch(rs)
dbClearResult(rs)
nrow(ret1)
nrow(ret2)


install.packages("Rserve")

