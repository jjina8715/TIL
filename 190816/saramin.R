res = GET('http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=%EC%9E%90%EB%B0%94')
htxt = read_html(res)
tech_name <- html_nodes(htxt, '.swiper-container .txt')
tech_name <- html_text(tech_name)[1:length(tech_name)-1]
tech_name <- gsub("[[:punct:]]", "", tech_name)

info_count <- html_nodes(htxt, '.swiper-container .count') 
info_count <- html_text(info_count)
info_count <- gsub("\\(", "", info_count)
info_count <- gsub(")", "", info_count)

list<- cbind(tech_name, info_count)
write.csv(list, "saramin.csv")