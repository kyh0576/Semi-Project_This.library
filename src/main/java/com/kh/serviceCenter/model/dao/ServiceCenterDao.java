package com.kh.serviceCenter.model.dao;

import static com.kh.common.JDBCTemplate. *;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.PageInfo;
import com.kh.serviceCenter.model.vo.serviceCenter;

public class ServiceCenterDao {

	private Properties prop = new Properties();
	
	public ServiceCenterDao() {
		// 실제론 src폴더에 만들었지만 WebContent에 있는 WEB-INF에 있음
		// 그중 MemberDao가 가지고있는 class의 소스
		String filePath = ServiceCenterDao.class.getResource("/db/sql/serviceCenter.xml").getPath();

		try {
			// 4. dao, xml 연결하기 -> 기본생성자!!!!!!!!!!!!
			prop.loadFromXML(new FileInputStream(filePath)); // 파일을 읽는다!
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 1:1 문의글 작성(insert) 쿼리문
	 * @param conn
	 * @param sc
	 * @return result
	 */
	public int insertInquiry(Connection conn,serviceCenter sc) {
		
		// insert문 =-> 처리된 행수 => 트랜잭션 처리 해야한다. (커밋을 해야한다.)
				int result = 0;

				PreparedStatement pstmt = null;
				String sql = prop.getProperty("insertInquiry");
				try {
					pstmt = conn.prepareStatement(sql); // 미완성된 sql문 이다.
					pstmt.setInt(1, sc.getMemNo());
					pstmt.setString(2, sc.getTitle());
					pstmt.setString(3, sc.getContent());

					result = pstmt.executeUpdate();

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
				return result;
	}
	
	/**
	 * 1:1 문의글 작성(첨부파일)
	 * @param conn
	 * @param at
	 * @return result
	 */
	public int insertAttachment(Connection conn, Attachment at) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 1:1 문의글 조회(SELECT) 쿼리문
	 * @param conn
	 * @param pi
	 * @return list
	 */
	public ArrayList<serviceCenter> selectList(Connection conn, PageInfo pi){
		
		ArrayList<serviceCenter> list = new ArrayList<serviceCenter>();
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
				list.add(
						new serviceCenter(rset.getInt("inquiry_no")
							     , rset.getInt("mem_no")
							     , rset.getString("title")
							     , rset.getString("content")
							     , rset.getString("answer")
							     , rset.getString("inquiry_date")
							     , rset.getString("answer_date")
							     , rset.getString("status")
							     , rset.getString("name")
							     
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
	
	
	/**
	 *  총 문의 게시글 count 로 조회, 문의 리스트 조회용
	 * @param conn
	 * @return listCount
	 */
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
	
	
	/**
	 *  1:1 문의 상세 페이지 조회
	 * @param conn
	 * @param scNO
	 * @return serviceCenter sc
	 */
	public serviceCenter selectBoard(Connection conn, int scNO) {
	    serviceCenter sc = null;
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
		String sql = prop.getProperty("selectListDetail");

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, scNO);
	        rset = pstmt.executeQuery();

	        if (rset.next()) {
	            sc = new serviceCenter();
	            sc.setInquiryNo(rset.getInt("INQUIRY_NO"));
	            sc.setTitle(rset.getString("title"));
	            sc.setContent(rset.getString("content"));
	            sc.setName(rset.getString("mem_name"));
	            sc.setInquiryDate(rset.getString("inquiry_date"));

	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }

	    return sc;
	}

	/**
	 * 1:1 문의글 삭제
	 * @param conn
	 * @param scNO
	 * @return result
	 */
	public int deleteBoard(Connection conn, int scNO) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, scNO);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 1:1 문의글 업데이트
	 * @param conn
	 * @param sc
	 * @return result
	 */
	public int updateInquiry(Connection conn, serviceCenter sc) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateInquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sc.getTitle());
			pstmt.setString(2, sc.getContent());
			pstmt.setInt(3, sc.getInquiryNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 *  1:1 문의글 상세 첨부파일 업데이트
	 * @param conn
	 * @param at
	 * @return
	 */
	public int updateAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * 1:1 문의글 새로운 첨부파일 추가(update)
	 * @param conn
	 * @param at
	 * @return result
	 */
	public int insertNewAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getWriteNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 1:1 문의글 작성시 첨부한 첨부파일 조회
	 * @param conn
	 * @param boardNo
	 * @return at
	 */
	public Attachment selectAttachment(Connection conn, int scNO) {
		// select문 => ResultSet (한행) => Attachment 객체
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, scNO);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				at = new Attachment(); // 매개변수 생성자 만들기 싫으면 이것처럼 하면 됨
				at.setFileNo(rset.getInt("file_no"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
	}
	
}
