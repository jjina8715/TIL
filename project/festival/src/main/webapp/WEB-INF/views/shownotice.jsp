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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" 
	integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" 
	crossorigin="anonymous">
<style type="text/css">

</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
      <div class="container">
	      <a class="navbar-brand" href="index.html">FESTAs</a>      
      	<div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item "><a href="" class="nav-link">Main</a></li>
	          <li class="nav-item active"><a href="notice" class="nav-link">Notice</a></li>
	          <li class="nav-item"><a href="" class="nav-link">Login</a></li>
	          <li class="nav-item"><a href="" class="nav-link">Logout</a></li>
	          <li class="nav-item"><a href="adminpage" class="nav-link">MyPage</a></li>
	        </ul>
	   	</div>
	 </div>  
</nav>
<c:choose>
<c:when test='${!empty resultlist }'>
<form action="notice" method="get">
	<input type="hidden" name="pageNo" value="1">
	<select id="searchType" name="searchType">
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
				<td onclick="location.href='/festival/notice/ncontent?nid=${vo.nid}'">${vo.title }</td>
				<td>${vo.writer }</td>
				<td>${vo.uploaddate }</td>
				<td>${vo.cnt }</td>
			</tr>
		</c:forEach>
		<c:if test="${resultlist.hasVs()}">
			<tr>
				<td>
					<c:if test="${resultlist.startPage > 5}">
						<a href="notice?pageNo=${resultlist.startPage - 5}&action=paging">[이전]</a>
					</c:if> 
					<c:forEach var="pNo" begin="${resultlist.startPage}" end="${resultlist.endPage}">
						<a href="notice?pageNo=${pNo}&action=paging">[${pNo}]</a>
					</c:forEach> 
					<c:if test="${resultlist.endPage < resultlist.totalPages}">
						<a href="notice?pageNo=${resultlist.startPage + 5}&action=paging">[다음]</a>
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
</script>
</body>
</html>