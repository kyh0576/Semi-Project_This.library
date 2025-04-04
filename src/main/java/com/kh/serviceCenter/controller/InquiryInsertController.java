package com.kh.serviceCenter.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.vo.Attachment;
import com.kh.common.MyFileRenamePolicy;
import com.kh.serviceCenter.model.service.ServiceCenterService;
import com.kh.serviceCenter.model.vo.serviceCenter;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class Inquiry
 */
@WebServlet("/Inquiry.in")
public class InquiryInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		if(ServletFileUpload.isMultipartContent(request)) {
			System.out.println("test");
		int maxSize = 10*1024*1024;  // 10메가바이트로 제한하겠다.

		String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");

		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

	
	    
	    
	    int memNo = Integer.parseInt( multiRequest.getParameter("memNo")); 
	    String name = multiRequest.getParameter("userName"); 
	    String email = multiRequest.getParameter("userEmail"); 
	    String phone = multiRequest.getParameter("phone"); 
	    String title = multiRequest.getParameter("title"); 
	    String content = multiRequest.getParameter("content"); 
	    
	    
	    
	    serviceCenter sc = new serviceCenter();
	    sc.setMemNo(memNo);
	    sc.setName(name);
	    sc.setEmail(email);
	    sc.setPhone(phone);
	    sc.setTitle(title);
	    sc.setContent(content);
	    
	    
	    
	    Attachment at = null; // 첨에는 null로 초기화, 넘어온 첨부파일이 있다면 생성
		// multiRequest.getOriginalFileName("키"); 넘어온 첨부파일이 있었을 경우 "원본명" | 없었을 경우 "null"
		if(multiRequest.getOriginalFileName("upfile") != null) { // 넘어온 첨부파일이 있을 경우
			at = new Attachment();
			at.setOriginName(multiRequest.getOriginalFileName("upfile"));
			at.setChangeName(multiRequest.getFilesystemName("upfile"));
			at.setFilePath("resources/board_upfiles/");
			
		} 
		
		
		
		
		System.out.println("service으로 보낼게");
		int result = new ServiceCenterService().insertInquiry(sc , at);
		
		
		
		System.out.println("나 service 에서 돌아왔어. : " + result);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "1:1 문의가 등록되었습니다.");
			response.sendRedirect(request.getContextPath()+ "/list.sc?cpage=1");
		}else {	
			request.setAttribute("errorMsg", "일반게시판 등록 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
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
