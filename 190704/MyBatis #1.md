# MyBatis #1

- 객체지향 어플리케이션에서 관계형 데이터베이스를 쉽게 사용할 수 있도록 도와주는 데이터 맵핑 프레임워크

- 장점

  - SQL 및 프로시져구문의 독립
    - 복잡한 JDBC 코드를 걷어내며 깔끔한 소스코드를 유지 가능
    - 수동적인 파라미터 설정과 쿼리 결과에 대한 맵핑 구문 제거 가능
    - 별도의 XML 문서에 맵핑된 프로시져와 SQL 구문을 연동하여 데이터베이스와 연동할 수 있도록 도와주어 데이터베이스 개발에 집중할 수 있도록 돕는다.
    - 소스코드의 유지보수에 용이
  - MyBatis의 특징
    - 간단한 퍼시스턴스 프레임워크
    - 62% 정도 줄어드는 코드, 간단한 설정
    - 구조적 강점(데이터 접근 속도를 높여주는 Join 매핑)
      - 여러가지 방식의 데이터를 가져오기 전략(가져오기 미루기, SQL 줄이기 기법)
    - 설계를 향상(유지보수성), 리소스를 관리하여 계층화를 지원(Connection, PreparedStetement, ResultSet)
    - 팀을 세분화하는 것을 도움
    - SQL문이 어플리케이션 소스 코드로부터 완전 분리
    - 어떤 프로그래밍 언어로도 구현 가능(java, c#, .NET, RUBY)
    - 무료 오픈 소스

- MtBatis 설치

  mybatis-x.x.x.jar 파일을 클래스 패스 or WEB_INF/lib에 위치

  [XML 파일에서 SqlSessionFactory 빌드]

  	- SqlSessionFactory 객체는 SqlSessionFactoryBuilder를 사용하여 XML 설정파일에서 빌드 가능
  	- 설정을 위해 클래스패스 자원을 사용하는 것을 추천하나 파일 경로나 file://URL로부터 만들어진 InputStream 객체를 사용할 수도 있다. 
  	- MyBatis는 클래스패스와 다른 위치에서 자원을 로드하는 것으로 좀더 쉽게 해주는 Resources라는 유틸성 클래스를 가지고 있다.

  ```java 
  String resource = "resource/mybatis-config.xml";
  InputStream inputStram = Resources.getResourceAsStream(resource);
  SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
  SqlSession session = sqlSessionFactory.openSession();//openSession(true): 자동 commit
  ```

  - 작동
    1. SqlSessionFactoryBuilder 는 데이터베이스 접속 정보 등이 기재된 MyBatis 설정 파일을 읽어서 SqlSessionFactory 객체를 생성
    2. SqlSessionFactory는 세션을 오픈하면서 SqlSession 객체를 생성
    3. 필요한 SQL문 수행을 요청할 때마다 SqlSession은 지시된 SQL을 매핑 파일에서 찾아서 수행시킨다.

  [MyBatis 설정파일]

  ```xml
  <<configuration>
    <environments default="development">
      <environment id="development">
        <transactionManager type="JDBC"/>
        <dataSource type="POOLED">        
          <property name="driver" value="oracle.jdbc.driver.OracleDriver"/>
          <property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"/>
          <property name="username" value="jdbctest"/>
          <property name="password" value="jdbctest"/>
        </dataSource>
      </environment>
    </environments>
    <mappers>
      <mapper resource="resource/XxxxxMapper.xml"/>    
    </mappers>
  </configuration>
  ```

  