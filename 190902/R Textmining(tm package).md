# R Textmining(tm package)

### 1. text mining

- 단어의 출현 빈도, 단어 간 관계성 등을 파악하여 유의미한 정보를 추출하는 것
- 데이터마이닝의 일부라 볼 수 있다. 
- 형태소분석기나 구문분석기와 같은 자연어 처리 도구를 잘 사용할 수 있어야 한다.
- 문서들을 자동으로 분류할 수 있고, 문서나 단어들간의 연관성을 분석할 수 있으며, 텍스트에 담겨 있는 감성(즉, 평가, 성향)을 예측할 수 있고 시간의 흐름에 따른 이슈들의 변환 과정을 추적할 수 있다.

### 2. 자연어 처리

- 형태소분석기, 구문분석기와 같은 사람이 작성한 글이나 대화를 컴퓨터를 통해 해석할 수 있게 하는 소프트웨어를 개발하거나 연구하고 그런 것들을 이용해서 실제로 작업하는 것
- 형태소분석기
  - 형태소를 구분하고 무엇인지 알려주는 것
- 구문분석기
  - 주어, 목적어, 서술어와 같은 형태로 품사보다는 단위가 더 높은 놀리적 레벨까지 처리해주는 것
- 형태분석기 종류
  - Hananum : KAIST의 한나눔 형태소 분석시와 NLP_HUB 구문분석기
  - KKMA : 서울대의 꼬꼬마 형태소/구문분석기
  - KOMORAN : Junsoo Shin님의 코모란
  - Twitter : OpenKoreaText의 오픈 소스 한국어처리기
  - Eunjeon : 은전 한닢 프로젝트의 SEunjeon
- 형태소 분석으로 어절들의 품사를 파악한 후 명사, 동사, 형용사 등 의미를 지닌 품사의 단어를 추출해 각 단어의 등장횟수 확인

### 3. 텍스트 전처리와 tm 패키지

- stringr package 활용
  - detect matches
    - str_detect(string, pattern)
    - str_which(string, pattern)
    - str_count(string, pattern)
    - str_locate(string, pattern)
  - subset strings
    - str_sub(string start=1L, end=1L)
    - str_subset(string, pattern)
    - str_extract(string, pattern)
    - str_match(string, pattern)
  - manage lengths
    - str_length(string)
    - str_pag(string, width, side=c("left", "right", "both"))
    - str_trunc(string, width, side=c("right, left", "center"))
    - str_trim(string, side=c("both", "left", "right"))
  - mutate strings
    - str_sub()
    - str_replace(string, pattern, replacement)
    - str_replace_all(string, pattern, replacement)
    - str_to_lower(string, locale="en")
    - str_to_upper(string, locale="en")
    - str_to_title(string, locale="en")
  - join ans split
    - str_c(..., sep="", collapse=NULL)
    - str_c(..., sep="", collapse=NULL)
    - str_dup(string, times)
    - str_split_fixed(string, pattern, n)
    - str_glue(..., sep="", .envir=parent.frame())
    - str_glue_data(.x, ..., sep="", .envir=parent.frame(), .na="NA")
    - str_order(x,decreasing=FALSE, na _last=TRUE, locale="en", numeric=FALSE, ...)
    - str_sort(x, decreading=FALSE, na_last=TRUE, locale="en", numeric=FALSE, ...)
    - str_conv(string, encoding)
    - str_view(string, pattern, match=NA)
    - str_wrap(string, width=80, indent=0, exdent=0)
- tm_map() 함수 사용
  - 텍스트는 기본적으로 비정형 데이터로서 분석에 불필요한 혹 방해가 되는 요소들이 포함되어 있어서 데이터 정제(data cleaning)작업 필수
  - tm 패키지에 정제작업을 지원하는 다양한 변환함수 제공
  - getTransformations() 
    - 사용가능한 변환 함수의 리스트 확인 가능
    - removeNumbers, removePunctuation, reviewWords,
    - stemDocument, stripWhitespace, 
  - 각 함수들은 tm_map() 함수의 인수로 전달하여 변환작업을 처리 가능
  - 문서에서 문장 부호 제거
  - 문자를 모두 소문자 변환
  - 단어의 어간을 추출해 주는 스테밍(stemming) 적용 가능
- corpus(코퍼스, 말뭉치)
  - 언어학에서 구조를 이루고 있는 텍스트 집합
  - 통계 분석 및 가설 검증, 언어 규칙의 검사 등에 사용
  - tm에서 문서를 관리하는 기본 구조를 corpus라 부르며, 텍스트 문서들의 집합을 의미
  - 코퍼스 접근법
    - 텍스트 마이닝을 위해 수행해야 할 첫번째 작업은 비 구조화된 텍스트 즉, 비정형의 텍스트를 구조화된 데이터로 변환하는 방법 중 하나
    - 분석 대상이 되는 개별 텍스트 즉, 문서를 단어의 집합으로 단순화시킨 표현 방법
    - 단어의 순서나 문법은 무시하고 단어의 출현 빈도만을 이ㅛㅇㅇ하여 텍스트를 매트릭스(Term-Document-Matrix, Document-Term-Matrix)로 표현
    - corpus() 
      - 분석해야 할 텍스트를 문서들의 집합인 코퍼스 형식으로 변환
      - 다양한 소스로부터 읽어 들인 텍스트를 텍스트 마이닝을 위한 corpus객체로 변환
    - getSources() 
      - 사용가능한 소스객체의 종류를 파악
      - DataframeSource, DirSource, URISource, VectorSource
      - XMLSource, ZipSource

### 4. 결과 시각화

- 워드 클라우드를 가장 많이 사용
  - 단어의 개수를 세어 갯수의 크기 값에 따라서 단어의 크기를 차등적으로 출력하여 키워드가 되는 단어를 좀 더 강조하여 출력하는 시각화
  - wordcloud()
    - scale : 빈도가 가장 큰 단어와 가장 빈도가 작은 단어의 폰트 차이, scale=c(5, 0.2)
    - rot.per=0.1 : 90도 회전해서 보여줄 단어 비율
    - min.freq=3, max.words=100 : 빈도 3이상, 100개 미만의 단어 표현
    - random.order=F : True(랜덤배치) / False(빈도수가 큰 단어를 중앙에 배치)
    - random.color=T : True(색상랜덤) / False(빈도수순으로 색상표현)
    - colors=색상이름
    - family : 폰트
- 동시출현(Co-occurrence)
  - 한 문장, 문단 또는 텍스트 단위에서 같이 출현한 단어
  - 단어의 연결성을 찾는 데 활용
  - 동시출현 네트워크(Co-occurrence networks)
    - 특정 텍스트 단위에서 공동으로 출현한 단어의 집합적 상호 연결을 표현하는 방식
    - 나타나는 단어를 모두 표시한 뒤, 둘 사이를 선으로 연결해 나가다 보면 단어의 네트워크를 만들 수 있다.
    - qgraph package의 qgraph()함수 사용