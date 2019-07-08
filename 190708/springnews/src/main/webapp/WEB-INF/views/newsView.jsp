<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스게시판</title>
<style>
h1, h2 {
	color: hotpink;
}

* {
	text-align: center;
}

body {
	background-repeat: no-repeat;
	background-image: linear-gradient(to bottom, #f2cbf2, white);
}

table {
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
}

textarea {
	width: 300px;
	height: 200px;
	border: 1px solid mediumblue;
}

#writer, #title {
	width: 200px;
	margin: 5px;
	border: 1px solid mediumblue;
}

#key {
	margin: 5px;
	border: 1px solid mediumblue;
}

td {
	border: 2px dotted gold;
}

tr:hover {
	font-weight: bold;
	background-color: wheat;
}

td:nth-child(2) {
	width: 200px;
}

tr:nth-child(1) {
	background-color: wheat;
	color: hotpink;
}

#b {
	background-color: wheat;
	font-weight: bold;
	border: 1px dotted gold;
	color: mediumblue;
}

button {
	margin: 3%;
}
</style>
</head>
<body>
	<h1>뉴스 게시판</h1>
	<c:if test='${!empty list }'>
		<table>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.id }</td>
					<td onclick="displayUpdateForm('${vo.id}')">${vo.title}</td>
					<td onclick="listWr('${vo.writer}')">${vo.writer}</td>
					<td>${vo.writedate}</td>
					<td>${vo.cnt }</td>
				<tr>
			</c:forEach>
		</table>
	</c:if>
	<c:if test='${!empty listMsg }'>
		<h2>${listMsg }</h2>
	</c:if>
	<c:if test='${!empty msg }'>
		<script>
			alert('${msg}');
		</script>
	</c:if>
	<form action="/springnews/news/search" method="GET">
		<select id='key' name="searchType">
			<option value="title">제목</option>
			<option value="writer">작성자</option>
			<option value="content">내용</option>
		</select> <input id='key' type="text" name="key"> <input id='b'
			type="submit" value="뉴스검색">
	</form>
	<button id='b' onclick="newshome();">뉴스홈</button>
	<button id='b' onclick="displayDiv(1)">뉴스 작성</button>
	<script>
		function displayDiv(type) {
			if (type == 1) {
				document.getElementById("write").style.display = "block";
				document.getElementById("update").style.display = "none";
			}else if(type==2){
				document.getElementById("update").style.display = "none";
			}else if(type==3){
				document.getElementById("write").style.display = "none";
			}
		}
		function displayUpdateForm(cv){
			location.href='/springnews/news/read?id='+cv;
		}
		function deleteNews(cv){
			location.href='/springnews/news/delete?id='+cv;
		}
		function listWr(cv){
			location.href='/springnews/news/listWr?key='+cv+'&searchType=writer';
		}
		function newshome(){
			location.href='/springnews/news';
		}
	</script>
	<c:if test='${!empty vo }'>
	<div id="update">
		<form method="post" action="/springnews/news/update">
			<input type="hidden" name="id" value="${vo.id }" >
			<input id="writer" type="text" name="writer" value='${vo.writer }' placeholder="작성자명을 입력해주세요." required><br>
			<input id="title" type="text" name="title" value='${vo.title }' placeholder="제목을 입력해주세요" required><br>
			<textarea id="context" name="content" placeholder="내용을 입력해주세요" required>${vo.content }</textarea><br>
			<input id='b' onclick="displayDiv(2)" type="reset" value="확인">
			<input id='b' type="submit" value="수정">
			<input id='b' onclick="deleteNews('${vo.id }')" type="reset" value="삭제">
		</form>
		</div>
	</c:if>
	<div id="write" style="display: none">
		<form method="post" action="/springnews/news/insert">
			<input id="writer" type="text" name="writer" placeholder="작성자명을 입력해주세요." required><br>
			<input id="title" type="text" name="title" placeholder="제목을 입력해주세요" required><br>
			<textarea id="context" name="content" placeholder="내용을 입력해주세요" required></textarea><br>
			<input id='b' type="submit" value="저장">
			<input id='b' type="reset" value="재작성">
			<input id='b' onclick="displayDiv(3)" type="reset" value="취소">
		</form>
	</div>
</body>
</html>