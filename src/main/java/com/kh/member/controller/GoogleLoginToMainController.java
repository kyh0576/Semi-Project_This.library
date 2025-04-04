package com.kh.member.controller;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/main.me")
public class GoogleLoginToMainController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	String email = request.getParameter("email");
       	String name = request.getParameter("name");
       	String snskey = request.getParameter("snskey");
        
       	Member m = new Member();
		m.setEmail(email);
		m.setMemName(name); // 필요시 Member 클래스 확인
		m.setSnsKey(snskey);
        
        // DB에 회원 존재 여부 확인
        Member dbMember = new MemberService().selectMemberByName(m);

        if (dbMember.getMemNo() != 0) {
        	
        	// 기존 회원 → mainPage.jsp 이동
        	request.getSession().setAttribute("loginMember", dbMember);
            request.getRequestDispatcher("views/common/mainPage.jsp").forward(request, response);
        } else {
        	
        	// 신규 회원 → googlesignin.jsp로 이동 (name, email 전달)
        	request.setAttribute("m", m);
            request.getRequestDispatcher("views/member/googleSignin.jsp").forward(request, response);    
        }
    }
}
