# R#02 chart

- 패키지 : plotrix

- |           | 패키지   | 사용법                                                       | 설명                                          | 반환값                                  |
  | --------- | -------- | ------------------------------------------------------------ | --------------------------------------------- | --------------------------------------- |
  | pie()     | graphics | pie(a, labels, clockwise=FALSE, init.angle=if(clockwise) 90 else 0, col=NULL, main=NULL) | 파이차트 출력                                 |                                         |
  | barplot() | graphics | barplot(height, width=1, names.arg=NULL, horiz=FALSE, col=NULL, main=NULL, sub=NULL, xlab=NULL, ylab=NULL, xlim=NULL, ylim=NULL, ...) | 수평 또는 수직의 막대그래프를 그림            | 차트에 좌표에 관한 수치 벡터(또는 행렬) |
  | plot()    | graphics | plot(x, y, ...)                                              | R객체의 그래프 출력을 위한 일반적인 기능 제공 |                                         |
  | hist()    | graphics | hist(x, breaks="Sturges", freq=NULL, probability=!freq, col=NULL, main=NULL, xlim=NULL, ylim=NULL, ... ) | 히스토그램을 출력하는 일반적인 기능 제공      | 히스토그램에 관한 리스트 형태의 객체    |
  | boxplot() | graphics | boxplot(x, ...)                                              | 박스 플롯의 일반적인 기능 제공                | 박스 플롯에 관한 리스트                 |

  