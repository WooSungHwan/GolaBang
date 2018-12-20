package com.test.golabang;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.test.golabang.tenant.GeneralDTO;

/**
 * 
 * @author 송지은
 * 
 * 회원가입을 진행하는 클래스와 관련된 데이터 가져오기 클래스입니다.
 *
 */

public class JoinDAO {
	private Connection conn;
	
	public JoinDAO() {
		conn=DBUtil.getConnection();
	}

	
	
	
	/**
	 * 세입자의 정보를 추가하는 메서드
	 * 
	 * @param dto 계정데이터
	 * @return 세입자의 정보
	 */
	
	public int addTenant(GeneralDTO dto) {
		String sql ="{call procInsGeneral(?,?,?,?)}";
		try {
			CallableStatement stat = conn.prepareCall(sql);
			stat.setString(1,dto.getEmail() );
			stat.setString(2,dto.getName() );
			stat.setString(3, dto.getTel());
			stat.setString(4, dto.getPw());
			return stat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("JoinDAO.addTenant :" + e.toString());
		}
		return 0;
	}

	/**
	 * 이메일을 확인하는 메서드
	 * 
	 * @param email 
	 * @return email을 가진 사람들의 수
	 */
	
	public int emailCheck(String email) {
		String sql = "select count(*) as cnt from tblGeneral where email = ?";
		try {
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, email);
			ResultSet rs = stat.executeQuery();
			if(rs.next()) {
				return rs.getInt("cnt");
			}
		} catch (Exception e) {
			System.out.println("JoinDAO.emailCheck :" + e.toString());
		}
		return 0;
	}
}	
