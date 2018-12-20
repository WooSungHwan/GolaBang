package com.test.golabang.tenant;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 
 * 관심목록 방 데이터를 관리하는 서블릿 클래스
 * 
 * @author 송지은
 *
 */

@WebServlet("/tenant/determineroom_data.do")
public class DetermineRoom_Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String generalSeq = (String)session.getAttribute("seq");
		
		String seq1 = req.getParameter("seq1");
		String seq2 = req.getParameter("seq2");
		System.out.println("seq1=" + seq1);
		System.out.println("seq2=" + seq2);
		
		//비교
		DetermineRoomDAO dao = new DetermineRoomDAO();
		ArrayList<InterestDTO> intlist = dao.interestComp(generalSeq, seq1, seq2);
		
		//옵션
		ArrayList<OptionDTO> optionlist = dao.optionComp(generalSeq, seq1, seq2);
		
		resp.setHeader("Content-type", "application/json");
		resp.setCharacterEncoding("UTF-8");
		
		String txt = "";
		
		txt += "[[";
		
		for(InterestDTO dto : intlist) {
		
	
			txt += "{";
			txt += String.format("\"itemseq\": \"%s\",", dto.getItemseq());
			txt += String.format("\"registerdate\": \"%s\",", dto.getRegisterdate());
			txt += String.format("\"kind\": \"%s\",", dto.getKind());
			txt += String.format("\"dealkind\": \"%s\",", dto.getDealkind());
			txt += String.format("\"deposit\": \"%s\",", dto.getDeposit());
			txt += String.format("\"monthly\": \"%s\",", dto.getMonthly());
			txt += String.format("\"floor\": \"%s\",", dto.getFloor());
			txt += String.format("\"supplyarea\": \"%s\",", dto.getSupplyarea());
			txt += String.format("\"admincost\": \"%s\",", dto.getAdmincost());
			txt += String.format("\"subject\": \"%s\"", dto.getSubject());
			txt += "}";
			
			txt += ",";
		}

		txt = txt.substring(0, txt.length()-1); //마지막 , 제거
		
		txt += "],";
		
		
		//resp.getWriter().print(txt);
		
		
		//옵션
		
		txt += "[";
		
		for(OptionDTO dto : optionlist) {
			
			txt += "{";
			txt += String.format("\"itemseq\": \"%s\",", dto.getItemseq());
			txt += String.format("\"optionname\": \"%s\",", dto.getOptionname());
			txt += String.format("\"quantity\": \"%s\"", dto.getQuantity());
			txt += "}";
			txt += ",";
		}
		
		txt = txt.substring(0, txt.length()-1);
		
		txt += "]]";
		
		System.out.println(txt);
		resp.getWriter().print(txt);
		
		
		
		
		
		resp.getWriter().close();
		
		
	}

}
