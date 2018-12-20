package com.test.golabang.admin;

import java.sql.*;

import com.test.golabang.DBUtil;

/**
 * 폐기
 * @author 송지은
 *
 */

public class QuestionDAO {

	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	
	public QuestionDAO() {
		this.conn = DBUtil.getConnection();
	}
	
}
