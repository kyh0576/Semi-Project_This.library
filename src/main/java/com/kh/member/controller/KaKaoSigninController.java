package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class KaKaoSigninController
 */
@WebServlet("/kakaoSignin.me")
public class KaKaoSigninController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KaKaoSigninController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String kakaoNickName = request.getParameter("nickName");
		String kakaoEmail = request.getParameter("email");
		String kakaoKey = request.getParameter("key");

		request.setAttribute("kakaoNickName", kakaoNickName);
		request.setAttribute("kakaoEmail", kakaoEmail);
		request.setAttribute("kakaoKey",kakaoKey);
		
		Member loginMember = new MemberService().selectSnsKey(kakaoKey);
		
		if(loginMember == null) { // 카카오 로그인으로 회원가입 해본적 없는 사람 => 회원가입 폼으로 이동
			request.getRequestDispatcher("views/member/kakaoSignin.jsp").forward(request, response);
		}else {  // 카카오 로그인으로 한번이라도 회원가입 해본적 있는 사람 => 로그인 성공
			request.getSession().setAttribute("loginMember", loginMember);
			response.sendRedirect(request.getContextPath());
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
