package com.kh.vote.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.vote.model.service.VoteService;
import com.kh.vote.model.vo.VoteAnswer;

/**
 * Servlet implementation class AjaxVoteReplyInsertController
 */
@WebServlet("/rinsert.vo")
public class AjaxVoteReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxVoteReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String replyContent = request.getParameter("content");
		int voteNo = Integer.parseInt(request.getParameter("vno"));
		
		int userNo = ((Member)request.getSession().getAttribute("loginMember")).getMemNo();

		VoteAnswer va = new VoteAnswer();
		va.setvAnswer(replyContent);
		va.setVoteNo(voteNo);
		va.setMemNo(userNo);
		
		int result = new VoteService().insertReply(va);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
