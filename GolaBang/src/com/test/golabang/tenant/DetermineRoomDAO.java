package com.test.golabang.tenant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.test.golabang.DBUtil;

public class DetermineRoomDAO {
	
	private Connection conn = null;
	private PreparedStatement stat = null;
	private ResultSet rs = null;
	
	public DetermineRoomDAO() {
		this.conn = DBUtil.getConnection();
	}

	public ArrayList<DetermineRoomDTO> list(String generalSeq) { //OK
		
		try {

			String sql = "select distinct i.itemseq as itemseq ,i.kind as kind, i.dealkind as dealkind, i.deposit as deposit, i.monthly as monthly, i.floor as floor, i.supplyarea as supplyarea, a.admincost as admincost, d.subject as subject from tblRecentSearch r inner join tblItemRegister i on r.itemSeq = i.itemSeq inner join tblGeneral g on r.generalSeq = g.generalSeq inner join tblAddInfo a on a.itemSeq = i.itemSeq inner join tblDetailContent d on i.itemSeq = d.itemSeq where r.generalSeq = ?";

			stat = conn.prepareStatement(sql);
			stat.setString(1, generalSeq);
			
			rs = stat.executeQuery();
			
			ArrayList<DetermineRoomDTO> list = new ArrayList<DetermineRoomDTO>();
			int loop = 0;
			while(rs.next()) {
				
				DetermineRoomDTO dto = new DetermineRoomDTO();
				
				
				dto.setItemseq(rs.getString("itemseq"));
				dto.setKind(rs.getString("kind"));
				dto.setDealkind(rs.getString("dealkind"));
				dto.setDeposit(rs.getString("deposit"));
				dto.setMonthly(rs.getString("monthly"));
				dto.setFloor(rs.getString("floor"));
				dto.setSupplyarea(rs.getString("supplyarea"));
				dto.setAdmincost(rs.getString("admincost"));
				dto.setSubject(rs.getString("subject"));
				
				list.add(dto);
				loop++;
				
				if(loop >49) {
					break;
				}
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<InterestDTO> interest(String generalSeq) {
		
		try {
			
			//최신순으로 올라올려면 desc 사용!
			String sql = "select distinct i.itemseq as itemseq, i.kind as kind, i.dealkind as dealkind, i.deposit as deposit, i.monthly as monthly, i.floor as floor, i.supplyarea as supplyarea, a.admincost as admincost, d.subject as subject, to_char(i.registerDate, 'yyyy-mm-dd') as registerDate from tblInterestItem ii inner join tblItemRegister i on ii.itemSeq = i.itemSeq inner join tblGeneral g on ii.generalSeq = g.generalSeq inner join tblAddInfo a on a.itemSeq = i.itemSeq inner join tblDetailContent d on i.itemSeq = d.itemSeq inner join tblOptionList o on a.itemSeq = o.itemSeq where ii.generalSeq = ?";

			stat = conn.prepareStatement(sql);
			stat.setString(1, generalSeq);
			
			rs = stat.executeQuery();
			
			ArrayList<InterestDTO> list = new ArrayList<InterestDTO>();
			
			while(rs.next()) {
				
				InterestDTO dto = new InterestDTO();
				dto.setItemseq(rs.getString("itemseq"));
				dto.setKind(rs.getString("kind"));
				dto.setDealkind(rs.getString("dealkind"));
				dto.setDeposit(rs.getString("deposit"));
				dto.setMonthly(rs.getString("monthly"));
				dto.setFloor(rs.getString("floor"));
				dto.setSupplyarea(rs.getString("supplyarea"));
				dto.setAdmincost(rs.getString("admincost"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegisterdate(rs.getString("registerdate"));
				
				list.add(dto);
				
			}

			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<InterestDTO> interestComp(String generalSeq, String seq1, String seq2) {

		try {
			
			
			//최신순으로 올라올려면 desc 사용!
			String sql = "select distinct i.itemseq as itemseq, i.kind as kind, i.dealkind as dealkind, i.deposit as deposit, i.monthly as monthly, i.floor as floor, i.supplyarea as supplyarea, a.admincost as admincost, d.subject as subject, to_char(i.registerDate, 'yyyy-mm-dd') as registerDate from tblInterestItem ii inner join tblItemRegister i on ii.itemSeq = i.itemSeq inner join tblGeneral g on ii.generalSeq = g.generalSeq inner join tblAddInfo a on a.itemSeq = i.itemSeq inner join tblDetailContent d on i.itemSeq = d.itemSeq where ii.generalSeq = ? and (i.itemseq = ? or i.itemseq = ?)";

			stat = conn.prepareStatement(sql);
			stat.setString(1, generalSeq);
			stat.setString(2, seq1);
			stat.setString(3, seq2);
			
			rs = stat.executeQuery();
			
			ArrayList<InterestDTO> list = new ArrayList<InterestDTO>();
			
			while(rs.next()) {
				
				InterestDTO dto = new InterestDTO();
				dto.setItemseq(rs.getString("itemseq"));
				dto.setKind(rs.getString("kind"));
				dto.setDealkind(rs.getString("dealkind"));
				dto.setDeposit(rs.getString("deposit"));
				dto.setMonthly(rs.getString("monthly"));
				dto.setFloor(rs.getString("floor"));
				dto.setSupplyarea(rs.getString("supplyarea"));
				dto.setAdmincost(rs.getString("admincost"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegisterdate(rs.getString("registerdate"));
				
				list.add(dto);
				
			}

			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<OptionDTO> optionComp(String generalSeq, String seq1, String seq2) {
		
		try {

			String sql = "select distinct ir.itemSeq as itemseq, ol.optionName as optionname, ol.quantity as quantity from tblItemRegister ir inner join tblInterestItem ii on ir.itemSeq = ii.itemSeq inner join tblGeneral g on ii.generalSeq = g.generalSeq inner join tblAddInfo a on a.itemSeq = ir.itemSeq inner join tblOptionList ol on ol.itemSeq = a.itemSeq where ii.generalSeq = ? and (ir.itemseq = ? or ir.itemseq = ?)";

			stat = conn.prepareStatement(sql);
			stat.setString(1, generalSeq);
			stat.setString(2, seq1);
			stat.setString(3, seq2);
			
			rs = stat.executeQuery();
			
			ArrayList<OptionDTO> list = new ArrayList<OptionDTO>();
			
			while(rs.next()) {
				OptionDTO dto = new OptionDTO();
				dto.setItemseq(rs.getString("itemseq"));
				dto.setOptionname(rs.getString("optionname"));
				dto.setQuantity(rs.getString("quantity"));
				list.add(dto);
			}
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	
	
	

}
