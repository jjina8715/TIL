# My Batis #2

**[프로세스]**

응용 프로그램 시작 시 수행되는 프로세스

1. 응용 프로그램이 SqlSessionFactoryBuilder에게 SqlSessionFactory를 빌드하도록 요청
2. SqlSessionFactoryBuilder는 SqlSessionFactory를 생성하기 위해 MyBatis 설정 파일을 읽는다
3. SqlSessionFactoryBuilder는 MyBatis 설정 파일의 정의에 따라 SqlSessionFactory 객체를 생성

클라이언트의 각 요청에 대해 수행되는 프로세스

4. 클라이언트가 응용 프로그램에 대한 프로세스를 요청
5. 응용 프로그램은 SqlSessionFactory 객체에서 SqlSession 객체를 가져온다.
6. SqlSessionFactory는 SqlSession을 생성하고 이를 애플리케이션에 반환
7. 응용 프로그램이 SqlSession에서 매퍼 인터페이스의 구현 개체를 가져온다.
8. 응용 프로그램이 매퍼 인터페이스 메서드를 호출
9. 매퍼 인터페이스의구현 개체가 SqlSession 메서드를 호출하고 SQL 실행을 요청
10. SqlSession은 매핑 파일에서 실행할 SQL을 가져와 SQL을 실행

**[주요구성요소]**

| 구성요소 / 구성파일                                | 설명                                                         |
| -------------------------------------------------- | ------------------------------------------------------------ |
| MyBatis configuration file                         | MyBatis3의 작업 설정을 설명하는 XML 파일. DB의 연결 대상, 매핑 파일의 경로(Spring과 통합 사용시 생략 가능)와 MyBatis3dml 작업 설정 등과 같은 세부 사항을 작성하는 파일 |
| org.apache.ibatis.session.SqlSessionFactoryBuilder | MyBatis3 구성 파일을 읽고 SqlSessionFactory 객체를 생성      |
| org.apache.ibatis.session.SqlSessionFactory        | 매퍼 파일 정보를 전달하면서 SqlSession 객체를 생성           |
| org.apache.ibatis.session.SqlSession               | SQL 실행 및 트랜잭션 제어를 위한 API를 제공                  |
| Mapper interface                                   | MyBatis3는 매퍼 인터페이스에 대한 구현 클래스를 자동으로 생성 |
| Mapping file                                       | SQL 및 O/R 매핑 설정을 설명하는 XML 파일                     |

**[구조]**

MyBatis의 논리적인 구조

- Presentation Layer :arrow_right: Bussiness Logic (Service) Layer :arrow_right: Data Access Layer :arrow_right: DB

Spring의 구조

- (Model: JSP, HTML, CSS, Java Script) :arrow_right: Model - Controller :arrow_right: Service :arrow_right: DAO :arrow_right: MyBatis :arrow_right: DB

**[설정 파일]** 

```xml
<beans:bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
	<beans:property name="driverClassName" value="oracle.jdbc.OracleDriver"/>
    <beans:property name="url" value="jdbc.oracle.thin.@localhost:1521:XE" />
    <beans:property name="username" value="jdbctest" />
    <beans:property name="password" value="jdbctest" />
</beans:bean>
<beans:bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
	<beans:property name="dataSource" ref="dataSource" />
    <beans:property name="donfigLocation" value="classpath:/mybatis-config.xml" />
    <beans:property name="mapperLocations" value="classpath:/*Mapper.xml" />
</beans:bean>
<beans:bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplae" destory-method="clearCache">
	<beans:constructor-arg index="0" ref="sqlSessionFactory"></beans:constructor-arg>
</beans:bean>
```





