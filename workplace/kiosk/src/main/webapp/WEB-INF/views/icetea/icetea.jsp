<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/main.css">
	<meta charset="UTF-8">
	<title>아이스티 화면입니다</title>
</head>
<body>
	<header>
		<%@ include file="../include/menu.jsp" %>
	</header>
	<main id="pic_group">
		<button class="pic" onclick="#">레몬 아이스티</button>
		<button class="pic" onclick="#">오렌지 아이스티</button>
		<button class="pic" onclick="#">자몽 아이스티</button>
		<button class="pic" onclick="#">망고 아이스티</button>
		<button class="pic" onclick="#">한라봉 아이스티</button>
		<button class="pic" onclick="#">후르츠 레볼루션</button>
	</main>
	<footer>
		<%@ include file="../include/payment.jsp" %>
		<%@ include file="../include/popup.jsp" %>
	</footer>
</body>
</html>