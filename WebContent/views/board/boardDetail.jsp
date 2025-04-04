<%@page import="com.kh.board.model.vo.Attachment"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
		
		// 글번호, 닉네임, 제목, 내용, 조회수, 작성일
		Board b = (Board)request.getAttribute("b");
		
		// 첨부파일이 없다면 null
		// 첨부파일이 있다면 파일번호, 원본명, 수정명, 저장경로
		Attachment at = (Attachment)request.getAttribute("at"); 
		
		
		
%>

		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Document1</title>
			<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
				
				.post-content{
					line-height: 1.2;
			    word-wrap: break-word; /* 긴 단어를 다음 줄로 넘겨서 줄 바꿈 */
			    overflow-wrap: break-word; /* 긴 단어를 넘어가지 않게 줄 바꿈 */
			    white-space: normal; /* 공백을 적절히 처리 */
			    word-break: break-all; /* 특수문자나 긴 단어가 줄을 넘지 않도록 */
				}

				.label {
					background: #ff7f50;
					color: white;
					font-size: 12px;
					padding: 3px 6px;
					border-radius: 4px;
					margin-left: 5px;
				}

				.label:hover{
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

				.submit-btn:hover{
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
			    word-wrap: break-word; /* 긴 단어를 다음 줄로 넘겨서 줄 바꿈 */
			    overflow-wrap: break-word; /* 긴 단어를 넘어가지 않게 줄 바꿈 */
			    white-space: normal; /* 공백을 적절히 처리 */
			    word-break: break-all; /* 특수문자나 긴 단어가 줄을 넘지 않도록 */
				}



				.set-comment button, .set-header button{
						border: 0;
						background-color: transparent;
						
				}

				.set-comment button:hover, .set-header button:hover{
						cursor: pointer;
						opacity: 0.7;
				}
				
				/* -------------------- 모달 ------------------------*/
				h2{
		   		 text-align: center;
				}
				.modal_btn {
				    display: block;
				    margin: 40px auto;
				    padding: 10px 20px;
				    background-color: royalblue;
				    border: none;
				    border-radius: 5px;
				    color: #fff;
				    cursor: pointer;
				    transition: box-shadow 0.2s;
				}
				.modal_btn:hover {
				    box-shadow: 3px 4px 11px 0px #00000040;
				}
				
				/*모달 팝업 영역 스타일링*/
				.modal {
				/*팝업 배경*/
					display: none; /*평소에는 보이지 않도록*/
				    position: absolute;
				    top:20%;
				    left: 0;
				    width: 100%;
				    height: 1200px;
				    overflow: hidden;
				    background: rgba(0,0,0,0.5);
				}
				.modal .modal_popup {
				/*팝업*/
				    position: absolute;
				    top: 45%;
				    left: 50%;
				    transform: translate(-50%, -50%);
				    padding: 20px;
				    background: #ffffff;
				    border-radius: 20px;
				}
				.modal .modal_popup .close_btn {
				    padding: 10px 20px;
				    background-color: rgb(116, 0, 0);
				    border: none;
				    border-radius: 5px;
				    color: #fff;
				    cursor: pointer;
				    transition: box-shadow 0.2s;
				}
				.modal.on {
   				  display: block;
				}		

			</style>
		</head>
		<body>
		
		 	
				<%@ include file="../common/menubar.jsp" %>

				<% String loginNickname = (loginMember != null) ? loginMember.getNickname() : null; %>
				<% Integer loginMemNo = (loginMember != null) ? loginMember.getMemNo() : null; %>
				
				<div class="post-container" style="margin-top: 120px;margin-bottom: 120px;">
					<div class="post-header">
						<h2 style="text-align:left;"><%=b.getBoardTitle() %>
					<%if(loginMember != null && b.getMemNo() != loginMemNo){%> 
						<span class="label btn btn-primary" id="follow-btn">
						팔로우
						</span>
					<%} %>
						</h2>
						<% if(loginMember != null && loginNickname.equals(b.getBoardWriter())){ %>
						<span class="set-header">
						<button onclick="location.href='<%= contextPath %>/updateForm.bo?bno=<%= b.getBoardNo() %>'">수정</button> | 
						<button onclick="location.href='<%= contextPath %>/delete.bo?bno=<%= b.getBoardNo() %>'">삭제</button>
						</span>
						<%} %>
						<p class="post-meta">
							작성자: <%=b.getBoardWriter() %> | <%=b.getWriteDate() %> | 조회수: <%=b.getCount() %>
						</p>
					</div>

					<div class="post-content">
						<p>
						<%=b.getBoardContent() %>
						</p>
					</div>

					<div class="comment-section">
					<%if(at != null){ %>
					첨부파일 : <a download="<%= at.getOriginName() %>" href="<%= contextPath %>/<%= at.getFilePath() + at.getChangeName()%>"><%= at.getOriginName() %></a> <!-- attachment 테이블에 origin 컬럼에 있음 -->
					<%} else{ %>
						첨부파일 없음
					<%} %>
						<h3 class="comment-count"></h3>
						<div style="border-bottom: 2px solid #eee"></div>
						
						<% if(loginMember == null){ %>
						
						<% }else{ %>
								<div class="comment-form" id="comment-form">
		
									<div class="comment-form-header">
										<h4>댓글 작성하기</h4>
										<button class="submit-btn" onclick="insertReply()">작성하기</button>
									</div>
									<textarea id="replyContent" placeholder="댓글을 입력하세요..." maxlength="300" style="width: 1000px;"></textarea>
									<div class="char-count">0 / 300 자</div>
								</div>
						<% } %>
						
						<div class="comment-list">
							
						</div>
					</div>
					
					<!--모달 팝업-->
					<div class="modal">
					    <div class="modal_popup">
					        <h3>댓글 수정하기</h3>
					        <form action="<%=contextPath%>/rUpdate.bo" method="GET">
					        <textarea id="update_content" maxlength="300" style="width:1000px; height: 100px;" required></textarea>
					        <button type="button" class="close_btn">닫기</button>
					        <button type="submit" class="close_btn">수정하기</button>
					        <div id="hidden_area"></div>
					        </form>
					    </div>
					</div>
					<!--end 모달 팝업-->

					<script>
								$(function(){// 화면이 다 로드되고 나서 하는 행위
									// 댓글 개수 조회
									selectBoardAnswerCount();
									
									// 댓글조회
									selectReplyList();
									
									// setInterval(주기적으로 실행할 함수, ms단위 시간);
									setInterval(selectReplyList, 1000); // 1초에 한번씩 새로고침
									setInterval(selectBoardAnswerCount, 1000); 
									
								})
								
								<!-- 실시간 팔로우 상태 -->
								const followerId = <%= loginMemNo %>; // 로그인한 사용자 ID
								const followingId = <%= b.getMemNo() %>; // 게시글 작성자 ID
								
								<%if(loginMember != null){ %>
								// 페이지 로드 시 팔로우 상태 확인
								$(document).ready(function () {
								    $.ajax({
								        url: 'follow/status', // 팔로우 상태를 확인하는 서버 API 경로
								        method: 'GET',
								        data: {
								            followerId: followerId,
								            followingId: followingId
								        },
								        success: function (response) {
								            console.log("팔로우 상태 확인 응답:", response);
								
								            if (response == 1) { // 이미 팔로우 중인 경우
								                $('#follow-btn').text("팔로잉").removeClass('btn-primary').addClass('btn-secondary');
								            } else if (response == 0) { // 팔로우 안 돼있는 경우
								                $('#follow-btn').text("팔로우").removeClass('btn-secondary').addClass('btn-primary');
								            }
								        },
								        error: function () {
								            alert('팔로우 상태를 확인하는 데 실패했습니다.');
								        }
								    });
								});
								<%}%>
								
								
								<!-- 실시간 팔로우 상태 여기까지 -->
								
								
								// ajax으로 댓글 작성용 함수
								function insertReply(){
									const content = replyContent.value.trim();
						            if (content.length === 0) {
						                alert('댓글을 입력하세요.');
						                return;
						            }else{
														$.ajax({
															url:"rinsert.bo",
															data:{
																content:$("#replyContent").val(),
																bno:<%= b.getBoardNo() %>,
															},
															type:"post",
															success:function(result){
																if(result > 0){ // 댓글 작성 성공 => 갱신된 댓글 리스트 조회
																	selectReplyList();
																	$("#replyContent").val("");
														            charCountDisplay.innerHTML = `0 / <span id="maxChars">\${maxChars}</span> 자`;
																}else{ // 댓글 작성 실패
																	
																}
															},error:function(){
																console.log("댓글 작성용 ajax 통신 실패")
															}
														})
						            }
								}
								
								// ajax으로 해당 게시글에 딸린 댓글 목록 조회용 함수
								function selectReplyList(){
									$.ajax({
										url:"rlist.bo",
										data:{bno:<%= b.getBoardNo() %>},
										success:function(rlist){
											let value = "";
											let loginNickname = "<%= loginNickname %>"; // JSP에서 가져온 로그인 닉네임 (null 가능)
											
											
											for(let i=0; i<rlist.length; i++){
												let r = rlist[i].bAnswerNo; // 댓글 번호
				                let writer = rlist[i].nickName; // 댓글 작성자 닉네임
				                let content = rlist[i].answerContent; // 댓글 내용
				                let writerNo = rlist[i].memNo;
				              
				                /*
				                // 나 진짜 개천재인듯 ㅋ
				                if(isNaN(content)){
				                	content = `'\${content}'` // content가 숫자일때만 값이 잘 넘겨져서 한글일때는 빽틱 이용해서 양쪽에 홑따음표 달아줌
				                }
				                */
				               
										value += `<div class="comment"><p class="comment-meta"><strong>\${writer}</strong> | \${rlist[i].answerDate}`;
										
												 value += `<span></span> <span class="set-comment">`;
											
											 if(loginNickname && loginNickname == writer){
													 value += `<button class="update" style="margin-left:0px" onclick="updateReply(\${r}); scrollToSection('comment-form', 200)"> 수정 </button> | <button onclick="hideReply(\${r})"> 삭제 </button>`;
											 }
											 
											 value += `</span></p><p class="comment-text">\${rlist[i].answerContent}</p></div>`;
										
										   $(".comment-list").html(value)
										}
										},error:function(){
											console.log("댓글목록 조회용 ajax 통신 실패");
										}
									})
								}
								
								
								 function scrollToSection(id, offset = 100) { 
									    let target = document.getElementById(id);
									    if (target) {
									        let targetPosition = target.getBoundingClientRect().top + window.scrollY; // 요소의 실제 위치 계산
									        window.scrollTo({ top: targetPosition - offset, behavior: "smooth" }); // 원하는 만큼 위로 조정
									    }
									}
								
								
								// 삭제 버튼 클릭 시 실행될 함수
								function hideReply(rno) {
								    $.ajax({
								        url: "<%=contextPath%>/rDelete.bo", // 서블릿 URL
								        type: "POST", // UPDATE는 보통 POST 방식 사용
								        data: { 
								        	rno: rno,
								        	bno: <%= b.getBoardNo() %>
								        }, // 댓글 번호, 게시글 번호 전송
								        success:function(response){
								        	alert("댓글이 성공적으로 삭제되었습니다.");
								        },error:function(){
								        	alert("댓글 삭제에 실패했습니다.");
								        }
								    });
								}
								
								function updateReply(rno){
									
									const modal = document.querySelector('.modal');
									const modalOpen = document.querySelector('.modal_btn');
									const modalClose = document.querySelector('.close_btn');
									
									//열기 버튼을 눌렀을 때 모달팝업이 열림
									$(".comment-list").on('click', '.update',function(){
											let rContent2 = $(this).closest('.comment').find('.comment-text').text();
											let value = `<input type="hidden" name="rno" value="\${rno}"></input>`
											$("#hidden_area").html(value);
											value = `<input type="hidden" name="bno" value="<%=b.getBoardNo()%>"></input>`
											$("#hidden_area").append(value);
											value = `<input type="hidden" name="rcontent" value="\${rContent2}"></input>`
											$("#hidden_area").append(value);
									  	//'on' class 추가
									    modal.classList.add('on');
									  	$("#update_content").text(rContent2);
									  
									  	
									  	$("#update_content").on("input", function () {
									        let updatedContent = $(this).val(); // textarea의 변경된 값
									        // hidden 영역에 업데이트된 rcontent 값을 저장
									        $("#hidden_area").find("input[name='rcontent']").remove(); // 기존 값 제거
									        value = `<input type="hidden" name="rcontent" value="\${updatedContent}">`;
									        $("#hidden_area").append(value);
									    });
									});
									//닫기 버튼을 눌렀을 때 모달팝업이 닫힘
									modalClose.addEventListener('click',function(){
									    //'on' class 제거
									    modal.classList.remove('on');
									});
									
								}
								
								
								
								function selectBoardAnswerCount(){
									$.ajax({
										url:"rCount.bo",
										data:{bno:<%=b.getBoardNo()%>},
										success:function(rCount){
											$(".comment-count").text("댓글 " + rCount);
										},error:function(){
											console.log("댓글 갯수 조회용 ajax 통신 실패");
										}
									})
								}
								<%if(loginMember != null){ %>
								<!-- 댓글 수 카운트-->
						        const replyContent = document.getElementById('replyContent');
						        const charCountDisplay = document.querySelector('.char-count');
						        const maxChars = 300;

						        replyContent.addEventListener('input', () => {
						            const currentLength = replyContent.value.length;
						            charCountDisplay.innerHTML = `\${currentLength} / <span id="maxChars">\${maxChars}</span> 자`;

						        });
						   	<!-- 여기까지 댓글 수 카운트 스크립트 -->
						   	<% } %>
						   	<!-- 팔로우 및 언팔로우 기능 -->

						   	$('#follow-btn').on('click', function () {
						   	    $.ajax({
						   	        url: 'follow', // 팔로우를 처리하는 서버 API 경로
						   	        method: 'POST',
						   	        data: {
						   	            followerId: followerId,
						   	            followingId: followingId
						   	        },
						   	        success: function (result) {
						   	        	console.log("팔로우 요청 응답:", result);

						   	            if (result == 0) { // 팔로우가 되어있음
						   	                alert("팔로우를 취소하였습니다.");

						   	                // 팔로우 삭제 요청
						   	                $.ajax({
						   	                    url: 'deleteFollow',
						   	                    method: 'POST',
						   	                    data: {
						   	                        followerId: followerId,
						   	                        followingId: followingId
						   	                    },
						   	                    success: function (deleteResult) {
						   	                        // 삭제 후 UI 업데이트 (예: 버튼 텍스트 변경)
						   	                        $('#follow-btn').text("팔로우").removeClass('btn-secondary').addClass('btn-primary');
						   	                    },
						   	                    error: function() {
						   	                        alert("서버와의 통신에 실패함");
						   	                    }
						   	                });
						   	            } else if (result == 1) { // 팔로우성공
						   	            	$('#follow-btn').text("팔로잉").removeClass('btn-primary').addClass('btn-secondary');
						   	            }
						   	        },
						   	        error: function () {
						   	            alert('서버와의 통신에 실패했습니다.');
						   	        }
						   	    });
						   	});

								<!-- 여기까지가 팔로우 및 언팔로우 기능 -->
								
								
								
						
						</script>
				</div>
				<%@ include file="../common/footerbar.jsp" %>
		</body>
		</html>