package com.kh.fna.dao;

import static com.kh.common.JDBCTemplate. *;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;


import com.kh.fna.model.vo.Fna;
import com.kh.serviceCenter.model.dao.ServiceCenterDao;


public class FnaDao {
private Properties prop = new Properties();
	
	public FnaDao() {
		
		String filePath = ServiceCenterDao.class.getResource("/db/sql/fna-mapper.xml").getPath();

		try {
			// 4. dao, xml 연결하기 -> 기본생성자!!!!!!!!!!!!
			prop.loadFromXML(new FileInputStream(filePath)); // 파일을 읽는다!
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 1:1 문의글 조회(SELECT) 쿼리문
	 * @param conn
	 * @param pi
	 * @return list
	 */
	public ArrayList<Fna> selectList(Connection conn, int scNO){
		ArrayList<Fna> list = new ArrayList<Fna>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(
						new Fna(rset.getInt("fna_no")
								, rset.getString("fna_title")
								, rset.getString("content")
								, rset.getString("answer")
								, rset.getString("inquiry_date")
								, rset.getString("status")
						));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	public int updateFna(Connection conn, String answer,int fnaNo) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateFna");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, answer);
			pstmt.setInt(2, fnaNo);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	
	
	public int deleteFna(Connection conn, int fnaNo ) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFna");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fnaNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	
	
}
