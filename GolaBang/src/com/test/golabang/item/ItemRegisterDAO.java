package com.test.golabang.item;

import java.sql.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.test.golabang.DBUtil;

public class ItemRegisterDAO {

   Connection conn = null;
   PreparedStatement stat = null;
   ResultSet rs = null;
   
   public ItemRegisterDAO() {
      this.conn = DBUtil.getConnection();
   }

   @SuppressWarnings("unchecked")
   public JSONObject itemDetail(String itemSeq) {

      try {

         String sql = "select * from vwiteminfo where itemseq = ?";

         stat = conn.prepareStatement(sql);
         stat.setString(1, itemSeq);
         
         
         rs = stat.executeQuery();
         
         if (rs.next()) {
            JSONObject obj = new JSONObject();
            
            /*
            totalFloor
            floor
            supplyArea
            useArea
            heatingKind
            elevator
              pet
            balcony
            moveDate
            builtIn
            content
            pic
            
            */
            
            obj.put("totalFloor", rs.getString("totalFloor"));
            obj.put("floor", rs.getString("floor"));
            obj.put("supplyArea", rs.getString("supplyArea"));
            obj.put("useArea", rs.getString("useArea"));
            obj.put("heatingKind", rs.getString("heatingKind"));
            obj.put("elevator", rs.getString("elevator"));
            obj.put("pet", rs.getString("pet"));
            obj.put("balcony", rs.getString("balcony"));
            obj.put("moveDate", rs.getString("moveDate"));
            obj.put("builtIn", rs.getString("builtIn"));
            
            String content = rs.getString("content");
            content = content.replace("\r\n", "<br>");
            
            obj.put("content", content);
            obj.put("picture", rs.getString("picture"));
            
            return obj;
         }
         

      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return null;
   }
}