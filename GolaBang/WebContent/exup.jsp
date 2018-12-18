<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="inc/asset.jsp" %>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
.refresh{
	position:relative; 
	top:65px;
	left:38px;
}
.cancel{
	position:relative; 
	top:-45px;
	left:170px;
}
</style>
<script>
	
	
</script>
</head>
<body>
	<button id="demo-show-toast" class="mdl-button mdl-js-button mdl-button--raised" onclick = "aaa();"type="button">Show Toast</button>
<div id="demo-toast-example" class="mdl-js-snackbar mdl-snackbar">
  <div class="mdl-snackbar__text"></div>
  <button class="mdl-snackbar__action" type="button"></button>
</div>
<script>
function aaa() {
  'use strict';
  window['counter'] = 0;
  var snackbarContainer = document.querySelector('#demo-toast-example');
  var showToastButton = document.querySelector('#demo-show-toast');
  showToastButton.addEventListener('click', function() {
    'use strict';
    var data = {message: 'Example Message # ' + ++counter};
    snackbarContainer.MaterialSnackbar.showSnackbar(data);
  });
};
</script>
</body>
</html>

 
