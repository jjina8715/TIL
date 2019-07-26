# LOG4J

- 프로그램을 작성하는 도중에 로그를 남기기 위해 사용되는 자바 기반 로깅 유틸리티
- 높은 등급에서 낮은 등급으로의 6개의 로그레벨을 가지고 있다
- 설정 파일에 대상 별(자바에서는 패키지)로 레벨 지정이 가능, 그 등급 이상의 로그만 저장하는 방식
- ver.2는 기존 properties 파일형식의 환경 설정을 지원하지 않으며, XML혹은 json 파일 형식의 환경 설정만 가능

[XML 파일 위치]

- log4j2.xml 을 작성, WEB-INF/classes 하위에 포함될 수 있도록 위치 ver.2가 초기화될 때자동으로 위 설정 파일을 읽어들인다.

[XML 파일 정의]

- ver.2에서 xml 파일의 최상위 요소는 &lt;Configuration>
- 그 아래 Logger, Appender, Layout 설정 등과 관련한 하위 요소 정의

[Logger 설정]

- Logger는 로깅 작업을 수행하는 log4j 주체로, 모든 로깅 기능은 이 Logger를 통해 처리
- 어플리케이션 내에서 사용해할 logger을 정의해야 하며, Log Level과 Appender 설정에 따라 출력 대상과 수준이 결정

[Logger 선언과 정의]

- Root Logger를 포함한 모든 Logger는 상위 요소인 &lt;Loggers> 아래에 선언

- Root Logger는 &lt;Root> 요소로, Logger는 &lt;Logger>요소로 정의

- Logger하나 이상 정의 가능, Root 요소는 반드시 정의

- 로그 레벨

  - ver.2는 FATAL>ERROR>WARN>INFO>DEBUG>TRACE 6개의 Log Level을 제공
  - 각각 fatal(), error(), warn(), info(), debug(), trace()라는 로깅 메서드를 이용해 로그 출력 가능

  | 로그 레벨 | 설명                                                         |
  | --------- | ------------------------------------------------------------ |
  | FATAL     | 아주 심각한 에러가 발생한 상태. 시스템 적으로 심각한 문제가 발생해서 어플리케이션 작동이 불가능한 경우가 해당. |
  | ERROR     | 요청을 처리하는 중 문제가 발생한 상태                        |
  | WARN      | 처리 가능한 문제이지만, 향후 시스템 에러의 원인이 될 수 있는 경고성 메시지 |
  | INFO      | 로그인, 상태 변경과 같은 정보성 메시지                       |
  | DEBUG     | 개발시 디버그 용도로 사용한 메시지                           |
  | TRACE     | 디버그 레벨이 너무 광범위한 것을 해결하기 위해서 좀더 상세한 상태를 나타냄 |

[JAVA에서의 로거 사용]

- Logger log = LogManager.getLogger("로거명");
- log.fatal(""), log.error(""), log.warn(""), log.info(""), log.debug(""), log.trace("")

[Appender 설정]

- 로그가 출력되는 위치, XXXAppender로 끝나는 클래스들의 이름을 보면, 출력 위치를 짐작 가능. 
- ver.2는 Console, File, RollingFile, Socket, DB 등 다양한 로그 출력 위치와 방법을 지원
- ver.1에서 Appender 종류를 class 속성값으로 구분한 것과 달리, ver.2에서는 태그로 구분

[Appender 선언과 정의]

| Appenders           | 태그명           | 출력 위치               |
| ------------------- | ---------------- | ----------------------- |
| ConsoleAppender     | &lt;Console>     | 콘솔에 출력             |
| FileAppender        | &lt;File>        | 파일에 출력             |
| RollingFileAppender | &lt;RollingFile> | 조건에 따라 파일에 출력 |
| JDBCAppender        | &lt;JDBC>        | RDB Table에 출력        |

- 모든 Appender 요소는 상위요소인 &lt;Appenders> 아래에 선언
- 각 Appender요소는 name 속성값을 가지며, name 속성에 Appender 이름을 지정한다. name속성값은 Logger가 로그 출력에 사용할 Appender를 참조하기 위해 사용
- Appender 요소의 하위 요소로 로그 출력 패턴인 Layout을 정의 

```xml
<Appenders>
	<Console name="console" target="SYSTEM_OUT">
    	<PatternLayout/>
        <!--디폴트 패턴 적용, %d{HH:mm:ss, SSS}[%thread] %-5level %logger{36} - %msg%n-->
    </Console>
</Appenders>
<Loggers>
	<Logger name="testlog" lavel="DEBUG">
    	<AppenderRef ref="console"/>
    </Logger>
	<Root level="ERROR">
  	  <AppenderRef ref="console"/>
	</Root>
</Loggers>
```

[Appender 종류]

- ConsoleAppender

  ```xml
  <!-- 속성 : name(Appender 명), target(출력 방향 지정, "SYSTEM_OUT" OR "SYSTEM_ERR"(defalut), follow, ignoreExceptions) -->
  <!-- 자식요소 : Layout(출력패턴 설정), Filters -->
  <Console name="console" target="SYSTEM_OUT">
  	<PatternLayout pattern="%d %5p [%c] %m%n"/>
  </Console>
  ```

- FileAppender

```xml
<!-- 속성 : name(Appender 명), fileName(target 파일명), append(이어쓰기 여부, true(default)/false) -->
<!-- 자식요소 : Layout(출력패턴 설정), Filters -->
<Console name="file" fileName="c:/logs/file/sample.log" append="false">
	<PatternLayout pattern="%d %5p [%c] %m%n"/>
</Console>
```

-  Layout 설정
  - 발생한 로그 이벤트의 포맷을 지정하는 것, 원하는 형식으로 로그 출력을 지원
  - Appenders 설정과 마찬가지로 ver.2에서는 Layout을 class 속성이 아닌 태그로 구분
  - 주로 PatternLayout을 사용

[PatternLayout 선언과 정의]

- Appender 요소의 하위 요소

- 디폴트 패턴: %d{HH:mm:ss, SSS}[%thread] %-5level %logger{36} - %msg%n-

- PatternLayout의 pattern

  - %로 시작하고 % 뒤에는 format modifiers와 conversion character로 정의

  | 패턴           | 설명                                                         |
  | -------------- | ------------------------------------------------------------ |
  | c, logger      | 로깅 이벤트를 발생시키기 위해 선택한 로거의 이름을 출력      |
  | C, class       | 로깅 이벤트가 발생한 클래스의 풀네임명을 출력                |
  | M, method      | 로깅 이벤트가 발생한 메서드명을 출력                         |
  | F, file        | 로깅 이벤트가 발생한 클래스의 파일명을 출력                  |
  | l, location    | 로깅 이벤트가 발생한 클래스의 풀네임명.메서드명(파일명:라인번호)를 출력 |
  | d, date        | 로깅 이벤트의 일자와 시간을 출력, \\\SimpleDateFormat 클래스에 정의된 패턴으로 출력 포맷 지정 가능 |
  | L, line        | 로깅 이벤트가 발생한 라인 번호를 출력                        |
  | m.msg, message | 로그문에서 전달된 메시지를 출력                              |
  | n              | 줄바꿈                                                       |
| p, level       | 로깅 이벤트의 레벨을 출력                                    |
  | r, relative    | 로그 처리시간(milliseconds)                                  |
  | t, thread      | 로깅 이벤트가 발생한 스레드명을 출력                         |
  | %%             | %을 출력하기 위해 사용하는 패턴                              |
  
  - ex
    - "%t %-5p %c{2} - %m%n"
    - "%d{yyyyMMddHHmm} %m%n"
    - "%d %-5p [%t] %C{2} (%F:%L) -%m%n"

