url<- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page="


moviereview<-NULL
for(i in 1:20){
  url2<-paste(url, i, sep="")
  text <- read_html(url2,  encoding="UTF-8")
  nodes <- html_nodes(text, ".emph_grade")
  grade<-html_text(nodes)
  nodes <- html_nodes(text, ".desc_review")
  review <- html_text(nodes, trim=TRUE)
  review <- gsub("\r", "", review)
  page<-cbind(grade, review)
  moviereview<-rbind(moviereview, page)
}

write.csv(moviereview, "daummovie2.csv")

