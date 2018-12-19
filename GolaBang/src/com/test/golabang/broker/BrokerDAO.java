package com.test.golabang.broker;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.test.golabang.DBUtil;
import com.test.golabang.item.AddInfoDTO;
import com.test.golabang.item.DetailContentDTO;
import com.test.golabang.item.ItemRegisterDTO;
import com.test.golabang.item.OptionListDTO;

import oracle.jdbc.driver.OracleTypes;

public class BrokerDAO {
	private Connection conn;
	private PreparedStatement stat ;
	private ResultSet rs;
	
	public BrokerDAO() {
		this.conn=DBUtil.getConnection();
	}

	public int AddRoom(ItemRegisterDTO itemDTO, DetailContentDTO dDTO, AddInfoDTO aDTO) {
		String sql ="{call procInsNewItemRegister(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
		try {
			CallableStatement stat=  conn.prepareCall(sql);
			stat.setString(1, itemDTO.getBrokerSeq());
			stat.setString(2, itemDTO.getKind());
			stat.setString(3, itemDTO.getAddress());
			stat.setString(4, itemDTO.getDealkind());
			stat.setString(5, itemDTO.getSupplyArea());
			stat.setString(6, itemDTO.getTotalFloor());
			stat.setString(7, itemDTO.getFloor());
			stat.setString(8, itemDTO.getUseArea());
			stat.setString(9, itemDTO.getHeatingKind());
			stat.setString(10, itemDTO.getMoveDate());
			stat.setString(11, itemDTO.getDeposit());
			stat.setString(12, itemDTO.getMonthly());
			stat.setString(13, aDTO.getAdminCost());
			stat.setString(14, aDTO.getParking());
			stat.setString(15, aDTO.getPet());
			stat.setString(16, aDTO.getElevator());
			stat.setString(17, aDTO.getBalcony());
			stat.setString(18, aDTO.getBuiltIn());
			stat.setString(19, dDTO.getSubject());
			stat.setString(20, dDTO.getContent());
			stat.setString(21, dDTO.getClosedNote());
			stat.registerOutParameter(22, OracleTypes.NUMBER);
			
			stat.executeQuery();
			int k = stat.getInt(22);
			System.out.println(k);
			return k;			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int AddOption(OptionListDTO oDTO) {
		String sql  ="insert into tblOptionList values(optionseq.nextval,?,?,?,?)";
		try {
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, oDTO.getItemSeq());
			stat.setString(2, oDTO.getOptionName());
			stat.setString(3, oDTO.getQuantity());
			stat.setString(4, oDTO.getNewItem());
			return stat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int AddPicture(String pictureName, String itemSeq) {
		String sql = "insert into tblPicture values(pictureSeq.nextval,?,?)";
		try {
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, itemSeq);
			stat.setString(2, pictureName);
			return stat.executeUpdate();
		} catch (Exception e) {
			System.out.println("BrokerDAO.enclosing_method :" + e.toString());
		}
		return 0;
	}
}
