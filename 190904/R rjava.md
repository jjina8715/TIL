# R rjava

### R과 oracle의 연동

1. 드라이버프로그램 로딩(JDBC() 함수)
2. DBMS 서버 접속(dbConnect() 함수)
3. 수행하려는 데이터 처리 기능에 따라서 삽입, 삭제, 수정, 추출관련 SQL 문을 전달하거나 관련 함수를 수행시켜서 데이터베이스 사용

- `install.packages()` : DBI, RJDBC

- DB 서버 접속

  - `drv<-JDBC("oracle.jdbc.driver.OracleDriver", "jdbc드라이버압축파일 path")`
  - `conn<-dbConnect(drv, "jdbc:oracle:thin:@localhost:1521:xe", "계정","암호")`

- DB 접속 해제

  - `dbDisconnect(conn)`

- 데이블 리스트 추출

  - `dbListTables(conn)` 

- 테이블에 저장된 데이터 읽기

  1. `result1<-dbReadTable(conn, "TABLE")` = select * from table

  2. `result2<-dbGetquery(conn, "selectquery")`

  3. `rs<-dbSendQuery(conn, "selectquery")`

     `ret1<-dbFetch(rs, 1)`

     `ret2<-dbFetch(rs, 2)`

- 테이블에 데이터 저장

  - `dbWriteTable(conn, "table", data.frame(col1=c(), col2=c(), col3=(), ...))` : 없으면 만든다.
  - `dbSendUpdate(conn, "insertquery")`

- 데이터 수정

  - `dbSendUpdate(conn, "updatequery")`

- 테이블 삭제

  - `dbRemoveTable("TABLE")`

### Java와 R 연동

- RServe

  - R 바이너리 서버라고 불리우는 프로그램

  - Java나 다른 언어에서 R코드를 연동할 때 필요한 기능을 서포트하는 서버

  - Java, C, C++, PHP와 같은 다른 프로그램에서 TCP/IP로 R에 원격 접속, 인증, 파일 전송을 가능하게 해준다.

  - Rstudio : `install.packages("Rserve")`

  - pom.xml에 추가

    ```xml
    <dependency>
    			<groupId>com.github.lucarosellini.rJava</groupId>
    			<artifactId>JRIEngine</artifactId>
    			<version>0.9-7</version>
    		</dependency>    
    		<dependency>
    			<groupId>net.rforge</groupId>
    			<artifactId>Rserve</artifactId>
    			<version>0.6-8.1</version>
    		</dependency>
    ```

  - 기동

    - RStudio : `Rserve(args="--RS-encoding utf8")`
    - cmd : 단독 기동 가능, 오류 메시지 확인 가능
      - cd C:\Program Files\R\R-3.6.1\bin\x64
      - Rserve --RS-encoding utf8

- rJava 패키지

  - Java 언어로 R 기술을 연동할 때 필요한 기본 API를 담고 있는 패키지

- RConnection

  - R에 접속하여 핵심적인 역할을 수행하는 클래스
  - R에 접속, 인증, 세션 종료, 파일 생성, 파일 읽기, 자료 전송, 자료 조회 등을 처리
  - eval() 
    - R에 직접적인 명령을 내리고 REXP 타입으로 데이터를 반환 받는다.
  - assign()
    - R의 변수에 REXP / String 형태로 데이터를 지정하여 설정

- REXP

  - R과 Java에서 서로의 자료구조와 데이터 타입을 서로 사용할 수 있도록 지원하는 데이터 모델 형의 클래스

  - 데이터 프레임과 행렬 구조로 데이터 모델을 생성 가능

  - | 함수             |                               |
    | ---------------- | ----------------------------- |
    | asBytes()        | Byte 일차원 배열형으로 반환   |
    | asDouble()       | double 형으로 반환            |
    | asDoubleMatrix() | double 이차원 배열형으로 반환 |
    | asDoubles()      | double 일차원 배열형으로 반환 |
    | asList()         | RList 형으로 반환             |
    | asString()       | String 형으로 반환            |
    | asStrings()      | String 일차원 배열형으로 반환 |
    | length()         | 데이터의 개수                 |

- RList

  - Map인터페이스를 구현
  - 내부적으로 Vector 값들을 지닌 리스트들이 관리
  - RList를 이용하여 데이터 프레인과 같은 자료구조를 사용 가능
  - at()
    - Index 또는 변수명에 해당하는 열 데이터들을 REXP 객체로 반환
  - size()
    - 리스트의 개수