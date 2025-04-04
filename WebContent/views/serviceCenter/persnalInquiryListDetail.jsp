<%@page import="com.kh.serviceCenter.model.vo.serviceCenter" %>
  <%@page import="com.kh.board.model.vo.Attachment" %>
    <%@page import="com.kh.board.model.vo.Board" %>
      <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <% // 글번호, 닉네임, 제목, 내용, 조회수, 작성일 serviceCenter sc=(serviceCenter)request.getAttribute("sc"); // 첨부파일이 없다면 null
          // 첨부파일이 있다면 파일번호, 원본명, 수정명, 저장경로 Attachment at=(Attachment)request.getAttribute("at"); %>
<% 
		// 글번호, 닉네임, 제목, 내용, 조회수, 작성일
	serviceCenter sc = (serviceCenter)request.getAttribute("sc");
		
	  Attachment at = (Attachment)request.getAttribute("at");
	  //at에 뭐가있을까? 
	  // 첨부 有 : 파일번호, 원본명, 수정명, 저장경로 
	  // 첨부 無 : null
%>

          <!DOCTYPE html>
          <html lang="en">

          <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document1</title>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <style>
              .post-container {
                width: 70%;
                margin: 30px auto;
                padding: 20px;
                background: white;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
              }

              .post-header {
                border-bottom: 1px solid #ddd;
                padding-bottom: 10px;
                margin-bottom: 10px;
              }

              .post-header h2 {
                display: inline-block;
                margin: 0;
              }

              .label {
                background: #ff7f50;
                color: white;
                font-size: 12px;
                padding: 3px 6px;
                border-radius: 4px;
                margin-left: 5px;
              }

              .label:hover {
                opacity: 0.7;
              }

              .post-meta {
                font-size: 14px;
                color: #777;
              }



              .post-content {
                font-size: 16px;
                line-height: 1.6;
                margin-bottom: 20px;
              }

              .comment-section {
                border-top: 2px solid #ddd;
                padding-top: 20px;
              }

              /* 댓글 개수 스타일 */
              .comment-count {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 10px;
              }

              /* 댓글 입력 영역 */
              .comment-form {
                background: #f9f9f9;
                padding: 15px;
                border-radius: 8px;
                border: 1px solid #ddd;
                display: flex;
                flex-direction: column;
                gap: 10px;
                position: relative;
              }


              /* 댓글 작성하기 제목 + 버튼 */
              .comment-form-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
              }


              .comment-form-header h4 {
                margin: 0;
                font-size: 16px;
                font-weight: bold;
              }

              /* 텍스트 입력 창 */
              .comment-form textarea {
                width: 100%;
                height: 80px;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                resize: none;
                font-size: 14px;
              }

              /* 글자 수 카운트 (0 / 300 자) */
              .char-count {
                font-size: 12px;
                color: #777;
                text-align: right;
                padding-right: 5px;
              }

              .submit-btn {
                padding: 6px 12px;
                background-color: #ff7f50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 14px;
              }

              .submit-btn:hover {
                opacity: 0.7;
              }

              .comment {
                border-bottom: 1px solid #eee;
                padding: 10px 0;
              }

              .comment p {
                margin: 5px 0;
              }

              .comment-meta {
                font-size: 15px;
                padding-bottom: 5px;
              }

              .comment-text {
                line-height: 1.2;
              }

              .pagination {
                text-align: center;
                margin-top: 15px;
              }


              .set-comment button,
              .set-header button {
                border: 0;
                background-color: transparent;

              }

              .set-comment button:hover,
              .set-header button:hover {
                cursor: pointer;
              }
            </style>
          </head>

          <body>


            <%@ include file="../common/menubar.jsp" %>
				<% 	String loginMemName = (loginMember != null) ? loginMember.getMemName() : null; %>
              <div class="post-container" style="margin-top: 120px;margin-bottom: 120px;">
                <div class="post-header">
                  <h2>
                    <%=sc.getTitle() %><span class="label">팔로우</span>
                  </h2>
                  
						<% if(loginMember != null && loginMemName.equals(sc.getName())){ %>
						
                    <span class="set-header">
                      <button
                        onclick="location.href='<%= contextPath %>/updateForm.sc?bno=<%= sc.getInquiryNo() %>'">수정</button> |
                      <button
                        onclick="location.href='<%= contextPath %>/delete.sc?bno=<%= sc.getInquiryNo() %>'">삭제</button>
                    </span>
                    <%} %>
                      <p class="post-meta">
                        작성자: <%=sc.getName()%> | <%=sc.getInquiryDate()%>
                      </p>
                </div>

                <div class="post-content">
                  <p>
                    <%=sc.getContent()%>
                  </p>
                </div>

                <div class="comment-section">
                  <%if(at !=null){ %>
                    첨부파일 : <a download="<%= at.getOriginName() %>" href="<%= contextPath %>/<%= at.getFilePath() + at.getChangeName()%>"><%= at.getOriginName() %></a> <!-- attachment 테이블에 origin 컬럼에 있음 -->
					<%} else{ %>
                      첨부파일 없음
                      <%} %>
                        <h3 class="comment-count"></h3>
								<div style="border-bottom: 2px solid #eee"></div>
						
										<% if(loginMember == null){ %>
						
										<% }else{ %>
                        <div class="comment-form">
                          <div class="comment-form-header">
                            <h4>댓글 작성하기</h4>
                            <button class="submit-btn" onclick="insertReply()">작성하기</button>
                          </div>
                          <textarea id="replyContent" placeholder="댓글을 입력하세요..."
                          maxlength="300" style="width: 100%; box-sizing: border-box;"></textarea>
                          <div class="char-count">0 / 300 자</div>
                        </div>
                        	<% } %>

                        <div class="comment-list">

                        </div>
                </div>

					
				


                <script>
                  $(function () {// 화면이 다 로드되고 나서 하는 행위
                    // 댓글 개수 조회
                    selectBoardAnswerCount();

                    // 댓글조회
                    selectReplyList();

                    // setInterval(주기적으로 실행할 함수, ms단위 시간);
                    setInterval(selectReplyList, 1000); // 1초에 한번씩 새로고침
                    setInterval(selectBoardAnswerCount, 1000);
                  })

                  // ajax으로 댓글 작성용 함수
                  function insertReply() {
                    $.ajax({
                      url: "rinsert.bo",
                      data: {
                        content: $("#replyContent").val(),
                        bno:<%= sc.getInquiryNo() %>,
                      },
                      type: "post",
                      success: function (result) {
                        if (result > 0) { // 댓글 작성 성공 => 갱신된 댓글 리스트 조회
                          selectReplyList();
                          $("#replyContent").val("");
                        } else { // 댓글 작성 실패

                        }
                      }, error: function () {
                      }
                    })
                  }

                  // ajax으로 해당 게시글에 딸린 댓글 목록 조회용 함수
                  function selectReplyList() {
                    $.ajax({
                      url: "rlist.bo",
                      data: { bno:<%= sc.getInquiryNo() %>},
                      success: function (rlist) {
                        let value = ""
                        for (let i = 0; i < rlist.length; i++) {
                          let r = rlist[i].bAnswerNo; // 댓글 번호
                          let writer = rlist[i].memNo; // 댓글 작성자
                          value += "<div class='comment'>"
                            + "<p class='comment-meta'><strong>" + rlist[i].memNo + "</strong> | " + rlist[i].answerDate + "<span class='label'> 팔로우 </span>"
                            + "<span class='set-comment'>";

                          if ("<%=loginMember.getNickname()%>" == writer) {
                            value += "<button style='margin-left:0px'> 수정 </button> | "
                              + "<button onclick='hideReply(" + r + ")'> 삭제 </button>";
                          }

                          value += "</span></p>"
                            + "<p class='comment-text'>"
                            + rlist[i].answerContent
                            + "</p>"
                            + "</div>";

                          $(".comment-list").html(value)
                        }
                      }, error: function () {
                      }
                    })
                  }

                  // 삭제 버튼 클릭 시 실행될 함수
                  function hideReply(rno) {
                    $.ajax({
                      url: "<%=contextPath%>/rDelete.bo", // 서블릿 URL
                      type: "POST", // UPDATE는 보통 POST 방식 사용
                      data: {
                        rno: rno,
                        bno: <%= sc.getInquiryNo() %>
								        }, // 댓글 번호 전송
                      success: function (response) {
                        alert("댓글이 성공적으로 삭제되었습니다.");
                      }, error: function () {
                        alert("댓글 삭제에 실패했습니다.");
                      }
                    });
                  }

                  function selectBoardAnswerCount() {
                    $.ajax({
                      url: "rCount.bo",
                      data: { bno:<%=sc.getInquiryNo() %>},
                      success: function (rCount) {
                        $(".comment-count").text("댓글 " + rCount);
                      }, error: function () {
                      }
                    })
                  }
                </script>
              </div>
              <%@ include file="../common/footerbar.jsp" %>
          </body>

          </html>