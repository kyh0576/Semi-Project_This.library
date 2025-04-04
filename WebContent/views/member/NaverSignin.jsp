<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>
<%
	String alertMsg = (String)request.getAttribute("alertMsg");
	String nickname = (String)request.getAttribute("nickname");
	String email = (String)request.getAttribute("email");
	String mobile = (String)request.getAttribute("mobile");
	String naverKey = (String)request.getAttribute("naverKey");
	Member loginMember = (Member)session.getAttribute("loginMember");
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

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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

.form-group .addressbtn {
	margin-left: 235px;
}

.form-group #addressbtn {
	margin-left: 235px;
}

.container {
	width: 1000px !important;
  
}



/* ====================================== */

.wrap {
               width: 1500px;
               margin: auto;
               height: auto;
               overflow: hidden;
            }

            #header {
               height: 50px;
            }

            #header>div {
               height: 100%;
            }

            #header_1>div,
            #header_1_3>div {
               float: left;
            }

            #header_1_1_1 {
               width: 10%;
               height: 100%;
               margin-top: 5px;
            }

            #headnavigator {
               position: relative;
               width: 55%;
               height: 100%;
               display: flex;
               align-items: center;
               justify-content: space-around;
               box-sizing: border-box;
            }

            #headnavigator>div {
               position: relative;
            }

            a {
                  text-decoration-line: none;
                  color: black;
            }
               
            #headnavigator a {
               font-size: 13px;
               display: block;
               font-weight: bold;
               cursor: pointer;
               height: 100%;
               line-height: 50px;
            }

            .submenu {
               position: absolute;
               top: 100%;
               left: 0;
               width: 150px;
               background: white;
               box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
               border-radius: 5px;
               opacity: 0;
               visibility: hidden;
               transition: opacity 0.4s ease-in-out, transform 0.2s ease-in-out;
               transform: translateY(-10px);
               z-index: 10;
               text-align: center;
               
            }

            .submenu a {
               font-size: 12px;
               transition: background 0.2s ease-in-out;
            }

            .submenu a:hover {
               background: #f5f5f5;
               cursor: pointer;
            }

            #headnavigator>div:hover .submenu {
               opacity: 1;
               visibility: visible;
               transform: translateY(-10px);
            }

            @keyframes dropdown {
               0% {
                  opacity: 0;
                  transform: translateY(-10px);
               }

               100% {
                  opacity: 1;
                  transform: translateY(0);
               }
            }

            #headnavigator>div:hover .submenu,
            .submenu:hover {
               opacity: 1;
               visibility: visible;
               transform: translateY(0);
            }

            #headnavigator>div:not(:hover) .submenu {
               transition-delay: 0.2s;
            }

            /*-------------------------------------------------------------  */
            #header_mypage_btn,
            #header_login_btn,
            #header_signin_btn {
               display: flex;
               justify-content: center;
               align-items: center;
            }

            #login {
               width: 50%;
               height: 50%;
               border-radius: 5px;
               color: burlywood;
               border: none;
               cursor: pointer;
    }

      #signin {
         width: 50%;
         height: 50%;
         border-radius: 5px;
         color: burlywood;
         border: none;
         cursor: pointer;
}
            /* ---------------------------------------------- */
            #mypage {
               border-radius: 50%;
               width: 40%;
               height: 60%;
               background-color: #ea916e;
               border: none;
            }

            #mypage>img {
               width: 100%;
               height: 100%;
            }

            /* ---------------------------------------------- */
            .btn:hover {
               opacity: 0.7;
               color: white;
               cursor: pointer;
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
                     <a href="<%= contextPath %>/views/common/mainPage.jsp"><img
                        src="<%= contextPath %>/resources/assets/This_서고 로고.png" alt=""
                        style="height: 100%; width: 100%;"></a>
                  </div>
                  <div id="headnavigator">
                     <a href="<%=contextPath%>/views/common/mainPage.jsp">Home</a>

                     <div class="naviDiv">
                        <a href="<%=contextPath%>/list.bo?cpage=1">게시판</a>
                        <div class="submenu">
                           <a href="<%=contextPath%>/list.vo?cpage=1">온라인 투표</a>
                           <a href="<%=contextPath%>/list.bo?cpage=1">자유게시판</a>
                        </div>
                     </div>
                     
                     <div class="naviDiv">
                        <a href="#">전체도서</a>
                        <div class="submenu">
                           <a href="<%=contextPath%>/views/book/bestSeller.jsp">인기도서</a>
                           <a href="#todayPickButton" onclick="scrollToSection('content_2_1')">오늘의 픽</a>
                           <a href="#adminPickButton" onclick="scrollToSection('content_2_5')">관리자의 픽</a>
                        </div>
                     </div>

                     <div class="naviDiv">
													 <a href="<%= contextPath %>/select.nc">고객센터</a>
													 <div class="submenu">
                           <a href="<%=contextPath%>/views/serviceCenter/persnalInquiry.jsp">1:1 문의하기</a>
                           <a href="<%=contextPath%>/list.sc?cpage=1">1:1 문의 내역</a>
                           <a href="<%=contextPath%>/views/serviceCenter/fnaList.jsp">F&Q 질문 내역</a>
                           <a href="<%=contextPath%>/views/serviceCenter/customerService.jsp">전화상담</a>
                           <a href="<%=contextPath%>/views/serviceCenter/notice.jsp">공지사항</a>
                        </div>
                     </div>
                  </div>
                  <% if(loginMember== null){ %>
                  <div id="header_login_btn" style="height: 100%; width: 9%;">
                     <a class="btn" id="login" onclick="location.href='<%=contextPath%>/views/member/loginform.jsp'">LogIn</a>
                  </div>
                  
                  <div id="header_signin_btn" style="height: 100%; width: 9%;">
                     <a class="btn" id="signin" onclick="signin()">Sign In</a>
                  </div>

                  <%}else{ %>
                     <div>
                        <br>
                         <b><%= loginMember.getMemName()%>님 </b>의 방문을 환영합니다.      
                     </div>
                     
                     <div id="header_login_btn" style="height: 100%; width: 9%;">
                        <button class="btn" id="login"><a href="<%= contextPath %>/logout.me">로그아웃</a></button>
                     </div>
                  <%} %>


                  <div id="header_mypage_btn" style="height: 100%; width: 7%;">
                     
                     <button class="btn" id="mypage" onclick="mypage()">
												<img src="<%= contextPath %>/resources/assets/user01.png" alt="user-icon" onclick="goToMyPage()" style="cursor: pointer;">
                     </button>
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
						<label for="inputName">이름</label> <input type="text"
							class="form-control" name="name" placeholder="이름을 입력해 주세요"
							required>
					</div>

					<div class="form-group">
						<label for="inputName">아이디</label> <input type="text"
							class="form-control" name="id"
							placeholder="4~12자의 영문 대소문자와 숫자로만 입력" required>
						<button class="btn btn-default addressbtn" type="button"
							onclick="idCheck()" id="dupl_btn">중복확인</button>
					</div>

					<div class="form-group">
						<label for="inputPassword">닉네임</label><input
							type="text" class="form-control" name="nickname" id="nickname"
							placeholder="닉네임을 2글자 이상 입력해주세요" required value=<%= nickname %>>
						<button class="btn btn-default addressbtn" type="button"
							onclick="checkNick()" id="dupl_btn">중복확인</button>
					</div>

					<div class="form-group">
						<label for="inputPassword">비밀번호</label> <label for=""></label><input
							type="password" class="form-control" name="password" id="password"
							placeholder="영문,숫자,특수문자 포함 8~16자" required>
					</div>

					<div class="form-group">
						<label for="inputPassword">비밀번호 확인</label> <input type="password"
							class="form-control" name="checkPassword" id="checkPassword"
							placeholder="비밀번호를 입력해주세요" oninput="checkpwd()" required>
					</div>

					<span id="pwd-result" style="margin-left: 25%;"></span> <br>
                   
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
							class="form-control" name="email" placeholder="이메일 주소를 입력해주세요" required value="<%= email %>">
					</div>
					
					<input type="hidden" name="key" value="<%= naverKey %>">


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
	

	<script>
  function login() {
	     location.href="<%= contextPath %>/views/member/NaverSignin.jsp";
	   }

  </script>

<script>
	function idCheck(){
	//아이디 입력하는 input 요소 객체
	const $idInput = $("input[name=id]"); 
	$.ajax({
		url:"<%=contextPath%>/idCheck.me",
		//data:{키값:벨류값},
		data:{
			checkId: $idInput.val()
		},
		type:"get",
		success:function(result){
			if(result == 'NNNNN'){//사용불가능일 경우
				alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.")
				$idInput.focus();//다시 입력할수 있도록 유도
				
			}else{//사용 가능일 경우
				
				if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")){
					$idInput.attr("readonly", true);
					$("#enroll-form :submit").removeAttr("disabled");
				}else{
					$idInput.focus();//다시 입력할수 있도록 유도
				}
			}
		},
		error:function(){
			console.log("아이디 중복체크용 ajax 통신 실패");
		}
	});
}

// --------------------------------------------------------

function validatePassword() {
const password = document.querySelector("input[name='password']").value;
const passwordCheck = document.querySelector("input[placeholder='비밀번호를 입력해주세요']").value;

// 비밀번호 유효성 검사 정규표현식
const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$/;

if (!passwordRegex.test(password)) {
	alert("비밀번호는 영문, 숫자, 특수문자를 포함한 8~16자여야 합니다.");
	return false;
}

if (password !== passwordCheck) {
	alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	return false;
}

return true; // 모든 조건이 충족되면 true 반환
}

function checkpwd(){
var pwd1 = document.getElementById('password').value
var pwd2 = document.getElementById('checkPassword').value
var result = document.getElementById('pwd-result');

if (pwd1 == pwd2) {
	result.innerHTML = '비밀번호가 일치합니다.'; // 일치하면 '일치합니다.' 출력
	result.style.color = 'blue'; // 파란색

} else {
	result.innerHTML = '비밀번호가 일치하지 않습니다.'; // 일치하지 않으면 '일치하지 않습니다.' 출력
	result.style.color = 'red'; // 빨간색
}
}
</script>
<!-- ---------------------------------------------------------------------- -->
<script>
function checkNick() {
	var nickname = document.getElementById('nickname').value.trim(); // 공백 제거

	var engCheck = /[a-z]/;
	var numCheck = /[0-9]/;
	var specialCheck = /[`~!@#$%^&*|\\"';:/?]/gi; // 특수문자 검사
	var nickLength = 0;

	// 닉네임 길이 계산
	for (var i = 0; i < nickname.length; i++) {
			var nick = nickname.charAt(i);
			if (encodeURIComponent(nick).length > 4) {
					nickLength += 2; // 한글 1자 = 2byte
			} else {
					nickLength += 1; // 영문, 숫자 1자 = 1byte
			}
	}

	if (nickname === "") {
			alert("닉네임 입력은 필수입니다.");
	} else if (/\s/.test(nickname)) {
			alert("닉네임은 빈 칸을 포함할 수 없습니다.");
	} else if (nickLength < 2 || nickLength > 20) {
			alert("닉네임은 한글 1~10자, 영문 및 숫자 2~20자 입니다.");
	} else if (specialCheck.test(nickname)) {
			alert("닉네임은 특수문자를 포함할 수 없습니다.");
	} else {
			// Ajax를 통한 닉네임 중복 체크
			const $nickInput = $("input[name=nickname]");
			$.ajax({
					url: "<%=contextPath%>/nickCheck.me",
					data: { nickname: $nickInput.val() },
					type: "post",
					success: function(result) {
							if (result === 'NNNNN') { // 사용 불가능할 경우
									alert("이미 존재하는 회원의 닉네임입니다.");
									$nickInput.focus(); // 다시 입력할 수 있도록 유도
							} else { // 사용 가능할 경우
									if (confirm("사용 가능한 닉네임입니다. 사용하시겠습니까?")) {
											$nickInput.attr("readonly", true);
											$("#enroll-form :submit").removeAttr("disabled");
									} else {
											$nickInput.focus(); // 다시 입력할 수 있도록 유도
									}
							}
					},
					error: function() {
							console.log("닉네임 중복 체크 Ajax 통신 실패");
					}
			});
	}
}
</script>

  <%@ include file="../common/footerbar.jsp"%>
	<!-- -------------------------------------------------------------------- -->
</body>

</html>