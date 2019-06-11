# AJAX #2

- HTTP 요청 방식 : 웹 클라이언트가 웹 서버에게 요청하는 방식

  - GET방식 : http://URL?Query문자열(id=value)

    1. 전달되는 query문자열의 외부에 보여진다.
    2. 전달되는 query문자열의 길이에 제한이 있다.

    직접 url 입력, &lt;a>, location.href, &lt;form> 태그의 method 속성값이 'get'일 때, Ajax 요청시 GET을 지정하면

  - POST방식 : 

    요청하면서 서버에 전달할 name과 value로 구성된 데이터를 요청 body에 담아서 전달

    데이터를 요청 바디에 담아서 전달

    query 문자열이 외부에 보여지지 않는다. 길이에 제한이 없다.

    &lt;form> 태그의 method 속성값이 'post'일 때, Ajax 요청시 POST을 지정하면

  - query 문자열 인코딩 규칙

    1. 영문자, 숫자 그리고 일부 특수문자를 제외한 문자들은 % 기호와 함께 16진수 코드값으로 변환되어 전달
    2. 공백은 '+' 기호(%20)로 변환
    3. name과 value로 구성되어야 하며, 여러 개 전달될 때는 '&' 기호로 연결한다.