install.packages("ggplot2")
library(ggplot2)
library(dplyr)

str(airquality)
names(airquality)

ggplot(airquality, aes(x=Day, y=Temp))
ggplot(airquality, aes(x=Day, y=Temp)) + geom_point(size=2, color="red")
ggplot(airquality, aes(x=Day, y=Temp)) + geom_line()
ggplot(airquality, aes(x=Day, y=Temp)) + geom_line() + geom_point()
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(width=0.5)
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(aes(fill=factor(gear)))
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(aes(fill=factor(gear))) +
  coord_polar(theta="y")
ggplot(airquality, aes(x=Day, y=Temp, group=Day)) + geom_boxplot()
ggplot(airquality, aes(Temp)) + geom_histogram()
ggplot(airquality, aes(Temp)) + geom_histogram(binwidth=1)

str(economics)
ggplot(economics, aes(x=date, y=psavert)) + 
  geom_line() + geom_abline(intercept = 12.18671, slope = -0.0005444)
?lm
lm(psavert~date, data=economics)
ggplot(economics, aes(x=date, y=psavert)) + 
  geom_line() + geom_hline(yintercept = mean(economics$psavert), color = 'red')

x_inter<-filter(economics, psavert==min(economics$psavert))$date
ggplot(economics, aes(x=date, y=psavert)) + 
  geom_line() + geom_vline(xintercept = x_inter, color = "red")

ggplot(airquality, aes(x=Day, y=Temp)) + 
  #점을 기준으로 왼쪽 아래가 양의 방향
  geom_point() + geom_text(aes(label=Temp, vjust=1, hjust=1))

ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() + 
  annotate("rect", xmin=3, xmax=4, ymin=12, ymax=21, alpha=0.5, fill="skyblue")
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() + 
  annotate("rect", xmin=3, xmax=4, ymin=12, ymax=21, alpha=0.5, fill="skyblue") + 
  annotate("segment", x=2.5, xend=3.7, y=10, yend=17, color="red", arrow=arrow())
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() +
  annotate("rect", xmin=3, xmax=4, ymin=12, ymax=21, alpha=0.5, fill="skyblue") +
  annotate("segment", x=2.5, xend=3.7, y=13, yend=17, color="red", arrow=arrow()) +
  annotate("text", x=2.5, y=12.5, label="point")

imsi <- ggplot(mtcars, aes(x=gear)) + geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수")
imsi + theme_bw()
imsi + theme_classic()
imsi + theme_get()
imsi + theme_grey()
imsi + theme_linedraw()
imsi + theme_minimal()
imsi + theme_dark()
imsi + theme_light()

mpg <- as.data.frame(ggplot2::mpg)
str(mpg)
# x축 displ, y축 hwy로 지정해 배경 생성
ggplot(data = mpg, aes(x = displ, y = hwy))
# 배경에 산점도 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + 
  xlim(3, 6)
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + 
  xlim(3, 6) +  ylim(10, 30)

install.packages("xlsx")
library(xlsx)
classDF <- read.xlsx("data.xlsx", 1, encoding="UTF-8")
str(classDF)
View(classDF)

bar_data <- classDF[3]
bar_data
ggplot(bar_data, aes(x=bloodType)) + geom_bar()


ggplot(classDF, aes(x=bloodType, fill=gender)) + 
  geom_bar()

# A, B회사의 매출 실적 데이터프레임 만들기
company <- c('A', 'A', 'A', 'A', 'B', 'B', 'B', 'B')
year <- c('1980', '1990', '2000', '2010', '1980', '1990', '2000', '2010')
sales <- c(2750, 2800, 2830, 2840, 2760, 2765, 2775, 2790)

coSalesDF <- data.frame(company, year, sales)

# 생성된 coSalesDF 확인
coSalesDF

#-------------------------------------------------------------

# 라인차트 생성 - x축은 연도(year), y축은 매출(sales) 매칭
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(aes(group=company))

#-------------------------------------------------------------
# 선 색상 및 두께 설정
ggplot(coSalesDF, aes(x=year, y=sales)) + 
  geom_line(size=2, aes(group=company,colour=company))

#-------------------------------------------------------------
ggplot(coSalesDF, aes(x=year, y=sales)) + 
  geom_line(size=2, aes(group=company, colour=company)) + geom_point(size=2)


# 빈도 막대 그래프
ggplot(data = mpg, aes(x = drv)) + geom_bar()

# 선 그래프
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

# 상자 그림
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()

#데이터영역 + 시각화영역 + 테마영역
ggplot(mpg, aes(x=class))+geom_bar()+theme_light()
ggplot(mpg, aes(x=class))+geom_bar()+theme_linedraw()
ggplot(mpg, aes(x=class))+geom_bar()+theme_minimal()
ggplot(mpg, aes(x=class))+geom_bar()+theme_bw()
ggplot(mpg, aes(x=class))+geom_bar()+theme_gray()
ggplot(mpg, aes(x=class))+geom_bar()+theme_classic()
ggplot(mpg, aes(x=class))+geom_bar()+theme_light()

library(MASS)
str(Cars93)
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) +  
  geom_point(shape=25, size=6)
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) +  
  geom_point(shape=21, size=6, colour="blue")
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) +  
  geom_point(shape=21, size=6, fill="blue")   
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) +  
  geom_point(color="grey", shape=21, size=6) 
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Price)) +   
  geom_point(colour="grey", shape=21, size=6) 
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +  
  geom_point(colour="grey", shape=21, size=6)
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +
  geom_point(colour="grey", shape=21, size=6) +
  scale_fill_brewer(palette="Oranges") # Oranges  

ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +
  geom_point(colour="grey", shape=21, size=6) +
  scale_fill_brewer(palette="Reds") # Reds

ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +
  geom_point(colour="grey", shape=21, size=6) +
  scale_fill_brewer(palette="Blues") # Blues


w <- data.frame(year=c("2014", "2015", "2016", "2017", "2018"), weight=c(65,66,64,68,72))
ggplot(data=w, aes(x=year)) + geom_bar()
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(stat="identity")
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(stat="identity") +
  coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + 
  geom_bar(aes(fill=year), stat="identity") + coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + 
  geom_bar(aes(fill=year), colour="blue", stat="identity") + 
  coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) +
  geom_bar(aes(fill=year), stat="identity") + 
  geom_label(aes(label=weight), nudge_y=1.1) + coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + 
  geom_bar(aes(fill=year), stat="identity") +
  geom_label(aes(label=weight), nudge_y=-1.1) + coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + 
  geom_bar(aes(fill=year), stat="identity") + 
  geom_label(aes(label=weight), nudge_y=1.1) + coord_cartesian(ylim=c(60, 75)) + 
  labs(title = "테스트", subtitle="ggplot2 패키지를 이용한 시각화", x="년도", y="무게")

# 트리맵 라이브러리 설치
install.packages("treemap")
# 트리맵 메모리 로드
library(treemap)
library(xlsx)
?treemap
#-------------------------------------------------------------
sales_df<- read.xlsx("data.xlsx",2,encoding="UTF-8")
# 트리맵 그리기
# index에 표현하고 싶은 계층 순서대로 벡터로 생성. product, region 순으로 벡터를 지정함으로써 product가 region보다 더 상위로 구분이 됨
treemap(sales_df, vSize="saleAmt", index=c("product", "region"), title="A기업 판매현황")

# 트리맵 그리기
treemap(sales_df, vSize="saleAmt", index=c("region", "product"), title="A기업 판매현황")


# 인터랙티브 그래프 만들기
# 패키지 준비하기
install.packages("plotly")
library(plotly)
# ggplot으로 그래프 만들기
library(ggplot2)
p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()
# 인터랙티브 그래프 만들기
ggplotly(p)

# 인터랙티브 막대 그래프 만들기
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + 
  geom_bar(position = "dodge")
ggplotly(p)
install.packages("dygraphs")
library(dygraphs)
# 데이터 준비하기
economics <- ggplot2::economics
head(economics)
# 시간 순서 속성을 지니는 xts 데이터 타입으로 변경
library(xts)
eco <- xts(economics$unemploy, order.by = economics$date)
head(eco)
# 인터랙티브 시계열 그래프 만들기
# 그래프 생성
dygraph(eco)

# 날짜 범위 선택 기능
dygraph(eco) %>% dyRangeSelector()

# 여러 값 표현하기 
# 저축률 
eco_a <- xts(economics$psavert, order.by = economics$date)
# 실업자 수
eco_b <- xts(economics$unemploy/1000, order.by = economics$date)
#합치기
eco2 <- cbind(eco_a, eco_b)                 # 데이터 결합
colnames(eco2) <- c("psavert", "unemploy")  # 변수명 바꾸기
head(eco2)
# 그래프 만들기
dygraph(eco2) %>% dyRangeSelector()


# 지도 시각화
# 지도 그래프
install.packages("ggplot2")
install.packages("ggmap")
library(ggplot2)
library(ggmap)
register_google(key='')

lon <- 127.0147559
lat <- 37.5431424
cen <- c(lon,lat)
mk <- data.frame(lon=lon, lat=lat)
map <- get_googlemap(center=cen, maptype="roadmap",zoom=12, marker=mk)
ggmap(map)
map <- get_googlemap(center=cen, maptype="satellite",zoom=14, marker=mk)
ggmap(map)
map <- get_googlemap(center=cen, maptype="terrain",zoom=8, marker=mk)
ggmap(map)
map <- get_googlemap(center=cen, maptype="hybrid",zoom=14, marker=mk)
ggmap(map)+labs(title="테스트임", x="경도", y="위도")

map <- get_map(center=cen, maptype="terrain-labels",zoom=8, marker=mk)
ggmap(map)
map <- get_map(center=cen, maptype="toner-hybrid",zoom=8, marker=mk)
ggmap(map)
map <- get_map(center=cen, maptype="watercolor",zoom=8, marker=mk)
ggmap(map)

mk <- geocode("seoul", source = "google")
print(mk)
cen <- c(mk$lon, mk$lat)
map <- get_googlemap(center=cen, maptype="roadmap",zoom=12, marker=mk)
ggmap(map)
mk <- geocode(enc2utf8("부산"), source = "google")
cen <- c(mk$lon, mk$lat)
map <- get_googlemap(center=cen, maptype="roadmap",zoom=12, marker=mk)
ggmap(map)
mk <- geocode(enc2utf8("강남구 역삼동 테헤란로 212"), source = "google")
cen <- c(mk$lon, mk$lat)
map <- get_googlemap(center=cen, maptype="roadmap",zoom=16)
ggmap(map) + 
  geom_point(aes(x=mk$lon, y=mk$lat), alpha=0.4, size=5, color="pink") +
  geom_text(aes(x=mk$lon, y=mk$lat, label="우리가 공부하는 곳", vjust=0, hjust=0))


# 제주도

names <- c("용두암","성산일출봉","정방폭포",
           "중문관광단지","한라산1100고지","차귀도")
addr <- c("제주시 용두암길 15",
          "서귀포시 성산읍 성산리",
          "서귀포시 동홍동 299-3",
          "서귀포시 중문동 2624-1",
          "서귀포시 색달동 산1-2",
          "제주시 한경면 고산리 125")
gc <- geocode(enc2utf8(addr))
gc

df <- data.frame(name=names,
                 lon=gc$lon,
                 lat=gc$lat)
cen <- c(mean(df$lon),mean(df$lat))
map <- get_googlemap(center=cen,
                     maptype="roadmap",
                     zoom=10,
                     size=c(640,640),
                     marker=gc)
ggmap(map) 

# 공공 DB 활용 

install.packages("XML")
library(XML)
API_key  <- ""
bus_No <- "421"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url)
top <- xmlRoot(doc) ; top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList[1]")); df
busRouteId <- df$busRouteId
busRouteId
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
doc <- xmlParse(url)
top <- xmlRoot(doc); top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList")); df
# 구글 맵에 버스 위치 출력
df$gpsX <- as.numeric(as.character(df$gpsX))
df$gpsY <- as.numeric(as.character(df$gpsY))
gc <- data.frame(lon=df$gpsX, lat=df$gpsY);gc
cen <- c(mean(gc$lon), mean(gc$lat))
map <- get_googlemap(center=cen, maptype="roadmap",zoom=12, marker=gc)
ggmap(map)
