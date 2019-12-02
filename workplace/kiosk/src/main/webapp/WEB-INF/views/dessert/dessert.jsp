<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/main.css">
	<meta charset="UTF-8">
	<title>디저트 화면입니다</title>
</head>
<body>
	<header>
		<%@ include file="../include/menu.jsp" %>
	</header>
	<main id="pic_group">
		<button class="pic" onclick="#">초코쿠키</button>
		<button class="pic" onclick="#">아몬드쿠키</button>
		<button class="pic" onclick="#">꿀토스트</button>
		<button class="pic" onclick="#">딸기 티라미슈</button>
		<button class="pic" onclick="#">녹차 크림 베이비 슈</button>
		<button class="pic" onclick="#">따끈 따끈 고구마</button>
	</main>
	<footer>
		<%@ include file="../include/payment.jsp" %>
		<%@ include file="../include/popup.jsp" %>
	</footer>
</body>
</html>