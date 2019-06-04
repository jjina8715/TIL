# Java Script #2

- 구문정리

  6. 객체 생성 - 개체 리터럴/ 클래스

     1. 객체 리터럴

        - { } : 빈객체

        - {속성명:속성값, 속성명:속성값 ... }

          속성값: 숫자, 문자열, 논리값, 배열, 함수(메서드)  

        - 하나의 객체만을 만들 수 있게 된다.(싱글톤 객체)

        - prototype 속성 사용이 불가

     2. 생성자 함수(클래스+생성메서드)

        - 객체를 초기화하는 역할의 함수

        - new와 함께 호출된다.

        - 이름을 정할 때 첫글자는 대문자

        - new 생성자명(){

          ​	this.속성명 = 속성값,

          ​	......

          }

        - prototype 속성 사용이 가능(객체들이 공유)

          생성자명.prototype.함수명() = function(){....}

        - 정적 멤버를 정의 가능

        - 캡슐화나 정적 멤버와 같은 OOP 구문을 적용해 객체 생성이 가능

     - 객체의 멤버 접근 방법
       - 멤버 연산자 : 객체명.속성명
       - 인덱싱 방법 : 객체명['속성명'] 

  7. 주요 API - 내장 함수, 내장 객체, BOM, DOM
  
     - BOM: Browser Object Model
  
       ​		   브라우저가 제공하는 자바스크립트 API
  
       ​		   미리 객체를 생성해서 제공
  
       | 객체      | 설명                                                         |
       | --------- | ------------------------------------------------------------ |
       | window    | 최상위 객체, 각 탭별, iframe별로 하나씩 존재                 |
       | navigator | 브라우져(이름, 버전 등) 정보를 보관하는 객체                 |
       | document  | 현재의 문서에 대한 정보를 보관하는 객체                      |
       | location  | 현재 보여지고 있는 웹 페이지에 대한 URL 정보를 보관하는 객체 |
       | history   | 현재의 브라우저가 접근했던 URL의 정보를 보관하는 객체        |
       | screen    | 클라이언트 머신의 화면 크기나 해상도 등의 정보를 얻을 수 있는 객체 |
  
     - DOM : Document Object Model
  
       ​			 객체 지향 모델로써 구조화된 문서를 표현하는 형식
  
       ​			HTML파서들은 파싱한 HTML문서의 각가의 태그들, 태그의 속성, 태그의 텍스트 형식의 컨텐트들은 모두 자바스크립 객체로 생성
  
       ​			----> 자바스크립트에서 접근 가능하도록 지원하기 위해
  
     - document
  
       - getElementById("id 속성값") 
       - getElementsClassName("class속성값")
       - getElementsTagName("태그명")
       - getQuerySelector("CSS선택자")
       - getQuerySelectorAll("CSS선택자")
  
       ex) 
  
       ```html
       <body>
       <h2></h2>
       <button onclick="changeColor('red')">빨강</button>
       <script>
       	document.getElementsByTagName("h2")[0];
           target.innerHTML = "dddd";
           function changeColor(col){
               target.style.color = col;
           }
       </script>
       </body>			 
       ```
  
- 이벤트 핸들러

  - 이벤트 : 웹페이지상에서 발생되는 일

    1. 브라우저에서 자동으로 발생(load)			
  
     				2. 사용자의 액션에 의해서 발생(click, mouseover, mouseenter, mouseout, keyin, keypress, keyout, scroll, change, submit, reset, ......)
  
- 타겟 : 이벤트가 발생된 대상 객체
  
- 이벤트 핸들러/리스너 : 이벤트가 발생했을 때 수행되는 코드를 담고 있는 함수
  
- 이벤트 모델 : 특정한 타겟에서 정해진 이벤트가 발생했을 때 핸들러가 수행되도록 구현하는 방법
  
     1. 인라인 이벤트 모델 : 간단하지만 유지보수하기엔 안 좋다. 지역 방식
  
        - 태그의 속성으로 등록. onXxx="코드"의 형태
  
     2. 고전 이벤트 모델 : 전역 방식
  
        - DOM객체를 찾는다.
  
          DOM객체.onxxx = 함수;
  
          DOM객체.onxxx = null;
  
     3. 표준 이벤트 모델 : w3c가 개발. 전역 방식
  
        - DOM 객체를 찾는다.
  
          DOM객체.addEventListener("xxx", 함수);
  
          DOM객체.removeEventListener("xxx", 함수);
  
            