<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title</title>
<%@ include file="/inc/asset.jsp"%>

<style>
#mytab1:hover,#mytab2:hover,#mytab3:hover{
	cursor:point;
}


.mdl-tabs__panel{
	width:80%;
	min-height: 600px;
	margin:0 auto;
	
}
/* 연락한 매물 */
.card{
	float:left;
	margin:0 10px;
}
.thumnail{
	width:220px;
	margin:0 auto;
}
.demo-card-square.mdl-card {
  width: 250px;
  height: 350px;
}
.demo-card-square > .mdl-card__title {
  color: #fff;
  background:#795548;
}
/* 연락한 매물 끝 */
#title{
   width: 230px;
   height: 100px;
   margin: 10px auto;
   text-align:center;
}
#naverLogin{
		width:49%; height:36px;
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
   height: 700px;
   margin: 0px auto;
}
#edittbl{
	width:800px;
	margin:0 auto;
	vertical-align: middle;
	
}
#edittbl th{
	background:#eee;
	width:100px;
}

/* 탭 */
.tab{
   overflow: hidden;
   border: 0px solid #ccc;
   background-color: white;
   width:1220px;
   
   margin:0 auto;
}

.tab button{
   background-color: white;
   float:left;
   border: none;
   outline: none;
   cursor: pointer;
   padding: 14px 16px;
   transition: 0.3s;
   width: 33%;
   float:left;
   color: #9E9E9E;
   border-bottom: 2px solid #9E9E9E;
}

.tab button:hover{
   color: black;
   border-bottom: 2px solid black;
}

.tab button.active{
   border-bottom: 2px solid black;
   color: black;
}

.tabcontent{
   display: none;
   padding:6px 12px;
   border: 0px solid #ccc;
   border-top: none;
   width:1220px;
   margin:0 auto;
/*    animation: fadeEffect 1s; */
}


</style>
<script>
var passwordCheck = false;
var num;
$(document).ready(function(){
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
	
	$("#orgname").val("${name}");
	$("#orgtel").val("${tel}");
	$("#orgemail").val("${email}");
	
	
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
	
	$("#inputpw").keyup(function(){
		var inputpw=$("#inputpw").val();
		if(inputpw=="${pw}"){
			$("#pwcheck_comment").html("<span style='color:green'>비밀번호가 일치합니다.</span>");
			passwordCheck = true;
		}else{
			$("#pwcheck_comment").html("<span style='color:red'>비밀번호가 일치하지 않습니다.</span>");
			passwordCheck = false;
		}
	});
	
	$("#orgtel").keyup(function(){
		
		var p = $("#orgtel").val();
		if(p.length==3&&event.keyCode!=8){
			$("#orgtel").val(p+"-");
		}else if(p.length==8&&event.keyCode!=8){
			$("#orgtel").val(p+"-");
		}
	});
	
	//정보수정 클릭이벤트
	$("#btnEdit").click(function(){
		if(!passwordCheck){
			alert("비밀번호가 일치하지 않습니다.");
		}else{
			$.ajax({
				type:"post",
				url:"/GolaBang/edittenant.do",
				data:$("#editForm").serialize(),
				dataType:"json",
				success:function(result){
					if(result.result==1){
						alert('정보를 수정하였습니다.');
						location.href="/GolaBang/mypage.do";
					}else{
						alert('에러가 발생하였습니다.');
					}
				},error:function(a,b,c){
					
				}
			});
		}
	});
	
	  /* $("#mytab1").click(function(){
		$.ajax({
			type:"get",
			url:"/GolaBang/mytab.do",
			data:"key=1",
			dataType:"json",
			success:function(result){
				$("#orgname").val("${name}");
				$("#orgtel").val(result.tel);
				$("#orgemail").val("${email}");
			},
			error:function(a,b,c){
				console.log(a,b,c);
			}
		});
	});  */
	 /*
	 $("#mytab2").click(function(){
			$.ajax({
				type:"get",
				url:"/GolaBang/mytab.do",
				data:"key=2",
				error:function(a,b,c){
					console.log(a,b,c);
				}
			});
		});
	 $("#mytab3").click(function(){
			$.ajax({
				type:"get",
				url:"/GolaBang/mytab.do",
				data:"key=3",
				dataType:"json",
				success:function(result){
					
				}
				error:function(a,b,c){
					console.log(a,b,c);
				}
			});
		}); */
});
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
				<h2>마이페이지</h2>
			</div>
			<div id="interest_big">
                 <div class="tab">
                    <button class="tablinks" onclick="openRoom(event, 'editinfo')"><h5 style="font-weight: bold;">정보 수정</h5></button>
                    <button class="tablinks" onclick="openRoom(event, 'contacted')"><h5 style="font-weight: bold;">연락한 매물</h5></button>
                 	<button class="tablinks" onclick="openRoom(event, 'review')"><h5 style="font-weight: bold;">내가 쓴 리뷰</h5></button>
                 </div>
                 
                 <div id="editinfo" class="tabcontent">
                    
                 </div>
                 
                 <div id="contacted" class="tabcontent">
                    2
                 </div>
                 
                 <div id="review" class="tabcontent">
                    3
                 </div>
                 
		</div>
		<!-- footer -->
		<jsp:include page="/inc/footer.jsp"></jsp:include>
		</main>
	</div>
</body>
</html>