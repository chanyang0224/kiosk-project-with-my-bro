<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css"  href="${path}/resources/css/popup2.css">
	<meta charset="UTF-8">
	<title>팝업창입니다</title>
</head>
<body>
	<!-- 팝업될 레이어 -->
	<div class="modal2">
		<div class="modal-content2">
			<span class="close-button2">&times;</span> <!-- &times;는 x를 의미  -->
			<h1 class="title2">카드를 삽입구에 넣어주세요</h1>
			<div class="img"></div>
		</div>
	</div>
	
	<script type="text/javascript">
		var modal2 = document.querySelector(".modal2");
		var trigger2 = document.querySelector(".trigger2");
		var closeButton2 = document.querySelector(".close-button2");

		//console.log(modal);
		
		function toggleModal2() {
			modal2.classList.toggle("show-modal");	
		}

		function windowOnClick2(event) {
			if (event.target === modal) {
				toggleModal2();
			}
		}

		trigger2.addEventListener("click", toggleModal2);
		closeButton2.addEventListener("click", toggleModal2);  
        window.addEventListener("click", windowOnClick2);
	</script>
</body>
</html>