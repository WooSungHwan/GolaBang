package com.test.golabang.item;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.golabang.broker.DealDAO;
import com.test.golabang.broker.DealItemListDTO;

@WebServlet("/roomregistermain.do")
public class RoomRegisterMain extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      
      HttpSession session = req.getSession();
      
      String seq="",kindOf = "";
      try {
		seq = session.getAttribute("seq").toString();
		kindOf = session.getAttribute("kindOf").toString();
	} catch (NullPointerException e) {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter writer = resp.getWriter();
		String txt = "<script>";
		txt+="alert('로그인을 진행해주시기 바랍니다.');";
		txt+="location.href='/GolaBang/mainpage.do?loginNeed=1'";
		txt+="</script>";
		writer.print(txt);
		writer.close();
		return;
	}     
      
      
      
      DealDAO dao = new DealDAO();
      DealItemListDTO dto = new DealItemListDTO();
      
      //거래중인 매물정보 가져오기
      ArrayList<DealItemListDTO> dealItemList = null;
      
      //중개자가 등록한(관리하는) 매물정보 가져오기
      ArrayList<BrokerItemListDTO> brokerItemList = null;
      
      //여기 주석 풀기~
      if (session.getAttribute("kindOf").toString().equals("2")) { //중개자일때만
      /*if (kindOf.equals("2")) {*/
	      //여기 seq 바꾸기
	      //generalSeq = 2820 / brokerSeq = 30
	      dealItemList = dao.dealItemListBro(seq);
	      brokerItemList = dao.brokerItemList(seq);
      } else if (session.getAttribute("kindOf").toString().equals("1")) { //세입자일때
      /*} else if (kindOf.equals("1")) {*/
	      
	      dto.setTenantSeq(seq);
	      dealItemList = dao.dealItemListTen(dto);
	  }
	      
      //dao 닫기
      dao.close();
      
      req.setAttribute("dealItemList", dealItemList);
      req.setAttribute("brokerItemList", brokerItemList);
      req.setAttribute("kindOf", kindOf);
      req.setCharacterEncoding("UTF-8");
      
      RequestDispatcher dis = req.getRequestDispatcher("/WEB-INF/deal/roomregistermain.jsp");
      dis.forward(req, resp);

   }
}