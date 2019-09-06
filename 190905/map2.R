library(leaflet)
library(Kormaps)
library(htmlwidgets)
library(dplyr)
DONG<-read.csv('C:/jjn/R/Rstudy/one.csv')
data(korpopmap3)
data(korpopmap2)
Encoding(names(korpopmap3))<-'UTF-8'
Encoding(korpopmap2@data$name)<-'UTF-8' 
Encoding(korpopmap3@data$name)<-'UTF-8' 

korpopmap3@data$name<-gsub('·','',korpopmap3@data$name) 

colnames(DONG)<-c('구별','name','일인가구')
dong<- DONG %>%filter(구별==gu)

gucodename<-korpopmap2@data[,c("name","code.data")]
gucode<-gucodename[gucodename$name==gu, "code.data"]
pattern<-paste0('^', gucode)
len<-grep(pattern, korpopmap3@data$code.data)
korpopmap3@data<-korpopmap3@data[len,] 
korpopmap3@polygons<-korpopmap3@polygons[len] 

korpopmap3@data<-merge(korpopmap3@data,dong,by.x='name',sort=FALSE)
mymap <- korpopmap3@data
mypalette <- colorNumeric(palette ='PuRd' , domain = mymap$'일인가구')
mypopup <- paste0(mymap$name,'<br> 1인가구: ',mymap$'일인가구')

map7 <- NULL
map7<-leaflet(korpopmap3) %>% 
  addTiles() %>% 
  setView(lat=37.52711, lng=126.987517, zoom=12) %>%
  addPolygons(stroke =FALSE,smoothFactor = 0.2,fillOpacity = .9,popup = mypopup,color = ~mypalette(mymap$일인가구)) %>% 
  addLegend( values = ~mymap$일인가구, pal =mypalette ,title = '인구수', opacity = 1)
map7		

