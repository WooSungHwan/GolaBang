<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골라방</title>
<%@ include file="/inc/asset.jsp" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<style>
/* .demo-layout-transparent {
	/* background: url('images/dog01.jpg') center/cover; 배경 */
}

.demo-layout-transparent .mdl-layout__header, .demo-layout-transparent .mdl-layout__drawer-button
	{
	/* This background is dark, so we set text to white. Use 87% black instead if
     your background is light. */
	color: white;	
}
 
	
</style>
<script>
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
	<div class="demo-layout-transparent mdl-layout mdl-js-layout"> 

		<!-- header -->
		<jsp:include page="/inc/header.jsp"></jsp:include>
		
		
		<main class="mdl-layout__content">
		공인중개사 회원가입

  		</main>
		
		
		<!-- footer -->
		<%-- <jsp:include page="/inc/footer.jsp"></jsp:include> --%>
	</div>
</body>
</html>