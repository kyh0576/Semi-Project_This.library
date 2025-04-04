<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document1</title>
      <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=label_important" />


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
        

        /*----------------------------------------------------------*/
        #noticeBoardBackgraound {
          background-color: rgb(221, 214, 214);
          width: 90%;
          margin: auto;
          border-radius: 8px;
          padding: 1%;
        }

        .container {
          width: 80%;
          margin: 50px auto;
          background: white;
          padding: 20px;
          box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
          border-radius: 8px;
        }

        h2 {
          text-align: left;
          color: #333;
        }

        .form-group {
          margin-bottom: 15px;
        }

        #form-group-content {
          min-height: 300px;
        }

        label {
          font-weight: bold;
          display: block;
          margin-bottom: 5px;
        }

        input[type="text"],
        input[type="date"],
        textarea {
          width: 100%;
          padding: 10px;
          border: 1px solid #ccc;
          border-radius: 5px;
          box-sizing: border-box;
        }

        textarea {
          height: 100px;
          resize: none;
        }

        .buttons {
          display: flex;
          justify-content: center;
        }

       

        button:hover {
          background-color: #0056b3;
        }

        button[type="button"] {
          background-color: #6c757d;
        }

        button[type="button"]:hover {
          background-color: #5a6268;
        }

        #kk {
          margin: 10px;
          font-size: 30px;
          margin: 0 0 -35px 30px;
        }

        #content5 {
          display: flex;
        }

        #beCarefulText1 {
          width: 15%;
        }

        #submitTag {
          display: inline-block;
          width: 80px;
          text-align: center;
          padding: 8px;
          background-color: black;
          color: white;
          border-radius: 1em;
          cursor: pointer;
        }

       
      </style>
    </head>
    <meta charset="UTF-8">
    <!-- -------------------------------------------------------------------->
    <body>
      <%@ include file="../common/menubar.jsp" %>
        <!-- ---------------------------------------------------------------------->



        <div>
          <div id="noticeBoardBackgraound">
            <div id="kk"> 공지사항 관리하기</div>
            <form class="container">

              
              <div class="form-group">
                <label for="title">제목 </label>
                <input type="text" id="title" placeholder="새로운 게시글 제목입니다.">
              </div>

              <div class="form-group">
                <label for="content">내용 </label>
                <textarea id="form-group-content" placeholder="새로운 게시글 내용입니다."></textarea>
              </div>
              <div id="content5">
                <div id="beCarefulText1">첨부파일</div>
                <div id="beCarefulText2">
                  <li>개인정보를 포함한 이미지는 첨부 파일에 업로드할 수 없습니다. </li>
                  <li> 개인정보 - 이름, 주민등록번호, 운전면허번호, 주소, 전화번호, 생년월일, 출생지, 본적지, 성별, 국적</li>
                  <li>이를 어기고 개인정보가 포함된 파일을 업로드된 사실이 확인시 불이익을 받으실수 있습니다.</li>
                </div>
              </div>
              <input type="file" id="fileUpload" hidden />
              <label for="fileUpload" id="submitTag">파일 선택</label>
              <div class="buttons">
                <button type="submit">저장</button>
                <button type="button">뒤로</button>
              </div>
            </form>
          </div>
        </div>
        <!-- -------------------------------------------------------------------- -->
       
      <%@ include file="../common/footerbar.jsp" %>
    </body>

    </html>