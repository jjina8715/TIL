library(RSelenium)
reviews<-NULL
remDr<-remoteDriver(remoteServerAddr="localhost",port=4445L,browserName="chrome")
remDr$open()
remDr$navigate("https://hkg.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204")
remDr$executeScript("scrollBy(0,7500)")
mored<-remDr$findElements(using='css', '#dismiss-btn > p')
sapply(mored,function(x){x$clickElement()})
for(i in 1:3){
  try(more<-remDr$findElements(using='css',paste0('#reviewSection > div:nth-child(4) > div > span.Review-paginator-numbers > span:nth-child(',i,')')))
  sapply(more,function(x){x$clickElement()})
  Sys.sleep(5)
  doms<-remDr$findElements(using = "css selector", ".Review-comment-bodyText")
  review<-sapply(doms, function (x) {x$getElementText()})
  reviews<-c(reviews, unlist(gsub("\n"," ", review)))
}

for(i in 1:12){
  try(more<-remDr$findElements(using='css',paste0('#reviewSection > div:nth-child(4) > div > span.Review-paginator-numbers > span:nth-child(4)')))
  sapply(more,function(x){x$clickElement()})
  Sys.sleep(5)
  doms<-remDr$findElements(using = "css selector", ".Review-comment-bodyText")
  review<-gsub("\n"," ", sapply(doms, function (x) {x$getElementText()}))
  print(review)
  reviews<-c(reviews, unlist(review))
  print(i)
}

write.table(reviews, "hotel.txt")
str(reviews)
