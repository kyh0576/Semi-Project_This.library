package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.member.model.dao.CommantaryDao;
import com.kh.member.model.vo.Commantary;




public class CommantaryService {

	
	
	public int insertCommantary(Commantary c) {
		System.out.println("여긴 service단 dao로 보낼게");
		Connection conn = getConnection();
			
		int result = new CommantaryDao().insertCommantary(conn, c);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);		
		return result;
	}
	
	
	public ArrayList<Commantary> selectCommantaryList(int memNo){
		Connection conn = getConnection();
		ArrayList<Commantary> list = new CommantaryDao().selectCommantaryList(conn, memNo);
		close(conn);
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
