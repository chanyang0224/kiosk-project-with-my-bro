<%@page import="com.project.kiosk.vo.KioskVO"%>
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
	<main class="container">
		<c:forEach items="${coffee}" var="coffee">
			<% 
				KioskVO coffee = (KioskVO)pageContext.getAttribute("coffee");
				String img = coffee.getImg();
				String[] imgLocation = img.split("/");
				String folder = imgLocation[imgLocation.length-2];
				String jpg = imgLocation[imgLocation.length-1];
				pageContext.setAttribute("folder", folder);
				pageContext.setAttribute("jpg", jpg);
			%>
			<div id="pic_price">
				<button class="pic" onclick="#" style="background-image: url(http://localhost:8080/kiosk_image/${folder}/${jpg})"></button>
				<span class="product">${coffee.product}</span>
				<span class="price">${coffee.price}원</span>
			</div>
		</c:forEach>
	</main>
	<footer>
		<%@ include file="../include/payment.jsp" %>
		<%@ include file="../include/popup.jsp" %>
		<%@ include file="../include/popup2.jsp" %>
	</footer>
</body>
</html>