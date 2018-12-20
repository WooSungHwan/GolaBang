package com.test.golabang.broker;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

/**
 * 계약 세부 내용을 담당하는 서블릿 클래스
 * 
 * @author 송지은
 *
 */

@WebServlet("/dealcontractdetail.do")
public class DealContractDetail extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


      String dealSeq = req.getParameter("dealSeq");
      
      DealDAO dao = new DealDAO();

      //1 > dealSeq로 수정하기
      JSONObject dealContractDetail = dao.dealContractDetail(dealSeq);
      
      resp.setHeader("Content-type", "application/json");
      resp.setCharacterEncoding("UTF-8");
      
      resp.getWriter().println(dealContractDetail);
      resp.getWriter().close();
      
      

   }
}