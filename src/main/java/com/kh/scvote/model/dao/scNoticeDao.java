package com.kh.scvote.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.scvote.model.vo.scNoticeVO;


public class scNoticeDao {

	private Properties prop = new Properties();

	public scNoticeDao() {
		String filePath = scNoticeDao.class.getResource("/db/sql/notice-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (InvalidPropertiesFormatException e) {
			
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		} // 파일을 읽는다!

		
	}
	
	
	public int insertNotice(Connection conn , scNoticeVO notice) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
}
	public ArrayList<scNoticeVO> selectNoticeList(Connection conn){
		
		ArrayList<scNoticeVO> list = new ArrayList<scNoticeVO>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new scNoticeVO(
						rset.getInt("notice_no"),
						rset.getInt("mem_no"),
						rset.getString("notice_title"),
						rset.getString("notice_content"),
						rset.getString("WRITE_DATE")
						));
			}
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}	
		return list;
		
}
	
	
	
}
