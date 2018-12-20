<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골라방</title>
<%@ include file="/inc/asset.jsp"%>
<script src="<%=request.getContextPath() %>/asset/js/highcharts.js"></script>
<script src="<%=request.getContextPath() %>/asset/js/highcharts-more.js"></script>
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>


<style>
#nav {
	border: 1px solid #ccc;
	border-width: 1px 0;
	list-style: none;
	margin: 0;
	padding: 0;
	text-align: center;
	height:50px;
	padding-top:20px;
	padding-bottom:20px;
	margin-top:100px;

	
}

#nav li {
	display: inline;
	font-size:30px;
	
	margin-left: 50px;
}

#nav li a {
	display: inline-block;
	padding: 10px;
	
}



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

#itemop {
	margin-top: 50px;
	min-height: 40px;
}

#subContent{
	height: 110px;
	overflow : hidden;
	transition: 0.5s;
}

#subContent:hover{
	overflow:scroll;
}

#selitem {
	display: inline-block;
	width: 1300px;
	
	
	
}

#selitem ul {
	list-style: none;
	margin: 0;
	padding: 0;
	vertical-align: middle;
	text-align: center;
	font-size:16px;
}

#selitem li {
	margin: 0 0 0 0;
 	margin-left: 20px; 
	margin-right:70px;
	padding: 0 0 0 0;
	border: 0;
	float: left;
	vertical-align: middle;
	text-align: center;
	padding-right:50px;
	border-right: 1px solid #eee;
	
}

#selitem li {

	
	
}



.location {
	margin-top: 100px;
}

.location, .sub {
	text-align: center;
	margin-bottom: 30px;
}

#opsub{
	text-align:left;
/* 	margin-left:110px; */
	height : 150px;
}
#opsub div{
	margin-left : 100px;
}
#map {
	width: 1000px;
	height: 500px;
	margin: 0px auto;
	margin-bottom: 150px;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
	margin-left: 300px;
	margin-bottom: 200px;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}

#itembox {
	width : 1300px;
	height : 800px;
	margin-top:100px;
	margin-left : 100px;
	
}

#heart:hover{
	
}

mdl-cell mdl-cell--2-col:hover{
	cursor:pointer;
}



</style>
<script>
	var cnt = 0;
	var map;
	var placeOverlay;
	var mapContainer;
	var ps;
	var Convecnt = 0; // 편의시설 갯수 ( 편의점 + 대형마트 + 카페)
	var Tracnt = 0; //교통 ( 지하철역 + 주차장 + 주유소)
	var Educnt = 0; //학군 ( 어린이집 + 학교 + 학원)
	var Pubcnt = 0; //공공시설( 관공서 + 은행)
	var Medcnt = 0; // 의료(병원, 약국)
	

	var y = 36.801219; //변경
	var x = 127.059874;

	var mlist = []; //마커 배열
	var m = null;

	var mapx;
	var mapy;
	
	
	
	$(document)
			.ready(
					function() {

						$("#heart").click(function(){ //
						
							if($(this).find('i').text() == 'favorite_border'){
								$(this).find('i').text('favorite');
								
								$.ajax({
									type:"get",
									url:"/GolaBang/item/interestmanage.do",
									data:"itemseq=${dto.itemSeq}" +"&type=add",
									success:function(result){
									
									},
									error:function(a,b,c){
										console.log(a,b,c);
									}
															
								});//ajax
									

							}
							else{
								$(this).find('i').text('favorite_border');
								
								$.ajax({
									type:"get",
									url:"/GolaBang/item/interestmanage.do",
									data:"itemseq=${dto.itemSeq}" +"&type=remove",
									success:function(result){
									
									},
									error:function(a,b,c){
										console.log(a,b,c);
									}
								
									
								});//ajax
								
								
							}
						});
						
			
						
						
						
						
						/*  갯수 얻어오기  */
							var address = "${dto.address}";
					//	var address = "충남 아산시 탕정면로 37";
						
						function getCount(){
							console.log(mapx + "1");
						$.ajax({
									url : "https://dapi.kakao.com/v2/local/search/category.json?",//y=36.801219&x=127.059874&radius=1000", 
									type : 'GET',
									headers : {
										'Authorization' : "KakaoAK 4cba5d6ba47cdc7f21f87b484a07013f"
									},
									data : "y=" + mapx + "&x=" + mapy
											+ "&radius=1000&category_group_code=CS2",
									dataType : "json",
									success : function(data) {

										$(data).each(function(index, item) {
											//console.log(item.meta.total_count);
											Convecnt += item.meta.total_count;
											console.log("편의점" + item.meta.total_count);

										});

										//	console.log("a" +Convecnt);

										$
												.ajax({
													url : "https://dapi.kakao.com/v2/local/search/category.json?",//y=36.801219&x=127.059874&radius=1000", 
													type : 'GET',
													headers : {
														'Authorization' : "KakaoAK 4cba5d6ba47cdc7f21f87b484a07013f"
													},
													data : "y="
															+ mapx
															+ "&x="
															+ mapy
															+ "&radius=1000&category_group_code=AD5",
													dataType : "json",
													success : function(data) {

														$(data)
																.each(
																		function(
																				index,
																				item) {
																			//console.log(item.meta.total_count);
// 																			Convecnt += item.meta.total_count;
// 																			console.log("숙박" + item.meta.total_count);
																		});

														//	console.log("a" +Convecnt);

														$.ajax({
																	url : "https://dapi.kakao.com/v2/local/search/category.json?",//y=36.801219&x=127.059874&radius=1000", 
																	type : 'GET',
																	headers : {
																		'Authorization' : "KakaoAK 4cba5d6ba47cdc7f21f87b484a07013f"
																	},
																	data : "y="
																			+ mapx
																			+ "&x="
																			+ mapy
																			+ "&radius=1000&category_group_code=MT1",
																	dataType : "json",
																	success : function(data) {
																		$(data).each(function(index,item) {
																							//console.log(item.meta.total_count);
																							Convecnt += item.meta.total_count;
																							
																							
																							$.ajax({
																								url : "https://dapi.kakao.com/v2/local/search/category.json?",//y=36.801219&x=127.059874&radius=1000", 
																								type : 'GET',
																								headers : {
																									'Authorization' : "KakaoAK 4cba5d6ba47cdc7f21f87b484a07013f"
																								},
																								data : "y="
																										+ mapx
																										+ "&x="
																										+ mapy
																										+ "&radius=1000&category_group_code=SW8",
																								dataType : "json",
																								success : function(data) {
																									$(data).each(function(index,item) {
																														//console.log(item.meta.total_count);
																														Tracnt += item.meta.total_count;
																														
																														console.log("tra" + Tracnt);
																														
																														$.ajax({
																															url : "https://dapi.kakao.com/v2/local/search/category.json?",//y=36.801219&x=127.059874&radius=1000", 
																															type : 'GET',
																															headers : {
																																'Authorization' : "KakaoAK 4cba5d6ba47cdc7f21f87b484a07013f"
																															},
																															data : "y="
																																	+ mapx
																																	+ "&x="
																																	+ mapy
																																	+ "&radius=1000&category_group_code=PK6",
																															dataType : "json",
																															success : function(data) {
																																$(data).each(function(index,item) {
																																					//console.log(item.meta.total_count);
																																					Tracnt += item.meta.total_count;
																																					
																																					
																																					
																																					$.ajax({
																																						url : "https://dapi.kakao.com/v2/local/search/category.json?",//y=36.801219&x=127.059874&radius=1000", 
																																						type : 'GET',
																																						headers : {
																																							'Authorization' : "KakaoAK 4cba5d6ba47cdc7f21f87b484a07013f"
																																						},
																																						data : "y="
																																								+ mapx
																																								+ "&x="
																																								+ mapy
																																								+ "&radius=1000&category_group_code=OL7",
																																						dataType : "json",
																																						success : function(data) {
																																							$(data).each(function(index,item) {
																																												//console.log(item.meta.total_count);
																																												Tracnt += item.meta.total_count;
																																												
																																												
																																												$.ajax({
																																													url : "https://dapi.kakao.com/v2/local/search/category.json?",//y=36.801219&x=127.059874&radius=1000", 
																																													type : 'GET',
																																													headers : {
																																														'Authorization' : "KakaoAK 4cba5d6ba47cdc7f21f87b484a07013f"
																																													},
																																													data : "y="
																																															+ mapx
																																															+ "&x="
																																															+ mapy
																																															+ "&radius=1000&category_group_code=PS3",
																																													dataType : "json",
																																													success : function(data) {
																																														$(data).each(function(index,item) {
																																																			//console.log(item.meta.total_count);
																																																		//	Educnt += item.meta.total_count;
																																																			
																																																			
																																																			$.ajax({
																																																				url : "https://dapi.kakao.com/v2/local/search/category.json?",//y=36.801219&x=127.059874&radius=1000", 
																																																				type : 'GET',
																																																				headers : {
																																																					'Authorization' : "KakaoAK 4cba5d6ba47cdc7f21f87b484a07013f"
																																																				},
																																																				data : "y="
																																																						+ mapx
																																																						+ "&x="
																																																						+ mapy
																																																						+ "&radius=1000&category_group_code=SC4",
																																																				dataType : "json",
																																																				success : function(data) {
																																																					$(data).each(function(index,item) {
																																																										//console.log(item.meta.total_count);
																																																										Educnt += item.meta.total_count;
																																																										console.log("학교" + item.meta.total_count);
																																																										
																																																										
																																																										$.ajax({
																																																											url : "https://dapi.kakao.com/v2/local/search/category.json?",//y=36.801219&x=127.059874&radius=1000", 
																																																											type : 'GET',
																																																											headers : {
																																																												'Authorization' : "KakaoAK 4cba5d6ba47cdc7f21f87b484a07013f"
																																																											},
																																																											data : "y="
																																																													+ mapx
																																																													+ "&x="
																																																													+ mapy
																																																													+ "&radius=1000&category_group_code=AC5",
																																																											dataType : "json",
																																																											success : function(data) {
																																																												$(data).each(function(index,item) {
																																																																	//console.log(item.meta.total_count);
																																																																	//Educnt += item.meta.total_count;
																																																																	//console.log("학원" + item.meta.total_count);
																																																																	
																																																																	$.ajax({
																																																																		url : "https://dapi.kakao.com/v2/local/search/category.json?",//y=36.801219&x=127.059874&radius=1000", 
																																																																		type : 'GET',
																																																																		headers : {
																																																																			'Authorization' : "KakaoAK 4cba5d6ba47cdc7f21f87b484a07013f"
																																																																		},
																																																																		data : "y="
																																																																				+ mapx
																																																																				+ "&x="
																																																																				+ mapy
																																																																				+ "&radius=1000&category_group_code=PO3",
																																																																		dataType : "json",
																																																																		success : function(data) {
																																																																			$(data).each(function(index,item) {
																																																																								//console.log(item.meta.total_count);
																																																																								Pubcnt += item.meta.total_count;
																																																																								
																																																																								
																																																																								$.ajax({
																																																																									url : "https://dapi.kakao.com/v2/local/search/category.json?",//y=36.801219&x=127.059874&radius=1000", 
																																																																									type : 'GET',
																																																																									headers : {
																																																																										'Authorization' : "KakaoAK 4cba5d6ba47cdc7f21f87b484a07013f"
																																																																									},
																																																																									data : "y="
																																																																											+ mapx
																																																																											+ "&x="
																																																																											+ mapy
																																																																											+ "&radius=1000&category_group_code=BK9",
																																																																									dataType : "json",
																																																																									success : function(data) {
																																																																										$(data).each(function(index,item) {
																																																																															//console.log(item.meta.total_count);
																																																																															Pubcnt += item.meta.total_count;
																																																																															
																																																																															
																																																																															
																																																																															$.ajax({
																																																																																url : "https://dapi.kakao.com/v2/local/search/category.json?",//y=36.801219&x=127.059874&radius=1000", 
																																																																																type : 'GET',
																																																																																headers : {
																																																																																	'Authorization' : "KakaoAK 4cba5d6ba47cdc7f21f87b484a07013f"
																																																																																},
																																																																																data : "y="
																																																																																		+ mapx
																																																																																		+ "&x="
																																																																																		+ mapy
																																																																																		+ "&radius=1000&category_group_code=HP8",
																																																																																dataType : "json",
																																																																																success : function(data) {
																																																																																	$(data).each(function(index,item) {
																																																																																						//console.log(item.meta.total_count);
																																																																																						Medcnt += item.meta.total_count;
																																																																																						
																																																																																						
																																																																																						$.ajax({
																																																																																							url : "https://dapi.kakao.com/v2/local/search/category.json?",//y=36.801219&x=127.059874&radius=1000", 
																																																																																							type : 'GET',
																																																																																							headers : {
																																																																																								'Authorization' : "KakaoAK 4cba5d6ba47cdc7f21f87b484a07013f"
																																																																																							},
																																																																																							data : "y="
																																																																																									+ mapx
																																																																																									+ "&x="
																																																																																									+ mapy
																																																																																									+ "&radius=1000&category_group_code=PM9",
																																																																																							dataType : "json",
																																																																																							success : function(data) {
																																																																																								$(data).each(function(index,item) {
																																																																																													//console.log(item.meta.total_count);
																																																																																													Medcnt += item.meta.total_count;
																																																																																													
																																																																																													console.log(Convecnt);
																																																								
																																																																																													console.log(Educnt);
																																																																																													console.log(Tracnt);
																																																																																													console.log(Pubcnt);
																																																																																													console.log(Medcnt);
																																																																																													
																																																																																													
																																																																																													
																																																																																													
																																																																																												
																																																																																													makechart(Convecnt,Educnt,Tracnt,Pubcnt,Medcnt); 
																																																																																												});

																																																																																								//	console.log("a" +Convecnt);

																																																																																							},
																																																																																							error : function() {
																																																																																								console	.log("Cannot get data");
																																																																																							}
																																																																																						}); //ajax
																																																																																						
																																																																																						
																																																																																						
																																																																																					
																																																																																						//makechart(); 차트링크
																																																																																					});

																																																																																	//	console.log("a" +Convecnt);

																																																																																																																										},
																																																																																error : function() {
																																																																																	console	.log("Cannot get data");
																																																																																}
																																																																															}); //ajax
																																																																															
																																																																															
																																																																														
																																																																															//makechart(); 차트링크
																																																																														});

																																																																										//	console.log("a" +Convecnt);

																																																																										
																																																																									},
																																																																									error : function() {
																																																																										console	.log("Cannot get data");
																																																																									}
																																																																								}); //ajax
																																																																								
																																																																								
																																																																								
																																																																							
																																																																								//makechart(); 차트링크
																																																																							});

																																																																			//	console.log("a" +Convecnt);

																																																																			
																																																																		},
																																																																		error : function() {
																																																																			console	.log("Cannot get data");
																																																																		}
																																																																	}); //ajax
																																																																	
																																																																	
																																																																	
																																																																
																																																																	//makechart(); 차트링크
																																																																});

																																																												//	console.log("a" +Convecnt);

																																																												
																																																											},
																																																											error : function() {
																																																												console	.log("Cannot get data");
																																																											}
																																																										}); //ajax
																																																										
																																																										
																																																									
																																																										//makechart(); 차트링크
																																																									});

																																																					//	console.log("a" +Convecnt);

																																																					
																																																				},
																																																				error : function() {
																																																					console	.log("Cannot get data");
																																																				}
																																																			}); //ajax
																																																			
																																																			
																																																			
																																																		
																																																			//makechart(); 차트링크
																																																		});

																																														//	console.log("a" +Convecnt);

																																														
																																													},
																																													error : function() {
																																														console	.log("Cannot get data");
																																													}
																																												}); //ajax
																																												
																																												
																																												
																																											
																																												//makechart(); 차트링크
																																											});

																																							//	console.log("a" +Convecnt);

																																							
																																						},
																																						error : function() {
																																							console	.log("Cannot get data");
																																						}
																																					}); //ajax
																																					
																																					
																																				
																																					//makechart(); 차트링크
																																				});

																																//	console.log("a" +Convecnt);

																																
																															},
																															error : function() {
																																console	.log("Cannot get data");
																															}
																														}); //ajax
																														
																														
																													
																														//makechart(); 차트링크
																													});

																									//	console.log("a" +Convecnt);

											
																								},
																								error : function() {
																									console	.log("Cannot get data");
																								}
																							}); //ajax
																							
																							
																							
																							
																							
																						
																							//makechart(); 차트링크
																						});

																		//	console.log("a" +Convecnt);

																		
																	},
																	error : function() {
																		console	.log("Cannot get data");
																	}
																}); //ajax

													},
													error : function() {
														console
																.log("Cannot get data");
													}
												}); //ajax

									},
									error : function() {
										console.log("Cannot get data");
									}
								}); //ajax_wrap
						}

				
					

						/* 갯수 얻어오기 --------------------------------------------------------------------------  */

						/* 지도 -----------------------------------------------------------------------------------  */
						var geocoder = new daum.maps.services.Geocoder();
						
					
						geocoder.addressSearch(	address,
										function(result, status) {

											//성공
											if (status == daum.maps.services.Status.OK) {

												var p = new daum.maps.LatLng(
														result[0].y,
														result[0].x);

												mapx = p.getLat();
												mapy = p.getLng();
												console.log(mapx);
												// 				count();
												m = new daum.maps.Marker({
													position : p
												});

												m.setMap(map);
												infowindow = new daum.maps.InfoWindow(
														{
															zIndex : 1
														});
														mapContainer = document
																.getElementById('map'), // 지도를 표시할 div 
														mapOption = {
															center : new daum.maps.LatLng(
																	mapx, mapy), // 지도의 중심좌표
															level : 3
														// 지도의 확대 레벨
														};
			
												// 지도를 생성합니다    
												map = new daum.maps.Map(
														mapContainer, mapOption);
												
												map.setZoomable(false);
												
												var marker2 = new daum.maps.Marker({
													//마커 위치
													//position:map.getCenter()	//지도 중심 좌표 객체
													position:new daum.maps.LatLng(mapx,mapy)
													
												});
												
												marker2.setMap(map);

												var placeOverlay = new daum.maps.CustomOverlay(
														{
															zIndex : 1
														}), contentNode = document
														.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
												markers = [], // 마커를 담을 배열입니다
												currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

												var mapContainer = document
														.getElementById('map'), // 지도를 표시할 div 
												mapOption = {
													center : new daum.maps.LatLng(
															mapx, mapy), // 지도의 중심좌표
													level : 5
												// 지도의 확대 레벨
												};

												// 장소 검색 객체를 생성합니다
												var ps = new daum.maps.services.Places(
														map);

												// 지도에 idle 이벤트를 등록합니다
												daum.maps.event.addListener(
														map, 'idle',
														searchPlaces);

												// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
												contentNode.className = 'placeinfo_wrap';

												// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
												// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
												addEventHandle(
														contentNode,
														'mousedown',
														daum.maps.event.preventMap);
												addEventHandle(
														contentNode,
														'touchstart',
														daum.maps.event.preventMap);

												// 커스텀 오버레이 컨텐츠를 설정합니다
												placeOverlay
														.setContent(contentNode);

												// 각 카테고리에 클릭 이벤트를 등록합니다
												addCategoryClickEvent();

												// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
												function addEventHandle(target,
														type, callback) {
													if (target.addEventListener) {
														target
																.addEventListener(
																		type,
																		callback);
													} else {
														target.attachEvent('on'
																+ type,
																callback);
													}
												}

												// 카테고리 검색을 요청하는 함수입니다
												function searchPlaces() {

													// 				console.log(mapx);
													// 				console.log(mapy);
													if (!currCategory) {
														return;
													}

													// 커스텀 오버레이를 숨깁니다 
													placeOverlay.setMap(null);

													// 지도에 표시되고 있는 마커를 제거합니다
													removeMarker();

													ps
															.categorySearch(
																	currCategory,
																	placesSearchCB,
																	{
																		location : new daum.maps.LatLng(
																				mapx,
																				mapy),
																		radius : 1000

																	});

												}

												// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
												function placesSearchCB(data,
														status, pagination) {
													if (status === daum.maps.services.Status.OK) {

														// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
														displayPlaces(data);
													} else if (status === daum.maps.services.Status.ZERO_RESULT) {
														// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

													} else if (status === daum.maps.services.Status.ERROR) {
														alert("error");

													}
												}

												// 지도에 마커를 표출하는 함수입니다
												function displayPlaces(places) {

													// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
													// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
													var order = document
															.getElementById(
																	currCategory)
															.getAttribute(
																	'data-order');

													for (var i = 0; i < places.length; i++) {

														// 마커를 생성하고 지도에 표시합니다
														var marker = addMarker(
																new daum.maps.LatLng(
																		places[i].y,
																		places[i].x),
																order);

														// 마커와 검색결과 항목을 클릭 했을 때
														// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
														(function(marker, place) {
															daum.maps.event
																	.addListener(
																			marker,
																			'click',
																			function() {
																				displayPlaceInfo(place);
																			});
														})(marker, places[i]);

														//console.log(places.length);
													}

												}

												// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
												function addMarker(position,
														order) {
													var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
													imageSize = new daum.maps.Size(
															27, 28), // 마커 이미지의 크기
													imgOptions = {
														spriteSize : new daum.maps.Size(
																72, 208), // 스프라이트 이미지의 크기
														spriteOrigin : new daum.maps.Point(
																46,
																(order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
														offset : new daum.maps.Point(
																11, 28)
													// 마커 좌표에 일치시킬 이미지 내에서의 좌표
													}, markerImage = new daum.maps.MarkerImage(
															imageSrc,
															imageSize,
															imgOptions), marker = new daum.maps.Marker(
															{
																position : position, // 마커의 위치
																image : markerImage
															});

													marker.setMap(map); // 지도 위에 마커를 표출합니다
													markers.push(marker); // 배열에 생성된 마커를 추가합니다

													return marker;
												}

												// 지도 위에 표시되고 있는 마커를 모두 제거합니다
												function removeMarker() {
													for (var i = 0; i < markers.length; i++) {
														markers[i].setMap(null);
													}
													markers = [];
												}

												// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
												function displayPlaceInfo(place) {
													var content = '<div class="placeinfo">'
															+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
															+ place.place_name
															+ '</a>';

													if (place.road_address_name) {
														content += '    <span title="' + place.road_address_name + '">'
																+ place.road_address_name
																+ '</span>'
																+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
																+ place.address_name
																+ ')</span>';
													} else {
														content += '    <span title="' + place.address_name + '">'
																+ place.address_name
																+ '</span>';
													}

													content += '    <span class="tel">'
															+ place.phone
															+ '</span>'
															+ '</div>'
															+ '<div class="after"></div>';

													contentNode.innerHTML = content;
													placeOverlay
															.setPosition(new daum.maps.LatLng(
																	place.y,
																	place.x));
													placeOverlay.setMap(map);
												}

												// 각 카테고리에 클릭 이벤트를 등록합니다
												function addCategoryClickEvent() {
													var category = document
															.getElementById('category'), children = category.children;

													for (var i = 0; i < children.length; i++) { // 카테고리 이름 배열 검색 ***1
														children[i].onclick = onClickCategory;
													}
												}

												// 카테고리를 클릭했을 때 호출되는 함수입니다

												function onClickCategory() {
													var id = this.id, className = this.className;

													placeOverlay.setMap(null);

													if (className === 'on') {
														currCategory = '';
														changeCategoryClass();
														removeMarker();

													} else {
														currCategory = id;
														changeCategoryClass(this);
														searchPlaces();
													}
												}

												// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
												function changeCategoryClass(el) {
													var category = document
															.getElementById('category'), children = category.children, i;

													for (i = 0; i < children.length; i++) {
														children[i].className = '';
													}

													if (el) {
														el.className = 'on';
													}
												}

												getCount();
											} //ok

										}); //maps
						
									
										
										
						/*  지도 ----------------------------------------------------------------------------------------------------------------------------  */

						/* --------------------------------------------------------차트 ---------------------------------------------------------------------  */
						
					function makechart(Conve,Tra,Edu,Pub,Med) {
						
										//	console.log("inchart" + Conve);
						Highcharts.chart('container', {

						    chart: {
						        polar: true,
						        type: 'line'
						    },

						    title: {
						        text: '매물 비교 차트',
						        x: -80
						    },

						    pane: {
						        size: '80%'
						    },

						    xAxis: {
						        categories: ['편의', '교통', '교육', '공공시설','의료'],
						        tickmarkPlacement: 'on',
						        lineWidth: 0
						    },

						    yAxis: {
						        gridLineInterpolation: 'polygon',
						        lineWidth: 0,
						        min: 0
						    },

						    tooltip: {
						        shared: true,
						        pointFormat: '<span style="color:{series.color}">{series.name}: <b></b><br/>'
						    },

						    legend: {
						        align: 'right',
						        verticalAlign: 'top',
						        y: 70,
						        layout: 'vertical'
						    },

						    series: [{
						        name: '매물 정보 차트',
						        data: [Conve,Tra,Edu,Pub,Med],
						        pointPlacement: 'on'
						    }, {
						        name: '이동네 평균',
						        data: [40,20,40,40,40],
						        pointPlacement: 'on'
						    }]

						});
											
					}
						/* --------------------------------------------------------차트 ---------------------------------------------------------------------  */

					}); //ready
					
					
				
</script>
</head>
<body>
	<div class="demo-layout-transparent mdl-layout mdl-js-layout">

		<!-- header -->
		<jsp:include page="/inc/header.jsp"></jsp:include>
		<!-- 		<h1 id = "location">위치</h1> -->
		<%-- 		<h2 id = "sub"> ${dto.address}</h2> --%>


<!-- shopping_cart  attach_money -->
	
		<main class="mdl-layout__content">
		<div style="width:1500px; margin-left:150px;">
		<div id = "itembox">
			
			
			    
		<div id="selitem">
		
			<ul>
				<li><p style="text-align:left; font-size:18px; color:gray; margin-bottom:8px;">
						${dto.kind}
					</p>
					<div style="text-align:left; font-size:25px; font-weight:bold;">
						${dto.dealkind} ${dto.deposit} / ${dto.monthly}
						
					</div>
					</li>
				<li><p style="text-align:left; font-size:18px; color:gray; margin-bottom:8px;">전용면적</p>
					<div  style="text-align:left; font-size:25px; font-weight:bold;">
						${dto.supplyArea}㎡
					</div>
				</li>
			
					
					
				<div>
						<p style="text-align:right; font-size:14px; color:gray; margin-bottom:4px;">${bdto.brokername}</p>
						<div style="text-align:right; font-size:14px; ">${bdto.brokerRepre} ${bdto.brokerTel}</div>
						
				</div>
			</ul>

		</div><!-- selitem  -->
		
		<br><br><br><br>
		
		
<%-- 		<div style="float:left; margin-left:70px;"><p style="font-weight:bold; font-size:20px;">매물번호 ${dto.itemSeq}</p></div>  --%>
		<div style="float:left; margin-left:70px; width: 1000px; height: 40px; margin: 0px auto;">
			
					
<!-- 			<div style="float: left;  "> -->
			<button id = "heart" style="float:left; border:0; outline:0; background-color:transparent; cursor:pointer;">
			<c:if test="${isInter == 0}">			
			<i class= "material-icons" style="float:left; margin: 7px 3px;">favorite_border</i>
			</c:if>
			
			<c:if test="${isInter >= 1}">			
			<i class= "material-icons" style="float:left; margin: 7px 3px; color:red;">favorite</i>
			</c:if>
			
			
<!-- 			</div> -->

			</button>
			
			
			<div style="float:left; margin-top:4px;">
				<a href = "/GolaBang/admin/write.do?itemSeq=${dto.itemSeq}" style="color: black; text-decoration:none; margin-left: 10px;" ><i class ="material-icons" style="font-size:30px; vertical-align: middle;">notification_important</i>허위 매물 신고</a>
			</div>
			<div style="float:left;  margin-top:4px;">
				<a href = "" style="color: black; text-decoration:none; margin-left: 10px;"><i class ="material-icons" style="font-size:30px; vertical-align:middle;">monetization_on</i>거래 하러 가기</a>
			</div>
		</div>
		
		<div id="itemop">

			<div style="border-bottom: 1px solid #eee; height: 50px;">
			<ul>
				
				<li  style="float:left; width:400px; margin-top:10px;"><span style="color:gray;">해당층/건물층</span> &nbsp;&nbsp;${dto.floor} / ${dto.totalFloor} </li>
				<li  style="float:left; width:400px; margin-top:10px;"><span style="color:gray;">난방종류</span>&nbsp;&nbsp; ${dto.heatingKind}</li>
				<li  style="float:left; width:400px; margin-top:10px;"><span style="color:gray;">엘레베이터</span>&nbsp;&nbsp;
				<c:if test = "${addto.elevator == 1}">
				 있음
				 </c:if>
				 <c:if test = "${addto.elevator == 0}">
				 없음
				 </c:if>
				 </li><br><br>
				 </ul>
				</div>
				
				
			<div style="border-bottom: 1px solid #eee; margin: 0px auto; height: 50px;">
				<ul>
				<li style="float:left; width:400px;"><span style="color:gray;">반려동물</span>&nbsp;&nbsp;
				<c:if test = "${addto.pet == 1}">
				 가능
				 </c:if>
				 <c:if test = "${addto.pet== 0}">
				 불가능
				 </c:if>
				</li>
				<li style="float:left;width:400px;"><span style="color:gray;">베란다/발코니</span>&nbsp;&nbsp;
				<c:if test = "${addto.balcony == 1}">
				 있음
				 </c:if>
				 <c:if test = "${addto.balcony == 0}">
				 없음
				 </c:if>
				</li>
				<li style="float:left;width:400px;"><span style="color:gray;">주차</span>&nbsp;&nbsp;
				<c:if test = "${addto.parking == 1}">
				 가능
				 </c:if>
				 <c:if test = "${addto.parking == 0}">
				 없음
				 </c:if>
				</li><br><br>
				
			</ul>
			</div>

			<div style="margin-top: 30px; width: 1200px; height:370px;">
				<div style="float:left;">
				<img src="/GolaBang/images/golabang5.jpg" style="width:600px; height:360px;">
				</div>
				
				<div style="float:left;">
					<div>
					<img src="/GolaBang/images/golabang1.jpg" style="width:296px; height:180px;">
					<img src="/GolaBang/images/golabang2.jpg" style="width:296px; height:180px;">
					</div>
					<div>
					<img src="/GolaBang/images/golabang3.jpg" style="width:296px; height:180px;">
					<img src="/GolaBang/images/golabang4.jpg" style="width:296px; height:180px;">
					</div>
				</div>	
			</div>
	
			
			<div style="height:400px;" id="mainContent">
			<p style="color:#964B00; font-size:30px; height:30px; text-align:left; margin-top:30px; ">${detaildto.subject}</p>
			<div style="border:0px solid black;" id="subContent">
			<p style="margin-bottom:10px;">${detaildto.content}
			
			
			
			
			</p>
			</div>
			</div>
		</div>

		</div><!-- itembox  -->




		<div style="">
			<ul id="nav">
				<li><a href="#chart" style="color:brown; text-decoration:none;">차트</a></li>
				<li><a href="#optioninfo" style="color:brown; text-decoration:none;">옵션 정보</a></li>
				<li><a href="#itemloc" style="color:brown; text-decoration:none;">위치</a></li>
				<li><a href="#otherRoom" style="color:brown; text-decoration:none; margin-top:10px;">이 공인중개사의 다른 방</a></li>
			</ul>
		</div>





		<h3 class="location">
			<a id="chart" name="chart"></a>차트
		</h3>
		<div id="container"
			style="min-width: 310px; height: 400px; max-width: 800px; margin: 0 auto">
		</div>

		<hr>




		<h3 class="location">
			<a id="optioninfo" name="optioninfo"></a>옵션 정보		
	
		
		<div class="sub" id = "opsub" style="margin-top:100px; padding:130px auto;">
		<c:forEach items="${oplist}" var="op">
				<div style= "float:left;">
				
				<i class ="material-icons" style="color:red; font-size:30px; text-align:center;">
				
				<c:if test="${op.optionName == '냉장고'}">
				<span class='iconchoose'>kitchen</span>
				</c:if>
				
				<c:if test="${op.optionName == '전자레인지'}">
				<span class='iconchoose'>picture_in_picture</span>
				</c:if>
				
				
				<c:if test="${op.optionName == '신발장'}">
				<span class='iconchoose'>view_agenda</span>
				</c:if>
				
				
				<c:if test="${op.optionName == 'TV'}">
				<span class='iconchoose'>live_tv</span>
				</c:if>
				
				<c:if test="${op.optionName == '전자도어락'}">
				<span class='iconchoose'>lock</span>
				</c:if>
				
				<c:if test="${op.optionName == '세탁기'}">
				<span class='iconchoose'>local_drink</span>
				</c:if>
				
				<c:if test="${op.optionName == '에어컨'}">
				<span class='iconchoose'>waves</span>
				</c:if>
				</i>
				<h4>${op.optionName}</h4>
				</div>
<!-- https://material.io/tools/icons/?icon=lock&style=baseline -->
				
		</c:forEach>

		<div></h3>

		<hr>
		
		
		<h3 class="location">
			<a id="itemloc" name="itemloc"></a>위치
		</h3>
		<h4 class="sub">${dto.address}</h4>

		<div class="map_wrap">
			<div id="map"
				style="width: 900px; height: 700px; position: relative; overflow: hidden;"></div>
			<div>
				<ul id="category">
					<li id="BK9" data-order="0"><span class="category_bg bank"></span>
						은행</li>
					<li id="MT1" data-order="1"><span class="category_bg mart"></span>
						마트</li>
					<li id="PM9" data-order="2"><span class="category_bg pharmacy"></span>
						약국</li>
					<li id="OL7" data-order="3"><span class="category_bg oil"></span>
						주유소</li>
					<li id="CE7" data-order="4"><span class="category_bg cafe"></span>
						카페</li>
					<li id="CS2" data-order="5"><span class="category_bg store"></span>
						편의점</li>
				</ul>
			</div>
		</div>
		</div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><hr>
		<!-- map_wrap -->
		
		
		
		
		
		<h3 class="location">
			<a id="otherRoom" name="otherRoom"></a>이 공인중개사의 다른 방
		</h3>
	
		<h4 class="sub">
		
<%-- 			<c:forEach items="${otherlist}" var="otdto"> --%>
			
				<div class="mdl-grid" style="margin-left:300px;">
				<div class="mdl-cell mdl-cell--2-col" style="width:300px; margin-right:20px;" onclick ="location.href='/GolaBang/item/itemlocation.do?itemseq=${otherlist[0].itemSeq}'">
					<div style="width:300px; height:300px;"><img src = "/GolaBang/images/${otherlist[0].picture}" style="width:300px; height:300px;"></div>
				<p style="text-align:left; padding-left:40px; margin-bottom:0px;">${otherlist[0].kind}</p>
				<p style="text-align:left; padding-left:40px; margin-bottom:0px; font-weight:bold; font-size:16px;">${otherlist[0].dealkind}  ${otherlist[0].deposit}/ ${otherlist[0].supplyArea}</p>
				<p style="text-align:left; padding-left:40px; margin-bottom:0px;">${otherlist[0].address}</p>
				<p style="text-align:left; padding-left:40px; margin-bottom:0px; color:gray; font-size:10px;">${otherlist[0].floor} / ${otherlist[0].totalFloor}</p>	
				</div>
				
				
				<div class="mdl-cell mdl-cell--2-col" style="width:300px; margin-right:20px;" onclick ="location.href='/GolaBang/item/itemlocation.do?itemseq=${otherlist[1].itemSeq}'">
				<div style="width:300px; height:300px;"><img src = "/GolaBang/images/${otherlist[1].picture}" style="width:300px; height:300px;"></div>
				<p style="text-align:left; padding-left:40px; margin-bottom:0px;">${otherlist[1].kind}</p>
				<p style="text-align:left; padding-left:40px; margin-bottom:0px; font-weight:bold; font-size:16px;">${otherlist[1].dealkind}  ${otherlist[1].deposit}/ ${otherlist[1].supplyArea}</p>
				<p style="text-align:left; padding-left:40px; margin-bottom:0px;">${otherlist[1].address}</p>
				<p style="text-align:left; padding-left:40px; margin-bottom:0px; color:gray; font-size:10px;">${otherlist[1].floor} / ${otherlist[1].totalFloor}</p>	
				</div>
				
				<div class="mdl-cell mdl-cell--2-col" style="width:300px; margin-right:20px;" onclick ="location.href='/GolaBang/item/itemlocation.do?itemseq=${otherlist[2].itemSeq}'">
					<div style="width:300px; height:300px;"><img src = "/GolaBang/images/${otherlist[2].picture}" style="width:300px; height:300px;"></div>
				<p style="text-align:left; padding-left:40px; margin-bottom:0px;">${otherlist[2].kind}</p>
				<p style="text-align:left; padding-left:40px; margin-bottom:0px; font-weight:bold; font-size:16px;">${otherlist[2].dealkind}  ${otherlist[2].deposit}/ ${otherlist[2].supplyArea}</p>
				<p style="text-align:left; padding-left:40px; margin-bottom:0px;">${otherlist[2].address}</p>
				<p style="text-align:left; padding-left:40px; margin-bottom:0px; color:gray; font-size:10px;">${otherlist[2].floor} / ${otherlist[2].totalFloor}</p>	
				</div>
				
				
				<div class="mdl-cell mdl-cell--2-col" style="width:300px; margin-right:20px;" onclick ="location.href='/GolaBang/item/itemlocation.do?itemseq=${otherlist[3].itemSeq}'">
					<div style="width:300px; height:300px;"><img src = "/GolaBang/images/${otherlist[3].picture}" style="width:300px; height:300px;"></div>
				<p style="text-align:left; padding-left:40px; margin-bottom:0px;">${otherlist[3].kind}</p>
				<p style="text-align:left; padding-left:40px; margin-bottom:0px; font-weight:bold; font-size:16px;">${otherlist[3].dealkind}  ${otherlist[3].deposit}/ ${otherlist[3].supplyArea}</p>
				<p style="text-align:left; padding-left:40px; margin-bottom:0px;">${otherlist[0].address}</p>
				<p style="text-align:left; padding-left:40px; margin-bottom:0px; color:gray; font-size:10px;">${otherlist[3].floor} / ${otherlist[3].totalFloor}</p>	
				</div>
				
				
				</div>
			
<%-- 			</c:forEach> --%>
		</h4>		
		
		
		 </main>
		
		
		

		<!-- footer -->
		<%-- <jsp:include page="/inc/footer.jsp"></jsp:include> --%>
	</div>
</body>
</html>