<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>



    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document1</title>
      <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=info" />
      <!-- <link rel="stylesheet" href="header.css">
  <link rel="stylesheet" href="content.css">
  <link rel="stylesheet" href="footer.css"> -->

      <style>
        @font-face {
          font-family: 'Gyeonggi_Batang_Regular';
          src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-3@1.0/Batang_Regular.woff') format('woff');
          font-weight: 400;
          font-style: normal;
        }

        body * {
          font-family: 'Gyeonggi_Batang_Regular';
        }

        /* div {box-sizing: border-box;border: 1px solid red;} */


        /*-------------------------------------------------------------  */
        .wrap2 {
          width: 60%;
          box-sizing: border-box;
          margin: auto;
        }

        .wrap2>div {
          margin: 30px;
        }

        .content1 {
          font-size: 24px;
          font-weight: 1000;
        }

        .content2 {
          display: flex;
        }

        .content2 div {
          margin-right: 20px;
        }

        .content3 {
          font-size: 10px;
          color: rgb(185, 175, 175);
        }

        .content {
          width: 100%;
          display: flex;
          margin-bottom: 10px;
        }

        .label {
          width: 8%;
          margin-right: 5%;
          margin: auto;
          text-align: light;

        }

        .input-container {
          width: 95%;
          overflow-y: hidden; /* 스크롤 숨기고 자동 높이만 */
				  resize: none;        /* 사용자가 드래그로 사이즈 못 바꾸게 */
        }

        input,
        textarea {
          width: 100%;
          height: 35px;
          box-sizing: border-box;
        }

        .material-symbols-outlined {
          font-size: 20px;
          border: 1px solid;

        }

        .beCarefulText {
          font-size: 12px;
          color: rgb(110, 104, 104);
          width: 95%;
          height: 120px;
          background-color: #f9f9f9;
          border-radius: 4px;
          padding: 15px;
        }

        .beCarefulText>li {
          margin-bottom: 2%;
        }

        #submitTag {
          display: none;
        }

        .custom-file-label {
          display: inline-block;
          width: 120px;
          background-color: #ea916e;
          color: white;
          text-align: center;
          padding: 10px 15px;
          border-radius: 1em;
          cursor: pointer;
          font-size: 14px;
          font-weight: bold;
          transition: background 0.3s ease-in-out;
        }

        .custom-file-label:hover {
          background-color: #d46b4b;
        }


        #writeAndSubmit {
          cursor: pointer;
          font-size: 14px;
          border-radius: 5%;
          margin-bottom: 200px;
        }

        #writeAndSubmit>input {
          width: 120px;
          margin-left: 50%;
          border-color: lightgray;
          font-weight: 800;
        }
      </style>
    </head>
    <meta charset="UTF-8">
    <!-- ------------------------------------------------------------------ -->

    <body>

      <%@ include file="../common/menubar.jsp" %>
        <div class="wrap2">
          <div class="content1">고객센터</div>
          <div class="content2">
            <div>공지사항</div>
            <div>FnQ</div>
            <div style="color: blue;">1:1 문의</div>
          </div>
          <div class="content3">모든항목을 반드시 입력해 주셔야 문의접수가 가능합니다.
            <hr>
          </div>


          <form action="<%=contextPath%>/Inquiry.in" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="memNo" value=<%= loginMember.getMemNo() %>>
            
            <div class="content4">
              <div id="content4_1" class="content">
                <div class="label">이름 </div>
                <div class="input-container"><input type="text" placeholder="이름 입력" name="userName" required></div>
              </div>
              <div id="content4_2" class="content">
                <div class="label">이메일</div>
                <div class="input-container"><input type="text" placeholder="이메일 입력" name="userEmail" required></div>
              </div>
              <div id="content4_3" class="content">
                <div class="label">전화번호</div>
                <div class="input-container"><input type="text" placeholder="전화번호 입력" name="phone" required></div>
              </div>
              <div id="content4_4" class="content">
                <div class="label">제목</div>
                <div class="input-container"><input type="text" placeholder="제목 입력" name="title" required></div>
              </div>
              <div id="content4_5" class="content">
                <div class="label">내용</div>
                <div class="input-container">
                  <textarea name="content" id="autoResizeTextarea"  placeholder="문의내용 최대 1000자를 입력해주세요." maxlength="1000"
                    required></textarea>
                </div>
              </div>
            </div>
            <br>
            <hr><br>
            <div id="content5" class="content">
              
              <div class="beCarefulText">
                <ul>
                  <li>개인정보를 포함한 이미지는 첨부 파일에 업로드할 수 없습니다. </li>
                  <li> 개인정보 - 이름, 주민등록번호, 운전면허번호, 주소, 전화번호, 생년월일, 출생지, 본적지, 성별, 국적</li>
                  <li>이를 어기고 개인정보가 포함된 파일을 업로드된 사실이 확인시 불이익을 받으실수 있습니다.</li>
                </ul>
              </div>

            </div>
            
            <div id="writeAndSubmit">
              <input type="submit" value="글 작성하기">
            </div>
          </form>
        </div>
                        <!--게시글 작성 끝 -->
        
					<script>
                const textarea = document.getElementById("autoResizeTextarea");

                textarea.addEventListener("input", function () {
                  this.style.height = "auto"; // 높이 초기화
                  this.style.height = this.scrollHeight + "px"; // 실제 콘텐츠 높이로 설정
                });
            </script>






        <!-- -------------------------------------------------------------------- -->
        <!-- -=======1:1 문의 내용(content) 적을때, 글자수 세는 기능, 글자수 제한 기능) jsp
    $('#textBox').keyup(function (e) {
	let content = $(this).val();
    
    // 글자수 세기
    if (content.length == 0 || content == '') {
    	$('.textCount').text('0자');
    } else {
    	$('.textCount').text(content.length + '자');
    }
    
    // 글자수 제한
    if (content.length > 200) {
    	// 200자 부터는 타이핑 되지 않도록
        $(this).val($(this).val().substring(0, 200));
        // 200자 넘으면 알림창 뜨도록
        alert('글자수는 200자까지 입력 가능합니다.');
    };
});
출처: https://anerim.tistory.com/160 [디발자 뚝딱:티스토리]  
    
    -->
        <%@ include file="../common/footerbar.jsp" %>
    </body>


    </html>