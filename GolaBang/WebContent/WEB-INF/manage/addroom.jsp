<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6044ed3fb1b6ba23f4fd59f7a2dfbb1f&libraries=services"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@ include file="/inc/asset.jsp"%>
<link rel="stylesheet" href="/GolaBang/asset/css/buttonStyle.css" />
<style>

html, body {
    font-family: "Helvetica","Arial",sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 34px;
}

#title{
   width: 230px;
   height: 100px;
   margin: 10px auto;
   text-align:center;
}
#naverLogin{
	width:49%;
	height:36px;
	color:white;
	background:#1DC700;
	font-size:12px;
	font-weight:bold;
}
#naverLogin:hover{
	cursor:pointer;
}
#kakaoLogin{
	width:49%; height:36px;
	color:#795548;
	background:#FFEB00;
	font-size:12px;
	font-weight:bold;
}
.close:hover{
	cursor:pointer;
}
#interest_big{
   width: 1500px;
   min-height: 700px;
   margin: 0px auto;
}

.tblInput{
	margin:40px auto 20px auto; 
	border:1px solid #A9A9A9; 
	width:80%;
}

.tblInput thead th{	
	text-align:center; 
	width:150px;
	color:black;
	border:1px solid #A9A9A9;
	/* background:#795548; */
}
.tblInput tr{
	border:1px solid black;
}
.tblInput td{
	
}

.tblInput tbody th{
	background:#eee;
	width:100px;
}

table th{
	border-collapse: collapse;
}
#deposit_monthly{
	display:none;
}
/* 사진업로드 */
#after{
	width:98%;
	min-height:300px;
	display:none;
}
#addpic:hover{
	cursor:pointer;
}
.addpic{
	float:left;
	width:150px;
	margin:10px 5px;
}
</style>
<script>
var date = new Date();
var today;
var selectedAddress; //선택된 주소

var pic =1; //input file갯수

/* 입력값들 */
var room = document.getElementsByName('room'); //라디오
var building = document.getElementsByName('building'); //라디오
var inputAddress = selectedAddress + $("#detailaddress").val(); //문자열
var deal_type = document.getElementsByName("deal_type"); //라디오
var deposit = document.getElementById("deposit"); //문자열
var monthly = document.getElementById("monthly"); //문자열
var supply_pyeong = document.getElementById("supply_pyeong"); //문자열
var public_pyeong = document.getElementById("public_pyeong"); //문자열
var buildFloor = document.getElementById("buildingFloor");  //문자열
var myFloor= document.getElementById("myFloor"); //문자열
var heating_type = document.getElementById("heating_type"); //문자열
var movedate = document.getElementById("movedate"); //날짜문자열
var admincost = document.getElementsByName("admincost"); //라디오
var elevator = document.getElementsByName("elevator");//라디오
var builtin = document.getElementsByName("builtin");//라디오
var pet = document.getElementsByName("pet"); //라디오
var parking = document.getElementsByName("parking");//라디오
var valcony = document.getElementsByName("valcony");//라디오
var optionList = document.getElementsByName("optionList");//체크박스
var detail_title = document.getElementById("detail_title");  //상세설명 제목
var detail_content = document.getElementById("detail_content"); //상세설명 내용
var detail_privatememo = document.getElementById("detail_privatememo"); //상세설명 비공개메모



	$(document).ready(function() {
		var txt = "\r\n\r\n상세설명 작성 주의사항\r\n \r\n"
		txt+="\r\n\r\n- 방 정보와 관련없는 홍보성 정보는 입력하실 수 없습니다.\r\n";
		txt+="- 중개수수료를 언급한 내용은 입력할 수 없습니다.\r\n\r\n\r\n";
		txt+="*주의사항 위반시 허위매물로 간주되어 매물 삭제 및 이용의 제한이 있을 수 있습니다.";
		$("#detail_content").attr("placeholder",txt);
		
		txt = "\r\n\r\n - 사진은 가로로 찍은 사진을 권장합니다.(가로사이즈 최소 800px)\r\n\r\n";
		txt+= " - 사진의 용량은 사진 한 장당 10MB까지 등록이 가능합니다.\r\n\r\n";
		txt+= " - 사진은 최소 3장 이상 등록해야 하며, 최대 15장까지 권장합니다. 그 이상 등록할 경우 업로드 시간이 다소 지연될 수 있습니다.";
		$("#pic_textarea").attr("placeholder",txt);
		
		today = date.getFullYear()+"-";
		today += date.getMonth()+1+"-";
		today += date.getDate();
		$("#movedate").val(today);
		$("#movedate").attr("min",today);
		
		var dialog = document.querySelector('dialog');
		var joinlogin = document.querySelector('#joinlogin');
		if (!dialog.showModal) {
			dialogPolyfill.registerDialog(dialog);
		}

		if (joinlogin != null) {
			joinlogin.addEventListener('click', function() {
				dialog.showModal();
			});
		}

		dialog.querySelector('.close').addEventListener('click', function() {
			dialog.close();
		});

		$("#submit").on("click", function() {
			$.ajax({
				type : "post",
				url : "/GolaBang/login.do",
				data : $("#loginForm").serialize(),
				dataType : "json",
				success : function(result) {
					if (result.result == 1 || result.result == 2) {
						location.href = "/GolaBang/mainpage.do";
					} else if (result.result == 0) {
						alert("아이디 혹은 비밀번호가 맞지 않습니다.");
						$("#pw").val("");
						$("#email").val("");
						$("#email").focus();
					}
				},
				error : function(a, b, c) {
					console.log(a, b, c);
				}
			});
		});//#submit
		$("#pw").keyup(function(){
			if(event.keyCode==13){
				document.getElementById("submit").click();
			}
		});
		
		
		for(var i =1; i<=50; i++){
			$("#buildingFloor").append("<option value="+i+"층>"+i+"층</option>")			
		}
		for(var i =1; i<=50; i++){
			$("#myFloor").append("<option value="+i+"층>"+i+"층</option>")			
		}
		
		$("#supply_pyeong").keyup(function(){
			$("#supply_m2").val(($("#supply_pyeong").val()*3.3));
			
		});
		
		$("#public_pyeong").keyup(function(){
			$("#public_m2").val(($("#public_pyeong").val()*3.3));
		});
		
		$("#month").click(function(){
			$("#deposit_monthly").show();
		});
		
		$("#complete").on("click",function(){
			//보내기
			if(confirm("등록하시겠습니까?")){
				
			}else{
				
			}
		});
		
		
		/* 사진업로드 */
		$("#pic_add").click(function(){
			$("#before").children().hide();
			$("#after").show();
			var txt = "<div><input type='file' id='attach"+pic+"' name='attach"+pic+"'/>";
			txt+="<input type=\"button\" onclick='del(this);' value='삭제' /><input type=\"button\" value='수정' onclick='edit(\"attach"+pic+"\");'/></div>";
			$("#after").append(txt);
			$("#pic_add").hide();
			$("#attach"+pic).click();
			pic++;
		});
		
		
	});//ready
	function add(){
		var txt = "<div><input type='file' id='attach"+pic+"' name='attach"+pic+"'/>";
		txt+="<input type=\"button\" onclick='del(this);' value='삭제' /><input type=\"button\" value='수정' onclick='edit(\"attach"+pic+"\");'/></div>";
		$("#after").append(txt);
		$("#attach"+pic).click();
		pic++;
	}
	function edit(attach){ //수정 메소드
		$("#"+attach).click();
	}
	function del(delbtn){ //삭제 메소드
		
		$(delbtn).parent().remove();
		if($("#after").children().length==2){
			$("#after").hide();
			$("#before").children().show();
			$("#pic_add").show();
		}
	};
	
	function search_address() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				if (roadAddr != "") {
					document.getElementById("realaddress").innerText="선택된 주소 : " +roadAddr;
					selectedAddress = roadAddr;
					
				} else if (data.jibunAddress != "") {
					document.getElementById("realaddress").innerText="선택된 주소 : " +data.jibunAddress;
					selectedAddress=data.jibunAddress;
				}
				
				
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				
				
				
				mapOption = {
					center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};
				// 지도를 생성합니다    
				var map = new daum.maps.Map(mapContainer, mapOption);
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new daum.maps.services.Geocoder();
				// 주소로 좌표를 검색합니다
				if(selectedAddress!=null){
					geocoder.addressSearch(selectedAddress, function(result, status) {

					    // 정상적으로 검색이 완료됐으면 
					     if (status === daum.maps.services.Status.OK) {

					        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new daum.maps.Marker({
					            map: map,
					            position: coords
					        });

					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new daum.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0;">선택된 위치</div>'
					        });
					        infowindow.open(map, marker);

					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					});
				}
			}
		}).open();
		/* $("#detailaddress").focus(); */
		document.getElementById("detailaddress").focus();
	}
</script>
</head>
<body>
	<div class="demo-layout-transparent mdl-layout mdl-js-layout">

		<main class="mdl-layout__content">

		<!-- header -->
		<jsp:include page="/inc/header.jsp"></jsp:include>

		
			<div>
				<!-- 컨텐츠 넣을 곳 -->
				<div id="title">
					<h2>방 내놓기</h2>
				</div>
				
				<div id="interest_big">
				
				<div style="width:80%; margin:0 auto; border:1px solid #ddd; border-radius:10px;">
						<ul>
							<li>등록한 매물은 30일동안 노출됩니다.</li>
							<li>일반 회원은 1개의 매물만 내놓을 수 있고, 직거래로 표시됩니다.</li>
						</ul>
					</div>
					<form method="post" action="/GolaBang/manage/AddRoomOk.do" id="roomForm" enctype="multipart/data-form">
					<table class="tblInput" >
						<thead>
							<tr>
								<th class="" colspan="4"><h4><b>매물 종류</b></h4></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th><b>종류 선택</b></th>
							 	<td colspan="3"> 
							 		<div class="container">
								 		<div class="button-wrap">
								 		
											<input class="hidden radio-label" type="radio" name="room" id="one" checked="checked" value="원룸"/>
											<label class="button-label" for="one"><h4>원룸</h4></label> 
										
											<input class="hidden radio-label" type="radio" name="room" id="two" value="투룸"/>
											<label class="button-label" for="two"><h4>투룸</h4></label>
											
											<input class="hidden radio-label" type="radio" name="room" id="three" value="쓰리룸"/>
											<label class="button-label" for="three"><h4>쓰리룸</h4></label>
											
											<input class="hidden radio-label" type="radio" name="room" id="apart" value="아파트"/>
											<label class="button-label" for="apart"><h4>아파트</h4></label>
											
											<input class="hidden radio-label" type="radio" name="room" id="opistel" value="오피스텔"/>
											<label class="button-label" for="opistel"><h4>오피스텔</h4></label>
											
											<div style="clear:both;"></div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th><b>건물 유형</b></th>
								<td colspan="3"  style="text-align:left">
									
									<div class="container">
										<div class="button-wrap">
											<input class="hidden radio-label" type="radio" name="building" id="dan" checked="checked" value="단독주택" />
											<label class="button-label" for="dan"><h4>단독주택</h4></label>
											
											<input class="hidden radio-label" type="radio" name="building" id="dagagu" value="다가구주택"/>
											<label class="button-label" for="dagagu"><h4>다가구주택</h4></label>
											
											<input class="hidden radio-label" type="radio" name="building" id="builla" value="빌라/연립/다세대"/>
											<label class="button-label" for="builla"><h4 style="margin:0 10px; height:72px;">빌라/연립/다세대</h4></label>
											
											<input class="hidden radio-label" type="radio" name="building" id="sangga" value="상가"/>
											<label class="button-label" for="sangga"><h4>상가</h4></label>
											<div style="clear:both;"></div>
										</div>
									</div>
								</td>
							</tr>
	
						</tbody>
					</table>
					
					<table class="tblInput">
						<thead>
							<tr>
								<th colspan="4"><h4><b>위치 정보</b></h4></th>
							</tr>
						</thead>
							<tr>
								<th><b>주소 입력</b></th>
								<td>
									<div>
										<span><i class="material-icons" style="color:#A9A9A9;">info</i>도로명, 건물명, 지번에 대해 통합검색이 가능합니다.</span>
										<input type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btnAddress" onclick="search_address();" value="주소 검색">
									</div>									
									<div>
										<div id="realaddress" style="width:444px; height:200px; border:1px solid #A9A9A9; margin-top:20px">
											
										</div>
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
											<input class="mdl-textfield__input" name="detailaddress" type="text" id="detailaddress">
											<label class="mdl-textfield__label" style="margin-top:-5px;" for="detailaddress">상세주소를 입력하세요</label>
										</div>
									</div>
								</td>
								<td>
									<div id="map" style="width:500px;border:1px solid #A9A9A9; height:300px;">
										<div style="margin:120px;"></div>
										<p style="text-align:center; color:#A9A9A9;">주소 검색을 하시면<br>해당 위치가 지도에 표시됩니다.</p>
									</div>

								</td>
							</tr>
							
					</table>
					
					<table class="tblInput">
						<thead>
							<tr>
								<th colspan="2"><h4><b>거래 정보</b></h4></th>
							</tr>
						</thead>
							<tr>
								<th><b>거래 종류</b></th>
								<td>
									<div class="container">
										<div class="button-wrap">
											<input class="hidden radio-label" type="radio" name="deal_type" id="month" value="월세" checked="checked"/>
											<label class="button-label" for="month"><h4>월세</h4></label>
											
											<input class="hidden radio-label" type="radio" name="deal_type" id="all" value="전세"/>
											<label class="button-label" for="all"><h4>전세</h4></label>
											<div style="clear:both;"></div>
											<div id="deposit_monthly">
												<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="float:left;">
													<input class="mdl-textfield__input" type="text" id="deposit">
													<label class="mdl-textfield__label" for="deposit" style="margin-top:-10px;">보증금을 입력해주세요.</label>
												</div>
												<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="float:left;">
													<input class="mdl-textfield__input" type="text" id="monthly">
													<label class="mdl-textfield__label" for="monthly" style="margin-top:-10px;">월세를 입력해주세요.</label>
												</div>	
											</div>
											
											
										<div style="clear:both;"></div>
									</div>
									</div>
								</td>
							</tr>
					</table>
					
					<table class="tblInput" style="margin:40px auto 20px auto;width:80%;">
						<thead>
							<tr>
								<th colspan="6"><h4><b>기본 정보</b></h4></th>
							</tr>
						</thead>
						<tr>
							<th rowspan="2">
								<div><b>건물크기<br>(1P=3.3058m<sup>2</sup>)</b></div>
							</th>
								<td colspan="2" >								
									<label style="">평</label>
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									    <input class="mdl-textfield__input" type="number" id="supply_pyeong" >
										<label class="mdl-textfield__label" tabindex="1" style="margin-top:-10px;" for="supply_pyeong">공급면적(평)을 입력하세요</label>
									</div>
									
									<input type="text" id="supply_m2" readonly/>m<sup>2</sup>
								</td>
							<th rowspan="2"><b>건물 층수</b></th>
							<td colspan="2">건물 층수 <select id="buildingFloor" name="buildingFloor"><option>건물 층수 선택</option></select></td>
						</tr>
						<tr>
							<td colspan="2" >
								<label style="">평</label>
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									    <input class="mdl-textfield__input" type="number" id="public_pyeong" >
										<label class="mdl-textfield__label" tabindex="2" style="margin-top:-10px;" for="public_pyeong">전용면적(평)을 입력하세요</label>
										
									</div>
									
									<input type="number" id="public_m2" style="text-align:right;" readonly/>m<sup>2</sup>
							</td>
							<td colspan="2">해당 층수<select id="myFloor" name="myFloor"><option>건물 층수 선택</option></select>
							</td>
						</tr>
						<tr>
							<th><b>난방 종류</b></th>
							<td>
								<select name="heating_type" id="heating_type">
									<option>난방 종류 선택</option>
									<option value="중앙난방">중앙난방</option>
									<option value="개별난방">개별난방</option>
									<option value="지역난방">지역난방</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><b>입주 가능일</b></th>
							<td>
								<input type="date" min="${today}" id="movedate"/>
							</td>
						</tr>
					</table>
					<table class="tblInput">
						<thead>
							<tr>
								<th colspan="6"><h4><b>추가 정보</b></h4></th>
							</tr>
						</thead>
						<tr>
							<th><b>관리비</b></th>
							<td colspan="6">
								
								<div class="container">
									<div class="button-wrap">
									<input class="hidden radio-label" type="radio" name="admincost" id="no_admincost" value="0" checked="checked"/>
									<label class="button-label" for="no_admincost"><h4>없음</h4></label>
									
									<input class="hidden radio-label" type="radio" name="admincost" id="yes_admincost" value="1"/>
									<label class="button-label" for="yes_admincost"><h4>있음</h4></label>
									<div style="clear:both;"></div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th><b>주차 여부</b></th>
							<td colspan="3">
								<div class="container">
									<div class="button-wrap	">
										<input class="hidden radio-label" type="radio" name="parking" id="no_parking" value="0" checked="checked"/>
										<label class="button-label" for="no_parking"><h4>없음</h4></label>
										
										<input class="hidden radio-label" type="radio" name="parking" id="yes_parking" value="1"/>
										<label class="button-label" for="yes_parking"><h4>있음</h4></label>
										<div style="clear:both;"></div>
									</div>
								</div>
							</td>
							<th><b>반려 동물</b></th>
							<td colspan="3">
								<div class="container">
									<div class="button-wrap	">
										<input class="hidden radio-label" type="radio" name="pet" id="no_pet" value="0" checked="checked"/>
										<label class="button-label" for="no_pet"><h4>없음</h4></label>
										
										<input class="hidden radio-label" type="radio" name="pet" id="yes_pet" value="1"/>
										<label class="button-label" for="yes_pet"><h4>있음</h4></label>
										<div style="clear:both;"></div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th><b>엘리베이터</b></th>
							<td colspan="3">
								<div class="container">
									<div class="button-wrap	">
										<input class="hidden radio-label" type="radio" name="elevator" id="no_elevator" value="0" checked="checked"/>
										<label class="button-label" for="no_elevator"><h4>없음</h4></label>
										
										<input class="hidden radio-label" type="radio" name="elevator" id="yes_elevator" value="1"/>
										<label class="button-label" for="yes_elevator"><h4>있음</h4></label>
										<div style="clear:both;"></div>
									</div>
								</div>
							</td>
							<th><b>베란다/발코니</b></th>
							<td colspan="3">
								<div class="container">
									<div class="button-wrap	">
										<input class="hidden radio-label" type="radio" name="valcony" id="no_valcony" value="0" checked="checked"/>
										<label class="button-label" for="no_valcony"><h4>없음</h4></label>
										
										<input class="hidden radio-label" type="radio" name="valcony" id="yes_valcony" value="1"/>
										<label class="button-label" for="yes_valcony"><h4>있음</h4></label>
										<div style="clear:both;"></div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th><b>빌트인</b></th>
							<td colspan="6">
								<div class="container">
									<div class="button-wrap	">
										<input class="hidden radio-label" type="radio" name="builtin" id="no_builtin" value="0" checked="checked"/>
										<label class="button-label" for="no_builtin"><h4>없음</h4></label>
										
										<input class="hidden radio-label" type="radio" name="builtin" id="yes_builtin" value="1"/>
										<label class="button-label" for="yes_builtin"><h4>있음</h4></label>
										<div style="clear:both;"></div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th><b>옵션 항목</b></th>
							<td colspan="6">
								<div class="container">
									<div class="button-wrap" id="optionlist">
										<input class="hidden optionlist button-label" type="checkbox" name="optionList" id="option_air"  />
										<label class="button-label" for="option_air"><h4>에어컨</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" name="optionList" id="option_washer"  />
										<label class="button-label" for="option_washer"><h4>세탁기</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" name="optionList" id="option_bed" />
										<label class="button-label" for="option_bed"><h4>침대</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" name="optionList" id="option_desk"  />
										<label class="button-label" for="option_desk"><h4>책상</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" name="optionList" id="option_closet"  />
										<label class="button-label" for="option_closet"><h4>옷장</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" name="optionList" id="option_TV"  />
										<label class="button-label" for="option_TV"><h4>TV</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" name="optionList" id="option_shoes" />
										<label class="button-label" for="option_shoes"><h4>신발장</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" name="optionList" id="option_refrigerator"  />
										<label class="button-label" for="option_refrigerator"><h4>냉장고</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" name="optionList" id="option_gasrange" />
										<label class="button-label" for="option_gasrange"><h4>가스레인지</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" name="optionList" id="option_induction" />
										<label class="button-label" for="option_induction"><h4>인덕션</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" name="optionList" id="option_microwave"  />
										<label class="button-label" for="option_microwave"><h4>전자레인지</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" name="optionList" id="option_doorlock"  />
										<label class="button-label" for="option_doorlock"><h4>전자도어락</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" name="optionList" id="option_bidet" />
										<label class="button-label" for="option_bidet"><h4>비데</h4></label>
										<div style="clear:both;"></div>
									</div>
								</div>
							</td>
						</tr>
					</table>
					
					<table class="tblInput">
						<thead>
							<tr>
								<th colspan="6"><h4><b>상세 설명</b></h4></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th><b>제목</b></th>
								<td colspan="5">
									<input type="text" id="detail_title" style="width:100%; height:50px; border:1px solid #A9A9A9; vertical-align: middle; padding-left:10px;" 
									placeholder="예) 역삼역 도보 5분거리, 혼자 살기 좋은 조용한 방입니다.">
										
								</td>
							</tr>
							<tr>
								<th><b>상세 설명</b></th>
								<td colspan="5">
									<textarea id="detail_content" style="width:100%; resize:none; height:300px; border:1px solid #A9A9A9; vertical-align: middle; padding-left:10px;"></textarea>
								</td>
							</tr>
							<tr>
								<th><b>상세 설명</b></th>
								<td colspan="5">
									<input type="text" id="detail_privatememo" placeholder="외부에 공개되지 않으며, 등록자에게만 보이는 메모입니다."
									 style="width:100%;height:50px; border:1px solid #A9A9A9; vertical-align: middle; padding-left:10px;" />
								</td>
							</tr>
						</tbody>
					</table>
					<table class="tblInput">
						<thead>
							<tr>
								<th><h4><b>사진 등록</b></h4></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<textarea id="pic_textarea"cols="164" rows="10" style="margin:10px ; resize:none;" readonly></textarea>
								</td>
							</tr>
							<tr id="addpic">
								
							</tr>
							<tr>
								<td>
									<div style="width:98%; height:300px; margin:0 auto; background:#eee; vertical-align: middle; text-align:center;">
										<div id="before">
											<i class="material-icons" style="font-size:36px; color:gray;margin-top:40px;">add_a_photo</i>
											<p>실 사진 최소 3장이상 등록 하셔야 하며, 가로사진을 권장합니다.</p>
											<p style="color:red;">불필요한 정보(워터마크,상호,전화번호 등)가 있는 매물은 비공개처리됩니다.</p>
										</div>
										<div id="after" style=" border:1px solid black; ">
											<!-- <img class="addpic" src="/GolaBang/images/dabang.jpg"/> -->
											
											<input type="button" class="addpic" onclick="add();" id="addpic" style="background:#A9A9A9;" value="사진 추가하기">
											<div style="clear:both;"></div>
										</div>
										<div id="file">
											<input type="button" id="pic_add" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" value="사진 추가" style="margin-top:40px;">
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div style="width:500px; margin:0 auto;">
					 
					<input type="checkbox" id="addRoomCheck" style=""> 
					<label for="addRoomCheck">매물 관련 규정을 확인하였으며, 입력한 정보는 실제와 다름이 없습니다.</label>
					
				</div>
				<div style="width:220px; margin:0 auto;">					
					<button class="mdl-button mdl-js-button mdl-button--raised" style="margin-top:40px; margin-right:20px;">등록 취소</button>
					<button id="complete" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" style="margin-top:40px;">매물 등록</button>
				</div>
				</form>
			</div>
			</div>
			
		<!-- footer -->
		<jsp:include page="/inc/footer.jsp"></jsp:include>


		</main>
	</div>
</body>
</html>