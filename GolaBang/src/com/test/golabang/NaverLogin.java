package com.test.golabang;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/naverlogin.do")
public class NaverLogin extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/login/naverlogin.jsp");
		dispatcher.forward(req, resp);
	}
}
