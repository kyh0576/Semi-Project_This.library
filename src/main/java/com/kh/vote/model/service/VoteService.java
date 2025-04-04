package com.kh.vote.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.BoardAnswer;
import com.kh.common.model.vo.PageInfo;
import com.kh.vote.model.dao.VoteDao;
import com.kh.vote.model.vo.Vote;
import com.kh.vote.model.vo.VoteAnswer;

public class VoteService {

	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new VoteDao().selectListCount(conn);
		close(conn);
		
		return listCount;
	}

	public ArrayList<Vote> selectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Vote> list = new VoteDao().selectList(conn, pi);
		close(conn);
		
		return list;
	}

	public int insertVote(Vote v) {
		Connection conn = getConnection();
		int result = new VoteDao().insertVote(conn, v);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Vote selectVote(int votedNo) {
		Connection conn = getConnection();
		
		Vote v = new VoteDao().selectVote(conn, votedNo);
		
		// 조회이기때문에 트랜잭션(commit, rollback) 필요없음
		close(conn);
		
		return v;
	}

	public int increaseCount(int votedNo) {
		Connection conn = getConnection();
		
		int result = new VoteDao().increaseCount(conn, votedNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int vote(int vNo, int bNum) {
		Connection conn = getConnection();

		int result = new VoteDao().vote(conn, vNo, bNum);
		
		close(conn);
		
		return result;
	}

	public int updateVote(Vote v) {
		Connection conn = getConnection();
		int result = new VoteDao().updateVote(conn, v);
		
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteVote(int vNo) {
		Connection conn = getConnection();
		
		int result = new VoteDao().deleteVote(conn, vNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int insertReply(VoteAnswer va) {
		Connection conn = getConnection();
		
		int result = new VoteDao().insertReply(conn, va);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int voteAnswerCount(int voteNo) {
		Connection conn = getConnection();
		
		int vaCount = new VoteDao().voteAnswerCount(conn, voteNo);
		
		close(conn);
		
		return vaCount;
	}

	public ArrayList<VoteAnswer> selectReplyList(int voteNo) {
		Connection conn = getConnection();
		
		ArrayList<VoteAnswer> list = new VoteDao().selectReplyList(conn, voteNo);
		
		close(conn);
		
		return list;
	}

	public int deleteVoteAnswer(int rno) {
		Connection conn = getConnection();
		
		int result = new VoteDao().deleteVoteAnswer(conn, rno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateVoteAnswer(int rno, String rcontent) {
		Connection conn = getConnection();
		
		int result = new VoteDao().updateVoteAnswer(conn, rno, rcontent);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
