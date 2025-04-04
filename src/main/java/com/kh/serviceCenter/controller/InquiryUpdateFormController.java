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
 * Servlet implementation class InquiryUpdateController
 */
@WebServlet("/updateForm.sc")
public class InquiryUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int scNo = Integer.parseInt(request.getParameter("bno"));
		ServiceCenterService service = new ServiceCenterService();
		serviceCenter sc = service.selectBoard(scNo);
		
		request.setAttribute("sc", sc);
		request.getRequestDispatcher("views/serviceCenter/persnalInquiryUpdateForm.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
