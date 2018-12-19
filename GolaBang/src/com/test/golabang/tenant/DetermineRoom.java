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

@WebServlet("/tenant/determineroom.do")
public class DetermineRoom extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String generalSeq = (String)session.getAttribute("generalSeq");

		DetermineRoomDAO dao = new DetermineRoomDAO();
		
		ArrayList<DetermineRoomDTO> list = dao.list("21"); // "21" ->나중에 generalSeq로 바꾸기

		req.setAttribute("list", list);
		
		ArrayList<InterestDTO> interest = dao.interest("2015"); // "2015" ->나중에 generalSeq로 바꾸기
		
//		req.setAttribute("interest", interest);
		req.setAttribute("interest", interest); //세션에 DTO 추가함
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/interest/determineroom.jsp");
		dispatcher.forward(req, resp);
	}

}