package com.test.golabang;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.test.golabang.broker.BrokerDTO;
import com.test.golabang.tenant.GeneralDTO;

@WebServlet("/navercheck.do")
public class NaverCheck extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		// 로그인 인증처리해야함

		HttpSession session = req.getSession();
		String token = session.getAttribute("token").toString();// 네이버 로그인 접근 토큰;
		String header = "Bearer " + token; // Bearer 다음에 공백 추가
		try {
			String apiURL = "https://openapi.naver.com/v1/nid/me";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			

			String json = response.toString();
			
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject)parser.parse(json);

			String email = ((JSONObject)obj.get("response")).get("email").toString();
			String name = ((JSONObject)obj.get("response")).get("name").toString();
			
			LoginDAO dao = new LoginDAO();
			boolean check =dao.joinCheck(email);
			System.out.println(check);
			
			if(!check) {
				//회원가입이 되어있지 않다면! -> 회원가입 작업 -> email, 이름, 폰번호(0) insert
				GeneralDTO dto = new GeneralDTO();
				dto.setEmail(email);
				dto.setName(name);
				dto.setKindOf("1");
				dao.addGeneral(dto); //tblGeneral에 인서트
			}
			GeneralDTO dto = dao.getGeneral(email);
			session.setAttribute("email", dto.getEmail());
			session.setAttribute("name", dto.getName());
			session.setAttribute("kindOf", dto.getKindOf());
			session.setAttribute("seq", dto.getGeneralSeq());
			if(dto.getKindOf().equals("2")) {
				BrokerDTO bdto = dao.getBrokerSeq(email);
				session.setAttribute("brokerSeq",bdto.getBrokerSeq());
			}
			
			resp.sendRedirect("/GolaBang/mainpage.do");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// doget

}// 클래스