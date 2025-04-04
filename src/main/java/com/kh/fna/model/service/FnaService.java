package com.kh.fna.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.fna.dao.FnaDao;
import com.kh.fna.model.vo.Fna;

public class FnaService {

	public ArrayList<Fna> selectList(int scNO) {
		Connection conn = getConnection();
		
		ArrayList<Fna> list = new FnaDao().selectList(conn, scNO);
		close(conn);
		return list;
		
	}
	
	public int updateFna(String answer, int fnaNo ) {
		Connection conn = getConnection();

		int result = new FnaDao().updateFna(conn, answer, fnaNo);

		if(result > 0) {
			commit(conn);

		}else {
			rollback(conn);
		}

		close(conn);
		return result;
	}
	public int deleteFna(int fnaNo ) {
		Connection conn = getConnection();
		int result = new FnaDao().deleteFna(conn, fnaNo);
	
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
}
