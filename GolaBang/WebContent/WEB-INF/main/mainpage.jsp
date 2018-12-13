<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title</title>
<%@ include file="/inc/asset.jsp"%>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<style>
	.close:hover{
		cursor:pointer;
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
	
	
</style>
<script>
	$(document).ready(function() {
		var dialog = document.querySelector('dialog');
		var joinlogin = document.querySelector('#joinlogin');
		if (!dialog.showModal) {
			dialogPolyfill.registerDialog(dialog);
		}
		
		if(joinlogin!=null){
			joinlogin.addEventListener('click', function() {
				dialog.showModal();
			});	
		}
		
		dialog.querySelector('.close').addEventListener('click',function() {
			dialog.close();
		});
		
		$("#submit").on("click",function(){
			$.ajax({
				type:"post",
				url:"/GolaBang/login.do",
				data:$("#loginForm").serialize(),
				dataType:"json",
				success:function(result){
					if(result.result==1 || result.result==2){
						location.href="/GolaBang/mainpage.do";
					}else if(result.result==0){
						alert("아이디 혹은 비밀번호가 맞지 않습니다.");
						$("#pw").val("");
						$("#email").val("");
						$("#email").focus();
					}
				},error:function(a,b,c){
					console.log(a,b,c);
				}
			});
		});//#submit
		
		
		
		
	});
</script>
</head>
<body>
	<div class="demo-layout-transparent mdl-layout mdl-js-layout">

		<!-- header -->
		<jsp:include page="/inc/header.jsp"></jsp:include>


		<main class="mdl-layout__content">
		
		
			<!-- 로그인/회원가입 버튼 누르면 -->
			<dialog class="mdl-dialog" id="dialog">
			<div class="mdl-dialog__actions">
				<i class="material-icons close">clear</i>
			</div>
			<h4 class="mdl-dialog__title" style="margin:-50px auto 0 auto; width:120px;">로그인</h4>
			<div class="mdl-dialog__content">
				<form action="login.do" method="post" id="loginForm">
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="text" name="email" id="email">
						<label class="mdl-textfield__label" for="id">이메일을 입력하세요.</label>
					</div>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="password" name="pw" id="pw">
						<label class="mdl-textfield__label" for="pw">비밀번호를 입력하세요.</label>
					</div>
					<div>
						<input type="button" id="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" value="로그인" style="margin:-10px 0 15px 0; width:100%;" />
					</div>
					<div style="clear:both;"></div>
					<div>
						<!-- 네이버로그인 -->
						<%
							String clientId = "tRoGsjH5a3_vZf9A4xOm";//애플리케이션 클라이언트 아이디값";
							String redirectURI = URLEncoder.encode("http://localhost:8090/GolaBang/naverlogin.do", "UTF-8");
							SecureRandom random = new SecureRandom();
							String state = new BigInteger(130, random).toString();
							String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
							apiURL += "&client_id=" + clientId;
							apiURL += "&redirect_uri=" + redirectURI;
							apiURL += "&state=" + state;
							session.setAttribute("state", state);
						%>
						
						<button id="naverLogin" class="mdl-button mdl-js-button" onclick="location.href='<%=apiURL%>';">네이버 로그인</button>
						
						<button id="kakaoLogin" class="mdl-button mdl-js-button" >카카오 로그인</button>
					</div>
				</form>
				
				<div style="margin:5px auto -5px auto;">
					<label style="font-size: 11px;">설마 아직도 회원이 아니신가요?</label>
					<a href="/GolaBang/join.do?mode=1" style="float:right; font-weight:bold; color:#795548;">회원가입</a>
					<a style="clear:both;"></a>
				</div>
				
				<hr />
				<div>
					<input type="button" class="mdl-button mdl-js-button" style="height:50px;width:100%; font-weight:bold; border:1px solid #ccc; border-radius:5px;" onclick="location.href='/GolaBang/join.do?mode=2';" value="공인중개사 회원가입" />
				</div>
			
			</div>
			</dialog>
		</main>


		<!-- footer -->
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</div>
</body>
</html>