package com.kh.serviceCenter.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.PageInfo;
import com.kh.serviceCenter.model.service.ServiceCenterService;
import com.kh.serviceCenter.model.vo.serviceCenter;

/**
 * Servlet implementation class InquiryListController
 */
@WebServlet("/list.sc")
public class InquiryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// --------------- 페이징 처리 -----------------
				int listCount; 		// 현재 총 게시글 개수
				int currentPage; 	// 현재 페이지 (즉, 사용자가 요청한 페이지)
				int pageLimit; 		// 페이지 하단에 보여질 페이징바의 최대 개수
				int boardLimit;		// 한 페이지내에 보여질 게시글 최대 개수(몇개 단위씩)
				// 위의 4개를 가지고 아래 3개의 값을 구해낼꺼임
				int maxPage;		// 가장 마지막 페이지 (총 페이지 수)
				int startPage;		// 페이징바의 시작수
				int endPage;		// 페이징바의 끝수
				
				

				listCount = new ServiceCenterService().selectListCount();
				currentPage = Integer.parseInt(request.getParameter("cpage"));
				
				String cpageStr = request.getParameter("cpage");
				if (cpageStr == null) {
				    currentPage = 1;
				} else {
				    currentPage = Integer.parseInt(cpageStr);
				}
				
				
				
				pageLimit = 10;
				boardLimit = 10;
				
				
				maxPage = (int)Math.ceil((double)listCount / boardLimit);
				startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
				endPage = startPage + pageLimit - 1;

				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
				ArrayList<serviceCenter> list = new ServiceCenterService().selectList(pi);
		 		
				
				
				
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
				request.getRequestDispatcher("views/serviceCenter/persnalInquiryList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
