package com.test.golabang.tenant;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 수정을 담당하는 클래스
 * @author 송지은
 *
 */

@WebServlet("/mypage/editinfo.do")
public class EditInfo extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/mypage/editinfo.jsp");
		dispatcher.forward(req, resp);

	}
}