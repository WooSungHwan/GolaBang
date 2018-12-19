package com.test.golabang.broker;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.simple.JSONObject;

import com.test.golabang.DBUtil;
import com.test.golabang.item.BrokerItemListDTO;

import oracle.jdbc.OracleTypes;

public class DealDAO {

   Connection conn = null;
   PreparedStatement stat = null;
   ResultSet rs = null;
   
   public DealDAO() {
      this.conn = DBUtil.getConnection();
   }

   public ArrayList<DealItemListDTO> dealItemListBro(String seq) {
      
      try {

         String sql = "select * from vwDealItem where brokerSeq = (select brokerSeq from tblBroker where generalSeq= ?)";

         stat = conn.prepareStatement(sql);
         
         stat.setString(1, seq);
         
         
         ArrayList<DealItemListDTO> list = new ArrayList<DealItemListDTO>();
         rs = stat.executeQuery();
         
         
         while (rs.next()) {
        	 DealItemListDTO dto = new DealItemListDTO();
            
            dto.setBrokerSeq(rs.getString("brokerSeq"));
            dto.setBrokerName(rs.getString("brokerName"));
            dto.setBrokerAddress(rs.getString("brokerAddress"));
            dto.setBrokerRepre(rs.getString("brokerRepre"));
            dto.setBrokerTel(rs.getString("brokerTel"));
            dto.setItemSeq(rs.getString("itemSeq"));
            dto.setItemKind(rs.getString("itemKind"));
            dto.setItemAddress(rs.getString("itemAddress"));
            dto.setItemDealKind(rs.getString("itemDealKind"));
            dto.setItemSupplyArea(rs.getString("itemSupplyArea"));
            dto.setItemFloor(rs.getString("itemFloor"));
            dto.setItemDealSituation(rs.getString("itemDealSituation"));
            dto.setItemDeposit(rs.getString("itemDeposit"));
            dto.setItemMonthly(rs.getString("itemMonthly"));
            dto.setDealSeq(rs.getString("dealSeq"));
            dto.setDealRegdate(rs.getString("dealRegdate"));
            dto.setTenantSeq(rs.getString("tenantSeq"));
            dto.setTenantName(rs.getString("tenantName"));
            dto.setTenantEmail(rs.getString("tenantEmail"));
            dto.setTenantTel(rs.getString("tenantTel"));
            dto.setPicture(rs.getString("picture"));
            
            list.add(dto);
            
         }

         return list;
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return null;
   }
   
   
   public ArrayList<DealItemListDTO> dealItemListTen(DealItemListDTO dto) {
	   
	   try {
		   
		   String sql = "select * from vwDealItem where tenantSeq = (select tenantSeq from tblTenant where generalSeq = ?)";
		   
		   stat = conn.prepareStatement(sql);
		   
		   stat.setString(1, dto.getTenantSeq());
		   
		   ArrayList<DealItemListDTO> list = new ArrayList<DealItemListDTO>();
		   
		   rs = stat.executeQuery();
		   
		   while (rs.next()) {
			   dto = new DealItemListDTO();
			   
			   dto.setBrokerSeq(rs.getString("brokerSeq"));
			   dto.setBrokerName(rs.getString("brokerName"));
			   dto.setBrokerAddress(rs.getString("brokerAddress"));
			   dto.setBrokerRepre(rs.getString("brokerRepre"));
			   dto.setBrokerTel(rs.getString("brokerTel"));
			   dto.setItemSeq(rs.getString("itemSeq"));
			   dto.setItemKind(rs.getString("itemKind"));
			   dto.setItemAddress(rs.getString("itemAddress"));
			   dto.setItemDealKind(rs.getString("itemDealKind"));
			   dto.setItemSupplyArea(rs.getString("itemSupplyArea"));
			   dto.setItemFloor(rs.getString("itemFloor"));
			   dto.setItemDealSituation(rs.getString("itemDealSituation"));
			   dto.setItemDeposit(rs.getString("itemDeposit"));
			   dto.setItemMonthly(rs.getString("itemMonthly"));
			   dto.setDealSeq(rs.getString("dealSeq"));
			   dto.setDealRegdate(rs.getString("dealRegdate"));
			   dto.setTenantSeq(rs.getString("tenantSeq"));
			   dto.setTenantName(rs.getString("tenantName"));
			   dto.setTenantEmail(rs.getString("tenantEmail"));
			   dto.setTenantTel(rs.getString("tenantTel"));
			   dto.setPicture(rs.getString("picture"));
			   
			   list.add(dto);
			   
		   }
		   
		   return list;
		   
	   } catch (Exception e) {
		   e.printStackTrace();
	   }
	   
	   return null;
   }
   
   public void close() {
      
      try {
         
         this.conn.close();
         
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   @SuppressWarnings("unchecked")
   public JSONObject dealBrokerTenant(String dealSeq) {

      try {

         CallableStatement cstat = conn.prepareCall("{call procSelBrokerTenant(?,?,?,?,?,?,?,?,?,?)}");

         cstat.setString(1, dealSeq);
         cstat.registerOutParameter(2, OracleTypes.VARCHAR);
         cstat.registerOutParameter(3, OracleTypes.VARCHAR);
         cstat.registerOutParameter(4, OracleTypes.VARCHAR);
         cstat.registerOutParameter(5, OracleTypes.VARCHAR);
         cstat.registerOutParameter(6, OracleTypes.VARCHAR);
         cstat.registerOutParameter(7, OracleTypes.VARCHAR);
         cstat.registerOutParameter(8, OracleTypes.VARCHAR);
         cstat.registerOutParameter(9, OracleTypes.VARCHAR);
         cstat.registerOutParameter(10, OracleTypes.VARCHAR);

         cstat.executeQuery();
            
         JSONObject obj = new JSONObject();

         obj.put("tenantName", cstat.getString(2));
         obj.put("tenantEmail", cstat.getString(3));
         obj.put("tenantTel", cstat.getString(4));
         obj.put("brokerName", cstat.getString(5));
         obj.put("brokerEmail", cstat.getString(6));
         obj.put("EstateName", cstat.getString(7));
         obj.put("EstateAddress", cstat.getString(8));
         obj.put("brokerNum", cstat.getString(9));
         obj.put("brokerTel", cstat.getString(10));

         return obj;
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return null;
   }

	@SuppressWarnings("unchecked")
	public JSONObject dealContractDetail(String dealSeq) {
	
		try {
	
			String sql = "select * from vwDealItem where dealSeq = ?";
	
			stat = conn.prepareStatement(sql);
			stat.setString(1, dealSeq);
			
			rs = stat.executeQuery();
			
			if (rs.next()) {
				JSONObject obj = new JSONObject();
				
				obj.put("itemAddress", rs.getString("itemAddress"));
				obj.put("itemDealKind", rs.getString("itemDealKind"));
				obj.put("itemSupplyArea",  rs.getString("itemSupplyArea"));
				obj.put("itemUseArea",  rs.getString("itemUseArea"));
				obj.put("itemFloor",  rs.getString("itemFloor"));
				obj.put("itemDeposit",  rs.getString("itemDeposit"));
				obj.put("itemMonthly",  rs.getString("itemMonthly"));
				obj.put("tenantName",  rs.getString("tenantName"));
				obj.put("tenantTel",  rs.getString("tenantTel"));
				obj.put("brokerAddress",  rs.getString("brokerAddress"));
				obj.put("brokerName",  rs.getString("brokerName"));
				obj.put("brokerRepre",  rs.getString("brokerRepre"));
				obj.put("brokerNum",  rs.getString("brokerNum"));
				obj.put("brokerTel",  rs.getString("brokerTel"));
				
				return obj;
			}
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public void insertTblContract(String dealSeq, String seq) {

		try {

			 CallableStatement cstat = conn.prepareCall("{call procTblContract(?,?)}");

	         cstat.setString(1, dealSeq);
	         cstat.setString(2, seq);

	         cstat.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@SuppressWarnings("unchecked")
	public JSONObject tblContract(String dealSeq) {

		try {

			String sql = "select * from tblContract where dealSeq = ?";

			stat = conn.prepareStatement(sql);
			stat.setString(1, dealSeq);
			
			rs = stat.executeQuery();
			
			if (rs.next()) {
				JSONObject obj = new JSONObject();
				
				obj.put("dealSeq", rs.getString("dealSeq"));
				obj.put("tenantAgree", rs.getString("tenantAgree"));
				obj.put("brokerAgree", rs.getString("brokerAgree"));
				
				return obj;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<BrokerItemListDTO> brokerItemList(String seq) {

		try {

			String sql = "select * from (select a.*, rownum as rnum from (select * from vwItemInfo order by itemSeq desc) a where brokerseq = (select brokerseq from tblBroker where generalSeq = ?)) where rnum between 1 and 3";

			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			rs = stat.executeQuery();
			
			ArrayList<BrokerItemListDTO> list = new ArrayList<BrokerItemListDTO>();
			
			while (rs.next()) {
				BrokerItemListDTO dto = new BrokerItemListDTO();

				dto.setBrokerSeq(rs.getString("brokerSeq"));
				dto.setItemSeq(rs.getString("itemSeq"));
				dto.setItemAddress(rs.getString("address"));
				dto.setItemKind(rs.getString("kind"));
				dto.setItemDealKind(rs.getString("dealKind"));
				dto.setItemView(rs.getString("itemView"));
				dto.setItemDealSituation(rs.getString("dealSituation"));
				dto.setItemDeposit(rs.getString("deposit"));
				dto.setItemMonthly(rs.getString("monthly"));
				dto.setItemClosedNote(rs.getString("closedNote"));
				dto.setItemPicture(rs.getString("picture"));
				dto.setItemFavorite(rs.getString("favorite"));
				
				list.add(dto);
				
			}
			
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int deleteItem(String itemSeq) {
		
		try { //procDelBrokerItem
			
			CallableStatement cstat = conn.prepareCall("{call procDelBrokerItem(?)}");

	         cstat.setString(1, itemSeq);

	         int result = cstat.executeUpdate();
	            

	         return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}


}