<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css"  href="${path}/resources/css/alert2.css">
	<meta charset="UTF-8">
	<title>알림창입니다</title>
</head>
<body>
	<!-- 팝업될 레이어 -->
	<div class="modal4">
		<div class="modal-content4">
			<h1 class="title2">메뉴를 먼저 선택해주세요</h1>
		</div>
	</div>
	
	<script type="text/javascript">
		var modal4 = document.querySelector(".modal4");
		
		function toggleModal4() {
			modal4.classList.toggle("show-modal4");	
		}
	</script>
</body>
</html>