# Servlet 

1. HttpServlet 클래스를 상속

   Tomcat(Web Server + Application Server : WAS)

   ​				코요테					카탈리나

   GET : doGet()

   POST : doPost()

   둘 다 : doGet(), doPost()

   HttpServletRequest : 요청 정보를 추출하고자 할 때 (쿼리 문자열)

   HttpServletResponse : 응답과 관련하여 응답 스트림 객체, 컨텐트 타입 설정

2. 서블릿의 수행상의 특징

   - 서블릿은 한 번 메모리 할당(객체 생성)되면 할당된 상태를 계속 유지

   - 여러 클라이언트 요청에 대해서 하나의 서블릿 객체를 공유해서 수행

   - 각 시점마다 호출되는 메서드가 정해져 있다.

     객체 생성후 - init()

     요청을 올 때마다 - service() - doGet(), doPost()

     객체 해제전 - destroy()

3. 쿼리 문자열 추출 방법

   - name=value?name=value?name=value .....

     HttpServletRequest 객체

     	- String getParameter(String name) : value 값 또는 null 또는 ""
     	- String[] getParameterValues(String name) : value 값들의 배열 또는 null

   - Get 방식의 경우에는 Query문자열 추출시 한글이 깨지지 않는다.

     Post방식의 경우는 깨진다. - > 추출 전에 request.setCharacterEncoding("UTF-8")을 호출한 후에 추출

- HttpServletRequest 객체의 주요 method
  - getRequestURI() : 요청 URI를 반환
  - getRequestURL() : 요청 URL을 반환
  - getParameter(name) / getParameterValues(name) : name명으로 전달되는 Query 문자열에서의 value값을 추출
  - getPart(name) / getParts(): 클라이언트에서 전송된 multipart/form-data 형식의 데이터에서 name이라는 이름으로 전달된 Part 객체을 / 모든 Part 객체들을 추출
  - request.getHeader("referer") : 해당 Servlet을 요청한 페이지를 추출

- HttpServletResponse 객체의 주요 method

  - setContentType(String mimeType) : 응답되는 콘텐츠의 타입 정보를 설정 
  - sendRedirect(url) : 요청을 재지정

- 요청 재지정

  - forward 방식 

    - RequestDispatcher rd = request.getRequestDispatcher(URI);

      rd.forward(request, response);

    - URI를 입력할 때 컨텍스트 패스를 생략하고 쓴다

  - redirect 방식

    - response.sendRedirect(URL or URI);
    - 대상 URL이나 URI에 제한이 없다.