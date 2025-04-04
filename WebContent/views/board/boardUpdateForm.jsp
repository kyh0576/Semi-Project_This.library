<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="com.kh.board.model.vo.Attachment"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
		// 글번호, 닉네임, 제목, 내용, 조회수, 작성일
	Board b = (Board)request.getAttribute("b");
		
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

            <style>
                /* 자유게시판 게시글 작성 스타일 */
                .post-container {
                    max-width: 1000px;
                    margin: 50px auto;
                    margin-top: 70px;
                    margin-bottom: 70px;
                    background: white;
                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }

                h2 {
                    margin-bottom: 10px;
                }

                hr {
                    border: 0;
                    border-top: 1px solid #333;
                    margin-bottom: 20px;
                }

                label#title,
                label#content {
                    font-weight: bold;
                    display: block;
                    margin-bottom: 5px;
                }

                input,
                textarea {
                    width: 100%;
                    padding: 10px;
                    border: 1px solid #333;
                    border-radius: 5px;
                    font-size: 14px;
                }

                textarea {
                    height: 200px;
                    resize: none;
                }

                input[type="file"] {
                    border: none;
                    padding: 5px 0;
                }

                .file-upload-container {
                    display: flex;
                    align-items: center;
                    /* 요소들을 같은 높이에 정렬 */
                    justify-content: space-between;
                    /* 양 끝 정렬 */
                    margin-top: 10px;
                }

                .file-upload-container input[type="file"] {
                    flex-grow: 1;
                    /* 파일 선택 창이 왼쪽 공간을 채우도록 설정 */
                }

                .button-group {
                    display: flex;
                    gap: 10px;
                    /* 버튼 간격 */
                }

                button:hover {
                    opacity: 0.7;
                }
	

                .back-btn,
                .button-group button {
                    background: #ea916e;
                    color: white;
                    border: none;
                    padding: 10px 15px;
                    border-radius: 5px;
                    cursor: pointer;
                    font-size: 14px;
                    width: 85px;
                }




                .hidden-file-input {
                    display: none;
                    /* input 숨기기 */
                }

                .custom-file-label {
                    display: inline-block;
                    padding: 10px 15px;
                    background-color: #f0f0f0;
                    cursor: pointer;
                    background: #ea916e;
                    color: white;
                    border-radius: 5px;
                    font-size: 14px;

                }

                .custom-file-label:hover {
                    opacity: 0.7;
                }
                /* 자유게시판 게시글 작성 스타일 끝 */
            </style>
        </head>

        <body>
       
        		<%@ include file="../common/menubar.jsp" %>
                <!-- 자유게시판 게시글 작성 -->
                <div class="post-container">
                    <h2>글쓰기</h2>
                    <hr>
                    <form action="<%=contextPath%>/update.bo" method="POST" enctype="multipart/form-data">
                    		<input type="hidden" name="bno" value="<%= b.getBoardNo()%>">
                        <label for="title" id="title" >제목</label>
                        <input type="text" id="title" name="title" maxlength="50" value="<%=b.getBoardTitle() %>" style="width: 980px; margin-bottom: 10px;" required>

                        <label for="content" id="content">내용</label>
                        <textarea id="content" name="content" maxlength="1333" style="width: 980px; height: 300px; margin-bottom: 10px; "
                            required><%= b.getBoardContent() %></textarea>

                        <div class="file-upload-container">
                            <label for="fileUpload" class="custom-file-label">첨부파일</label>
                            <input type="file" id="fileUpload" class="hidden-file-input" name="upfile">


                            <div class="button-group">
                                <button type="button" onclick="location.href='<%=contextPath%>/list.bo?cpage=1'">뒤로가기</button>
                                <button type="submit">수정하기</button>
                            </div>
                        </div>
                        <% if(at != null){ %>
                       <p style="margin-top: 5px;" id="fileName"><%= at.getOriginName()  %></p>
                       <input type="hidden" name="originFileNo" value="<%= at.getFileNo() %>">
                       <%}else{ %>
                        <p style="margin-top: 5px;" id="fileName">선택된 파일 없음</p>
                       <%} %>
                    </form>
                </div>
                <!-- 자유게시판 게시글 작성 끝 -->
            <script>
                document.getElementById("fileUpload").addEventListener("change", function () {
                    let fileName = this.files.length > 0 ? this.files[0].name : "선택된 파일 없음";
                    document.getElementById("fileName").textContent = fileName;
                });
            </script>
            <!-- -------------------------------------------------------------------- -->
            <%@ include file="../common/footerbar.jsp" %>
        </body>

        </html>