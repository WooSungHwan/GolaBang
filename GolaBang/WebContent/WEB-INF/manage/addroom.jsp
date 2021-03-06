<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골라방 - 매물 등록하기</title>
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
#deposit_all{
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
	height:100px;
	margin-top:36px;
	margin-left:10px;
}
.refresh{
	position:relative; 
	top:127px;
	left:60px;
}
.cancel{
	position:relative; 
	top:19px;
	left:87px;
}
.pic{
	width:150px;
	height:100px;
}
.box{
	float:left;
	width:170px;
	height:100px;
}
</style>
<script>
var date = new Date();
var today;
var selectedAddress; //선택된 주소

var pic =0; //input file갯수

/* 입력값들 */
var room = document.getElementsByName('room'); //라디오 name
var building = document.getElementsByName('building'); //라디오 name
var inputAddress = selectedAddress+"" + $("#detailaddress").val(); //문자열  name = selectedAddress
var deal_type = document.getElementsByName("deal_type"); //라디오 name deal_type
var deposit = document.getElementById("deposit"); //문자열 name deposit
var monthly = document.getElementById("monthly"); //문자열  name monthly
var supply_pyeong = document.getElementById("supply_pyeong"); //문자열 name supply_pyeong
var public_pyeong = document.getElementById("public_pyeong"); //문자열 name public_pyeong
var buildFloor = document.getElementById("buildingFloor");  //문자열 name buildingFloor
var myFloor= document.getElementById("myFloor"); //문자열 			name myFloor
var heating_type = document.getElementById("heating_type"); //문자열  name heating_type
var movedate = document.getElementById("movedate"); //날짜문자열 name movedate
var admincost = document.getElementsByName("admincost"); //라디오 name admincost
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
		
		
		
		$("#complete").on("click",function(){
			
			//보내기
			if(confirm("등록하시겠습니까?")){
				$("#roomForm").submit();
			}else{
				
			} 
		});
		
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
			$("#supply_m2").val((parseFloat($("#supply_pyeong").val()*3.3)).toFixed(2));
			
		});
		
		$("#public_pyeong").keyup(function(){
			$("#public_m2").val((parseFloat($("#public_pyeong").val()*3.3)).toFixed(2));
		});
		
		$("#month").click(function(){
			$("#deposit").show();
			$("#monthly").parent().show();
			$("#deposit").focus();
		});
		$("#all").click(function(){
			$("#monthly").parent().hide();
			$("#deposit").focus();
		});
		
		
		/* 사진업로드 */
		$("#pic_add").click(function(){
			pic++;
			$("#before").children().hide();
			$("#after").show();
			var txt = "<div class='box'><input type='file' style='display:none;' id='attach"+pic+"' name='attach"+pic+"'/>";
			txt+="<i class='material-icons cancel' onclick='del(this);'>cancel</i>"
			txt+="<i class='material-icons refresh' onclick='edit();'>refresh</i>";
			txt+="<img style='width:150px;' class='pic' id='img"+pic+"'/></div>";
			$("#after").prepend(txt);
			$("#pic_add").hide();
			$("#attach"+pic).click();
			
			
			$("#attach"+pic).change(function(){
			    readURL(this);
			});
		});
		
		
		
	});//ready
	
	function add(){
		pic++;
		var txt = "<div class='box'><input type='file' style='display:none;' id='attach"+pic+"' name='attach"+pic+"'/>";
		txt+="<i class='material-icons cancel' onclick='del(this);'>cancel</i>"
		txt+="<i class='material-icons refresh' onclick='edit();'>refresh</i>";
		txt+="<img style='width:150px;' class='pic' id='img"+pic+"'/></div>";
		$("#after").prepend(txt);
		$("#attach"+pic).click();
		
		$("#attach"+pic).change(function(){
		    readURL(this);
		});
	}
	
	function edit(){ //수정 메소드
		$(event.srcElement).prev().prev().click();
		var img = $(event.srcElement).next();
	}
	
	function del(delbtn){ //삭제 메소드
		$(delbtn).parent().remove();
		if($("#after").children().length==2){
			$("#after").hide();
			$("#before").children().show();
			$("#pic_add").show();
		}
	};
		
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        	
	            $('#img'+pic).attr('src', e.target.result);
	            
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	    
	}
	 
	
	
	/* --------------------- */
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
					document.getElementById("selectedAddress").value=roadAddr;
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
		document.getElementById("detailaddress").focus();
		/* $("#detailaddress").focus(); */
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
							<li>매물을 등록하자마자 바로 거래를 할 수 있습니다.</li>
						</ul>
					</div>
					<form method="post" action="/GolaBang/manage/addroomok.do" id="roomForm" enctype="multipart/form-data">
					<!-- <table class="tblInput" >
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
					</table> -->
					<!-- -----------------------------------------------------------위 :  원래 매물종류-------------------------------------------------- -->
					<table style="width: 1200px; height: 200px; border: 1px solid #e0e0e0; margin: 30px auto; border-radius: 10px; border-collapse: collapse;">
						<thead>
							<tr>
								<td colspan="2" style="border-bottom: 1px solid #e0e0e0; font-size: 24px; text-align: center; padding: 25px;"><b>매물 종류</b></td>
							</tr>
							<tr>
								<th style="background-color: #eee; border-bottom: 1px solid #e0e0e0; width: 100px; height: 80px;">종류 선택</th>
								<td style="border-bottom: 1px solid #e0e0e0;">
									<div class="container">
								 		<div class="button-wrap" style="margin-top: 15px; margin-left: 10px">
											<input class="hidden radio-label" type="radio" name="room" id="one" checked="checked" value="원룸"/>
											<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="one">원룸</label> 
											
											<input class="hidden radio-label" type="radio" name="room" id="two" value="투룸"/>
											<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="two">투룸</label>
												
											<input class="hidden radio-label" type="radio" name="room" id="three" value="쓰리룸"/>
											<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="three">쓰리룸</label>
											
											<input class="hidden radio-label" type="radio" name="room" id="apart" value="아파트"/>
											<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="apart">아파트</label>
											
											<input class="hidden radio-label" type="radio" name="room" id="opistel" value="오피스텔"/>
											<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="opistel">오피스텔</label>
											
											<div style="clear: both;"></div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th style="background-color: #eee; width: 100px; height: 80px;">건물 유형</th>
								<td style="border-bottom: 1px solid #e0e0e0;">
									<div class="container">
										<div class="button-wrap" style="margin-top: 15px; margin-left: 10px">
											<input class="hidden radio-label" type="radio" name="building" id="dan" checked="checked" value="단독주택" />
											<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="dan">단독주택</label>
											
											<input class="hidden radio-label" type="radio" name="building" id="dagagu" value="다가구주택"/>
											<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: -1px;" class="button-label" for="dagagu">다가구주택</label>
											
											<input class="hidden radio-label" type="radio" name="building" id="builla" value="빌라/연립/다세대"/>
											<label style="height: 50px; text-align: center; line-height: 50px; font-size: 13px; letter-spacing: -1px;" class="button-label" for="builla">빌라/연립/다세대</label>
											
											<input class="hidden radio-label" type="radio" name="building" id="sangga" value="상가"/>
											<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="sangga">상가</label>
											<div style="clear:both;"></div>
										</div>
									</div>
								</td>
							</tr>
						</thead>
					</table>
					<!-- -----------------------------------------------------------위 : 바꾼 매물종류-------------------------------------------------- -->
					<!-- 
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
										<input type="hidden" name="selectedAddress" id="selectedAddress"/>
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
					 -->
					<!-- -----------------------------------------------------------위 : 원래 위치정보-------------------------------------------------- -->
					<table style="width: 1200px; height: 200px; border: 1px solid #e0e0e0; margin: 30px auto; border-radius: 10px; border-collapse: collapse;">
						<thead>
							<tr>
								<td colspan="3" style="border-bottom: 1px solid #e0e0e0; font-size: 24px; text-align: center; padding: 25px;"><b>위치 정보</b></td>
							</tr>
							<tr>
								<th style="background-color: #eee; border-bottom: 1px solid #e0e0e0; width: 100px; height: 80px;">주소 입력</th>
								<td style="outline: 0px solid blue; height: 350px; width: 550px;">
									<div style="outline: 0px solid black; height: 45px;">
										<div style="outline: 0px solid orange; margin-top: 3px; float:left; width: 400px; padding-left: 35px;">
											<i class="material-icons" style="color:#A9A9A9; vertical-align: middle;">info</i>도로명, 건물명, 지번에 대해 통합검색이 가능합니다.
										</div>
										<input type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" style="margin-top:3px; display: inline-block; margin-left: 20px;" id="btnAddress" onclick="search_address();" value="주소 검색">
									</div>
									<div style="outline: 0px solid black; height: 80px;">
										<input type="hidden" name="selectedAddress" id="selectedAddress"/>
										<div id="realaddress" style="width:473px; height:80px; border:1px solid #e0e0e0; margin:10px auto;"></div>
									</div>
									<div style="outline: 0px solid black; height: 70px;">
										<div style="border: 0px solid red; width:473px; margin: 15px auto;">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
											<input class="mdl-textfield__input" name="detailaddress" type="text" id="detailaddress" style="width: 473px" autocomplete="off">
											<label class="mdl-textfield__label" style="margin-top:-5px; width: 473px; padding-left: 5px;" for="detailaddress">상세주소를 입력하세요</label>
										</div>
										</div>
									</div>
								</td>
								<td style="outline: 0px solid red; width: 550px;">
									<div id="map" style="width:500px;border:1px solid #e0e0e0; height:300px; margin: 0px auto;">
										<div style="margin:120px;"></div>
										<p style="text-align:center; color:#A9A9A9;">주소 검색을 하시면<br>해당 위치가 지도에 표시됩니다.</p>
									</div>
								</td>
							</tr>
							
						</thead>
					</table>
					<!-- -----------------------------------------------------------위 : 바꾼 위치정보-------------------------------------------------- -->
					<!-- <table class="tblInput">
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
											<div id="deposit_monthly" >
												<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="float:left;">
													<input class="mdl-textfield__input" type="text" id="deposit" name="deposit">
													<label class="mdl-textfield__label" for="deposit" style="margin-top:-10px;">보증금/전세금을 입력해주세요.</label>
												</div>
												<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="float:left;">
													<input class="mdl-textfield__input" type="text" id="monthly" name="monthly">
													<label class="mdl-textfield__label" for="monthly" style="margin-top:-10px;">월세를 입력해주세요.</label>
												</div>	
											</div>
										<div style="clear:both;"></div>
									</div>
									</div>
								</td>
							</tr>
					</table> -->
					<!-- -----------------------------------------------------------위 : 원래 거래정보-------------------------------------------------- -->
					<table style="width: 1200px; height: 250px; border: 1px solid #e0e0e0; margin: 30px auto; border-radius: 10px; border-collapse: collapse;">
						<thead>
							<tr>
								<td colspan="3" style="border-bottom: 1px solid #e0e0e0; font-size: 24px; text-align: center; padding: 25px;"><b>거래 정보</b></td>
							</tr>
						</thead>
						<tr>
							<th style="background-color: #eee; border-bottom: 1px solid #e0e0e0; width: 100px; height: 80px;">거래 종류</th>
							<td style="border-bottom: 1px solid #e0e0e0; border-right: 1px solid #e0e0e0;  height: 150px;">
									<div class="container">
								 		<div class="button-wrap" style="margin-top: 0px; margin-left: 10px; outline: 0px solid black;">
											<input class="hidden radio-label" type="radio" name="deal_type" id="month" value="월세" checked="checked"/>
											<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="month">월세</label> 
											
											<input class="hidden radio-label" type="radio" name="deal_type" id="all" value="전세"/>
											<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="all">전세</label>
											
											<div style="outline: 0px solid orange; margin: 15px auto; float:left; margin-left: 15px; width: 500px;">
												<i class="material-icons" style="color:#A9A9A9; vertical-align: middle;">info</i>거래 종류에 따라 입력하는 란이 다릅니다. 필수 입력값을 꼭 작성해주세요.
											</div>
											
											<div style="clear: both;"></div>
										</div>
										
										<div id="deposit_monthly" style="outline: 0px solid green; margin-top: 10px; height: 70px;" >
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="float:left; outline: 0px solid pink; margin-left: 6px; margin-right: 10px;">
												<input class="mdl-textfield__input" type="text" id="deposit" name="deposit" autocomplete="off">
												<label class="mdl-textfield__label" for="deposit" style="margin-top:-10px; padding-left: 5px;">보증금/전세금을 입력해주세요.</label>
											</div>
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="float:left; outline: 0px solid navy;">
												<input class="mdl-textfield__input" type="text" id="monthly" name="monthly" autocomplete="off">
												<label class="mdl-textfield__label" for="monthly" style="margin-top:-10px; padding-left: 5px;">월세를 입력해주세요.</label>
											</div>	
										</div>
										<div style="clear:both;"></div>
										
									</div>
								</td>
						</tr>
					</table>
					<!-- -----------------------------------------------------------위 : 바꾼 거래정보-------------------------------------------------- -->
					<%-- <table class="tblInput" style="margin:40px auto 20px auto;width:80%;">
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
									    <input class="mdl-textfield__input" type="number" id="supply_pyeong" name="supply_pyeong">
										<label class="mdl-textfield__label" tabindex="1" style="margin-top:-10px;" for="supply_pyeong">공급면적(평)을 입력하세요</label>
									</div>
									
									<input type="text" style="text-align:right; width:50px;" id="supply_m2" readonly/>m<sup>2</sup>
								</td>
							<th rowspan="2"><b>건물 층수</b></th>
							<td colspan="2">건물 층수 <select id="buildingFloor" name="buildingFloor"><option>건물 층수 선택</option></select></td>
						</tr>
						<tr>
							<td colspan="2" >
								<label style="">평</label>
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									    <input class="mdl-textfield__input" type="number" id="public_pyeong" name="public_pyeong" >
										<label class="mdl-textfield__label" tabindex="2" style="margin-top:-10px;" for="public_pyeong">전용면적(평)을 입력하세요</label>
										
									</div>
									
									<input type="text" id="public_m2" style="text-align:right; width:50px;" readonly/>m<sup>2</sup>
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
								<input type="date" min="${today}" id="movedate" name="movedate"/>
							</td>
						</tr>
					</table> --%>
					<!-- -----------------------------------------------------------위 : 원래 기본정보-------------------------------------------------- -->
					<table style="width: 1200px; height: 200px; border: 1px solid #e0e0e0; margin: 30px auto; border-radius: 10px; border-collapse: collapse;">
						<thead>
							<tr>
								<td colspan="4" style="border-bottom: 1px solid #e0e0e0; border-right: 1px solid #e0e0e0; font-size: 24px; text-align: center; padding: 25px;"><b>기본 정보</b></td>
							</tr>
						</thead>
							<tr>
								<th rowspan="2" style="background-color: #eee; border-bottom: 1px solid #e0e0e0; width: 100px; height: 80px;">건물 크기<br>(1P=3.3058m<sup>2</sup>)</th>
								<td style="border-bottom: 1px solid #e0e0e0; width: 500px;">
									<span style="padding-left: 10px; font-weight: bold; color: rgb(68, 68, 68);">공급 면적</span>
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width: 100px; margin-left:5px; margin-right: 5px;">
									    <input class="mdl-textfield__input" type="number" id="supply_pyeong" name="supply_pyeong" style="border: 1px solid #e0e0e0; width: 100px; height:50px; padding: 10px; color: rgb(68, 68, 68);">
										<label class="mdl-textfield__label" tabindex="1" style="margin-top:-10px; width: 100px;" for="supply_pyeong"></label>
									</div>
									<span>평</span>
									<input type="text" style="text-align:right; border: 1px solid #e0e0e0; outline:none; width: 100px; height:50px; padding: 10px; margin-left:5px; margin-right: 5px; color: rgb(68, 68, 68);" id="supply_m2" readonly/>m<sup>2</sup>
								</td>
								
								<th rowspan="2" style="background-color: #eee; border-bottom: 1px solid #e0e0e0; width: 100px; height: 80px;">건물 층수</th>
								<td colspan="2" style="border-bottom: 1px solid #e0e0e0;">
									<span style="padding-left: 10px; font-weight: bold; color: rgb(68, 68, 68); padding-right: 5px;">건물 층수</span>
									<select id="buildingFloor" style="padding: 15px; outline: none; border: 1px solid #e0e0e0;" name="buildingFloor"><option>건물 층수 선택</option></select>
								</td>
							</tr>
							<tr>
							
								<td colspan="2" style="border-bottom: 1px solid #e0e0e0;" >
									<span style="padding-left: 10px; font-weight: bold; color: rgb(68, 68, 68);">전용 면적</span>
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width: 100px; margin-left:5px; margin-right: 5px;">
									    <input class="mdl-textfield__input" type="number" id="public_pyeong" name="public_pyeong" style="border: 1px solid #e0e0e0; width: 100px; height:50px; padding: 10px; color: rgb(68, 68, 68);">
										<label class="mdl-textfield__label" tabindex="2" style="margin-top:-10px; width: 100px;" for="public_pyeong"></label>
									</div>
									<span>평</span>
									<input type="text" id="public_m2" style="text-align:right; outline:none; border: 1px solid #e0e0e0; width: 100px;  height:50px; padding: 10px; margin-left:5px; margin-right: 5px; color: rgb(68, 68, 68);" readonly/>m<sup>2</sup>
								</td>
								<td colspan="2" style="border-bottom: 1px solid #e0e0e0;">
									<span style="padding-left: 10px; font-weight: bold; color: rgb(68, 68, 68); padding-right: 5px;">해당 층수</span>
									<select id="myFloor" style="padding: 15px; outline: none; border: 1px solid #e0e0e0;" name="myFloor"><option>해당 층수 선택</option></select>
								</td>
							</tr>
							<tr>
								<th style="background-color: #eee; border-bottom: 1px solid #e0e0e0; width: 100px; height: 80px;">난방 종류</th>
								<td colspan="3" style=" border-bottom: 1px solid #e0e0e0; border-right: 1px solid #e0e0e0;">
									<select style="padding: 15px; margin-left: 10px; outline: none; border: 1px solid #e0e0e0; " name="heating_type" id="heating_type">
										<option>난방 종류 선택</option>
										<option value="중앙난방">중앙난방</option>
										<option value="개별난방">개별난방</option>
										<option value="지역난방">지역난방</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<th style="background-color: #eee; border-bottom: 1px solid #e0e0e0; width: 100px; height: 80px;">입주 가능일</th>
								<td colspan="3" style="border-right: 1px solid #e0e0e0;">
									<input type="date" min="${today}" id="movedate" name="movedate" style="margin-left: 10px; padding: 15px; border: 1px solid #e0e0e0;"/>
								</td>
							</tr>
						
					</table>
					<!-- -----------------------------------------------------------위 : 바꾼 기본정보-------------------------------------------------- -->
					<!-- 
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
										<input class="hidden optionlist button-label" type="checkbox" value="에어컨" name="optionList" id="option_air"  />
										<label class="button-label" for="option_air"><h4>에어컨</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="세탁기" name="optionList" id="option_washer"  />
										<label class="button-label" for="option_washer"><h4>세탁기</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="침대" name="optionList" id="option_bed" />
										<label class="button-label" for="option_bed"><h4>침대</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="책상" name="optionList" id="option_desk"  />
										<label class="button-label" for="option_desk"><h4>책상</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="옷장" name="optionList" id="option_closet"  />
										<label class="button-label" for="option_closet"><h4>옷장</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="TV" name="optionList" id="option_TV"  />
										<label class="button-label" for="option_TV"><h4>TV</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="신발장" name="optionList" id="option_shoes" />
										<label class="button-label" for="option_shoes"><h4>신발장</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="냉장고" name="optionList" id="option_refrigerator"  />
										<label class="button-label" for="option_refrigerator"><h4>냉장고</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="가스레인지" name="optionList" id="option_gasrange" />
										<label class="button-label" for="option_gasrange"><h4>가스레인지</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="인덕션" name="optionList" id="option_induction" />
										<label class="button-label" for="option_induction"><h4>인덕션</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="전자레인지" name="optionList" id="option_microwave"  />
										<label class="button-label" for="option_microwave"><h4>전자레인지</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="전자도어락" name="optionList" id="option_doorlock"  />
										<label class="button-label" for="option_doorlock"><h4>전자도어락</h4></label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="비데" name="optionList" id="option_bidet" />
										<label class="button-label" for="option_bidet"><h4>비데</h4></label>
										<div style="clear:both;"></div>
									</div>
								</div>
							</td>
						</tr>
					</table> -->
					<!-- -----------------------------------------------------------위 : 원래 추가정보-------------------------------------------------- -->
					
					<table style="width: 1200px; height: 200px; border: 1px solid #e0e0e0; margin: 30px auto; border-radius: 10px; border-collapse: collapse;">
						<thead>
							<tr>
								<th colspan="6" style="border-bottom: 1px solid #e0e0e0; border-right: 1px solid #e0e0e0; font-size: 24px; text-align: center; padding: 25px;"><b>추가 정보</b></th>
							</tr>
						</thead>
							<tr>
								<th style="background-color: #eee; border-bottom: 1px solid #e0e0e0; width: 100px; height: 80px;">관리비</th>
								<td colspan="6" style="border-bottom: 1px solid #e0e0e0; border-right: 1px solid #e0e0e0; width: 500px;">
								
									<div class="container">
								 		<div class="button-wrap" style="margin-top: 15px; margin-left: 10px">
								 			<input class="hidden radio-label" type="radio" name="admincost" id="no_admincost" value="0" checked="checked"/>
											<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="no_admincost">없음</label>
											
											<input class="hidden radio-label" type="radio" name="admincost" id="yes_admincost" value="1"/>
											<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="yes_admincost">있음</label>
											<div style="clear:both;"></div>
								 		</div>
								 	</div>
								</td>
							</tr>	
							
							<tr>
								<th style="background-color: #eee; border-bottom: 1px solid #e0e0e0; width: 100px; height: 80px;">주차여부</th>
								<td colspan="3" style="border-bottom: 1px solid #e0e0e0; width: 500px;">
								
									<div class="container">
										<div class="button-wrap"  style="margin-top: 15px; margin-left: 10px">
											<input class="hidden radio-label" type="radio" name="parking" id="no_parking" value="0" checked="checked"/>
											<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="no_parking">없음</label>
											
											<input class="hidden radio-label" type="radio" name="parking" id="yes_parking" value="1"/>
											<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="yes_parking">있음</label>
											<div style="clear:both;"></div>
										</div>
									</div>
								</td>
							
								<th style="background-color: #eee; border-bottom: 1px solid #e0e0e0; width: 100px; height: 80px;">반려동물</th>
								<td colspan="3" style="border-bottom: 1px solid #e0e0e0; width: 500px;">
									<div class="container">
										<div class="button-wrap" style="margin-top: 15px; margin-left: 10px">
											<input class="hidden radio-label" type="radio" name="pet" id="no_pet" value="0" checked="checked"/>
											<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="no_pet">없음</label>
											
											<input class="hidden radio-label" type="radio" name="pet" id="yes_pet" value="1"/>
											<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="yes_pet">있음</label>
											<div style="clear:both;"></div>
										</div>
									</div>
								</td>
							</tr>
							
							<tr>
								<th style="background-color: #eee; border-bottom: 1px solid #e0e0e0; width: 100px; height: 80px;">엘리베이터</th>
									<td colspan="3" style="border-bottom: 1px solid #e0e0e0; width: 500px;">
										<div class="container">
											<div class="button-wrap" style="margin-top: 15px; margin-left: 10px">
												<input class="hidden radio-label" type="radio" name="elevator" id="no_elevator" value="0" checked="checked"/>
												<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="no_elevator">없음</label>
												
												<input class="hidden radio-label" type="radio" name="elevator" id="yes_elevator" value="1"/>
												<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="yes_elevator">있음</label>
												<div style="clear:both;"></div>
											</div>
										</div>
									</td>
								<th style="background-color: #eee; border-bottom: 1px solid #e0e0e0; width: 100px; height: 80px;">베란다/발코니</th>
									<td colspan="3" style="border-bottom: 1px solid #e0e0e0; width: 500px;">
										<div class="container">
											<div class="button-wrap" style="margin-top: 15px; margin-left: 10px">
												<input class="hidden radio-label" type="radio" name="valcony" id="no_valcony" value="0" checked="checked"/>
												<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="no_valcony">없음</label>
												
												<input class="hidden radio-label" type="radio" name="valcony" id="yes_valcony" value="1"/>
												<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="yes_valcony">있음</label>
												<div style="clear:both;"></div>
											</div>
										</div>
									</td>
							</tr>
							<tr>
								<th style="background-color: #eee; border-bottom: 1px solid #e0e0e0; width: 100px; height: 80px;">빌트인</th>
									<td colspan="6" style="border-bottom: 1px solid #e0e0e0; border-right: 1px solid #e0e0e0; width: 500px;">
										<div class="container">
											<div class="button-wrap" style="margin-top: 15px; margin-left: 10px">
												<input class="hidden radio-label" type="radio" name="builtin" id="no_builtin" value="0" checked="checked"/>
												<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="no_builtin">없음</label>
												
												<input class="hidden radio-label" type="radio" name="builtin" id="yes_builtin" value="1"/>
												<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="yes_builtin">있음</label>
												<div style="clear:both;"></div>
											</div>
										</div>
									</td>
								</tr>
							<tr>
								<th style="background-color: #eee; border-bottom: 1px solid #e0e0e0; width: 100px; height: 80px;">옵션항목</th>
									<td colspan="6" style="border-bottom: 1px solid #e0e0e0; border-right: 1px solid #e0e0e0; width: 500px;">
									<div class="container">
										<div class="button-wrap" style="margin-top: 15px; margin-left: 10px" id="optionlist">
										<input class="hidden optionlist button-label" type="checkbox" value="에어컨" name="optionList" id="option_air"  />
										<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="option_air">에어컨</label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="세탁기" name="optionList" id="option_washer"  />
										<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="option_washer">세탁기</label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="침대" name="optionList" id="option_bed" />
										<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="option_bed">침대</label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="책상" name="optionList" id="option_desk"  />
										<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="option_desk">책상</label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="옷장" name="optionList" id="option_closet"  />
										<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="option_closet">옷장</label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="TV" name="optionList" id="option_TV"  />
										<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="option_TV">TV</label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="신발장" name="optionList" id="option_shoes" />
										<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="option_shoes">신발장</label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="냉장고" name="optionList" id="option_refrigerator"  />
										<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="option_refrigerator">냉장고</label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="가스레인지" name="optionList" id="option_gasrange" />
										<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="option_gasrange">가스레인지</label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="인덕션" name="optionList" id="option_induction" />
										<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="option_induction">인덕션</label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="전자레인지" name="optionList" id="option_microwave"  />
										<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="option_microwave">전자레인지</label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="전자도어락" name="optionList" id="option_doorlock"  />
										<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="option_doorlock">전자도어락</label>
										
										<input class="hidden optionlist button-label" type="checkbox" value="비데" name="optionList" id="option_bidet" />
										<label style="height: 50px; text-align: center; line-height: 50px; font-size: 15px; letter-spacing: 3px;" class="button-label" for="option_bidet">비데</label>
										<div style="clear:both;"></div>
									</div>
								</div>
							</td>
						</tr>
							
					</table>
					<!-- -----------------------------------------------------------위 : 바꾼 추가정보-------------------------------------------------- -->
					<!-- <table class="tblInput">
						<thead>
							<tr>
								<th colspan="6"><h4><b>상세 설명</b></h4></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th><b>제목</b></th>
								<td colspan="5">
									<input type="text" name="detail_title" id="detail_title" style="width:100%; height:50px; border:1px solid #A9A9A9; vertical-align: middle; padding-left:10px;" 
									placeholder="예) 역삼역 도보 5분거리, 혼자 살기 좋은 조용한 방입니다.">
										
								</td>
							</tr>
							<tr>
								<th><b>상세 설명</b></th>
								<td colspan="5">
									<textarea id="detail_content" name="detail_content" style="width:100%; resize:none; height:300px; border:1px solid #A9A9A9; vertical-align: middle; padding-left:10px;"></textarea>
								</td>
							</tr>
							<tr>
								<th><b>상세 설명</b></th>
								<td colspan="5">
									<input type="text" name="detail_privatememo" id="detail_privatememo" placeholder="외부에 공개되지 않으며, 등록자에게만 보이는 메모입니다."
									 style="width:100%;height:50px; border:1px solid #A9A9A9; vertical-align: middle; padding-left:10px;" />
								</td>
							</tr>
						</tbody>
					</table> -->
					<!-- -----------------------------------------------------------위 : 원래 상세설명-------------------------------------------------- -->
					
					<table style="width: 1200px; height: 200px; border: 1px solid #e0e0e0; margin: 30px auto; border-radius: 10px; border-collapse: collapse;">
						<thead>
							<tr>
								<th colspan="6" style="border-bottom: 1px solid #e0e0e0; border-right: 1px solid #e0e0e0; font-size: 24px; text-align: center; padding: 25px;"><b>상세 설명</b></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th style="background-color: #eee; border-bottom: 1px solid #e0e0e0; width: 100px; height: 80px;">제목</th>
								<td colspan="5" style="border-bottom: 1px solid #e0e0e0; border-right: 1px solid #e0e0e0; width: 500px;">
									<input type="text" name="detail_title" id="detail_title" style="width:1085px; margin-left: 5px; outline: none; height:50px; border:1px solid #e0e0e0; vertical-align: middle; padding-left:10px;" 
									placeholder="예) 역삼역 도보 5분거리, 혼자 살기 좋은 조용한 방입니다." autocomplete="off">
										
								</td>
							</tr>
							<tr>
								<th style="background-color: #eee; border-bottom: 1px solid #e0e0e0; width: 100px; height: 80px;">상세설명</th>
								<td colspan="5" style="border-bottom: 1px solid #e0e0e0; border-right: 1px solid #e0e0e0; width: 500px;">
									<textarea autocomplete="off" id="detail_content" name="detail_content" style="width:1085px; outline:none; margin: 10px 5px; resize:none; height:280px; border:1px solid #e0e0e0; vertical-align: middle; padding-left:10px;"></textarea>
								</td>
							</tr>
							<tr>
								<th style="background-color: #eee; border-bottom: 1px solid #e0e0e0; width: 100px; height: 80px;">비공개 메모</th>
								<td colspan="5" style="border-bottom: 1px solid #e0e0e0; border-right: 1px solid #e0e0e0; width: 500px;">
									<input type="text" name="detail_privatememo" id="detail_privatememo" autocomplete="off" placeholder="외부에 공개되지 않으며, 등록자에게만 보이는 메모입니다."
									 style="width:1085px;height:50px; border:1px solid #e0e0e0; vertical-align: middle; outline:none; margin: 10px 5px; padding-left:10px;" />
								</td>
							</tr>
						</tbody>
					</table>
					<!-- -----------------------------------------------------------위 : 바꾼 상세설명-------------------------------------------------- -->
					<!-- 
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
					 -->
					<!-- -----------------------------------------------------------위 : 원래 사진등록-------------------------------------------------- -->
					
					
					<table style="width: 1200px; height: 200px; border: 1px solid #e0e0e0; margin: 30px auto; border-radius: 10px; border-collapse: collapse;">
						<thead>
							<tr>
								<th colspan="6" style="border-bottom: 1px solid #e0e0e0; border-right: 1px solid #e0e0e0; font-size: 24px; text-align: center; padding: 25px;"><b>사진 등록</b></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="border-right: 1px solid #e0e0e0;">
									<textarea id="pic_textarea"cols="164" rows="10" style="margin:10px; border: 1px solid #e0e0e0; outline: none; resize:none;" readonly></textarea>
								</td>
							</tr>
							<tr id="addpic">
								
							</tr>
							<tr>
								<td style="border-right: 1px solid #e0e0e0;">
									<div style="width:98%; height:300px; margin:0 auto; background:#eee; margin-bottom: 25px; vertical-align: middle; text-align:center;">
										<div id="before">
											<i class="material-icons" style="font-size:36px; color:gray;margin-top:40px;">add_a_photo</i>
											<p>실 사진 최소 3장이상 등록 하셔야 하며, 가로사진을 권장합니다.</p>
											<p style="color:red;">불필요한 정보(워터마크,상호,전화번호 등)가 있는 매물은 비공개처리됩니다.</p>
										</div>
										<div id="after" style=" border:1px solid black; ">
											
											
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
					
					<!-- -----------------------------------------------------------위 : 바꾼 사진등록-------------------------------------------------- -->
					
					<div style="width:500px; border:0px solid black;line-height:20px; margin:0 auto;">
					 
						<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="addRoomCheck">
							<input type="checkbox" id="addRoomCheck" class="mdl-checkbox__input">
							<span>매물 관련 규정을 확인하였으며, 입력한 정보는 실제와 다름이 없습니다.</span>
						</label>
						 <!-- 
						<input type="checkbox" id="addRoomCheck" style=""> 
						<label for="addRoomCheck">매물 관련 규정을 확인하였으며, 입력한 정보는 실제와 다름이 없습니다.</label>
						 -->
					</div>
				<div style="width:220px; margin:0 auto;">					
					<button class="mdl-button mdl-js-button mdl-button--raised" style="margin-top:40px; margin-right:20px;">등록 취소</button>
					<button id="complete" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" style="margin-top:40px;">매물 등록</button>
				</div>
				</form>
			</div>
			</div>
			
		<!-- footer -->
		<%-- <jsp:include page="/inc/footer.jsp"></jsp:include> --%>


		</main>
	</div>
</body>
</html>