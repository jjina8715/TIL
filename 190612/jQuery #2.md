# jQuery #2

- jQuery 함수

  - .end() 바로 전의 filltering의 전단계로 옮겨간다

  - fillter() 아규먼트(csst선택자, 태그이름, 함수, ....)를 기준으로 태그들을 추린다.

  - css("속성명") getter

    css("속성명", "속성값") ,css("속성명", 함수), css({"속성명", "속성값" ....} ) setter

  - attr("속성명") getter

    attr("속성명", "속성값") ,attr("속성명", 함수), attr({"속성명", "속성값" ....} ) setter

    html() getter		=		innerHTML

    html(아규먼트) setter

  - text() getter

    text(아규먼트) setter

  - clone(bool) true dom 객체와 등록된 핸들러도 복제

  - 일반 태그의 content : html(), text()

    &lt;form> 태그의 서브태그들 : val()

    &lt;form> 태그의 서브태그중 &lt;textarea>: text(), val()

  - $('div>input[type=checkbox]').prop('속성명', 속성값) : div태그의 자식 태그중 input태그의 타입이 checkbox인 태그의 속성을 지정하는 메서드

  - find('객체명') 객체를 찾는 함수

- 이벤트

  1. 이벤트이름(함수)
  2. on("이벤트이름", 함수[, ....]) / off()
  3. one("이벤트이름",함수) 한번쓰면 자동 off

  - event.stopPropagation(); : 핸들러 상속 정지
  - event.preventDefault(); : 기본 이벤트 핸들러 제거

