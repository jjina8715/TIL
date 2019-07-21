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
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
@import	url('https://fonts.googleapis.com/css?family=Notable&display=swap');
#logo {
	font-family: Notable;
}
html, body, header{
	height: 100%;
}
textarea{
	width:300px;
	height:150px;
}
table{
	width:70%;
}
#list_title.hover{
	font-weight:bold;
}
</style>
</head>
<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark scrolling-navbar">
    <div class="container">

      <!-- Brand -->
      <a class="navbar-brand" href="https://mdbootstrap.com/docs/jquery/" target="_blank" id="logo">
        <strong>festas</strong>
      </a>

      <!-- Collapse -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Links -->
      <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <!-- Left -->
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

<div class="container">
    <div class="row">
        <div class="col-sm-3">
        	<table>
				<tr onclick="location.href='/festival/adminpage/notice?action=list'">
					<td>공지사항 관리</td>
				</tr>
				<tr onclick="location.href='/festival/adminpage/report'">
					<td>리뷰 신고함</td>
				</tr>
			</table>
        </div>
        <div class="col-sm-9">
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
				    <button id="createBtn" type="button" class="btn btn-dark" data-toggle="modal">공지사항 작성</button>
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
								<td id="list_title" data-toggle="modal" >${vo.title }</td>
								<td>${vo.writer }</td>
								<td>${vo.uploaddate }</td>
								<td>${vo.cnt }</td>
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
</div>

<div class="modal fade" id="noticeModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 id="modal-title" class="modal-title"></h4>
			</div>
			<div class="modal-body">
				<table class="table">
					<tr>
						<td>제목</td>
						<td><input class="form-control" id="title" type="text" required></td>
					</tr>
					<tr>
						<td><textarea class="form-control" id="ncontent" rows="10" required></textarea></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button id="modalSumit" type="button" class="btn btn-sucess">작성</button>
				<button type="button" class="btn btn-defalut" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
	<script>
	var action = '';
	var nid = ' ';
	var type = ' ';
	$(document).ready(function(){
		$('input[name=check_all]').on('change', function(){
			  $('input[name=check]').prop('checked', this.checked);
		});
		
		$('#createBtn').click(function(){
			action="create";
			type="post";
			$("#modal-title").text("공지사항 작성");
			$("#noticeModal").modal();
		});
		
		$('#list_title').click(function(){
			action="modify";
			type="post";
			$("#modal-title").text("공지사항 수정/삭제");
			
			$('#title').val();
			$('#ncontent').val();
			$
			$("#noticeModal").modal();
		});
		
		$('#modalSubmit').click(function(){
			if(action == 'create'){
				nid=0;
			}else if(action =='manage'){
				url="/adminpage/managenotice"
			}
			
			var data={
					"action":action,
					"writer":"관리자",
					"title":$('#title').val(),
					"nid":nid,
					"ncontent":$('#ncontent').val();
			};
			
			$.ajax({
				url:url,
				type:'post',
				data:data,
				sucess : function(data){
					$('#noticeModal').modal('toggle');
				}
				complete:function(data){
					location.reload();
				}
			})
		});
		
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