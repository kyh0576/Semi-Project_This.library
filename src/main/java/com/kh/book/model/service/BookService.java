package com.kh.book.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.BoardAnswer;
import com.kh.book.model.dao.BookDao;
import com.kh.book.model.vo.BookAnswer;

public class BookService {

	public ArrayList<BookAnswer> selectReplyList(String isbn) {
		Connection conn = getConnection();
		
		ArrayList<BookAnswer> list = new BookDao().selectReplyList(conn, isbn);
		
		close(conn);
		
		return list;
	}

	public int bookAnswerCount(String isbn) {
		Connection conn = getConnection();
		
		int baCount = new BookDao().bookAnswerCount(conn, isbn);
		
		close(conn);
		
		return baCount;
	}

	public int insertReply(BookAnswer ba) {
		Connection conn = getConnection();
		
		int result = new BookDao().insertReply(conn, ba);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteBookAnswer(int rno) {
		Connection conn = getConnection();
		
		int result = new BookDao().deleteBookAnswer(conn, rno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateBookAnswer(int rno, String rcontent) {
		Connection conn = getConnection();
		
		int result = new BookDao().updateBookAnswer(conn, rno, rcontent);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
