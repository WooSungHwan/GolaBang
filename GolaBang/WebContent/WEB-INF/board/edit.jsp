<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골라방 - 허위매물 수정하기</title>
<%@ include file="/inc/asset.jsp"%>
<style>
#tbl {
		width: 850px;
		margin: 0px auto 20px auto;
	}
	
	#tbl th { 
		 width: 150px; 
     	 text-align: center;
	}
	
	#tbl td { width: 550px; padding: 8px 15px;  }

	#tbl tr:nth-child(3) td textarea { width: 700px;}
	
	#tbl #content {
		height: 250px;
		
	}
	#tbl #subject{
		width: 700px;
		border: none;
        border-radius: 5px;
        resize: none; 
        padding: 6px;
        background: #eee;
	}

	#btns {
		width: 850px;
		margin: 0px auto;
	}
	
	#tbl tr:nth-child(3) th {
      height: 250px;
      vertical-align: middle;
   }
   
   #content {
          width: 200px;
          border: none;
          border-radius: 5px;
          resize: none; 
          padding: 6px;
          background: #eee;
}
</style>
<script>

	$(document).ready(function() {
	
	});

</script>

</head>
<body>
   <!-- edit.jsp -->
   <div class="demo-layout-transparent mdl-layout mdl-js-layout"> 

		<!-- header -->
		<jsp:include page="/inc/header.jsp"></jsp:include>
		
		
		<main class="mdl-layout__content">
		  	<div id="contents">
			<section>
				<!-- 수정폼 -->
				<form method="post" action="/GolaBang/admin/editok.do">
				 <table id="tbl" class="mdl-data-table mdl-js-data-table">
					<tr>
						<th>이름</th>
						<td>${dto.name}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" id="subject" class="form-control" required value="${dto.subject}"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content" id="content" class="form-control" required>${dto.content}</textarea></td>
					</tr>
				</table>
				
				<div id="btns">
					<input type="submit" value="수정"
						class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
					<input type="button" value="뒤로"
						class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"
						onclick="history.back();">
				</div>
				
				<input type="hidden" name="seq" value="${dto.seq}">
			
				</form>
				
			</section>
		</div>
  		</main>
		
		
		<!-- footer -->
		<%-- <jsp:include page="/inc/footer.jsp"></jsp:include> --%>
	</div>
</body>
</html>