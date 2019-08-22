library(stringr)
(product_click <- read.table("product_click.log", header=TRUE));
par(mar=c(3,3,3,3), mfrow=c(1,1))
#문제1
click_cnt<-table(product_click$pid)
barplot(click_cnt, main="세로바 그래프 실습", ylab="클릭 수", xlab="상품 ID",
        col=terrain.colors(length(click_cnt)),cex.axis=0.7,cex=0.7,horiz=T, las=2);
dev.copy(png,"clicklog1.png"); dev.off();

#문제2
click_time<-table(str_sub(product_click$time,start=9,end=10))
time<-as.numeric(names(click_time))
pie(click_time,labels=paste(time, "~",time+1), col=terrain.colors(length(click_time)),
    main="파이그래프 실습");
dev.copy(png,"clicklog2.png"); dev.off()