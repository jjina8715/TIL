<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>festa-관리자 페이지</title>
<style>
.wrapper {
	display: grid;
	grid-template-colums: repeat(4, 1fr);
	grid-template-rows: 48px 100px 40px;
}

.menu {
	grid-column: 1;
}

.content {
	grid-column: 1;
}
</style>
</head>
<body>
	<div class="wrapper">
		<div class="menu">
			<table>
				<tr onclick="location.href='/festival/adminpage/notice'">
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
					<button type="button" name="reportDel">선택 삭제</button><br>
					<table>
						<tr>
							<td><input type="checkbox" name="all"></td>
							<td>신고사유</td>
							<td>신고된 리뷰</td>
						</tr>
						<c:forEach var="vo" items="${reportlist }">
							<tr>
								<td><input type="checkbox" name="${vo.report_id}">
								</td>
								<td>신고자 : ${vo.report_mid }<br> 사유 : <br>
									${vo.reason }
								</td>
								<td>아이디: ${vo.review_mid }<br> 축제이름: ${vo.name }<br>
									작성 날짜: ${vo.writedate }<br> 내용: ${vo.rcontent }<br>
								</td>
							</tr>
						</c:forEach>
					</table>
				</c:when>
				<c:when test="${!empty noticelist }">
					<form action="/festival/adminpage/notice" method="get">
						<select name="searchType">
							<option value="title">제목</option>
							<option value="ncontent">내용</option>
							<option value="writer">작성자</option>
						</select> <input name="key" id='key' type="text"> 
						<input type="submit" value="검색">
					</form>
					<button type="button" name="reportDel">선택 삭제</button><br>
					<table>
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
								<td onclick="location.href='/adminpage/ncontent?nid='${vo.nid}'">${vo.title }</td>
								<td>${vo.writer }</td>
								<td>${vo.uploaddate }</td>
								<td>${vo.cnt }</td>
							</tr>
						</c:forEach>
					</table>
				</c:when>
				<c:when test='${!empty content }'>
				<form action="/festival/adminpage/notice">
					<table>
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
					<input type="submit" name="submit" value="수정">
					<input type="submit" name="submit" value="삭제">
					</form>
					<form action="/festival/adminpage/notice">
						<input type="submit" value="목록보기">
					</form>
				</c:when>
				<c:when test='${!empty listmsg }'>
					<h3>${listmsg }</h3>
				</c:when>
			</c:choose>
		</div>
	</div>
</body>
</html>