package com.kh.scvote.model.service;

import java.sql.Connection;

import com.kh.scvote.model.dao.scNoticeDao;
import com.kh.scvote.model.vo.scNoticeVO;

import static com.kh.common.JDBCTemplate.*;
import java.util.ArrayList;



public class scNoticeService {

	
	
	public int insertNotice( scNoticeVO notice) {
		Connection conn = getConnection();
		
		int result = new scNoticeDao().insertNotice(conn , notice);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;		
	}
	
	public ArrayList<scNoticeVO> selectNoticeList() {
	    Connection conn = getConnection();
	    ArrayList<scNoticeVO> list = new scNoticeDao().selectNoticeList(conn);
	    close(conn);
	    return list;
	}

	
}
