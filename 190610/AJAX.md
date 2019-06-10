AJAX

'Asynchronous JavaScript and XML'

- 재로드하지 않고 웹페이지의 일부만을 갱신하여 웹서버와 데이터를 교환하는 방법, 빠르게 동적 웹페이지를 생성하는 기술

- GML: IBM에서 출판문서 작성용도로 사용

  -->SGML: 표준-출판뿐만 아니라 규격 문서를 작성하는 범용 용도

  -->XML: 다목적,...,규격화된 문서 작성용 - 직접 태그 정의

  ​	<태그명>  ....  </태그명>

  ​	<태그명/>

  ​	<태그명 속성명="속성값">

- JSON

  - 인터넷에서 자료를 주고 받을 때 그 자료를 표현하는 방법
  - 프로그래밍 언어나 플랫폼에 독립적
  - 개방형 표준, 읽기 및 쓰기가 쉽고 가볍다

- XMLHttpRequest 객체

  - 서버 측과의 비동기 통신을 제어

    |          | 멤버               | 개요                                              |
    | -------- | ------------------ | ------------------------------------------------- |
    | 프로퍼티 | onreadystatechange | 통신상태가 변화된 타이밍에 호출되는 이벤트 핸들러 |
    |          | readyState         | HTTP 통신상태를 취득                              |
    |          | state              | HTTP State 코드를 취득                            |
    |          | responseType       | 응답본체를 plaintext로 취득                       |
    |          | responseText       | 응답받으려는 컨텐트 타입                          |
    |          | responseXML        | 응답본체를 XML(XMLDocument 객체)로 취득           |
    |          | response           | 지정된 응답 타입에 따른 응답객체                  |
    |          | upload             | XMLHttpRequestUpload 객체 제공                    |
    | 메서드   | open(.....)        | HTTP 요청을 초기화                                |
    |          | send([body])       | HTTP 요청을 송신(인수 body는 요청본체)            |

  - readyState 값

    - 0 : 미초기화
    - 1 : 로드 중
    - 2 : 로드 완료
    - 3 : 일부 응답을 취득
    - 4 : 모든 응답 데이터를 취득 완료

  - XMLHttpRequest  객체에서 제공되는 이벤트 관련 속성

    - onloadstart, onprogress, onabort, onerror, onload, ontimeout, onloadend, onreadystatechange

  - open(HTTP 메서드, URL[, 비동기 모드 통신 여부])

    - HTTP 메서드: 요청방식
    - URL: AJAX로 요청하려는 서버의 대상 페이지
    - 비동기 모드 통신 여부: TRUE가 비동기통신

  - send([요청 파라미터])

    - post의 경우 query 문자열을 인수로 지정
    - ArrayBufferView, Blob, Document, DOMString, FormData, null

- Same Origin Policy(SOP)

  - 브라우저에서 보안상의 이슈로 동일 사이트의 자원만 접급해야 한다는 제약
  - ajax는 이 제약에 영향을 받으므로 Orgin 서버가 아니면 ajax로 요청한 컨텐츠를 수신 불가

- CrossOrigin Resource Sharing(CORS)

  - Origin이 아닌 다른 사이트의 자원을 접근하여 사용한다는 의미

  - HTTP Header에 CORS과 관련된 항목을 추가한다.

    ```html
    response.addHeader("Access-Control-Allow-Origin","*");
    ```

- jQuery의 ajax 지원 api
  - $.ajax(), $.get(), $.post(), $.getJSON(), load(), $.getScript(), $.ajaxSetup()