package com.test.golabang;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.test.golabang.tenant.GeneralDTO;

public class LoginDAO {
	
	private Connection conn;
	
	public LoginDAO() {
		conn= DBUtil.getConnection("211.63.89.41","dabangServer","java1234");
	}

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
			System.out.println("LoginDAO.loginCheck :" + e.toString());
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
	
}
