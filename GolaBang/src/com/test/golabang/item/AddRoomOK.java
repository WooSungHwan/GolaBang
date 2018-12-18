package com.test.golabang.item;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.test.golabang.broker.BrokerDAO;

@WebServlet("/manage/addroomok.do")
public class AddRoomOK extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		HttpSession session = req.getSession();
		String path = req.getRealPath("/picture");
		int size = 100*1024*1024;
		BrokerDAO dao = new BrokerDAO();
		
		MultipartRequest multi = new MultipartRequest(
				req,
				path,
				size,
				"UTF-8",new DefaultFileRenamePolicy());
		
		//매물정보
		String room = multi.getParameter("room");//
		String building = multi.getParameter("building"); //
		String address = multi.getParameter("selectedAddress");//
		String deal_type=multi.getParameter("deal_type");//
		String deposit = multi.getParameter("deposit");//
		String monthly = multi.getParameter("monthly");//
		String supply_pyeong = multi.getParameter("supply_pyeong");//
		String public_pyeong = multi.getParameter("public_pyeong");//
		String buildingFloor = multi.getParameter("buildingFloor"); //
		String myFloor = multi.getParameter("myFloor"); //
		String heating_type = multi.getParameter("heating_type");//
		String movedate = multi.getParameter("movedate");//
		
		//추가정보
		String admincost = multi.getParameter("admincost");
		String elevator = multi.getParameter("elevator");
		String builtin = multi.getParameter("builtin");
		String pet = multi.getParameter("pet");
		String parking = multi.getParameter("parking");
		String valcony = multi.getParameter("valcony");
		
		//옵션
		String[] optionList = multi.getParameterValues("optionList");
	
		//상세설명
		String detail_title = multi.getParameter("detail_title");
		String detail_content = multi.getParameter("detail_content");
		String detail_privatememo = multi.getParameter("detail_privatememo");
		
		
		ItemRegisterDTO itemDTO = new ItemRegisterDTO();
		itemDTO.setBrokerSeq(session.getAttribute("brokerSeq").toString());
		itemDTO.setAddress(address);
		itemDTO.setKind(room);
		itemDTO.setDealkind(deal_type);
		itemDTO.setDeposit(deposit);
		itemDTO.setMonthly(monthly);
		itemDTO.setSupplyArea(supply_pyeong);
		itemDTO.setUseArea(public_pyeong);
		itemDTO.setFloor(myFloor);
		itemDTO.setTotalFloor(buildingFloor);
		itemDTO.setHeatingKind(heating_type);
		itemDTO.setMoveDate(movedate);
		itemDTO.setDealSituation("0");
		itemDTO.setView("0");
		
		DetailContentDTO dDTO = new DetailContentDTO();
		dDTO.setSubject(detail_title);
		dDTO.setContent(detail_content);
		dDTO.setClosedNote(detail_privatememo);
		
		AddInfoDTO aDTO = new AddInfoDTO();
		aDTO.setAdminCost(admincost);
		aDTO.setBalcony(valcony);
		aDTO.setBuiltIn(builtin);
		aDTO.setElevator(elevator);
		aDTO.setParking(parking);
		aDTO.setPet(pet);
		
		String itemSeq = dao.AddRoom(itemDTO,dDTO,aDTO)+"";
		
		
		//옵션 삽입
		int result =1;
		for(int i =0; i<optionList.length;i++) {
			OptionListDTO oDTO = new OptionListDTO();
			oDTO.setItemSeq(itemSeq);
			oDTO.setNewItem("0");
			oDTO.setOptionName(optionList[i]);
			oDTO.setQuantity("0");
			result=result*dao.AddOption(oDTO); 
		}
		
		//사진 삽입
		//사진이름들 
		ArrayList<String> pic = new ArrayList<String>(); //물리명
		
		Enumeration e = multi.getFileNames();
    	
    	while(e.hasMoreElements()){
    		String temp = e.nextElement().toString(); //name 명
    		pic.add(multi.getFilesystemName(temp));
    	}
    	for(String pictureName : pic) {
    		result = dao.AddPicture(pictureName,itemSeq);    		
    	}
    	
		/*System.out.println("room : "+room);
		System.out.println("building : "+building);
		System.out.println("address : "+address);
		System.out.println("deal_type : "+deal_type);
		System.out.println("deposit : "+deposit);
		System.out.println("monthly : "+monthly);
		System.out.println("supply_pyeong : "+supply_pyeong);
		System.out.println("public_pyeong : "+public_pyeong);
		System.out.println("buildingFloor : "+buildingFloor);
		System.out.println("myFloor : "+myFloor);
		System.out.println("heating_type : "+heating_type);
		System.out.println("movedate : "+movedate);
		System.out.println("admincost : "+admincost);
		System.out.println("elevator : "+elevator);
		System.out.println("builtin : "+builtin);
		System.out.println("pet : "+pet);
		System.out.println("parking : "+parking);
		System.out.println("valcony : "+valcony);
		System.out.print("optionlist : ");
		for(int i = 0; i<optionList.length;i++) {
			System.out.print(optionList[i]);
		}
		System.out.println();
		System.out.println("detail_title : "+detail_title);
		System.out.println("detail_content : "+detail_content);
		System.out.println("detail_privatememo : "+detail_privatememo);
		System.out.println(pic);*/
				
		if(result==1) {
			//성공
			resp.setContentType("text/html; charset=UTF-8");
			String txt = "<script>";
			txt+="alert('성공적으로 등록하였습니다.');";
			txt+="location.href='/GolaBang/mainpage.do';";
			txt+="</script>";
			PrintWriter writer = resp.getWriter();
			writer.print(txt);
			writer.close();
		}else {
			//실패
			resp.setContentType("text/html; charset=UTF-8");
			String txt = "<script>";
			txt+="alert('매물을 등록하는 도중 에러가 발생했습니다.')";
			txt+="history.back();";
			txt+="</script>";
			PrintWriter writer = resp.getWriter();
			writer.print(txt);
			writer.close();
		}
				
				
	}
}
