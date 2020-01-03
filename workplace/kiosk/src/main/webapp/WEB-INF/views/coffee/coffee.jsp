<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/main.css">
	<meta charset="UTF-8">
	<title>커피 화면입니다</title>
</head>
<body>
	<header>
		<%@ include file="../include/menu.jsp" %>
	</header>
	<main id="pic_group">
		<button class="pic" onclick="#">아메리카노(핫)</button>
		<button class="pic" onclick="#">아메리카노(아이스)</button>
		<button class="pic" onclick="#">에스프레소</button>
		<button class="pic" onclick="#">초코라떼</button>
		<button class="pic" onclick="#">연유라떼</button>
		<button class="pic" onclick="#">카라멜마끼아또</button>
	</main>
	<footer>
		<%@ include file="../include/payment.jsp" %>
		<%@ include file="../include/popup.jsp" %>
	</footer>
	<script>
		// html 태그의 인덱스를 표현
		var idx = 0;
		// 배열의 인덱스를 표현
		var cnt;
		// 주문한 상품명을 보관하는 배열
		var arrProduct;
		// 주문한 상품의 가격을 보관하는 배열
		var arrPrice;
		// 주문한 상품의 개수를 보관하는 딕셔너리
		var dictProduct;
		// 중복 검사를 위한 딕셔너리
		var dictCheck = {};
		// 결제를 위한 임시 변수
		var rsp = true;
		// 매장 이용 방식을 담은 변수
		var take_out ;

		// window의 sessionStorage가 활성화된 상태라면
		if(window.sessionStorage){
			// 아래의 로직을 수행
			// 각각의 변수에 session에서 불러온 값을 할당
			var arrProduct_JSON = sessionStorage.getItem("arrProduct");
			var arrPrice_JSON = sessionStorage.getItem("arrPrice");
			var dictProduct_String = sessionStorage.getItem("dictProduct");
			var take_out_String = sessionStorage.getItem("take_out");
			// JSON.stringify를 통해 String으로 변환한 값들을 다시 JSON객체로 변환
			// 예약된 변수명에 약속된 타입으로 값을 할당
			arrProduct = JSON.parse(arrProduct_JSON)["temp"];
			arrPrice = JSON.parse(arrPrice_JSON)["temp"];
			dictProduct = JSON.parse(dictProduct_String);
			cnt = sessionStorage.getItem("cnt");
			take_out = JSON.parse(take_out_String);

			// web 콘솔을 통해 값을 확인
			console.log(arrProduct);
			console.log(arrPrice);
			console.log(dictProduct);
			console.log(cnt);
			console.log(take_out);
		}
	</script>
</body>
</html>