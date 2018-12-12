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
				<a class="mdl-navigation__link" href="" style="color: black; font-size: 1.2em; font-weight: bold;">골라방</a> 
				<a class="mdl-navigation__link" href="" style="color: black; font-size: 1.2em; font-weight: bold;">관심목록</a> 
				<a class="mdl-navigation__link" href="" style="color: black; font-size: 1.2em; font-weight: bold;">방내놓기</a> 
				<a class="mdl-navigation__link" href="" style="color: black; font-size: 1.2em; font-weight: bold;">알림</a>
				<c:if test="${empty email}">
					<a class="mdl-navigation__link" style="color: #a9a9a9;"><span id="joinlogin">회원가입·로그인</span></a>
				</c:if>
				<c:if test="${not empty email}">
					<a class="mdl-navigation__link" style="color: #a9a9a9;"><span>${name}님!</span></a>				
				</c:if>
				
			</nav>
		</div>
	</header>
	<div class="mdl-layout__drawer">
		<span class="mdl-layout-title">라방</span>
		<nav class="mdl-navigation" style="color: black;">
			<a class="mdl-navigation__link" href="">방찾기</a> <a
				class="mdl-navigation__link" href="">관심목록</a> <a
				class="mdl-navigation__link" href="">방내놓기</a> <a
				class="mdl-navigation__link" href="">알림</a>
		</nav>
	</div>
