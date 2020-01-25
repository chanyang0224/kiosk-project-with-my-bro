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
 	<title>로그인 페이지입니다</title>	
</head>
<body class="web_background">
<header>
	<div class="header_area">
		<h1 class="header">키오스크 차트</h1>
	</div>
</header>
<main>
	<form action="http://182.229.50.83:8080/chart/main" method="POST">
		<fieldset class="login_form">
			<legend class="blind">로그인</legend>
			<div class="id_area">
				<div class="input_row" id="id_area">
					<span class="input_box">
						<input type="text" id="id" name="id" accesskey="L" placeholder="아이디" class="int" maxlength="41" value="">
					</span>
				</div>
			</div>
			<div class="pw_area">
				<div class="input_row" id="pw_area">
					<span class="input_box">  
						<input type="password" id="pw" name="pw" placeholder="비밀번호" class="int" maxlength="16">
					</span>
				</div>
			</div>
			<input type="submit" title="로그인" alt="로그인" value="로그인" class="btn_global" id="log.login">
		</fieldset>
	</form>
</main>
<footer>
	<div class="footer_area">
		<p class="alert">${msg}</p>
	</div>
</footer>
</body>
</html>
