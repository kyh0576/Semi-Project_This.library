package com.kh.vote.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.BoardAnswer;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.dao.MemberDao;
import com.kh.vote.model.vo.Vote;
import com.kh.vote.model.vo.VoteAnswer;

public class VoteDao {

	// 2. service, dao 껍데기 파일 만들기 (전역변수로)
	private Properties prop = new Properties();

	public VoteDao() {
		// 실제론 src폴더에 만들었지만 WebContent에 있는 WEB-INF에 있음
		// 그중 MemberDao가 가지고있는 class의 소스
		String filePath = MemberDao.class.getResource("/db/sql/vote-mapper.xml").getPath();

		try {
			// 4. dao, xml 연결하기 -> 기본생성자!!!!!!!!!!!!
			prop.loadFromXML(new FileInputStream(filePath)); // 파일을 읽는다!
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int selectListCount(Connection conn) {
		// select문 => ResultSet (한개) => int
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql); // 완성된 sql문
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Vote> selectList(Connection conn, PageInfo pi) {
		ArrayList<Vote> list = new ArrayList<Vote>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문
			
			/*
			 * currentPage : 1 => DB(Oracle)에 있는 RNUM의 시작값 :  1 | 끝값 : 10
			 * currentPage : 2 => DB(Oracle)에 있는 RNUM의 시작값 : 11 | 끝값 : 20
			 * currentPage : 3 => DB(Oracle)에 있는 RNUM의 시작값 : 21 | 끝값 : 30
			 * 
			 * 시작값 : (currentPage - 1) * boardLimit + 1
			 * 끝값  : 시작값 + boardLimit - 1
			 */
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Vote(rset.getInt("vote_no")
							     , rset.getInt("mem_no")
							     , rset.getString("nickname")
							     , rset.getString("vote_title")
							     , rset.getInt("count")
							     , rset.getString("vote_startdate")
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

	public int insertVote(Connection conn, Vote v) {
		// insert문 => 처리된 행수 => 트랜잭션 처리
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertVote"); // 미완성된 sql문
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, v.getMemNo());
			pstmt.setString(2, v.getVoteTitle());
			pstmt.setString(3, v.getBook1());
			pstmt.setString(4, v.getBook2());
			pstmt.setString(5, v.getVoteEndDate());
			pstmt.setString(6, v.getBook1Url());
			pstmt.setString(7, v.getBook2Url());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Vote selectVote(Connection conn, int votedNo) {
		// select문 => ResultSet(한행) => Board객체
		Vote v = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectVote");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, votedNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				v = new Vote(rset.getInt("vote_no"),
							  rset.getString("nickname"),
							  rset.getInt("mem_no"),
							  rset.getString("vote_title"),
							  rset.getString("book1"),
							  rset.getString("book2"),
							  rset.getString("vote_startdate"),
							  rset.getString("vote_enddate"),
							  rset.getInt("vote_count1"),
							  rset.getInt("vote_count2"),
							  rset.getString("book1_url"),
							  rset.getString("book2_url"),
							  rset.getInt("count"),
							  rset.getString("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return v;
	}

	public int increaseCount(Connection conn, int votedNo) {
		// update문 => 처리된 행수 => 트랜잭션 처리
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문
			pstmt.setInt(1, votedNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int vote(Connection conn, int vNo, int bNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = null;
		if(bNum == 1) {
			sql = prop.getProperty("vote1");		
		}else {
			sql = prop.getProperty("vote2");		
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}close(pstmt);
		
		return result;
	}

	public int updateVote(Connection conn, Vote v) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateVote");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, v.getVoteTitle());
			pstmt.setString(2, v.getBook1());
			pstmt.setString(3, v.getBook2());
			pstmt.setString(4, v.getVoteEndDate());
			pstmt.setString(5, v.getBook1Url());
			pstmt.setString(6, v.getBook2Url());
			pstmt.setInt(7, v.getVoteNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteVote(Connection conn, int vNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteVote");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertReply(Connection conn, VoteAnswer va) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, va.getMemNo());
			pstmt.setInt(2, va.getVoteNo());
			pstmt.setString(3, va.getvAnswer());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int voteAnswerCount(Connection conn, int voteNo) {
		int baCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("voteAnswerCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, voteNo);
			
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

	public ArrayList<VoteAnswer> selectReplyList(Connection conn, int voteNo) {
		ArrayList<VoteAnswer> list = new ArrayList<VoteAnswer>(); // []
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, voteNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new VoteAnswer(rset.getInt("v_answer_no"),
							 		   rset.getString("nickname"),
							 		   rset.getInt("mem_no"),
									   rset.getString("v_answer"),
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

	public int deleteVoteAnswer(Connection conn, int rno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteVoteAnswer");
		
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

	public int updateVoteAnswer(Connection conn, int rno, String rcontent) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateVoteAnswer");
		
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
