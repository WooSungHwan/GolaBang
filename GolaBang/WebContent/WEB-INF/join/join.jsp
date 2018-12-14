<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   width: 300px;
   height: 100px;
   margin: 10px auto;
}
	#naverLogin{
		width:48%; height:36px;
		color:white;
		background:#1DC700;
		font-size:12px;
		font-weight:bold;
	}
	
#naverLogin:hover{
		cursor:pointer;
	}
#kakaoLogin{
		width:48%; height:36px;
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
#jointbl{
	width:800px;
	margin:0 auto;
	vertical-align: middle;
	
}
#jointbl th{
	background:#eee;
	width:100px;
}
#getcode,#checkcode{
	margin-left:100px;
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
		
		
		
		$("#getcode").on("click", function() {
			
			$.ajax({
				type:"get",
				url: "/GolaBang/mailauth.do",
				data :"email="+$("#joinemail").val(),
				dataType:"json",
				success:function(result){
					if(result.result=="overlap"){
						alert('이미 등록된 이메일입니다.');
						$("#joinemail").val("");
						$("#joinemail").focus();
					}else{
						alert('인증코드를 보냈습니다.');
					}
				},
				error:function(a,b,c){
					console.log(a,b,c);
				}
			});
		});
		$("#checkcode").on("click",function(){
			$.ajax({
				type: "get",
				url: "/GolaBang/codecheck.do",
				data: "code="+$("#code").val(),
				dataType: "json",
				success:function(result	){
					if(result.result==1){
						//성공한경우
						//완료표시해야함
						alert('인증에 성공하였습니다.');
						$("#auth_check").text("인증을 완료하였습니다.");
					}else{
						//실패한경우
						alert('인증에 실패했습니다.');
						$("#code").val("");
						$("#code").focus();
					}
				},error:function(a,b,c){
					console.log(a,b,c);
				}
			});
		});
		
		$("#pwcheck").keyup(function(){
			var pw = $("#joinpw").val();
			if(pw==$(this).val()){
				$("#pwcheck_comment").html("<span style='color:green;'>비밀번호가 일치합니다.</span>");
			}
			else{
				$("#pwcheck_comment").html("<span style='color:red;'>비밀번호가 일치하지 않습니다.</span>");
			}
		});
		
		$("#btnJoin").on("click",function(){
			$.ajax({
				type:"post",
				url:"/GolaBang/joinok.do",
				data: $("#joinForm").serialize(),
				dataType: "json",
				success:function(result){
					alert(result.result);
					if(result.result==1){
						//성공
						alert('환영합니다.'+result.name+'님! 로그인 후 이용해주세요.');
						location.href="${main}";
					}else{
						alert('알 수 없는 에러발생');
						
					}
				},error:function(a,b,c){
					console.log(a,b,c);
					alert('아직 기입하지 않은 항목이 있습니다.');
				}
			});
		});
		
		$("#tel").keyup(function(){
			
			var p = $("#tel").val();
			if(p.length==3&&event.keyCode!=8){
				$("#tel").val(p+"-");
			}else if(p.length==8&&event.keyCode!=8){
				$("#tel").val(p+"-");
			}
		});
		
		
	});//ready

</script>
</head>
<body>
	<div class="demo-layout-transparent mdl-layout mdl-js-layout">
		<!-- header -->
		<jsp:include page="/inc/header.jsp"></jsp:include>

		<main class="mdl-layout__content">
		
			<div>
				<!-- 컨텐츠 넣을 곳 -->
				<div id="title">
					<h2>회원가입</h2>
				</div>
				<div id="interest_big">
					<form id="joinForm">
						<table class="mdl-data-table mdl-js-data-table" id="jointbl">
						<tbody>
							<tr>
								<th class="mdl-data-table__cell--non-numeric"><h5>이름</h5></th>
								<td class="mdl-data-table__cell--non-numeric">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="text" id="joinname" name="joinname" max="10">
										<label class="mdl-textfield__label" for="joinname">이름을 입력해주세요.</label>
									</div>
								</td>
							</tr>
							<tr>
								<th class="mdl-data-table__cell--non-numeric"><h5>전화번호</h5></th>
								<td class="mdl-data-table__cell--non-numeric">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="text" id="tel" name="tel">
										<label class="mdl-textfield__label" for="tel">휴대폰 번호를 입력해주세요.</label>
									</div>
								</td>
							</tr>
							<tr>
								<th class="mdl-data-table__cell--non-numeric"><h5>이메일</h5></th>
								<td class="mdl-data-table__cell--non-numeric">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" >
										<input class="mdl-textfield__input" type="text" id="joinemail" name="joinemail">
										<label class="mdl-textfield__label" for="joinemail">이메일을 입력해주세요.</label>
									</div>
									<input type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="getcode" value="인증코드 받기">
								</td>
							</tr>
							
							<tr>
								<th class="mdl-data-table__cell--non-numeric"><h5>이메일 인증코드</h5></th>
								<td class="mdl-data-table__cell--non-numeric">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" >
										<input class="mdl-textfield__input" type="text" id="code" name="code">
										<label class="mdl-textfield__label" for="code">인증코드를 입력해주세요.</label>
									</div>
									<input type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="checkcode" value="확인">
									<div id="auth_check"></div>
								</td>
							</tr>
							<tr>
								<th class="mdl-data-table__cell--non-numeric"><h5>비밀번호</h5></th>
								<td class="mdl-data-table__cell--non-numeric">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="password" id="joinpw" name="joinpw">
										<label class="mdl-textfield__label" for="joinpw">비밀번호를 입력해주세요.</label>
									</div>
								</td>
							</tr>
							<tr>
								<th class="mdl-data-table__cell--non-numeric"><h5>비밀번호 확인</h5></th>
								<td class="mdl-data-table__cell--non-numeric">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="password" id="pwcheck" name="pwcheck">
										<label class="mdl-textfield__label" for="pwcheck">비밀번호를 다시 입력해주세요.</label>
									</div>
									<div id="pwcheck_comment"></div>
								</td>
							</tr>
						</tbody>
					</table>
					<div style="width:120px; margin:50px auto;">
						<input type="button" id="btnJoin" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored" value="간단 가입완료" style="margin:0 auto; width:120px;"/>
					</div>					
					</form>					
				</div>
			</div>
			
		</main>


		<!-- footer -->
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</div>
</body>
</html>