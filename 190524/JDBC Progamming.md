# [JDBC 프로그래밍 정리]

ODBC --> C, C++

- ##### JDBC API(interface) + JDBC Driver

​		java.sql					DB 서버에 따로 추가로 준비

- ##### JDBC 프로그램의 구현 과정

  1. JDBC 드라이버 로딩(Class.forName(대표클래스 이름))

  2. DB서버 접속(DriverManager.getConnection(JDBCURL, DB_ID, DB_PASSWORD))

  3.  Statement, PreparedStatement 객체 생성(Factory method 사용)

  4. ResultSet executeQuery() (isBeforeFirst(), next(), get___(index)) 

     int executeUpdate() 적용된 행의개수를 반환

  5. 연결된 자원 해제 : close()



- **URL**: Uniform Resource Locator
  - 어떤 자원의 위치를 알리는 단일화된 형식의 문자열
  - HTTP URL: 웹 사이트의 주소 문자열
  - JDBC URL: 접속할 DB서버의 정보와 사용할 드라이버 정보를 ':' 기호로 구분하여 작성한 문자열

- ojdbc6.jar - 오라클 전용 드라이버, thin driver

######  