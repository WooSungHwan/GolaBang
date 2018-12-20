<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<header class="mdl-layout__header mdl-layout__header--transparent"
	style="border-bottom: 1px solid #eee;">
	<div class="mdl-layout__header-row">
		<!-- Title -->
		<a href='/GolaBang/item/itemsearch.do' class="mdl-layout-title" style="color: black; text-decoration: none;">골라방</a>
		<!-- Add spacer, to align navigation to the right -->
		<div class="mdl-layout-spacer"></div>
		<!-- Navigation -->
		<nav class="mdl-navigation"" >
			<a class="mdl-navigation__link" href="/GolaBang/item/itemsearch.do"
				style="color: black; font-size: 1.2em; font-weight: bold;">방골라</a>
			<a class="mdl-navigation__link" href="/GolaBang/tenant/determineroom.do"
				style="color: black; font-size: 1.2em; font-weight: bold;">관심목록</a>
			<a class="mdl-navigation__link" href="/GolaBang/manage/addroom.do"
				style="color: black; font-size: 1.2em; font-weight: bold;">방내놓기</a>
			<a class="mdl-navigation__link" href="/GolaBang/roomregistermain.do"
				style="color: black; font-size: 1.2em; font-weight: bold;">거래관리</a>
			<a class="mdl-navigation__link" href="/GolaBang/admin/list.do"
				style="color: black; font-size: 1.2em; font-weight: bold;">허위매물 게시판</a>
			<c:if test="${empty email}">
				<a class="mdl-navigation__link" style="color: #a9a9a9;"><span
					id="joinlogin">회원가입·로그인</span></a>
			</c:if>
			<c:if test="${not empty email}">
				<a class="mdl-navigation__link" style="color: #a9a9a9;">
					<button id="demo-menu-lower-right"
						class="mdl-button mdl-js-button mdl-button--icon">
						<div class="material-icons mdl-badge mdl-badge--overlap"
							style="margin-right: -5px;">account_box</div>
					</button> <span>${name} 님!</span>
				</a>
			</c:if>

		</nav>
	</div>
</header>


<ul
	class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
	for="demo-menu-lower-right">
	<li class="mdl-menu__item"><a href="/GolaBang/mypage.do?num=1">정보 수정</a></li>
	<li class="mdl-menu__item"><a href="/GolaBang/mypage.do?num=2">연락한 매물</a></li>
	<li class="mdl-menu__item"><a href="/GolaBang/mypage.do?num=3">내가 쓴 리뷰</a></li>
	<li class="mdl-menu__item"><a href="/GolaBang/logout.do">로그아웃</a></li>
</ul>

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
						
						<a href="<%=apiURL%>"><img id="naverLogin" height="50"
			src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
						
						<%-- <button id="naverLogin" class="mdl-button mdl-js-button" 
						onclick="location.href='<%=apiURL%>';">네이버 로그인</button> --%>
						
						<a href="<%=apiURL%>"><img id="kakaoLogin" height="50"
			src="/GolaBang/images/kakaologin.png" /></a>
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



