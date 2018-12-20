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
 * 글을 작성할 때 데이터를 처리하는 서블릿 클래스
 * 
 * @author 송지은
 *
 */

@WebServlet("/admin/writeok.do")
public class WriteOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		
		FakeItemBoardDAO dao = new FakeItemBoardDAO();
		
		BbsDTO dto = new BbsDTO();
		dto.setSubject(subject);
		dto.setContent(content);
		
		int result = dao.write(dto,session.getAttribute("seq").toString());
		
		dao.close();
		
		if (result == 1) {
			resp.sendRedirect("/GolaBang/admin/list.do");
		} else {
			resp.getWriter().print("<script>alert('failed');history.back();</script>");
			resp.getWriter().close();
		}
	}

}
