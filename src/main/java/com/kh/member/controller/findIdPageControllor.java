package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class findIdPageControllor
 */
@WebServlet("/findIdPage.me")
public class findIdPageControllor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findIdPageControllor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		String memberId = new MemberService().findIdPage(name, email);
		
		if (memberId.equals("")) { 
			request.getSession().setAttribute("alertMsg", "회원정보가 일치하지 않습니다.");
            response.sendRedirect(request.getContextPath() + "/views/member/findIdPage.jsp");
		} else { 
			 request.getSession().setAttribute("alertMsg", "당신의 아이디는 " + memberId + "입니다.");
	         response.sendRedirect(request.getContextPath() + "/views/member/loginform.jsp");
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
