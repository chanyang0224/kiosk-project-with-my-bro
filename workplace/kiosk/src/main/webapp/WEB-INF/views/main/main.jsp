<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/main.css">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0">
	<title>메인 화면입니다</title>
</head>
<body>
	<header>
		<%@ include file="../include/menu.jsp" %>
	</header>
	<main>
		<div id="pic_group">
			<button class="pic" onclick="#">아메리카노(핫)</button>
			<button class="pic" onclick="#">아메리카노(아이스)</button>
			<button class="pic" onclick="#">에스프레소</button>
		</div>
		<div id="price">
			<ul>
				<li>1500원</li>
				<li>2000원</li>
				<li>1500원</li>
			</ul>
		</div>
		<div id="pic_group">
			<button class="pic" onclick="#">초코라떼</button>
			<button class="pic" onclick="#">연유라떼</button>
			<button class="pic" onclick="#">카라멜마끼아또</button>
		</div>
		<div id="price">
			<ul>
				<li>1500원</li>
				<li>2000원</li>
				<li>1500원</li>
			</ul>
		</div>
	</main>
	<footer>
		<%@ include file="../include/payment.jsp" %>
		<%@ include file="../include/popup.jsp" %>
		<%@ include file="../include/popup2.jsp" %>
	</footer>
</body>
</html>