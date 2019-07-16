<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 탈퇴</title>
</head>
<body>
탈퇴시 아이디 재사용 및 복구가 불가합니다.<br/>
본인이 쓴 게시물이 모두 삭제됩니다.<br/>
동의하시면 암호를 입력하세요.
<form action="withDraw.do" method="post">
<p>
	암호:<br/><input type="password" name="password">
	<c:if test="${errors.password}">암호를 입력하세요.</c:if>
	<c:if test="${errors.badPwd}">암호가 일치하지 않습니다.</c:if>
</p>
<input type="submit" value="회원 탈퇴">
</form>
</body>
</html>