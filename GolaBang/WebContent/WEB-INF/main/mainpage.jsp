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
</style>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<div class="demo-layout-transparent mdl-layout mdl-js-layout">

		<!-- header -->
		<jsp:include page="/inc/header.jsp"></jsp:include>


		<main class="mdl-layout__content">
		
		
			<!-- 로그인/회원가입 버튼 누르면 -->
			<dialog class="mdl-dialog">
			<div class="mdl-dialog__actions">
				<i class="material-icons orange600 close">backspace</i>
			</div>
			<h4 class="mdl-dialog__title" style="margin:0 auto; width:120px;">로그인</h4>
			<div class="mdl-dialog__content">
				<form action="#">
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="text" id="id">
						<label class="mdl-textfield__label" for="id">아이디를 입력하세요.</label>
					</div>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="password" id="pw">
						<label class="mdl-textfield__label" for="pw">비밀번호를 입력하세요.</label>
					</div>
					<div style="float:right;">
						<input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" value="로그인"/>
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
						<a href="<%=apiURL%>"><img height="50"
							src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.0" style="width:100%;"/></a>
					</div>
				</form>
			</div>
			
			</dialog>
			 <script>
				var dialog = document.querySelector('dialog');
				var joinlogin = document.querySelector('#joinlogin');
				if (!dialog.showModal) {
					dialogPolyfill.registerDialog(dialog);
				}
				joinlogin.addEventListener('click', function() {
					dialog.showModal();
				});
				dialog.querySelector('.close').addEventListener('click',
						function() {
							dialog.close();
						});
			</script> 
		</main>


		<!-- footer -->
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</div>
</body>
</html>