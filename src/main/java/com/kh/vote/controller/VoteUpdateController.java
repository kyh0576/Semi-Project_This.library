package com.kh.vote.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.vote.model.service.VoteService;
import com.kh.vote.model.vo.Vote;

/**
 * Servlet implementation class VoteUpdateController
 */
@WebServlet("/update.vo")
public class VoteUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoteUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int vNo = Integer.parseInt(request.getParameter("vno"));
		String voteTitle = request.getParameter("title");
		String book1 = request.getParameter("book1");
		String book2 = request.getParameter("book2");
		String book1Url = request.getParameter("imageUrl1");
		String book2Url = request.getParameter("imageUrl2");
		String endDate = request.getParameter("deadline");
		
		Vote v = new Vote();
		v.setVoteNo(vNo);
		v.setVoteTitle(voteTitle);
		v.setBook1(book1);
		v.setBook2(book2);
		v.setBook1Url(book1Url);
		v.setBook2Url(book2Url);
		v.setVoteEndDate(endDate);
		
		
		int result = new VoteService().updateVote(v);
		
		if(result > 0) {
			// 성공 => 기존에 봤었던 사엣조회 페이지
			request.getSession().setAttribute("alertMsg", "성공적으로 투표가 수정 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.vo?vno=" + vNo);
			
		}else {
			// 실패 => 에러문구 담아서 에러페이지
			request.setAttribute("errorMsg", "투표 수정 실패!");
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
