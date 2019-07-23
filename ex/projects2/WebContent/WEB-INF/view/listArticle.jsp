<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%
	String id = request.getParameter("bul_id");
	int bul_id;
%>
<html>
<head>
<title>게시글 목록</title>
</head>
<body>
<table border=0>
<tr>
<td>
<table border="1" >
<c:forEach var="bulletin" items="${bulletins.bulletinList}">
	<tr>
	<td>
	<a href="list.do?bul_id=${bulletin.bul_id}">
		<c:out value="${bulletin.title}"/>
	</a>
	</td>
	</tr>
</c:forEach>
</table> 
</td>
<%   
	if(id != null){
		bul_id = Integer.parseInt(id);
%>
<td>
<table border="1" >
	<tr>
		<td colspan="5"><a href="write.do?bul_id=<%=bul_id%>">[게시글쓰기]</a></td>
	</tr>
	<tr>
		<td>게시번호</td>
		<td>작성자</td>
		<td>제목</td>
		<td>작성날짜</td>
		<td>조회수</td>
	</tr>
<c:if test="${articlePage.hasNoArticles()}">
	<tr>
		<td colspan="5">게시글이 없습니다.</td>
	</tr>
</c:if>
<c:forEach var="article" items="${articlePage.content}">
	<tr>
		<td>${article.articleId}</td>
		<td>${article.writerId}</td>
		<td>
		<a href="read.do?no=${article.articleId}&pageNo=${articlePage.currentPage}&bul_id=<%=bul_id%>">
		<c:out value="${article.title}"/>
		</a>
		</td>
		<td>${article.postingDate}</td>
		<td>${article.readCount}</td>
	</tr>
</c:forEach>
<c:if test="${articlePage.hasArticles()}">
	<tr>
		<td colspan="5">
			<c:if test="${articlePage.startPage > 5}">
			<a href="list.do?pageNo=${articlePage.startPage - 5}&bul_id=<%=bul_id%>">[이전]</a>
			</c:if>
			<c:forEach var="pNo" 
					   begin="${articlePage.startPage}" 
					   end="${articlePage.endPage}">
			<a href="list.do?pageNo=${pNo}&bul_id=<%=bul_id%>">[${pNo}]</a>
			</c:forEach>
			<c:if test="${articlePage.endPage < articlePage.totalPages}">
			<a href="list.do?pageNo=${articlePage.startPage + 5}&bul_id=<%=bul_id%>">[다음]</a>
			</c:if>
		</td>
	</tr>
</c:if>
</table>
</td>
<%
	}
%>
</tr>
</table>
<br/>
<a href="../index.jsp">[마이페이지]</a>
</body>
</html>