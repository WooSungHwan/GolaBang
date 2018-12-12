package com.test.golabang.broker;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.test.golabang.DBUtil;

public class BrokerDAO {
	private Connection conn;
	private PreparedStatement stat ;
	private ResultSet rs;
	
	public BrokerDAO() {
		this.conn=DBUtil.getConnection();
	}
}
