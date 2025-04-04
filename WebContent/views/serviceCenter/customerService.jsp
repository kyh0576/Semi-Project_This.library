<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.scvote.model.vo.scNoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=edit" />

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document1</title>


<style>
@font-face {
	font-family: 'Gyeonggi_Batang_Regular';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-3@1.0/Batang_Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

body * {
	font-family: 'Gyeonggi_Batang_Regular';
	font-weight: 700;
}

/* div {box-sizing: border-box;border: 1px solid red;} */

/*-------------------------------------------------------------  */
  #content>#content1 {
    background-image: url("/this/resources/assets/Container81.png");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
  }

#content1 {
	width: 100%;
	height: 300px;
	display: flex;
	object-fit: cover;
}

#content2 {
	width: 70%;
	height: 400px;
	margin-left: 15%;
}

#content3 {
	width: 100%;
	margin-bottom: 10px;
}

#textcontent {
	font-size: 30px;
	line-height: 100px;
	margin-left: 150px;
}

#content2_1, #content2_2 {
	width: 100%;
	height: 50%;
	display: flex;
}

#content2_1_1, #content2_1_2, #content2_1_3, #content2_1_4 {
	width: 50%;
}

#contentDiv1_1, #contentDiv2_1, #contentDiv3_1, #contentDiv4_1 {
	width: 100%;
	height: 60%;
	text-align: center;
	box-sizing: border-box;
	margin-bottom: -20px;
}

#contentDiv1_2, #contentDiv2_2, #contentDiv3_2, #contentDiv4_2 {
	width: 100%;
	height: 30%;
	text-align: center;
	box-sizing: border-box;
}

#contentDiv1_3, #contentDiv2_3, #contentDiv3_3, #contentDiv4_3 {
	width: 100%;
	height: 10%;
	text-align: center;
	box-sizing: border-box;
}

#content2 img {
	width: 100px;
	cursor: pointer;
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24
}

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

th, td {
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



.board-container tbody tr:hover {
	background-color: lightgrey;
	cursor: pointer;
}
	</style>
</head>
<!-- ------------------------------------------------------------------ -->

<body>
<%@ include file="../common/menubar.jsp" %>



	<div id="content">
		<div id="content1">
			<div id="textcontent">
				<pre>
              어떤 어려움이 있으신가요? 
              <b>고객센터 입니다.</b>
              </pre>
			</div>
		</div>
		<br> <br> <br> <br> <br>
		<div id="content2">
			<div id="content2_1">
			
			
			
				<div id="content2_1_1">
				  <div id="contentDiv2_1" style="cursor: pointer;">
				  	<a href="#" onclick="inquiry()">
				    <img src="<%=contextPath%>/resources/assets/interview_15747273.gif" />
				    </a>
				  </div>
				
				  <div id="contentDiv2_2" style="cursor: pointer;">
				  <a href="#" onclick="inquiry()"><p><b>1:1 문의 접수</b></p></a>
				    
				  </div>
				
				  <div id="contentDiv2_3" onclick="inquiry()" style="cursor: pointer;">
				    고객센터에 문의글 접수중입니다.
				  </div>
				</div>

				
				
				
				
				
				<div id="content2_1_2">
					<div id="contentDiv2_1">
						<a href="<%=contextPath%>/views/serviceCenter/fnaList.jsp"> <img
							src="<%=contextPath%>/resources/assets/faq_12205153.gif">
						</a>
					</div>
					<div id="contentDiv2_2">
						<p>
							<a href="<%=contextPath%>/views/serviceCenter/fnaList.jsp"
								style="text-decoration-line: none;"> <b>F&A</b>
							</a>
						</p>
					</div>
					<div id="contentDiv2_3">자주 문의되는 질문에 대한 답변을 보실 수 있습니다.</div>
				</div>
			</div>
			<div id="content2_2">
				<div id="content2_1_3">
					<div id="contentDiv3_1">
						<a
							href="<%=contextPath%>/list.sc?cpage=1"
							style="border: none;"> <img
							src="<%=contextPath%>/resources/assets/conversation_15578485.gif">
						</a>
					</div>
					<div id="contentDiv3_2">
						<p>
							<a href="<%=contextPath%>/list.sc?cpage=1" style="text-decoration-line: none;"><b>1:1 문의 내역</b></a>
						</p>
					</div>
					<div id="contentDiv3_3">사용자가 문의한 글 내역을 확인합니다.</div>
				</div>
				<div id="content2_1_4">
					<div id="contentDiv4_1">
						<img
							src="<%=contextPath%>/resources/assets/virtual-assistant_15579142.gif">
					</div>
					<div id="contentDiv4_2">
						<p>
							<a><b>전화 상담</b></a>
							<div>02-950-0112</div>
						</p>
					</div>
					<div id="contentDiv4_3">고객 센터에 연결되어 상담자와 연결이 됩니다.</div>
				</div>
			</div>
		</div>
		<br> <br> <br>
		
		
		
						<!-- 공지사항 -->
		       <!-- userNo, title, content, file 가져감 -->
		<div id="content3">
			<div class="notice-form">
				<!-- 공지사항 -->
				<div class="board-container">
					<h2>공지사항</h2>
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
							<%
								    ArrayList<scNoticeVO> list = (ArrayList<scNoticeVO>) request.getAttribute("noticeList");
								    if (list != null && !list.isEmpty()) {
								        for (scNoticeVO n : list) {
								%>
								<tr class="notice-row" style="cursor:pointer;" data-notice="<%=n.getNoticeNo()%>">
								    <td><%= n.getNoticeNo() %></td>
								    <td><%= n.getTitle() %></td>
								    <td>admin</td>
								    <td><%= n.getDate() %></td>
								    <td>1</td>
								</tr>
								<%
								        }
								    } else {
								%>
								<tr><td colspan="5">공지사항이 없습니다.</td></tr>
								<%
								    }
								%>

						</tbody>
					</table>
						<% 
			  String memId = (loginMember != null) ? loginMember.getMemId() : "";
			  if("admin".equals(memId)) { 
			%>
			    <div style="display: flex;">
			      <a href="<%= contextPath %>/views/serviceCenter/noticeInsertForm.jsp" class="write-btn" style="margin-left: auto;">글쓰기</a>
			    </div>
			<% } %>
				</div>
				
				
				
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				
				<script>
				  $(function () {
				    $(".notice-row").click(function () {
				      alert("해당 글은 업데이트중에 있습니다. 추후 열람 가능합니다.");
				    });
				  });
				</script>

			</div>
		</div>
	</div>
	<!-- 공지사항 끝 -->
<%@ include file="../common/footerbar.jsp" %>



</body>

</html>