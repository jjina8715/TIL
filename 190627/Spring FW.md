# Spring FW

- 자바 플랫폼을 위한 오픈 소스 애플리케이션 프레임 워크. 코딩량을 줄여주고 유지보수성이 좋은 프로그램을 개발
- 웹 서버 프로그래밍 - Spring FW / Spring IoC(Spring DI)
- 환경 : Eclipse EE = Eclipse for Java Developer + WTP + STS(Spring Tool Suit, 추가설치)

1. Spring IoC

   - 프로그램에서 필요한 객체 생성을 SpringFW에서 하고 객체를 필요로 하는 곳에 주입하는 것과 객체를 찾을 때 제공하는 것 모두 Spring FW이 대신 처리한다. Spring FW에 의해 관리되는 객체를 bean이라고 부르며, 이 일을 담당하는 Spring FW의 구성요소를 IoC 컨테이너라고 한다.

   - Spring DL(Dependency Lookup)

     ```java
     타입명 bean = (타입명)context.getBean("bean 이름");\
     ```

   - Spring DI(Dependency Injection) : 객체간의 결합도를 느슨하게 하는 스프링의 핵심기술

     - 의존(Dependeng) : 객체간의 의존

     - sptring DI 컨테이너 초기화

       ```java
        ApplicationContext context = new ClassPathXmlApplicationContext("bean 설정 파일");
       ```

     - 예
       1. Construction Injection : 생성자를 통해서 객체 바인딩(의존 관계를 연결)
       2. Setter Injection : setter 메서드를 이용해서 객체 바인딩(의존 관계를 연결)
     - 설정
       - XML 설정
         - 설정 정보를 변경할 때는 XML만 변경하면 된다.
         - 많은 프레임워크, 라이브러리가 XMl 스키마를 이용한 설정의 편리함 지원한다.
         - 코드를 실행해야 설정 정보의 오류를 확인 가능
       - ANNOTATION 설정
         - 소스안에 정해진 ANNOTATION들을 사용

   - XML 설정

     - &lt;bean> : spring DI 컨테이너가 관리할 Bean 객체를 설정

       - id : 주입 받을 곳에서 호출할 이름 설정
       - class : 주입할 객체의 클래스
       - factory-method : Singleion패턴으로 작성된 객체의 factory 메소드 호출 시

     - Constructor를 이용한 객체간의 관계 또는 값 주입

       - 객체나 값을 생성자를 통해 주입 받는다. 한번에 여러 개 설정 가능
       - &lt;constructor-arg> : &lt;bean>의 하위 태그로서 다른 bean 객체나 값을 생성자를 통해 주입하도록 설정

       <하위태그 이용>

       ```xml
       <ref bean="bean name"/> 객체를 주입시
       ```
   - &lt;value>값&lt;value> 문자(String), Primitive 주입 시
          	- type속성 : 값을 1차로 Sring으로 처리한다. 값의 타입을 명시해야 하는 경우

       &lt;속성 사용>
     
  - ref="bean이름"
       - value="값"

     - setter 메소드를 통한 객체 간의 관계나 값 입력
     
       - setter를 통해서는 하나의 값만 설정 가능
       - &lt;property> : &lt;bean>의 하위 태그로 다른 bean 객체나 값을 property를 통해 주입하도록 설정
       - name속성 : 객체나 값을 주입할 property 이름을 설정(setter의 이름)
         1. &lt;ref>, &lt;value>와 같은 하위 태그를 이용하여 설정
         2. 속성을 이용해 설정