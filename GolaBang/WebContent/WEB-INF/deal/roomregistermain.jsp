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
   border-bottom: 2px solid black;
}

.tab button.active {
   border-bottom: 2px solid black;
   color: black;
}

.tabcontent {
   display: none;
   padding: 6px 12px;
   border: 0px solid green;
   border-top: none;
   min-height: 600px;
   /*    animation: fadeEffect 1s; */
}

/* @keyframes fadeEffect{ */
/*    from{opacity: 0;} */
/*    to{opacity: 1;} */
/* } */
.notice {
   font-size: 15px;
}

#notice {
   margin-top: 50px;
   margin-bottom: 40px;
}

#notice_left>span {
   color: cornflowerblue;
}

#notice_right {
   margin-left: 950px;
   color: #9E9E9E;
}

#real {
   border: 0px solid tomato;
   width: 300px;
   height: 400px;
   padding: 0px;
   margin: 0px 25px 60px 25px;
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

.tab #btnManageRoom {
   border-bottom: 2px solid black;
   color: black;
}

.tabcontent #detail {
   border: 1px solid #9E9E9E;
   width: 1000px;
   height: 130px;
   margin: 0px auto;
   margin-top: 30px;
}

.tabcontent #detail li {
   font-size: 15px;
   line-height: 25px;
}

.tabcontent #itemList {
   border: 0px solid pink;
   width: 1476px;
   height: 440px;
}

.tabcontent #itemList table {
   width: 1002px;
   margin: 0px auto;
   margin-top: 15px;
}

.demo-card-square.mdl-card {
   width: 320px;
   height: 320px;
}

.demo-card-square>.mdl-card__title {
   color: #fff;
   
}

.thumbnails {
   width: 140px;
   height: 100px;
   /* float: left; */
}

dialog {
   border: none;
   box-shadow: 0 9px 46px 8px rgba(0, 0, 0, .14), 0 11px 15px -7px
      rgba(0, 0, 0, .12), 0 24px 38px 3px rgba(0, 0, 0, .2);
   width: 400px;
   height: 800px;
   padding: 0px;
}

#dealSituation {
   width: 1200px;
}

dialog>.modalTitles {
   width: 400px;
   height: 50px;
   background-color: #795548;
   color: white;
}

dialog>.modalTitles>h5 {
   margin: 0px auto;
   padding-top: 16px;
   font-weight: bold;
   text-align: center
}

.detailItemModa l> .modalContents {
   width: 400px;
   height: 400px;
}

.detailItemModal > .modalContents table thead {
   height: 30px;
}

.detailItemModal > .modalContents table thead tr {
   height: 30px;
}

.detailItemModal > .modalContents table thead tr td:first-child {
   font-weight: bold;
}

.detailItemModal > .modalContents table thead tr td {
   padding: 5px;
   height: 30px;
}

#itemListBox > div {
   margin-right: 20px;
}

#itemListBox > div:nth-child(3) {
   margin-right: 0px;
}

.pageBtn {
   width: 85px;
   height: 35px;
   display:inline-block; 
   padding: 5px 14px; 
   background-color: #795548; 
   border-radius: 15px; 
   color: white; 
   text-decoration: none; 
   outline: none; 
   border: 0px; 
   cursor: pointer;
   font-size: 15px;
}



</style>
<script>
   
   $(document).ready(function(){
   
      openRoom(event,'manageRoom');
      
      $("#btnManageRoom").click(function() {
         //alert($(this).attr("id")); //btnRegisterRoom
      })
      
      $(".tablinks").click(function() {
         
         if ($(this).attr("id") == "btnManageRoom") {
            $("#btnDealRoom").css("color","#9E9E9E");
            $("#btnDealRoom").css("border-bottom","2px solid #9E9E9E");
            $("#btnManageRoom").css("color","black");
            $("#btnManageRoom").css("border-bottom","2px solid black");

         } else if ($(this).attr("id") == "btnDealRoom") {
            $("#btnManageRoom").css("color","#9E9E9E");
            $("#btnManageRoom").css("border-bottom","2px solid #9E9E9E");
            $("#btnDealRoom").css("color","black");
            $("#btnDealRoom").css("border-bottom","2px solid black");

         }
         
      }); //tablinks.click
      
      
   }); //ready
   
   function delItem(itemSeq) {

	   if(confirm("정말 삭제하시겠습니까?")) {
	    
			$.ajax({
				
				type: "get",
				url: "/GolaBang/itemdelete.do",
				data: "itemSeq=" + itemSeq,
				dataType: "json",
				success: function(result) {
					
					if(result.result == 1){
						alert("성공");
					} else {
						alert("실패");
					}
					
				},
				error: function(a, b, c) {
					console.log(a, b, c);
				}
				
			}); //ajax
			 
			 //alert("네");
	   } else {
		   alert("삭제를 취소하였습니다.");
	   }
	   
   }
   
   function openRoom(evt, roomName){
      var i, tabcontent, tablinks;
      
      tabcontent = document.getElementsByClassName("tabcontent");
      for(i = 0; i < tabcontent.length; i++){
         tabcontent[i].style.display = "none";
      }
      
      tablinks = document.getElementsByClassName("tablinks");
      for(i = 0; i < tablinks.length; i++){
         tablinks[i].className = tablinks[i].className.replace(" active", "");
      }
      
      document.getElementById(roomName).style.display = "block";
      evt.currentTarget.className += " active";
      
   }
   
   function detailModal(itemSeq) {
      
      $.ajax ({
         type: "get",
         url: "/GolaBang/itemdetailmodal.do",
         data: "itemSeq=" + itemSeq,
         dataType: "json",
         success: function(result) {
            $("#floor" + itemSeq).text(result.floor + " / " + result.totalFloor);
            $("#area" + itemSeq).text(result.useArea + "평 / " + result.supplyArea + "평");
            $("#heat" + itemSeq).text(result.heatingKind);
            
             if (result.elevator == "0") {
               $("#elevator" + itemSeq).text("없음");
            } else {
               $("#elevator" + itemSeq).text("있음");
            }
            
            if (result.pet == "0") {
               $("#pet" + itemSeq).text("불가능");
            } else {
               $("#pet" + itemSeq).text("가능");
            }
            
            if (result.balcony == "0") {
               $("#balcony" + itemSeq).text("없음");
            } else {
               $("#balcony" + itemSeq).text("있음");
            }
            
            $("#movedate" + itemSeq).text(result.moveDate + " 이후");
            
            if (result.builtIn == "0") {
               $("#builtin" + itemSeq).text("없음");
            } else {
               $("#builtin" + itemSeq).text("있음");
            }
             
             $("#content" + itemSeq).text(result.content);
             
             var img = '/GolaBang/picture/' + result.picture;
             
             $("#modalPic" + itemSeq).attr('src', img);
      },
         error: function(a, b, c) {
            alert("실패");
            //console.log(a, b, c);
         }
         
      }); //ajax
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
            <h2>내 방 관리</h2>
         </div>
         <div id="interest_big">
            <div class="tab">
               <button id="btnManageRoom" class="tablinks"
                  onclick="openRoom(event, 'manageRoom')">
                  <h5 style="font-weight: bold;">내 방 관리</h5>
               </button>
               <button id="btnDealRoom" class="tablinks"
                  onclick="openRoom(event, 'dealRoom')">
                  <h5 style="font-weight: bold;">방 거래하기</h5>
               </button>
            </div>


            <!-- 내 방 관리 -->
            <div id="manageRoom" class="tabcontent">
               <div id="detail">
                  <ul>
                     <li>일반 회원은 매물을 등록할 수 없습니다. 공인중개사 회원가입 후 매물을 등록해주세요.</li>
                     <li>진행중 : 내가 등록한 매물이 공개중 또는 거래중인 상태</li>
                     <li>거래완료 : 등록한 매물이 거래완료된 상태</li>
                     <li>검수반려 : 운영원칙 위배 또는 신고로 비공개된 상태</li>
                  </ul>
               </div>

               <div id="itemList" style="border: 0px solid red;">
                  
                       <c:if test="${empty brokerItemList}">
                          <div style="width: 1476px; height: 100px; text-align: center; font-size: 1.3em; font-weight: bold; margin: 155px auto; border: 0px solid black;">
                             등록된 매물이 없습니다.
                          </div>
                       </c:if>
                       <c:if test="${kindOf == 1}">
                          <div style="width: 1476px; height: 100px; text-align: center; font-size: 1.3em; font-weight: bold; margin: 155px auto; border: 0px solid black;">
                             등록된 매물이 없습니다.
                          </div>
                       </c:if>
                      
                      <c:if test="${not empty brokerItemList}">
                      
                         <div id="itemListBox" style="width: 1000px; border: 0px solid blue; margin: 15px auto;">
                         <c:forEach items="${brokerItemList}" var="brokerItemList">
                        <div class="demo-card-square mdl-card mdl-shadow--2dp myRoomManage" style="float:left;">
                           <c:if test="${brokerItemList.itemPicture != null}">
                           <div class="" style="height: 200px; background: url('/GolaBang/picture/${brokerItemList.itemPicture}') bottom right 15% no-repeat #46B6AC;">
                           </c:if>
                           
                           <c:if test="${brokerItemList.itemPicture == null}">
                              <div class="" style="height: 200px; background: url('/GolaBang/images/logo.png') center no-repeat #46B6AC;">
                           </c:if>
                              <div style="padding-left: 10px; padding-top: 10px; color: white;">매물번호 ${brokerItemList.itemSeq}</div>
                              
                              <div style="width:310px; border: 0px solid black; color: white; position: absolute; bottom: 120px; padding:10px; font-size: 22px;">
                                 <c:if test="${brokerItemList.itemDealSituation == 0}">
                                    공개 및 거래중
                                 </c:if>
                                 <c:if test="${brokerItemList.itemDealSituation == 1}">
                                    거래 완료
                                 </c:if>
                              <span style="float:right; margin-right: 5px; font-size: 16px; line-height: 15px;"><i class="material-icons md-18" style="color: red; vertical-align: bottom; padding-right: 5px; font-size: 17px;">favorite</i>${brokerItemList.itemFavorite}</span></div>
                           </div>
                           <hr style="width: 200px; margin-left: 60px; border-color: #e0e0e0;">
                           <div class="mdl-card__supporting-text" style="padding: 0px 0px 16px 16px;">
                              ${brokerItemList.itemClosedNote}
                           </div>
                           <div class="mdl-card__actions mdl-card--border">
                              <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                                 더보기 </a>
                              <a
                                 class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="float: right;" id="btnDelItem" onclick="delItem(${brokerItemList.itemSeq});">
                                 삭제 </a>
                           </div>
                        </div>
                        </c:forEach>
                        <div style="clear:both;"></div>
                     </div>
                     
                     <div style="width:1000px; height: 37px; border: 0px solid green; margin: 30px auto;">
                        <div style="width:174px; border: 0px solid black; margin: 0px auto;">
                        <input type="button" value="Previous" class="pageBtn" id="previousBtn">
                        <input type="button" value="Next" class="pageBtn"  id="nextBtn">
                        </div>
                     </div>
                  </c:if>
               </div>
            </div>

            <!-- 방 거래하기 -->
            <div id="dealRoom" class="tabcontent">
               <div id="detail">
                  <ul>
                     <li>현재 거래중인 계약 상태를 확인할 수 있습니다.</li>
                     <li>공인중개사와 세입자 간의 동의 하에 이루어져야 합니다.</li>
                     <li>거래완료된 계약을 영구보관하여 열람할 수 있습니다.</li>
                     <li>한번 동의를하면 철회할 수 없습니다.</li>
                  </ul>
               </div>


               <div id="itemList">

                  <c:if test="${empty dealItemList}">
                     <div
                        style="width: 1476px; height: 100px; text-align: center; font-size: 1.3em; font-weight: bold; margin: 155px auto; border: 0px solid black;">
                        거래중인 매물이 없습니다.</div>
                  </c:if>


                  <c:if test="${not empty dealItemList}">

                     <table class="mdl-data-table mdl-js-data-table">
                        <tr>
                           <th class="mdl-data-table__cell--non-numeric"
                              style="width: 410px;">매물 정보</th>
                           <c:if test="${kindOf == 1}">
                              <th class="mdl-data-table__cell--non-numeric"
                                 style="width: 390px;">공인 중개사 정보</th>
                           </c:if>
                           <c:if test="${kindOf == 2}">
                              <th class="mdl-data-table__cell--non-numeric"
                                 style="width: 390px;">세입 신청자 정보</th>
                           </c:if>
                           <th class="mdl-data-table__cell--non-numeric"
                              style="width: 200px;">상태</th>
                        </tr>

                        <c:forEach items="${dealItemList}" var="dealItemList">

                           <tr>
                              <td class="mdl-data-table__cell--non-numeric">


                                 <div style="width: 200px; float: left; margin-top:15px;">
                                    <div style="font-size: 17px; font-weight: bold; margin-bottom: 7px;">매물 번호 ${dealItemList.itemSeq}</div>
                                    <div style="font-size: 17px; font-weight: bold; color: #795548; margin-bottom: 7px;">${dealItemList.itemFloor}, ${dealItemList.itemSupplyArea}평</div>
                                    <div style="font-size: 15px; color: #a9a9a9;">${dealItemList.itemKind}
                                       <span>${dealItemList.itemDealKind}
                                                ${dealItemList.itemDeposit} / ${dealItemList.itemMonthly}만</span>
                                    </div>
                                 </div>
                                 <div style="width: 140px; margin-right: 10px;">
                                    <img src="/GolaBang/picture/${dealItemList.picture}" class="thumbnails">
                                 </div>
                                 <div style="clear: both;"></div>
                                 <div style="width: 338px; border-top: 1px solid #E0E0E0; margin-top: 7px; padding-top: 7px; text-align: center;">
                                 <button id="show-dialog${dealItemList.itemSeq}" type="button"
                                    class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect show-dialogs"
                                    onclick="detailModal(${dealItemList.itemSeq});" style="height:30px;">
                                    상세보기</button>
                                 </div>


                              </td>

                              <c:if test="${kindOf == 1}">
                                 <td class="mdl-data-table__cell--non-numeric">
                                    <div>
                                       <i class="material-icons md-dark md-36" style="float:left; color:#FF9800; margin-bottom: 5px;">label_important</i>
                                       <div style="margin-left: 3px; font-size: 15px;">${dealItemList.brokerName}</div>
                                    </div>
                                    <div style="clear: both;"></div>
                                    <div style="margin-bottom: 5px;">
                                       <div style="margin-left: 3px;">대표 ${dealItemList.brokerRepre}</div>
                                    </div>
                                    <div>
                                       <div style="margin-left: 3px;">${dealItemList.brokerTel}</div>
                                    </div>
                                    <div>
                                       <div style="margin-left: 3px;">${dealItemList.brokerAddress}</div>
                                    </div>
                                    
                                 </td>
                              </c:if>

                              <c:if test="${kindOf == 2}">
                                 <td class="mdl-data-table__cell--non-numeric">이름 :
                                    ${dealItemList.tenantName}<br> 연락처 :
                                    ${dealItemList.tenantTel}<br> 이메일 :
                                    ${dealItemList.tenantEmail}
                                 </td>
                              </c:if>

                              <td class="mdl-data-table__cell--non-numeric">
                                 <c:if
                                    test="${dealItemList.itemDealSituation == 0}">
                                    <div style="text-align: center; margin-bottom: 5px;">진행중</div>
                                 </c:if>
                                 <c:if test="${dealItemList.itemDealSituation == 1}">
                                             <div style="text-align: center; margin-bottom: 5px;">거래 완료</div>
                                           </c:if>
                                           <c:if test="${dealItemList.itemDealSituation == 2}">
                                              <div style="text-align: center;">검수 반려</div>
                                           </c:if>

                                 <div style="margin-left: 30px;">
                                 <button
                                    class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"
                                    onclick="location.href='/GolaBang/dealcheck.do?dealSeq=${dealItemList.dealSeq}&itemSeq=${dealItemList.itemSeq}';">
                                    거래페이지</button>
                                 </div>
                              </td>
                           </tr>

                        </c:forEach>
                     </table>

                  </c:if>
                  <!-- dealItemList not empty -->
               </div>
            </div>

         </div>
      </div>


      <%-- <jsp:include page="/inc/footer.jsp"></jsp:include> --%> </main>

      
      <c:forEach items="${dealItemList}" var="dealItemList">
      
      <dialog id="detailItemModal${dealItemList.itemSeq}" class="detailItemModal">

      <div id="modalTitle" class="modalTitles">
         <h5>매물 정보</h5>
      </div>

      <div>
         <img src=""
             id="modalPic${dealItemList.itemSeq}" style="width: 400px; height: 240px;">
      </div>

      <div id="modalContent" class="modalContents">

         <table class="mdl-data-table mdl-js-data-table"
            style="width: 350px; margin: 5px auto; margin-bottom: 15px;">
            <thead>
               <tr>
                  <td class="mdl-data-table__cell--non-numeric">해당층/건물층</td>
                  <td id="floor${dealItemList.itemSeq}" class="mdl-data-table__cell--non-numeric"></td>
               </tr>
               <tr>
                  <td class="mdl-data-table__cell--non-numeric">전용/공급면적</td>
                  <td id="area${dealItemList.itemSeq}" class="mdl-data-table__cell--non-numeric"></td>
               </tr>
               <tr>
                  <td class="mdl-data-table__cell--non-numeric">난방종류</td>
                  <td id="heat${dealItemList.itemSeq}" class="mdl-data-table__cell--non-numeric"></td>
               </tr>
               <tr>
                  <td class="mdl-data-table__cell--non-numeric">엘레베이터</td>
                  <td id="elevator${dealItemList.itemSeq}" class="mdl-data-table__cell--non-numeric"></td>
               </tr>
               <tr>
                  <td class="mdl-data-table__cell--non-numeric">반려동물</td>
                  <td id="pet${dealItemList.itemSeq}" class="mdl-data-table__cell--non-numeric"></td>
               </tr>
               <tr>
                  <td class="mdl-data-table__cell--non-numeric">발코니/베란다</td>
                  <td id="balcony${dealItemList.itemSeq}" class="mdl-data-table__cell--non-numeric"></td>
               </tr>
               <tr>
                  <td class="mdl-data-table__cell--non-numeric">입주가능일</td>
                  <td id="movedate${dealItemList.itemSeq}" class="mdl-data-table__cell--non-numeric"></td>
               </tr>
               <tr>
                  <td class="mdl-data-table__cell--non-numeric">빌트인</td>
                  <td id="builtin${dealItemList.itemSeq}" class="mdl-data-table__cell--non-numeric"></td>
               </tr>
            </thead>

         </table>


         <div
            style="font-size: 1.2em; font-weight: bold; width: 350px; margin: 0px auto;">상세
            설명</div>
         <!-- <div id="content" style="width: 350px; margin:0px auto; border: 1px solid #e0e0e0; min-height: 100px;"></div> -->


         <div class="mdl-textfield mdl-js-textfield"
            style="width: 350px; margin: 0px auto; padding: 0px; margin-left: 24px;">
            <textarea class="mdl-textfield__input" type="text" rows="3"
               id="content${dealItemList.itemSeq}" disabled
               style="font-size: 13px; color: black; border: 1px solid #e0e0e0; min-height: 100px; resize: none; padding: 0px;"></textarea>
         </div>


      </div>
      <div style="width: 350px; margin: 0px auto; margin-top: 30px;">
         <button type="button" class="mdl-button close" style="float: right;">닫기</button>
      </div>
      </dialog>

      </c:forEach>
      
      <c:forEach items="${dealItemList}" var="dealItemList">

      <script>
         
      
            var dialog${dealItemList.itemSeq} = document.getElementById('detailItemModal${dealItemList.itemSeq}');
            var showDialogButton${dealItemList.itemSeq} = document.querySelector('#show-dialog${dealItemList.itemSeq}');
            if (!dialog${dealItemList.itemSeq}.showModal) {
               dialogPolyfill.registerDialog(dialog${dealItemList.itemSeq});
            }
            showDialogButton${dealItemList.itemSeq}.addEventListener('click', function() {
               dialog${dealItemList.itemSeq}.showModal();
            });
            dialog${dealItemList.itemSeq}.querySelector('.close').addEventListener('click',
                  function() {
                     dialog${dealItemList.itemSeq}.close();
                  });
            
         </script>

      </c:forEach>

      <!-- footer -->
   </div>
</body>
</html>