<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골라방 - 허위 매물 글 작성</title>
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
	
	#tbl td { width: 550px; padding: 8px 15px; text-align: center;  }

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
body{
	margin-bottom:200px;
}
</style>
<script>

	$(document).ready(function() {
	
	});

</script>

</head>
<body>
   <!-- wirte.jsp -->
   <div class="demo-layout-transparent mdl-layout mdl-js-layout"> 

		<!-- header -->
		<jsp:include page="/inc/header.jsp"></jsp:include>
		
		
		<main class="mdl-layout__content">
		  	<div id="contents">
			<section>
				<h3 align =center>허위 매물 신고하기</h3>
				<!-- 입력폼 -->
				<form method="post" action="/GolaBang/admin/writeok.do">
				 <table id="tbl" class="mdl-data-table mdl-js-data-table">
					<tr>
						<th>이름</th>
						<td>${name}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" id="subject" class="form-control" placeholder="제목을 작성해주세요." required></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content" id="content" class="form-control" placeholder="글을 작성해주세요." required></textarea>
						</td>
					</tr>
				</table>
				
				<div id="btns">
					<input type="submit" value="등록하기"
						class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
					<input type="button" value="목록"
						class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"
						onclick="location.href='/GolaBang/admin/list.do';">
				</div>
				</form>
				
			</section>
		</div>
  		</main>
		
		
		<!-- footer -->
		<%-- <jsp:include page="/inc/footer.jsp"></jsp:include> --%>
	</div>
</body>
</html>