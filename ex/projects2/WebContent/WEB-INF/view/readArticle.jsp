<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<%
	int bul_id = Integer.parseInt(request.getParameter("bul_id"));
%>
<html>
<head>
<title>게시글 읽기</title>
</head>
<body>
<table border="1" width="50%">
<tr>
	<td>번호</td>
	<td>${articleData.articleId}</td>
</tr>
<tr>
	<td>작성자</td>
	<td>${articleData.writerId}</td>
</tr>
<tr>
	<td>제목</td>
	<td><c:out value='${articleData.title}' /></td>
</tr>
<tr>
	<td>내용</td>
	<td><u:pre value='${articleData.content}'/></td>
</tr>
<tr>
	<td colspan="2">
		<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo}" />
		<a href="list.do?pageNo=${pageNo}&bul_id=<%=bul_id%>">[목록]</a>
		<c:if test="${authUser == articleData.writerId}">
		<a href="modify.do?no=${articleData.articleId}&bul_id=<%=bul_id%>">[게시글수정]</a>
		<a href="delete.do?no=${articleData.articleId}&bul_id=<%=bul_id%>">[게시글삭제]</a>
		</c:if>
	</td>
</tr>
</table>
</body>
</html>