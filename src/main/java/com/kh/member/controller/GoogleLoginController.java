package com.kh.member.controller;

import java.io.IOException;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.gson.JsonObject; // ✅ gson 기반 JsonObject 사용

import com.kh.member.model.vo.Member;

@WebServlet("/googleLogin.me")
public class GoogleLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// ✅ 반드시 Google Console에서 발급받은 실제 Client ID로 설정
	private static final String CLIENT_ID = "92235338763-ljnuftbgbj6nn3ol95bno95j36v9hsci.apps.googleusercontent.com";

	public GoogleLoginController() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idTokenString = request.getParameter("id_token");
		JsonObject result = new JsonObject(); 

	

		try {
			GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(
					new NetHttpTransport(),
					JacksonFactory.getDefaultInstance())
					.setAudience(Collections.singletonList(CLIENT_ID))
					.build();

			GoogleIdToken idToken = verifier.verify(idTokenString);

			if (idToken != null) {
				Payload payload = idToken.getPayload();

				String email = payload.getEmail();
				String name = (String) payload.get("name");
				String googleUid   = payload.getSubject(); // 유니크 ID
				result.addProperty("status", "success");
				result.addProperty("redirect", request.getContextPath() + "/main.me?email="+email+"&name="+name+"&snskey="+googleUid);


			} else {
				result.addProperty("status", "fail");
				result.addProperty("message", "유효하지 않은 ID 토큰입니다.");
				System.out.println("[GoogleLogin] 실패 - 유효하지 않은 토큰");
			}

		} catch (Exception e) {
			e.printStackTrace();
			result.addProperty("status", "fail");
			result.addProperty("message", "서버 오류: " + e.getMessage());
			System.out.println("[GoogleLogin] 예외 발생: " + e.getMessage());
		}

		// ✅ 클라이언트에 JSON 응답
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().write(result.toString());
	}
}
