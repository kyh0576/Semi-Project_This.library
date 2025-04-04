package com.kh.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.book.model.service.BookService;
import com.kh.book.model.vo.BookAnswer;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AjaxBookReplyInsertController
 */
@WebServlet("/rinsert.bd")
public class AjaxBookReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxBookReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String replyContent = request.getParameter("content");
		String isbn = request.getParameter("isbn");
		int starValue = Integer.parseInt(request.getParameter("starValue"));
		int userNo = ((Member)request.getSession().getAttribute("loginMember")).getMemNo();

		BookAnswer ba = new BookAnswer();
		ba.setAnswerContent(replyContent);
		ba.setIsbnNo(isbn);
		ba.setMemNo(userNo);
		ba.setStar(starValue);
		
		int result = new BookService().insertReply(ba);
		
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
