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
<style>
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

.tblAddroom > th {
	background:#F9F9F9;
}

.tblInput{
	margin:40px auto 20px auto; 
	border:1px solid black; 
	width:80%;
}
.tblInput th{
	background:#A9A9A9;
	text-align:center; 
	width:150px;
	color:black;
}
.tblInput tr{
	border:1px solid black;
}
.tblInput td{
	
}

</style>
<script>
var date = new Date();
var today;
var selectedAddress;
	$(document).ready(function() {
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
		$("#yes_admincost").click(function(){
			$("#adminfee").attr("disabled",false);
		});
		
		$("#no_admincost").click(function(){
			$("#adminfee").attr("disabled",true);
		});
		
		
		$("#adminfee").keyup(function(){
			
		});
		
		
		
		  
	});//ready
	
	
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
					<table class="tblInput" >
						<thead>
							<tr>
								<th class="" colspan="4" style="text-align:center; color:black"><h4><b>매물 종류</b></h4></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th><h5><b>종류 선택</b></h5></th>
							 	<td colspan="3"> 
							 		<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="one">
									<input class="mdl-radio__button" id="one" name="room" type="radio" value="원룸"> 
									<span class="mdl-radio__label">원룸</span> </label>
									
									<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="two">
									<input class="mdl-radio__button" id="two" name="room" type="radio" value="투룸"> 
									<span class="mdl-radio__label">투룸</span> </label>
							
									<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="three">
									<input class="mdl-radio__button" id="three" name="room" type="radio" value="쓰리룸"> 
									<span class="mdl-radio__label">쓰리룸</span> </label>
									
									<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="apart">
									<input class="mdl-radio__button" id="apart" name="room" type="radio" value="아파트"> 
									<span class="mdl-radio__label">아파트</span> </label>
									
									<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="opistel">
									<input class="mdl-radio__button" id="opistel" name="room" type="radio" value="오피스텔"> 
									<span class="mdl-radio__label">오피스텔</span> </label>
								</td>
							</tr>
							<tr>
								<th><h5><b>건물 유형</b></h5></th>
								<td colspan="3"  style="text-align:left">
									<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="dan" onclick="label(this);">
									<input class="mdl-radio__button" id="dan" name="building" type="radio" value="단독주택"> 
									<span class="mdl-radio__label">단독주택</span> </label>
									
									<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="dagagu">
									<input class="mdl-radio__button" id="dagagu" name="building" type="radio" value="다가구주택"> 
									<span class="mdl-radio__label">투룸</span> </label>
							
									<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="builla">
									<input class="mdl-radio__button" id="builla" name="building" type="radio" value="빌라/연립/다세대"> 
									<span class="mdl-radio__label">빌라/연립/다세대</span> </label>
									
									<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="sangga">
									<input class="mdl-radio__button" id="sangga" name="building" type="radio" value="상가주택"> 
									<span class="mdl-radio__label">상가</span> </label>
								</td>
							</tr>
	
						</tbody>
					</table>
					
					<table class="tblInput">
							<tr>
								<th colspan="4"><h4><b>위치 정보</b></h4></th>
							</tr>
							<tr>
								<th>주소 입력</th>
								<td>
									<div>
										<span><i class="material-icons" style="color:#A9A9A9;">info</i>도로명, 건물명, 지번에 대해 통합검색이 가능합니다.</span>
									</div>
									<div>
										<input type="text" id="addresstxt" /> <input type="button" value="주소검색" onclick="search_address();" id="btnAddress" />
									</div>
									<div>
										<div id="realaddress" style="width:400px; height:200px; border:1px solid #A9A9A9;">
											
										</div>
									</div>
								</td>
								<td>
									<div id="map" style="width:600px;border:1px solid #A9A9A9; height:300px;"></div>

						</td>
							</tr>
							
					</table>
					
					<table class="tblInput">
						<tr>
							<th colspan="2"><h4><b>거래 정보</b></h4></th>
						</tr>
						<tr>
							<th><h5>거래 종류</h5></th>
							<td>
								<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="month">
								<input class="mdl-radio__button" id="month" name="deal_type" type="radio" value="월세"> 
								<span class="mdl-radio__label">월세</span> </label>
									
								<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="all">
								<input class="mdl-radio__button" id="all" name="deal_type" type="radio" value="전세"> 
								<span class="mdl-radio__label">전세</span> </label>
							</td>
						</tr>
					</table>
					
					<table class="tblInput" style="margin:40px auto 20px auto; border:1px solid black; width:80%;">
						<tr>
							<th colspan="6"><h4><b>기본 정보</b></h4></th>
						</tr>
						<tr>
							<th rowspan="2">
								<div><h5>건물크기<br>(1P=3.3058m<sup>2</sup>)</h5></div>
							</th>
							<td colspan="2" >공급면적 <input type="text"/> 평 <input type="text" /> m<sup>2</sup></td>
							<th rowspan="2">
								<div>건물 층수</div>
							</th>
							<td colspan="2">건물 층수 <select id="buildingFloor" name="buildingFloor"><option>건물 층수 선택</option></select></td>
						</tr>
						<tr>
							<td colspan="2" >전용면적 <input type="text"/> 평 <input type="text" /> m<sup>2</sup></td>
							<td colspan="2">해당 층수 <select id="myFloor" name="myFloor"><option>건물 층수 선택</option></select></td>
						</tr>
						<tr>
							<th><h5>난방 종류</h5></th>
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
							<th><h5>입주 가능일</h5></th>
							<td>
								<input type="date" min="${today}" id="movedate"/>
							</td>
						</tr>
					</table>
					<table class="tblInput">
						<tr>
							<th colspan="6"><h4><b>추가 정보</b></h4></th>
						</tr>
						<tr>
							<th><h5>관리비</h5></th>
							<td colspan="5">
								<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="no_admincost">
								<input class="mdl-radio__button" id="no_admincost" name="admincost" type="radio" checked value="0"> 
								<span class="mdl-radio__label">없음</span> </label>
									
								<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="yes_admincost">
								<input class="mdl-radio__button" id="yes_admincost" name="admincost" type="radio" value="1"> 
								<span class="mdl-radio__label">있음</span></label><input type="number" id="adminfee" name="adminfee" disabled/><label>원</label>
							</td>
						</tr>
						<tr>
							<th><h5>주차 여부</h5></th>
							<td colspan="2">
								<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="no_parking">
								<input class="mdl-radio__button" id="no_parking" name="parking" type="radio" checked value="0"> 
								<span class="mdl-radio__label">불가능</span> </label>
									
								<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="yes_parking">
								<input class="mdl-radio__button" id="yes_parking" name="parking" type="radio" value="1"> 
								<span class="mdl-radio__label">가능</span></label>
							</td>
							<th><h5>반려 동물</h5></th>
							<td colspan="2">
								<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="no_pet">
								<input class="mdl-radio__button" id="no_pet" name="pet" type="radio" checked value="0"> 
								<span class="mdl-radio__label">불가능</span> </label>
									
								<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="yes_pet">
								<input class="mdl-radio__button" id="yes_pet" name="pet" type="radio" value="1"> 
								<span class="mdl-radio__label">가능</span></label>
							</td>
						</tr>
						<tr>
							<th><h5>엘리베이터</h5></th>
							<td colspan="2">
								<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="no_elevator">
								<input class="mdl-radio__button" id="no_elevator" name="elevator" type="radio" checked value="0"> 
								<span class="mdl-radio__label">없음</span> </label>
									
								<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="yes_elevator">
								<input class="mdl-radio__button" id="yes_elevator" name="elevator" type="radio" value="1"> 
								<span class="mdl-radio__label">있음</span></label>
							</td>
							<th><h5>베란다/발코니</h5></th>
							<td colspan="2">
								<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="no_valcony">
								<input class="mdl-radio__button" id="no_valcony" name="valcony" type="radio" checked value="0"> 
								<span class="mdl-radio__label">없음</span> </label>
									
								<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="yes_valcony">
								<input class="mdl-radio__button" id="yes_valcony" name="valcony" type="radio" value="1"> 
								<span class="mdl-radio__label">있음</span></label>
							</td>
						</tr>
						<tr>
							<th><h5>빌트인</h5></th>
							<td colspan="5">
								<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="no_builtin">
								<input class="mdl-radio__button" id="no_builtin" name="builtin" type="radio" checked value="0"> 
								<span class="mdl-radio__label">없음</span> </label>
									
								<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="yes_builtin">
								<input class="mdl-radio__button" id="yes_builtin" name="builtin" type="radio" value="1"> 
								<span class="mdl-radio__label">있음</span></label>
							</td>
						</tr>
						<tr>
							<th><h5>옵션 항목</h5></th>
						</tr>
					</table>
					
			</div>
			</div>
			
		<!-- footer -->
		<jsp:include page="/inc/footer.jsp"></jsp:include>


		</main>
	</div>
</body>
</html>