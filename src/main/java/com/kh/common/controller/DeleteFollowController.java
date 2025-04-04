package com.kh.common.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.board.model.service.BoardService;
import com.kh.common.model.vo.Follow;

/**
 * Servlet implementation class DeleteFollowController
 */
@WebServlet("/deleteFollow")
public class DeleteFollowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFollowController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("첫부분");
		int followerId = Integer.parseInt(request.getParameter("followerId"));
        int followingId = Integer.parseInt(request.getParameter("followingId"));
        
        Follow f = new Follow(followerId, followingId);
        
        int result = new BoardService().deleteFollow(f);
        // JSON 형태로 count 값을 클라이언트에 반환
        response.setContentType("application/json; charset=utf-8");
        new Gson().toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
