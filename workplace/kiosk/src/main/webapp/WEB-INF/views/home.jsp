<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<title>키오스크</title>
	<style>
	main{
		background-image:url(${path}/resources/images/coffee-background3.jpg); 
		background-size:cover; 
		background-position:center; 
		padding:10px; 
	}
	h1{
		font-size:4rem;
		text-align:center;
		padding:20px
	}
	footer{
		background:#222222; 
		text-align:center; 
		padding:13px; 
	}
	#btn_group button{
		font-size:2.5rem; 
		background-color:#222222; 
		color:white; 
		border: 1px #222222;
	}
	#btn_group button:hover{
		color:black;
		background-color:white;			
	}	
	</style>
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
