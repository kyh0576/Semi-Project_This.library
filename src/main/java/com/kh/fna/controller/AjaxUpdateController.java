package com.kh.fna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.BoardAnswer;
import com.kh.fna.model.service.FnaService;
import com.kh.fna.model.vo.Fna;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AjaxUpdateController
 */
@WebServlet("/update.fna")
public class AjaxUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String answer = request.getParameter("answer");
		int fnaNo = Integer.parseInt(request.getParameter("bno"));
		System.out.println("에잇 : "+fnaNo);
	    int result = new FnaService().updateFna(answer, fnaNo);
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
