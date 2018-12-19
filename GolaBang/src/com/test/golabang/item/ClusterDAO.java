package com.test.golabang.item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.test.golabang.DBUtil;

public class ClusterDAO {
   
   private Connection conn;
   private PreparedStatement stat;
   private ResultSet rs;
   
   public ClusterDAO() {
      this.conn = DBUtil.getConnection();
   }

   public ArrayList<String> change() {
      
      try {

         String sql = "select address from tblItemRegister";

         stat = conn.prepareStatement(sql);
         rs = stat.executeQuery();
         ArrayList<String> list = new ArrayList<String>();
         
         while (rs.next()) {
            //AddressDTO dto = new AddressDTO();
            //dto.setAddress(rs.getString("address"));
            list.add(rs.getString("address"));
            
            
            //System.out.println(dto);
            //return dto;
         }
         
         return list;
         
         

      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return null;
   }
   
   
   
}