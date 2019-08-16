

url<- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page=1"
text <- read_html(url,  encoding="UTF-8")
text
# 영화제목
nodes <- html_nodes(text, ".tit_rel")
title <- html_text(nodes)
title
# 영화평점
nodes <- html_nodes(text, ".emph_grade")
grade <- html_text(nodes)
grade
# 영화리뷰
nodes <- html_nodes(text, ".desc_review")
review <- html_text(nodes, trim=TRUE)
review
review <- gsub("\r", "", review)
review
page <- cbind(title, point)
page <- cbind(page, review)
page
write.csv(page, "daummovie1.csv")

