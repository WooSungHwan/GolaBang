package com.test.golabang.mail;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

@WebServlet("/codecheck.do")
public class CodeCheck extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String code = req.getParameter("code");
		HttpSession session = req.getSession();
		resp.setHeader("Content-type", "application/json");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		JSONObject obj = new JSONObject();
		
		if(code.equals(session.getAttribute("code"))) {
			//세션에 있는 코드와 같은경우
			obj.put("result", "1");
			session.setAttribute("isEmailOK", true);
			writer.print(obj);
			writer.close();
		}else {
			//다른경우
			obj.put("result", "0");
			writer.print(obj);
			writer.close();
		}
		
		
		
	}
}