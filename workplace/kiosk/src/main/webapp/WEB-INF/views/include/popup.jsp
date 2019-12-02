<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css"  href="${path}/resources/css/popup.css">
	<meta charset="UTF-8">
	<title>팝업창입니다</title>
</head>
<body>
	<!-- 팝업될 레이어 -->
	<div class="modal">
		<div class="modal-content">
			<span class="close-button">&times;</span> <!-- &times;는 x를 의미  -->
			<h1 class="title">장바구니</h1>
			<form action="#" method="POST">
				<label for="product">주문 내역</label>>
				<button>주문 상품</button>
				<label></label>
				<input type="button" id="cancel" value="취소">
				<input type="submit" id="payment" value="결제 하기"> 
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		var modal = document.querySelector(".modal");
		var trigger = document.querySelector(".trigger");
		var closeButton = document.querySelector(".close-button");
		var cancelButton = document.querySelector("#cancel");

		//console.log(modal);
		
		function toggleModal() {
			modal.classList.toggle("show-modal");	
		}

		function windowOnClick(event) {
			if (event.target === modal) {
				toggleModal();
			}
		}

		trigger.addEventListener("click", toggleModal);
		closeButton.addEventListener("click", toggleModal); 
        cancel.addEventListener("click", toggleModal); 
        window.addEventListener("click", windowOnClick);
	</script>
</body>
</html>