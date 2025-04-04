package com.kh.common.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.board.model.service.BoardService;
import com.kh.common.model.vo.Follow;

/**
 * Servlet implementation class BoardSelectFollowController
 */
@WebServlet("/follow/status")
public class SelectFollowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFollowController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int followerId = Integer.parseInt(request.getParameter("followerId"));
        int followingId = Integer.parseInt(request.getParameter("followingId"));

        // 이미 팔로우 했는지 확인하는 메소드
        ArrayList<Follow> flist = new BoardService().selectFollow();
        int count = 0;

        for (Follow follow : flist) {
            if (follow.getFollowerId() == followerId && follow.getFollowingId() == followingId) {
                count = 1; // 이미 팔로우 중인 경우
                break;
            }
        }

        // JSON 형태로 반환
        response.setContentType("application/json; charset=utf-8");
        new Gson().toJson(count, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
