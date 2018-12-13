<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

	<header class="mdl-layout__header mdl-layout__header--transparent" style="border-bottom: 1px solid #eee;">
		<div class="mdl-layout__header-row">
			<!-- Title -->
			<span class="mdl-layout-title" style="color: black;">골라방</span>
			<!-- Add spacer, to align navigation to the right -->
			<div class="mdl-layout-spacer"></div>
			<!-- Navigation -->
			<nav class="mdl-navigation" " >
				<a class="mdl-navigation__link" href="" style="color: black; font-size: 1.2em; font-weight: bold;">방골라</a> 
				<a class="mdl-navigation__link" href="" style="color: black; font-size: 1.2em; font-weight: bold;">관심목록</a> 
				<a class="mdl-navigation__link" href="" style="color: black; font-size: 1.2em; font-weight: bold;">방내놓기</a> 
				<a class="mdl-navigation__link" href="" style="color: black; font-size: 1.2em; font-weight: bold;">알림</a>
				<c:if test="${empty email}">
					<a class="mdl-navigation__link" style="color: #a9a9a9;"><span id="joinlogin">회원가입·로그인</span></a>
				</c:if>
				<c:if test="${not empty email}">
					<a class="mdl-navigation__link" style="color: #a9a9a9;">
						<button id="demo-menu-lower-right" class="mdl-button mdl-js-button mdl-button--icon">
							<div class="material-icons mdl-badge mdl-badge--overlap" style="margin-right:-5px;">account_box</div>
						</button>
						<span>${name} 님!</span>
					</a>				
				</c:if>
				
			</nav>
		</div>
	</header>
	<div class="mdl-layout__drawer">
		<nav class="mdl-navigation" style="color: black;">
			<span class="mdl-layout-title">골라방</span>
			<a class="mdl-navigation__link" href="">정보 수정</a> 
			<a class="mdl-navigation__link" href="">연락한 부동산</a> 
			<a class="mdl-navigation__link" href="">내가 쓴 리뷰</a> 
			<a class="mdl-navigation__link" href="">로그아웃</a>
		</nav>
	</div>
	
	<ul
		class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect" for="demo-menu-lower-right">
		<li class="mdl-menu__item"><a href="">정보 수정</a></li>
		<li class="mdl-menu__item"><a href="">연락한 부동산</a></li>
		<li disabled class="mdl-menu__item"><a href="">내가 쓴 리뷰</a></li>
		<li class="mdl-menu__item"><a href="/GolaBang/logout.do">로그아웃</a></li>
	</ul>
	
	
	
	
	
