<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
   height: 700px;
   margin: 0px auto;
}
</style>
<script>
	$(document).ready(function() {
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
	});
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
					<h2>Title</h2>
				</div>
				<div id="interest_big">
					
				</div>
			</div>
			
		<!-- footer -->
		<jsp:include page="/inc/footer.jsp"></jsp:include>


		</main>
	</div>
</body>
</html>