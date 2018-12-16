package com.test.golabang;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.test.golabang.tenant.GeneralDAO;
import com.test.golabang.tenant.TenantDTO;

@WebServlet("/mytab.do")
/**
 * 탭 메뉴 구분을 위해서 만든  ajax용 서블릿
 * @author woo
 *
 */
public class MyTab extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		/*String key = req.getParameter("key");
		HttpSession session = req.getSession();
		String seq = session.getAttribute("seq").toString();
		String tel = "", pw = "";
		
		if(key.equals("1")) {
			GeneralDAO dao = new GeneralDAO();
			TenantDTO dto = dao.getTel(seq);
			tel = dto.getMobileTel();
			pw = dto.getTenantPW();
			JSONObject obj = new JSONObject();
			obj.put("tel", tel);
			obj.put("pw", pw);
			resp.setHeader("Content-type", "application/json");
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().print(obj);
			resp.getWriter().close();
		}else if(key.equals("2")) {
			//매물거래내역
		}else if(key.equals("3")) {
			//내가쓴 리뷰
		}*/
		
	}
}
