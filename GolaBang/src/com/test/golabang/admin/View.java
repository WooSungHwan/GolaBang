package com.test.golabang.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 
 * 게시판 글을 보여주는 서블릿 클래스
 * 
 * @author 송지은
 *
 */


@WebServlet("/admin/view.do")
public class View extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      String column = req.getParameter("column");
      String search = req.getParameter("search");
      boolean isSearch = false;
      
      if (column != "" && search != "" && column != null && search != null) {
         isSearch = true;
      }
      
      HttpSession session = req.getSession();
      
      //1.
      String seq = req.getParameter("seq");
      FakeItemBoardDAO dao = new FakeItemBoardDAO();
      
      //2.3
      //게시물 조회수 증가하기(+1)
      if(session.getAttribute("read")==null||session.getAttribute("read").toString().equals("n")) {
         dao.addReadCount(seq);
         session.setAttribute("read", "y");  //읽음
      }
      
      
      //부모글 보여줌
      BbsDTO dto = dao.get(seq);
      
      
      //A. 날짜자르기
      String regdate = dto.getRegdate();
      
      regdate = regdate.substring(0, regdate.length()-2);
      dto.setRegdate(regdate);
      

      String content= dto.getContent();
      
      //C. 글내용에 태그 적용 안함 처리하기
//      if (dto.getTag().equals("n")) {
//         //<a> -> &lt;a&gt;
//         content = content.replace("<", "&lt;").replace(">", "&gt;");
//         dto.setContent(content);
//      }
      
      //D. 태그 적용 유무와 관계없이 <script>, <script type="">, <script language=""> 비활성화
//      content = content.replace("<script", "&lt;script").replace("</script>", "&lt;/script&gt;");
//      dto.setContent(content);
      
      
      //B. 글내용에 엔터값 처리하기
      content = content.replace("\r\n", "<br>");
      dto.setContent(content);
      
      dao.close();
      
      //3.
      req.setAttribute("dto", dto);
      
      RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/board/view.jsp");
      dispatcher.forward(req, resp);
   }

}

