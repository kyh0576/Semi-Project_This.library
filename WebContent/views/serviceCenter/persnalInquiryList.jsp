<%@page import="com.kh.common.model.vo.PageInfo" %>
  <%@page import="com.kh.serviceCenter.model.vo.serviceCenter" %>
    <%@page import="java.util.ArrayList" %>
      <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <% ArrayList<serviceCenter> list = (ArrayList<serviceCenter>)request.getAttribute("list");
            PageInfo pi = (PageInfo)request.getAttribute("pi");

            int currentPage = (pi != null) ? pi.getCurrentPage() : 1;
            int startPage = (pi != null) ? pi.getStartPage() : 1;
            int endPage = (pi != null) ? pi.getEndPage() : 1;
            int maxPage = (pi != null) ? pi.getMaxPage() : 1;

            %>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

            <!DOCTYPE html>
            <html lang="en">

            <head>
              <meta charset="UTF-8">
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
              <title>Document1</title>

              <style>
                @font-face {
                  font-family: 'Gyeonggi_Batang_Regular';
                  src:
                    url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-3@1.0/Batang_Regular.woff') format('woff');
                  font-weight: 400;
                  font-style: normal;
                }

                body * {
                  font-family: 'Gyeonggi_Batang_Regular';
                }

                /* div {box-sizing: border-box;border: 1px solid red;} */


                /* ---------------------------------------------- */

                /* 자유게시판 스타일 */
                .board-container {
                  max-width: 1000px;
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

                th,
                td {
                  border-bottom: 1px solid #ddd;
                  padding: 10px;
                  text-align: left;
                }

                th {
                  background-color: #f4f4f4;
                }

                .pagination {
                  text-align: center;
                  margin-top: 20px;
                }

                .pagination a {
                  margin: 0 5px;
                  text-decoration: none;
                  color: #333;
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

                .write-btn:hover {
                  opacity: 0.7;

                }

                div .write-btn>a {
                  text-align: right;
                }

                .board-container tbody tr:hover {
                  background-color: lightgrey;
                  cursor: pointer;
                }
              </style>
            </head>

            <body>
              <%@ include file="../common/menubar.jsp" %>

                <!-- 자유게시판 -->
                <div class="board-container">
                  <h2>1:1 문의글 리스트</h2>
                  <table>
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>작성일자</th>
                      </tr>
                    </thead>
                    <tbody>
                      <% if(list==null) { %>
                        <!-- case1. 게시글이 없을 경우 -->
                        <tr>
                          <td colspan="5">조회된 게시글이 없습니다.</td>
                        </tr>
                        <% }else{ %>

                          <!-- case2. 게시글이 있을 경우 -->
                          <%for(serviceCenter sc : list){ %>
                            <tr data-writer="<%= sc.getMemNo() %>">
                              <td>
                                <%=sc.getInquiryNo() %>
                              </td>
                              <td>
                                <%=sc.getTitle() %>
                              </td>
                              <td>
                                <%=sc.getName() %>
                              </td>
                              <td>
                                <%=sc.getInquiryDate() %>
                              </td>
                            </tr>
                            <%} %>
                              <%} %>
                    </tbody>
                  </table>
										<%
									  int loginMemNo = (loginMember != null) ? loginMember.getMemNo() : 0;
									%>
									<script>
									  const loginMemNo = <%= loginMemNo %>;
									</script>




									<script>
									
									$(function () {
										  $(".board-container tbody > tr").click(function () {
										    const writerNo = $(this).data("writer"); // 글 작성자 번호
										    const boardNo = $(this).children().eq(0).text(); // 글 번호

										    if (loginMemNo !== 0 && loginMemNo === writerNo) {
										      // 로그인했고, 글쓴이와 일치하면 이동
										      location.href = "<%= contextPath %>/detail.sc?bno=" + boardNo;
										    } else {
										      // 아니면 alert 띄우고 list 페이지 유지
										      alert("해당 글은 작성자만 확인할 수 있습니다.");
										    }
										  });
										});

                    
                  </script>


                  <!--          <div class="pagination">-->
                <!-- 페이징바 -->
                  <div class="paging-area" align="center">
                    <% if (currentPage !=1) { %>
                      <button onclick="location.href='<%=contextPath%>/list.sc?cpage=<%=currentPage-1%>'">&lt;</button>
                      <% } %>

                        <% for (int p=startPage; p <=endPage; p++) { %>
                          <% if (p==currentPage) { %>
                            <button disabled>
                              <%= p %>
                            </button>
                            <% } else { %>
                              <button onclick="location.href='<%=contextPath%>/list.sc?cpage=1'">
                                <%= p %>
                              </button>
                              <% } %>
                                <% } %>
                                  <% if (currentPage !=maxPage) { %>
                                    <button
                                      onclick="location.href='<%=contextPath%>/list.sc?cpage=<%=currentPage+1%>'">&gt;</button>
                                    <% } %>
                  </div>

									<%if(loginMember != null){ %>
                  <div style="display: flex;">
                    <a href="<%= contextPath %>/views/serviceCenter/persnalInquiry.jsp" class="write-btn"
                      style="margin-left: auto;">글쓰기</a>
                  </div>
                  <% } %>

                </div>
                <!-- 자유게시판 끝 -->



                <!-- -------------------------------------------------------------------- -->
                <%@ include file="../common/footerbar.jsp" %>

            </body>

            </html>