# [Web Programming]

- 공부할 내용
  - 웹 클라이언트 : HTML, CSS, JavaScript, Ajax, HTML5 주요 API
  - 웹 서버 : Servlet&JSP, Spring FW, MyBatis
  - 웹기반 시각화 : D3.js
  - openAPI : 네이버 또는 구글
  - 웹서버 - Tomcat(Web Application Server : WAS)
  - 웹클라이언트 - 크롬
  
- edu : Dynamic Web Project
  1. Tomcat 서버를 eclipse에 등록
  
  2. edu 생성
  
  3. edu를 Tomcat 서버에 등록
  
  4. first.html 파일을 생성
  
  5. 브라우저(크롬)에서 first.html 요청
  
     http://localhost:8000/edu/first.com -> HTTP URL 문자열
  
     /edu/first.com -> URI문자열		/edu -> 컨텍스트 패스
  
- "웹은 모든 사람들이 손쉽게 정보를 공유할 수 있는 공간이며 어떤 장애없이 이를 이용할 수 있어야 한다." - 팀 버너스 리(www창시자)

- 웹 페이지를 디자인 할 때

  - 모바일
  - PC+모바일 : 반응형 웹디자인 / PC디자인, 모바일 디자인

- ###  HTML5

  - W3C의 HTML WG을 통해서 만들어지고 있는 차세대 마크업 언어 표준

  - 플랫폼 중립적, 다양한 기능과 화려한 그래픽 효과

  - 문서의 내용과 구조는 html태그로 스타일은 css3로 동작 구현은 javascript로 처리

  - HTML5의 구성요소

    - 태그(tag)
    - 내용(content)
    - 엘리먼트(element)
    - 속성(attribute)
    - 속성값(value)

  - HTML5 선언문 : &lt;!DOCTYPE HTML>

  - &lt;video>, &lt;audio> 태그

    - src: 동영상 파읷의 경로를 지정
    - poster: 동영상이 화면에 나타나지 않을 때 대싞 표시핛 그린을 지정
    - preload: 동영상이 백그라욲드에서 다욲로드 되어 재생 단추를 눌렀을 때 재생
    - autoplay: 동영상 자동 재생
    - loop: 반복 재생 횟수 지정
    - controls: 동영상 화면에 컨트롟 기능 추가
    - width: 동영상 화면 너비 지정
    - height: 동영상 화면 높이 지정

  - &lt;input> 태그에 추가된 요소들

    - type="email" 이메일 주소 입력시 사용
    - type="url"  웹 사이트 주소 입력시 사용
    - type="number" : max, min, step, value 숫자를 스핀 박스를 이용해서 입력 가능
    - type="range" : min, max, step, value 슬라이드 막대로 숫자 선택
    - type="search" : 검색 상자 삽입
    - type="date" "month" "week" "time" : 달력에서 날짜를 선택하거나 스핀 박스에서 시간을 선택
    - type="color" : 색상 선택 상자 표시

  - &lt;input> 태그의 새로운 속성들

    - autocomplete, autofocus, 입력값 제한, placeholder, required, multiple

  - 문서의 구조를 정의하는 태그들

    - &lt;header>, &lt;nav> &lt;section>, &lt;article>, &lt;aside>, &lt;footer>, &lt;hgroup>

  - 그외의 태그
  
    - 주석 : &lt;!-- -->
    - 줄바꿈 : &lt;br>
    - 입력한 모양을 그대로 출력 : &lt;pre>
    - &lt;figure>, &lt;figcaption>
    - &lt;ul>, &lt;li>, &lt;ol>, &lt;dl>
    - &lt;a>
    - &lt;table>, &lt;tr>, &lt;th>, &lt;td>, &lt;cation>, &lt;thead>, &lt;tbody>, &lt;tfoot>
    - &lt;iframe>
  
  - 특수문자표기법
  
    
  
    - | &nbsp ; | 공백 | &qout ; | "      |
      | ------- | ---- | ------- | ------ |
      | &lt ;   | <    | &copy ; | &copy; |
      | &gt ;   | >    | &reg ;  | &reg;  |
      | &amp ;  | &    |         |        |
  
  - 정규 표현식
  
    | [a-zA-Z]{n}           | n개만큼 영문 a-z, A-Z를 입력     |
    | --------------------- | -------------------------------- |
    | [0-9]{n}              | n개만큼 0-9 숫자를 입력          |
    | [A-Za-z0-9]{min, max} | 영문자와 숫자를 min~max만큼 입력 |
    | [0-9]+                | 숫자를 1개 이상 입력             |
  
  - HTML5 표준 API
  
    - Cnavas API: 그래픽을 만들 수 있는 컨테이너
    - Drag&Drop API : 웹페이지 내에서 사용자가 요소를 자유롭게 이동시킬 수 있는 기능
    - Web Storage API : 클라이언트에 웹의 정보를 저장
    - Web Worker API : 스레드(Thread) 구동이 가능, 백그라운드에서 실행이 가능 
    - Web Soket API : 웹브라우저와 웹서버에서 실시간 양방향 통신 환경을 제공
    - Geolocation API : 사용자의 현재 위치의 좌표, 원하는 좌표의 지도를 그릴 수 있는 기증

