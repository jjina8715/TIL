<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
	int bul_id = Integer.parseInt(request.getParameter("bul_id"));
%>
<html>
<head>
<title>게시글 쓰기</title>
</head>
<body>
<form action="write.do" method="post">
<input type="hidden" name="bul_id" value=<%=bul_id %>>
<p>
	제목:<br/><input type="text" name="title" value="${param.title}">
	<c:if test="${errors.title}">제목을 입력하세요.</c:if>
</p>
<p>
	내용:<br/>
	<textarea name="content" rows="5" cols="30">${param.title}</textarea>
</p>
<input type="submit" value="새 글 등록">
</form>
</body>
</html>