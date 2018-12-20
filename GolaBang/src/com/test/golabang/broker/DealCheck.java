package com.test.golabang.broker;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

/**
 * 
 * 거래를 확인하는 서블릿 클래스
 * 
 * @author 송지은
 *
 */

@WebServlet("/dealcheck.do")
public class DealCheck extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      HttpSession session = req.getSession();
      
      String seq="",kindOf = "";
    try {
		seq = session.getAttribute("seq").toString();
	} catch (NullPointerException e) {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter writer = resp.getWriter();
		String txt = "<script>";
		txt+="alert('로그인을 진행해주시기 바랍니다.');";
		txt+="location.href='/GolaBang/mainpage.do?loginNeed=1'";
		txt+="</script>";
		writer.print(txt);
		writer.close();
		return;
	}     
      String dealSeq = "",itemSeq = "";
      try {
		dealSeq = req.getParameter("dealSeq");
		itemSeq = req.getParameter("itemSeq");
	} catch (Exception e) {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter writer = resp.getWriter();
		String txt = "<script>";
		txt+="alert('잘못된 접근입니다.');";
		txt+="location.href='/GolaBang/mainpage.do'";
		txt+="</script>";
		writer.print(txt);
		writer.close();
		return;
	}
      
      
      
      req.setAttribute("dealSeq", dealSeq);
      req.setAttribute("itemSeq", itemSeq);
      
      RequestDispatcher dis = req.getRequestDispatcher("/WEB-INF/deal/dealcheck.jsp");
      dis.forward(req, resp);

   }
}