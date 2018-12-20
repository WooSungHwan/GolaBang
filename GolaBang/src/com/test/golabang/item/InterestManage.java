package com.test.golabang.item;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/item/interestmanage.do")
public class InterestManage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		
		HttpSession session = req.getSession();
		
		String generalseq=session.getAttribute("seq").toString();
		String itemseq = req.getParameter("itemseq");
		String type=  req.getParameter("type");
				
//		
//		System.out.println("시퀀스" + generalseq);
//		System.out.println("아이템시퀀스" + itemseq);
//		System.out.println("타입" + type);
//		
//		
		ItemDAO dao = new ItemDAO();
		
		if(type.equals("add")) {
		dao.addInter(generalseq,itemseq);
		}
		else if(type.equals("remove")) {
			dao.removeInter(generalseq,itemseq);
		}
		
		
		
		

	}

}
