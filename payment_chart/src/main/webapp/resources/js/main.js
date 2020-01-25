$(".menuLink").click(function() {
	// 클릭이 되었는지 확인하는 알림(확인용)
	// alert("클릭되었습니다");
	// pic class 중에서 자기 자신의 인덱스를 반환
	idx = $(".menuLink").index(this);
	// 인덱스를 통해 상품명과 가격 정보를 가져옴
	var month = $(".menuLink").eq(idx).text();
	// console.log(month);
	$("#month").val(month);
	document.getElementById("hidden").submit();
});