<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/main.css">
	<meta charset="UTF-8">
	<title>메인 화면입니다</title>
</head>
<body>
	<header>
		<%@ include file="../include/menu.jsp" %>
	</header>
	<main id="pic_group">
		<button class="pic" onclick="#">아메리카노(핫)</button>
		<button class="pic" onclick="#">아메리카노(아이스)</button>
		<button class="pic" onclick="#">에스프레소</button>
		<button class="pic" onclick="#">초코라떼</button>
		<button class="pic" onclick="#">연유라떼</button>
		<button class="pic" onclick="#">카라멜마끼아또</button>
	</main>
	<footer>
		<%@ include file="../include/payment.jsp" %>
	</footer>
</body>
</html>