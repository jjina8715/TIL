<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int bul_id = Integer.parseInt(request.getParameter("bul_id"));
%>
<html>
<head><title>게시물 삭제</title>
</head>
<body>
게시물을 삭제하려면 암호를 입력해주세요.
<form action="delete.do" method="post">
<input type="hidden" name="no" value="<%=no%>">
<input type="hidden" name="bul_id" value="<%=bul_id%>">
<p>
	암호:<br/><input type="password" name="password">
	<c:if test="${errors.password}">암호를 입력하세요.</c:if>
	<c:if test="${errors.badPwd}">암호가 일치하지 않습니다.</c:if>
</p>
<input type="submit" value="게시물 삭제">
</form>
</body>
</html>