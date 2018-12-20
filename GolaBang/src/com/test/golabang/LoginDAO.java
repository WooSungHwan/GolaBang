package com.test.golabang;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.test.golabang.broker.BrokerDTO;
import com.test.golabang.item.ItemRegisterDTO;
import com.test.golabang.tenant.GeneralDTO;

/**
 * 
 * @author 송지은
 * 
 * 로그인 상황과 관련된 데이터를 불러오는 클래스입니다.
 *
 */

public class LoginDAO {
	
	private Connection conn;
	
	public LoginDAO() {
		conn= DBUtil.getConnection();
	}


	/**
	 * 로그인 정보를 입력했을 때 데이터베이스와 정보가 일치하는지 확인하는 메소드
	 * 
	 * @param email
	 * @param pw
	 * @return email과 pw가 일치하는 수
	 */
	
	
	public int loginCheck(String email, String pw) {
		String sql ="select count(*) as cnt from vwtenantinfo where email = ? and tenantpw = ?";
		try {
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, email);
			stat.setString(2, pw);
			ResultSet rs = stat.executeQuery();
			if(rs.next()) {
				return rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public void close() {
		try {
			this.conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * 입력한 email이 데이터베이스의 email과 동일한 사람의 정보를 가져오는 메소드
	 * 
	 * @param email
	 * @return email이 입력값과 동일한 정보
	 */
	
	public GeneralDTO getGeneral(String email) {
		String sql ="select * from tblGeneral where email = ?";
		
		try {
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1,email);
			ResultSet rs = stat.executeQuery();
			GeneralDTO dto = new GeneralDTO();
			if(rs.next()) {
				dto.setEmail(rs.getString("email"));
				dto.setGeneralSeq(rs.getString("generalSeq"));
				dto.setKindOf(rs.getString("kindOf"));
				dto.setName(rs.getString("name"));
				return dto;
			}
		} catch (Exception e) {
			System.out.println("LoginDAO.getGeneral :" + e.toString());
		}
				
		return null;
	}

	/**
	 * 회원가입이 되어있는지의 여부를 확인하는 메소드
	 * 
	 * @param email
	 * @return true/false
	 */
	
	public boolean joinCheck(String email) {
		String sql = "select count(*) as cnt from tblGeneral where email = ?";
		try {
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, email);
			ResultSet rs = stat.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt("cnt");
				if(cnt==1) {
					return true;					
				}
			}
		} catch (Exception e) {
			System.out.println("LoginDAO.joinCheck :" + e.toString());
		}
		return false;
	}

	/**
	 * 회원을 추가하는 메소드
	 * 
	 * @param dto
	 */

	
	public void addGeneral(GeneralDTO dto) {
		String sql="{call procInsNaver(?,?,?)}";
		try {
			CallableStatement stat = conn.prepareCall(sql);
			stat.setString(1, dto.getEmail());
			stat.setString(2, dto.getName());
			stat.setString(3, "0");
			stat.execute();
		} catch (Exception e) {
			System.out.println("LoginDAO.addGeneral :" + e.toString());
		}
		
	}

	public int loginCheckBroker(String email, String pw) {
		String sql = "select count(*) as cnt from vwbroker where email = ? and brokerpw = ?";
		
		try {
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, email);
			stat.setString(2, pw);
			ResultSet rs = stat.executeQuery();
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public BrokerDTO getBrokerSeq(String email) {
		String sql = "select * from vwbroker where email = ?";
		try {
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, email);
			ResultSet rs = stat.executeQuery();
			if(rs.next()) {
				BrokerDTO dto = new BrokerDTO();
				dto.setBrokerSeq(rs.getString(1));
				return dto;
			}
			
			
		} catch (Exception e) {
			System.out.println("LoginDAO.getBroker :" + e.toString());
		}
		return null;
	}

	public String getTel(String generalSeq) {
		String sql = "select mobileTel from tblTenant where generalSeq= ?";
		try {
			PreparedStatement stat= conn.prepareStatement(sql);
			stat.setString(1, generalSeq);
			ResultSet rs = stat.executeQuery();
			if(rs.next()) {
				return rs.getString("mobileTel");
			}
		} catch (Exception e) {
			System.out.println("LoginDAO.getTel :" + e.toString());
		}
		return null;
	}

	public String getTelBroker(String generalSeq) {
		String sql = "select brokerTel from tblBroker where generalSeq = ?";
		try {
			PreparedStatement stat= conn.prepareStatement(sql);
			stat.setString(1, generalSeq);
			ResultSet rs = stat.executeQuery();
			while(rs.next()) {
				return rs.getString("brokerTel");
			}
		} catch (Exception e) {
			System.out.println("LoginDAO.getTelBroker :" + e.toString());
		}
		return null;
	}

	public ArrayList<ItemRegisterDTO> getDealList(String string) {
		String sql = "select b.brokerrepre as brokerName,ir.kind as kind ,ir.dealkind as dealkind, ir.floor as floor, ir.usearea as usearea, ir.deposit as deposit" + 
				" from tblDeal d inner join tblitemregister ir on d.itemSeq=ir.itemSeq" + 
				"    inner join tblGeneral g on g.generalSeq = d.generalSeq " + 
				"        inner join tblBroker b on b.brokerSeq = ir.brokerseq  where g.generalSeq = ?";
		try {
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, string);
			ResultSet rs = stat.executeQuery();
			ArrayList<ItemRegisterDTO> list = new ArrayList<ItemRegisterDTO>();
			while(rs.next()) {
				ItemRegisterDTO dto = new ItemRegisterDTO();
				dto.setDeposit(rs.getString("deposit"));
				dto.setBrokerName(rs.getString("brokerName"));
				dto.setDealkind(rs.getString("dealkind"));
				dto.setFloor(rs.getString("floor"));
				dto.setUseArea(rs.getString("usearea"));
				dto.setKind(rs.getString("kind"));
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			System.out.println("LoginDAO.getDealList :" + e.toString());
		}
		return null;
	}
	
}
