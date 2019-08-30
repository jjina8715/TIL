#[ 지도 출력 실습 ]

library(ggplot2)
library(ggmap)
register_google(key='AIzaSyD-nx_y7aBlJgfgVZRaIwMbnShQJsxpryY')

name<-"용산구청"
addr<-"서울특별시 용산구 이태원1동 녹사평대로 150"

gc <- geocode(enc2utf8(addr)); gc

today <- as.POSIXlt(Sys.Date())
type<-c("terrain","terrain","satellite","satellite","roadmap","hybrid", "hybrid")

map <- get_googlemap(center=c(gc$lon,gc$lat),
                     maptype=type[today$wday],
                     zoom=16,
                     size=c(600,600),
                     marker=gc)

ggmap(map) +
  geom_point(aes(x=gc$lon, y=gc$lat), alpha=0.3, size=4, color="blue") +
  labs(title=name, x="경도", y="위도")
  
ggsave("mymap.png")
