<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
%>

		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Document1</title>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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

				.label {
					background: #ff7f50;
					color: white;
					font-size: 12px;
					padding: 3px 6px;
					border-radius: 4px;
					margin-left: 5px;
				}

				.label:hover {
					opacity: 0.7;
				}

				.post-content {
					font-size: 16px;
					line-height: 1.6;
					margin-bottom: 20px;
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

				.submit-btn:hover {
					opacity: 0.7;
				}

				.vote {
					display: flex;
					justify-content: center;
				}


				.card {
					width: 30%;
					aspect-ratio: 2 / 3;
					background: #c0ddfa;
					border-radius: 20px;
					display: flex;
					justify-content: center;
					align-items: center;
					position: relative;
					overflow: hidden;
					cursor: pointer;
					margin: auto;
					transition: transform 0.75s;
					/* 애니메이션 시간 설정 */
				}

				.card:hover {
					transform: scale(1.1);
					/* 마우스 오버 시 크기 증가 */
					border-radius: 50%;
					/* 원형으로 변경 */
				}

				.card img {
					width: 100%;
					height: 100%;
					object-fit: cover;
					position: absolute;
					margin-right: 10px;
				}

				.upload-icon {
					position: absolute;
					font-size: 24px;
					color: #6c757d;
					z-index: 0;
				}

				input[type="file"] {
					display: none;
				}

				.container {
					width: 80%;
					margin: 20px auto;
					display: flex;
				}

				.table {
					width: 100%;
					border-collapse: collapse;
				}

				.button-group {
					display: flex;
					margin-left: 80%;
					gap: 10px;
					/* 버튼 간격 */
				}

				button:hover {
					opacity: 0.7;
				}

				.button-group button {
					background: #ea916e;
					color: white;
					border: none;
					padding: 10px 15px;
					border-radius: 5px;
					cursor: pointer;
					font-size: 14px;
					width: 85px;
					justify-content: right;
				}



				.modalC {
					position: absolute;
					display: none;

					justify-content: center;
					top: 0;
					left: 0;

					width: 100%;
					height: 1800px;
					background-color: rgba(0, 0, 0, 0.4);
				}

				.modal_bodyC {
					position: fixed;
					top: 50%;
					width: 800px;
					height: 100%;
					padding: 40px;
					text-align: center;
					background-color: rgb(255, 255, 255);
					border-radius: 10px;
					box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
					transform: translateY(-50%);
					z-index: 1;
					max-height: 80%; /* 최대 높이 설정 */
    			overflow-y: auto; /* 세로 스크롤 가능 */
				}

				.close-btnC {
					position: absolute;
					top: 10px;
					right: 15px;
					font-size: 20px;
					font-weight: bold;
					cursor: pointer;
				}

				.search-form{
					margin-bottom: 20px;
				}

				#search-bar{
					width: 600px;
					height: 20px;
					border-radius: 5px;
				}

				.search-btn{
					width: 50px;
					height: 27px;
					background: #ea916e;
					color: white;
					border: none;
					border-radius: 5px;
					margin-left: 10px;
				}

				.book img {
						width: 200px;/* 씨부레 책 이미지 크기 */
						height: 250px;/* 씨부레 책 이미지 크기 */
						object-position: center;
						mix-blend-mode: multiply; /* 이미지 배색 개선 */
				}
			</style>
		</head>
		<body>
			<script>
				let book1 = 0;
				let book2 = 0;
			</script>
				<%@ include file="../common/menubar.jsp" %>
				<form class="post-container" action="<%=contextPath %>/insert.vo">
					<div class="post-header">
						<h2>제목<input type="text" name="title" maxlength="50" style="width: 985px; margin-left: 10px;" required></h2>
					</div>

					<div class="post-content">
						<p>

						<div id="post-content2">

							<div class="container">

								<div class="card btn-open-modalC" onclick="book1=1; book2=0;">
									<span class="upload-icon">➕</span>
									<img class="uploaded-image" id="selectBook1">
								</div>
								<div class="card btn-open-modalC" onclick="book2=1; book1=0;">
									<span class="upload-icon">➕</span>
									<img class="uploaded-image" id="selectBook2">
								</div>

							</div>
							<input type="hidden" name="imageUrl1" id="imageUrl1">
							<input type="hidden" name="imageUrl2" id="imageUrl2">
							<input type="hidden" name="book1" id="book1">
							<input type="hidden" name="book2" id="book2">
							<input type="hidden" name="userNo" id="userNo" value="<%=loginMember.getMemNo()%>">
							<br>
							투표 종료일 : <input type="date" name="deadline" id="dateInput" required>
						</div>
							</p>
					</div>
					<div class="button-group">
						<button type="button" onclick="location.href='<%=contextPath%>/list.vo?cpage=1'">뒤로가기</button>
						<button onclick="submitPost()">작성하기</button>
					</div>
				</form>
				

				<div class="modalC">
					<div class="modal_bodyC">
						<span class="close-btnC">&times;</span> <!-- 'X' 버튼 -->
						
						<div class="search-form">
							<h2>책 조회</h2>
							<input type="text" id="search-bar">
							<button class="search-btn" onclick="search()">검색</button>
						</div>

						<div id="content_2">
							<div id="content_2_2" class="content_2_2">
						<!-- 책 정보가 여기에 추가될 것입니다. -->
							</div>
					 </div>

					</div>
				</div>

				<script>
					const today = new Date().toISOString().split('T')[0];
				    document.getElementById('dateInput').setAttribute('min', today);
					
					// document.getElementsByClassName('post-container').onsubmit = function() {
					// 		var imgSrc1 = document.getElementById('selectBook1').src;
					// 		document.getElementById('imageUrl').value = imgSrc1;

					// 		var imgSrc2 = document.getElementById('selectBook2').src;
					// 		document.getElementById('imageUr2').value = imgSrc2;
					// };


					// modal
					const modalC = document.querySelector('.modalC');
					const btnOpenModalC = document.querySelectorAll('.btn-open-modalC');
					const btnCloseModalC = document.querySelectorAll('.close-btnC');

					btnOpenModalC.forEach(btn => {
							btn.addEventListener("click", () => {
									modalC.style.display = "flex";
							});
					});

					btnCloseModalC.forEach(btn => {
							btn.addEventListener("click", () => {
									modalC.style.display = "none";
							});
					});

					modalC.addEventListener("click", (event) => {
						if (event.target === modalC) {
							modalC.style.display = "none";
						}
					});


// ====================================================================================
			//let bookHTML = "";
			// search
			function search(){
						let keyword = document.getElementById("search-bar").value.trim();
						
						if (keyword === "") {
									alert("검색어를 입력하세요!");
									return;
						}


      let apiURL = "https://data4library.kr/api/srchBooks?authKey=a111a214753e25635f54ae9ff411072670e715484fd9ff42afc5c103323cfc67" 
                  + "&keyword=" + encodeURIComponent(keyword) 
                   + "&format=json";

        $.getJSON(apiURL, function (data) {
          console.log("API 응답 데이터:", data);

          if (!data || !data.response || !data.response.docs || data.response.docs.length === 0) {
        	  alert( keyword +"라는 도서(작가)는 없습니다!");
            console.error("❌ API에서 책 데이터가 없습니다!");
            return;
          }

          const books = data.response.docs;

					let bookHTML = "";
					$("#content_2_2").html(bookHTML);

          for (let i = 0; i < 100; i++) {
            let doc = books[i].doc;

            if (!doc) {
              console.error(`❌ books[${i}].doc가 없습니다. book 데이터:`, books[i]);
              continue;
            }

            let imageURL = doc.bookImageURL || "https://via.placeholder.com/150"; // 기본 이미지 사용
            let title = doc.bookname || "제목 없음";
            let authorFull = doc.authors || "작가 정보 없음";
            let publisher = doc.publisher || "출판사 정보 없음";
            let pubYear = doc.publication_year || "출판일 정보 없음";

            // 작가와 번역가 정보 추출
            let author = "작가 정보 없음";
            let translator = "번역가 정보 없음";

            if (authorFull.includes("지은이:")) {
              author = authorFull.split("지은이:")[1].split(";")[0].trim();
            }
            if (authorFull.includes("옮긴이:")) {
              translator = authorFull.split("옮긴이:")[1].split(";")[0].trim();
            }

            // 책 정보 HTML 생성
            console.log("변수 값:", {i, imageURL, title, author, translator, publisher, pubYear});
            bookHTML = `
												<hr>
												<div id="content_2_2_\${i + 1}" class="content_2_2_book">
													<div id="book\${i + 1}" class="book" onclick="selectBook('\${imageURL}', '\${title}')" style="cursor: pointer;">
														<img src="\${imageURL}" alt="\${title}">
													</div>
													<div id="bookcon\${i + 1}" class="bookcon">
														<div class="spare1"></div>
														<div class="bookinfo">
															<p style="font-size: 20px; cursor: pointer;"><b>\${title}</b></p>
															지은이 : <span style="font-size: 15px;">\${author}</span> &nbsp;|&nbsp; 옮긴이 : <span style="font-size: 15px;">\${translator}</span>
															<br><br>
															출판사 : <span style="font-size: 15px;">\${publisher}</span>&nbsp;|&nbsp; 출판일 :<span style="font-size: 15px;">\${pubYear}</span>
														</div>
														<div class="heart">
															<i class="fas fa-heart"></i>
															<i class="fas fa-heart" style="color: #ec1818;"></i>
														</div>
													</div>
												</div>
											`;
						
            console.log("생성된 HTML:", bookHTML);

            // 책 정보 HTML 추가
            $("#content_2_2").append(bookHTML);

          }
					
        }).fail(function (jqXHR, textStatus, errorThrown) {
          console.error(`❌ API 요청 실패: ${textStatus}, 오류: ${errorThrown}`);
          console.log(jqXHR); // 실패한 응답을 추가로 확인
        });
      };
				function selectBook(image, title){
					modalC.style.display = "none";
					if(book1 === 1){
						$(".uploaded-image").eq(0).attr('src', image);
						$("#imageUrl1").val(image);
						$("#book1").val(title);
						$("#search-bar").val("");
						$("#content_2_2").text("");
					}else if(book2 === 1){
						$(".uploaded-image").eq(1).attr('src', image);
						$("#imageUrl2").val(image);
						$("#book2").val(title);
						$("#search-bar").val("");
						$("#content_2_2").text("");
					}
				}

				
				</script>
				
				<%@ include file="../common/footerbar.jsp" %>
		</body>

		</html>