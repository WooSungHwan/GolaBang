<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

#title {
	width: 250px;
	height: 100px;
	margin: 10px auto;
}

#title>h2 {
	font-weight: bold;
}

#interest_big {
	width: 1500px;
	height: 700px;
	border: 0px solid red;
	margin: 0px auto;
}

.tab {
	overflow: hidden;
	border: 0px solid #ccc;
	background-color: white;
}

.tab button {
	background-color: white;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	width: 746px;
	float: left;
	color: #9E9E9E;
	border-bottom: 2px solid #9E9E9E;
}

.tab button:hover {
	color: black;
	border-bottom: 2px solid black;
}

.tab button.active {
	border-bottom: 2px solid black;
	color: black;
}

.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 0px solid #ccc;
	border-top: none;
	/*    animation: fadeEffect 1s; */
}

/* @keyframes fadeEffect{ */
/*    from{opacity: 0;} */
/*    to{opacity: 1;} */
/* } */
.notice {
	font-size: 15px;
}

#notice {
	margin-top: 50px;
	margin-bottom: 40px;
}

#notice_left>span {
	color: cornflowerblue;
}

#notice_right {
	margin-left: 950px;
	color: #9E9E9E;
}

#real {
	border: 1px solid tomato;
	width: 300px;
	height: 400px;
	padding: 0px;
	margin: 0px 25px 60px 25px;
}

#picture>img, #picture {
	width: 280px;
	height: 250px;
	margin: 0px auto;
	border-radius: 3px;
}

#picture_content {
	margin-left: 10px;
	margin-top: 20px;
	color: #9E9E9E;
}

#picture_content>h5 {
	font-weight: bold;
	margin: 5px 0px 5px 0px;
	color: black;
}
</style>
<script>
	$(document).ready(function() {

	});

	function openRoom(evt, roomName) {
		var i, tabcontent, tablinks;

		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}

		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}

		document.getElementById(roomName).style.display = "block";
		evt.currentTarget.className += " active";

	}
</script>
</head>
<body>
	<!-- determineroom.jsp -->
	<div class="demo-layout-transparent mdl-layout mdl-js-layout">

		<!-- header -->
		<jsp:include page="/inc/header.jsp"></jsp:include>


		<main class="mdl-layout__content">

		<div>
			<div id="title">
				<h2>관심목록</h2>
			</div>
			<div id="interest_big">
				<div class="tab">
					<button class="tablinks" onclick="openRoom(event, 'determine')">
						<h5 style="font-weight: bold;">최근 본 방</h5>
					</button>
					<button class="tablinks" onclick="openRoom(event, 'recent')">
						<h5 style="font-weight: bold;">찜한방</h5>
					</button>
				</div>

				<div id="determine" class="tabcontent">
					<div id="notice">
						<span class="notice" id="notice_left">총 <span>2개</span>의 최근
							본 방이 있습니다.
						</span><span class="notice" id="notice_right">최근 본 방은 최대 10개까지
							저장됩니다.</span>
					</div>
					<div style="border: 0px solid red; margin-top: 10px;" id="real">
						<!-- border 지울것 -->
						<div id="picture"
							style="border: 0px solid blue; margin-top: 10px; padding: 0px;">
							<img src="/GolaBang/images/1.jpg">
						</div>
						<div id="picture_content">
							<div>원룸</div>
							<h5>월세 1000/40</h5>
							<div>2층, 19.8m2, 관리비 3만</div>
							<div>대우당약국 1분 / 완전 풀옵션(TV있음)</div>
						</div>
					</div>
				</div>

				<div id="recent" class="tabcontent">
					<div id="notice">
						<span class="notice" id="notice_left">총 <span>2개</span>의 찜한
							방이 있습니다.
						</span>
					</div>
					<div style="border: 0px solid red; margin-top: 10px;" id="real">
						<div id="picture"
							style="border: 0px solid blue; margin-top: 10px; padding: 0px;">
							<img src="/GolaBang/images/1.jpg">
						</div>
						<div id="picture_content">
							<div>원룸</div>
							<h5>월세 1000/40</h5>
							<div>2층, 19.8m2, 관리비 3만</div>
							<div>대우당약국 1분 / 완전 풀옵션(TV있음)</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		</main>


		<!-- footer -->
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</div>
</body>
</html>