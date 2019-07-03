# Spring FW #2

**프레임워크(Framework)** 1998, 2004~2006

- 스마트 라이브러리
  - 라이브러리 + 디스크립터 파일(xml)
- EJB(1998), Servlet, Struts, iBatis(MyBatis), Spring, Spring MVC
  - Java+XML

<ANNOTATION 설정>

- @Component

  - 클래스에 선언하며 해당 클래스를 자동으로 bean으로 등록
  - bean의 이름은 해당 클래스명(첫글자가 소문자)이 사용
  - 범위는 디폴트로 singleton이며, @Scope를 사용하여 지정 가능
  - 소스 안에 작성된 어노테이션이 적용되려면 다음과 같은 태그들이 설정 파일에 정의되어 있어야 한다.

  ```xml
  <context:annotation-config> - @Autowired만 사용했을 때
  <context:component-scan base-package="xxx"/> - 모든 어노테이션 
  ```

- @Scope

  - 스프링은 기본적으로 빈의 범위를 "singleton"으로 설정한다. 다른 범위를 지정하고 싶을 때 @Scope 어노테이션을 이용해 범위를 지정
  - 범위 : prototype, singleton, request, session, globalSession

  ```java
  @Component
  @Scope(value="prototype")
  public class Class{ ... }
  ```

- @Autowired

  - Spring에서 의존관계를 자동으로 설정할 때 사용.

  - 생성자, 필드, 메서드 세곳에 적용이 가능

  - 타입을 이용한 프로퍼티 자동 설정 기능을 제공, 해당 타입의 빈 객체가 없으면 NoSuchBeanDefinitionException예외 발생

  - 일반 메서드에도 적용가능 

    - 프로퍼티 설정이 필수가 아닐 경우 @Autowired(required=false)로 선언. 없으면 null로 지정

    - byType으로 의존관계를 자동으로 설정할 결우 같은 타입의 빈이 2개 이상 존재시 예외

      - 이러한 경우 @Qualifier를 사용해 동일한 타입의 빈 중 특정 빈을 사용하도록 문제를 해결

      ```java
      @Autowired
      @Qualifier("test")
      private Test test;
      ```

  - 스프링 전용, type으로 찾는다.

- @Resource

  - 자바 6버전 및 JEE5 버전에 추가된 것
  - 어플리케이션에서 필요로 하는 자원을 자동 연결할 때 사용
  - 스프링에서 의존하는 빈 객체를 전달할 때 사용
    - 같은 타입의 빈 객체가 2개 이상이면 NoUniqueBeanDefinitionException 예외 발생
    - 없으면 NoSuchBeanDefinitionException 예외 발생
  - @Autowired는 타입으로 @Resource는 이름으로 연결시켜준다.
  - 설정 파일에서 &lt;context:annotation-config> 태그를 사용해야 인식하며 name 속성에 자동으로 연결될 빈 객체의 이름을 입력

  ```java
  @Resource(name="testDao")
  ```

**SpringMVC**

<웹 애플리케이션이란>

- 복수의 사용자가 인터넷을 통해 DB에 접근하고 안전하게 정보를 읽고 쓸 수 있게 지원하는 애플리케이션
- 성송적인 시스템을 개발하는데 가장 중요한 요소 중 하나가 어플리케이션의 전체적인 구조
- 웹 어플리케이션 구조
  - 티어 : 어플리케이션의 구조를 물리적으로 나눈 것 ex)클라이언트 티어, 서버 티어, EIS 티어...
  - 레이어 : 어플리케이션의 구조를 논리적으로 나눈 것 ex) 프리젠테이션 레이어, 비즈니스 로직 레이어...
  - 최대한 레이어 간에 의존 관계를 줄여야 유지보수성이 좋은 애플리케이션이 된다.

<스프링 MVC 처리 흐름>

- 스프링 MVC는 프론트 컨트롤러 패턴을 적용
  - front controller pattern은 하나의 핸들러 샛체를 통해서 요청을 할당하고, 일관된 처리를 작성 가능한 패턴
- 브라우저로부터 받은 요청은 스프링MVC가 제공하는 DispatchServlet 클래스가 모두 관리
- web.xml파일에 다음과 같이 설정 내용을 추가

```xml
<servlet>
	<servlet-name>springmvc</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>springMVC</servlet-name>
    <url-pattern>*.do</url-pattern>
</servlet-mapping>
<!--한글 처리-->
<filter>
	<filter-name>encodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <init-param>
    	<param-name>encoding</param-name>
    	<param-value>UTF-8</param-value>
    </init-param>
</filter>
<filter-mapping>
	<filter-name>encodingFilter</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>
```

<Spring MVC 구현에서 사용되는 다양한 애노테이션>

**@Controller**

- spring MVC의 Controller 클래스 선언을 단순화시켜준다. 스프링 컨트롤러
- Controller에 있는 @Autowired는 @Service("xxxService")에 등록된 xxxService와 변수명이 같아야 한다.
- 서블릿을 상속할 필요가 없으며 @Controller 지정해주면 cmponent-scan으로 자동 등록

```xml
<context:component-scan base-package="패키지명"
```

- 컨트롤러 메서드의 파라미터 타입

| 타입                                                 | 설명                                                         |
| ---------------------------------------------------- | ------------------------------------------------------------ |
| HttpServletRequest, HttpServletResponse, HttpSession | Servlet API                                                  |
| java.util.Locale                                     | 현재 요청에 대한 Locale                                      |
| InputStream, Reader                                  | 요청 컨텐츠에 직접 접근할 때 사용                            |
| OutputStream, Writer                                 | 응답 컨텐츠를 생성할 때 사용                                 |
| @PathVariable 어노테이션 전용 파라미터               | URI 템플릿 변수에 접근할 때 사용                             |
| @RequestParam 어노테이션 전용 파라미터               | HTTP 요청 파라미터를 매핑                                    |
| @RequestHeader 어노테이션 전용 파라미터              | HTTP 요청 헤더를 매핑                                        |
| @CookieValue 어노테이션 전용 파라미터                | HTTP 쿠키 매핑                                               |
| @RequestBody 어노테이션 전용 파라미터                | HTTP요청의 몸체 내용에 접근할 때 사용, HttpMessage Converter를 이용 HTTP 요청 데이터를 해당 타입으로 변환한다. |
| Map, Model, ModelMap                                 | 뷰에 전달할 모델 데이터를 설정할 때 사용                     |
| 커먼드 객체                                          | HTTP 요청 파라미커를 저장한 객체. 기본적으로 클래스 이름을 모델명으로 사용 |
| Errors, BindingResult                                | @ModelAttribute 어노테이션을 사용하여 모델명을 설정가능. HTTP 요청파라미터를 커맨드 객체에 저장한 결과. 커맨드 객체를 위한 파라미터 바로 다음에 위치 |
| SessionStatus                                        | 폼 처리를 완료했음을 처리하기 위해 사용. @SessionAttribute 어노테이션을 명시한 session 속성을 제거하도록 이벤트를 발생 |

- 컨트롤러 메서드의 리턴 타입

| 리턴 타입                     | 설명                                                         |
| ----------------------------- | ------------------------------------------------------------ |
| ModelAndView                  | 뷰 정보 및 모델 정보를 담고 있는 ModelAndView 객체           |
| Model                         | 뷰에 전달할 객체 정보를 담고 있는 Model를 리턴. 이때 뷰 이름은 요청 URL로부터 결정된다. (RequestToViewNameTranslator를 통해 뷰 결정) |
| Map, ModelMap                 | 뷰에 전달할 객체 정보를 담고 있는 Map 혹은 ModelMap을 리턴. 이때 뷰 이름은 요청 URL로부터 결정된다. (RequestToViewNameTranslator를 통해 뷰 결정) |
| String                        | 뷰 이름을 리턴                                               |
| View                          | View 객체를 직접 리턴. 해당 View 객체를 이용해서 뷰를 생성   |
| void                          | 메서드가 ServeltResponse나 HttpServletResponse 타입의 파라미터를 갖는 경우 메서드가 직접 응답을 처리한다고 가정. 그렇지 않을 경우 요청URL로부터 결정된 뷰를 보여준다. (RequestToViewNameTranslator를 통해 뷰 결정) |
| @ResponseBody 어노테이션 적용 | 메서드에서 @ResponseBody 어노테이션이 적용된 경우. 리턴 객체를 HTTP 응답으로 전송. HttpMessageConverter를 이용해서 객체를 HTTP 응답스트림으로 변환 |

**@Service**

- @Service를 적용한 Class는 비지니스 로직이 들어가는 Service로 등록이 된다.
- Service에 있는 @Autowired는 @Repository("xxxDao")에 등록된 xxxDao와 변수명이 같아야 한다.

**@RequestMapping**

- url을 class또는 method와 mapping 시켜주는 역활
- Controller등록을 위한 url bean 설정을 생략할 수 있다.
- class에 하나의 url mapping을 할 경우, class위에 @RequestMapping("/url")을 지정하며, GET 또는 POST 방식 등의 옵션을 줄 수 있다.
- 해당되는 method가 실행된 후, return 페이지가 따로 정의되어 있지 않으면 RequestMapping("/url")에서 설정된 url로 다시 돌아간다.

<상세 속성 정보>

	- value : "value='/getXxx.do'"와 같은 형식의 매핑 url값이다. 디폴트 속성이기 때문에 value 정의하는 경우에는 생략 가능.
	- method : GET, POST, HEAD 등으로 표현되는 HTTP Request method에 따라 requestMapping 가능. methid 값을 정의하지 않는 경우  모든 HTTP Request method에 대해서 처리. value 값은 클래스 선언에 정의한 @RequestMapping의 value값을 상속받는다.
	- params : HTTP Request로 들어오는 파라미터 표현 'params={"params 1=a, 'param2}

```java
@RequestMapping(value="/", method=RequestMethod.GET)
public String home(Locale, Model model){ }

@RequestMapping("/hello.do")
public ModelAndView hello(){ }

@RequestMapping(value="/select1.do", method=RequestMethod.GET)
public String select(){ }

@RequestMapping(value="/insert1.do", method=RequestMethod.POST)
public String insert(){ }
```

**@RequestParam**

- 요청 파라미터(Query 문자열)를 메서드의 매개변수로 1:1 대응해서 받는 것이 @RequestParam 이다.

```java
public String hello(@RequestParam("name") String name, @RequestParam(value="pageNo", required=false) String pageNo) { }

public ModelAndView searchInternal(@RequestParam("query") String query, 
                                  @RequestParam("p") int pageNumber) { }

public String getAllBoards(@RequestParam(value="currentPage", requred=false,
                                        defaultValue="1")int currentPage, Model model) { }

public String hello(String bookname, int bookPrice) { }

public String check(@RequestHeader("User-Agent") String clientInfo) { }
```

**@ModelAttribute**

- 도메인 오브젝트나 DTO 또는 VO의 프로퍼티에 요청 파라미터를 바인딩해서 한 번에 받는다. 
- 하나의 오브젝트에 클라이언트의 요청 정보를 담아서 한 번에 전달되는 것이기 때문에 이를 커맨드 패턴에서 말하는 커맨드 오브젝트라고 부르기도 한다. 

```java
@RequestMapping(value="/user/add", method=RequestMethod.POST)
public String add(@ModelAttribute User user){
    ...
}
```

- 컨트롤러가 리턴하는 모델에 파라미터로 전달한 오브젝트를 자동으로 추가해 준다. 이때 모델의 이름은 기본적으로 파라미터의 이름을 따른다.

```java
public String update(@ModelAttribute("currentUser") User user){ 
   //update()컨트롤러가 DispatcherServlet에게 돌려주는 모델 맵에는 "cuerrentUser"라는 키로 User 오브젝트가 저장되어 있게 된다.
}
```

**@PathVariable**

- url의 특정 부분을 변수화 하는 기능을 지원하는 어노테이션
- @RequestMapping에서는 변수를 {}로 감싸주고, 메서드의 파라미터에 @PathVariable을 지정하여 메서드에서 파라미터로 활용

```java
@RequestMapping(value="/board/list_controller/{currentPage}/test/{name}")
public String getAllBoards(@PathVariable(value="currentPage") int currentPage,
                          @PathVariable(value="name") String name, Model model) { ... }
```

**@RequestBody & @ResponseBody**

























