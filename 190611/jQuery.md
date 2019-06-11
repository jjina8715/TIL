# jQuery

- HTML 문서 안의 스크립트 코드를 단순화하도록 설계된 자바스크립트 라이브러리
- 존 레식이 2006년 제안
- 웹브라우저마다 다르게 작성해야 되는 크로스 브라우징 자바스크립트 코드를 jQuery 라이브러리를 사용하여 최대한 쉽게 작성할 수 있도록 지원하는 것이 목표
- 주요 기능
  - DOM 요소 선택 기능, DOM 탐색 및 수정
  - CSS 셀렉터에 기반한 DOM 조작
  - 크로스 브라우징 이벤트 처리
  - 특수효과 및 애니메이션
  - AJAX
  - JSON 파싱
  - 플러그인을 통한 확장성

- 주요 활용 기능

  - DOM 프로그래밍, 이벤트 처리 프로그래밍, AJAX 프로그래밍, 화면 효과 프로그래밍

  | 분류         | 기능              | 지원 메서드                                    |
  | ------------ | ----------------- | ---------------------------------------------- |
  | Core         | 핵심개념          | jQuery() 선언 함수 정의 및 활용방법            |
  | Selectors    | 선택자            | DOM 트리의 노드 선택 표현식                    |
  | CSS          | 스타일            | CSS 스타일 속성값 변경 메서드                  |
  | Traversing   | 탐색              | DOM 트리의 계층 구조를 이용한 노드 탐색 메서드 |
  | Manipulation | 조작              | DOM 트리의 노드 변경 메서드                    |
  | Attributes   | 속성              | 엘리먼트 속성값의 조회 및 변경 메서드          |
  | Events       | 이벤트            | 마우수, 키보드, 폼 및 문서 관련 이벤트 메서드  |
  | Effects      | 효과              | 동적 스타일 변화를 위한 메서드                 |
  | Ajax         | 비동기교환방식    | Ajax 관련 메서드                               |
  | UI           | 사용자 인터페이스 | 사용자 인터페이스 용 라이브러리                |

- jQuery 라이브러리 선언

  - &lt;script>태그를 작성

    &lt;script src="http://code.jquery.com/jquery-xxx.js">&lt;/script>

  - 제공되는 메서드

    jQuery(자바스트립트 객체).xxx()

    jQuery.xxx()

    jQuery -> $ : 줄여서 표시

  - 함수의 주요 아규먼트

    - selector [, context ] / element / elementArray / object / selection / html [, ownerDocument] / html , attributes / callback
    - selector [, context ] : selector는 css선택자를, context는 dom객체를 넣을 수 있다. selector를 context안에서 찾는다.

- $() 함수의 사용

  - 시작 이벤트 핸들러 등록

    ```html
    jQuery(document).ready(function(){....});
     -> $(document).ready(function(){....});
     -> $(function(){....}); = window.onload=function(){....}
    ```

  - 선택자에 알맞은 DOM 객체 추출

    - $(CSS선택자문자열) 형태로 jQuery 선택자를 입력 인자로 받아들여 선택자 조건을 만족하는 엘리먼트 노드들을 DOM 트리에서 찾아 'jQuery 객체' 형식으로 반환
    - 일치하는 DOM 노드들이  여러개이면 배열 형태를 반환
    - 반환하는 DOM 엘리먼트들을 jQuery 객체 개념으로 감싸고 미리 준비된 메서드를 사용할 수 있도록 확장

  - val(), html() : 아규먼트 없이 호출하면 getter, 아규먼트를 설정하면 getter로 작용