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

  - HTML5 선언문 : <!DOCTYPE HTML>

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

    - &lt;header, &lt;nav> &lt;section>, &lt;article>, &lt;;aside>, &lt;footer>, &lt;hgroup>

      