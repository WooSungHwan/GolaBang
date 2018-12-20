package com.test.golabang.item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.golabang.DBUtil;
import com.test.golabang.broker.BrokerDTO;

public class ItemDAO {
	private Connection conn;
	private PreparedStatement stat;
	private ResultSet rs;

	public ItemDAO() {
		this.conn = DBUtil.getConnection();
	}

	public ItemRegisterDTO getItem(String seq) {
		try {
			String sql = "select * from tblitemregister where itemseq = ?";

			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);

			rs = stat.executeQuery();

			if (rs.next()) {
				ItemRegisterDTO dto = new ItemRegisterDTO();
				dto.setItemSeq(seq);
				dto.setAddress(rs.getString("address"));
				dto.setBrokerSeq(rs.getString("brokerseq"));
				dto.setDealkind(rs.getString("dealkind"));

				dto.setFloor(rs.getString("floor"));
				dto.setHeatingKind(rs.getString("heatingkind"));
				dto.setKind(rs.getString("kind"));
				dto.setMoveDate(rs.getString("movedate"));
				dto.setRegisterDate(rs.getString("registerdate"));
				dto.setSupplyArea(rs.getString("supplyarea"));
				dto.setTotalFloor(rs.getString("totalfloor"));
				dto.setUseArea(rs.getString("usearea"));
				dto.setItemview(rs.getString("itemview"));

				dto.setDealSituation(rs.getString("dealsituation"));
				dto.setDeposit(rs.getString("deposit"));
				dto.setMonthly(rs.getString("monthly"));

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public AddInfoDTO getaddInfo(String seq) {

		try {
			String sql = "select * from tbladdinfo where itemSeq = ?";

			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			rs = stat.executeQuery();

			if (rs.next()) {
				AddInfoDTO dto = new AddInfoDTO();

				dto.setParking(rs.getString("parking"));
				dto.setAdminCost(rs.getString("admincost"));
				dto.setBalcony(rs.getString("balcony"));
				dto.setElevator(rs.getString("elevator"));
				dto.setPet(rs.getString("pet"));
				dto.setBuiltIn(rs.getString("builtin"));

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public BrokerDTO getBroker(String brokerSeq) {
		try {
			String sql = "select * from tblBroker where brokerSeq = ?";

			stat = conn.prepareStatement(sql);
			stat.setString(1, brokerSeq);

			rs = stat.executeQuery();

			if (rs.next()) {
				BrokerDTO dto = new BrokerDTO();
				dto.setBrokerSeq(rs.getString("brokerseq"));
				dto.setBrokername(rs.getString("brokername"));
				dto.setBrokerAddress(rs.getString("brokeraddress"));
				dto.setBrokerRepre(rs.getString("brokerrepre"));
				dto.setBrokerTel(rs.getString("brokertel"));

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public DetailContentDTO getDetail(String itemSeq) {

		try {
			String sql = "select * from tblDetailContent where itemSeq = ?";

			stat = conn.prepareStatement(sql);
			stat.setString(1, itemSeq);

			rs = stat.executeQuery();

			if (rs.next()) {
				DetailContentDTO dto = new DetailContentDTO();
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));

				return dto;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<OptionListDTO> getOption(String seq) {

		try {
			String sql = "select * from tblOptionlist where itemseq = ?";

			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);

			rs = stat.executeQuery();

			ArrayList<OptionListDTO> list = new ArrayList<>();
			while (rs.next()) {
				OptionListDTO dto = new OptionListDTO();
				dto.setOptionName(rs.getString("optionname"));
				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<ItemRegisterDTO> getOtherItem(String brokerSeq, String itemSeq) {
		try {
			String sql = "select * from vwiteminfo where brokerSeq = ?";

			stat = conn.prepareStatement(sql);
			stat.setString(1, brokerSeq);

			rs = stat.executeQuery();

			ArrayList<ItemRegisterDTO> list = new ArrayList<>();

			while (rs.next()) {

				if (!itemSeq.equals(rs.getString("itemSeq"))) {
					ItemRegisterDTO dto = new ItemRegisterDTO();

					dto.setItemSeq(rs.getString("itemSeq"));
					dto.setAddress(rs.getString("address"));
					dto.setBrokerSeq(rs.getString("brokerseq"));
					dto.setDealkind(rs.getString("dealkind"));

					dto.setFloor(rs.getString("floor"));
					dto.setHeatingKind(rs.getString("heatingkind"));
					dto.setKind(rs.getString("kind"));
					dto.setMoveDate(rs.getString("movedate"));
					dto.setRegisterDate(rs.getString("registerdate"));
					dto.setSupplyArea(rs.getString("supplyarea"));
					dto.setTotalFloor(rs.getString("totalfloor"));
					dto.setUseArea(rs.getString("usearea"));
					dto.setItemview(rs.getString("itemview"));

					dto.setDealSituation(rs.getString("dealsituation"));
					dto.setDeposit(rs.getString("deposit"));
					dto.setMonthly(rs.getString("monthly"));
					dto.setPicture(rs.getString("picture"));

					list.add(dto);

				}
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
/*public ArrayList<itemRegisterDTO> getResult(HashMap<String, String> map) {
		
		try {
			
			String where = "where 1 = 1 ";
			//map.get("kind");
			
			if(map.containsKey("word")) {
				
		
				where += " and address like '%" + map.get("word") + "%'";
				System.out.println(where);
			}
			
			if(map.containsKey("kind")) {
				where += " and kind in('" + map.get("kind").replace(",", "','") + "')";
			}
			
			if(map.containsKey("dealkind")) {
				where += " and dealkind in('" + map.get("dealkind").replace(",", "','") + "')";
			}
			
			if(map.containsKey("floor")) {
				
				
				where += " and floor in('" + map.get("floor").replace(",", "','") + "')";
			}
			
			if(map.containsKey("parking")) {
				where += " and parking = '" + map.get("parking") + "'";
			}
			
			if(map.containsKey("pet")) {
				where += " and pet = '" + map.get("pet") + "'";
			}
			
			
			if(map.containsKey("elevator")) {
				where += " and elevator = '" + map.get("elevator") + "'";
			}
			
			if(map.containsKey("builtin")) {
				where += " and builtin = '" + map.get("builtin") + "'";
			}
			
			if(map.containsKey("balcony")) {
				where += " and balcony = '" + map.get("balcony") + "'";
			}
			
			if(map.containsKey("admincost")) {
				where += " and admincost = '" + map.get("admincost") + "'";
			}
			
			
			
			
			String sql = String.format("select * from vwiteminfo %s", and rnum between %d and %dwhere);
			
			System.out.println(sql);
			
			stat = conn.prepareStatement(sql);
			stat.executeQuery();
			rs = stat.executeQuery();
			
			ArrayList<itemRegisterDTO> list = new ArrayList<>();
			
			while(rs.next()) {
				itemRegisterDTO dto = new itemRegisterDTO();
				
				dto.setItemSeq(rs.getString("itemSeq"));
				dto.setAddress(rs.getString("address"));
				dto.setBrokerSeq(rs.getString("brokerseq"));
				dto.setDealkind(rs.getString("dealkind"));
				
				dto.setFloor(rs.getString("floor"));
				dto.setHeatingKind(rs.getString("heatingkind"));
				dto.setKind(rs.getString("kind"));
				dto.setMoveDate(rs.getString("movedate"));
				dto.setRegisterDate(rs.getString("registerdate"));
				dto.setSupplyArea(rs.getString("supplyarea"));
				dto.setTotalFloor(rs.getString("totalfloor"));
				dto.setUseArea(rs.getString("usearea"));
				dto.setItemview(rs.getString("itemview"));
				
				
			
				dto.setDeposit(rs.getString("deposit"));
				dto.setMonthly(rs.getString("monthly"));
				dto.setPicture(rs.getString("picture"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setAdmincost(rs.getString("admincost"));
				dto.setParking(rs.getString("parking"));
				dto.setPet(rs.getString("pet"));
				dto.setElevator(rs.getString("elevator"));
				dto.setBalcony(rs.getString("balcony"));
				dto.setBultin(rs.getString("builtin"));
				dto.setFavorite(rs.getString("favorite"));
				
				list.add(dto);
			}
			
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}*/
	public ArrayList<ItemRegisterDTO> getResult(HashMap<String, String> map, int begin, int end) {

		try {

			String where = "where 1 = 1 ";
			// map.get("kind");

			if (map.containsKey("word")) {

				where += " and address like '%" + map.get("word") + "%'";
				System.out.println(where);
			}

			if (map.containsKey("kind")) {
				where += " and kind in('" + map.get("kind").replace(",", "','") + "')";
			}

			if (map.containsKey("dealkind")) {
				where += " and dealkind in('" + map.get("dealkind").replace(",", "','") + "')";
			}

			if (map.containsKey("floor")) {

				where += " and floor in('" + map.get("floor").replace(",", "','") + "')";
			}

			if (map.containsKey("parking")) {
				where += " and parking = '" + map.get("parking") + "'";
			}

			if (map.containsKey("pet")) {
				where += " and pet = '" + map.get("pet") + "'";
			}

			if (map.containsKey("elevator")) {
				where += " and elevator = '" + map.get("elevator") + "'";
			}

			if (map.containsKey("builtin")) {
				where += " and builtin = '" + map.get("builtin") + "'";
			}

			if (map.containsKey("balcony")) {
				where += " and balcony = '" + map.get("balcony") + "'";
			}

			if (map.containsKey("admincost")) {
				where += " and admincost = '" + map.get("admincost") + "'";
			}
			
			String sql = "";
			sql = String.format("select * from (select rownum as rnum, b.* from vwiteminfo b %s ) where rnum between %d and %d",where,begin,end);

			System.out.println(sql);

			stat = conn.prepareStatement(sql);
			stat.executeQuery();
			rs = stat.executeQuery();

			ArrayList<ItemRegisterDTO> list = new ArrayList<>();

			while (rs.next()) {
				ItemRegisterDTO dto = new ItemRegisterDTO();

				dto.setItemSeq(rs.getString("itemSeq"));
				dto.setAddress(rs.getString("address"));
				dto.setBrokerSeq(rs.getString("brokerseq"));
				dto.setDealkind(rs.getString("dealkind"));

				dto.setFloor(rs.getString("floor"));
				dto.setHeatingKind(rs.getString("heatingkind"));
				dto.setKind(rs.getString("kind"));
				dto.setMoveDate(rs.getString("movedate"));
				dto.setRegisterDate(rs.getString("registerdate"));
				dto.setSupplyArea(rs.getString("supplyarea"));
				dto.setTotalFloor(rs.getString("totalfloor"));
				dto.setUseArea(rs.getString("usearea"));
				dto.setItemview(rs.getString("itemview"));

				dto.setDeposit(rs.getString("deposit"));
				dto.setMonthly(rs.getString("monthly"));
				dto.setPicture(rs.getString("picture"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setAdmincost(rs.getString("admincost"));
				dto.setParking(rs.getString("parking"));
				dto.setPet(rs.getString("pet"));
				dto.setElevator(rs.getString("elevator"));
				dto.setBalcony(rs.getString("balcony"));
				dto.setBultin(rs.getString("builtin"));
				dto.setFavorite(rs.getString("favorite"));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	

	public int getTotalCount(HashMap<String, String> map) {

			
			try {
				String where = "where 1 = 1 ";
				//map.get("kind");
				
				if(map.containsKey("word")) {
					
			
					where += " and address like '%" + map.get("word") + "%'";
					System.out.println(where);
				}
				
				if(map.containsKey("kind")) {
					where += " and kind in('" + map.get("kind").replace(",", "','") + "')";
				}
				
				if(map.containsKey("dealkind")) {
					where += " and dealkind in('" + map.get("dealkind").replace(",", "','") + "')";
				}
				
				if(map.containsKey("floor")) {
					
					
					where += " and floor in('" + map.get("floor").replace(",", "','") + "')";
				}
				
				if(map.containsKey("parking")) {
					where += " and parking = '" + map.get("parking") + "'";
				}
				
				if(map.containsKey("pet")) {
					where += " and pet = '" + map.get("pet") + "'";
				}
				
				
				if(map.containsKey("elevator")) {
					where += " and elevator = '" + map.get("elevator") + "'";
				}
				
				if(map.containsKey("builtin")) {
					where += " and builtin = '" + map.get("builtin") + "'";
				}
				
				if(map.containsKey("balcony")) {
					where += " and balcony = '" + map.get("balcony") + "'";
				}
				
				if(map.containsKey("admincost")) {
					where += " and admincost = '" + map.get("admincost") + "'";
				}
				
				String sql = "select count(*) as cnt from vwItemInfo "+ where;
				System.out.println(sql);
				PreparedStatement stat= conn.prepareStatement(sql);
				ResultSet rs = stat.executeQuery();
				if(rs.next()) {
					return rs.getInt("cnt");
				}
				
			} catch (Exception e) {
				System.out.println("ItemDAO.getTotalCount :" + e.toString());
			}
		return 0;
	}

	public ArrayList<String> getMList(HashMap<String, String> map) {
		
		try {
			String where = "where 1 = 1 ";
			//map.get("kind");
			
			if(map.containsKey("word")) {
				
		
				where += " and address like '%" + map.get("word") + "%'";
				System.out.println(where);
			}
			
			if(map.containsKey("kind")) {
				where += " and kind in('" + map.get("kind").replace(",", "','") + "')";
			}
			
			if(map.containsKey("dealkind")) {
				where += " and dealkind in('" + map.get("dealkind").replace(",", "','") + "')";
			}
			
			if(map.containsKey("floor")) {
				
				
				where += " and floor in('" + map.get("floor").replace(",", "','") + "')";
			}
			
			if(map.containsKey("parking")) {
				where += " and parking = '" + map.get("parking") + "'";
			}
			
			if(map.containsKey("pet")) {
				where += " and pet = '" + map.get("pet") + "'";
			}
			
			
			if(map.containsKey("elevator")) {
				where += " and elevator = '" + map.get("elevator") + "'";
			}
			
			if(map.containsKey("builtin")) {
				where += " and builtin = '" + map.get("builtin") + "'";
			}
			
			if(map.containsKey("balcony")) {
				where += " and balcony = '" + map.get("balcony") + "'";
			}
			
			if(map.containsKey("admincost")) {
				where += " and admincost = '" + map.get("admincost") + "'";
			}
			
			String sql = "select address from vwItemInfo "+ where;
			
			PreparedStatement stat = conn.prepareStatement(sql);
			ResultSet rs = stat.executeQuery();
			ArrayList<String> list = new ArrayList<String>();
			while(rs.next()) {
				list.add(rs.getString("address"));
			}
			return list;	
		} catch (Exception e) {
			System.out.println("ItemDAO.getMList :" + e.toString());
		}
		return null;
	}
	
	
	public void addInter(String generalseq, String itemseq) {
		try {
			String sql = "insert into tblinterestitem values(interestseq.nextval,?,?,default)";

			stat = conn.prepareStatement(sql);
			stat.setString(1, generalseq);
			stat.setString(2, itemseq);
			
	
			
			
			stat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void removeInter(String generalseq, String itemseq) {
			
		try {
			String sql = "delete from tblinterestitem where generalseq = ? and itemseq = ?";

			stat = conn.prepareStatement(sql);
			stat.setString(1, generalseq);
			stat.setString(2, itemseq);

			stat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public int getInterest(String itemSeq, String generalSeq) {
		try {
			
			System.out.println(itemSeq);
			
			String sql = "select count(*) as cnt from tblinterestitem where itemseq = ? and generalseq = ?";

			stat = conn.prepareStatement(sql);
			stat.setString(1, itemSeq);
			stat.setString(2, generalSeq);
			
			
			rs = stat.executeQuery();
			
			
			if(rs.next()) {
			return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return 0;
	}
	public void addRecent(String generalSeq, String itemSeq) {
	      try {
	         String sql = "insert into tblrecentsearch values(recentsearchseq.nextval,?,?,default)";
	         
	         stat = conn.prepareStatement(sql);
	         stat.setString(1, generalSeq);
	         stat.setString(2, itemSeq);

	         
	         stat.executeUpdate();
	         

	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	   }
	
}
