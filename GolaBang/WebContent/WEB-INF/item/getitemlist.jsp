<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골라방</title>
<%@ include file="/inc/asset.jsp" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<style>
	
	.item {
	
		display:inline-block;
		border:1px solid black;
		width: 250px;
		height : 300px;
		margin-left:30px;
		margin-top:20px;
		
	}
	
	.item img{
		width:249px;
		height:130px;
		margin-bottom:30px;
		z-index:2;
	}
	
	.itemkind{

	color:#bbb;
	margin-bottom:2px;
	}
	
	.itemdealkind{
		font-weight:bold;
		font-size:18px;
		margin-bottom:2px;
	}
	
	.itemfloor{
	margin-top:5px;
	color:gray;
	margin-bottom:2px;
	
	}
	
	
	
	.itemregdate{
		
		position:relative;
		left:0;
		top:0;
		
	}
</style>
<script>
	$(document).ready(function(){
		
		$.ajax({
			url:"/GolaBang/item/getresult.do",
			type:"get",
			data:"word=효자동&kind=원룸&dealkind=전세",
			dataType:"json",
			success:function(result){
				
				$("#cnt").text(result.length);
				console.log(result.length);
				
				$(result).each(function(index, item) {
				
				var row = "";
				var seq = item.seq;
			
				console.log(item.seq);
				row += "<div class = 'item'" + " onlclick='move(" + item.itemseq + ")'>";
				row += "<img src = '/GolaBang/images/" + item.picture + "'>";
				row += "<div class='itemkind'>" + item.kind + "</div>";
				
				row += "<div class='itemdealkind'>" +  item.dealkind + "&nbsp;" +   item.deposit + "/" +  item.monthly +  "</div>";
				
				
				row += "<div class='itemfloor'>" + item.floor +  item.useArea + "</div>";
				row += "<div class='itemfloor'>" + item.subject + "</div>";
				row += "<input type='button' value = '이동하기' onclick = 'move(" +   item.itemseq + ")'";
				row += "</div>";
				
		
				$("#itemlist").append(row);
				
			});	
			},
			error:function(a,b,c){
				console.log(a,b,c);
			}
		
		});//ajax
		
		
		
	}); //READY
	
	function move(seq){
		alert(seq);
		window.parent.location.href ="/GolaBang/item/itemlocation.do?seq=" + seq;
	}

</script>
</head>
<body>
	<br>
	<div style= "font-weight:bold; font-size:30px; margin-left:30px; margin-top:30px;">조건에 맞는 방<span id = "cnt" style="margin-left:20px;"></span></div>
	<hr>

	
	<div id = "itemlist">

		<br><br><hr>
	</div>
	
	
	<div>
		<h1 style="text-align:center;">페이지 네이션</h1>
	
	</div>

		

</body>
</html>