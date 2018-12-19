package com.test.golabang;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout.do")
public class Logout extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		HttpSession session = req.getSession();
		session.removeAttribute("name");
		session.removeAttribute("email");
		session.removeAttribute("seq");
		session.removeAttribute("kindOf");
		session.removeAttribute("pw");
		session.removeAttribute("brokerSeq");
		resp.sendRedirect(MyURL.main);
	}
}
