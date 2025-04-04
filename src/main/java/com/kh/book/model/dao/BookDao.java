package com.kh.book.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.BoardAnswer;
import com.kh.book.model.vo.BookAnswer;

public class BookDao {

	private Properties prop = new Properties();
	
	public BookDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(BoardDao.class.getResource("/db/sql/book-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<BookAnswer> selectReplyList(Connection conn, String isbn) {
		ArrayList<BookAnswer> list = new ArrayList<BookAnswer>(); // []
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new BookAnswer(rset.getInt("book_answer_no"),
							 		    rset.getString("isbn_no"),
							 		    rset.getInt("mem_no"),
							 		    rset.getString("nickname"),
									    rset.getString("answer_content"),
									    rset.getInt("star"),
									    rset.getString("answer_date")
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

	public int bookAnswerCount(Connection conn, String isbn) {
		int baCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("bookAnswerCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				baCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return baCount;
	}

	public int insertReply(Connection conn, BookAnswer ba) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ba.getMemNo());
			pstmt.setString(2, ba.getIsbnNo());
			pstmt.setString(3, ba.getAnswerContent());
			pstmt.setInt(4, ba.getStar());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteBookAnswer(Connection conn, int rno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBookAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateBookAnswer(Connection conn, int rno, String rcontent) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBookAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rcontent);
			pstmt.setInt(2, rno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
