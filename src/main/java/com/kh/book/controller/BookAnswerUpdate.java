package com.kh.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.book.model.service.BookService;

/**
 * Servlet implementation class BookAnswerUpdate
 */
@WebServlet("/rUpdate.bd")
public class BookAnswerUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookAnswerUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String isbn = request.getParameter("isbn");
		int rno = Integer.parseInt(request.getParameter("rno"));
		String rcontent = request.getParameter("rcontent");
		
		int result = new BookService().updateBookAnswer(rno, rcontent);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/views/book/bookDetail.jsp?isbn="+isbn);
		}else {
			request.setAttribute("alertMsg", "댓글수정실패");
			
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
