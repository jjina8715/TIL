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
.wrapper{
	display: grid;
	grid-template-colums:repeat(4,1fr);
	grid-template-rows:48px 100px 40px;
}
.menu{
	grid-column: 1;
}
.content{
	grid-column: 1;
}
</style>
</head>
<body>
<div class="wrapper">
        <div class="menu">
        	<table>
        		<tr onclick="location.href='/festival/adminpage/notice'"><td>공지사항 관리</td></tr>
        		<tr onclick="location.href='/festival/adminpage/report'"><td>리뷰 신고함</td></tr>
        	</table>
        </div>
        <div class="content">
        <c:choose>
      	  <c:when test="${!empty reportlist }">		
        		<table>
        			<tr>
        				<td>
        				<input type="checkbox" name="all" >
        				</td>
        				<td>신고사유</td>
        				<td>신고된 리뷰</td>
        			</tr>
        			<c:forEach var="vo" items="${reportlist }">
    	    			<tr>
    	    				<td >
    	    				<input type="checkbox" name="${vo.report_id}">
    	    				</td>
	        				<td>
        						신고자 : ${vo.report_mid }<br>
        						사유<br>
        						${vo.reason }
        					</td>
        					<td>
    	    					아이디: ${vo.review_mid }<br> 
	        					축제이름: ${vo.name }<br>
        						작성 날짜: ${vo.writedate }<br>
        						내용:	 ${vo.rcontent }<br>
        					</td>
        				</tr>
        			</c:forEach>
        		</table>
    	    </c:when>
    	  	<c:when test='${!empty listmsg }'>
				<h3>${listmsg }</h3>
			</c:when>
        </c:choose>
        </div>
</div>
</body>
</html>