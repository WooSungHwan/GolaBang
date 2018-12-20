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

/**
 * 중개자가 매물을 추가하는 서블릿 클래스
 * 
 * @author 송지은
 *
 */

@WebServlet("/manage/addroom.do")
public class AddRoom extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		HttpSession session = req.getSession();
		resp.setCharacterEncoding("UTF-8");
		
		if(session.getAttribute("seq")==null) {
			System.out.println(session.getAttribute("seq"));
			resp.setContentType("text/html; charset=UTF-8");
			//로그인 안했으면.
			PrintWriter writer = resp.getWriter();
			String txt="<script>";
			txt+="alert('로그인을 진행해주시기 바랍니다.');";
			txt+="location.href='/GolaBang/mainpage.do?loginNeed=1';";
			txt+="</script>";
			writer.print(txt);
			writer.close();
			return;
		}else {
			
			
			
		}
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/manage/addroom.jsp");
		dispatcher.forward(req, resp);

	}
}