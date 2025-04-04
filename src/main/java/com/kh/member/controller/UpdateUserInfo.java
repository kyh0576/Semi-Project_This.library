package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class UpdateUserInfo
 */
@WebServlet("/update.me")
public class UpdateUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		
		String newUserPwd = request.getParameter("userPwd");
	    String userNick = request.getParameter("userNick");
	    String newEmail = request.getParameter("userEmail");
	    String newPhone = request.getParameter("userPhone");
	    int memNo = Integer.parseInt(request.getParameter("memNo"));


	    Member byeMember = new Member( memNo,newUserPwd, userNick, newEmail, newPhone);

		int result = new MemberService().updateUserInfo(byeMember);

	    
	    if (result > 0) { // 변경 성공
            request.getSession().setAttribute("alertMsg", "사용자 정보 변경이 완료되었습니다.");
            response.sendRedirect(request.getContextPath() + "/views/member/myPage.jsp");
        } else { // 실패
            request.setAttribute("errorMsg", "사용자 정보 변경 실패");
            request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
