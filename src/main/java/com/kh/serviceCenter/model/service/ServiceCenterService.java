package com.kh.serviceCenter.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.PageInfo;
import com.kh.serviceCenter.model.dao.ServiceCenterDao;
import com.kh.serviceCenter.model.vo.serviceCenter;



public class ServiceCenterService {

	
	/**
	 * 1:1 글 작성 (insert)
	 * @param conn
	 * @param sc
	 * @return
	 */
	public int insertInquiry(serviceCenter sc, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new ServiceCenterDao().insertInquiry(conn, sc);
		int result2 = 1;
		
		if(at != null) {
			result2 = new ServiceCenterDao().insertAttachment(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result1 * result2;
	}
	
	/**
	 * 1:1 문의글 리스트 조회 page바
	 * @param pi
	 * @return list
	 */
	public ArrayList<serviceCenter> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<serviceCenter> list = new ServiceCenterDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	
	/**
	 *  총 문의 게시글 count 로 조회, 문의 리스트 조회용
	 * @param conn
	 * @return listCount
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new ServiceCenterDao().selectListCount(conn);
		close(conn);

		
		return listCount;
	}

	/**
	 * 1:1문의글 상세 페이지 조회
	 * @param scNO
	 * @return  serviceCenter sc
	 */
	public serviceCenter selectBoard(int scNO) {
	    Connection conn = getConnection();
	    serviceCenter sc = new ServiceCenterDao().selectBoard(conn, scNO);
	    close(conn);
	    return sc;
	}

	public int deleteBoard(int scNO){
		Connection conn = getConnection();
		
		int result = new ServiceCenterDao().deleteBoard(conn, scNO);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	/**
	 *  1:1 문의글 상세 페이지 첨부파일업데이트
	 * @param sc
	 * @param at
	 * @return result1 * result2
	 */
	public int updateInquiry(serviceCenter sc , Attachment at) {
		Connection conn = getConnection();
		int result1 = new ServiceCenterDao().updateInquiry(conn, sc);
		
		int result2 = 1;
		if(at != null) { // 새로운 첨부파일이 있었을 경우
			
			if(at.getFileNo() != 0) { // 기존의 첨부파일이 있었을 경우 => Update Attachment
				result2 = new ServiceCenterDao().updateAttachment(conn, at);
			}else { // 기존의 첨부파일 없었을 경우 => Insert Attachment
				result2 = new ServiceCenterDao().insertNewAttachment(conn, at);
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	
	public Attachment selectAttachment(int scNO) {
		Connection conn = getConnection();
		
		Attachment at = new ServiceCenterDao().selectAttachment(conn, scNO);
		
		close(conn);
		
		return at;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
