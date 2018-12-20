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
 * 관리자가 삭제를 진행하는 서블릿 클래스
 * 
 * @author 송지은
 *
 */

@WebServlet("/admin/delok.do")
public class DelOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String seq = req.getParameter("seq");
		
		FakeItemBoardDAO dao = new FakeItemBoardDAO();
		
		int result = -1;
		
//		result = dao.del(seq);
//		System.out.println(result);
//		if(result == 1) {
//			resp.sendRedirect("/GolaBang/admin/list.do"); //목록
//		}
//		
//		dao.close();
		if (dao.isOwner(seq,session.getAttribute("seq").toString())){
			result = dao.del(seq);
		} else {
			//2.2 history.back()
			result = 2;
		}
		
		if (result == 1) {
			resp.sendRedirect("/GolaBang/admin/list.do"); //목록
		} else if (result == 2) {
			resp.getWriter().print("<script> alert('Access Denied'); history.back(); </script>");
			resp.getWriter().close();
		} else {
			resp.getWriter().print("<script> alert('Failed'); history.back(); </script>");
			resp.getWriter().close();
		}
		
	}

}
