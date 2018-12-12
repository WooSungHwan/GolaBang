package com.test.golabang.admin;

import java.sql.*;

import com.test.golabang.DBUtil;

public class FakeItemBoardDAO {

	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	
	public FakeItemBoardDAO() {
		this.conn = DBUtil.getConnection();
	}
	
}
