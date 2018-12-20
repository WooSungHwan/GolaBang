package com.test.golabang.broker;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 계약확인을 하는 서블릿 클래스
 * 
 * @author 송지은
 *
 */

@WebServlet("/checkcontract.do")
public class CheckContract extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String seq = session.getAttribute("seq").toString();
		String dealSeq = req.getParameter("dealSeq");
		
		DealDAO dao = new DealDAO();
		
		//�뿬湲� 30 > seq濡� 諛붽씀湲�
		dao.insertTblContract(dealSeq, seq);
			
		RequestDispatcher dis = req.getRequestDispatcher("/WEB-INF/deal/checkcontract.jsp");
		dis.forward(req, resp);

	}
}