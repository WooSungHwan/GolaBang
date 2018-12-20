package com.test.golabang.admin;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.golabang.admin.BbsDTO;
import com.test.golabang.admin.FakeItemBoardDAO;

/**
 * 
 * 게시판 목록을 처리하는 서블릿 클래스
 * 
 * @author 송지은
 *
 */

@WebServlet("/admin/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doService(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doService(req, resp);
	}

	protected void doService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		FakeItemBoardDAO dao = new FakeItemBoardDAO();
		//ArrayList<BbsDTO> list = dao.list();
		

		req.setCharacterEncoding("UTF-8");

		String search = req.getParameter("search");
		String column = req.getParameter("column");
		boolean isSearch = false;

		HashMap<String, String> map = new HashMap<String, String>(); // dto

		if ((search != null && column != null) && (search != "" && column != "")) {
			isSearch = true;
			map.put("search", search);
			map.put("column", column);

			if (column.equals("subject"))
				map.put("columnName", "제목");
			else if (column.equals("name"))
				map.put("columnName", "이름");
		}
		
		int nowPage = 0;
		int totalCount = 0;
		int pageSize = 15;
		int totalPage = 0;
		int begin = 0;
		int end = 0;
		int n = 0;
		int loop = 0;
		int blockSize = 10;

		String page = req.getParameter("page");

		if (page == null || page == "")
			nowPage = 1;
		else
			nowPage = Integer.parseInt(page);

		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		map.put("begin", begin + "");
		map.put("end", end + "");

		totalCount = dao.getBoardPaging(isSearch, map);
		System.out.println(totalCount);
		totalPage = (int) Math.ceil((double) totalCount / pageSize);

		String pagebar = "<nav>\r\n" + "  <ul class=\"pagination\">";

		loop = 1;
		n = ((nowPage - 1) / blockSize) * blockSize + 1;

		// 이전 10페이지
		if (n == 1) {
			pagebar += String.format("<a href='#' onclick='event.preventDefault();'><<</a>");
		} else {
			pagebar += String.format("<a href='/GolaBang/admin/list.do?column=%s&search=%s&page=%d'><<</a>",column==null?"":column,search==null?"":search, n - 1);
		}

		while (!(loop > blockSize || n > totalPage)) {

			if (n == nowPage) {

				pagebar += String.format("<a href='#' onclick='event.preventDefault();'><b>%d</b></a> ", n);// event.preventDefault()
																											// 이벤트 안먹는거
			} else {
				pagebar += String.format("<a href='/GolaBang/admin/list.do?column=%s&search=%s&page=%d'>%d</a> ",column==null?"":column,search==null?"":search, n, n);
			}

			loop++;
			n++;
		}
		// 다음 10페이지
		if (n > totalPage) {
			pagebar += String.format("<a href='#' onclick='event.preventDefault();'>>></a>", n);
		} else {
			pagebar += String.format("<a href='/GolaBang/admin/list.do?column=%s&search=%s&page=%d'>>></a>",column==null?"":column,search==null?"":search, n);
		}

		pagebar += "</ul>\r\n" + "</nav>";

		java.util.List<BbsDTO> list = dao.list(isSearch, map); //페이징 임시dto
		// 검색

		for (BbsDTO dto : list) {

			// 제목 너무긴것 처리
			String subject = dto.getSubject();
			if (subject.length() > 28) {
				subject = subject.substring(0, 28) + "...";
				dto.setSubject(subject);
			}

			// 시간자르기
			String regdate = dto.getRegdate();
			regdate = regdate.substring(0, 10);
			dto.setRegdate(regdate);

			
		}
		
		// 리스트 짜르기
		//list = list.subList(begin-1, end);
		  /*if (end < list.size()) {
		         list = list.subList(begin - 1, end);
	      } else {
	         list = list.subList(begin - 1, list.size() % end);
	      }*/
		  
		  /*if(isSearch) {
		         req.setAttribute("list", alist);         
		      } else {
		         req.setAttribute("list", list);         
		      }*/
		
		req.setAttribute("list", list);
		req.setAttribute("map", map);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("pagebar", pagebar);


		// 조회수증가 방지
		session.setAttribute("read", "n");

		dao.close();

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/board/list.jsp");
		dispatcher.forward(req, resp);
	}

}
