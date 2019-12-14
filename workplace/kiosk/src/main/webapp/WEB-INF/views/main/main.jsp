<%@page import="com.project.kiosk.vo.KioskVO"%>
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
	</footer>
	<script>
		var idx = 0;
		var cnt = 0;
		var arrProduct = new Array();
		var arrPrice = new Array();
		var dictProduct = {};
		var dictCheck = {};
		
		$(".pic").click(function(){
			alert("클릭되었습니다");
			idx = $(".pic").index(this);
			var i = $(".product").eq(idx).text();
			var j = $(".price").eq(idx).text();

 			if(dictProduct[i]) {
				dictProduct[i] += 1;
			} 
 			else {
 	 			dictProduct[i] = 1;
 	 		}

			arrProduct[cnt] = i;
			arrPrice[cnt] = j;
			cnt+=1;
		});

		$(".trigger1").click(function(){
			var list_mom = document.getElementById("list_mom");

			for(var i=0; i<arrProduct.length; i++) {
				var li1 = document.createElement("li");
				var li2 = document.createElement("li");
				var li3 = document.createElement("li");
				li1.setAttribute("class", "list");
				li1.setAttribute("id", "first_li");
				li2.setAttribute("class", "list");
				li3.setAttribute("class", "list");
				var liProduct = document.createTextNode(arrProduct[i]);
				var liNum = document.createTextNode("X "+dictProduct[arrProduct[i]]);
				var liPrice = document.createTextNode(arrPrice[i]);
				if(dictCheck[arrProduct[i]]==null){
				list_mom.appendChild(li1).appendChild(liProduct);
				list_mom.appendChild(li2).appendChild(liNum);
				list_mom.appendChild(li3).appendChild(liPrice);
				dictCheck[arrProduct[i]]=1;
				}
			}
		});
		$("#cancel, .close-button").click(function(){
			idx = 0;
			cnt = 0;
			arrProduct = new Array();
			arrPrice = new Array();
			dictProduct = {};
			dictCheck = {};
			$(".list").remove();
		});
	</script>
</body>
</html>