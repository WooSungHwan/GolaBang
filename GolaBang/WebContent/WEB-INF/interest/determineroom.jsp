<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골라방</title>
<%@ include file="/inc/asset.jsp"%>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<style>
.demo-layout-transparent {
	/* background: url('images/dog01.jpg') center/cover; 배경 */
	
}

.demo-layout-transparent .mdl-layout__header, .demo-layout-transparent .mdl-layout__drawer-button
	{
	/* This background is dark, so we set text to white. Use 87% black instead if
     your background is light. */
	color: white;
}

i {
	color: black;
}

#title {
	width: 250px;
	height: 100px;
	margin: 10px auto;
}

#title>h2 {
	font-weight: bold;
}

#interest_big {
	width: 1500px;
	height: 700px;
	border: 0px solid red;
	margin: 0px auto;
}

.tab {
	overflow: hidden;
	border: 0px solid #ccc;
	background-color: white;
}

.tab button {
	background-color: white;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	width: 746px;
	float: left;
	color: #9E9E9E;
	border-bottom: 2px solid #9E9E9E;
}

.tab button:hover {
	color: black;
/* 	border-bottom: 2px solid black; */
}

.tab button.active {
	border-bottom: 2px solid black;
	color: black;
}

.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 0px solid #ccc;
	border-top: none;
	/* 	animation: fadeEffect 1s; */
}

/* @keyframes fadeEffect{ */
/* 	from{opacity: 0;} */
/* 	to{opacity: 1;} */
/* } */
.notice {
	font-size: 15px;
}

#notice {
	margin-top: 50px;
	margin-bottom: 40px;
	border: 0px solid blue;
}

#notice_left>span {
	color: brown;
}

#notice_right {
	margin-right: 10px;
	float: right;
	color: #9E9E9E;
}

#notice_jjim {
	border: 0px solid blue;
	margin-bottom: 40px;
}

#real {
	border: 0px solid tomato;
	width: 300px;
	height: 400px;
	padding: 0px;
	margin: 0px 25px 60px 25px;
	float: left;
	cursor: pointer;
}

#real:hover{
 	border: 1px solid #9E9E9E; 
}

#picture:hover {
	opacity: 0.8;
	transition: ease-in-out 0s;
}

#picture>img, #picture {
	width: 280px;
	height: 250px;
	margin: 0px auto;
	border-radius: 3px;
}

#picture_content {
	margin-left: 10px;
	margin-top: 20px;
	color: #9E9E9E;
}

#picture_content>h5 {
	font-weight: bold;
	margin: 5px 0px 5px 0px;
	color: black;
}

label {
	background-color: #FFAB40;
	color: white;
	font-weight: bold;
	border-radius: 5px;
}

#btnComp {
	margin-left: 1350px;
	margin-top: 0px;
}

#compare {
	display: none;
}

#compdiv{
	width: 1200px;
	margin: 50px auto;
}

#compOption{
	width: 1200px;
	margin: 20px auto;
}

#compTable{
	margin: 0px auto;
	border-spacing: 10px;
	border: 1px solid black;
	cell-spacing: 5px;
}



#OptionTable{
	margin: 0px auto;
	border-spacing: 10px;
	border: 0px solid black;
	cell-spacing: 5px;
}

.Option_th{
	width: 200px;
	font-weight: bold;
	color: #9E9E9E;
	text-align: center;
	font-size: 20px;
	padding-bottom: 5px;
}

#OptionTable tr th, #OptionTable tr td{
	border-bottom: 1px dotted #9E9E9E;
}

.compTable_th{
	width: 200px;
	font-weight: bold;
	color: #9E9E9E;
	text-align: center;
	font-size: 20px;
	padding-bottom: 20px;
}

.compTable_th + td, .compTable_th + td + td{
	width: 500px;
	text-align: center;
	font-size: 20px;
	padding: 5px;
}

.Option_th + td, .Option_th + td + td{
	width: 500px;
	text-align: center;
	font-sze: 20px;
	padding: 5px;
}

.compTable_th + td > img, .compTable_th + td + td > img{
	width: 400px;
	height: 300px;
}



</style>
<script>


	var data1;
	var data2;
	
	//
	var registerdate;
	var dealkind;
	var deposit;
	var monthly;
	var floor;
	var supplyarea;
	var admincost;
	var subject;
	var optionname;
	//
	
	$(document).ready(function() {

		document.getElementById("tab_left").click(); //화면이 로딩됬을때 최근본방이 선택된 화면을 보여줌

		
		
		$("div#real input[type=checkbox]").change(function() { //체크박스 2개 체크 확인여부 
			
			var cnt = 2;
			if (cnt == $("div#real input[type=checkbox]:checked").length) {
				$("div#real input[type=checkbox]:not(:checked)").attr("disabled", "disabled");
				$("#btnComp").attr("disabled",false);
			} else {
				$(":div#real input[type=checkbox]").removeAttr("disabled");
				$("#btnComp").attr("disabled",true);
			}

		}); //change

		
		//$(".cb").each(function(index, item) { //item -> 체크된 체크박스 이름
			
		//	if($(item).prop("checked")){ //체크박스가 체크된 상태일 때  -> 체크된 매물의 값을 가져와야함 -> 세션에 있는 값을 불러오기
// 				console.log($(item))
			

		///	}
			
			
		//});	
		
		
		$("#btnComp").click(function() { //비교하기 버튼 눌렀을 때
		
			$("#recent").hide(); // 찜한방 내용 숨기기
			
			//1. checkbox
			//2. ajax
			//3. output
			var list = [];
			var seq1;
			var seq2;
			
			$(".cb").each(function(index, item){ //체크된 체크박스를 찾아서
				
			
				if($(item).prop("checked")){ //체크박스가 체크됬을 때
					list.push($(item).val()); //임의의 list 배열 변수에 체크박스의 value값 넣기
					seq1 = list[0];
					seq2 = list[1];
					
				}
			
		
				
				
			});
			

			$.ajax({
				type: "get",
				url: "/GolaBang/tenant/determineroom_data.do",
				data: "seq1=" + seq1 + "&seq2=" + seq2, //2, 490
				dataType: "json",
				success: function(result){
					
// 					alert(result[0]) //interestDTO
// 					alert(result[1]) //OptionDTO

					//console.log(result);
					
					var leftNo = result[0][0].itemseq;
					var rightNo = result[0][1].itemseq;

					//alert(result[0]);
					
					
					$("#compare").show();
					
					$("#compdiv").html("");
					
					
					var tr = "";	
					
					tr = "<tr><th class='compTable_th mdl-data-table__cell--non-numeric'></th><td style='text-align: center; font-weight: bold; color: brown;'>" + result[0][0].registerdate +"</td><td style='text-align: center; font-weight: bold; color: brown;'>" + result[0][1].registerdate +"</td></tr><tr><th class='compTable_th mdl-data-table__cell--non-numeric'>매물</th><td><img src='/GolaBang/images/golabang3.jpg'></td><td><img src='/GolaBang/images/golabang4.jpg'></td></tr><tr><th class='compTable_th mdl-data-table__cell--non-numeric'>건물유형</th><td>" + result[0][0].kind + "</td><td>" + result[0][1].kind + "</td></tr><tr><th class='compTable_th mdl-data-table__cell--non-numeric'>보증금/월세</th><td>" + result[0][0].deposit + "/" + result[0][0].monthly + "</td><td>" + result[0][1].deposit + "/" + result[0][1].monthly + "</td></tr><tr><th class='compTable_th mdl-data-table__cell--non-numeric'>전용면적</th><td>" + result[0][0].supplyarea + "㎡</td><td>" + result[0][1].supplyarea + "㎡</td></tr>";
						
						
					$("#compdiv").append(tr);
					
			
					
				
					
					 
					 
					 $(result[1]).each(function(index, item) {
						 //item = option
						 if (item.itemseq == leftNo) {
							 if (item.optionname == "신발장" && item.quantity == 1) {
								 $("#shoes_left").text("O");
							 }else if(item.optionname == "냉장고" && item.quantity == 1){
								 $("#ref_left").text("O");
							 }else if(item.optionname == "전자레인지" && item.quantity == 1){
								 $("#micro_left").text("O");
							 }else if(item.optionname == "에어컨" && item.quantity == 1){
								 $("#air_left").text("O");
							 }else if(item.optionname == "전자도어락" && item.quantity == 1){
								 $("#door_left").text("O");
							 }else if(item.optionname == "TV" && item.quantity == 1){
								 $("#tv_left").text("O");
							 }else if(item.optionname == "세탁기" && item.quantity == 1){
								 $("#washer_left").text("O");
							 }
						 } else if (item.itemseq == rightNo) {
							 if (item.optionname == "신발장" && item.quantity == 1) {
								 $("#shoes_right").text("O");
							 }else if(item.optionname == "냉장고" && item.quantity == 1){
								 $("#ref_right").text("O");
							 }else if(item.optionname == "전자레인지" && item.quantity == 1){
								 $("#micro_right").text("O");
							 }else if(item.optionname == "에어컨" && item.quantity == 1){
								 $("#air_right").text("O");
							 }else if(item.optionname == "전자도어락" && item.quantity == 1){
								 $("#door_right").text("O");
							 }else if(item.optionname == "TV" && item.quantity == 1){
								 $("#tv_right").text("O");
							 }else if(item.optionname == "세탁기" && item.quantity == 1){
								 $("#washer_right").text("O");
							 }
						 }
					 });
					
				
					
// 					tr = "<tr><th class='Option_th'>냉장고</th><td id='ref_left'>X</td><td id='ref_right'>X</td></tr><tr><th class='Option_th'>전자레인지</th><td id='micro_left'>X</td><td id='micro_right'>X</td></tr><tr><th class='Option_th'>에어컨</th><td id='air_left'>X</td><td id='air_right'>X</td></tr><tr><th class='Option_th'>신발장</th><td id='shoes_left'>X</td><td id='tdshoes_rightright'>X</td></tr>";
					
				
					
					
					
				
					
					
						
					
					
				},
				error: function(a, b, c){
					console.log(a, b, c);
				}
			});
			



		});

	});

	function openRoom(evt, roomName) { // 탭 함수
		var i, tabcontent, tablinks;

		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}

		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}

		document.getElementById(roomName).style.display = "block";
		evt.currentTarget.className += " active";

	}
</script>
</head>
<body>
	<!-- determineroom.jsp -->
	<div class="demo-layout-transparent mdl-layout mdl-js-layout">

		<!-- header -->
		<jsp:include page="/inc/header.jsp"></jsp:include>


		<main class="mdl-layout__content">

		<div>
			<div id="title">
				<h2>관심목록</h2>
			</div>
			<div id="interest_big">
				<div class="tab">
					<button id="tab_left" class="tablinks"
						onclick="openRoom(event, 'determine')" autofocus>
						<h5 style="font-weight: bold;">최근 본 방</h5>
					</button>
					<button id="tab_right" class="tablinks"
						onclick="openRoom(event, 'recent')">
						<h5 style="font-weight: bold;">찜한방</h5>
					</button>
				</div>

				<div id="determine" class="tabcontent">
					<div id="notice">
						<span class="notice" id="notice_left">총 <span>${list.size()}개</span>의 최근 본 방이 있습니다.</span>
							<span class="notice" id="notice_right">최근 본 방은 최대 50개까지 저장됩니다.</span>
					</div>
					<c:forEach items="${list}" var="dto">
						<div style="border: 0px solid #9E9E9E; margin-top: 10px;" id="real" onclick="location.href='/GolaBang/item/itemlocation.do?itemseq=${dto.itemseq}'">
							<!-- border 지울것 -->
							<div id="picture"
								style="border: 0px solid blue; margin-top: 10px; padding: 0px;">
								<img src="/GolaBang/images/golabang1.png">
							</div>
							<div id="picture_content">
								<div>${dto.kind}</div>
								<h5>${dto.dealkind}${dto.deposit}/${dto.monthly}</h5>
								<div>${dto.floor},${dto.supplyarea}㎡, 관리비 ${dto.admincost}</div>
								<div>${dto.subject}</div>
							</div>
						</div>
					</c:forEach>
				</div>


				<div id="recent" class="tabcontent">
					<div id="notice">
						<span class="notice" id="notice_left">총 <span>${interest.size()}개</span>의
							찜한 방이 있습니다.
						</span>
					</div>
					<input type="button" id="btnComp"
						class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"
						value="방 비교하기" disabled="true">
					<div id="list">
						<c:forEach items="${interest}" var="interest" varStatus="status">
							<div style="border: 0px solid red; margin-top: 10px;" id="real">
								<div>
									<input type="checkbox" id="check${status.count}" class="cb"
										style="width: 15px; height: 15px;" value="${interest.itemseq}"><label for="check">확인매물
										${interest.registerdate}</label>
										
								</div>
								<div id="picture"
									style="border: 0px solid blue; margin-top: 10px; padding: 0px;">
									<img src="/GolaBang/images/golabang2.jpg">
								</div>
								<div id="picture_content">
									<div>${interest.registerdate}</div>
									<h5>${interest.dealkind}
										${interest.deposit}/${interest.monthly}</h5>
									<div>${interest.floor},${interest.supplyarea}㎡, 관리비
										${interest.admincost}</div> 
									<div>${interest.subject}<span style="display: none">${interest.optionname}</span></div>
								</div>
							</div>
						</c:forEach>
					</div>
					
				</div>
				
				
			
				
				
				
				
				
				
				
				
				
				
				
				<div id="compare" class="tabcontent">
					<div id="compare_title">
						<h3 style="font-weight: bold; margin: 50px 0px 0px 10px;">방 비교하기</h3>
					</div>
					<div id="compdiv">
						<table id="compTable">
							
						</table>
					</div>
					
					<div id="compOption">
						<div style="font-size: 30px; text-align: left; margin-bottom:20px; font-weight: bold;">추가 옵션</div>
						<table id="OptionTable">
						<tr>
								<th class="Option_th">냉장고</th>
								<td id="ref_left">X</td>
								<td id="ref_right">X</td>
							</tr>
							<tr>
								<th class="Option_th">전자레인지</th>
								<td id="micro_left">X</td>
								<td id="micro_right">X</td>
							</tr>
							<tr>
								<th class="Option_th">에어컨</th>
								<td id="air_left">X</td>
								<td id="air_right">X</td>
							</tr>
							<tr>
								<th class="Option_th">신발장</th>
								<td id="shoes_left">X</td>
								<td id="shoes_right">X</td>
								
							</tr>
							<tr>
								<th class="Option_th">전자도어락</th>
								<td id="door_left">X</td>
								<td id="door_right">X</td>
								
							</tr>
							<tr>
								<th class="Option_th">TV</th>
								<td id="tv_left">X</td>
								<td id="tv_right">X</td>
								
							</tr>
							<tr>
								<th class="Option_th">세탁기</th>
								<td id="washer_left">X</td>
								<td id="washer_right">X</td>
								
							</tr>
						</table>
					</div>
				</div>	
			</div>
		</div>

		</main>


		<!-- footer -->
		<%-- <jsp:include page="/inc/footer.jsp"></jsp:include> --%>

	</div>
</body>
</html>