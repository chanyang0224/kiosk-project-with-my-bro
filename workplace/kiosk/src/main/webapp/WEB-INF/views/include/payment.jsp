<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/bottomMenu.css">
	<meta charset="UTF-8">
	<title>결제창 입니다</title>
</head>
<body>
	<footer>
		<nav id="bottomMenu">
			<ul>
				<li class="whiteSpace">&nbsp;&nbsp;</li> <!-- &nbsp;는 공백을 의미 -->
				<li><a id="menuLink" href="#">취소</a></li>
				<li><a id="menuLink" href="#">카드 결제</a></li>
				<li><a id="menuLink" class="trigger">장바구니</a></li>
			</ul>
		</nav>
	</footer>
</body>
</html>