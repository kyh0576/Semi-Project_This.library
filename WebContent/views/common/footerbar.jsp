<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


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
			.wrap {
				width: 1500px;
				margin: auto;
				height: auto;
				overflow: hidden;
			}

			#footer {
				height: 150px;
				
			}

			#footernavigator {
				position: relative;
				width: 60%;
				height: 100%;
				display: flex;
				align-items: center;
				justify-content: space-around;
			}

			#footernavigator>a {
				text-decoration: none;
				color: black;
				font-size: 13px;
				padding: 10px 15px;
				display: block;
				font-weight: bold;
				cursor: pointer;
				height: 100%;
				line-height: 50px;
			}

			/* ==============footer======================================= */
		
			#footer_1 {
				width: 100%;
				height: 65%;
			}

			#footer_1>div {
				float: left;
			}

			#footer_1_1 {
				height: 100%;
				width: 20%;
			}

			#footer_1_1>img {
				display: flex;
				margin: auto;
				width: 60%;
				height: 60%;
				margin-top: 20%;
			}

			#footer_2 {
				width: 100%;
				height: 35%;
				text-align: center;
				margin-top: 2%;
			}
		</style>
	</head>
	<meta charset="UTF-8">
	
	<!-- ------------------------------------------------------------------ -->

	<body>
		<div class="wrap">
			<!-- -----------------------------footer---------------------------------- -->
			<div id="footer" style="background-color: #fdf5f1;">
				<div id="footer_1">
					<div id="footer_1_1">
						<img src="<%= contextPath %>/resources/assets/This_서고 로고.png" alt="">
					</div>
					<div id="footernavigator" class="navigator">
						<a href="<%=contextPath%>/views/common/mainPage.jsp">Home</a>
						<a href="<%=contextPath%>/list.vo?cpage=1"">온라인투표</a>
						<a href="<%=contextPath%>/list.bo?cpage=1">자유게시판</a>
						
						<a href="#" onclick="mypage()">마이페이지</a>
						<a href="<%= contextPath %>/select.nc">고객센터</a>
						
						
					</div>
				</div>
				<div id="footer_2">© 2025 This.서고Company. All Rights Reserved.</div>
			</div>
		</div>
		<script>
		isLoggedIn = <%= (session.getAttribute("loginMember") != null) ? "true" : "false" %>;
        
        function mypage() {
            if (!isLoggedIn) {
               alert("해당 서비스는 로그인 후 사용 가능합니다. ")
               return
            }
            location.href = "<%= contextPath %>/views/member/myPage.jsp";
        }
		</script>
		 
	</body>
	</html>