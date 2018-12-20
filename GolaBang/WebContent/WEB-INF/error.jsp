<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골라방</title>
<%@ include file="/inc/asset.jsp" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<style>
   #headtxt {
      border: 1px solid #e0e0e0; 
      width: 700px; 
      height: 400px; 
      border-radius: 10px;
      box-shadow: 0 2px 2px 0 rgba(0, 0, 0, .14), 0 3px 1px -2px
      rgba(0, 0, 0, .2), 0 1px 5px 0 rgba(0, 0, 0, .12);
      margin: 70px auto;
      
   }
   
   #headtxt h4 {
      font-weight: 600;
      line-height: 15px;
   }
   
   #btn {
      width: 85px;
      height: 35px;
      display:inline-block; 
      padding: 5px 14px; 
      background-color: #795548; 
      border-radius: 5px; 
      color: white; 
      text-decoration: none; 
      outline: none; 
      border: 0px; 
      cursor: pointer;
      font-size: 15px;
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
           
         <div id="headtxt" style="">
         <div style="margin: 120px auto;">
            <div style="width: 201px; height: 111px; border-right: 1px solid #e0e0e0; outline: 0px solid black; float: left; text-align: center;">
               <img src="/GolaBang/images/error.png">
            </div>
            <div style="outline: 0px solid red; padding-left: 30px; width: 468px;height: 111px; float: right;">
               <h4>죄송합니다.</h4>
               <h4 style="color:#FF9800">요청하신 페이지를 찾을 수 없습니다.</h4>
            <div style="outline: 0px solid blue; width: 468px; font-weight: 600; padding-left: 30px; float: right;">불편을 드려 죄송합니다.</div>
            </div>
         </div>
            <div style="clear: both;"></div>
         <div style="text-align: center; margin-top: 50px; height: 35px; outline: 0px solid black;">
            <input type="button" id="btn"value="뒤로가기" onclick="location.href='history.back()';">
         </div>
         </div>

        </main>
      
      
      <!-- footer -->
      <jsp:include page="/inc/footer.jsp"></jsp:include>
   </div>
</body>
</html>