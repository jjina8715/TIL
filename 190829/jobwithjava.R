library(RSelenium)
library(stringr)
library(dplyr)
library(wordcloud2)

remDr<-remoteDriver(remoteServerAddr="localhost", port=4445, browserName="chrome")
remDr$open();
remDr$navigate("http://www.jobkorea.co.kr/")
webElem<-remDr$findElement(using="css", "[name='stext']")
webElem$sendKeysToElement(list("자바", key="enter"))

keywords<-NULL
page<-2

for(j in 1:20){
  for(i in 1:30){
    tags <- remDr$findElements(using='css selector',  paste0('#smGiList > div.list > ul > li:nth-child(',i,') > span.detailInfo > p.gibInfo > a'))
    tag <-sapply(tags,function(x){x$getElementText()})
    keywords <- c(keywords, unlist(str_split(tag,', ')))
  }
  pagebtn<-remDr$findElements(using='xpath',  paste0('//*[@id="smGiList"]/div[3]/ul/li[',page,']/a'))
  sapply(pagebtn,function(x){x$clickElement()})
  Sys.sleep(2)
  page <- page+1;
  if(j == 10){
    page<-2
    nextbtnpath <- paste0('//*[@id="smGiList"]/div[3]/p/a')
    nextbtn<-remDr$findElements(using='xpath', nextbtnpath)
    sapply(nextbtn,function(x){x$clickElement()})
    Sys.sleep(2)
  }
}
write.table(keywords, "jobwithjava.txt", quote = F, row.names = F,col.names = F)

tag_table<-sort(table(readLines("jobwithjava.txt")), decreasing = T)
tag_frame<-as.data.frame(tag_table[1:15])
tag_frame<-rename(tag_frame, 키워드=Var1, 빈도수=Freq)
write.csv(tag_frame, "jobwithjava.csv", quote = F,row.names = F)
wordcloud2(tag_table, color="random-dark", minRotation=-pi/6,maxRotation = -pi/6,rotateRatio = 1)
