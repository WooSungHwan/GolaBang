package com.test.golabang.broker;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

/**
 * 
 * 거래정보 데이터를 담당하는 데이터 메소드
 * 
 * @author 송지은
 *
 */
@WebServlet("/dealinfo.do")
public class DealInfo extends HttpServlet {

   @SuppressWarnings("unchecked")
@Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


      String dealSeq = req.getParameter("dealSeq");
      
      DealDAO dao = new DealDAO();

      //1 > dealSeq로 수정하기
      JSONObject dealBrokerTenant = dao.dealBrokerTenant(dealSeq);
      
      //tblDeal 가져오기 / dealSeq로 수정하기
      JSONObject tblContract = dao.tblContract(dealSeq);
      
      HttpSession session = req.getSession();
      
      String kindOf = session.getAttribute("kindOf").toString();
      //여기 바꾸기
      //dealBrokerTenant.put("kindOf", 2);
      dealBrokerTenant.put("tblContract", tblContract);
      
      resp.setHeader("Content-type", "application/json");
      resp.setCharacterEncoding("UTF-8");
      
      resp.getWriter().println(dealBrokerTenant);
      resp.getWriter().close();
      
      

   }
}