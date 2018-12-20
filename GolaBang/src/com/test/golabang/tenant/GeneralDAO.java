package com.test.golabang.tenant;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.concurrent.Callable;

import com.test.golabang.DBUtil;

/**
 * 계정 관련 데이터를 가져오는 클래스
 * @author 송지은
 *
 */

public class GeneralDAO {
	private Connection conn;
	private PreparedStatement stat ;
	private ResultSet rs;
	
	public GeneralDAO() {
		this.conn=DBUtil.getConnection();
	}

	/**
	 * 전화번호를 가져오는 데이터 메소드
	 * 
	 * @param seq
	 * @return dto
	 */
	
	public TenantDTO getTel(String seq) {
		String sql = "select mobiletel,tenantpw from tblTenant where generalSeq=?";
		try {
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			ResultSet rs = stat.executeQuery();
			if(rs.next()) {
				TenantDTO dto = new TenantDTO();
				dto.setTenantPW(rs.getString("tenantpw"));
				dto.setMobileTel(rs.getString("mobiletel"));
				return dto;
			}
		} catch (Exception e) {
			System.out.println("GeneralDAO.getTel :" + e.toString());
		}
		return null;
	}

	/**
	 * 세입자 정보를 수정하는 데이터 메소드
	 * 
	 * @param dto
	 * @return 0/1
	 */
	
	public int editTenantInfo(GeneralDTO dto) {
		String sql = "{call procEditTenantInfo(?,?,?)}";
		try {
			CallableStatement stat= conn.prepareCall(sql);
			stat.setString(1, dto.getGeneralSeq());
			stat.setString(2, dto.getTel());
			stat.setString(3, dto.getName());
			return stat.execute() ? 0 : 1;
		} catch (Exception e) {
			System.out.println("GeneralDAO.editTenantInfo :" + e.toString());
		}
		return 0;
	}
}
