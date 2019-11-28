<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/home.css">
	 
 	<title>키오스크</title>	
</head>

<body>
	<header style="padding:10px">
	</header>
	<main>
		<h1>
			매장 이용방식을 
		</h1>
		<h1>
			선택해주세요
		</h1>
	</main>
	<footer id="btn_group">
		<button style="margin-right:5px" type="button" onclick="#">매장 식사</button> 
		<button style="margin-left:5px" type="button" onclick="#">포장</button>
	</footer>
</body>

</html>
