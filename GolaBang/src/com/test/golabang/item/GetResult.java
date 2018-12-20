/*package com.test.golabang.item;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/item/getresult.do")
public class GetResult extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

ItemDAO dao = new ItemDAO();
		
		ArrayList<itemRegisterDTO> list  = new ArrayList<>();
		
		HashMap<String,String> map = new HashMap<>();
		HttpSession session = req.getSession();
		
		String kind = req.getParameter("kind");
		String word = req.getParameter("word");
		String dealkind = req.getParameter("dealkind");
		String admincost = req.getParameter("admincost");
		String parking = req.getParameter("park");
		String pet = req.getParameter("pet");
		String elevator = req.getParameter("elevator");
		String balcony = req.getParameter("balcony");
		String builtin = req.getParameter("builtin");
		String monthly = req.getParameter("monthly");
		String supplyarea = req.getParameter("supplyarea");
		String floor = req.getParameter("floor");
		
		
		System.out.println(floor);
		
//		word = "효자동";
//		kind = "원룸";
//		dealkind = "전세";
		
		
		if ((word != null) && (word != "" )) {
			map.put("word", word);
		}
		
		if ((kind != null) && (kind  != "" )) {
			map.put("kind",kind);
			
		}
		
		if ((dealkind != null) && (dealkind  != "" )) {
			map.put("dealkind",dealkind);
			
		}
		
		if ((admincost != null) && (admincost  != "" )) {
			map.put("admincost",admincost);
			
		}
		
		if ((parking != null) && (parking  != "" )) {
			map.put("parking",parking);
			
		}
		
		if ((pet != null) && (pet  != "" )) {
			map.put("pet",pet);
			
		}
		
		if ((elevator != null) && (elevator  != "" )) {
			map.put("elevator",elevator);
			
		}
		
		if ((balcony != null) && (balcony  != "" )) {
			map.put("balcony",balcony);
			
		}
		
		if ((builtin != null) && (builtin  != "" )) {
			map.put("builtin",builtin);
			
		}
		
		if ((monthly != null) && (monthly  != "" )) {
			map.put("monthly",monthly);
			
		}
		if ((supplyarea != null) && (supplyarea  != "" )) {
			map.put("supplyarea",supplyarea);
			
		}
		
		if ((floor != null) && (floor!= "" )) {
			map.put("floor",floor);
			
		}
		
		//페이징 관련 변수
		int nowPage = 0;		//현재 페이지 번호	
		int totalCount = 0;		//총 게시물 수
		int pageSize = 24;		//한 페이지 출력 게시물 수
		int totalPage = 0;		//총 페이지 수
		int begin = 0;			//where rnum between 시작
		int end = 0;			//where rnum between 끝
		int n = 0;				//페이지바 제작(페이지네이션)
		int loop = 0;
		int blockSize = 10;
		
		String page = req.getParameter("page");
		
		if (page == null || page == "") nowPage = 1;
		else nowPage = Integer.parseInt(page);
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		
		totalCount = dao.getTotalCount(map);
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		//페이지바 제작
		String pagebar = "";
				
		loop = 1; //루프변수
		n = ((nowPage - 1) / blockSize) * blockSize + 1; //페이지 바의 페이지 번호 변수
		
		if ( n == 1) {
			pagebar += String.format("<a href=\"#\" class='disabled'>&laquo;</a>");
		} else {
			pagebar += String.format("<a href=\"#\" onclick='meclick(%d);'>&laquo;</a>",n-1);
		}
		
		while (!(loop > blockSize || n > totalPage)) {
			
			if (n == nowPage) {
				pagebar += String.format(" <a href=\"#\" onclick='event.preventDefault();' class='active'>%d</a>", n);
			} else {
				pagebar += String.format( "<a href=\"#\" onclick='meclick(%d);' >%d</a>", n,n);
				
			}
			
			loop++;
			n++;
		}
		
		if (n > totalPage) {
			pagebar += String.format("<a href=\"#\" class='disabled'>&raquo;</a>");
		} else {
			pagebar += String.format(" <a href=\"#\" onclick='meclick(%d)'>&raquo;</a>",n);
		}
		
		
		
		list = dao.getResult(map,begin,end);
		
		JSONObject rootObj = new JSONObject();
		JSONArray array = new JSONArray();
		JSONObject obj2 = new JSONObject();
		
		obj2.put("totalCount", totalCount);
		obj2.put("pagebar",pagebar );
		//array.add(obj2);
		for(itemRegisterDTO dto : list) {
			JSONObject obj = new JSONObject();
			if(Integer.parseInt(dto.getDeposit())/10000>=10000) {
				int namugi = Integer.parseInt(dto.getDeposit())%10000;
				int mok = Integer.parseInt(dto.getDeposit())/10000/10000;
				if(namugi==0) {
					dto.setDeposit(mok+"억");
				}else {
					dto.setDeposit(mok+"억"+namugi+"만");
				}
			}else {
				dto.setDeposit(Integer.parseInt(dto.getDeposit())/10000+"만");				
			}
			obj.put("brokerSeq", dto.getBrokerSeq());
			obj.put("kind",dto.getKind());
			obj.put("dealkind",dto.getDealkind());
			obj.put("itemseq", dto.getItemSeq());
			obj.put("supplyArea",dto.getSupplyArea());
			obj.put("totalFloor",dto.getTotalFloor());
			obj.put("floor",dto.getFloor());
			obj.put("useArea",dto.getUseArea());
			obj.put("heatingKind",dto.getHeatingKind());
			obj.put("moveDate",dto.getMoveDate());
			
			obj.put("picture",dto.getPicture());
			obj.put("subject",dto.getSubject());
			obj.put("content",dto.getContent());
			obj.put("admincost",dto.getAdmincost());
			obj.put("parking",dto.getParking());
			obj.put("pet",dto.getPet());
			obj.put("elevator",dto.getElevator());
			obj.put("balcony",dto.getBalcony());
			obj.put("bultin",dto.getBultin());
			obj.put("favorite",dto.getFavorite());
			obj.put("address",dto.getAddress());
			obj.put("deposit",dto.getDeposit());
			if(Integer.parseInt(dto.getMonthly())!=0) {
				obj.put("monthly",dto.getMonthly()+"만");				
			}else {
				obj.put("monthly","");
			}
			
			array.add(obj);
		}
		
		int nowPage = 0;		//현재 페이지 번호	
		int totalCount = 0;		//총 게시물 수
		int pageSize = 24;		//한 페이지 출력 게시물 수
		int totalPage = 0;		//총 페이지 수
		int begin = 0;			//where rnum between 시작
		int end = 0;			//where rnum between 끝
		int n = 0;				//페이지바 제작(페이지네이션)
		int loop = 0;
		int blockSize = 10;
		
		System.out.println("nowPage : "+nowPage);
		System.out.println("totalCount : "+totalCount);
		System.out.println("pageSize : "+pageSize);
		System.out.println("totalPage : "+totalPage);
		System.out.println("begin : "+begin);
		System.out.println("end : "+end);
		System.out.println("n : "+n);
		System.out.println("loop : "+loop);
		
		
		rootObj.put("info", obj2);
		rootObj.put("list", array);
		
		
		
		req.setAttribute("nowPage", nowPage);		
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("pagebar", pagebar);
		
		req.setAttribute("list",list);
		resp.setHeader("Content-type", "application/json");
		resp.setCharacterEncoding("UTF-8");
		
		resp.getWriter().print(rootObj);
		resp.getWriter().close();
		
	}

}
*/

package com.test.golabang.item;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/item/getresult.do")
public class GetResult extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ItemDAO dao = new ItemDAO();

		ArrayList<ItemRegisterDTO> list = new ArrayList<>();

		HashMap<String, String> map = new HashMap<>();
		HttpSession session = req.getSession();

		String kind = req.getParameter("kind");
		String word = req.getParameter("word");
		String dealkind = req.getParameter("dealkind");
		String admincost = req.getParameter("admincost");
		String parking = req.getParameter("park");
		String pet = req.getParameter("pet");
		String elevator = req.getParameter("elevator");
		String balcony = req.getParameter("balcony");
		String builtin = req.getParameter("builtin");
		String monthly = req.getParameter("monthly");
		String supplyarea = req.getParameter("supplyarea");
		String floor = req.getParameter("floor");

//		word = "효자동";
//		kind = "원룸";
//		dealkind = "전세";

		if ((word != null) && (word != "")) {
			map.put("word", word);
		}

		if ((kind != null) && (kind != "")) {
			map.put("kind", kind);

		}

		if ((dealkind != null) && (dealkind != "")) {
			map.put("dealkind", dealkind);

		}

		if ((admincost != null) && (admincost != "")) {
			map.put("admincost", admincost);

		}

		if ((parking != null) && (parking != "")) {
			map.put("parking", parking);

		}

		if ((pet != null) && (pet != "")) {
			map.put("pet", pet);

		}

		if ((elevator != null) && (elevator != "")) {
			map.put("elevator", elevator);

		}

		if ((balcony != null) && (balcony != "")) {
			map.put("balcony", balcony);

		}

		if ((builtin != null) && (builtin != "")) {
			map.put("builtin", builtin);

		}

		if ((monthly != null) && (monthly != "")) {
			map.put("monthly", monthly);

		}
		if ((supplyarea != null) && (supplyarea != "")) {
			map.put("supplyarea", supplyarea);

		}

		if ((floor != null) && (floor != "")) {
			map.put("floor", floor);

		}
		// 페이징 관련 변수
		int nowPage = 0; // 현재 페이지 번호
		int totalCount = 0; // 총 게시물 수
		int pageSize = 24; // 한 페이지 출력 게시물 수
		int totalPage = 0; // 총 페이지 수
		int begin = 0; // where rnum between 시작
		int end = 0; // where rnum between 끝
		int n = 0; // 페이지바 제작(페이지네이션)
		int loop = 0;
		int blockSize = 10;

		String page = req.getParameter("page");

		if (page == null || page == "")
			nowPage = 1;
		else
			nowPage = Integer.parseInt(page);

		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		totalCount = dao.getTotalCount(map);
		totalPage = (int) Math.ceil((double) totalCount / pageSize);

		// 페이지바 제작
		String pagebar = "";

		loop = 1; // 루프변수
		n = ((nowPage - 1) / blockSize) * blockSize + 1; // 페이지 바의 페이지 번호 변수

		if (n == 1) {
			pagebar += String.format("<a href=\"#\" class='disabled'>&laquo;</a>");
		} else {
			pagebar += String.format("<a href=\"#\" onclick='meclick(%d);'>&laquo;</a>", n - 1);
		}

		while (!(loop > blockSize || n > totalPage)) {

			if (n == nowPage) {
				pagebar += String.format(" <a href=\"#\" onclick='event.preventDefault();' class='active'>%d</a>", n);
			} else {
				pagebar += String.format("<a href=\"#\" onclick='meclick(%d);' >%d</a>", n, n);

			}

			loop++;
			n++;
		}

		if (n > totalPage) {
			pagebar += String.format("<a href=\"#\" class='disabled'>&raquo;</a>");
		} else {
			pagebar += String.format(" <a href=\"#\" onclick='meclick(%d)'>&raquo;</a>", n);
		}

		list = dao.getResult(map, begin, end);

		JSONObject rootObj = new JSONObject();
		JSONArray array = new JSONArray();
		JSONObject obj2 = new JSONObject();

		obj2.put("totalCount", totalCount);
		obj2.put("pagebar", pagebar);
		
		// 리스트 처리
		JSONArray mapArray = new JSONArray();
		ArrayList<String> mlist = dao.getMList(map);
		for (String address : mlist) {
			JSONObject addressObj = new JSONObject();
			addressObj.put("address_Map", address);
			mapArray.add(addressObj);
		}
		
		rootObj.put("mapList", mapArray);

		System.out.println(list);

		for (ItemRegisterDTO dto : list) {
			JSONObject obj = new JSONObject();
			if (Integer.parseInt(dto.getDeposit()) / 10000 >= 10000) {
				int namugi = Integer.parseInt(dto.getDeposit()) % 10000;
				int mok = Integer.parseInt(dto.getDeposit()) / 10000 / 10000;
				if (namugi == 0) {
					dto.setDeposit(mok + "억");
				} else {
					dto.setDeposit(mok + "억" + namugi + "만");
				}
			} else {
				dto.setDeposit(Integer.parseInt(dto.getDeposit()) / 10000 + "만");
			}
			obj.put("brokerSeq", dto.getBrokerSeq());
			obj.put("kind", dto.getKind());
			obj.put("dealkind", dto.getDealkind());
			obj.put("itemseq", dto.getItemSeq());
			obj.put("supplyArea", dto.getSupplyArea());
			obj.put("totalFloor", dto.getTotalFloor());
			obj.put("floor", dto.getFloor());
			obj.put("useArea", dto.getUseArea());
			obj.put("heatingKind", dto.getHeatingKind());
			obj.put("moveDate", dto.getMoveDate());

			obj.put("picture", dto.getPicture());
			obj.put("subject", dto.getSubject());
			obj.put("content", dto.getContent());
			obj.put("admincost", dto.getAdmincost());
			obj.put("parking", dto.getParking());
			obj.put("pet", dto.getPet());
			obj.put("elevator", dto.getElevator());
			obj.put("balcony", dto.getBalcony());
			obj.put("bultin", dto.getBultin());
			obj.put("favorite", dto.getFavorite());
			obj.put("address", dto.getAddress());
			obj.put("deposit", dto.getDeposit());
			if (Integer.parseInt(dto.getMonthly()) != 0) {
				obj.put("monthly", dto.getMonthly() + "만");
			} else {
				obj.put("monthly", "");
			}

			array.add(obj);
		}

		rootObj.put("info", obj2);
		rootObj.put("list", array);

		resp.setHeader("Content-type", "application/json");
		resp.setCharacterEncoding("UTF-8");

		resp.getWriter().print(rootObj);
		resp.getWriter().close();

	}

}
