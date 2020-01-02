<%@ page import="com.project.kiosk.vo.KioskVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/main.css">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>메인 화면입니다</title>
</head>
<body>
	<header>
		<%@ include file="../include/menu.jsp" %>
	</header>
	<main class="container">
		<c:forEach items="${coffee}" var="coffee">
			<% 
				KioskVO coffee = (KioskVO)pageContext.getAttribute("coffee");
				String img = coffee.getImg();
				String[] imgLocation = img.split("/");
				String folder = imgLocation[imgLocation.length-2];
				String jpg = imgLocation[imgLocation.length-1];
				pageContext.setAttribute("folder", folder);
				pageContext.setAttribute("jpg", jpg);
			%>
			<div id="pic_price">
				<button type="button" class="pic" style="background-image: url(http://localhost:8080/kiosk_image/${folder}/${jpg})"></button>
				<span class="product">${coffee.product}</span>
				<span class="price">${coffee.price}원</span>
			</div>
		</c:forEach>
	</main>
	<footer>
		<%@ include file="../include/payment.jsp" %>
		<%@ include file="../include/popup.jsp" %>
		<%@ include file="../include/popup2.jsp" %>
		<%@ include file="../include/alert.jsp" %>
		<%@ include file="../include/alert2.jsp" %>
	</footer>
	<script>
		// html 태그의 인덱스를 표현
		var idx = 0;
		// 배열의 인덱스를 표현
		var cnt = 0;
		// 주문한 상품명을 보관하는 배열
		var arrProduct = new Array();
		// 주문한 상품의 가격을 보관하는 배열
		var arrPrice = new Array();
		// 주문한 상품의 개수를 보관하는 딕셔너리
		var dictProduct = {};
		// 중복 검사를 위한 딕셔너리
		var dictCheck = {};
		// 결제를 위한 임시 변수
		var rsp = true;
		var take_out = {"flag" : "<%= request.getParameter("take_out") %>"};
		console.log(take_out);
		
		$(".pic").click(function(){
			// 클릭이 되었는지 확인하는 알림(확인용)
			alert("클릭되었습니다");
			// pic class 중에서 자기 자신의 인덱스를 반환 
			idx = $(".pic").index(this);
			// 인덱스를 통해 상품명과 가격 정보를 가져옴
			var i = $(".product").eq(idx).text();
			var j = $(".price").eq(idx).text();

			// 상품을 클릭한 횟수 만큼 개수를 증가시키는 if-else문
			// 상품의 개수가 1 이상일 때 True(1, 2, 3...)
 			if(dictProduct[i]) {
 	 			// 상품의 개수를 증가시킴
				dictProduct[i] += 1;
			} 
 			else {
 	 			// 상품 개수를 1로 할당
 	 			dictProduct[i] = 1;
 	 		}

			// 상품명과 상품 가격을 차례대로 배열에 할당
			arrProduct[cnt] = i;
			arrPrice[cnt] = j;
			cnt+=1;
		});

		$(".trigger1").click(function(){
			// 하위에 동적으로 li를 생성할 부모 li
			var list_mom = document.getElementById("list_mom");

			// 동적으로 li를 생성하기 위한 반복문
			for(var i=0; i<arrProduct.length; i++) {
				// li1부터 li3까지 동적으로 3개의 리스트를 생성
				var li1 = document.createElement("li");
				var li2 = document.createElement("li");
				var li3 = document.createElement("li");
				// li의 class와 id 속성을 부여
				li1.setAttribute("class", "list");
				li1.setAttribute("id", "first_li");
				li2.setAttribute("class", "list");
				li3.setAttribute("class", "list");
				// TextNode를 생성하여 상품명, 상품 개수, 가격을 화면에 표현
				var liProduct = document.createTextNode(arrProduct[i]);
				var liNum = document.createTextNode("X "+dictProduct[arrProduct[i]]);
				var liPrice = document.createTextNode(arrPrice[i]);
				// 중복을 검사를 위한 if문. dictCheck 딕셔너리에 값이 등록되지 않은 상품만 화면에 표현
				if(dictCheck[arrProduct[i]] == null){
				list_mom.appendChild(li1).appendChild(liProduct);
				list_mom.appendChild(li2).appendChild(liNum);
				list_mom.appendChild(li3).appendChild(liPrice);
				dictCheck[arrProduct[i]]=1;
				}
			}
		});

		// 취소 버튼을 부르면 값들을 초기화 시킴
		$("#cancel, .close-button").click(function(){
			idx = 0;
			cnt = 0;
			arrProduct = new Array();
			arrPrice = new Array();
			dictProduct = {};
			dictCheck = {};
			$(".list").remove();
		});

 		$("#payment").click(function(){
 	 		dictChect = {};
 	 		var payment_data = {};
 	 		if (arrProduct.length<1) {
 	 	 		// 값들의 초기화
 				idx = 0;
 				cnt = 0;
 				arrProduct = new Array();
 				arrPrice = new Array();
 				dictProduct = {};
 				dictCheck = {};
 				$(".list").remove();

				// 알림 메세지
				toggleModal4();
 				
 				// 2초 뒤에 function 실행
				setTimeout(
					function(){location.href="http://localhost:8080/kiosk/"}, 2000
				);
 	 	 	}
 	 		else {
 				// ajax를 활용해 서버로 보낼 data를 만드는 반복문
 	 	 		for(var i=0; i<arrProduct.length; i++) {
 	 	 	 		var count = dictProduct[arrProduct[i]];
 	 	 	 		var price = arrPrice[i];
 	 	 	 		if(dictChect[arrProduct[i]] == null) {
 	 	 	 			payment_data[arrProduct[i]] = [count, price];
 	 	 	 			dictCheck[arrProduct[i]]=1;
 	 	 	 	 	}
 	 	 	 	}

 	 	 		/* payment_data = JSON.stringify(payment_data); */
 				
 				console.log(payment_data);
 				
 				if(rsp == true) {
 					// ajax를 활용하여 서버에 data를 post형식으로 보냄
 					$.ajax({
 						url : "http://localhost:8080/kiosk/insert.do",
 						method : "POST",
 						crossDomain : true,
 						contentType: 'application/json;charset=UTF-8',
 						data : JSON.stringify({
 							payment_data : payment_data,
 							take_out : take_out
 						}) 
 					}).done(function(){
 						toggleModal();
 						toggleModal2();
 						
 						// 결제 완료를 알리는 메세지. 2초 뒤에 function 실행
 						setTimeout(
 								function(){toggleModal3();}, 2000
 							);
 						
 						// 4초 뒤에 function 실행
 						setTimeout(
 							function(){location.href="http://localhost:8080/kiosk/"}, 4000
 						);
 					});
 				}
 				else {
 					// 결제 실패시 메세지
 					alert("결제를 처음부터 다시 진행해주세요");
 				}
 	 	 	}		
		});

 		$(".trigger2").click(function(){
 	 		dictChect = {};
 	 		var payment_data = {};
 	 		if (arrProduct.length<1) {
 	 	 		// 값들의 초기화
 				idx = 0;
 				cnt = 0;
 				arrProduct = new Array();
 				arrPrice = new Array();
 				dictProduct = {};
 				dictCheck = {};
 				$(".list").remove();

				// 알림 메세지
				toggleModal4();
 				
 				// 2초 뒤에 function 실행
				setTimeout(
					function(){location.href="http://localhost:8080/kiosk/"}, 2000
				);
 	 	 	}
 	 		else {
 				// ajax를 활용해 서버로 보낼 data를 만드는 반복문
 	 	 		for(var i=0; i<arrProduct.length; i++) {
 	 	 	 		var count = dictProduct[arrProduct[i]];
 	 	 	 		var price = arrPrice[i];
 	 	 	 		if(dictChect[arrProduct[i]] == null) {
 	 	 	 			payment_data[arrProduct[i]] = [count, price];
 	 	 	 			dictCheck[arrProduct[i]]=1;
 	 	 	 	 	}
 	 	 	 	}

 	 	 		/* payment_data = JSON.stringify(payment_data); */
 				
 				console.log(payment_data);
 				
 				if(rsp == true) {
 					// ajax를 활용하여 서버에 data를 post형식으로 보냄
 					$.ajax({
 						url : "http://localhost:8080/kiosk/insert.do",
 						method : "POST",
 						crossDomain : true,
 						contentType: 'application/json;charset=UTF-8',
 						data : JSON.stringify({
 							payment_data : payment_data,
 							take_out : take_out
 						}) 
 					}).done(function(){
 						
 						// 결제 완료를 알리는 메세지. 2초 뒤에 function 실행
 						setTimeout(
 								function(){toggleModal3();}, 2000
 							);
 						
 						// 4초 뒤에 function 실행
 						setTimeout(
 							function(){location.href="http://localhost:8080/kiosk/"}, 4000
 						);
 					});
 				}
 				else {
 					// 결제 실패시 메세지
 					alert("결제를 처음부터 다시 진행해주세요");
 				}
 	 	 	}		
		});
	</script>
</body>
</html>