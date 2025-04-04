<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>
<%
	String alertMsg = (String)request.getAttribute("alertMsg");
	String nickname = (String)request.getAttribute("nickname");
	String email = (String)request.getAttribute("email");
	String mobile = (String)request.getAttribute("mobile");
	String NaverKey = (String)request.getAttribute("NaverKey");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document1</title>
<!-- <link rel="stylesheet" href="header.css">
  <link rel="stylesheet" href="content.css">
  <link rel="stylesheet" href="footer.css"> -->

<style>
	@font-face {
        font-family: 'Chosunilbo_myungjo';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Chosunilbo_myungjo.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    body *{
      font-family: 'Chosunilbo_myungjo';
    }
    
/* div {box-sizing: border-box;border: 1px solid red;} */
.wrap {
	width: 1500px;
	margin: auto;
	height: auto;
	overflow: hidden;
}

#header {
	height: 50px;
}

#footer {
	height: 150px;
}

#header>div {
	height: 100%;
}

#header_1>div, #header_1_3>div {
	float: left;
}

#header_1_1_1 {
	width: 15%;
	height: 100%;
}

#navigator {
	position: relative;
	width: 60%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: space-around;
}

#navigator>a {
	text-decoration: none;
	color: black;
	font-size: 13px;
}

/*-------------------------------------------------------------  */
#header_mypage_btn, #header_login_btn, #header_signin_btn {
	display: flex;
	justify-content: center;
	align-items: center;
}

#login {
	width: 70%;
	height: 50%;
	border-radius: 5px;
	background-color: #ea916e;
	color: white;
	border: none;
}

#signin {
	width: 70%;
	height: 50%;
	border-radius: 5px;
	background-color: #ea916e;
	color: white;
	border: none;
}

/* ---------------------------------------------- */
#mypage {
	border-radius: 50%;
	width: 50%;
	height: 50%;
	background-color: #ea916e;
	border: none;
}

#mypage>img {
	width: 90%;
	height: 60%;
}

/* ---------------------------------------------- */
.btn:hover {
	opacity: 0.7;
	color: white;
	cursor: pointer;
}

/*-------------------------------------------------------------  */

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

/* -------------------------------------------------------------- */
.btn-space {
	margin-right: 5px;
}

/* .div{
  margin-left: 20%;
} */
.form-group>label {
	margin-left: 230px;
}

.form-group>input {
	width: 500px;
	margin: auto;
}

.form-group #addressbtn {
	margin-left: 235px;
}

.container {
	width: 1000px !important;
  
}

</style>
</head>
<meta charset="UTF-8">
<!-- ------------------------------------------------------------------ -->

<body>
	
	
	<% if(alertMsg != null){ %>
				<script>
					alert('<%=alertMsg%>');
				</script>
				
	<% } %>
  <div class="wrap">
    <div id="header">
      <div id="header_1">
          <div id="header_1_1_1">
						<a href="<%= contextPath %>"><img src="<%= contextPath %>/views/common/assets/This_서고 로고.png" alt="" style="height: 100%; width: 100%;"></a>
          </div>
          <div id="navigator">
            <a a href="<%= contextPath %>/views/common/mainPage.jsp">Home</a>
            <a href="">온라인투표</a>
            <a href="">자유게시판</a>
            <a href="">마이페이지</a>
            <a href="<%= contextPath %>/views/serviceCenter/customerService.jsp">고객센터</a>
          </div>
          <div id="header_login_btn" style="height: 100%; width: 9%;">
            <button class="btn" id="login"
						onclick="location.href='<%= contextPath %>/views/member/loginform.jsp'" 
            style="display: flex;
            justify-content: center;
            align-items: center;"
            >LogIn</button>
				</div>
				<div id="header_signin_btn" style="height: 100%; width: 9%;">
					<button class="btn" id="signin" onclick="signin()"
          style="display: flex;
            justify-content: center;
            align-items: center;"
            >Sign In</button>
				</div>
          <div id="header_mypage_btn" style="height: 100%; width: 7%;">
            <button class="btn" id="mypage"><img src="<%= contextPath %>/views/common/assets/user01.png" alt=""></button>
          </div>
      
      </div>
    </div>
    <!-- -------------------------------------------------------------------- -->

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>회원가입</title>
		<!-- Bootstrap -->
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

		<article class="container" id="container">
			<div class="page-header">
				<center>
					<h1>
						<a onclick="location.reload()" style="cursor: pointer;"><b>회원가입</b></a>
					</h1>
				</center>
				<div class="col-md-6 col-md-offset-3"></div>
			</div>

			<form id="form" action="<%= contextPath %>/signin.me" method="post">
				<div class="col-sm-6-col-md-offset-3">

					<div class="form-group">
						<label for="inputName" >이름</label> <input type="text"
							class="form-control" name="name" placeholder="이름을 입력해 주세요">
					</div>

					<div class="form-group">
						<label for="inputName">아이디</label> <input type="text"
							class="form-control" name="id" placeholder="아이디를 입력해 주세요">
						<button class="btn btn-default" type="button" onClick=""
							id="addressbtn">중복확인</button>
					</div>

					<div class="form-group">
						<label for="inputPassword">닉네임</label> <label for=""></label><input
							type="text" class="form-control" name="nickname"
							placeholder="닉네임을 입력해주세요" value=<%= nickname %>>
					</div>

					<div class="form-group">
						<label for="inputPassword">비밀번호</label> <label for=""></label><input
							type="password" class="form-control" name="password"
							placeholder="비밀번호를 입력해주세요">
					</div>

					<div class="form-group">
						<label for="inputPassword">비밀번호 확인</label> <input type="password"
							class="form-control" placeholder="비밀번호를 입력해주세요">
					</div>

                   
                   <div class="form-group">
                       <label>주소</label>
                       <input type="text" class="form-control" id="zipNo" name="post" placeholder="우편번호" >
                       <button class="btn btn-default" type="button" onClick="goPopup();" id="addressbtn"><i class="fa fa-search" ></i>주소검색</button>
                   </div>
                   
                   <div class="form-group" style="margin-top:0px;">
                       <input type="text" class="form-control" id="roadFullAddr" name="address" placeholder="상세주소"/>
                   </div>

					<div class="form-group">
						<label for="phone">PHONE</label> <input type="tel"
							class="form-control" name="phone" placeholder="ex) 010-1234-5678" value="<%= mobile %>">
					</div>

					<div class="form-group">
						<label for="InputEmail">이메일 주소</label> <input type="email"
							class="form-control" name="email" placeholder="이메일 주소를 입력해주세요" value="<%= email %>">
					</div>
					
					<input type="hidden" name="key" value="<%= NaverKey %>">


					<div class="form-group text-center">
						<button type="submit" id="join-submit"
							class="btn btn-primary btn-space">
							회원가입<i class="fa fa-check spaceLeft"></i>
							<button type="button" class="btn btn-danger"
								onClick="location.href='index.jsp'" />
							취소<i class="fa fa-check spaceLeft"></i>
						</button>
			</form>
	</div>
	</article>
	<hr>

	<script>
       function goPopup(){
       // 주소검색을 수행할 팝업 페이지를 호출합니다.
       // 호출된 페이지(addressAPIPopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
           var pop = window.open("<%= contextPath %>/views/common/jins/addressAPIPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
       
           // 모바일 웹인 경우, 호출된 페이지(addressAPIPopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
           //var pop = window.open("/popup/addressAPIPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
       }


       function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
           // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
           
           var address1 = document.querySelector("#zipNo");
           address1.value = zipNo;
   
           var address2 = document.querySelector("#roadFullAddr");
           address2.value = roadFullAddr;
       }
       </script>



	<!-- -------------------------------------------------------------------- -->
	<div id="footer" style="background-color: #fdf5f1;">
		<div id="footer_1">
			<div id="footer_1_1">
				<img src="<%= contextPath %>/views/common/assets/This_서고 로고.png"
					alt="">
			</div>
			<div id="navigator" class="navigator">
				<a a href="<%= contextPath %>/views/common/mainPage.jsp">Home</a> <a
					href="">온라인투표</a> <a href="">자유게시판</a> <a href="">마이페이지</a> <a
					href="<%= contextPath %>/views/serviceCenter/customerService.jsp">고객센터</a>
			</div>
		</div>
		<div id="footer_2">© 2025 YourCompany. All Rights Reserved.</div>
	</div>
	</div>

	<script>
  function login() {
	     location.href="<%= contextPath %>/views/member/NaverSignin.jsp";
	   }

  </script>
	<!-- -------------------------------------------------------------------- -->
</body>

</html>