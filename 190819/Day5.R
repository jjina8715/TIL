install.packages("XML")
library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "402"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url)
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df
str(df)
busRouteId <- df$busRouteId
busRouteId
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
doc <- xmlParse(url)
top <- xmlRoot(doc); top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df

# 정규표현식 사용

word <- "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub("A", "", word) 
gsub("a", "", word) 
gsub("Aa", "", word) 
gsub("(Aa){2}", "", word) 
gsub("[Aa]", "", word) 
gsub("[가-힣]", "", word) 
gsub("[^가-힣]", "", word) 
gsub("[&^%*]", "", word) 
gsub("[[:punct:]]", "", word) 
gsub("[[:alnum:]]", "", word) 
gsub("[1234567890]", "", word) 
gsub("[[:digit:]]", "", word) 
gsub("[^[:alnum:]]", "", word) 
gsub("[[:space:]]", "", word) 


#selenium
install.packages("RSelenium")
library(RSelenium)
remDr<-remoteDriver(remoteServerAddr="localhost", port=4445, browserName="chrome")
remDr$open()
remDr$navigate("http://www.google.com/ncr")
webElem<-remDr$findElement(using="css", "[name='q']")
webElem$sendKeysToElement(list("JAVA", key="enter"))

remDr$navigate("https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204")
more<-remDr$findElements(using='css','#SearchBoxContainer > div > div > div.Popup__container.Popup__container--garage-door > div > div > div.AlertMessage.CalendarAlertMessage > a')
sapply(more,function(x){x$clickElement()})
doms <- remDr$findElements(using = "css selector", ".Review-comment-bodyText")
sapply(doms, function (x) {x$getElementText()})

url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr<-remoteDriver(remoteServerAddr="localhost",port=4445L,browserName="chrome")
remDr$open()
remDr$navigate(url)
doms1<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
p_repl <- sapply(doms1,function(x){x$getElementText()})
p_repl_v <- unlist(p_repl)
more<-remDr$findElements(using='css','span.u_cbox_in_view_comment')
sapply(more,function(x){x$clickElement()})
doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
repl <-sapply(doms2,function(x){x$getElementText()})
repl_v <- c(p_repl_v, unlist(repl))
repeat {
  for (i in 4:12) {               
    nextCss <- paste("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span", sep="")                
    try(nextPage<-remDr$findElements(using='css',nextCss))
    if(length(nextPage) == 0)   break;
    sapply(nextPage,function(x){x$clickElement()})
    Sys.sleep(1)
    doms3<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
    repl <-sapply(doms3,function(x){x$getElementText()})
    repl_v <- c(repl_v, unlist(repl))                
  }
  try(nextPage<-remDr$findElements(using='css',
                                   "#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13) > span.u_cbox_cnt_page"))
  if(length(nextPage) == 0)  break;
  sapply(nextPage,function(x){x$clickElement()})
  Sys.sleep(1)
  doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
  repl <-sapply(doms2,function(x){x$getElementText()})
  repl_v <- c(repl_v, unlist(repl))        
}
print(repl_v)
write.table(repl_v, "webtoon.txt")
