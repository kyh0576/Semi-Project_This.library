package com.kh.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class NaverSignInController
 */
@WebServlet("/naverLogin.me")
public class NaverSignInController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NaverSignInController() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String nickname = request.getParameter("nickName");
		String email = request.getParameter("email");
		String naverKey = request.getParameter("naverKey");
		String mobile = request.getParameter("mobile");
		

		// 유효성 검사
		if (naverKey == null || naverKey.trim().isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/views/member/loginform.jsp");
			return;
		}

		// 회원 여부 확인
		MemberService memberService = new MemberService();
		Member loginMember = memberService.naverSnsKey(naverKey);

		if (loginMember == null) {
			// 회원가입 유도
			request.setAttribute("nickname", nickname);
			request.setAttribute("email", email);
			request.setAttribute("naverKey", naverKey);
			request.setAttribute("mobile", mobile);
			request.getRequestDispatcher("views/member/NaverSignin.jsp").forward(request, response);
		} else {
			// 로그인 처리
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", loginMember);
			session.setAttribute("alertMsg", loginMember.getMemId() + "님, 환영합니다!");
			
			response.sendRedirect(request.getContextPath()+"/views/common/mainPage.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}

