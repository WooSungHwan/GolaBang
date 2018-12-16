package com.test.golabang;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mainpage.do")
public class MainPage extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		HttpSession session = req.getSession();
		
		if (session.getAttribute("main") == null) {
			session.setAttribute("main", MyURL.main);
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/main/mainpage.jsp");
		dispatcher.forward(req, resp);
	}
}