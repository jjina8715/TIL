
library(ggmap)

register_google(key='')

lib <- read.csv("지역별장애인도서관정보.csv", stringsAsFactors=F)
str(lib)

seoul_map <- qmap('Seoul', zoom = 11, source = 'stamen', maptype = 'watercolor')
seoul_map + geom_point(data = lib, aes(x = LON, y = LAT), colour = 'blue', size = 4, alpha=0.5) + 
  geom_text(data=lib, aes(x=LON, y=LAT, label=도서관명, vjust=1.5, hjust=0.5))

ggsave("map1.png")
