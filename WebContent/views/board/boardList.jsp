<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <% 
  
		// 글번호, 닉네임, 제목, 내용, 조회수, 작성일
  	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
  
		PageInfo pi = (PageInfo)request.getAttribute("pi");
	
		int currentPage = pi.getCurrentPage();
		int startPage = pi.getStartPage();
		int endPage = pi.getEndPage();
		int maxPage = pi.getMaxPage();
  %>

    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document1</title>
			<script
    		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">
			</script>
      <style>
        /* 자유게시판 스타일 */
        .board-container {
          max-width: 1200px;
          margin: 120px auto;
          background: white;
          padding: 20px;
          border-radius: 10px;
          box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
          width: 100%;
          border-collapse: collapse;
        }

        th,td {
          border-bottom: 1px solid #ddd;
          padding: 10px;
          text-align: left;
        }

        th {
          background-color: #f4f4f4;
        }

				.pagination {
					text-align: center;
					margin-top: 15px;
				}

				.pagination span {
					display: inline-block;
					padding: 5px 10px;
					margin: 2px;
					cursor: pointer;
					border: 1px solid #ddd;
					border-radius: 3px;
				}

				.pagination span:hover {
					background: #f0f0f0;
				}

        .write-btn {
          display: block;
          width: 80px;
          padding: 10px;
          /* margin: auto; */
          background-color: #ea916e;
          color: white;
          text-align: center;
          border-radius: 5px;
          text-decoration: none;
        }

        .write-btn:hover{
          opacity: 0.7;
          
        }

        div .write-btn>a {
          text-align: right;
        }

        .board-container tbody tr:hover{
          background-color: lightgrey;
          cursor: pointer;
        }
      </style>
    </head>

    <body>
 
    		<%@ include file="../common/menubar.jsp" %>
	    		
        <div class="board-container">
          <h2>자유게시판</h2>
          <table>
            <thead>
              <tr>
                <th>No</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>작성일자</th>
                <th>조회수</th>
              </tr>
            </thead>
            <tbody>
     				<% if(list == null) { %>
						<!-- case1. 게시글이 없을 경우 -->
							<tr>
								<td colspan="5">조회된 게시글이 없습니다.</td>
							</tr>
						<% }else{ %>
							
							<!-- case2. 게시글이 있을 경우 -->
	            <%for(Board b : list){ %>
		              <tr>
		                <td><%=b.getBoardNo() %></td>
		                <td width="645"><%=b.getBoardTitle() %></td>
		                <td><%=b.getBoardWriter() %></td>
		                <td><%=b.getWriteDate() %></td>
		                <td><%=b.getCount() %></td>
		              </tr>
	              <%} %>
              <%} %>
            </tbody>
          </table>
					<script>
						$(function(){
							$(".board-container tbody>tr").click(function(){
								location.href="<%= contextPath %>/detail.bo?bno="+ $(this).children().eq(0).text();
							})
						})
					</script>

          <div class="pagination">
	          <!-- 페이징바 -->
						<% if(currentPage != 1){ %>
								<span onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= currentPage - 1 %>'">&lt;</span>
						<% } %>
						<% for(int p=startPage; p<=endPage; p++){ %>					
								<% if(p == currentPage){ %>
										<button disabled><%= p %></button>
								<% }else{ %>
										<span onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= p %>'"><%= p %></span>
								<% } %>
						<% } %>
						
						<% if(currentPage != maxPage){ %>
								<span onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= currentPage + 1 %>'">&gt;</span>
						<% } %>
          </div>
					
					<%if(loginMember != null){ %>
          <div style="display: flex;">
            <a href="<%= contextPath %>/views/board/boardInsertForm.jsp" class="write-btn" style="margin-left: auto;">글쓰기</a>
          </div>
					<%} %>
        </div>
        <!-- 자유게시판 끝 -->
        <%@ include file="../common/footerbar.jsp" %>
    </body>
    </html>