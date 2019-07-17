<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "basket.service.GetBasketListService" %>
<%@ page import= "basket.service.BasketListView"%>
<%@ page import= "basket.service.CartListView"%>
<%@ page import= "basket.service.InsertBuyLogService" %>
<%@ page import= "basket.service.DeleteBasketService" %>
<%
	String user = (String)session.getAttribute("USER");

	boolean invalidInfo = false;
	String err = null;
	try{
		
	InsertBuyLogService insertBuyLog = InsertBuyLogService.getInstance();
	GetBasketListService basketListService = GetBasketListService.getInstance();
	DeleteBasketService deleteBasket = DeleteBasketService.getInstance();
	//1.basket의목록을 읽어오고
	//2.buylog에 기록하고 
	//3.basket에서 목록 삭제
	BasketListView basketlist = basketListService.getPayStufflist(user);
	if(basketlist == null) throw new Exception("장바구니의 목록을 불러올 수 없습니다.");
	insertBuyLog.insertBuyLog(basketlist);
	deleteBasket.deleteBasket(user); 
	}catch(Exception e){
		invalidInfo = true;
		err = e.getMessage();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=devide-width, initial-scal=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>결제</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</head>
<body>
<div class="container" style="text-align: center; border: 1px solid #dddddd; height: 150px">
<h4>
<%
	if(!invalidInfo){%>
	<br><br>결제를 완료했습니다.
<%	}else{ 
	if(!err.isEmpty())
		System.out.print("\n\n" + err);
	else
%>
	결제를 실패하였습니다.
<% }%>
</h4>
</div>
<div class="container">
		<div class="row justify-content-center">
			<div class="col-6">
				<a class="btn btn-secondary btn-lg" href="login.jsp" role="button">확인</a>
			</div>
		</div>
	</div>
</body>
</html>