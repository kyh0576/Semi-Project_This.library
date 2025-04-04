package com.kh.board.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardDeleteController
 */
@WebServlet("/delete.bo")
public class BoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			int boardNo = Integer.parseInt(request.getParameter("bno"));
			
			int result1 = new BoardService().deleteBoard(boardNo);	
			Attachment at = new BoardService().selectAttachment(boardNo);
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");

			if(result1 > 0) { // 게시글 삭제 성공
				if(at != null) {
					new BoardService().deleteAttachment(boardNo);
					new File(savePath + at.getChangeName()).delete();
				}
				request.getSession().setAttribute("alertMsg", "성공적으로 게시글이 삭제 되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.bo?cpage=1");
			}else {
				request.getSession().setAttribute("alertMsg", "게시글 삭제 실패!");
				response.sendRedirect(request.getContextPath() + "/list.bo?cpage=1");
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
