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
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
@import	url('https://fonts.googleapis.com/css?family=Notable&display=swap');
#logo {
	font-family: Notable;
}
table{
	width:70%
}
</style>
</head>
<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark scrolling-navbar">
    <div class="container">

      <a class="navbar-brand" href="https://mdbootstrap.com/docs/jquery/" target="_blank" id="logo">
        <strong>festas</strong>
      </a>

      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://mdbootstrap.com/docs/jquery/" target="_blank">Notice</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://mdbootstrap.com/docs/jquery/getting-started/download/" target="_blank">Login</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://mdbootstrap.com/education/bootstrap/" target="_blank">new</a>
          </li>
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
	<table class="table table-stripaed" style="text-align: center; border: 1px solid #dddddd; height: 70%">
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
	</table>
	<table class="table" style="text-align: center; border: 1px solid #dddddd">
		<c:if test="${resultlist.hasVs()}">
			<tr>
				<td>
					<c:if test="${resultlist.startPage > 5}">
						<a href="list?pageNo=${resultlist.startPage - 5}&action=">[이전]</a>
					</c:if> <c:forEach var="pNo" begin="${resultlist.startPage}" end="${resultlist.endPage}">
						<a href="list?pageNo=${pNo}&action=">[${pNo}]</a>
					</c:forEach> <c:if test="${resultlist.endPage < resultlist.totalPages}">
						<a href="list?pageNo=${resultlist.startPage + 5}&action=paging">[다음]</a>
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