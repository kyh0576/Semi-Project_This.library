package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class DeleteMemberController
 */
@WebServlet("/delete.me")
public class DeleteMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("no"));

		int result = new MemberService().deleteMember(memNo);
		
		if (result > 0) {
		    request.getSession().invalidate();
		    request.getSession().setAttribute("alertMsg", "정상적으로 탈퇴가 완료되었습니다. 그동안 수고 많으셨습니다.");
		    response.sendRedirect(request.getContextPath() + "/views/common/mainPage.jsp");
			}else {
			// 실패 시 → 마이페이지로 다시 이동
			request.setAttribute("alertMsg", "회원 탈퇴에 실패했습니다. 다시 시도해주세요.");
			request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
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
