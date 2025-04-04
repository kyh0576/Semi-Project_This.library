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
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class FollowController
 */
@WebServlet("/follow")
public class InsertFollowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFollowController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 int followerId = Integer.parseInt(request.getParameter("followerId"));
        int followingId = Integer.parseInt(request.getParameter("followingId"));

        Follow f = new Follow(followerId, followingId);

        // 이미 팔로우 했는지 확인하는 메소드
        ArrayList<Follow> flist = new BoardService().selectFollow();
        int count = 0;
        int result2 = 0;
        for (Follow follow : flist) {
            // 팔로우 중복 여부 확인
            if (follow.getFollowerId() == followerId && follow.getFollowingId() == followingId) {
                count++;
            }
        }

        System.out.println("중복 팔로우 여부: " + count);

        if (count == 0) { // 팔로우하지 않은 경우
            int result = new BoardService().insertFollow(f);
            if (result > 0) {
                result2 = 1; // 팔로우 성공 시 count를 1로 설정
            }
        }
        System.out.println("result2 : " + count);

        // JSON 형태로 count 값을 클라이언트에 반환
        response.setContentType("application/json; charset=utf-8");
        new Gson().toJson(result2, response.getWriter());
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
