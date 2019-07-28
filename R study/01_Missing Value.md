# 01_Missing Value

1. 결측 데이터의 종류
   - 완전 무작위 결측(MCAR: Missing completely at random)
     - 변수 상에서 발생한 결측치가 다른 변수들과 아무런 상관이 없는 경우. 
     - 이 경우 보통 제거하거나 대규모 데이터 셋에서 단순 무작위 표본추출을 통해서 완벽한 데이터셋을 만들 수 있다
   - 무작위 결측(MAR: Missing at random)
     - 누락된 자료가 특정 변수와 관련되어 일어나지만, 그 변수의 결과는 관계가 없는 경우
     - 누락이 전체 정보가 있는 변수로 설명될 수 있음을 의미.
   - 비 무작위 결측(MNAR: Missing at not random)
     - 위 두가지 유형이 아닌 경우
     - 누락된 값(변수의 결과)이 다른 변수와 연관되어 있는 경우
   
2. 결측치 탐색
   - 표 : mice 패키지 -> 결측치 1(아닌 것을 0)으로 표기한 뒤 x 갯수로 나타내어 조합별로도 확인 가능
   - 시각화
     - cor(y) : 결측치 1(아닌 것을 0)에 대해 이변수간의 상관관계로서 결측치를 나타낸다.
     - Vim 패키지 : 결측치(빨간색)의 빈도 및 패턴을 시각화. 결측된 양을 scalebar로 표현
   
3. 결측치 처리 방법
   - 삭제
   
     1) List Wise Deletion : row가 어느 한 칼럼(변수)라도 missing이면 삭제->간단, 갯수가 줄어들어 power가 감소
   
     2) Pair Wise Deletion : 관심있는 칼럼(변수)에 값이 있다면 포함
   
   - 대치(Imputation)
   
     1) 최빈값(mode, qualitative) : 범주형에서 결측값이 발생 시, 범주별 빈도가 가장 높은 값으로 대치 -> bias가 많이 발생할 수 있다.
   
     2) 중앙값(median) : 숫자형(연속형)에서 결측값을 제외한 중앙값으로 대치
   
     3) 평균(mean) : 숫자형(연속형)에서 결측값을 제외한 평균으로 대치
   
     4) Simila case imputation : 조건부 대치
   
     5) Generalized imputation : 회귀분석을 이용한대치
   
   - 예측모델(Prediction model)
   
     1) 결측값이 없는 칼럼(변수)들로 구성된 dataset으로 -> 결측값이 있은 칼엄을 예측하게 한다.
   
     2) 예측값으로 해당 칼럼을 채워 넣는다.
   
   - 가장 흔히 쓰는 방법
   
     1) 하나라도 결측이 있는 변수를 제외한 dataset 생성
   
     2) imputation한 dataset을 2개 정도 생성(mean or median / regression / KNN 등으로)
   
     3) 1)과 2)의 dataset 3개에 대해서 결과값이 서로 일관성 있음을 보여준다. -> 결측대치방법이 senvitivity하지 않다는 것을 제시
   
4. 결측값(결측치) 처리 가이드 라인

   - 10% 미만 : 삭제 or 대치
   - ~ 20% 미만 : Hot deck(매년 자료 -> 해당 자료 추정) or regression or model based 대치
   - ~ 50% 미만 : regression or model based 대치
   - 50% 이상 : 해당 칼럼(변수) 자체 제거

5. 결측값 삭제 or 대치의 한계점

   - 삭제를 통해 n수가 변화 -> 집단의 특성 변화 가능성 -> missing rate(10% 미만)을 확인 후 삭제
   - 대치는 틀린 값으로 대체될 수 있다는 가능성이 항상 존재