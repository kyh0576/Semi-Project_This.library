package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.CommantaryService;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Commantary;

/**
 * Servlet implementation class SaveCommantary
 */
@WebServlet("/Save.me")
public class SaveCommantary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveCommantary() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String memNoParam = request.getParameter("memNo");
			
		int memNo = Integer.parseInt(memNoParam);
		String author = request.getParameter("author");
	    String title = request.getParameter("title");
	    String content = request.getParameter("commantary");

	    Commantary c = new Commantary(memNo, author, title, content);
	    int result = new CommantaryService().insertCommantary(c);
	    
	    if (result > 0) {
	        request.setAttribute("errorMsg", "감상문 저장 성공했습니다.");

	    	response.sendRedirect(request.getContextPath() + "/views/member/myPage.jsp");
	    } else {
	        request.setAttribute("errorMsg", "감상문 저장 실패");
	        request.getRequestDispatcher("errorPage.jsp").forward(request, response);
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
