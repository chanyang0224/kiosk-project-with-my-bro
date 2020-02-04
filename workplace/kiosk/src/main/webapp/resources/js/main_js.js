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
// 중복이 아닌 횟수를 기록하는 변수
var rep = 0;
// 상품의 합계 금액을 나타내는 변수
var sumOfBill = 0;

//window의 sessionStorage가 활성화된 상태라면
$(".pic").click(function() {
	// 클릭이 되었는지 확인하는 알림(확인용)
	// alert("클릭되었습니다");
	// pic class 중에서 자기 자신의 인덱스를 반환
	idx = $(".pic").index(this);
	// 인덱스를 통해 상품명과 가격 정보를 가져옴
	var i = $(".product").eq(idx).text();
	var j = $(".price").eq(idx).text();

	// 상품을 클릭한 횟수 만큼 개수를 증가시키는 if-else문
	// 상품의 개수가 1 이상일 때 True(1, 2, 3...)
	if (dictProduct[i]) {
		// 상품의 개수를 증가시킴
		dictProduct[i] += 1;
	} else {
		// 상품 개수를 1로 할당
		dictProduct[i] = 1;
	}

	// 상품명과 상품 가격을 차례대로 배열에 할당
	arrProduct[cnt] = i;
	arrPrice[cnt] = j;
	cnt += 1;
});

// 장바구니를 클릭할 때
$(".trigger1").click(function() {
	// 하위에 동적으로 li를 생성할 부모 li
	var list_mom = document.getElementById("list_mom");

	// 동적으로 li를 생성하기 위한 반복문
	for (var i = 0; i < arrProduct.length; i++) {
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
		var liNum = document.createTextNode("X " + dictProduct[arrProduct[i]]);
		var liPrice = document.createTextNode(arrPrice[i]);
		// 중복을 검사를 위한 if문
		if (dictCheck[arrProduct[i]] == null) {
			// 중복이 아닌 횟수를 기록
			rep += 1;
			// 합계 금액을 계산하기 위한 로직
			var notWon = Number(arrPrice[i].split("원")[0]);
			console.log(arrProduct[i]);
			console.log(dictProduct[arrProduct[i]]*notWon+"원");
			sumOfBill += dictProduct[arrProduct[i]]*notWon;
			console.log(sumOfBill);
			// dictCheck 딕셔너리에 값이 등록되지 않은 상품만 화면에 표현
			list_mom.appendChild(li1).appendChild(liProduct);
			list_mom.appendChild(li2).appendChild(liNum);
			list_mom.appendChild(li3).appendChild(liPrice);
			dictCheck[arrProduct[i]] = 1;
		}
		if(Object.keys(dictProduct).length == rep) {
			$(".p1").remove();
			var bill = document.getElementById("bill");
			var p1 = document.createElement("p");
			var span1 = document.createElement("span");
			var span2 = document.createElement("span");
			var p1_text = document.createTextNode("합계 금액은 ");
			var span_text1 = document.createTextNode(sumOfBill+"원");
			var span_text2 = document.createTextNode(" 입니다");
			p1.setAttribute("class", "p1");
			span1.setAttribute("class", "span1");
			bill.appendChild(p1).appendChild(p1_text);
			p1.appendChild(span1).appendChild(span_text1);
			p1.appendChild(span2).appendChild(span_text2);
		}
	}
});

// 취소 버튼을 부르면 값들을 초기화 시킴
$("#cancel").click(function() {
	idx = 0;
	cnt = 0;
	arrProduct = new Array();
	arrPrice = new Array();
	dictProduct = {};
	dictCheck = {};
	rep = 0;
	sumOfBill = 0;
	$(".list").remove();
	$(".p1").remove();
});

//X 단추를 부르면 값들을 초기화 시킴
$(".close-button").click(function() {
	idx = 0;
	dictCheck = {};
	rep = 0;
	sumOfBill = 0;
	$(".list").remove();
	$(".p1").remove();
});

$("#payment").click(function() {
	dictChect = {};
	var payment_data = {};
	if (arrProduct.length < 1) {
		// 값들의 초기화
		idx = 0;
		cnt = 0;
		arrProduct = new Array();
		arrPrice = new Array();
		dictProduct = {};
		dictCheck = {};
		rep = 0;
		sumOfBill = 0;
		$(".list").remove();
		$(".p1").remove();

		// 알림 메세지
		toggleModal4();

		// 2초 뒤에 function 실행
		setTimeout(function() {
			location.href = "http://localhost:8080/kiosk/"
		}, 2000);
	} else {
		// ajax를 활용해 서버로 보낼 data를 만드는 반복문
		for (var i = 0; i < arrProduct.length; i++) {
			var count = dictProduct[arrProduct[i]];
			var price = arrPrice[i];
			if (dictChect[arrProduct[i]] == null) {
				payment_data[arrProduct[i]] = [ count, price ];
				dictCheck[arrProduct[i]] = 1;
			}
		}

		/* payment_data = JSON.stringify(payment_data); */

		console.log(payment_data);

		if (rsp == true) {
			// ajax를 활용하여 서버에 data를 post형식으로 보냄
			$.ajax({
				url : "http://localhost:8080/kiosk/insert.do",
				method : "POST",
				crossDomain : true,
				contentType : 'application/json;charset=UTF-8',
				data : JSON.stringify({
					payment_data : payment_data,
					take_out : take_out
				})
			}).done(function() {
				toggleModal();
				toggleModal2();

				// 결제 완료를 알리는 메세지. 2초 뒤에 function 실행
				setTimeout(function() {
					toggleModal3();
				}, 2000);

				// 4초 뒤에 function 실행
				setTimeout(function() {
					location.href = "http://localhost:8080/kiosk/"
				}, 4000);
			});
		} else {
			// 결제 실패시 메세지
			alert("결제를 처음부터 다시 진행해주세요");
		}
	}
});

$(".trigger2").click(function() {
	dictChect = {};
	var payment_data = {};
	if (arrProduct.length < 1) {
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
		setTimeout(function() {
			location.href = "http://localhost:8080/kiosk/"
		}, 2000);
	} else {
		// ajax를 활용해 서버로 보낼 data를 만드는 반복문
		for (var i = 0; i < arrProduct.length; i++) {
			var count = dictProduct[arrProduct[i]];
			var price = arrPrice[i];
			if (dictChect[arrProduct[i]] == null) {
				payment_data[arrProduct[i]] = [ count, price ];
				dictCheck[arrProduct[i]] = 1;
			}
		}

		/* payment_data = JSON.stringify(payment_data); */

		console.log(payment_data);

		if (rsp == true) {
			// ajax를 활용하여 서버에 data를 post형식으로 보냄
			$.ajax({
				url : "http://localhost:8080/kiosk/insert.do",
				method : "POST",
				crossDomain : true,
				contentType : 'application/json;charset=UTF-8',
				data : JSON.stringify({
					payment_data : payment_data,
					take_out : take_out
				})
			}).done(function() {

				// 결제 완료를 알리는 메세지. 2초 뒤에 function 실행
				setTimeout(function() {
					toggleModal3();
				}, 2000);

				// 4초 뒤에 function 실행
				setTimeout(function() {
					location.href = "http://localhost:8080/kiosk/"
				}, 4000);
			});
		} else {
			// 결제 실패시 메세지
			alert("결제를 처음부터 다시 진행해주세요");
		}
	}
});

// 상단 menu를 클릭했을 시 작동하는 function
$("#coffee, #juice, #icetea, #tea, #dessert").click(
		function() {
			// web에서 전송 가능한 json형식으로 타입 변환
			var temp = {
				"temp" : arrProduct
			};
			var temp2 = {
				"temp" : arrPrice
			};
			// click한 메뉴의 id값이 "coffee"라면
			if ($(this).attr("id") == "coffee") {
				// 다음 로직을 실행
				if (window.sessionStorage) {
					// 상품을 클릭하지 않았다면
					if (cnt == 0) {
						// null값 확인용 정보를 session에 저장
						sessionStorage.setItem("cnt", cnt);
						sessionStorage.setItem("take_out", JSON
								.stringify(take_out));
					}
					// 상품을 클릭했다면
					else {
						// 상품 구매 정보 등을 session에 저장
						sessionStorage.setItem("cnt", cnt);
						// JSON.stringify를 통해 String으로 타입을 변경 후 session에 저장
						// web에서 object를 주고받는 방식
						sessionStorage.setItem("arrProduct", JSON
								.stringify(temp));
						sessionStorage.setItem("arrPrice", JSON
								.stringify(temp2));
						sessionStorage.setItem("dictProduct", JSON
								.stringify(dictProduct));
						sessionStorage.setItem("take_out", JSON
								.stringify(take_out));
					}
				}
				// coffee 메뉴가 있는 페이지로 이동
				location.href = "http://localhost:8080/kiosk/coffee";
			}
			// click한 메뉴의 id값이 "juice"라면
			else if ($(this).attr("id") == "juice") {
				// 다음 로직을 실행
				if (window.sessionStorage) {
					// 상품을 클릭하지 않았다면
					if (cnt == 0) {
						// null값 확인용 정보를 session에 저장
						sessionStorage.setItem("cnt", cnt);
						sessionStorage.setItem("take_out", JSON
								.stringify(take_out));
					}
					// 상품을 클릭했다면
					else {
						// 상품 구매 정보 등을 session에 저장
						sessionStorage.setItem("cnt", cnt);
						// JSON.stringify를 통해 String으로 타입을 변경 후 session에 저장
						// web에서 object를 주고받는 방식
						sessionStorage.setItem("arrProduct", JSON
								.stringify(temp));
						sessionStorage.setItem("arrPrice", JSON
								.stringify(temp2));
						sessionStorage.setItem("dictProduct", JSON
								.stringify(dictProduct));
						sessionStorage.setItem("take_out", JSON
								.stringify(take_out));
					}
				}
				// juice 메뉴가 있는 페이지로 이동
				location.href = "http://localhost:8080/kiosk/juice";
			}
			// click한 메뉴의 id값이 "icetea"라면
			else if ($(this).attr("id") == "icetea") {
				// 다음 로직을 실행
				if (window.sessionStorage) {
					// 상품을 클릭하지 않았다면
					if (cnt == 0) {
						// null값 확인용 정보를 session에 저장
						sessionStorage.setItem("cnt", cnt);
						sessionStorage.setItem("take_out", JSON
								.stringify(take_out));
					}
					// 상품을 클릭했다면
					else {
						// 상품 구매 정보 등을 session에 저장
						sessionStorage.setItem("cnt", cnt);
						// JSON.stringify를 통해 String으로 타입을 변경 후 session에 저장
						// web에서 object를 주고받는 방식
						sessionStorage.setItem("arrProduct", JSON
								.stringify(temp));
						sessionStorage.setItem("arrPrice", JSON
								.stringify(temp2));
						sessionStorage.setItem("dictProduct", JSON
								.stringify(dictProduct));
						sessionStorage.setItem("take_out", JSON
								.stringify(take_out));
					}
				}
				// icetea 메뉴가 있는 페이지로 이동
				location.href = "http://localhost:8080/kiosk/icetea";
			}
			// click한 메뉴의 id값이 "tea"라면
			else if ($(this).attr("id") == "tea") {
				// 다음 로직을 실행
				if (window.sessionStorage) {
					// 상품을 클릭하지 않았다면
					if (cnt == 0) {
						// null값 확인용 정보를 session에 저장
						sessionStorage.setItem("cnt", cnt);
						sessionStorage.setItem("take_out", JSON
								.stringify(take_out));
					}
					// 상품을 클릭했다면
					else {
						// 상품 구매 정보 등을 session에 저장
						sessionStorage.setItem("cnt", cnt);
						// JSON.stringify를 통해 String으로 타입을 변경 후 session에 저장
						// web에서 object를 주고받는 방식
						sessionStorage.setItem("arrProduct", JSON
								.stringify(temp));
						sessionStorage.setItem("arrPrice", JSON
								.stringify(temp2));
						sessionStorage.setItem("dictProduct", JSON
								.stringify(dictProduct));
						sessionStorage.setItem("take_out", JSON
								.stringify(take_out));
					}
				}
				// tea 메뉴가 있는 페이지로 이동
				location.href = "http://localhost:8080/kiosk/tea";
			}
			// click한 메뉴의 id값이 "dessert"라면
			else {
				// 다음 로직을 실행
				if (window.sessionStorage) {
					// 상품을 클릭하지 않았다면
					if (cnt == 0) {
						// null값 확인용 정보를 session에 저장
						sessionStorage.setItem("cnt", cnt);
						sessionStorage.setItem("take_out", JSON
								.stringify(take_out));
					}
					// 상품을 클릭했다면
					else {
						// 상품 구매 정보 등을 session에 저장
						sessionStorage.setItem("cnt", cnt);
						// JSON.stringify를 통해 String으로 타입을 변경 후 session에 저장
						// web에서 object를 주고받는 방식
						sessionStorage.setItem("arrProduct", JSON
								.stringify(temp));
						sessionStorage.setItem("arrPrice", JSON
								.stringify(temp2));
						sessionStorage.setItem("dictProduct", JSON
								.stringify(dictProduct));
						sessionStorage.setItem("take_out", JSON
								.stringify(take_out));
					}
				}
				// dessert 메뉴가 있는 페이지로 이동
				location.href = "http://localhost:8080/kiosk/dessert";
			}
		});
