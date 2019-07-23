<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<%
	int bul_id = Integer.parseInt(request.getParameter("bul_id"));
%>
<html>
<head>
<title>게시글 삭제</title>
</head>
<body>

게시글을 삭제했습니다.
<br>
${ctxPath = pageContext.request.contextPath ; ''}
<a href="${ctxPath}/article/list.do?bul_id=<%=bul_id%>">[게시글목록보기]</a>
</body>
</html>