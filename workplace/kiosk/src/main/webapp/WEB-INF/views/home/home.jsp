<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/home.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
			<button id="take_out" style="margin-right:5px">포장</button>
			<button id="take_out2" style="margin-right:5px">매장 이용</button>
		<form id="frm" action="${path}/main" method="get">
			<input name="take_out" type="hidden" value="1"/>
		</form>
		<form id="frm2" action="${path}/main" method="get">
			<input name="take_out" type="hidden" value="0"/>
		</form>
	</footer>
	
	<script>
		$("#take_out").click(function(){
			document.getElementById("frm").submit();
		});

		$("#take_out2").click(function(){
			document.getElementById("frm2").submit();
		});
	</script>
</body>

</html>
