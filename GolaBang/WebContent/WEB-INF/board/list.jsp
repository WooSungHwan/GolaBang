<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>허위 매물 게시판</title>
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

#tbl {
	width: 850px;
	margin: 60px auto 20px auto;
}

#tbl th:nth-child(1) {
	width: 10px;
}

#tbl th:nth-child(3) {
	width: 420px;
}

#tbl th:nth-child(5) {
	width: 50px;
}

#tbl th:nth-child(7) {
	width: 50px;
}

#tbl th:nth-child(8) {
	width: 50px;
}

#tbl th, #tbl td>a {
	text-align: center;
	color: #000000;
	text-decoration: none;
}

#tbl td:nth-child(3) {
	text-align: left;
}

#btns {
	width: 850px;
	margin: 0px auto;
	color: #000000;
}

#search {
	width: 500px;
	margin: 20px auto;
	text-align: center;
}

#word {
	width: 300px;
}

#pagebar {
	text-align: center;
	margin-bottom: 25px;
	color: #000000;
	text-decoration: none;
}

body {
	background: #f2f2f2;
	font-family: 'Open Sans', sans-serif;
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
					location.href = "/GolaBang/admin/list.do";
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
	$("#submitbtn").click(function(){
		$("#form1").submit();
	});
	
});
</script>
</head>
<body>
	<div class="demo-layout-transparent mdl-layout mdl-js-layout">

		<!-- header -->
		<jsp:include page="/inc/header.jsp"></jsp:include>


		<main class="mdl-layout__content">
		<div id="main">
		<h3 align =center>허위 매물 게시판</h3>
			<div id="contents">
				<section>
				<div style="width: 700px; margin: 20px auto; text-align: right;">
					<form method="get" action="/GolaBang/board/list.do">
					</form>
					</div>
					
					<table id="tbl" class="mdl-data-table mdl-js-data-table">
						<thead>
							<tr>
								<th class="mdl-data-table__cell--non-numeric">No.</th>
								<th><img src="https://imagesisa.ybmnet.co.kr/solution/www_cattoeic_com/eslscat/th_line.gif"></th>								
								<th class="mdl-data-table__cell--non-numeric">제목</th>
								<th><img src="https://imagesisa.ybmnet.co.kr/solution/www_cattoeic_com/eslscat/th_line.gif"></th>
								<th>작성자</th>
								<th><img src="https://imagesisa.ybmnet.co.kr/solution/www_cattoeic_com/eslscat/th_line.gif"></th>
								<th class="mdl-data-table__cell--non-numeric">작성일</th>
								<th><img src="https://imagesisa.ybmnet.co.kr/solution/www_cattoeic_com/eslscat/th_line.gif"></th>
								<th class="mdl-data-table__cell--non-numeric">조회수</th>
							</tr>
						</thead>
						
						<tbody>
							<c:if test="${list.size() == 0}">
								<tr>
									<td colspan="5">현재 게시물이 없습니다.</td>
								</tr>
							</c:if>
						
							<c:forEach items="${list}" var="dto">
								<tr>
									<td>${dto.seq}</td>
									<td></td>
									<td>
									<a 
									href="/GolaBang/admin/view.do?seq=${dto.seq}&column=${map.column}&search=${map.search}">
									${dto.subject}</a></td>
									<td></td>
									<td>${dto.name}</td>
									<td></td>
									<td>${dto.regdate}</td>
									<td></td>
									<td>${dto.readcount}</td>
								</tr>
					
							</c:forEach>
						</tbody>
					</table>
					
				<!-- 검색창 -->
				<div id="search" class="well well-sm">
					<form class="form-inline" action="/GolaBang/admin/list.do" method="get">
						<select name="column" id="column">
							<option value="subject">제목</option>
							<option value="name">작성자</option>
						</select>
						<script>
							<c:if test="${isSearch}">
							$("#column").val("${map.column}");
							</c:if>
						</script>
						
 							<form id="form1">
 								<div class="mdl-textfield mdl-js-textfield">
 									<input class="mdl-textfield__input" type="text" name="search" id="word" required value="${map.search}">
 									<label class="mdl-textfield__label" for="sample1">입력하세요.</label> 
								</div> 
									<!-- <input type="submit" value="검색하기" class="mdl-button mdl-js-button mdl-button--accent"> -->
									<button id="submitbtn" class="mdl-button mdl-button--accent"><i class='material-icons'>search</i></button>
								
							<%-- <input type="text" name="search" id="word" 
 							class="form-control" required value="${map.search}">  --%>
							</form>
 					</form>
 					
				</div>
				
					<!-- 페이지바 -->
					<div id="pagebar">${pagebar}</div>

					<div id="btns" style="margin:200px;">
						
					</div>
				</section>
			</div>
 		<%-- <jsp:include page="/inc/footer.jsp"></jsp:include> --%>
		</div>
		</main>
</body>
</html>













