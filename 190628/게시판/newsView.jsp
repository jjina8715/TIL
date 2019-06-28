<%@page import="java.util.List"%>
<%@page import="model.vo.NewsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1{
	color:hotpink;
}
*{
	text-align:center;
}
body{
	background-repeat: no-repeat;
	background-image:linear-gradient(to bottom, #f2cbf2, white);
}
table{
	margin-left: auto; 
	margin-right: auto;
	border-collapse:collapse;
}
textarea{
	width:300px;
	height:200px;
	border: 1px solid mediumblue;
}
#writer,#title{
	width:200px;
	margin:5px;
	border: 1px solid mediumblue;
}
td {
	border: 2px dotted gold;
}
tr:hover {
	font-weight: bold;
	background-color:wheat;
}
td:nth-child(2) {
	width: 200px;
}
tr:nth-child(1){
	background-color:wheat;
	color:hotpink;
}
#b{
	background-color: wheat;
    font-weight: bold;
    border: 1px dotted gold;
    color: mediumblue;
}
button{
	margin:3%;
}
</style>
</head>
<body>
	<%
		@SuppressWarnings("unchecked")
		List<NewsVO> list = (List<NewsVO>) request.getAttribute("list");
		NewsVO vo1 = (NewsVO)request.getAttribute("vo");
		String status = (String)request.getAttribute("status");
	%>
	<h1>뉴스 게시판</h1>
	<table>
		<tr><td>번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>조회수</td></tr>
		<%
			for (NewsVO vo : list) {
		%>
		<tr>
			<td ><%=vo.getId() %></td>
			<td onclick="displayUpdateForm('<%=vo.getId()%>')"><%=vo.getTitle() %></td>
			<td onclick="listWr('<%=vo.getWriter() %>')"><%=vo.getWriter()%></td>
			<td ><%=vo.getWritedate()%></td>
			<td ><%=vo.getCnt()%></td>			
		<tr>
			<%
				}
			%>	
	</table>
	<%
		if(request.getAttribute("msg")!=null){
	%>
	<script>
		alert('${msg}');
	</script>
	<%
		}
	%>
		<form action="/mvc/news" method="GET">
	<input type="hidden" name="action" value="search">
	<select name="searchType">
		<option value="title">제목</option>
		
		<option value="writer">작성자</option>
		
		<option value="content">내용</option>
	</select>
	<input type="text" name="key">
	<input  type="submit" value="뉴스검색">
	</form>
	<button id='b' onclick="newshome();">뉴스홈</button>
	<button id='b' onclick="displayDiv(1)" >뉴스 작성</button>
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
			location.href='news?action=read&id='+cv+'&status='+status;
		}
		function deleteNews(cv){
			location.href='news?action=delete&id='+cv+'&status='+status;
		}
		function listWr(cv){
			location.href='news?action=listwriter&key='+cv;
		}
		function newshome(){
			location.href='news';
		}
	</script>
	<%
	if(vo1!=null) {
		%>
		<div id="update">
		<form method="post" action="/mvc/news">
			<input type="hidden" name="status" value="<%=status %>">
			<input type="hidden" name="action" value="update">
			<input type="hidden" name="id" value="<%=vo1.getId() %>">
			<input id="writer" type="text" name="writer" value='<%=vo1.getWriter() %>'><br>
			<input id="title" type="text" name="title" value='<%=vo1.getTitle() %>'><br>
			<textarea id="context" name="content"><%=vo1.getContent() %></textarea><br>
			<input id='b' onclick="displayDiv(2)" type="reset" value="확인">
			<input id='b' type="submit" value="수정">
			<input id='b' onclick="deleteNews('<%=vo1.getId()%>')" type="reset" value="삭제">
		</form>
		</div>
		<% 
	}
	%>
	<div id="write" style="display: none">
		<form method="post" action="/mvc/news">
			<input type="hidden" name="status" value="<%=status %>">
			<input type="hidden" name="action" value="insert">
			<input id="writer" type="text" name="writer" placeholder="작성자명을 입력해주세요."><br>
			<input id="title" type="text" name="title" placeholder="제목을 입력해주세요"><br>
			<textarea id="context" name="content" placeholder="내용을 입력해주세요"></textarea><br>
			<input id='b' type="submit" value="저장">
			<input id='b' type="reset" value="재작성">
			<input id='b' onclick="displayDiv(3)" type="reset" value="취소">
		</form>
	</div>	
</body>
</html>