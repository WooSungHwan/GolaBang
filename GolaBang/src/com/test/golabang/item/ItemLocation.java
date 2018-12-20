package com.test.golabang.item;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.golabang.broker.BrokerDTO;

@WebServlet("/item/itemlocation.do")
public class ItemLocation extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String itemSeq = req.getParameter("itemseq");	//매물번호
		ItemDAO dao = new ItemDAO();
//		String seq = "490";
		
		
		HttpSession session = req.getSession();
		
		ItemRegisterDTO dto = dao.getItem(itemSeq);

		
		
		AddInfoDTO addto = dao.getaddInfo(itemSeq);
		
		
		req.setAttribute("dto", dto);
		req.setAttribute("addto", addto);
		
		ArrayList<ItemRegisterDTO> otherlist = new ArrayList<>();
		
		BrokerDTO bdto = dao.getBroker(dto.getBrokerSeq());
		DetailContentDTO detaildto = dao.getDetail(dto.getItemSeq());
		ArrayList<OptionListDTO> oplist = new ArrayList<>();
		
		oplist = dao.getOption(itemSeq);
	
		String brokerSeq = bdto.getBrokerSeq();
		
		String generalSeq = session.getAttribute("seq").toString();
		 dao.addRecent(generalSeq,itemSeq);
		int isInter = dao.getInterest(itemSeq,generalSeq);
		System.out.println("갯수체크"+isInter);
		
		otherlist= dao.getOtherItem(brokerSeq,itemSeq);
		
		
		
		req.setAttribute("isInter", isInter);
		req.setAttribute("detaildto", detaildto);
		req.setAttribute("bdto", bdto);
		req.setAttribute("oplist", oplist);
		
		req.setAttribute("otherlist", otherlist);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/item/itemlocation.jsp");
		dispatcher.forward(req, resp);
	}
}
