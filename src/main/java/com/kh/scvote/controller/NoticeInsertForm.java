package com.kh.scvote.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.scvote.model.service.scNoticeService;
import com.kh.scvote.model.vo.scNoticeVO;

/**
 * Servlet implementation class NoticeInsertForm
 */
@WebServlet("/insertform.nc")
public class NoticeInsertForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding("UTF-8");
		 
	        // 1. 폼에서 넘어온 데이터 받기
	        String title = request.getParameter("title");
	        String content = request.getParameter("content");

	        // 2. VO 객체 생성
	        scNoticeVO notice = new scNoticeVO(title, content);

	        // 3. 비즈니스 로직 호출
	        int result = new scNoticeService().insertNotice(notice);

	        // 4. 결과에 따라 응답 제어
	        if (result > 0) {
	            response.sendRedirect(request.getContextPath() + "/select.nc#content3");
	        } else {
	            request.setAttribute("msg", "공지사항 등록 실패");
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
