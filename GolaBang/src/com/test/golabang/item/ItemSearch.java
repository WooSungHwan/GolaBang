package com.test.golabang.item;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/item/itemsearch.do")
public class ItemSearch extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		 ClusterDAO dao = new ClusterDAO();
         
	      ArrayList<String> addlist = dao.change();
	      
	      //String address = dto.getAddress();
	      
	      String loginNeed="";
			try {
				loginNeed = req.getParameter("loginNeed");
			} catch (NullPointerException e) {
				
			}
	      
	      
	      
	      req.setAttribute("page", 1);
	      req.setAttribute("addlist", addlist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/item/itemsearch.jsp");
		dispatcher.forward(req, resp);
	}

	
	
}
