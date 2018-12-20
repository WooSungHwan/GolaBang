package com.test.golabang.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.test.golabang.DBUtil;

/**
 * 허위 매물게시판 데이터를 관리하는 클래스
 * 
 * @author 송지은
 *
 */

public class FakeItemBoardDAO {

   private Connection conn;
   private PreparedStatement stat;
   private ResultSet rs;
   
   public FakeItemBoardDAO() {
      this.conn = DBUtil.getConnection();
   }
   
//   public ArrayList<BbsDTO> list(boolean isSearch, HashMap<String, String> map) {
//      
//      try {
//    	  
//    	  ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();
//     	 
//     	 String where = "";
//     	 
//     	 if(isSearch) {
//     		 where = String.format(" and %s like '%%%s%%'"
//                      , map.get("column")
//                      , map.get("search"));
//     		 System.out.println(where);
//     	 }// where name like '%hong%'
//     	 
//         String sql = String.format("select * from " + 
//         		"(select f.*, rownum as rnum from vwFakeBBS f) where (rnum between %s and %s) %s"
//        		, map.get("begin")
//				, map.get("end")
//				, where);
//
//         stat = conn.prepareStatement(sql);
//         rs = stat.executeQuery();
//         
//         
//         while(rs.next()) {
//            
//            BbsDTO dto = new BbsDTO();
//            
//            dto.setSeq(rs.getString("seq"));
//            dto.setSubject(rs.getString("subject"));
//            dto.setName(rs.getString("name"));
//            dto.setRegdate(rs.getString("regdate"));
//            dto.setReadcount(rs.getString("readcount"));
//            
//            list.add(dto);
//                  
//         }
//      
//         
//         return list;
//         
//      } catch (Exception e) {   
//         e.printStackTrace();
//      }
//      
//      return null;
//   }
   
   /**
    * 
    * 게시판의 페이징 관련 데이터 메소드
    * 
    * @param isSearch
    * @param map
    * @return rs.getInt("cnt") / 0
    */
   public int getBoardPaging(boolean isSearch, HashMap<String, String> map) {
	      
	   	  	String where = "";
			if (isSearch) {
				where = String.format("where %s like '%%%s%%'", map.get("column"), map.get("search"));
				System.out.println(where);
			}
	
			String sql = String.format("select count(*) as cnt from vwFakeBBS %s", where);
	      
	      try {
	         PreparedStatement stat = conn.prepareStatement(sql);
	         ResultSet rs = stat.executeQuery();
	         if(rs.next()) {
	            return rs.getInt("cnt");
	         }
	         
	      } catch (Exception e) {
	         
	      }
	      return 0;
	   }

   /**
    * 게시판 목록을 가져오는 데이터 메소드
    * 
    * @param isSearch
    * @param map
    * @return list
    */
   
   public ArrayList<BbsDTO> list(boolean isSearch, HashMap<String, String> map) {

	      try {

	         ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();

	         String where = "";
	         if (isSearch) {
	            where = String.format("where %s like '%%%s%%'",map.get("column"),map.get("search"));
	            System.out.println(where);
	         }
	         
	         String sql = String.format("select * from (select f.*, rownum as rnum from vwFakeBBS f %s %s) where rnum between %s and %s"
	        	, where
	        	,"order by regdate desc "
	            , map.get("begin")
	            , map.get("end")
	            );
	         
	         System.out.println(map.get("begin"));
	         System.out.println(map.get("end"));
	         //sql = "select * from (select f.*, rownum as rnum from vwFakeBBS f)";
	         stat = conn.prepareStatement(sql);
	         System.out.println(sql);
	         rs = stat.executeQuery();

	         while (rs.next()) {

	        	 BbsDTO dto = new BbsDTO();
	        	 
	        	 dto.setSeq(rs.getString("seq"));
	             dto.setSubject(rs.getString("subject"));
	             dto.setName(rs.getString("name"));
	             dto.setRegdate(rs.getString("regdate"));
	             dto.setReadcount(rs.getString("readcount"));
	             
	             list.add(dto);

	         }

	         return list;

	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      return null;
	   }

	   /*public ArrayList<BbsDTO> list() {

	      ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();

	      try {

	         

	         stat = conn.prepareStatement(sql);
	         rs = stat.executeQuery();
	         while (rs.next()) {

	        	 BbsDTO dto = new BbsDTO();

	        	 dto.setSeq(rs.getString("seq"));
	             dto.setSubject(rs.getString("subject"));
	             dto.setName(rs.getString("name"));
	             dto.setRegdate(rs.getString("regdate"));
	             dto.setReadcount(rs.getString("readcount"));
	             
	             list.add(dto);

	         }

	         return list;

	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      return null;
	   }*/


   public void close() {
	   try {
			this.conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
      
   }


   /**
    * seq에 해당하는 게시판 글의 데이터를 가져오는 메소드
    * 
    * @param seq
    * @return dto
    */
   
   public BbsDTO get(String seq) {
   System.out.println("1");
      try {
               String sql = "select * from vwfakebbs where seq = ?";
               
               stat = conn.prepareStatement(sql);
               stat.setString(1, seq);
               rs = stat.executeQuery();
            
               
               if(rs.next()) {
                  BbsDTO dto = new BbsDTO();
               
                  dto.setSeq(rs.getString("seq"));
                  dto.setItemseq(rs.getString("itemseq"));
                  dto.setName(rs.getString("name"));
                  dto.setSubject(rs.getString("subject"));
                  dto.setContent(rs.getString("content"));
                  dto.setReadcount(rs.getString("readcount"));
                  dto.setRegdate(rs.getString("regdate"));
                  
                  System.out.println(dto.getReadcount());
                  
                  return dto;
               }
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return null;
   }

   /**
    * seq에 해당하는 게시판의 글의 조회수를 업데이트 하는 메소드
    * 
    * @param seq
    */
   public void addReadCount(String seq) {
		
		try {

			String sql = "update vwfakebbs set readcount = readcount + 1 where seq = ?";

			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			stat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
   
   /**
    * 게시판에 글을 작성할 때 데이터를 삽입하는 메소드
    * 
    * @param dto
    * @param seq
    * @return stat.executeUpdate()
    */
public int write(BbsDTO dto,String seq) {
	try {
		String sql = "insert into tblfakeitemboard(fakeitemboardseq,generalseq,itemseq,title,content,type,regdate,commentcnt) values(FAKEITEMBOARDSEQ.nextval,?,?,?,?,?,default,default)";
		
		
		System.out.println(dto.getSubject());
		System.out.println(dto.getCommentcnt());
		
		
		
		stat = conn.prepareStatement(sql);
		stat.setString(1, seq);	//generalseq
		stat.setString(2, "563");   //itemseq
		stat.setString(3, dto.getSubject());
		stat.setString(4, dto.getContent());
		stat.setString(5, "0");

		return stat.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return 0;
}

/**
 * 게시판의 글을 수정할때 데이터를 업데이트 하는 메소드
 * 
 * @param dto
 * @return stat.executeUpdate
 */


public int edit(BbsDTO dto) {
	
	try {
		
		String sql = "update tblfakeitemboard set title = ?, content = ? where fakeitemboardseq = ?";

		stat = conn.prepareStatement(sql);
		stat.setString(1, dto.getSubject());
		stat.setString(2, dto.getContent());
		stat.setString(3, dto.getSeq());
		
		return stat.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return 0;
}

/**
 * 
 * 게시판의 글을 삭제할 때 데이터를 삭제하는 메소드
 * 
 * @param seq
 * @return stat.executeUpdate
 */

public int del(String seq) {
	
	try {
		String sql = "delete from tblfakeitemboard where fakeitemboardseq = ?";

		stat = conn.prepareStatement(sql);
		stat.setString(1, seq);
		
		return stat.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return 0;
}


/**
 * 게시판의 글의 작성자인지 확인하는 데이터 메소드
 * 
 * @param FakeSeq
 * @param Generalseq
 * @return true / false
 */
public boolean isOwner(String FakeSeq,String Generalseq) {
	
	try {

		String sql = "select count(*) cnt from tblFakeItemBoard where fakeitemboardseq =? and generalSeq = ?";
		System.out.println("a"+FakeSeq);
		stat = conn.prepareStatement(sql);
		stat.setString(1, FakeSeq);
		stat.setString(2, Generalseq);
		rs = stat.executeQuery();
		
		if (rs.next()) {
			return rs.getInt("cnt") == 1 ? true : false;
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return false;
}


   
}