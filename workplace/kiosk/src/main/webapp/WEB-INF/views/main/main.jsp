<%@ page import="com.project.kiosk.vo.KioskVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jsp에서 jstl을 사용하기 위한 추가 내용 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/main.css">
	<meta charset="UTF-8">
	<!-- 반응형 웹을 구성하기 위한 추가 내용 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0">
	<!-- js(JavaScript)에서 jquery를 사용하기 위한 추가 내용-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>메인 화면입니다</title>
</head>
<body>
	<!-- 상단 메뉴바에 해당하는 부분 -->
	<header>
		<%@ include file="../include/menu.jsp" %>
	</header>
	<!-- 상품 정보에 해당하는 부분 -->
	<main class="container">
		<!-- jstl을 사용하여 forEach구문을 사용 -->
		<c:forEach items="${coffee}" var="coffee">
			<!-- 자바 코드를 사용하여 model로 추가한 attribute룰 받아옴 -->
			<% 
				KioskVO coffee = (KioskVO)pageContext.getAttribute("coffee");
				// DB로부터 이미지 경로를 받아와서 필요한 정보(폴더명, 사진명)만 따로 분리하는 로직
				String img = coffee.getImg();
				String[] imgLocation = img.split("/");
				String folder = imgLocation[imgLocation.length-2];
				String jpg = imgLocation[imgLocation.length-1];
				pageContext.setAttribute("folder", folder);
				pageContext.setAttribute("jpg", jpg);
			%>
			<!-- 반복문이 끝날 때까지 상품정보(사진, 상품명, 가격정보)들을 화면에 뿌려줌  -->
			<div id="pic_price">
				<button type="button" class="pic" style="background-image: url(http://localhost:8080/kiosk_image/${folder}/${jpg})"></button>
				<span class="product">${coffee.product}</span>
				<span class="price">${coffee.price}원</span>
			</div>
		</c:forEach>
	</main>
	<!-- 하단 결제 메뉴와 알림창을 구성하는 부분 -->
	<footer>
		<%@ include file="../include/payment.jsp" %>
		<%@ include file="../include/popup.jsp" %>
		<%@ include file="../include/popup2.jsp" %>
		<%@ include file="../include/alert.jsp" %>
		<%@ include file="../include/alert2.jsp" %>
	</footer>
	<script>
		// 매장 이용 방식을 담은 변수
		var take_out = {"flag" : "<%= request.getParameter("take_out") %>"};
		console.log(take_out);
	</script>
	<script src="${path}/resources/js/main_js.js"></script>
</body>
</html>