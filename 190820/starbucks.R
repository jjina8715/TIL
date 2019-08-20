library(RSelenium)
shopname<-NULL
addr<-NULL
telephone<-NULL
long<-NULL
lat<-NULL
site<-'https://www.istarbucks.co.kr/store/store_map.do?disp=locale'
remDr<-remoteDriver(remoteServerAddr="localhost",port=4445L,browserName="chrome")
remDr$open()
remDr$navigate(site)

locale<-remDr$findElements(using='css selector',  '#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a')
sapply(locale,function(x){x$clickElement()}) 

gu <-remDr$findElements(using='css selector',  '#mCSB_2_container > ul > li:nth-child(1) > a')
sapply(gu,function(x){x$clickElement()}) 

cnt <- remDr$findElements(using="xpath", '//*[@id="container"]/div/form/fieldset/div/section/article[1]/article/article[2]/div[3]/div[1]/span')
result <-sapply(cnt,function(x){x$getElementText()})   

for(i in 1:as.numeric(result)){
  node<-remDr$findElements(using='xpath', paste0('//*[@id="mCSB_3_container"]/ul/li[',i,']/strong'));
  shopname<-c(shopname, unlist(sapply(node,function(x){x$getElementText()}) ));
  
  node<-remDr$findElements(using='xpath', paste0('//*[@id="mCSB_3_container"]/ul/li[',i,']/p'));
  info<-unlist(strsplit(unlist(sapply(node,function(x){x$getElementText()})), "\n"));
  addr<-c(addr, info[1]);
  telephone<-c(telephone, info[2]);
  
  node<-remDr$findElements(using='xpath', paste0('//*[@id="mCSB_3_container"]/ul/li[',i,']'));
  lat<-c(lat, unlist(sapply(node,function(x){x$getElementAttribute("data-lat")})));
  long<-c(long, unlist(sapply(node,function(x){x$getElementAttribute("data-long")})));
  if(i%%3==1)
    remDr$executeScript("var su=arguments[0]; var dom=document.querySelectorAll('#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();", list(i));
}
list<-data.frame(shopname, addr, lat, long, telephone)
write.csv(list, "starbucks.csv")
