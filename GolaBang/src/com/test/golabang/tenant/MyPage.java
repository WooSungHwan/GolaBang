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

import com.test.golabang.LoginDAO;
import com.test.golabang.item.ItemRegisterDTO;


@WebServlet("/mypage.do")
public class MyPage extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		//가져올 데이터
		//1.정보수정 페이지 -> 전화번호
		//2. 연락한 매물
		//3. 내가 쓴 리뷰
		HttpSession session = req.getSession();
		
		String tel="";
		String seq =session.getAttribute("seq").toString();
		String kindOf=session.getAttribute("kindOf").toString();
		
		LoginDAO dao = new LoginDAO();
		
		if(kindOf.equals("1")) {
			 tel = dao.getTel(seq);			
		}else if(kindOf.equals("2")) {
			tel = dao.getTelBroker(session.getAttribute("seq").toString());
		
		}
		if(tel!="") {
			req.setAttribute("mtel", tel);
		}
		
		//2. 매물정보 가져오기(연락했던놈들)
		ArrayList<ItemRegisterDTO> list = dao.getDealList(session.getAttribute("seq").toString());
		for(ItemRegisterDTO dto : list) {
			dto.setDeposit(Integer.parseInt(dto.getDeposit())/10000+"만");
		}
		String num = req.getParameter("num");
		req.setAttribute("list", list);
		req.setAttribute("num", num);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/mypage/mypage.jsp");
		dispatcher.forward(req, resp);

	}
}