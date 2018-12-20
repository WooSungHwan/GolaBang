<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골라방</title>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<style>
   #tbl {
      width: 850px;
      margin: 60px auto 20px auto;
   }
   #tbl th { 
      width: 150px; 
      text-align: center;
   }
   #tbl td { width: 550px; padding: 8px 15px; text-align: center;  }
   
   #tbl #content {
      height: 250px;
   }
   #btns {
      width: 850px;
      margin: 0px auto;
   }
   
   #tbl tr:nth-child(5) td {
      height: 250px;
   }
   
    #tbl tr:nth-child(5) th {
      height: 250px;
      vertical-align: middle;
   }

</style>
<script>
   $(document).ready(function() {

   });
</script>
</head>
<body>
   <!-- view.jsp -->
   <div id="main">

      <jsp:include page="/inc/header.jsp"></jsp:include>

      <div id="contents">
         <section>
            <table id="tbl" class="mdl-data-table mdl-js-data-table">
               <tr>
                  <th class="mdl-data-table__cell--non-numeric">문의 번호</th>
                  <td>${dto.seq}</td>
               </tr>
               <tr>
                  <th class="mdl-data-table__cell--non-numeric">매물 번호</th>
                  <td>${dto.itemseq}</td>
               </tr>
               <tr>
                  <th class="mdl-data-table__cell--non-numeric">작성자</th>
                  <td>${dto.name}</td>
               </tr>
               <tr>
                  <th class="mdl-data-table__cell--non-numeric">제목</th>
                  <td>${dto.subject}</td>
               </tr>
               <tr>
                  <th class="mdl-data-table__cell--non-numeric">내용</th>
                  <td>${dto.content}</td>
               </tr>
               <tr>
                  <th class="mdl-data-table__cell--non-numeric">날짜</th>
                  <td>${dto.regdate}</td>
               </tr>
               <tr>
                  <th class="mdl-data-table__cell--non-numeric">조회수</th>
                  <td>${dto.readcount}</td>
               </tr>
            </table>

            <div id="btns">

               <input type="button" value="수정" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"
                  onclick="location.href='/GolaBang/admin/edit.do?seq=${dto.seq}';">

               <input type="button" value="삭제" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"
                  onclick="location.href='/GolaBang/admin/delok.do?seq=${dto.seq}';">

               <input type="button" value="뒤로" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"
                  onclick="location.href='/GolaBang/admin/list.do?column=${column}&search=${search}';">
            </div>


         </section>
      </div>


   </div>
</body>
</html>












