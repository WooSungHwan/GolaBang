package com.test.golabang.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 관리자가 편집을 관리하는 서블릿 클래스
 * 
 * @author 송지은
 *
 */

@WebServlet("/admin/edit.do")
public class Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		FakeItemBoardDAO dao = new FakeItemBoardDAO();
		
		BbsDTO dto =  dao.get(seq);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/board/edit.jsp");
		dispatcher.forward(req, resp);
	}

}