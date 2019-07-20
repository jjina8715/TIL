<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>festa-관리자 페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" 
	integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" 
	crossorigin="anonymous">
 <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" 
	integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" 
	crossorigin="anonymous"></script>
<style>
.wrapper {
	text-align: center;
	box-align: center;
	display: grid;
}
.menu {
	grid-column: 1;
}

.content {
	grid-column: 1;
}
textarea{
	width:300px;
	height:150px;
}
input{
	margin:10px;
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
      <div class="container">
	      <a class="navbar-brand" href="index.html">FESTAs</a>      
      	<div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="" class="nav-link">Main</a></li>
	          <li class="nav-item"><a href="/festival/notice?pageNo=1" class="nav-link">Notice</a></li>
	          <li class="nav-item"><a href="" class="nav-link">Login</a></li>
	          <li class="nav-item"><a href="" class="nav-link">Logout</a></li>
	          <li class="nav-item active"><a href="adminpage" class="nav-link">MyPage</a></li>
	        </ul>
	   	</div>
	 </div>  
</nav>
	<div class="wrapper">
		<div class="menu">
			<table>
				<tr onclick="location.href='/festival/adminpage/notice?action=list'">
					<td>공지사항 관리</td>
				</tr>
				<tr onclick="location.href='/festival/adminpage/report'">
					<td>리뷰 신고함</td>
				</tr>
			</table>
		</div>
		<div class="content">
			<c:choose>
				<c:when test="${!empty reportlist }">
				<form action="report/del">
					<input type="submit" name="action" value="선택된 신고 삭제">
					<input type="submit" name="action" value="선택된 리뷰 삭제">
					<table class="table table-stripaed" style="text-align: center; border: 1px solid #dddddd; height: 70%">
						<tr>
							<td><input type="checkbox" name="check_all"></td>
							<td>신고사유</td>
							<td>신고된 리뷰</td>
						</tr>
						<c:forEach var="vo" items="${reportlist}">
							<tr>
								<td><input type="checkbox" name="check" value="${vo.report_id} ${vo.review_id}">
								</td>
								<td>신고자 : ${vo.report_mid}<br> 사유 : <br>
									${vo.reason}
								</td>
								<td>아이디: ${vo.review_mid}<br> 축제이름: ${vo.name}<br>
									작성 날짜: ${vo.writedate}<br> 내용: ${vo.rcontent}<br>
								</td>
							</tr>
						</c:forEach>
					</table>
					</form>
				</c:when>
				
				
				<c:when test="${!empty noticelist }">
				    <button id='b' onclick="displayDiv(1)">공지사항 작성</button>
				    <form action="/festival/adminpage/notice" method="get">
				    	
						<select name="searchType">
							<option value="title">제목</option>
							<option value="ncontent">내용</option>
							<option value="writer">작성자</option>
						</select> <input name="key" id='key' type="text"> 
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
						<c:forEach var="vo" items="${noticelist }">
							<tr>
								<td>${vo.nid }</td>
								<td onclick="location.href='/festival/adminpage/ncontent?nid=${vo.nid}'">${vo.title }</td>
								<td>${vo.writer }</td>
								<td>${vo.uploaddate }</td>
								<td>${vo.cnt }</td>
							</tr>
						</c:forEach>
					</table>
				</c:when>

				<c:when test='${!empty content }'>
				<form action="/festival/adminpage/managenotice" method="post">
				<input type="hidden" name="nid" value='${content.nid }'>
					<table class="table table-stripaed" style="text-align: center; border: 1px solid #dddddd; height: 70%">
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" value='${content.title }'></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>${content.writer}</td>
							<td>번호</td>
							<td>${content.nid }</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td>${content.uploaddate}</td>
							<td>조회수</td>
							<td>${content.cnt }</td>
						</tr>
					</table>
					<hr>
					<div>
					<textarea name="ncontent">${content.ncontent }</textarea></div>
					<hr>
					<input type="submit" name="action" value="수정">
					<input type="submit" name="action" value="삭제">
					</form>
					<form action="/festival/adminpage/notice">
					<input type="hidden" name="action" value="list">
						<input type="submit" value="목록보기">
					</form>
				</c:when>

				<c:when test='${!empty listmsg }'>
					<h3>${listmsg }</h3>
				</c:when>
			</c:choose>
		</div>
	</div>
		<div class="content">
	<form id="write" action="/festival/adminpage/managenotice" method="post" style="display:none">
		<h4>공지사항 작성</h4>
		제목 <input type="text" name="title" ><br>
		작성자 <input type="text" name="writer" value="관리자"><br>
		내용 <br>
		<textarea name="ncontent"></textarea><br>
		<input type="submit" name="action" value="작성">
		<input type="button" value="취소" onclick="displayDiv(2);">
	</form>
	</div>
	<script>
	$('input[name=check_all]').on('change', function(){
		  $('input[name=check]').prop('checked', this.checked);
		});
	function displayDiv(type) {
			if (type == 1) {
				document.getElementById("write").style.display = "block";
			}else if(type==2)
				document.getElementById("write").style.display = "none";				
		}
	</script>

</body>
</html>