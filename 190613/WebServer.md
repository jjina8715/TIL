# WebServer

- Servlet, JSP, MVC 패턴, MyBais, Spring IoC, Spring MVC

- 웹서버 프로그래밍 표준 기술 

  - CGI(C, VisualBasic, Perl, .....) -> ASP, PHP

  - 단점 : 멀티 프레스 -> FastCGI -> Servlet: 멀티스레드(1998년 9월)

  - CGI, FastCGI                     Servlet -> JSP

    ​			 					Servlet엔진(컨테이너)

    Web Server					Web Server

  - Tomcat :  WebServer + Server Container -> WAS

- Servlet의 멤버 변수: 다른 클라이언트에서 공유