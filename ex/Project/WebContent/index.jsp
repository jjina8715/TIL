<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="basket.Cart"%>
<%@ page import="basket.service.CartListView"%>
<%@ page import="basket.service.GetBasketListService"%>
<%@ page import="member.CofirmMemberService"%>
<%
	boolean invalidInfo = false;
	CartListView viewData = null; 
	String err = null; 
	int i=0, tAmount =0, tPrice =0;
	String cid = (String)request.getSession().getAttribute("User");
	try{
		GetBasketListService basketListService = GetBasketListService.getInstance();
		viewData = basketListService.getBasketList(cid);
		viewData.updatePrice();
	}catch(Exception e){
		invalidInfo = true;
		err = e.getMessage();
	}
	session.setAttribute("USER", cid); 
%>  
<c:set var="viewData" value="<%=viewData %>"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=devide-width, initial-scal=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<title>장바구니 목록</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</head>
<body>
	<br>
	<div class="container" >
		<div>
			<table class="table table-stripaed" style="text-align: center; border: 1px solid #dddddd; height: 70%">
				<thead>
					<tr>
						<th  width="10%" style="background-color: #fafafa; text-align: center;">NO</th>
	 					<th  width="25%" style="background-color: #fafafa; text-align: center;">상품명</th>
						<th  width="25%" style="background-color: #fafafa; text-align: center;">단가</th>
						<th  width="10%" style="background-color: #fafafa; text-align: center;">수량</th>
						<th  width="30%" style="background-color: #fafafa; text-align: center;">가격</th> 
					</tr>
				</thead>
			</table>
		</div>
		<div style="width: 100%; height:300px; overflow-y:auto; overflow-x: hidden;">
			<table class="table">
				<tbody>
					<c:forEach var="cart" items="${viewData.cartList}">
						<tr>
							<td width="15%"><%=++i %>
							<td width="28%">${cart.stuffName} </td>
							<td width="20%">${cart.stuffPrice} </td>
							<td width="17%">${cart.amount} </td>
							<td width="30%">${cart.totalPrice} </td>
						<tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<table class="table" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #fafafa; text-align: center;">수량: ${viewData.stuffTotalCount}</th>
					<th style="background-color: #fafafa; text-align: center;">결재금액: ${viewData.stuffTotalPrice }</th> 
				</tr>
			</thead>
		</table>
	</div>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-6">
				<a class="btn btn-secondary btn-lg" href="payment.jsp" role="button">결제</a>
				<input type=hidden name="viewData" value=<%=viewData %>> 
			</div>
			<div class="col-6">
				<a class="btn btn-secondary btn-lg" href="login.jsp" role="button">취소</a>
			</div>
		</div>
	</div>
</body>
</html>