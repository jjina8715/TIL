# JSTL

- JSP Standard Tag Library : 아파치 오픈 그룹이 만든 JSP의 커스텀 태그
  - core 라이브러리, format(i18n) 라이브러리, sql 라이브러리, xml 라이브러리, 함수 라이브러리

- core 라이브러리

  - 변수 선언 , 조건문, 반복문 등 간단한 프로그램 로직 구현을 대신할 수 있는 기능의 커스텀 태그

    ```html
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    ```

  - 종류

    - &lt;c:set> : jstl 태그에서 사용되는 el변수를 만드록 값을 설정할 때/el변수의 프로퍼티 값을 설정할 때

    ```html
    <c:set var="varName" value="varValue" [scope="영역"]>
    <c:set var="varName" [scope="영역"]>varValue</c:set>
    <c:set target="대상" property="프로퍼티이름" value="값"/>
    <c:set target="대상" property="프로퍼티이름">값<c:set> 
    ```

    - &lt;c:remove> : &lt;c:set>태그로 만든 el변수를 삭제할 때 사용

    ```html
    <c:remove var="varName" [scope="영역"] />
    ```

    ​		영역을 지정하지 않으면 모든 영역에서 동일한 이름의 변수를 모두 삭제

    - &lt;c:out> : JspWriter 객체를 이용하여 데이터를 출력할 때 사용하는 태그

    ```html
    <c:out value="value" [escapeXml="(true|false)"][defalut="defalutValue"]/>
    <c:out value="value" [escapeXml="(true|false)"]>defalut</c:out>
    ```

    ​		defalut : value 속성에서 지정한 값이 존재하지 않을 때 사용될 값

    - &lt;c:if> : Java 언어의 if문과 동일한 기능 else절 기능을 없음

    ```html
    <c:if test="조건">
    	...
    </c:if>
    <c:if test="<%=some condition%>" var="testResult">
     	var 속성 사용 시 test 속성의 계산 결과를 EL변수로 저장 가능
    </c:if>
    ```

    - &lt;c:choose>, &lt;c:when>, &lt;c:otherwise> : Java의 switch 구문과 if-else 또는 if-else if 구문을 혼합한 형태

    ````html
    <c:choose>
    	<c:when test="${member.level=='trial'}">
        	...
        </c:when>
        <c:when test="${member.level=='regular'}">
        	...
        </c:when>
        <c:otherwise>
        	...
        </c:otherwise>
    </c:choose>
    ````

    - &lt;c:forEach> : 배열 , Collection, Map 객체에 저장되어 있는 값들을 순차적으로 처리할 때 사용할 수 있는 태그 Java의 반복문 대신 사용 가능

    ```html
    <c:forEach var="i" begin="beginNum" end="endNum" step="stepNum">
    	${i} 사용
    </c:forEach>
    <c:forEach var="item" item="<%=someItemList%>" varStatus="status">
    	${ststus.index+1} 번째 항목 %{item.name}
    </c:forEach>
    ```

     - varStatus 속성 관련 프로퍼티

       | 프로퍼티명 | 기능                                             |
       | ---------- | ------------------------------------------------ |
       | index      | 루프 실행에서의 현재 인덱스 값(0부터 시작)       |
       | count      | 루프 실행 횟수 값(1부터 시작)                    |
       | begin      | begin 속성이 지정된 경우 begin 속성의 값         |
       | end        | end 속성이 지정된 경우 end 속성의 값             |
       | step       | step 속성이 지정된 경우 step 속성의 값           |
       | first      | 현재 실행이 루프의 첫 번째 실행인 경우 true      |
       | last       | 현재 실행이 루프의 마지막 실행인 경우 true       |
       | current    | 컬렉션에서의 현재 루프에서 사용할 데이터값(객체) |

    - &lt;c:forTokens> : java.util.StringTokenizer 클래스와 동일한 기능

    ```html
    <c:forTokens vat="token" item="문자열" delims="구분자">
    	${token}의 사용
    </c:forTokens>
    ```

    ​		forEach 태그와 동일하게 begin, end, step, varStatus 속성을 제공

    - &lt;c:import> : 특정 URL의 결과를 읽어와 현재 위치에 삽입하거나 EL변수에 저장할 때 사용. 외부의 다른 자원을 읽어와 포함 가능

    ```html
    <c:import url="URL" [var="변수명"] [scope="영역"] [charEncoding="문자셋"]>
    	<c:param name="이름" value="값"/>
    </c:import>
    ```

    ​		요청 파라미터를 전달하는 방법은 쿼리 문자열을 사용하는 방법과 &lt;c:param> 서브태그를 사용하는 방식이 있다.

    - &lt;c:url> : URL을 생성해 주는 기능을 제공

    ```html
    <c:url value="URL" [var="varName"] [scope="영역"]>
    	<c:param name="이름" value="값"/>
    </c:url>
    ```

    - &lt;c:redirect> : respnse.sendRedirect()처럼 지정한 페이지로 리다이렉트 시키는 기능

    ```html
    <c:redirect url="URL" [context="콘텍스트 경로"]>
    	<c:param name="이름" value="값"/>
    </c:redirect>
    ```

    - &lt;c:catch> : 발생된 예외을 EL 변수에 저장할 때 사용하는 태그

    ```html
    <c:catch var="exName">
    	예외가 발생할 수 있는 코드
    </c:catch>
    ```

- xml 라이브러리

  - XML 문서에서 자주 사용하는 기능을 커스텀 태그로 모아 놓은 것
  - XPath : XML Path Language. XML 에서의 특정 요소나 속성에 접근하기 위한 경로를 지정하는 언어
    - W3C 표준 권고안으로, XSLT와 XPointer에 사용될 목적으로 제작
    - EL  변수를 사용할 때에는 변수명 앞에 $기호
    - 속성명 앞에는 @기호
    - 태그의 자식 태그는 /, 자손태그는 //

  ```html
  <%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
  ```

  - 종류

    - &lt;x:out> : 파싱한 XML 문서에서 지정된 XPath 표현식에 대응되는 태그의 내용을 출력

    ```html
    <x:out select="XPath표현식" escapeXml="true/false" >
    ```

    - &lt;x:set> : 파싱한 XML 문서에서 지정된 XPath 표현식에 대응되는 태그의 내용을 지정된 변수에 저장하는 태그

    ```html
    <c:set var="변수명" select="XPath표현식" scope="범위">
    ```

    - &lt;x:if> : &lt;c:if>와 유사한 기능. 파싱한 XML문서에 select 속성에 설정된 XPath 표현식 조건에 알맞은 태그가 존재하는지 여부에 따라 시작 태그와 종료 태그 사이의 코드의 수행 여부를 결정

    ```html
    <x:if var="변수명" select="범위">
    ```

    - &lt;x:choose>, &lt;x:when>, &lt;x:otherwise> : 파싱한 XML 문서에 &lt;x:when>태그의 select 속성에 설정된 XPath 표현식 조건에 알맞은 태그가 존재하는지 여부에 따라 &lt;x:when>의 코드와 &lt;x:otherwise> 태그의 코드 중에서 수행을 결정

    ```html
    <x:choose>
    <x:when select="XPath 표현식">참일 때 수행 코드</x:when>
        <x:otherwise>거짓일 때 수행 코드</x:otherwise>
    </x:choose>
    ```

    - &lt;x:forEach> : 파싱한 XML 문서에 select 속성에 설정된 XPath 표현식 조건에 알맞은 태그가 2개 이상인 결우 사용되는 태그. XML 문서에 대한 반복 처리가 필요할 때 사용

    ```html
    <x:forEach var="변수명" select="XPath 표현식" begin="시작인덱스" end="끝인덱스" step="증감식">
    ```

    - &lt;x:parse>  : XML 문서를 파싱할 때 사용하는 태그로서 XML 문서를 읽어서 DOM 객체를 생성

    ```html
    <x:parse xml="EL 변수의 표현식" varDom="변수명" scopeDom="범위">
    ```

    - &lt;x:transform> : XML 문서를 XSL 스타일 시트를 이용하여 새로운 문서를 변형시키는 역할

    ```html
    <x:transform var="변수명" scope="범위" doc="source" xslt="XSLTStyleSheet">
    ```