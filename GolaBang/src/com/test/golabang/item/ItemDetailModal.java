package com.test.golabang.item;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/itemdetailmodal.do")
public class ItemDetailModal extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	//현재 보고있는 매물 상세정보 가져오기
	String itemSeq = req.getParameter("itemSeq");
	      
	ItemRegisterDAO dao = new ItemRegisterDAO();

	//30 > itemSeq로 바꾸기
	JSONObject itemDetailArray = dao.itemDetail(itemSeq);
	
	resp.setHeader("Content-type", "application/json");
	resp.setCharacterEncoding("UTF-8");
	      
	resp.getWriter().println(itemDetailArray);
	resp.getWriter().close();
      
   }
}