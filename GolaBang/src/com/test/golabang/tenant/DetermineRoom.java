package com.test.golabang.tenant;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 
 * 관심목록을 담당하는 서블릿 클래스
 * 
 * @author 송지은
 *
 */

@WebServlet("/tenant/determineroom.do")
public class DetermineRoom extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String generalSeq = (String)session.getAttribute("seq");

		DetermineRoomDAO dao = new DetermineRoomDAO();
		
		ArrayList<DetermineRoomDTO> list = dao.list(generalSeq); // "21" ->나중에 generalSeq로 바꾸기

		req.setAttribute("list", list);
		
		ArrayList<InterestDTO> interest = dao.interest(generalSeq); // "2015" ->나중에 generalSeq로 바꾸기
		
//		req.setAttribute("interest", interest);
		req.setAttribute("interest", interest); //세션에 DTO 추가함
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/interest/determineroom.jsp");
		dispatcher.forward(req, resp);
	}

}