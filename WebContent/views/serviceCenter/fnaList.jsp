<%@page import="com.kh.fna.controller.AjaxSelectController" %>
  <%@page import="com.kh.fna.model.vo.Fna" %>
    <%@page import="java.util.ArrayList" %>
      <%@page import="com.kh.serviceCenter.model.vo.serviceCenter" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
          <% ArrayList<Fna> list = (ArrayList<Fna>)request.getAttribute("list");

              Fna fna = (Fna)request.getAttribute("fna");
              %>
              <!DOCTYPE html>
              <html lang="en">

              <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document1</title>
                <link rel="stylesheet"
                  href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=keyboard_double_arrow_down" />

                <style>
                  /* 전체 레이아웃 */
                  .wrap2 {
                    width: 100%;
                    display: flex;
                  }

                  #left {
                    width: 100%;
                    background-color: #f9f9f9;
                    display: flex;
                    justify-content: center;
                    position: relative;
                  }

                  #leftBox {
                    width: 100%;
                    border-radius: 2em;
                    margin: 10%;
                    padding: 20px;
                    background: white;
                    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
                    text-align: center;
                    position: relative;
                    overflow: hidden;
                  }

                  #title {
                    font-size: 35px;
                    font-weight: bold;
                  }

                  /* 질문 박스 */
                  .questionBox1 {
                    font-size: larger;
                    padding: 10px;
                    box-sizing: border-box;
                    font-weight: 800;
                    display: flex;
                    position: relative;
                    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
                    background-color: lightgrey;
                  }

                  .questionBox1>a {
                    text-decoration: none;
                    color: black;
                    display: block;
                    width: 100%;
                    height: 100%;
                    line-height: 50px;
                    text-align: left;
                    position: relative;
                    overflow: hidden;
                    border-radius: 5px;
                    font-size: 16px;
                    font-weight: bold;
                    z-index: 1;
                    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
                  }

                  /* 배경 그라데이션 효과 */
                  .questionBox1>a::before {
                    content: "";
                    position: absolute;
                    top: 0;
                    left: -100%;
                    width: 200%;
                    height: 100%;
                    background-image: linear-gradient(to right, #f1d6b8, #c49a6c);
                    transition: transform 0.4s ease;
                    z-index: -2;
                  }

                  .questionBox1>a:hover::before {
                    transform: translateX(50%);
                  }

                  /* 토글 버튼 스타일 */
                  .material-symbols-outlined {
                    font-variation-settings:
                      'FILL' 0,
                      'wght' 400,
                      'GRAD' 0,
                      'opsz' 24;
                    line-height: 50px;
                    font-size: 30px;
                    width: 5%;
                    background-color: #c49a6c;
                    color: white;
                    border: none;
                  }

                  .material-symbols-outlined:hover {
                    cursor: pointer;
                  }

                  /* 답변 영역 및 버튼 컨테이너 (초기 숨김) */
                  .reply-box,
									.btnContainer {
									  max-height: 0;
									  overflow: hidden;
									  transition: max-height 0.4s ease, opacity 0.4s ease;
									   white-space: pre-wrap;
									}

									.readonly-box {
									  white-space: pre-wrap;
									  line-height: 1.5em;
									  font-size: 14px;
									  color: #333;
									}

                  .reply-box {
							  width: 96%;
							  padding: 15px;
							  border: 1px solid #ccc;
							  border-radius: 10px;
							  margin-top: 10px;
							  background-color: #f9f9f9;
							  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
							  text-align: left;
							
							  overflow: hidden;              /* ← 유지 */
							  transition: max-height 0.4s ease, opacity 0.4s ease;  /* ← 유지 */
							  max-height: 0;                 /* ← 초기값 */
							  opacity: 0;
							}


                  .reply-box textarea {
                    width: 100%;
                    padding: 20px;
                    border-radius: 5px;
                    border: 1px solid #bbb;
                    resize: none;
                    font-size: 14px;
                    box-sizing: border-box;
                    min-height: 100px;
                    line-height: 1.5em;
                  }

                  /* 버튼 컨테이너 스타일 */
                  .btnContainer {
                    display: flex;
                    justify-content: flex-end;
                    gap: 10px;
                    margin-top: 10px;
                    margin-bottom: 10px;
                  }

                  .adminEnrollBtn,
                  .adminDeleteBtn {
                    padding: 8px 15px;
                    border: none;
                    border-radius: 5px;
                    font-size: 14px;
                    font-weight: bold;
                    cursor: pointer;
                    transition: all 0.3s ease;
                  }

                  .adminEnrollBtn {
                    background-color: #5a9;
                    color: white;
                  }

                  .adminEnrollBtn:hover {
                    background-color: #487;
                  }

                  .adminDeleteBtn {
                    background-color: #d9534f;
                    color: white;
                  }

                  .adminDeleteBtn:hover {
                    background-color: #c9302c;
                  }

                  .adminReply {
								  overflow: hidden;
								  resize: none;
								  min-height: 100px;
								  line-height: 1.5em;
								}
								.question-text {
									  white-space: pre-wrap;
									  line-height: 1.6;
									  font-size: 14px;
									  color: #333;
									}
								
                </style>
              </head>

              <body>

                <%@ include file="../common/menubar.jsp" %>

                  <div class="wrap2">
                    <div id="left">
                      <div id="leftBox">
                        <div id="leftBox1">
                          <p align="center" id="title">질문들을 정리해 봤어요!</p>
                        </div>


                        <% for(int i=1; i<6; i++) { %>
                          <div class="questionBox1">
                            <a href="#"> 질문내용 <%= i %></a>
                            <button type="button" class="material-symbols-outlined"
                              data-bno="<%= i %>">keyboard_double_arrow_down</button>
                          </div>

                          <div class="fnqReply reply-box" id="please">
                            <div class="question-text"></div> <!-- 문의내용 표시 -->
                            <br>
                            <textarea class="adminReply" data-bno="<%= i %>"></textarea> <!-- 관리자 입력용 -->
                          </div>



                          <div class="btnContainer">
                            <button type="button" class="adminEnrollBtn" data-bno="<%= i %>">입력하기</button>
                            <button type="button" class="adminDeleteBtn" data-bno="<%= i %>">삭제하기</button>
                          </div>
                          <% } %>


                            <br><br>
                      </div>
                    </div>
                  </div>

                  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                  <script>
                  document.addEventListener("DOMContentLoaded", function () {

                	  // ✅ 모든 답변 영역을 초기에는 숨김 상태로 설정
                	  document.querySelectorAll('.reply-box').forEach(box => {
                	    box.classList.remove('active');
                	    box.style.maxHeight = '0px';
                	    box.style.opacity = 0;
                	  });

                	  document.querySelectorAll('.btnContainer').forEach(btn => {
                	    btn.classList.remove('active');
                	    btn.style.maxHeight = '0px';
                	    btn.style.opacity = 0;
                	  });

                	  

                	  // 🔽 아래는 기존 코드 유지
                	  const toggles = document.querySelectorAll(".material-symbols-outlined");
                	  toggles.forEach(toggle => {
                	    toggle.addEventListener("click", function () {
                	      const questionBox = this.closest(".questionBox1");
                	      const replyBox = questionBox?.nextElementSibling;
                	      const btnContainer = replyBox?.nextElementSibling;
                	      if (replyBox && btnContainer) {
                	    	  const isActive = replyBox.classList.contains("active");

                	    	  if (isActive) {
                	    	    // 닫기
                	    	    replyBox.classList.remove("active");
                	    	    btnContainer.classList.remove("active");

                	    	    replyBox.style.maxHeight = "0px";
                	    	    replyBox.style.opacity = 0;
                	    	    btnContainer.style.maxHeight = "0px";
                	    	    btnContainer.style.opacity = 0;
                	    	  } else {
                	    		 replyBox.classList.add("active");
                	    		  btnContainer.classList.add("active");

                	    		  // textarea 안의 높이 재계산 먼저 실행
                	    		  const textarea = replyBox.querySelector('.adminReply');
                	    		  if (textarea) {
                	    		    textarea.style.height = 'auto'; // 초기화
                	    		    textarea.style.height = textarea.scrollHeight + 'px'; // 텍스트 크기 반영
                	    		  }

                	    		  // ✅ reply-box 높이도 다시 계산해서 적용
                	    		  setTimeout(() => {
                	    		    const replyHeight = replyBox.scrollHeight;
                	    		    replyBox.style.maxHeight = replyHeight + 'px';
                	    		    replyBox.style.opacity = 1;

                	    		    btnContainer.style.maxHeight = "50px";
                	    		    btnContainer.style.opacity = 1;
                	    		  }, 0);
                	    		}
                	    	}

                	    });
                	  });

                	  // 로그인 ID 체크
                	  const memId = "<%= (loginMember != null) ? loginMember.getMemId() : "" %>";
                	  const enrollBtns = document.querySelectorAll(".adminEnrollBtn");
                	  const deleteBtns = document.querySelectorAll(".adminDeleteBtn");
                	  const replyTextareas = document.querySelectorAll(".adminReply");

                	  if (memId.toLowerCase() === "admin") {
                	    enrollBtns.forEach(btn => btn.style.display = "block");
                	    deleteBtns.forEach(btn => btn.style.display = "block");
                	    replyTextareas.forEach(textarea => textarea.readOnly = false);
                	  } else {
                	    enrollBtns.forEach(btn => btn.style.display = "none");
                	    deleteBtns.forEach(btn => btn.style.display = "none");
                	    replyTextareas.forEach(textarea => textarea.readOnly = true);
                	  }
                	});

                    // 토글 버튼 클릭 시
						                   $(document).on("click", ".material-symbols-outlined", function () {
						  const toggleBtn = $(this); // 현재 클릭된 버튼 기억
						  const bno = toggleBtn.data("bno");
						
						  fnaContent(bno, toggleBtn); // 클릭된 요소 함께 전달
						});

                    //===================================================================================================		
                    //전체 F&Q 조회
                    function fnaContent(bno) {
                      const memId = "<%= (loginMember != null) ? loginMember.getMemId() : "" %>";
                      var url = "<%= request.getContextPath() %>/fnaSelect.fa";

                      $.ajax({
                        url: url,
                        method: "GET",
                        data: { bno: bno },
                        success: function (response) {
                          // admin 여부 확인
                          if (memId === 'admin') {
                        		  $('.reply-box').each(function (index) {
                        		    if (index < response.length) {
                        		      const textarea = $(this).find('.adminReply')[0]; // 순수 DOM
                        		      textarea.value = response[index].answer;

                        		      // 높이 자동 조절 (핵심!)
                        		      textarea.style.height = 'auto'; // 초기화
                        		      textarea.style.height = textarea.scrollHeight + 'px';
                        		   // textarea에 답변 내용 채우기
                                      $(this).find('.adminReply').val(response[index].answer);
                                      // 문의내용이 필요하다면 별도 표시
                                      $(this).find('.question-text').html("문의내용 : " + response[index].content);
                        		    }
                        		  });
                        		
                          } else {
                        	  $('.reply-box').each(function (index) {
                        		    if (index < response.length) {
                        		    	let content =
                        		    		 " <div style=white-space: pre-wrap;>문의내용 : " + response[index].content + "<br><br><br><br><br>" + "답변내용 : " + response[index].answer + "</div>" ;
																	$(this).html(content);

                        		      // ✅ reply-box 높이 자동 조절
                        		      const replyBox = this;
                        		      setTimeout(() => {
                        		        replyBox.style.maxHeight = replyBox.scrollHeight + 'px';
                        		        replyBox.style.opacity = 1;
                        		      }, 0);
                        		    }
                        		  });
                        		}
                        },
                        error: function (xhr, status, error) {
                          alert("Ajax 요청 실패! 콘솔을 확인하세요.");
                          console.error("에러 정보:", error);
                        }
                      }
                      );
                    }



                    //======================================================================================================
                    // 입력하기 버튼 클릭 시
                    $(document).on("click", ".adminEnrollBtn", function () {
                      const bno = $(this).data("bno");
                      const answer = $(this).closest(".btnContainer").prev().find(".adminReply").val();

                      $.ajax({
                        url: "<%= request.getContextPath() %>/update.fna",
                        type: "POST",
                        data: { bno: bno, answer: answer },
                        success: function (res) {
                          alert("수정 완료!");
                        },
                        error: function () {
                          alert("수정 실패!");
                        }
                      });
                    });
                    function fnaUpdate(bno) {
                      $.ajax({
                        url: "<%= request.getContextPath() %>/update.fna",
                        data: {
                          content: $(".adminReply").val(),
                          bno: bno,
                        },
                        type: "post",
                        //타입을 정의하지 않으면 get방식이 기본값으로 설정된다. 
                        success: function (result) {

                          if (result > 0) {  //result가 1이다? 댓글 작성 성공, 갱신된 댓글 리스트 조회를 다시. 
                            selectReplyList();
                            $("#replyContent").val(""); //text area 초기화. 
                          } else { //result 가 0이다? 댓글 작성 실패. 

                          }
                        }, error: function () {
                        }
                      })
                    }
                    //======================================================================================================
                    $(document).on("click", ".adminDeleteBtn", function () {
                      const bno = $(this).data("bno");
                      const content = $(this).closest(".btnContainer").prev().find(".adminReply").val();

                      $.ajax({
                        url: "<%= request.getContextPath() %>/delete.fna",
                        type: "POST",
                        data: { bno: bno },
                        success: function (res) {
                          alert("삭제 완료!");
                        },
                        error: function () {
                          alert("삭제 실패!");
                        }
                      });
                    });
                    function fnaDelete(bno) {
                      $.ajax({
                        url: "<%= request.getContextPath() %>/delete.fna",
                        data: {
                          bno: bno,
                        },
                        type: "post",
                        //타입을 정의하지 않으면 get방식이 기본값으로 설정된다. 
                        success: function (result) {

                          if (result > 0) {  //result가 1이다? 댓글 작성 성공, 갱신된 댓글 리스트 조회를 다시. 
                            selectReplyList();
                            $("#replyContent").val(""); //text area 초기화. 
                          } else { //result 가 0이다? 댓글 작성 실패. 

                          }
                        }, error: function () {
                        }
                      })
                    }
                    //======================================================================================================                      
$(document).on('input', '.adminReply', function () {
  this.style.height = 'auto';
  this.style.height = this.scrollHeight + 'px';
});

                  </script>

                  <%@ include file="../common/footerbar.jsp" %>
              </body>

              </html>