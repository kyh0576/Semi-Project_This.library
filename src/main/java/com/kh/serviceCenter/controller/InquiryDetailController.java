package com.kh.serviceCenter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.serviceCenter.model.service.ServiceCenterService;
import com.kh.serviceCenter.model.vo.serviceCenter;

/**
 * Servlet implementation class InquiryDetailController
 */
@WebServlet("/detail.sc")
public class InquiryDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		    // 1️⃣ 사용자가 클릭한 게시글 번호 가져오기

			int scNO = Integer.parseInt(request.getParameter("bno").trim()); //  공백 제거!
		    
		    
		    
		    // 2️⃣ 게시글 상세 정보 조회
		    ServiceCenterService scService = new ServiceCenterService();
		    serviceCenter sc = scService.selectBoard(scNO);
		    Attachment at = scService.selectAttachment(scNO);

		    // 3️⃣ 조회된 데이터가 존재하면 JSP로 포워딩
		    if (sc != null) {
		        request.setAttribute("sc", sc);
		        request.setAttribute("at", at);
		        request.getRequestDispatcher("views/serviceCenter/persnalInquiryListDetail.jsp").forward(request, response);
		    } else {
		        request.setAttribute("errorMsg", "문의글을 조회할 수 없습니다.");
		        request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
