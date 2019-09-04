
library(DBI)
library(RJDBC)
library(ggplot2)

drv<-JDBC("oracle.jdbc.driver.OracleDriver", "C:/ojdbc6.jar")
conn<-dbConnect(drv, "jdbc:oracle:thin:@localhost:1521:xe", "jdbctest","jdbctest")

dbWriteTable(conn, "iris", data.frame(SLENGTH=iris$Sepal.Length, SWIDTH=iris$Sepal.Width, 
                                      PLENGTH=iris$Petal.Length, PWIDTH=iris$Petal.Width, 
                                      SPECIES=iris$Species))
result<-dbReadTable(conn,"IRIS")
result

ggplot(result, aes(x=SLENGTH, y=SWIDTH, color=SPECIES)) + geom_point()
ggsave("db1.jpg")
ggplot(result, aes(x=SLENGTH, y=SWIDTH)) + geom_point(aes(colour = SPECIES))
ggsave("db2.jpg")
