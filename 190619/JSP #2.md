# JSP #2

2. JSP 내장 객체

   - 내장 객체를 선언하고 초기화하는 것은 JSP 컨테이너가 JSP 소스를 Servlet 소스코드로 변환하는 과정에서 자동적으로 추가한다.

   | 객체 변수   | 클래스 및 인터페이스     | 설명                                               |
   | ----------- | ------------------------ | -------------------------------------------------- |
   | request     | http.HttpServletRequest  | 클라이언트에서 전송되는 다양한 요청                |
   | response    | http.HttpServletResponse | 응답 시 필요한 기능을 제공                         |
   | pageContext | jsp.PageContext          | 페이지가 처리되는 시점에서의 외부 환경 데이터 추출 |
   | session     | http.HttpSession         | 클라이언트 별로 생성되는 HttpSession 객체          |
   | application | ServletContext           | application scope 객체 생성과 관리                 |
   | config      | ServletConfig            | Servlet 구성 데이터 추출                           |
   | out         | jsp.JspWriter            | 응답용 출력 스트림                                 |
   | page        | jsp.HttpJspPage          | 페이지의 Servlet 인스턴스                          |
   | exception   | java.lang.Throwable      | 생성된 예외 객체를 참조                            |

   