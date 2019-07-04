# Spring #3

- 스프링 MVC에서 파일 업로드 구현하는 방법

  - bean 설정 파일에 다음 내용을 추가

  ```xml
  <beans:bean id="multipartResolver"
              class="org.springframework.web.multipart.commons.CommonsMultipartResolver"/>
  ```

  - 클라이언트에서 업로드되느 파일은 하나의 파트(다중 파일이 업로드될 때는 여러개의 파트로)구성되어 전달. 

  - 파트를 아규먼트로 받기 위한 컨트롤러 메서드의 매개변수 타입

    - xxx(MultipartFile mfile)
    - xxx(MultipartFile타입을멤버변수로정의한VO클래스 vo)
    - xxx(MultipartRequest mreq) -> 다중 파일 일때

  - MultipartFile의 주요 메서드

    | 이름                                 | 기능                                            |
    | ------------------------------------ | ----------------------------------------------- |
    | String getName()                     | 파라미터 이름을 구한다.                         |
    | String getOriginalFilename()         | 업로드한 파일의 길제 이름을 구한다.             |
    | blooean isEmpty()                    | 업로드 한 파일이 존재하지 않는 경우 true를 리턴 |
    | long getSize()                       | 업로드한 파일의 크기를 구한다.                  |
    | byte[] getBytes() throws IOException | 업로드한 파일 데이터를 구한다.                  |
    | InputStream getInputStream()         | InputStream을 구한다.                           |
    | void transferTo(File dest)           | 업로드한 파일 데이터를 지정한 파일에 저장       |


[오류처리]

**@ExceptionHandler**

- 스프링 MVC에서 에러나 예외를 처리하기 위한 방법
- 스프링 컨트롤러에서 정의한 메서드(@RequestMapping)에서 기술한 예외가 발생되면 자동으로 받아낼 수 있다. 이를 이용하여 컨트롤러에서 발생하는 예외를 View단인 JSP등으로 보내서 처리가능

```java
@ExceptionHandler(TypeMismatchException.class)
public String handleTypeMismatchException(TypeMismatchException ex){
    return "member/invalidId";
}
```

**@ControllerAdvice**

- 스프링 3.2 이상에서 사용 가능, @Controller나 스프링 4.0 이상에서 지원하는 @RestController에서 발생하는 예외 등을 catch하는 기능
- 클래스 위에 @ControllerAdvice를 붙이고 어떤 예외를 잡아낼 것인지 내부 메서드를 선언하여 메서드 상단에 @ExceptionHandler(예외클래스.class)와 같이 기술
- 특정한 컨트롤러만 지정해서 캐치 가능

```java
@ControlerAdvice("edu.myspring")
public class CommonExceptionHandler{
    @ExceptionHandler(RuntimeException.class)
    private ModelAndView errorModelAndView(Exception ex){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/error_common");
        mav.addObject("exception", ex);
        return mav;
    }
}
```









