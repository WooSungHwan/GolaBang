package com.test.golabang.broker;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/manage/addroom.do")
public class AddRoom extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/manage/addroom.jsp");
		dispatcher.forward(req, resp);

	}
}