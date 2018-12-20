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
 * 관리자가 수정을 할 때 데이터를 담는 서블릿 클래스
 * 
 * @author 송지은
 *
 */

@WebServlet("/admin/editok.do")
public class EditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		BbsDTO dto = new BbsDTO();
		
		dto.setSubject(req.getParameter("subject"));
		dto.setContent(req.getParameter("content"));
		dto.setSeq(req.getParameter("seq"));
		
		FakeItemBoardDAO dao = new FakeItemBoardDAO();
		
		int result = -1;
		
//		result = dao.edit(dto);
		
//		req.setAttribute("result", result);//전달
//		
//		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/admin/delok.jsp");
//		dispatcher.forward(req, resp);
		
//		System.out.println("result : "+ result);
		
		if (dao.isOwner(dto.getSeq(),session.getAttribute("seq").toString())){
			result = dao.edit(dto);
		} else {
			result = 2;
		}
		
		if (result == 1) {
			//resp.sendRedirect("/BoardTest/board/list.do"); //목록
			resp.sendRedirect("/GolaBang/admin/view.do?seq=" + dto.getSeq()); //글보기
		} else if (result == 2) {
			resp.getWriter().print("<script> alert('Access Denied'); history.back();</script>");
			resp.getWriter().close();
		} else {
			resp.getWriter().print("<script> alert('Failed'); history.back(); </script>");
			resp.getWriter().close();
		}
	}
}

