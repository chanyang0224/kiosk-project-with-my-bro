<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css"  href="${path}/resources/css/alert.css">
	<meta charset="UTF-8">
	<title>알림창입니다</title>
</head>
<body>
	<!-- 팝업될 레이어 -->
	<div class="modal3">
		<div class="modal-content3">
			<h1 class="title2">결제가 완료되었습니다</h1>
		</div>
	</div>
	
	<script type="text/javascript">
		var modal3 = document.querySelector(".modal3");
		
		function toggleModal3() {
			modal3.classList.toggle("show-modal3");	
		}
	</script>
</body>
</html>