package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1_1. 전달되는 파일의 용량 제한 (int maxSize)
			int maxSize = 10 * 1024 * 1024;
			
			// 1_2. 전달되는 파일을 저장시킬 서버의 폴더 물리적인 경로 (String savePath)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			// request. 이거 자체가 request 객체임
			// request.getSession() 이거 자체가 session 객체임
			// request.getSession().getServletContext() 이거 자체가 application 객체임
			
			// 2. 전달된 파일명 수정 작업 후 서버에 업로드
			//    HttpServletRequest request => MultipartRequest multiRequest 
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3. 본격적으로 sql문 실행할 때 필요한 값 (요청시 전달값 뽑아서 vo에 기록
			// 공통적으로 수행 : Update Board
			int boardNo = Integer.parseInt(multiRequest.getParameter("bno"));
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			
			Board b = new Board();
			b.setBoardNo(boardNo);
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			
			Attachment at = null; // 처음으로 null로 초기화, 넘어온 새 첨부파일이 있을 경우 그때 생성
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				// 새로운 첨부파일이 있을경우
				
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/board_upfiles/");
				
				if(multiRequest.getParameter("originFileNo") != null) {
					// 기존의 첨부파일이 있었을 경우 => Update Attachment (기존첨부파일번호 필요)
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
				}else {
					// 기존의 첨부파일이 없었을 경우 => Insert Attachment (현재게시글 번호)
					at.setWriteNo(boardNo);
				}
				
			}
			
			// 새로운 첨부파일이 없었다면 at는 여전히 null일거임
			
			int result = new BoardService().updateBoard(b, at);
			// 새로운 첨부파일 x						=>  b, null					=> Board Update
			// 새로운 첨부파일 o 기존의 첨부파일 o			=>  b, fileNo가 담긴 at		=> Board Update, Attachment Update
			// 새로운 첨부파일 o 기존의 첨부파일 x			=>  b, refBoardNo가 담긴 at	=> Board Update, Attachment Insert
		
			if(result > 0) {
				// 성공 => 기존에 봤었던 사엣조회 페이지
				request.getSession().setAttribute("alertMsg", "성공적으로 게시판 수정 되었습니다.");
				response.sendRedirect(request.getContextPath() + "/detail.bo?bno=" + boardNo);
				
			}else {
				// 실패 => 에러문구 담아서 에러페이지
				request.getSession().setAttribute("alertMsg", "게시판 수정 실패!");
				response.sendRedirect(request.getContextPath() + "/detail.bo?bno=" + boardNo);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
