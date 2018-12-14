package com.test.golabang;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/join.do")
public class Join extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String mode = req.getParameter("mode");
		HttpSession session = req.getSession();
		session.setAttribute("isEmailOK", false);
		if(mode.equals("1")) {
			//일반회원 가입
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/join/join.jsp");
			dispatcher.forward(req, resp);
			
		}else if(mode.equals("2")){
			//공인중개사로 회원가입.
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/join/agentJoin.jsp");
			dispatcher.forward(req, resp);
		}
		
		

	}
}