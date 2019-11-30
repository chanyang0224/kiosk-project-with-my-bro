<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/main.css">
	<meta charset="UTF-8">
	<title>주스 화면입니다</title>
</head>
<body>
	<header>
		<%@ include file="../include/menu.jsp" %>
	</header>
	<main id="pic_group">
		<button class="pic" onclick="#">오렌지 생과일 주스</button>
		<button class="pic" onclick="#">파인애플 생과일 주스</button>
		<button class="pic" onclick="#">청포도 생과일 주스</button>
		<button class="pic" onclick="#">딸기 바나나 생과일 주스</button>
		<button class="pic" onclick="#">망고 생과일 주스</button>
		<button class="pic" onclick="#">토마토 생과일 주스</button>
	</main>
	<footer>
		<%@ include file="../include/payment.jsp" %>
	</footer>
</body>
</html>