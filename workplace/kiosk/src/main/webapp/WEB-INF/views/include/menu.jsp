<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/menu.css">
	<meta charset="UTF-8">
	<title>메뉴 화면입니다</title>
</head>
<body>
	<header>
		<nav id="topMenu">
			<ul>
				<li><a id="coffee" class="menuLink">커피</a></li>
				<li><a id="juice" class="menuLink">주스</a></li>
				<li><a id="icetea" class="menuLink">아이스티</a></li>
				<li><a id="tea" class="menuLink">차</a></li>
				<li><a id="dessert" class="menuLink">디저트</a></li>
			</ul>
		</nav>
	</header>
</body>
</html>