<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/menu.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/main.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0">
	<meta charset="UTF-8">
	<title>메인 화면입니다</title>
</head>
<body>
	<header>
		<nav id="topMenu">
			<ul>
				<li><a id="1" class="menuLink">1월</a></li>
				<li><a id="2" class="menuLink">2월</a></li>
				<li><a id="3" class="menuLink">3월</a></li>
				<li><a id="4" class="menuLink">4월</a></li>
				<li><a id="5" class="menuLink">5월</a></li>
				<li><a id="6" class="menuLink">6월</a></li>
				<li><a id="7" class="menuLink">7월</a></li>
				<li><a id="8" class="menuLink">8월</a></li>
				<li><a id="9" class="menuLink">9월</a></li>
				<li><a id="10" class="menuLink">10월</a></li>
				<li><a id="11" class="menuLink">11월</a></li>
				<li><a id="12" class="menuLink">12월</a></li>
			</ul>
		</nav>
	</header>
	<main>
		<div class="svg_area">
			<legend>${month}</legend>
			<img class="svg" src="http://182.229.50.83:8080/kiosk_chart/${svg}"></img>
		</div>
	</main>
	<footer>
		<div class="msg_box">
			<p class="msg">&#8251; 차트는 매일 12시에 자동 업데이트 됩니다</p>
		</div>
		<form id="hidden" class="hidden" action="http://182.229.50.83:8080/chart/choice" method="POST">
			<input type="hidden" id="month" name="month" value=""/>
		</form>
	</footer>
	<script src="${path}/resources/js/main.js"></script>
</body>
</html>