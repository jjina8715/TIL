library(RSelenium)
site <- paste("http://www.yes24.com/24/goods/40936880")
remDr<-remoteDriver(remoteServerAddr="localhost",port=4445L,browserName="chrome")
remDr$open()
remDr$navigate(site)
webElem <- remDr$findElement("css", "body")
reviewbtn<-remDr$findElements(using='css selector',  '#yDetailTabNavWrap > div > div > ul > li:nth-child(2) > a')
sapply(reviewbtn,function(x){x$clickElement()}) 
reviewbtn<-remDr$findElements(using='css selector',  '#yDetailTabNavWrap > div > div > ul > li.tabOn > a')
repl_v = NULL
endFlag <- FALSE
page <- 3
repeat {
  print(page)
  for(i in 3:7){
    open <- remDr$findElements(using='css selector',  paste0('#infoset_reviewContentList > div:nth-child(',i,') > div.btn_halfMore > a'))
    if (length(open) == 0) {
      endFlag <- TRUE
      break
    }
    sapply(open,function(x){x$clickElement()}) 
    Sys.sleep(1)
    review<-remDr$findElements(using='css selector', paste0('#infoset_reviewContentList > div:nth-child(',i,') > div.reviewInfoBot.origin > div.review_cont'))
    repl <-sapply(review,function(x){x$getElementText()})    
    #print(repl)
    repl_v <- c(repl_v, unlist(gsub("\n","", repl)))
  }
  if(endFlag)
    break;  
  sapply(reviewbtn,function(x){x$clickElement()})
  Sys.sleep(2)
  page <- page+1;
  fullContentLinkCSS <- paste0('//*[@id="infoset_reviewContentList"]/div[1]/div[1]/div/a[',page,']')
  fullContentLink<-remDr$findElements(using='xpath', fullContentLinkCSS)
  sapply(fullContentLink,function(x){x$clickElement()})
  if(page == 12)
    page<-3
  
  Sys.sleep(2)
}
write(repl_v, "yes24.txt")
str(repl_v)
