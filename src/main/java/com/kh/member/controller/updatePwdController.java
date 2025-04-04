package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class updatePwd
 */
@WebServlet("/updatePwd.me")
public class updatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
	    String newPwd = request.getParameter("newPwd");
	    
	    int result = new MemberService().updatePwd(id, newPwd);
	    
	    if (result > 0) { // 변경 성공
            request.getSession().setAttribute("alertMsg", "비밀번호 변경이 완료되었습니다.");//이거 왜 안되냐
            response.sendRedirect(request.getContextPath() + "/views/member/loginform.jsp");
        } else { // 실패
        	request.getSession().setAttribute("alertMsg", "비밀번호 변경이 실패 다시 시도해주세요.");
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
