package com.test.golabang;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.test.golabang.tenant.GeneralDTO;

@WebServlet("/joinok.do")
public class JoinOK extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String name = req.getParameter("joinname");
		String email = req.getParameter("joinemail");
		String pw = req.getParameter("joinpw");
		String tel = req.getParameter("tel");
		
		JSONObject obj = new JSONObject();
		resp.setHeader("Content-type", "application/json");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		
		
		
		JoinDAO dao = new JoinDAO();
		
		//회원가입 추가
		GeneralDTO dto = new GeneralDTO();
		dto.setEmail(email);
		dto.setKindOf("1");
		dto.setName(name);
		dto.setPw(pw);
		dto.setTel(tel);
		int result = dao.addTenant(dto);
		System.out.println(result);
		obj.put("result", result+"");
		obj.put("name", name);
		
		writer.print(obj);
		writer.close();
		
	}
}
