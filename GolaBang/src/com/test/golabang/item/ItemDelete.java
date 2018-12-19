package com.test.golabang.item;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.test.golabang.broker.DealDAO;

@WebServlet("/itemdelete.do")
public class ItemDelete extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		String itemSeq = req.getParameter("itemSeq");
		
		DealDAO dao = new DealDAO();
		
		int result = dao.deleteItem(itemSeq);
		
		JSONObject obj = new JSONObject();
		
		obj.put("result", result);
		
		resp.setHeader("Content-type", "application/json");
		resp.setCharacterEncoding("UTF-8");
		
		resp.getWriter().println(obj);
		resp.getWriter().close();
		
	}
}