<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title</title>
<%@ include file="/inc/asset.jsp" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
i{
 color:black;
}

/*    체크박스   */

#searchbox_all{
	margin-left:20px;
	border:1px solid black;
}

#searchname{
	width:150px;
	height:30px;
	vertical-align:middle;
	margin-bottom:20px;

}

#main {
   width: 100%;
   height: 65px;
   border: 0px solid green;
   top: 63.99px;
   box-shadow: rgba(0, 0, 0, .2) 0px 3px 1px -2px;
}

#main > ul {
   list-style-type: none;
   margin:0px;
   padding: 0px;
   /* text-align: center; */
}

#main > ul > li {
   display: inline-block;
   width: 100px;
   border: 1px solid #e0e0e0;
   vertical-align: middle;
   margin-right: 15px;
   border-radius: 5px;
}

#main > ul > #addressSearch {
   width: 300px;
   height: 65px;
   border: 0px solid red;
   border-radius: 0px;
   border-right: 1px solid #e0e0e0;
}

#main > ul > #addressSearch #keyword {
   width: 150px;
   height: 100%;
   font-size: 18px;
   padding: 0px 50px 0px 15px;
   line-height: 60px;
   outline: 0px solid black; 
   border: 0px;
}

#main > ul > #addressSearch i {
   font-size: 2.2em;
   margin-left: 0px;
   width: 30px;
   border: 0px solid gray;
   margin-left: 10px;
   vertical-align: middle;
}

#main > ul > #kindSearch {
   width: 150px;
}

#main > ul > li div {
   height: 33px;
   border-radius: 5px;
}

#main > ul > li div span {
   line-height: 35px;
   padding: 10px;
}

#main > ul > li:hover {
   background-color: #e0e0e0;
}

#main > ul > li:first-child:hover {
   background-color: white;
}

#main > ul > li div i {
   border: 0px solid gray;
   display: inline-block;
   float: right;
   line-height: 35px;
}

#main > ul > li div i:hover {
   cursor: pointer;
}

#main > ul > #dealKindSearch {
   width: 100px;
   border: 1px solid #e0e0e0;
}

.Searchbox {
   border: 1px solid #a9a9a9;
   overflow: hidden;
   background-color: white;
   border-radius: 5px;
   padding: 30px;
   z-index: 3;
   position: relative;
}

#boxRoom {
   width: 200px;
   height: 230px;
   transform : translate(320px, -9px);
}

.bxTitle {
   font-size: 26px;
   color: #222;
   margin-bottom: 10px;
   line-height: 20px;
   font-weight: 400;
}

.bxWarn {
   font-size: 12px;
   color: rgb(170, 170, 170);
   line-height: 19px;
   font-weight: 400;
}

#ulRoom > li {
   min-height: 34px;
   padding: 4px 0px 0px 10px;
}

#ulDeal > li {
   min-height: 34px;
   padding: 4px 0px 0px 10px;
}

#boxDealKind {
   width: 200px;
   height: 150px;
   transform : translate(491px, -9px);
}

#boxMoney {
   width: 300px;
   height: 150px;
   transform : translate(612px, -9px);
}

#boxManageCost {
   width: 133px;
   height: 150px;
   transform : translate(733px, -9px);
}

#boxAddOption {
   width: 600px;
   height: 440px;
   transform : translate(974px, -9px);
}

#ulFloor {
   width: 145px;
   border: 0px solid red;
}

#ulFloor  li {
   padding: 0px;
   padding-left: 15px;
   min-height: 0px;
}

#boxAddOption #addFilter label {
   margin-left: 20px;
   margin-bottom: 10px;
}

#boxAddOption #addFilter label:nth-child(odd) {
   margin-right: 30px;
}
.demo-list-control {
  width: 300px;
}

.demo-list-radio {
  display: inline;
}
/*   체크박스 END  */


/*   검색 결과  */
	.item {
	
		display:inline-block;
		border:1px solid #A9A9A9;
		width: 250px;
		height : 300px;
		margin-left:30px;
		margin-top:20px;
		
	}
	
	.item img{
		width:249px;
		height:130px;
		margin-bottom:30px;
		z-index:2;
	}
	
	.itemkind{
		margin-top:-20px;
		text-align:center;
		color:#bbb;
		margin-bottom:20px;
	}
	
	.itemdealkind{
		font-weight:bold;
		font-size:18px;
		margin-bottom:2px;
		text-align:center;
	}
	
	.itemfloor{
	margin : 5px auto 0px auto;
	text-align:center;
	color:gray;
	margin-bottom:2px;
	
	}
	
	
	
	.itemregdate{
		
		position:relative;
		left:0;
		top:0;
		
	}
/*   검색 결과END */


.pagination {
  display: inline-block;
  margin-top:20px;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #795548;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

</style>
<script>
var word = "";
var kind = ['원룸'];
var dealkind = ['월세'];
var park = "";
var admincost = "";
var floor = new Array();
var pet = "";
var builtin = "";
var balcony = "";
var elevator = "";
var page = "${page}";

	$(document).ready(function(){

		
		
		/*         체크박스 선택 시 선택값 가져와서 AJAX 호출      */
		
		
		getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		
		$("#searchbutton").click(function() { //원룸,투룸,쓰리룸,오피스텔
			getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
	    	
	    });
		
		
		
		
		
		
		$("#boxRoom").change(function() { //원룸,투룸,쓰리룸,오피스텔
	         
	         var Checkboxes = $("#ulRoom li input[type='checkbox']"); 
			 kind = [];
	         Checkboxes.each(function() { 
	        
	              if (this.checked === true) { 
	                 kind.push($(this).val());
// 	                 alert(room + "1");
	              }
	        	});
	         	
	            getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
	      });
		
	
		
		
		$("#boxDealKind").change(function() {	//전세,월세
	         
	         var Checkboxes = $("#ulDeal li input[type='checkbox']"); 
			 dealkind = [];
	         Checkboxes.each(function() { 
	               
	              if (this.checked === true) { 
	            	  dealkind.push($(this).val());
// 	                 alert($(this).val());
	              }
	             
	         });
	      
	         getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
	      
	      }); //boxDealKind
	      
	      
	      $("#boxManageCost").change(function() {	//관리비 유무
		         
	    	  
		         admincost= $("#ulManage li input[type='radio']:checked").val(); 
		        
				 getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		             
		       
		      
		      }); //boxManageCost
	
		      
	      $("#boxAddOption").change(function() {	//층수
		         
		         var Checkboxes = $("#ulFloor li input[type='checkbox']"); 
				floor=[];
		         Checkboxes.each(function() { 
		            
		        	 
		              if (this.checked === true) { 
		                 
		              //   alert($(this).val());
		                 console.log($(this).val());
		                 floor.push($(this).val());
		              }
		             
		         });
		       
		           getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      
		      }); //cb_floor_all
	     
		      
		  
	      $("#tg_add_park").change(function() {	//층수
		       
		        // var Checkboxes = $("#label input[type='checkbox']");
		        
		      if($(this).prop("checked") == true){
		    	  park = "1";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		      else{
		    	  park = "0";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		   }); //주차여부
		   
		   
		   $("#tg_add_elevator").change(function() {	//층수
		       
		        // var Checkboxes = $("#label input[type='checkbox']");
		        
		      if($(this).prop("checked") == true){
		    	  elevator = "1";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		      else{
		    	  elevator = "0";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		   }); //주차여부
		   
		   $("#tg_add_biltin").change(function() {	//층수
		       
		        // var Checkboxes = $("#label input[type='checkbox']");
		        
		      if($(this).prop("checked") == true){
		    	  builtin = "1";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		      else{
		    	  builtin = "0";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		   }); //주차여부
		   
		   $("#tg_add_pet").change(function() {	//층수
		       
		        // var Checkboxes = $("#label input[type='checkbox']");
		        
		      if($(this).prop("checked") == true){
		    	  pet = "1";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		      else{
		    	  pet = "0";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		   }); //주차여부
		   
		   $("#tg_add_balcony").change(function() {	//층수
		       
		        // var Checkboxes = $("#label input[type='checkbox']");
		        
		      if($(this).prop("checked") == true){
		    	  balcony = "1";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		      else{
		    	  balcony = "0";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		   }); //주차여부

	      
	      
		      
		      
		      
		      
		      
		      
		      
		 $('.Searchbox').dblclick(function () {
	            //더블 클릭 
	          return false;
	        });

	      
	      $("#boxDealKind").toggle();
	      $("#boxMoney").toggle();
	      $("#boxManageCost").toggle();
	      $("#boxAddOption").toggle();
	      
	      $("#boxRoom").hide();
	      
	      $("#btnRoom").click(function() {
	         $("#boxRoom").toggle();
	         
	         $("#boxDealKind").hide();
	         $("#boxMoney").hide();
	         $("#boxManageCost").hide();
	         $("#boxAddOption").hide();
	      }); //#btnRoom.click
	      
	      $("#btnDealKind").click(function() {
	         $("#boxDealKind").toggle();
	         
	         $("#boxRoom").hide();
	         $("#boxMoney").hide();
	         $("#boxManageCost").hide();
	         $("#boxAddOption").hide();
	      }); //#btnRoom.click
	      
	      $("#btnMoney").click(function() {
	         $("#boxMoney").toggle();
	         $("#boxDealKind").hide();
	         $("#boxRoom").hide();
	         $("#boxManageCost").hide();
	         $("#boxAddOption").hide();
	      }); //#btnMoney.click
	      
	      $("#btnManageCost").click(function() {
	         $("#boxManageCost").toggle();
	         
	         $("#boxDealKind").hide();
	         $("#boxRoom").hide();
	         $("#boxMoney").hide();
	         $("#boxAddOption").hide();
	      }); //#btnMoney.click
	      
	      
	      $("#btnAddOption").click(function() {
	         $("#boxAddOption").toggle();
	         
	         $("#boxDealKind").hide();
	         $("#boxRoom").hide();
	         $("#boxMoney").hide();
	         $("#boxManageCost").hide();
	      }); //#btnMoney.click

	      /*               체크박스 END                     */
	      
	      
	      
	      /*   검색 결과 띄우기    */
	      
	
		
		
		
		
		/*  검색 결과 띄우기 END  */
		
		
		
		/*  클러스터 지도  */
		
		
			var address = "${addlist}";
	      

	      var strAd = address.split(','); //주소 배열
	      
	
	      
//	       for(var i = 0; i < strAd.length; i++){
//	          console.log(strAd[i] + '<br>');
//	       }

//	       console.log(strAd[1]); //주소 1개


	      
	      //--------------------------------------------
	      
	      
	      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	            mapOption = {
	           center: new daum.maps.LatLng(37, 127), // 지도의 중심좌표
	           level: 10 // 지도의 확대 레벨
	          };  

	      // 지도를 생성합니다    
	      var map = new daum.maps.Map(mapContainer, mapOption); 
	      
	      //주소 - 좌표 변환 객체를 생성합니다.
	      var geocoder = new daum.maps.services.Geocoder();
	      
	      var maps = [];
	      
	      for(var i = 0; i < strAd.length; i++){
	         
	      // 주소로 좌표를 검색합니다
	         geocoder.addressSearch(strAd[i], function(result, status) {
	   
	             // 정상적으로 검색이 완료됐으면 
	              if (status === daum.maps.services.Status.OK) {
	   
	                 var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	              
	      
	            //  결과값으로 받은 위치를 마커로 표시합니다
	                 var marker = new daum.maps.Marker({
	                     //map: map,
	                     position: coords //(Lat, Lng)
	                 });
	            
	            	
	            
	            	
	                  maps.push(marker);
	                  //console.log(maps.length);
	   
	                
	              }
	             
	             
	            
	             
	         });
	      }
	      
	                 
	      
	      setTimeout(function() {
	         
	         var clusterer = new daum.maps.MarkerClusterer({
	              map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	              averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	              minLevel: 2 // 클러스터 할 최소 지도 레벨 
	          });
	         
	         clusterer.addMarkers(maps);
	         
	         
	      }, 50000);
	      
	      /*  클러스터지도 END */
		
	      
		
		
	});//READY
	
	
	function getdata(keyword,page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor){
		alert(floor);
		$.ajax({	//검색 ajax
			url:"/GolaBang/item/getresult.do",
			type:"get",
			data:"page="+page+"&word="+ word + "&kind=" + kind + "&dealkind=" + dealkind + "&park=" + park + "&elevator=" + elevator + "&builtin=" + builtin + "&pet=" + pet + "&balcony=" + balcony+ "&admincost=" + admincost+ "&floor=" + floor,
			dataType:"json",
			success:function(result){
			//	alert("성공");
				
				//result.info -> obj2
				//result.list -> array
				
				console.log(result);
				$("#cnt").text(result.info.totalCount);
				
				$("#itemlist").html("");
				if(result.list>=1){
					$("#pagination").html(result.info.pagebar);
					$(result.list).each(function(index, item) {
					
						var row = "";
						var seq = item.seq;
					
						row += "<div class = 'item'" + " onlclick='move(" + item.itemseq + ")'>";
						row += "<img src = '/GolaBang/images/" + item.picture + "'>";
						row += "<div class='itemkind'>" + item.kind + "</div>";
						
						row += "<div class='itemdealkind'>" +  item.dealkind + "&nbsp;" +   item.deposit; 
						if(item.dealkind=="월세"){
							row+= "/";					
						}
						
						row+= item.monthly +  "</div>";
						
						/* <div style='width:88px; margin:0 auto;'></div> */
						row += "<div class='itemfloor'>" + item.floor +" / "+item.useArea + "평</div>";
						row += "<div class='itemfloor'>" + item.subject + "</div>";
						row += "<input type='button' class='mdl-button mdl-js-button mdl-button--primary' style='width:100%;' value = '이동하기' onclick = 'move(" +   item.itemseq + ")' />";
						row += "</div>";
						
						$("#itemlist").append(row);
					
					});	
				}else if(result.list == 0){
					row = "<div style='margin-top:200px;'></div>"
					row += "<h4 style='text-align:center;'>검색결과가 존재하지 않습니다.</h4>";
					
					$("#itemlist").append(row);
				}
				
			},
			error:function(a,b,c){
				console.log(a,b,c);
			}
		
		});//ajax
		
	}
	
	
	function move(seq){
		//alert(seq);
		window.parent.location.href ="/GolaBang/item/itemlocation.do?seq=" + seq;
	}
	
	//페이지 클릭
	function meclick(){
		
	}
	function meclick(pageNumber){
		getdata(keyword,pageNumber,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
	}
	
</script>
</head>
<body onselectstart="return false;">
	<div class="demo-layout-transparent mdl-layout mdl-js-layout"> 

		<!-- header -->
		<jsp:include page="/inc/header.jsp"></jsp:include>
		
		
		<main class="mdl-layout__content">
		
		
		
		
		
	 <div id="roomSearchBar">
         
         <div id="kindSearch">
         
         </div>
         <div style="clear:both;"></div>
      </div>
      
      <div id="main">
         <ul>
            <li id="addressSearch">
               <input type="text" autocomplete="off" name="keyword" id="keyword" placeholder="주소 검색"/>
               <!-- <input type="button" id = "searchbutton" value = "검색"> -->
               <button id = "searchbutton" class="mdl-button mdl-button--Accent">
  				<i class="material-icons">search</i>
				</button>
               
            </li>
            <li id="kindSearch">
               <div>
                  <span>원룸/투룸</span>
                  <i id="btnRoom" class="material-icons" >keyboard_arrow_down</i>
               </div>
            </li>
            <li id="dealKindSearch">
               <div>
                  <span>매물종류</span>
                  <i id="btnDealKind" class="material-icons">keyboard_arrow_down</i>
               </div>
            </li>
            <li>
               <div>
                  <span>가격대</span>
                  <i id="btnMoney" class="material-icons">keyboard_arrow_down</i>
               </div>
            </li>
            <li>
               <div>
                  <span>관리비</span>
                  <i id="btnManageCost" class="material-icons">keyboard_arrow_down</i>
               </div>
            </li>
            <li>
               <div>
                  <span>방 크기</span>
                  <i class="material-icons">keyboard_arrow_down</i>
               </div>
            </li>
            <li>
               <div>
                  <span>추가필터</span>
                  <i id="btnAddOption" class="material-icons">keyboard_arrow_down</i>
               </div>
            </li>
            <li>
               <div>
                  <span>검색</span>
                  <i id="btnSearch" class="material-icons">keyboard_arrow_down</i>
               </div>
            </li>
            <li>
               <div>
                  <span>초기화</span>
                  <i id="btnReset" class="material-icons">keyboard_arrow_down</i>
               </div>
            </li>
         </ul>
         <div id="boxRoom" class="Searchbox" >
            <div class="bxTitle">방종류</div>
            <div class="bxWarn">중복 선택이 가능합니다.</div>
            <ul id = "ulRoom" class="demo-list-control mdl-list">
               <li class="mdl-list__item">
                  <span class="mdl-list__item-secondary-action">
                     <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_room_oneroom">
                     <input type="checkbox" id="cb_room_oneroom" name="cb_room_oneroom" value="원룸" class="mdl-checkbox__input" checked />
                  </label>
                  </span>
                  <span class="mdl-list__item-primary-content">
                     원룸
                  </span>
               </li>
               <li class="mdl-list__item">
                  <span class="mdl-list__item-secondary-action">
                     <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_room_tworoom">
                     <input type="checkbox" id="cb_room_tworoom" name="cb_room_tworoom" value="투룸" class="mdl-checkbox__input"  />
                  </label>
                  </span>
                  <span class="mdl-list__item-primary-content">
                     투룸
                  </span>
               </li>
               <li class="mdl-list__item">
                  <span class="mdl-list__item-secondary-action">
                     <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_room_threeroom">
                     <input type="checkbox" id="cb_room_threeroom" name="cb_room_threeroom" value="쓰리룸" class="mdl-checkbox__input"  />
                  </label>
                  </span>
                  <span class="mdl-list__item-primary-content">
                     쓰리룸
                  </span>
               </li>
               <li class="mdl-list__item">
                  <span class="mdl-list__item-secondary-action">
                     <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_room_office">
                     <input type="checkbox" id="cb_room_office" class="mdl-checkbox__input" value="오피스텔"  />
                  </label>
                  </span>
                  <span class="mdl-list__item-primary-content">
                     오피스텔
                  </span>
               </li>
            </ul>
         </div>
         <div style="clear: both;"></div>
         <div id="boxDealKind" class="Searchbox">
            <div class="bxTitle">매물 종류</div>
            <div class="bxWarn">중복 선택이 가능합니다.</div>
            <ul id = "ulDeal" class="demo-list-control mdl-list">
               <li class="mdl-list__item">
                  <span class="mdl-list__item-secondary-action">
                     <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_deal_month">
                     <input type="checkbox" id="cb_deal_month" class="mdl-checkbox__input" value="월세" />
                  </label>
                  </span>
                  <span class="mdl-list__item-primary-content" >
                     월세
                  </span>
               </li>
               <li class="mdl-list__item">
                  <span class="mdl-list__item-secondary-action">
                     <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_deal_year">
                     <input type="checkbox" id="cb_deal_year" class="mdl-checkbox__input" value="전세" checked />
                  </label>
                  </span>
                  <span class="mdl-list__item-primary-content">
                     전세
                  </span>
               </li>
            </ul>
         </div>

         <div id="boxMoney" class="Searchbox">
            <div class="bxTitle">가격대</div>
            <div class="bxWarn">중복 선택이 가능합니다.</div>
            <input id="slMoney" class="mdl-slider mdl-js-slider" type="range" min="0" max="8" value="8"  tabindex="0">
            <div id="slMoneyValue"></div>
         </div>
         
         <div id="boxManageCost" class="Searchbox">
            <div class="bxTitle">관리비</div>
            <div class="bxWarn"></div>
            <ul id = "ulManage" class="demo-list-control mdl-list">
               <li class="mdl-list__item">
                  <span class="mdl-list__item-secondary-action">
                     <label class="demo-list-radio mdl-radio mdl-js-radio mdl-js-ripple-effect" for="rb_money_no">
                        <input type="radio" id="rb_money_no" class="mdl-radio__button" name="options" value="없음" checked />
                     </label>
                  </span>
                  <span class="mdl-list__item-primary-content">
                     없음
                  </span>
               </li>
               <li class="mdl-list__item">
                  <span class="mdl-list__item-secondary-action">
                     <label class="demo-list-radio mdl-radio mdl-js-radio mdl-js-ripple-effect" for="rb_money_yes">
                        <input type="radio" id="rb_money_yes" class="mdl-radio__button" name="options" value="있음" />
                     </label>
                  </span>
                  <span class="mdl-list__item-primary-content">
                     있음
                  </span>
               </li>
            </ul>
         </div>
         
         <div id="boxAddOption" class="Searchbox">
         
         
         <div  style="border: 0px solid black; height: 200px;">
         
            <div style="border: 0px solid black; border-right: 1px solid #a9a9a9; width: 195px; float: left;">
               <div class="bxTitle">층 수</div>
               <div class="bxWarn">중복 선택이 가능합니다.</div>
               <ul id = "ulFloor" class="demo-list-control mdl-list">
               
<!--                   <li class="mdl-list__item" style="float: left;"> -->
<!--                      <span class="mdl-list__item-secondary-action"> -->
<!--                         <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_floor_all"> -->
<!--                         <input type="checkbox" id="cb_floor_all" class="mdl-checkbox__input"/> -->
<!--                      </label> -->
<!--                      </span> -->
<!--                      <span class="mdl-list__item-primary-content"> -->
<!--                         전체 -->
<!--                      </span> -->
<!--                   </li> -->
                  <li class="mdl-list__item">
                     <span class="mdl-list__item-secondary-action">
                        <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_floor_1">
                        <input type="checkbox" id="cb_floor_1" class="mdl-checkbox__input" value="1층" />
                     </label>
                     </span>
                     <span class="mdl-list__item-primary-content">
                        1층
                     </span>
                  </li>
                  <li class="mdl-list__item" style="float: left;">
                     <span class="mdl-list__item-secondary-action">
                        <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_floor_2">
                        <input type="checkbox" id="cb_floor_2" class="mdl-checkbox__input" value="2층"  />
                     </label>
                     </span>
                     <span class="mdl-list__item-primary-content">
                        2층
                     </span>
                  </li>
                  <li class="mdl-list__item">
                     <span class="mdl-list__item-secondary-action">
                        <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_floor_3" style="margin-left: 7px;">
                        <input type="checkbox" id="cb_floor_3" class="mdl-checkbox__input" value = "3층" />
                     </label>
                     </span>
                     <span class="mdl-list__item-primary-content">
                        3층
                     </span>
                  </li>
                  <li class="mdl-list__item" style="float: left;">
                     <span class="mdl-list__item-secondary-action">
                        <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_floor_4">
                        <input type="checkbox" id="cb_floor_4" class="mdl-checkbox__input" value="4층"  />
                     </label>
                     </span>
                     <span class="mdl-list__item-primary-content">
                        4층
                     </span>
                  </li>
                  <li class="mdl-list__item">
                     <span class="mdl-list__item-secondary-action">
                        <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_floor_5" style="margin-left: 7px;">
                        <input type="checkbox" id="cb_floor_5" class="mdl-checkbox__input" value="5층"  />
                     </label>
                     </span>
                     <span class="mdl-list__item-primary-content">
                        5층
                     </span>
                  </li>
<!--                   <li class="mdl-list__item"> -->
<!--                      <span class="mdl-list__item-secondary-action"> -->
<!--                         <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_floor_2"> -->
<!--                         <input type="checkbox" id="cb_floor_6" class="mdl-checkbox__input" value="6층"  /> -->
<!--                      </label> -->
<!--                      </span> -->
<!--                      <span class="mdl-list__item-primary-content"> -->
<!--                         6층 이상 -->
<!--                      </span> -->
<!--                   </li> -->

               </ul>
            </div>
            <div style="clear: both;"></div>
            <div id="addFilter" style="border: 0px solid black; border-right: 0px solid #a9a9a9; width: 445px; position: relative; top: -190px; left: 221px;">
               <div class="bxTitle">추가옵션</div>
               <div class="bxWarn">중복 선택이 가능합니다.</div>
               <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="tg_add_park" style="display: inline-block; float:left; width: 150px; margin-top: 24px; border: 0px solid red;">
                    <span class="mdl-switch__label">주차 가능</span>
                    <input type="checkbox" id="tg_add_park" class="mdl-switch__input" value = "1">
               </label>
               <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="tg_add_elevator" style="display: inline-block;  width: 150px; margin-top: 24px; border: 0px solid blue;">
                    <span class="mdl-switch__label">엘리베이터</span>
                    <input type="checkbox" id="tg_add_elevator" class="mdl-switch__input" value="1">
               </label>
               <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="tg_add_biltin"  style="display: inline-block; float:left; width: 150px; border: 0px solid red;">
                    <span class="mdl-switch__label">빌트인</span>
                    <input type="checkbox" id="tg_add_biltin" class="mdl-switch__input" value="1">
               </label>
               <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="tg_add_pet" style="display: inline-block;  width: 150px; border: 0px solid blue;">
                    <span class="mdl-switch__label">반려동물</span>
                    <input type="checkbox" id="tg_add_pet" class="mdl-switch__input" value="1">
               </label>
               <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="tg_add_balcony" style="display: inline-block;  width: 150px; ">
                    <span class="mdl-switch__label">베란다</span>
                    <input type="checkbox" id="tg_add_balcony" class="mdl-switch__input" value="1">
               </label>
            </div>
            
            
         </div>
         <div class="bxTitle">우선순위</div>
               <div class="bxWarn" style="font-weight: bold; color: orange; font-size: 14px;">우선순위를 설정하여 맞춤형 검색을 해보세요!</div>
         
               <div style="border: 0px solid black; height: 30px; margin-bottom: 5px; margin-top: 5px;">
                  <input type="button" value="교통" style="width:70px; background-color: gray; line-height: 30px; cursor:pointer; height: 30px; border-radius: 5px; outline: none; color:white; border:0px;">
                  <span>500m 이내 지하철과 버스정류장 여부</span>
               </div>
               <div style="border: 0px solid black;height: 30px; margin-bottom: 5px;">
                  <input type="button" value="편의" style="width:70px; margin-left: -200px; background-color: gray; cursor:pointer; line-height: 30px; height: 30px; border-radius: 5px; outline: none; color:white; border:0px;">
                  <span>100m 이내 편의점, 마트, 까페, 병원 등 편의시설 여부</span>
               
               </div>
               <div style="border: 0px solid black; height: 30px; margin-bottom: 5px;">
                  <input type="button" value="안전" style="width:70px; background-color: gray; margin-left: -200px; line-height: 30px; cursor:pointer; height: 30px; border-radius: 5px; outline: none; color:white; border:0px;">
                  <span>1km 이내 소방서와 경찰서 여부</span>
               
               </div>
               <div style="border: 0px solid black; height: 30px;">
                  <input type="button" value="CCTV" style="width:70px; background-color: gray; line-height: 30px; cursor:pointer; height: 30px; border-radius: 5px; outline: none; color:white; border:0px;">
                  <span>100m 이내 CCTV 여부</span>
               
               </div>
               
               
      </div><!-- boxAddOption -->
		
		
	
		</div>
		
		
		<div style="width:100%; height:1000px; float:left;">
		
		
		<br><br><br>
		
		
		<!--  검색 결과 띄우기 창  -->
		<div id = "getitemlist" style="width:1200px; height: 1000px; overflow : auto; float: left;">
		<br>
		<div style= "font-weight:bold; font-size:30px; margin-left:30px; margin-top:30px;">조건에 맞는 방 <span id = "cnt" style="margin-left:20px;"></span>개</div>
	<hr>

	
		<div id = "itemlist">
	
		<br><br><hr>
		</div>
		<!-- <div id="pagebar"></div> -->
		<div style="width:600px; margin:0 auto; ">
			<div id="pagination"></div>
		</div>
	<div>
		<h1 style="text-align:center;"></h1>
	
	</div>
		
<!-- 		<iframe src = "/GolaBang/item/getitemlist.do" width="800" height = "1000" scrolling="yes" style="float:left;"></iframe> -->

	</div><!-- 검색 결과 띄우기  -->
		
		 
		
	
	
	
		<div id = "clustermap" style="width:700px; height:900px; float:left;">
<!-- 		<iframe src = "/GolaBang/item/map.do" width="400" height = "1000" scrolling="yes" style="float:right;"></iframe>	 -->
			 <div id="map" style="width: 100%; height: 100%;"></div>
		</div>	
	
	
	
	
	
			</div>
  		</main>
		
		
		<!-- footer -->
		<%-- <jsp:include page="/inc/footer.jsp"></jsp:include> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골라방</title>
<%@ include file="/inc/asset.jsp" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
i{
 color:black;
}

/*    체크박스   */

#searchbox_all{
	margin-left:20px;
	border:1px solid black;
}

#searchname{
	width:150px;
	height:30px;
	vertical-align:middle;
	margin-bottom:20px;

}

#main {
   width: 100%;
   height: 65px;
   border: 0px solid green;
   top: 63.99px;
   box-shadow: rgba(0, 0, 0, .2) 0px 3px 1px -2px;
}

#main > ul {
   list-style-type: none;
   margin:0px;
   padding: 0px;
   /* text-align: center; */
}

#main > ul > li {
   display: inline-block;
   width: 100px;
   border: 1px solid #e0e0e0;
   vertical-align: middle;
   margin-right: 15px;
   border-radius: 5px;
}

#main > ul > #addressSearch {
   width: 300px;
   height: 65px;
   border: 0px solid red;
   border-radius: 0px;
   border-right: 1px solid #e0e0e0;
}

#main > ul > #addressSearch #keyword {
   width: 150px;
   height: 100%;
   font-size: 18px;
   padding: 0px 50px 0px 15px;
   line-height: 60px;
   outline: 0px solid black; 
   border: 0px;
}

#main > ul > #addressSearch i {
   font-size: 2.2em;
   margin-left: 0px;
   width: 30px;
   border: 0px solid gray;
   margin-left: 10px;
   vertical-align: middle;
}

#main > ul > #kindSearch {
   width: 150px;
}

#main > ul > li div {
   height: 33px;
   border-radius: 5px;
}

#main > ul > li div span {
   line-height: 35px;
   padding: 10px;
}

#main > ul > li:hover {
   background-color: #e0e0e0;
}

#main > ul > li:first-child:hover {
   background-color: white;
}

#main > ul > li div i {
   border: 0px solid gray;
   display: inline-block;
   float: right;
   line-height: 35px;
}

#main > ul > li div i:hover {
   cursor: pointer;
}

#main > ul > #dealKindSearch {
   width: 100px;
   border: 1px solid #e0e0e0;
}

.Searchbox {
   border: 1px solid #a9a9a9;
   overflow: hidden;
   background-color: white;
   border-radius: 5px;
   padding: 30px;
   z-index: 3;
   position: relative;
}

#boxRoom {
   width: 200px;
   height: 230px;
   transform : translate(320px, -9px);
}

.bxTitle {
   font-size: 26px;
   color: #222;
   margin-bottom: 10px;
   line-height: 20px;
   font-weight: 400;
}

.bxWarn {
   font-size: 12px;
   color: rgb(170, 170, 170);
   line-height: 19px;
   font-weight: 400;
}

#ulRoom > li {
   min-height: 34px;
   padding: 4px 0px 0px 10px;
}

#ulDeal > li {
   min-height: 34px;
   padding: 4px 0px 0px 10px;
}

#boxDealKind {
   width: 200px;
   height: 150px;
   transform : translate(491px, -9px);
}

#boxMoney {
   width: 300px;
   height: 150px;
   transform : translate(612px, -9px);
}

#boxManageCost {
   width: 133px;
   height: 150px;
   transform : translate(733px, -9px);
}

#boxAddOption {
   width: 600px;
   height: 440px;
   transform : translate(974px, -9px);
}

#ulFloor {
   width: 145px;
   border: 0px solid red;
}

#ulFloor  li {
   padding: 0px;
   padding-left: 15px;
   min-height: 0px;
}

#boxAddOption #addFilter label {
   margin-left: 20px;
   margin-bottom: 10px;
}

#boxAddOption #addFilter label:nth-child(odd) {
   margin-right: 30px;
}
.demo-list-control {
  width: 300px;
}

.demo-list-radio {
  display: inline;
}
/*   체크박스 END  */


/*   검색 결과  */
	/*   검색 결과  */
	.item {
	
		display:inline-block;
		border:1px solid #A9A9A9;
		width: 250px;
		height : 300px;
		margin-left:30px;
		margin-top:20px;
		
	}
	
	.item img{
		width:249px;
		height:130px;
		margin-bottom:30px;
		z-index:2;
	}
	
	.itemkind{
		margin-top:-20px;
		text-align:center;
		color:#bbb;
		margin-bottom:20px;
	}
	
	.itemdealkind{
		font-weight:bold;
		font-size:18px;
		margin-bottom:2px;
		text-align:center;
	}
	
	.itemfloor{
	margin : 5px auto 0px auto;
	text-align:center;
	color:gray;
	margin-bottom:2px;
	
	}
	
	
	
	.itemregdate{
		
		position:relative;
		left:0;
		top:0;
		
	}
/*   검색 결과END */

.pagination {
  display: inline-block;
  margin-top:20px;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #795548;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}



</style>
<script>

var word = "";
var kind = ['원룸'];
var dealkind = ['월세'];
var park = "";
var admincost = "";
var floor = [];
var pet = "";
var builtin = "";
var balcony = "";
var elevator = "";
var page = "${page}";
var loginNeed = "${loginNeed}";
var Auth = "${seq}";
	$(document).ready(function(){
		if(Auth=="" || Auth==null){
		var dialog = document.querySelector('#dialog');
		
		var joinlogin = document.querySelector('#joinlogin');
		
		if (!dialog.showModal) {
			dialogPolyfill.registerDialog(dialog);
		}
		
		joinlogin.addEventListener('click', function() {
			dialog.showModal();
		});
		

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
		if(loginNeed==1){
			setTimeout(function() {
				$("#joinlogin").click();
			}, 500);
		}
		}
		/*         체크박스 선택 시 선택값 가져와서 AJAX 호출      */
		
		
		
		getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		
		$("#searchbutton").click(function() { //원룸,투룸,쓰리룸,오피스텔 
			word = $("#keyword").val();
	       
	        getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
	      });
		
		
		
		
		
		
		$("#boxRoom").change(function() { //원룸,투룸,쓰리룸,오피스텔
	         
	         var Checkboxes = $("#ulRoom li input[type='checkbox']"); 
			 kind = [];
	         Checkboxes.each(function() { 
	        
	              if (this.checked === true) { 
	                 kind.push($(this).val());
// 	                 alert(room + "1");
	              }
	        	});
	                 getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
	      });
		
	
		
		
		$("#boxDealKind").change(function() {	//전세,월세
	         
	         var Checkboxes = $("#ulDeal li input[type='checkbox']"); 
			 dealkind = [];
	         Checkboxes.each(function() { 
	               
	              if (this.checked === true) { 
	            	  dealkind.push($(this).val());
// 	                 alert($(this).val());
	              }
	             
	         });

	         getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
	      
	      }); //boxDealKind
	      
	      
	      $("#boxManageCost").change(function() {	//관리비 유무
		         
	    	  
		         admincost= $("#ulManage li input[type='radio']:checked").val(); 
			 
				 getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		             
		       
		      
		      }); //boxManageCost
	
		      
	      $("#boxAddOption").change(function() {	//층수
		         
		         var Checkboxes = $("#ulFloor li input[type='checkbox']"); 
				floor=[];
		         Checkboxes.each(function() { 
		            
		        	 
		              if (this.checked === true) { 
		                 
		              //   alert($(this).val());
		                 console.log($(this).val());
		                 floor.push($(this).val());
		              }
		             
		         });
		           getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      
		      }); //cb_floor_all
	     
		      
		  
	      $("#tg_add_park").change(function() {	//층수
		       
		        // var Checkboxes = $("#label input[type='checkbox']");
		        
		      if($(this).prop("checked") == true){
		    	  park = "1";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		      else{
		    	  park = "0";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		   }); //주차여부
		   
		   
		   $("#tg_add_elevator").change(function() {	//층수
		       
		        // var Checkboxes = $("#label input[type='checkbox']");
		        
		      if($(this).prop("checked") == true){
		    	  elevator = "1";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		      else{
		    	  elevator = "0";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		   }); //주차여부
		   
		   $("#tg_add_biltin").change(function() {	//층수
		       
		        // var Checkboxes = $("#label input[type='checkbox']");
		        
		      if($(this).prop("checked") == true){
		    	  builtin = "1";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		      else{
		    	  builtin = "0";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		   }); //주차여부
		   
		   $("#tg_add_pet").change(function() {	//층수
		       
		        // var Checkboxes = $("#label input[type='checkbox']");
		        
		      if($(this).prop("checked") == true){
		    	  pet = "1";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		      else{
		    	  pet = "0";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		   }); //주차여부
		   
		   $("#tg_add_balcony").change(function() {	//층수
		       
		        // var Checkboxes = $("#label input[type='checkbox']");
		        
		      if($(this).prop("checked") == true){
		    	  balcony = "1";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		      else{
		    	  balcony = "0";
		    	  getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
		      }
		   }); //주차여부

	      
	      
		      
		      
		      
		      
		      
		      
		      
		 $('.Searchbox').dblclick(function () {
	            //더블 클릭 
	          return false;
	        });

	      
	      $("#boxDealKind").toggle();
	      $("#boxMoney").toggle();
	      $("#boxManageCost").toggle();
	      $("#boxAddOption").toggle();
	      
	      $("#boxRoom").hide();
	      
	      $("#btnRoom").click(function() {
	         $("#boxRoom").toggle();
	         
	         $("#boxDealKind").hide();
	         $("#boxMoney").hide();
	         $("#boxManageCost").hide();
	         $("#boxAddOption").hide();
	      }); //#btnRoom.click
	      
	      $("#btnDealKind").click(function() {
	         $("#boxDealKind").toggle();
	         
	         $("#boxRoom").hide();
	         $("#boxMoney").hide();
	         $("#boxManageCost").hide();
	         $("#boxAddOption").hide();
	      }); //#btnRoom.click
	      
	      $("#btnMoney").click(function() {
	         $("#boxMoney").toggle();
	         $("#boxDealKind").hide();
	         $("#boxRoom").hide();
	         $("#boxManageCost").hide();
	         $("#boxAddOption").hide();
	      }); //#btnMoney.click
	      
	      $("#btnManageCost").click(function() {
	         $("#boxManageCost").toggle();
	         
	         $("#boxDealKind").hide();
	         $("#boxRoom").hide();
	         $("#boxMoney").hide();
	         $("#boxAddOption").hide();
	      }); //#btnMoney.click
	      
	      
	      $("#btnAddOption").click(function() {
	         $("#boxAddOption").toggle();
	         
	         $("#boxDealKind").hide();
	         $("#boxRoom").hide();
	         $("#boxMoney").hide();
	         $("#boxManageCost").hide();
	      }); //#btnMoney.click

	      /*               체크박스 END                     */
	      
	      
	      
	      /*   검색 결과 띄우기    */
	      
	
		
		
		
		
		/*  검색 결과 띄우기 END  */
		
		
		
		/*  클러스터 지도  */
		
		
		/* var address = "${addlist}";
	      

	      var strAd = address.split(','); //주소 배열
	      //--------------------------------------------
	      
	      
	      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	            mapOption = {
	           center: new daum.maps.LatLng(37, 127), // 지도의 중심좌표
	           level: 10 // 지도의 확대 레벨
	          };  

	      // 지도를 생성합니다    
	      var map = new daum.maps.Map(mapContainer, mapOption); 
	      
	      //주소 - 좌표 변환 객체를 생성합니다.
	      var geocoder = new daum.maps.services.Geocoder();
	      
	      var maps = [];
	      
	      for(var i = 0; i < strAd.length; i++){
	         
	      // 주소로 좌표를 검색합니다
	         geocoder.addressSearch(strAd[i], function(result, status) {
	   
	             // 정상적으로 검색이 완료됐으면 
	              if (status === daum.maps.services.Status.OK) {
	   
	                 var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	              
	      
	            //  결과값으로 받은 위치를 마커로 표시합니다
	                 var marker = new daum.maps.Marker({
	                     //map: map,
	                     position: coords //(Lat, Lng)
	                 });
	                  maps.push(marker);
	                  //console.log(maps.length);
	   
	              }
	             
	         });
	      }
	      
	                 
	      
	      setTimeout(function() {
	         
	         var clusterer = new daum.maps.MarkerClusterer({
	              map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	              averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	              minLevel: 2 // 클러스터 할 최소 지도 레벨 
	          });
	         
	         clusterer.addMarkers(maps);
	         
	         
	      }, 10000); */
	      
	      /*  클러스터지도 END */
		
		
		
	});//READY
	
	
	function getdata(page,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor){
		/* $.ajax({	//검색 ajax
			url:"/GolaBang/item/getresult.do",
			type:"get",
			data:"page="+page+"&word="+ word + "&kind=" + kind + "&dealkind=" + dealkind + "&park=" + park + "&elevator=" + elevator + "&builtin=" + builtin + "&pet=" + pet + "&balcony=" + balcony+ "&admincost=" + admincost+ "&floor=" + floor,
			dataType:"json",
			success:function(result){
			//	alert("성공");
				
				//result.info -> obj2
				//result.list -> array
				
				console.log(result);
				$("#cnt").text(result.info.totalCount);
				
				$("#itemlist").html("");
				if(result.list>=1){
					$("#pagination").html(result.info.pagebar);
					$(result.list).each(function(index, item) {
					
						var row = "";
						var seq = item.seq;
					
						row += "<div class = 'item'" + " onlclick='move(" + item.itemseq + ")'>";
						row += "<img src = '/GolaBang/images/" + item.picture + "'>";
						row += "<div class='itemkind'>" + item.kind + "</div>";
						
						row += "<div class='itemdealkind'>" +  item.dealkind + "&nbsp;" +   item.deposit; 
						if(item.dealkind=="월세"){
							row+= "/";					
						}
						
						row+= item.monthly +  "</div>";
						
						// <div style='width:88px; margin:0 auto;'></div> 
						row += "<div class='itemfloor'>" + item.floor +" / "+item.useArea + "평</div>";
						row += "<div class='itemfloor'>" + item.subject + "</div>";
						row += "<input type='button' class='mdl-button mdl-js-button mdl-button--primary' style='width:100%;' value = '이동하기' onclick = 'move(" +   item.itemseq + ")' />";
						row += "</div>";
						
						$("#itemlist").append(row);
					
					});	
				}else if(result.list == 0){
					row = "<div style='margin-top:200px;'></div>"
					row += "<h4 style='text-align:center;'>검색결과가 존재하지 않습니다.</h4>";
					
					$("#itemlist").append(row);
				}
				
			},
			error:function(a,b,c){
				console.log(a,b,c);
			}
		
		});*/ //ajax 
		$.ajax({	//검색 ajax
			url:"/GolaBang/item/getresult.do",
			type:"get",
			data:"page="+page+"&word="+ word + "&kind=" + kind + "&dealkind=" + dealkind + "&park=" + park + "&elevator=" + elevator + "&builtin=" + builtin + "&pet=" + pet + "&balcony=" + balcony+ "&admincost=" + admincost+ "&floor=" + floor,
			dataType:"json",
			success:function(result){
			//	alert("성공");
				console.log(result.mapList);
				//result.info -> obj2
				//result.list -> array
				
				console.log(result);
				$("#cnt").text(result.info.totalCount);
				
				$("#itemlist").html("");
				$("#pagination").html(result.info.pagebar);
				
				
				if(result.list.length>=1){
					$(result.list).each(function(index, item) {
					
						var row = "";
						var seq = item.seq;
					
						row += "<div class = 'item'" + " onlclick='move(" + item.itemseq + ")'>";
						row += "<img src = '/GolaBang/images/" + item.picture + "'>";
						row += "<div class='itemkind'>" + item.kind + "</div>";
						
						row += "<div class='itemdealkind'>" +  item.dealkind + "&nbsp;" +   item.deposit; 
						if(item.dealkind=="월세"){
							row+= "/";					
						}
						
						row+= item.monthly +  "</div>";
						
						/* <div style='width:88px; margin:0 auto;'></div> */
						row += "<div class='itemfloor'>" + item.floor +" / "+item.useArea + "평</div>";
						row += "<div class='itemfloor'>" + item.subject + "</div>";
						row += "<input type='button' class='mdl-button mdl-js-button mdl-button--primary' style='width:100%;' value = '이동하기' onclick = 'move(" +   item.itemseq + ")' />";
						row += "</div>";
						
						$("#itemlist").append(row);
						
					
					});	
				}else if(result.list.length == 0){
					row = "<div style='margin-top:200px;'></div>"
					row += "<h4 style='text-align:center;'>검색결과가 존재하지 않습니다.</h4>";
					
					$("#itemlist").append(row);
				}
				/*  클러스터 지도  */
			     	
					console.log("${addlist}");
					
					console.log(result.mapList);
					
					var strAd = result.mapList; //주소 배열
			      
			
			      
//			       for(var i = 0; i < strAd.length; i++){
//			          console.log(strAd[i] + '<br>');
//			       }

//			       console.log(strAd[1]); //주소 1개

				  
			      
			      //--------------------------------------------
			      
			      
			      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			            mapOption = {
			           center: new daum.maps.LatLng(37, 127), // 지도의 중심좌표
			           level: 10 // 지도의 확대 레벨
			          };  

			      // 지도를 생성합니다    
  			      /* map=null; */
 			      var map = new daum.maps.Map(mapContainer, mapOption); 
			      
			      //주소 - 좌표 변환 객체를 생성합니다.
			      var geocoder = new daum.maps.services.Geocoder();
			      
			      var maps = [];
			      
			      for(var i = 0; i < strAd.length; i++){
			         
			      // 주소로 좌표를 검색합니다
			         geocoder.addressSearch(strAd[i].address_Map, function(result, status) {
			   
			             // 정상적으로 검색이 완료됐으면 
			              if (status === daum.maps.services.Status.OK) {
			   
			                 var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			              
			      
			            //  결과값으로 받은 위치를 마커로 표시합니다
			                 var marker = new daum.maps.Marker({
			                     //map: map,
			                     position: coords //(Lat, Lng)
			                 });
			                  maps.push(marker);
			                  //console.log(maps.length);
			   
			              }
			             
			         });
			      }
			      
			      setTimeout(function() {
				         
				         var clusterer = new daum.maps.MarkerClusterer({
				              map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
				              averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
				              minLevel: 2 // 클러스터 할 최소 지도 레벨 
				          });
				         
				         clusterer.addMarkers(maps);
				         
				         
				      }, 15000);
			},
			error:function(a,b,c){
				console.log(a,b,c);
			}
		
		});//ajax
		
	}
	
	
	function move(seq){
		//alert(seq);
		window.parent.location.href ="/GolaBang/item/itemlocation.do?itemseq=" + seq;
	}
	//페이지 클릭
	function meclick(){
		
	}
	function meclick(pageNumber){
		getdata(pageNumber,word,kind,dealkind,park,elevator,builtin,pet,balcony,admincost,floor);
	}
	
</script>
</head>
<body onselectstart="return false;">
	<div class="demo-layout-transparent mdl-layout mdl-js-layout"> 

		<!-- header -->
		<jsp:include page="/inc/header.jsp"></jsp:include>
		
		
		<main class="mdl-layout__content">
		
		
		
		
		
	 <div id="roomSearchBar">
         
         <div id="kindSearch">
         
         </div>
         <div style="clear:both;"></div>
      </div>
      
      <div id="main">
         <ul>
            <li id="addressSearch">
               <input type="text" autocomplete="off" name="keyword" id="keyword" placeholder="주소 검색"/>
               <!-- <input type="button" id = "searchbutton" value = "검색"> -->
               <button id = "searchbutton" class="mdl-button mdl-button--Accent">
  				<i class="material-icons">search</i>
				</button>
               
            </li>
            <li id="kindSearch">
               <div>
                  <span>원룸/투룸</span>
                  <i id="btnRoom" class="material-icons" >keyboard_arrow_down</i>
               </div>
            </li>
            <li id="dealKindSearch">
               <div>
                  <span>매물종류</span>
                  <i id="btnDealKind" class="material-icons">keyboard_arrow_down</i>
               </div>
            </li>
            <li>
               <div>
                  <span>가격대</span>
                  <i id="btnMoney" class="material-icons">keyboard_arrow_down</i>
               </div>
            </li>
            <li>
               <div>
                  <span>관리비</span>
                  <i id="btnManageCost" class="material-icons">keyboard_arrow_down</i>
               </div>
            </li>
            <li>
               <div>
                  <span>방 크기</span>
                  <i class="material-icons">keyboard_arrow_down</i>
               </div>
            </li>
            <li>
               <div>
                  <span>추가필터</span>
                  <i id="btnAddOption" class="material-icons">keyboard_arrow_down</i>
               </div>
            </li>
            <li>
               <div>
                  <span>검색</span>
                  <i id="btnSearch" class="material-icons">keyboard_arrow_down</i>
               </div>
            </li>
            <li>
               <div>
                  <span>초기화</span>
                  <i id="btnReset" class="material-icons">keyboard_arrow_down</i>
               </div>
            </li>
         </ul>
         <div id="boxRoom" class="Searchbox" >
            <div class="bxTitle">방종류</div>
            <div class="bxWarn">중복 선택이 가능합니다.</div>
            <ul id = "ulRoom" class="demo-list-control mdl-list">
               <li class="mdl-list__item">
                  <span class="mdl-list__item-secondary-action">
                     <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_room_oneroom">
                     <input type="checkbox" id="cb_room_oneroom" name="cb_room_oneroom" value="원룸" class="mdl-checkbox__input" checked />
                  </label>
                  </span>
                  <span class="mdl-list__item-primary-content">
                     원룸
                  </span>
               </li>
               <li class="mdl-list__item">
                  <span class="mdl-list__item-secondary-action">
                     <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_room_tworoom">
                     <input type="checkbox" id="cb_room_tworoom" name="cb_room_tworoom" value="투룸" class="mdl-checkbox__input"  />
                  </label>
                  </span>
                  <span class="mdl-list__item-primary-content">
                     투룸
                  </span>
               </li>
               <li class="mdl-list__item">
                  <span class="mdl-list__item-secondary-action">
                     <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_room_threeroom">
                     <input type="checkbox" id="cb_room_threeroom" name="cb_room_threeroom" value="쓰리룸" class="mdl-checkbox__input"  />
                  </label>
                  </span>
                  <span class="mdl-list__item-primary-content">
                     쓰리룸
                  </span>
               </li>
               <li class="mdl-list__item">
                  <span class="mdl-list__item-secondary-action">
                     <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_room_office">
                     <input type="checkbox" id="cb_room_office" class="mdl-checkbox__input" value="오피스텔"  />
                  </label>
                  </span>
                  <span class="mdl-list__item-primary-content">
                     오피스텔
                  </span>
               </li>
            </ul>
         </div>
         <div style="clear: both;"></div>
         <div id="boxDealKind" class="Searchbox">
            <div class="bxTitle">매물 종류</div>
            <div class="bxWarn">중복 선택이 가능합니다.</div>
            <ul id = "ulDeal" class="demo-list-control mdl-list">
               <li class="mdl-list__item">
                  <span class="mdl-list__item-secondary-action">
                     <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_deal_month">
                     <input type="checkbox" id="cb_deal_month" class="mdl-checkbox__input" value="월세" />
                  </label>
                  </span>
                  <span class="mdl-list__item-primary-content" >
                     월세
                  </span>
               </li>
               <li class="mdl-list__item">
                  <span class="mdl-list__item-secondary-action">
                     <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_deal_year">
                     <input type="checkbox" id="cb_deal_year" class="mdl-checkbox__input" value="전세" checked />
                  </label>
                  </span>
                  <span class="mdl-list__item-primary-content">
                     전세
                  </span>
               </li>
            </ul>
         </div>

         <div id="boxMoney" class="Searchbox">
            <div class="bxTitle">가격대</div>
            <div class="bxWarn">중복 선택이 가능합니다.</div>
            <input id="slMoney" class="mdl-slider mdl-js-slider" type="range" min="0" max="8" value="8"  tabindex="0">
            <div id="slMoneyValue"></div>
         </div>
         
         <div id="boxManageCost" class="Searchbox">
            <div class="bxTitle">관리비</div>
            <div class="bxWarn"></div>
            <ul id = "ulManage" class="demo-list-control mdl-list">
               <li class="mdl-list__item">
                  <span class="mdl-list__item-secondary-action">
                     <label class="demo-list-radio mdl-radio mdl-js-radio mdl-js-ripple-effect" for="rb_money_no">
                        <input type="radio" id="rb_money_no" class="mdl-radio__button" name="options" value="없음" checked />
                     </label>
                  </span>
                  <span class="mdl-list__item-primary-content">
                     없음
                  </span>
               </li>
               <li class="mdl-list__item">
                  <span class="mdl-list__item-secondary-action">
                     <label class="demo-list-radio mdl-radio mdl-js-radio mdl-js-ripple-effect" for="rb_money_yes">
                        <input type="radio" id="rb_money_yes" class="mdl-radio__button" name="options" value="있음" />
                     </label>
                  </span>
                  <span class="mdl-list__item-primary-content">
                     있음
                  </span>
               </li>
            </ul>
         </div>
         
         <div id="boxAddOption" class="Searchbox">
         
         
         <div  style="border: 0px solid black; height: 200px;">
         
            <div style="border: 0px solid black; border-right: 1px solid #a9a9a9; width: 195px; float: left;">
               <div class="bxTitle">층 수</div>
               <div class="bxWarn">중복 선택이 가능합니다.</div>
               <ul id = "ulFloor" class="demo-list-control mdl-list">
               
<!--                   <li class="mdl-list__item" style="float: left;"> -->
<!--                      <span class="mdl-list__item-secondary-action"> -->
<!--                         <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_floor_all"> -->
<!--                         <input type="checkbox" id="cb_floor_all" class="mdl-checkbox__input"/> -->
<!--                      </label> -->
<!--                      </span> -->
<!--                      <span class="mdl-list__item-primary-content"> -->
<!--                         전체 -->
<!--                      </span> -->
<!--                   </li> -->
                  <li class="mdl-list__item">
                     <span class="mdl-list__item-secondary-action">
                        <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_floor_1">
                        <input type="checkbox" id="cb_floor_1" class="mdl-checkbox__input" value="1층" />
                     </label>
                     </span>
                     <span class="mdl-list__item-primary-content">
                        1층
                     </span>
                  </li>
                  <li class="mdl-list__item" style="float: left;">
                     <span class="mdl-list__item-secondary-action">
                        <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_floor_2">
                        <input type="checkbox" id="cb_floor_2" class="mdl-checkbox__input" value="2층"  />
                     </label>
                     </span>
                     <span class="mdl-list__item-primary-content">
                        2층
                     </span>
                  </li>
                  <li class="mdl-list__item">
                     <span class="mdl-list__item-secondary-action">
                        <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_floor_3" style="margin-left: 7px;">
                        <input type="checkbox" id="cb_floor_3" class="mdl-checkbox__input" value = "3층" />
                     </label>
                     </span>
                     <span class="mdl-list__item-primary-content">
                        3층
                     </span>
                  </li>
                  <li class="mdl-list__item" style="float: left;">
                     <span class="mdl-list__item-secondary-action">
                        <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_floor_4">
                        <input type="checkbox" id="cb_floor_4" class="mdl-checkbox__input" value="4층"  />
                     </label>
                     </span>
                     <span class="mdl-list__item-primary-content">
                        4층
                     </span>
                  </li>
                  <li class="mdl-list__item">
                     <span class="mdl-list__item-secondary-action">
                        <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_floor_5" style="margin-left: 7px;">
                        <input type="checkbox" id="cb_floor_5" class="mdl-checkbox__input" value="5층"  />
                     </label>
                     </span>
                     <span class="mdl-list__item-primary-content">
                        5층
                     </span>
                  </li>
<!--                   <li class="mdl-list__item"> -->
<!--                      <span class="mdl-list__item-secondary-action"> -->
<!--                         <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="cb_floor_2"> -->
<!--                         <input type="checkbox" id="cb_floor_6" class="mdl-checkbox__input" value="6층"  /> -->
<!--                      </label> -->
<!--                      </span> -->
<!--                      <span class="mdl-list__item-primary-content"> -->
<!--                         6층 이상 -->
<!--                      </span> -->
<!--                   </li> -->

               </ul>
            </div>
            <div style="clear: both;"></div>
            <div id="addFilter" style="border: 0px solid black; border-right: 0px solid #a9a9a9; width: 445px; position: relative; top: -190px; left: 221px;">
               <div class="bxTitle">추가옵션</div>
               <div class="bxWarn">중복 선택이 가능합니다.</div>
               <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="tg_add_park" style="display: inline-block; float:left; width: 150px; margin-top: 24px; border: 0px solid red;">
                    <span class="mdl-switch__label">주차 가능</span>
                    <input type="checkbox" id="tg_add_park" class="mdl-switch__input" value = "1">
               </label>
               <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="tg_add_elevator" style="display: inline-block;  width: 150px; margin-top: 24px; border: 0px solid blue;">
                    <span class="mdl-switch__label">엘리베이터</span>
                    <input type="checkbox" id="tg_add_elevator" class="mdl-switch__input" value="1">
               </label>
               <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="tg_add_biltin"  style="display: inline-block; float:left; width: 150px; border: 0px solid red;">
                    <span class="mdl-switch__label">빌트인</span>
                    <input type="checkbox" id="tg_add_biltin" class="mdl-switch__input" value="1">
               </label>
               <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="tg_add_pet" style="display: inline-block;  width: 150px; border: 0px solid blue;">
                    <span class="mdl-switch__label">반려동물</span>
                    <input type="checkbox" id="tg_add_pet" class="mdl-switch__input" value="1">
               </label>
               <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="tg_add_balcony" style="display: inline-block;  width: 150px; ">
                    <span class="mdl-switch__label">베란다</span>
                    <input type="checkbox" id="tg_add_balcony" class="mdl-switch__input" value="1">
               </label>
            </div>
            
            
         </div>
         <div class="bxTitle">우선순위</div>
               <div class="bxWarn" style="font-weight: bold; color: orange; font-size: 14px;">우선순위를 설정하여 맞춤형 검색을 해보세요!</div>
         
               <div style="border: 0px solid black; height: 30px; margin-bottom: 5px; margin-top: 5px;">
                  <input type="button" value="교통" style="width:70px; background-color: gray; line-height: 30px; cursor:pointer; height: 30px; border-radius: 5px; outline: none; color:white; border:0px;">
                  <span>500m 이내 지하철과 버스정류장 여부</span>
               </div>
               <div style="border: 0px solid black;height: 30px; margin-bottom: 5px;">
                  <input type="button" value="편의" style="width:70px; margin-left: -200px; background-color: gray; cursor:pointer; line-height: 30px; height: 30px; border-radius: 5px; outline: none; color:white; border:0px;">
                  <span>100m 이내 편의점, 마트, 까페, 병원 등 편의시설 여부</span>
               
               </div>
               <div style="border: 0px solid black; height: 30px; margin-bottom: 5px;">
                  <input type="button" value="안전" style="width:70px; background-color: gray; margin-left: -200px; line-height: 30px; cursor:pointer; height: 30px; border-radius: 5px; outline: none; color:white; border:0px;">
                  <span>1km 이내 소방서와 경찰서 여부</span>
               
               </div>
               <div style="border: 0px solid black; height: 30px;">
                  <input type="button" value="CCTV" style="width:70px; background-color: gray; line-height: 30px; cursor:pointer; height: 30px; border-radius: 5px; outline: none; color:white; border:0px;">
                  <span>100m 이내 CCTV 여부</span>
               
               </div>
               
               
      </div><!-- boxAddOption -->
		
		
	
		</div>
		
		
		<div style="width:100%; height:1000px; float:left;">
		
		
		<br><br><br>
		
		
		<!--  검색 결과 띄우기 창  -->
		<div id = "getitemlist" style="width:1200px; height: 1000px; overflow : auto; float: left;">
		<br>
		<div style= "font-weight:bold; font-size:30px; margin-left:30px; margin-top:30px;">조건에 맞는 방 <span id = "cnt" style="margin-left:20px;"></span>개</div>
	<hr>

	
		<div id = "itemlist">
	
		<br><br><hr>
		</div>
		<!-- <div id="pagebar"></div> -->
		<div style="width:500px; margin:0 auto;">
			<div id="pagination" class="pagination"></div>
		</div>
	<div>
		<h1 style="text-align:center;"></h1>
	
	</div>
		
<!-- 		<iframe src = "/GolaBang/item/getitemlist.do" width="800" height = "1000" scrolling="yes" style="float:left;"></iframe> -->

	</div><!-- 검색 결과 띄우기  -->
		
		 
		
	
	
	
		<div id = "clustermap" style="width:700px; height:900px; float:left;">
<!-- 		<iframe src = "/GolaBang/item/map.do" width="400" height = "1000" scrolling="yes" style="float:right;"></iframe>	 -->
			 <div id="map" style="width: 100%; height: 100%;"></div>
		</div>	
	
	
	
	
	
			</div>
  		</main>
		
				
		<!-- footer -->
		<%-- <jsp:include page="/inc/footer.jsp"></jsp:include> --%>
	</div>
</body>
</html>

