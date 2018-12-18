package com.test.golabang;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.test.golabang.broker.BrokerDTO;
import com.test.golabang.tenant.GeneralDTO;

@WebServlet("/login.do")
public class Login extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		HttpSession session = req.getSession();
		String email = req.getParameter("email");
		String pw = req.getParameter("pw");
		
		
		
		
		if (email.equals("admin") && pw.equals("1234")) {
			// 관리자일경우
			session.setAttribute("email",email);
			session.setAttribute("kindOf","2");
			session.setAttribute("name", "관리자");
			
			resp.setHeader("Content-type", "application/json");
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter writer = resp.getWriter();
			JSONObject obj = new JSONObject();
			obj.put("result", "2");
			writer.print(obj);
			writer.close();
		} else {

			LoginDAO dao = new LoginDAO();
			int result = dao.loginCheck(email, pw); //세입자 로그인
			result = dao.loginCheckBroker(email,pw);//중개사 로그인 체크

			if (result == 1) {
				// 로그인 성공인 상황임
				// 해당 객체정보 가져와야함
				
				GeneralDTO dto = dao.getGeneral(email); //general객체
				
				if(dto.getKindOf().equals("2")) {
					BrokerDTO bdto = dao.getBrokerSeq(email);
					session.setAttribute("brokerSeq",bdto.getBrokerSeq());
				}
				if (dto != null) {
					// 세선에 정보 저장.
					session.setAttribute("email", dto.getEmail());
					session.setAttribute("name", dto.getName());
					session.setAttribute("kindOf", dto.getKindOf());
					session.setAttribute("seq", dto.getGeneralSeq());
					session.setAttribute("pw", pw);
				}
				// 회원유형으로 거르기
				if (dto.getKindOf().equals("2")) {
					// 공인중개사일때는 공인중개 정보도 같이 가져와두자
					// 일반 : 1 / 공인중개사 : 2 / 관리자 : 0

				}
			}

			resp.setHeader("Content-type", "application/json");
			resp.setCharacterEncoding("UTF-8");

			JSONObject obj = new JSONObject();
			obj.put("result", result + "");

			PrintWriter writer = resp.getWriter();
			writer.print(obj);
			writer.close();
		}
	}
}
