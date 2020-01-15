<%@ page import="com.project.kiosk.vo.KioskVO"%>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>디저트 화면입니다</title>
</head>
<body>
	<header>
		<%@ include file="../include/menu.jsp" %>
	</header>
	<main class="container">
		<c:forEach items="${dessert}" var="dessert">
			<% 
				KioskVO dessert = (KioskVO)pageContext.getAttribute("dessert");
				String img = dessert.getImg();
				String[] imgLocation = img.split("/");
				String folder = imgLocation[imgLocation.length-2];
				String jpg = imgLocation[imgLocation.length-1];
				pageContext.setAttribute("folder", folder);
				pageContext.setAttribute("jpg", jpg);
			%>
			<div id="pic_price">
				<button type="button" class="pic" style="background-image: url(http://182.229.50.83:8080/kiosk_image/${folder}/${jpg})"></button>
				<span class="product">${dessert.product}</span>
				<span class="price">${dessert.price}원</span>
			</div>
		</c:forEach>
	</main>
	<footer>
		<%@ include file="../include/payment.jsp" %>
		<%@ include file="../include/popup.jsp" %>
		<%@ include file="../include/popup2.jsp" %>
		<%@ include file="../include/alert.jsp" %>
		<%@ include file="../include/alert2.jsp" %>
	</footer>
	<script src="${path}/resources/js/product_js.js"></script>
</body>
</html>