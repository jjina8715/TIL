# ggplot, ggmap

### ggplot2 package

- ggplot(데이터셋, aes(데이터 속성))그래프를 표현하는 좌표를 그리기 위해 판을 짜는 함수
  - 데이터 속성
    - x, y, col
    - group : 상자그림을 그릴 때 그룹 지을 열
- geom_point() : 산점도
  - 옵션 
    - size, color
- geom_line() : 꺽은 선 그래프
  - 옵션
- geom_bar(aes(데이터 속성)) : 막대 그래프
  - 데이터 속성
    - fill : 값을 누적한다.
  - position
- coord_polar() : 막대 그래프에 더하면 선버스트 차드로 변형 가능
  - theta : "y"로 값을 지정하면 원그래프로 변환
- geom_boxplot() : 상자그림
- geom_histogram() : 도수분포를 기둥 모야 그래프로 표현한 히스토그램
  - binwidth
- geom_abline() : 사선 
  - intercept : 절편
  - slope : 기울기
- geom_hline() : 평행선을 그릴 때
  - yintercept : y 절편
- geom_vline() : 수직선을 그릴 때
  - xintercept : x절편
- geom_text(aes(데이터 속성)) : 그래프에 텍스트를 입력할 때
  - label, vjust, hjust
- annotate() : 도형 및 화살표 그리기
  - 옵션
    - xmin, xmax, ymin, ymax, alpha, fill
- labs()
  - x, y , title
- theme
  - 그래프의 여러 구성 요소 및 디자인을 지정되어 있있는 형태로 일괄하여 변경할 때 사용
  - _gray(), _bw(), _linedraw(), _light(), _dark(), minimal(), _classic(), _void()
- scale\_*\_gradient()
  - creates a two colour gradient (low-high), creates a diverging gradient(low-mid-high), creates a n-colour gradient
  - low, high, [mid,] space, na.value, guide, aesthetics
- geom_polygon()
  - very similar to paths (as drawn by geom_path()) except that the start and end points are connected and the inside is colured by `fill`. 
  - The group aesthetic determines which cases are connected together into a polygon
  - mapping, data, stat, position, rule, ..., na.rm, show.legend, inherit.aes
- facet_wrap()
  - a 1d sequence of panels into 2d
  - This is generally a better use of screen space than `facet_grid()` b/c most displays are roughly rectangular
  - facets, nrow, ncol, scales, shrink, labeller, as.table, switch, drop, dir, strip.position

### plotly

- ggplotly() 
  - converts a `ggplot2::ggplot()` object to a plotly object
  - p, width, height, tooltip, dynamicTicks, layerDate, originalData, source, ...

### ggmap package

- get_googlemap(center,, maptype, zoom, marker, ...)
  - queries the Google Maps Static API version 2 to download a static map
  - Note that in most cases by using this function tou are agreeing to the Google Maps API Terms of Service at `https://cloud.google.com/maps-platform/terms/`.
- gecode(location, source, output, force, ...)
- gmap 
  - x, y, value