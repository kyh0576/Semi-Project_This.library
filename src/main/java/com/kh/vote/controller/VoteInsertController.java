package com.kh.vote.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.vote.model.service.VoteService;
import com.kh.vote.model.vo.Vote;

/**
 * Servlet implementation class VoteInsertController
 */
@WebServlet("/insert.vo")
public class VoteInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoteInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String voteTitle = request.getParameter("title");
		String book1 = request.getParameter("book1");
		String book2 = request.getParameter("book2");
		String book1Url = request.getParameter("imageUrl1");
		String book2Url = request.getParameter("imageUrl2");
		String endDate = request.getParameter("deadline");
		
		Vote v = new Vote(userNo, voteTitle, book1, book2, book1Url, book2Url, endDate);
		
		// 4. 서비스 요청 (요청처리)
		int result = new VoteService().insertVote(v);
		
		// 5. 응답뷰 지정
		// 성공 => /this/list.vo?cpage=1 url 재요청 => 목록페이지 
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "투표 등록 성공!");
			response.sendRedirect(request.getContextPath()+ "/list.vo?cpage=1");
		}else {
			
			request.getSession().setAttribute("alertMsg", "책을 골라주세요");
			response.sendRedirect(request.getContextPath()+ "/views/vote/voteInsertForm.jsp");
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
