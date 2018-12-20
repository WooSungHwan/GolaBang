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

/**
 * 
 * 세입자 관련 수정을 담당하는 서블릿 클래스
 * 
 * @author 송지은
 *
 */

@WebServlet("/edittenant.do")
public class EditTenant extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		HttpSession session = req.getSession();
		String tel = req.getParameter("orgtel");
		String name = req.getParameter("orgname");
		String seq = session.getAttribute("seq").toString();
		
		GeneralDTO dto = new GeneralDTO();
		GeneralDAO dao = new GeneralDAO();
		dto.setTel(tel);
		dto.setGeneralSeq(seq);
		dto.setName(name);
		
		int result = dao.editTenantInfo(dto);
		if(result==1) {
			session.removeAttribute("name");
			session.setAttribute("name", name);
		}
		JSONObject obj = new JSONObject();
		
		obj.put("result", result);
		
		resp.setHeader("Content-type", "application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		writer.print(obj);
		writer.close();
		
	}
}
