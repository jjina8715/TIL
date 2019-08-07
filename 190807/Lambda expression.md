# Lambda expression

[Java 8의 인터페이스 구문]

```java
interface Interfacename{
    //상수
    type 상수명 = 값;
    //추상 메소드
    type methodname(매개변수, ...);
    //default 메소드
    default type methodname(매개변수, ...) {...}
    //static 메소드
    static type methodname(매개변수) {...}
}
```

- default 메소드

  - 자바8에서 추가된 인터페이스의 새로운 멤버
  - 실행 블록을 가지고 있는 메서드
  - default 키워드
  - 기본적으로 public접근 제한을 생략하더라도 컴파일 과정에 자동 추가
  - 인터페이스만으로는 사용불가
  - 모든 구현 객체가 가지고 있는 기본 메서드로 사용

- static 메소드

  - Interfacename.methodname(매개변수); 로 사용

- 익명 구현 객체 

  - 명시적인 구현 클래스 작성 생략, 바로 구현 객체를 얻는 방법

    - 이름 없는 구현 클래스 선언과 동시에 객체 생성

    ```java
    interfacename 변수 = new interfacename(){
        //interface에 선언된 추상 메소드의 실제 메소드 선언
    }
    ```

    - 인터페이스의 추상메소드들은 모두 재정의하는 실체 메서드가 있어야 한다
    - 추가적으로 필드와 메서드들은 선언 가능 
    - 익명 객체 안에서만 사용가능 
    - 인터페이스 변수로 접근 불가

[람다식]

- 자바8부터 함수적 프로그래밍을 위해 람다식 지원

  - 람다식을 언어 차원에서 제공
    - 람다 계산법에서 사용된 식을 프로그래밍 언어에 접목
    - 익명 함수(anonymous function)을 생성하기 위한 식
  - 장점
    - 코드가 매우 간결해진다
    - 컬렉션 요소(대용량 데이터)를 필터링 또는 매핑해 쉽게 집계
  - 자바는 람다식을 함수적 인터페이스의 익명 구현 객체로 취급
    - 람다식 → 매개변수를 가진 코드 블록 → 익명 구현 객체
    - (매개변수) -> 코드; 의 형태

- 람다식이란

  - 메서드를 하나의 식으로 표현한 것

  - 클래스를 작성하고 객체를 생성하지 않아도 메서드를 사용가능

  - 메서드의 매개변수로 전달되거나 메서드의 결과값으로 반환 가능

  - 예제

    ```java
    //No arguments 
    () -> System.out.println("Hello")
    //One arguments
    s -> System.out.println(s)
    //Two arguments
    (x, y) -> x + y
    //With explicit argument types
    (Integer x, Integer y) -> x + y
    //Multiple statements
    (x, y) -> {
    	System.out.println(x);
    	System.out.println(y);
    	return (x + y);
    }
    ```

- 람다식 기본 문법

  - 매개 타입은 런타임시에 대입값에 따라 자동 인식 → 생략 가능
  - 하나의 매개변수만 있을 경우, () 생략 가능
  - 하나의 실행문만 있다면, {} 생략 가능
  - 매개변수가 없다면 () 생략 불가
  - 리턴값이 있는 경우 return 문 사용
  - {} 에 return 문만 있을 경우, {} 생략가능

- 타겟 타입(target type)

  - 람다식이 대입되는 인터페이스
  - 익명 구현 객체를 만들 때 사용할 인터페이스
  - *인터페이스* 변수  = 람다식;

- 함수적 인터페이스 (functional interface)

  - 하나의 추상 메서드만 선언된 인터페이스가 타겟 타입

  - @FunctionalInterface 어노테이션

    - 하나의 추상 메서드만을 가지는지 컴파일러가 체크
    - 두개 이상이면 컴파일 오류 발생

  - 매개변수와 리턴값이 없는 람다식

    - method()가 매개변수를 가지지 않는 경우

      ```java
      @FunctionalInterface
      public interface MyFunctionalInterface{
          public void method();
      }
      MyFunctionalInterface fi = ()->{...};
      fi.method();
      ```

  - 매개변수가 있는 람다식

    ```java
    @FunctionalInterface
    public  interface MyFunctionalInterface{
        public void method(int x);
    }
    MyFunctionalInterface fi = (x) -> {...} or x -> {...}
    fi.method(5);
    ```

  - 리턴값이 있는 람다식

    ```java
    @FunctionalInterface
    public  interface MyFunctionalInterface{
        public int method(int x, int y);
    }
    MyFunctionalInterface fi = (x, y) -> {...; return 값;}
    int result = fi.method(2, 5);
    ```

- 클래스 멤버, 로컬 멤버

  - 클래스의 멤버 사용
    - 람다식 실행 블록에는 클래스의 멤버인 필드와 메서드 제약 없이 사용
    - 람다식 실행 블록 내에서 this는 람다식을 실행한 객체 참조
  - 로컬 변수의 사용
    - 람다식은 함수적 인터페이스의 익명 구현 객체 생성
    - 람다식에서 사용하는 외부 로컬 변수는 final 특성