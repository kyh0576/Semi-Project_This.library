package com.kh.vote.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.vote.model.service.VoteService;

/**
 * Servlet implementation class VoteDeleteController
 */
@WebServlet("/delete.vo")
public class VoteDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoteDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int vNo = Integer.parseInt(request.getParameter("vno"));
	
		int result = new VoteService().deleteVote(vNo);
		
		if(result > 0) { // 게시글 삭제 성공
			request.getSession().setAttribute("alertMsg", "성공적으로 투표가 삭제 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.vo?cpage=1");
		}else {
			request.getSession().setAttribute("alertMsg", "투표 삭제 실패!");
			response.sendRedirect(request.getContextPath() + "/detail.vo?vno="+vNo);
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
