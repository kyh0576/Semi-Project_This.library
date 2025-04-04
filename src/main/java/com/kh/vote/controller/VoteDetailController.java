package com.kh.vote.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.vote.model.service.VoteService;
import com.kh.vote.model.vo.Vote;

/**
 * Servlet implementation class VoteDetailController
 */
@WebServlet("/detail.vo")
public class VoteDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoteDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int votedNo = Integer.parseInt(request.getParameter("vno"));
		
		VoteService vService = new VoteService();
		
		int result = vService.increaseCount(votedNo);
		if(result > 0) { // 유효한 게시글 => 게시글, 첨부파일 조회
			Vote v = vService.selectVote(votedNo);
			
			request.setAttribute("v", v);
			
			request.getRequestDispatcher("views/vote/voteDetailForm.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "일반게시판 조회 실패");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
