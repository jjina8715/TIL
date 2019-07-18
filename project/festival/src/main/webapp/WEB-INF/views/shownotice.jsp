<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>festa-공지사항</title>
</head>
<body>
<c:choose>
<c:when test='${!empty resultlist }'>
<form action="notice" method="get">
	<input type="hidden" name="pageNo" value="1">
	<select name="searchType">
		<option value="title">제목</option>
		<option value="ncontent">내용</option>
		<option value="writer">작성자</option>
	</select>
	<input name="key" id='key' type="text">
	<input type="submit" value="검색">
</form>
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<c:forEach var="vo" items="${resultlist.list }">
			<tr>
				<td>${vo.nid }</td>
				<td onclick="movecontent('${vo.nid}')">${vo.title }</td>
				<td>${vo.writer }</td>
				<td>${vo.uploaddate }</td>
				<td>${vo.cnt }</td>
			</tr>
		</c:forEach>
		<c:if test="${resultlist.hasVs()}">
			<tr>
				<td>
					<c:if test="${resultlist.startPage > 5}">
						<a href="notice?pageNo=${resultlist.startPage - 5}">[이전]</a>
					</c:if> 
					<c:forEach var="pNo" begin="${resultlist.startPage}" end="${resultlist.endPage}">
						<a href="notice?pageNo=${pNo}">[${pNo}]</a>
					</c:forEach> 
					<c:if test="${resultlist.endPage < resultlist.totalPages}">
						<a href="notice?pageNo=${resultlist.startPage + 5}">[다음]</a>
					</c:if>
				</td>
			</tr>
		</c:if>
	</table>
</c:when>
<c:when test='${!empty listmsg }'>
		<h3>${listmsg }</h3>
</c:when>


<c:when test='${!empty content }'>
	<table>
		<tr><td>제목</td><td>${content.title }</td></tr>
		<tr><td>작성자</td><td>${content.writer}</td><td>번호</td><td>${content.nid }</td></tr>
		<tr><td>작성일</td><td>${content.uploaddate}</td><td>조회수</td><td>${content.cnt }</td></tr>
	</table>
	<hr>
	<div>
		${content.ncontent }
	</div>
	<hr>
	<form action="/festival/notice">
		<input type="submit" value="목록보기">
	</form>
</c:when>
</c:choose>
<script>
function movecontent(nid){
	location.href="/festival/notice/rcontent?nid="+nid;
}
</script>

</body>
</html>