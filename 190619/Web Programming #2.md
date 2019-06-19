# Web Programming #2

#### HTTP(HyperText Transfer Protocol)

- 웹 통신에 사용되는 표준 통신 프로토콜

  웹상에서 정보를 주고 이에 이루어지는 요청과 응답에 대한 프로토콜

  Connection Oriented와 Stateless방식으로 동작하는 프로토콜

- HTTP 1.1에서 지원되는 요청방식들

  - **GET** : URI에 지정된 파일을 얻고자 할 때 사용되는 요청 방식. 기본값
  - HEAD : GET과 동일하나 바디 내용은 두고 HTTP 헤더 정보만 받는다.
  - **POST** : 원하는 방식으로 인코딩된 데이터를 요청 바디에 포함하여 전송
  - OPTIONS : 요청 URI에 대하여 허용되는 통신 옵션을 알고자 할때
  - DELETE : 서버에서 요청 URI에 지정된 자원을 지울 수 있다.
  - PUT : 파일을 업로드 할 때 사용되지만 일반적으로 POST 방식을 사용

#### Java EE기반의 웹어플리케이션

- Servlet과 JSP는 JAVA의 Enterprise Edition에 속하는 웹앱 기술로서 웹 클라이언트 요청에의해 웹 서버에서 수행되고 그 수행 결과가 클라이언트에 응답되는 기술
- Servlet : 상속 구문과 메서드 오버라이딩 구문을 적용한 java로 구현된 프로그램. 수행결과를 HTML로 응답하도록 구현하는 기술
- JSP : HTML 문서 안에 JSP태그와 동적인 처리를 담당하는 Java 코드를 삽입하여 구현하는 기술
- Java EE 환경에서 Servlet과 JSP는 웹 컨테이너(엔진)에 의해 관리, 수행되는 웹컴포넌트, 여러 웹 컨포넌트들이 모여 하나의 웹 어플리케이션을 구성

#### MVC 패턴

- SW 공학에서 사용되는 아키텍처 패턴

- Model : 다양한 기능의 서비스 로직(SERVICE, BIZ), DB 연동 로직(DAO)을 지원하는 서비스 모델과 처리결과를 저장(VO, DTO)하고 전달하는 기능을 지원하는 JAVA 객체로서의 도메인 모델로 구성

  View : 사용자 인터페이스 요소를 담당(JSP). 

  Controller : 데이터와 비즈니스 로직 사이의 상호동작 관리, 어플리케이션의 기능을 담당(Servlet 객체)

- Servlet과 JSP간의 객체 공유

  - Servlet이 생성한 객체를 JSP와 공유하는 것으로 Sevlet이 JSP에게 응답할 때 사용될 데이터 값을 전달할 수 있는 방법 

    1. HttpServletRequest 객체에 저장하여 공유
    2. HttpSession 객체에 저장하여 공유
  3. ServletContext 객체에 저장하여 공유
  
- 객체의 스코프scope
  
    | 스코프 종류       | 기능                                                         |
    | ----------------- | ------------------------------------------------------------ |
    | Page scope        | Servlet or JSP 가 수행되는 동안 각자의 프로그램 내에서만 유효한 객체 |
    | Request scope     | 웹 클라이언트로부터의 요청이 끝날 때 까지 유효한 객체        |
    | Session scope     | 요청을 보내온 web 클라이언트가 기동되어 있는 동안 유효한 객체 |
  | Application scope | 서버가 기동되어 있는 동안 유효한 객체                        |
  
  - page 스코프를 제외하고 나머지는 같은 서버와 같은 웹 컨텍스트 내의 Servlet과 JSP 간에 객체를 공유하는 용도로 사용. page는 this.를 주로 사용
  
    - Reques scope는 HttpServletRequest 객체에 공유할 객체를 보관.
  
    - Session scope는 HttpSession 객체에 공유할 객체를 보관
  
    - Application scope는 ServletContext 객체에 공유할 객체를 보관
  
    - 위 세 객체는 객체를 저장, 추출하는 용도로 다음 메서드를 동일하게 지원
  
        | 메서드명                                    | 기능                |
        | ------------------------------------------- | ------------------- |
        | void setAttribute(String key, Object value) | 객체의 참조 값 저장 |
        | Object getAttribute(String key)             | 객체의 참조 값 추출 |
      | void removeAttribute(String key)            | 객체의 참조 값 삭제 |
  
        















