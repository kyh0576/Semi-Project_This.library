package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.jayway.jsonpath.ParseContext;
import com.kh.member.model.vo.Commantary;

import static com.kh.common.JDBCTemplate.*;


public class CommantaryDao {

	// 2. service, dao 껍데기 파일 만들기 (전역변수로)
	private Properties prop = new Properties();

	public CommantaryDao() {
		// 실제론 src폴더에 만들었지만 WebContent에 있는 WEB-INF에 있음
		// 그중 MemberDao가 가지고있는 class의 소스
		String filePath = CommantaryDao.class.getResource("/db/sql/co-mapper.xml").getPath();

		try {
			// 4. dao, xml 연결하기 -> 기본생성자!!!!!!!!!!!!
			prop.loadFromXML(new FileInputStream(filePath)); // 파일을 읽는다!
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int insertCommantary(Connection conn, Commantary c) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCommantary");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getMemNo());
			pstmt.setString(2, c.getAuthor());
			pstmt.setString(3, c.getTitle());
			pstmt.setString(4, c.getContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
		
		
	}
	
	public ArrayList<Commantary> selectCommantaryList(Connection conn, int memNo){
		
		ArrayList<Commantary> list = new ArrayList<Commantary>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCommentary");
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(
							new Commantary(
									rset.getInt("write_no")
									, rset.getInt("mem_no")
									, rset.getString("author")
									, rset.getString("title")
									, rset.getString("content")	
									, rset.getString("WDATE")
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
	
	
	
	
	
	
	
	
}