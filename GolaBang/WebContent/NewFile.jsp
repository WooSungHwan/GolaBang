<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/asset.jsp" %>
<style>

</style>
<script>
var num =1 ;
	$(document).ready(function(){
		
		var dialog = document.querySelector('dialog');
	    var showModalButton = document.querySelector('.show-modal');
	    if (! dialog.showModal) {
	      dialogPolyfill.registerDialog(dialog);
	    }
	    showModalButton.addEventListener('click', function() {
	      dialog.showModal();
	    });
	    dialog.querySelector('.close').addEventListener('click', function() {
	      dialog.close();
	    });
	    
	    if(num==1){
	    	dialog.showModal();
	    }
	});
</script>
</head>
<body>

  <button type="button" class="mdl-button show-modal">Show Modal</button>
  <dialog class="mdl-dialog">
    <div class="mdl-dialog__content">
      <p>
        Allow this site to collect usage data to improve your experience?
      </p>
    </div>
    <div class="mdl-dialog__actions mdl-dialog__actions--full-width">
      <button type="button" class="mdl-button">Agree</button>
      <button type="button" class="mdl-button close">Disagree</button>
    </div>
  </dialog>
  

</body>
</html>