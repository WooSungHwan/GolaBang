
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골라방</title>

   
<%@include file="/inc/asset.jsp" %>
<style>
@font-face { font-family: 'designhouseOTFLight00'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_three@1.0/designhouseOTFLight00.woff') format('woff'); font-weight: normal; font-style: normal; }

i {
 color:black;
}

#title{
   width: 300px;
   height: 100px;
   margin: 10px auto;
}

#title > h2{
/*    font-family: 'designhouseOTFLight00'; */
   font-weight: bold;
}

#interest_big{

   width: 1500px;
   height: 700px;
   border:0px solid red;
   margin: 0px auto;
}

#interest_big > .tblbox {
   width: 482px;
   height: 350px;
   border: 0px solid green;   
}

#interest_big #dealbox {
   width: 593px;
   height: 450px;
}

#interest_big > #dealbox > .panel-heading {
   width: 561px;
}

#interest_big > #dealbox > .panel-body {
   width: 570px;
   height: 300px;
}

#interest_big > #dealbox > .panel-body table {
   width: 570px;
}

#interest_big > .tblbox > .panel-body table {
   width: 450px;
}

#interest_big > .tblbox > .panel-body table tr td {
   border-left: 1px solid #DBDBDB;
   width: 310px;
}

#interest_big > .tblbox > .panel-body table tr th {
   border-bottom: 1px solid #DBDBDB;
   background-color: #eee;
   width: 140px;
}

/* .panel {
   border-color: #ddd;
   margin-bottom: 20px;
   border-radius: 4px;
   box-shadow: rgba(0, 0, 0, .05);
} */


.panel-heading {
   width: 450px;
   height: 30px;
   border: 1px solid #ddd;
   border-top-left-radius: 3px;
   border-top-right-radius: 3px;
   padding: 10px 15px;
   color: #333;
   background-color: #f5f5f5;
}

.panel-body {
   border: 1px solid #ddd;
   border-top: 0px;
   width: 460px;
   height: 250px;
   padding: 10px;
   padding-top: 20px;
}

.panel-body table {
   margin: 0px auto;
}

/* 모달 */
dialog {
   border: none;
   box-shadow: 
   0 9px 46px 8px rgba(0, 0, 0, .14), 
   0 11px 15px -7px rgba(0, 0, 0, .12), 
   0 24px 38px 3px rgba(0, 0, 0, .2);
   width: 750px;
   height: 800px;
   padding: 0px;
}

dialog > .modalTitles {
   width: 750px;
   height: 50px;
   background-color: #795548;
   color: white;
}

dialog > .modalTitles > h5 {
   margin: 0px auto;
   padding-top: 16px;
   font-weight: bold;
   text-align: center
}

#dealContractDetail > #modalContent {
   width: 750px;
   height: 650px;
   outline: 0px solid red;
   margin-top: 25px;
}

#dealContractDetail > #modalContent > #tblTitle{
   width: 700px;
   height: 50px;
   outline: 0px solid green;
   margin: 0px auto;
}

#dealContractDetail > #modalContent #dealtbl {
   border: 1px solid #a9a9a9;
   border-collapse: collapse;
   width: 703px;
   height: 500px;
   margin: 0px auto;
}

#dealContractDetail > #modalContent #dealtbl tr, #dealContractDetail > #modalContent #dealtbl td {
   border: 1px solid #a9a9a9;
   padding: 3px;
}

#dealContractDetail > #modalContent #dealtbl .tblHead {
   width: 100px;
}

#dealContractDetail > #modalContent #dealtbl td {
	padding-left: 6px;
}

</style>
<script>
   $(document).ready(function(){
   
      $.ajax({
        type: "get",
        url: "/GolaBang/dealinfo.do",
        data: "dealSeq=" + ${dealSeq},
        dataType: "json",
        success: function(result) {
           //alert("?");
           $("#estateName").text(result.EstateName);
           $("#brokerName").text(result.brokerName);
           $("#brokerTel").text(result.brokerTel);
           $("#EstateAddress").text(result.EstateAddress);
           $("#brokerEmail").text(result.brokerEmail);
           
           $("#tenantName").text(result.tenantName);
           $("#tenantTel").text(result.tenantTel);
           $("#tenantEmail").text(result.tenantEmail);
           
           if (result.kindOf == 1) { //세입자
	        	   //alert("세입자");
	       		$("#switch-1").attr('disabled', true);
	       		$("#switch-1").attr('readonly', true);
	       } else if (result.kindOf == 2) { //중개자
	       		$("#switch-2").attr("disabled", true);
	       		$("#switch-2").attr("readonly", true);
	        	   //alert("중개자");
	       } 
           
        	   
        	   if(result.tblContract.tenantAgree == 1) {
        		  $("#tgt").addClass('is-checked');
        		  $("#switch-2").attr("disabled", true);
  	       		$("#switch-2").attr("readonly", true);
        		   //alert("세입자");
        	   }
        	   if(result.tblContract.brokerAgree == 1) {
        		   $("#tgb").addClass('is-checked');
        		   $("#switch-1").attr('disabled', true);
   	       		$("#switch-1").attr('readonly', true);
        	   }
        	   
           
        },
        error: function(a, b, c) {
           console.log(a, b, c);
        }
      }); //ajax
      
      $(".ck").click(function() {
    	  //동의여부 체크박스 클릭
    	  //alert(this.checked);
    	  if (this.checked) {
    		  if(confirm("계약서는 잘 읽어보셨나요? 거래를 정말 동의하십니까?")) {
    			  //alert("동의");
    			  $.ajax({
    				  type: "get",
    				  url: "/GolaBang/checkcontract.do",
    				  data: "dealSeq=" + ${dealSeq},
    				  success: function(result) {
    					  
    				  },
    				  error: function(a, b, c) {
    					  console.log(a, b, c);
    				  }
    			  });//ajax
    			  
    		  } else {
    			  $(this).val(false);
    		  }
    		  
    	  }
    	  
      }); //ck.click
       
      
   });//ready

   function dealContractDetail(dealSeq) {
      
      $.ajax({
         type: "get",
         url: "/GolaBang/dealcontractdetail.do",
         data: "dealSeq=" + dealSeq,
         dataType: "json",
         success: function(result) {
        	 
        	 if (result.itemDealKind == "월세") {
        		 $("#ck2").addClass('is-checked');
        	 } else if (result.itemDealKind == "전세") {
        		 $("#ck1").addClass('is-checked');
        	 }
        	 
        	 $("#mdItemAddress").text(result.itemAddress);
             $("#mdItemSupplyArea").text(result.itemSupplyArea + " ㎡");
             $("#mdItemUseArea").text(result.itemUseArea + " ㎡");
             $("#mdItemFloor").text(result.itemFloor);
             $("#mdItemDeposit").text(result.itemDeposit);
             $("#mdItemMonthly").text(result.itemMonthly);
             
             $("#mdTenantName").text(result.tenantName);
             $("#mdTenantTel").text(result.tenantTel);
             
             $("#mdBrokerAddress").text(result.brokerAddress);
             $("#mdBrokerName").text(result.brokerName);
             $("#mdBroker").text(result.brokerRepre);
             $("#mdBrokerNum").text(result.brokerNum);
             $("#mdBrokerTel").text(result.brokerTel);
        	 
         },
         error: function(a, b, c) {
            console.log(a, b, c);
         }
      })
   }
   
   
</script>
</head>
<body>
   <!-- dealcheck.jsp -->
   <div class="demo-layout-transparent mdl-layout mdl-js-layout"> 

      <!-- header -->
      

   <jsp:include page="/inc/header.jsp"></jsp:include>

      <main class="mdl-layout__content">

      <div>
         <div id="title">
            <h2>거래 진행 상황</h2>
         </div>
         
      
         <!-- 내용 -->
         <div id="interest_big"> 

            <div class="tblbox" style="float:left; margin-left: 100px;">
               <div class="panel panel-heading">중개사 정보</div>
               <div class="panel panel-body">
                  <table class="mdl-data-table mdl-js-data-table">
                  <tr>
                     <th class="mdl-data-table__cell--non-numeric">중개사무소</th>
                     <td class="mdl-data-table__cell--non-numeric" id="estateName"></td>
                  </tr>
                  <tr>
                     <th class="mdl-data-table__cell--non-numeric">중개사 대표</th>
                     <td class="mdl-data-table__cell--non-numeric" id="brokerName"></td>
                  </tr>
                  <tr>
                     <th class="mdl-data-table__cell--non-numeric">연락처</th>
                     <td class="mdl-data-table__cell--non-numeric" id="brokerTel"></td>
                  </tr>
                  <tr>
                     <th class="mdl-data-table__cell--non-numeric">주소</th>
                     <td class="mdl-data-table__cell--non-numeric" id="EstateAddress"></td>
                  </tr>
                  <tr>
                     <th class="mdl-data-table__cell--non-numeric">이메일</th>
                     <td class="mdl-data-table__cell--non-numeric" id="brokerEmail"></td>
                  </tr>
               </table>
               </div>
            </div><!-- 중개사 box -->



            <div class="tblbox" id="dealbox" style="float:right; margin-right: 100px;">
               <div class="panel panel-heading">거래 정보</div>
               <div class="panel panel-body">
                  <table class="mdl-data-table mdl-js-data-table">
                  <tr>
                     <th class="mdl-data-table__cell--non-numeric">거래 번호</th>
                     <td class="mdl-data-table__cell--non-numeric">${dealSeq}</td>
                  </tr>
                  <tr>
                     <th class="mdl-data-table__cell--non-numeric">매물 번호</th>
                     <td class="mdl-data-table__cell--non-numeric">${itemSeq}</td>
                  </tr>
                  <tr>
                     <th class="mdl-data-table__cell--non-numeric" style="vertical-align: middle;">계약서</th>
                     <td class="mdl-data-table__cell--non-numeric">
                        <button id="show-dialog" type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect show-dialogs" onclick="dealContractDetail(${dealSeq});">
                              상세보기
                        </button>
                     </td>
                  </tr>
                  <tr>
                     <th class="mdl-data-table__cell--non-numeric">중개자 동의여부</th>
                     <td class="mdl-data-table__cell--non-numeric">
                        <label id="tgb" class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-1">
                           <input type="checkbox" id="switch-1" name="switch-1" class="mdl-switch__input ck">
                           <span class="mdl-switch__label"></span>
                        </label>
                     </td>
                  </tr>
                  <tr>
                     <th class="mdl-data-table__cell--non-numeric">세입자 동의여부</th>
                     <td class="mdl-data-table__cell--non-numeric">
                        <label id="tgt" class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-2">
                           <input type="checkbox" id="switch-2" name="switch-2" class="mdl-switch__input ck">
                           <span class="mdl-switch__label"></span>
                        </label>
                     </td>
                  </tr>
               </table>
               </div>
            </div><!-- 거래정보 box -->

			<div style="clear: both;"></div>

            <div class="tblbox" style="margin-top: -75px; height: 300px; margin-left: 100px; float:left;">
               <div class="panel panel-heading">회원 정보</div>
               <div class="panel panel-body" style="height:200px;">
                  <table class="mdl-data-table mdl-js-data-table">
                  <tr>
                     <th class="mdl-data-table__cell--non-numeric">이름</th>
                     <td class="mdl-data-table__cell--non-numeric" id="tenantName"></td>
                  </tr>
                  <tr>
                     <th class="mdl-data-table__cell--non-numeric">연락처</th>
                     <td class="mdl-data-table__cell--non-numeric" id="tenantTel"></td>
                  </tr>
                  <tr>
                     <th class="mdl-data-table__cell--non-numeric">이메일</th>
                     <td class="mdl-data-table__cell--non-numeric" id="tenantEmail"></td>
                  </tr>
               </table>
               </div>
            </div><!-- 회원정보 box -->

			<div style="width: 1500px; border: 0px solid black; margin-top: 100px; text-align: right;">
				<button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect show-dialogs" style="margin-right:324px;" onclick="history.back();">
                	뒤로가기
                </button>
			</div>
			<div style="clear: both;"></div>
         </div> <!-- 내용 box -->
      </div>

		<%-- <jsp:include page="/inc/footer.jsp"></jsp:include> --%>

      </main>


      <dialog id="dealContractDetail">
      
         <div id="modalTitle" class="modalTitles"><h5>계약서</h5></div>
         
         <div id="modalContent">
         
            <div id="tblTitle" style="padding-top: 30px; font-weight: bold; text-align: center; vertical-align: middle; font-size: 2.5em;">
               부 동 산 임 대 차 계 약 서
            </div>
            
            <div style="width: 700px; margin: 0px auto;">
               <label id="ck1" style="width: 80px; outline: 0px solid black; float:left;" class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-1">
                  <input type="checkbox" id="checkbox-1" class="mdl-checkbox__input" disabled>
                  <span class="mdl-checkbox__label">전세</span>
               </label>
               <label id="ck2"style="width: 80px; outline: 0px solid black;" class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-2">
                  <input type="checkbox" id="checkbox-2" class="mdl-checkbox__input" disabled>
                  <span class="mdl-checkbox__label">월세</span>
               </label>
            </div>
            
            <div style="clear:both;"></div>
         
            <table id="dealtbl">
               <tr>
                  <th colspan="3" class="mdl-data-table__cell--non-numeric">
                     <div style="width: 650px; font-size: 12px; font-weight: normal;">
                        임대인과 임차인 쌍방은 아래 표시 부동산에 관하여 다음 계약 내용과 같이 임대차계약을 체결한다.
                     </div>
                     <div style="width: 650px;">
                        1. 부동산의 표시
                     </div>
                  </th>
               </tr>
               <tr>
                  <th class="tblHead">소재지</th>
                  <td id="mdItemAddress" class="mdl-data-table__cell--non-numeric" colspan="2">주소입력</td>
               </tr>
               <tr>
                  <th  rowspan="2" class="tblHead">건물</th>
                  <td class="mdl-data-table__cell--non-numeric" style="width: 100px;">공급면적</td>
                  <td id="mdItemSupplyArea" style="width: 492px;"></td>
               </tr>
               <tr>
                  <td class="mdl-data-table__cell--non-numeric" style="width: 100px;">전용면적</td>
                  <td id="mdItemUseArea" style="width: 492px;"></td>
               </tr>
               <tr>
                  <th class="tblHead">임대할 부분</th>
                  <td colspan="2"  id="mdItemFloor">층</td>
               </tr>
               <tr>
                  <th  class="mdl-data-table__cell--non-numeric" colspan="3">
                     <div style="width: 650px;">
                        2. 계약 내용
                     </div>
                     <div style="width: 650px; font-size: 12px; font-weight: normal;">
                        위 부동산의 임대차에 한해 임대인과 임차인은 합의에 의해 임차보증금 및 차임을 아래와 같이 지불하기로 한다.
                     </div>
                  </th>
               </tr>
               <tr>
                  <th class="tblHead">보증금</th>
                  <td colspan="2">(￦   <span id="mdItemDeposit">50,000,000</span>   )원</td>
               </tr>
               <tr>
                  <th class="tblHead">차임</th>
                  <td colspan="2">(￦   <span id="mdItemMonthly">300,000</span>   )만 원은 매월 말일에 지불한다.</td>
               </tr>
               <tr>
                  <th colspan="3">본 계약을 증명하기 위해 계약 당사자가 이의 없음을 확인하고 각각 동의한다.</th>
               </tr>
               <tr>
                  <th class="tblHead" rowspan="2">임차인</th>
                  <td>성명</td>
                  <td id="mdTenantName"></td>
               </tr>
               <tr>
                  <td>전화</td>
                  <td colspan="2" id="mdTenantTel"></td>
               </tr>
               <tr>
                  <th class="tblHead" rowspan="5">중개업자</th>
                  <td>사무소 소재지</td>
                  <td id="mdBrokerAddress"></td>
               </tr>
               <tr>
                  <td>사무소 명칭</td>
                  <td id="mdBrokerName" colspan="2"></td>
               </tr>
               <tr>
                  <td>대표</td>
                  <td id="mdBroker" colspan="2"></td>
               </tr>
               <tr>
                  <td>등록 번호</td>
                  <td id="mdBrokerNum"></td>
               </tr>
               <tr>
                  <td>전화</td>
                  <td id="mdBrokerTel" colspan="2"></td>
               </tr>
            </table>
            


         </div>
            <div style="width: 350px; margin:0px auto; margin-top: 15px; text-align: center;">
               <button type="button" class="mdl-button close">닫기</button>
            </div>
         </dialog>
         
         
         <script>
            var dialog = document.getElementById('dealContractDetail');
            var showDialogButton = document.querySelector('#show-dialog');
            if (!dialog.showModal) {
               dialogPolyfill.registerDialog(dialog);
            }
            showDialogButton.addEventListener('click', function() {
               dialog.showModal();
            });
            dialog.querySelector('.close').addEventListener('click',
                  function() {
                     dialog.close();
                  });
            
         </script>

      <input type="hidden" >

      <!-- footer -->
      

   </div>
</body>
</html>