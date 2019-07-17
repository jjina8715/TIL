<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.ReadNFCService" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=devide-width, initial-scal=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title></title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</head>
<body>
<%
 ReadNFCService readNFCService = ReadNFCService.getInstance();
 String tag = readNFCService.readNFC();
 if(!tag.isEmpty()){
	 %>
	 <form action="index.jsp" method="post">
	 	<input type=hidden name="tag" value=<%= tag%>> 
	 </form>
	 <% }%>
</body>
</html>