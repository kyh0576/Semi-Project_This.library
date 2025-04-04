package com.kh.board.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.BoardAnswer;
import com.kh.common.model.vo.Follow;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;

public class BoardService {

	public ArrayList<Board> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		close(conn);
		
		return list;
	}

	public int increaseCount(int boardNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().increaseCount(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Board selectBoard(int boardNo) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, boardNo);
		
		// 조회이기때문에 트랜잭션(commit, rollback) 필요없음
		close(conn);
		
		return b;
	}

	public Attachment selectAttachment(int boardNo) {
		Connection conn = getConnection();
		
		Attachment at = new BoardDao().selectAttachment(conn, boardNo);
		
		close(conn);
		
		return at;
	}

	public int insertBoard(Board b, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertBoard(conn, b);
		int result2 = 1;
		
		if(at != null) {
			result2 = new BoardDao().insertAttachment(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result1 * result2;
	}

	public int deleteBoard(int boardNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int deleteAttachment(int boardNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteAttachment(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int updateBoard(Board b, Attachment at) {
		Connection conn = getConnection();
		int result1 = new BoardDao().updateBoard(conn, b);
		
		int result2 = 1;
		if(at != null) { // 새로운 첨부파일이 있었을 경우
			
			if(at.getFileNo() != 0) { // 기존의 첨부파일이 있었을 경우 => Update Attachment
				result2 = new BoardDao().updateAttachment(conn, at);
			}else { // 기존의 첨부파일 없었을 경우 => Insert Attachment
				result2 = new BoardDao().insertNewAttachment(conn, at);
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

	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new BoardDao().selectListCount(conn);
		close(conn);
		
		return listCount;
	}

	public int insertReply(BoardAnswer ba) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertReply(conn, ba);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<BoardAnswer> selectReplyList(int boardNo) {
		Connection conn = getConnection();
		
		ArrayList<BoardAnswer> list = new BoardDao().selectReplyList(conn, boardNo);
		
		close(conn);
		
		return list;
	}

	public int boardAnswerCount(int boardNo) {
		Connection conn = getConnection();
		
		int baCount = new BoardDao().boardAnswerCount(conn, boardNo);
		
		close(conn);
		
		return baCount;
	}

	public int deleteBoardAnswer(int rno) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoardAnswer(conn, rno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateBoardAnswer(int rno, String rcontent) {
		Connection conn = getConnection();
		
		int result = new BoardDao().updateBoardAnswer(conn, rno, rcontent);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int insertFollow(Follow f) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertFollow(conn, f);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Follow> selectFollow() {
		Connection conn = getConnection();
		
		ArrayList<Follow> flist = new BoardDao().selectFollow(conn);
		
		close(conn);
		
		return flist;
	}

	public int deleteFollow(Follow f) {
		Connection conn = getConnection();
		int result = new BoardDao().deleteFollow(conn, f);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
