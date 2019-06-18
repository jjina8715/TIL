# Servlet #2

### file upload 

- &lt;form> 태그의 enctype 속성

  - 서버에 보내지는 데이터의 형식을 지정하는 기능. 세가지 종류 지원

  1. application/x-www-form-urlencoded

     - 기본값으로 서버로 전소오디기 던에 url encoding 방식으로 인코딩 된다는 뜻

     - 클라이언트에서 서버에게 요청을 보낼 때 name=value로 구성된 쿼리 문자열을 전달 가능(영문, 숫자, 일부 특수문자는 그대로 전달, 나머지는 인코딩)

     ​	--> name1=value1? name2=value2? name3=value3 .....

  2. multipart/form-data

     - 사용자가 입력하거나 선택된 파일의 내용을 여러 개의 파트로 나누어 전송되는 방식
     - 이 형시의 입력폼 데이터 전송은 POST방식만 지원

     - 서버에게 전달하는 데이터에 클라이언트에 존재하는 파일을 첨부해서 요청하려는 경우에는 다른 형식으로 전달 가능 

  3. text/plain

     - 인코딩을 하지 않은 문자 그대로의 상태를 전송

- @MultipartConfig 애노테이션

  - 클라이언트에서 전송되는 multipart/form-data 형식의 데이터를 처리하는 Servlet이 정의해야 하는 애노테이션
  - 이 애노테이션을 사용하지 않으면 HttpServletRequest 객체의 getInputStream() 메서드를 사용하여 입력 스트림 객체를 생성해서 클라이언트로부터 전송되는multipart/form-data 형식의 데이터를 직접 읽고 처리해야 하므로 어렵고 복잡해진다. 
  - 사용 : HttpServletRequest객체의 getPart() / getParts 메서드를 사용하여 여러 개의 파트로 구성되어 전달되는 데이터를 간단히 추출
  - 속성
    - location : 업로드된 파일을 저장하는 위치를 지정하는 속성. 기본값은 컨텍스트의 홈폴더
    - maxFileSize : 업로드된 파일에 허용되는 최대 크기(byte). 지정값보다 큰 경우 예외 발생. 기본값은 무제한
    - maxRequestSize : 멀티 파트로 구성된 form 데이터 요청에 허용되는 최대 크기(byte). 초과하면 예외 발생. 기본값은 무제한

- multipart 추출 API

  - getPart(name) 

    - 아규먼트로 주어진 이름으로 전달되는 파트에 대한 Part 객체 하나만을 추출하는 기능

  -  getParts()

    - 클라이언트에서 전송된 모든 파트에 대하여 각각 Part객체를 생성한 Collection 객체 반환

  - Part 객체의 주요 메서드

    | 메서드명               | 기능                                                         |
    | ---------------------- | ------------------------------------------------------------ |
    | getName()              | 파트의 이름 추출                                             |
    | getContentType()       | 업로드되는 파일로 구선된 파트에만 사용. 파일의 타입 정보 추출 |
    | getSize()              | 업로드되는 파일로 구선된 파트에만 사용. 파일의 사이즈 정보 추출 |
    | getSubmittedFileName() | 업로드되는 파일로 구선된 파트에만 사용. 전송되는 파일명을 추출 |
    | write(fileName)        | 업로드된 파일의 내용을 주어진 fileName명의 파일에 출력       |

    