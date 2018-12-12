package com.test.golabang.tenant;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.test.golabang.DBUtil;

public class GeneralDAO {
	private Connection conn;
	private PreparedStatement stat ;
	private ResultSet rs;
	
	public GeneralDAO() {
		this.conn=DBUtil.getConnection();
	}
}
