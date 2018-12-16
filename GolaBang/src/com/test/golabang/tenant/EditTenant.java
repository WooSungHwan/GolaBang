package com.test.golabang.tenant;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

@WebServlet("/edittenant.do")
public class EditTenant extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		HttpSession session = req.getSession();
		String tel = req.getParameter("tel");
		String name = req.getParameter("name");
		String seq = session.getAttribute("seq").toString();
		
		GeneralDTO dto = new GeneralDTO();
		GeneralDAO dao = new GeneralDAO();
		dto.setTel(tel);
		dto.setGeneralSeq(seq);
		dto.setName(name);
		
		int result = dao.editTenantInfo(dto);
		
		JSONObject obj = new JSONObject();
		obj.put("result", result+"");
		resp.setHeader("Content-type", "application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		writer.print(obj);
		writer.close();
		
	}
}
