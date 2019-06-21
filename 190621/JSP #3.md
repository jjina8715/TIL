# JSP #3

3. EL(Expression Language)
   - 특정 스코프 영역에 보관되어 있는 객체를 추출하여 이 객체의 값 또는 속성 값을 추출하여 표현하고자 하는 경우 사용
   - $와 { }으로 구현하는 것과 관련된 연산자와 EL만의 내장 객체를 사용 가능
   - Query 문자열을 추출하여 표현하는 경우 스크립팅 태그를 표현하는 것보다 간단 --> ${param.p }/ ${param("p")}
   - EL의 내장 객체
     - pageContext - PageContext 객체
     - pageScope - page 스코프에 포함된 객체들
     - requestScope - request 스코프에 포함된 객체들
     - sessionScope - session 스코프에 포함된 객체들
     - applicationScope - application 스코프에 포함된 객체들
     - param - HTTP의 파라미터들
     - paramValues  - 한 파라미터의 값들
     - header - 헤더 정보들
     - headerValues - 한 헤더의 값들
     - cookie - 쿠키들
     - initParam - 컴텍스트의 초기화 파리미터들
   - EL에서의 . 연산자
     - 변수명.xxx -->getter 호출