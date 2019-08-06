<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인 가구 정보</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" 
	integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" 
	crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>
*{
	text-align:center;
}
button{
	margin : 5px;
	width : 40%
}
html, body, header{
	height: 100%;
}
#tableheader{
	border: 1px solid #dddddd; 
	background-color:lightgray;
}
#tablebody{ 
	border: 1px solid #dddddd; 
	height: 70%;
}
.my-custom-scrollbar {
position: relative;
overflow: auto;
height:70%;
}
#btn{
	box-align:center;
	text-align:center;
}
</style>
</head>
<body>
<h1>1인 가구 정보</h1>
<hr>
<div id="btn">
<button class="btn btn-secondary" onclick="location.href='/springedu/one/order'">1인 가구가 많은 순으로 전체 출력</button>
<button class="btn btn-secondary" onclick="location.href='/springedu/one/group'">구별 1인 가구 명수 출력</button><br>
<button class="btn btn-secondary" onclick="location.href='/springedu/one/most1'">1인 가구수가 제일 많은 동의 구 이름과 동 이름 출력</button>
<button class="btn btn-secondary" onclick="location.href='/springedu/one/most2'">1인 가구수가 제일 많은 구 이름 출력</button>
<form action="/springedu/one/search" method="post">
점검하려는 구 이름 입력 : <input type="text" name="key" >
<input type="submit" value="검색" class="btn btn-secondary">
</form>
</div>
<hr>
<c:if test='${!empty msg }'>
	<h1>${msg }</h1>
</c:if>
<c:if test='${!empty list }'>
<c:choose>
	<c:when test="${action eq 'order'}">
		<table class="table table-stripaed">
			<tr><td width=30%>구</td><td width=30%>동</td><td>1인 가구수</td></tr>
		</table>
		<div class="table-wrapper-scroll-y my-custom-scrollbar">
		<table class="table table-stripaed" id="tablebody">
			<c:forEach var="vo" items="${list}">
				<tr>
					<td width=30%>${vo.addr1 }</td>
					<td width=30%>${vo.addr2 }</td>
					<td width=40%>${vo.households }</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</c:when>
	<c:when test="${action eq 'group'}">
		<table class="table table-stripaed" id="tableheader">
			<tr><td width=50%>구</td><td width=50%>1인 가구수</td></tr>
		</table>
	<div class="table-wrapper-scroll-y my-custom-scrollbar">
		<table class="table table-stripaed" id="tablebody">
			<c:forEach var="vo" items="${list}">
				<tr>
					<td width=50%>${vo.addr1 }</td>
					<td>${vo.households }</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</c:when>
	<c:when test="${action eq 'most'}">
		<table class="table table-stripaed" id="tableheader">
			<tr><td width=50%>구</td><td>동</td></tr>
		</table>
	<div class="table-wrapper-scroll-y my-custom-scrollbar">
		<table class="table table-stripaed" id="tablebody">
			<c:forEach var="vo" items="${list}">
				<tr>
					<td width=50%>${vo.addr1 }</td>
					<td>${vo.addr2 }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</c:when>
	<c:when test="${action eq 'most2'}">
		<table class="table table-stripaed" id="tableheader">
			<tr><td>구</td></tr>
		</table>
	<div class="table-wrapper-scroll-y my-custom-scrollbar">
		<table class="table table-stripaed" id="tablebody">
			<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.addr1}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</c:when>
	<c:otherwise>
		<table class="table table-stripaed" id="tableheader">
			<tr><td width=50%>동</td><td>1인 가구수</td></tr>
		</table>
	<div class="table-wrapper-scroll-y my-custom-scrollbar">
		<table class="table table-stripaed" id="tablebody">
			<c:forEach var="vo" items="${list}">
				<tr>
					<td width=50%>${vo.addr2 }</td>
					<td>${vo.households }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</c:otherwise>		
</c:choose>
</c:if>
</body>
</html>