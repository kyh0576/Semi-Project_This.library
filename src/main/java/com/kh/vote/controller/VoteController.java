package com.kh.vote.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.vote.model.service.VoteService;
import com.kh.vote.model.vo.Vote;

/**
 * Servlet implementation class AjaxVoteController
 */
@WebServlet("/vote.vo")
public class VoteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int vNo = Integer.parseInt(request.getParameter("vNo"));
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		
		int result = new VoteService().vote(vNo, bNum);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "투표 성공");
			response.sendRedirect(request.getContextPath()+"/detail.vo?vno="+vNo);
		}else {
			request.getSession().setAttribute("alertMsg", "투표 실패");
			response.sendRedirect(request.getContextPath()+"/detail.vo?vno="+vNo);
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
