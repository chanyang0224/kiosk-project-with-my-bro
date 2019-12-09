<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/main.css">
	<meta charset="UTF-8">
	<title>차 화면입니다</title>
</head>
<body>
	<header>
		<%@ include file="../include/menu.jsp" %>
	</header>
	<main id="pic_group">
		<button class="pic" onclick="#">장미 꽃 차</button>
		<button class="pic" onclick="#">녹차</button>
		<button class="pic" onclick="#">귤 차</button>
		<button class="pic" onclick="#">모과 차</button>
		<button class="pic" onclick="#">옥수수 차</button>
		<button class="pic" onclick="#">수정과</button>
	</main>
	<footer>
		<%@ include file="../include/payment.jsp" %>
		<%@ include file="../include/popup.jsp" %>
		<%@ include file="../include/popup2.jsp" %>
	</footer>
</body>
</html>