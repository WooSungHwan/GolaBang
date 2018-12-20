package com.test.golabang.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * 허위매물 신고하는 서블릿 클래스
 * 
 * @author 송지은
 *
 */

@WebServlet("/admin/fakeitemdeclare.do")
public class FakeItemDeclare extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		String itemSeq = req.getParameter("itemSeq");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/admin/fakeitemdeclare.jsp");
		dispatcher.forward(req, resp);
	}

}
