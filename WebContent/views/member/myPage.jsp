<%@page import="java.util.List" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<%@ page import="com.kh.member.model.vo.Member" %>
			<% List<String> jjimList = (List<String>) session.getAttribute("jjimList");
					int jjimCount = (jjimList != null) ? jjimList.size() : 0;

					%>

					<!DOCTYPE html>
					<html lang="en">

					<head>
						<meta charset="UTF-8">
						<meta name="viewport" content="width=device-width, initial-scale=1.0">
						<title>Document1</title>
						<style>
							/*-------------------------------------------------------------  */
							.wrap2 {
								width: 1000px;
								border: 1px solid;
								background-color: #964b00;
								box-sizing: border-box;
								margin-left: 15%;
								margin-top: 5%;
								margin-bottom: 5%;
							}

							/* 
				.container2 * {
					border: 1px solid;
				} */

							.container {
								background-color: white;
								width: 98.5%;
								margin-left: 1.5%;
								display: flex;
							}

							.container1 {
								width: 15%;
								background-color: rgb(252, 230, 234);
							}

							/* -------------------------------------------container2 options------- */
							.container2 {
								width: 85%;
								padding: 5% 3%;
							}


							.container2 span,
							#commantaryTitle,
							#readGoalTitle,
							#JjimTitle {
								line-height: 40px;
								font-size: 15px;
								margin-left: -2%;

							}

							#mypageMainContent1 {
								font-size: 24px;
								font-weight: bold;
								margin-bottom: 15px;
							}

							#mypageMainContent2 {
								display: flex;
								align-items: center;
								width: 100%;
								border: 2px solid #ddd;
								border-radius: 10px;
								box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
								height: 200px;
								margin-bottom: 40px;
							}

							#mypageMainContent2ProfilPhoto {
								width: 50%;

							}

							#readGoalTitle,
							#commantaryTitle,
							#JjimTitle {
								font-weight: 800;
							}

							#userPhoto {
								width: 200px;
								height: 200px;
								border-radius: 50%;
								margin-left: 40%;
								overflow: hidden;
								display: flex;
								justify-content: center;
								align-items: center;
								border: 1PX solid;
							}

							#userPhoto>img {
								width: 100%;
								height: 100%;
								object-fit: cover;
							}

							#mypagePInfo {
								width: 50%;
								padding-left: 20px;
							}

							#mypageName {
								font-size: 20px;
								font-weight: bold;
								display: flex;
								margin-top: 20px;

							}

							#mypageName>div>span {
								margin-left: 30px;
							}

							#mypageNameEdit {
								display: flex;
								margin-left: 10PX;


							}

							#mypageBtn {
								background-color: #ea916e;
								width: 50px;
								border: 2px solid #ddd;
								border-radius: 11px;

							}

							#mypageEmpty {
								margin: 10px 0;
								border-bottom: 2px solid #ddd;
								width: 80%;
								height: 3px;
							}

							#mypageFollow,
							#mypageFolloing,
							#mypageJjim {
								font-size: 16px;
								margin: 5px 0;
								display: flex;
							}

							/* ------------------------------commantary */


							#mypageMainContent3 {
								width: 100%;
								border: 2px solid #ddd;
								border-radius: 10px;
								box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
								height: 200px;
								margin-bottom: 40px;
								box-sizing: border-box;
								display: flex;
							}



							/* #commantary *{
					border: 1px solid;
				} */
							#commantaryContentTitle1 {
								display: flex;
							}


							#texta {
								width: 100%;
								min-height: 100%;
								/* 최소 높이 설정 */
								resize: none;
								overflow: hidden;
								box-sizing: border-box;
								padding: 10px;
								font-size: 16px;
								line-height: 1.4;
								border-radius: 10px;

							}


							#commantaryContentTitle1>input {
								border: none;

							}

							#divWrap {
								display: flex;
							}

							#saveBtn {
								margin-left: auto;
								point: cursor;
							}

							#saveBtn>button {
								background-color: #ea916e;
								border-radius: 11px;
								border: 2px solid #ddd;
								height: 40px;
							}

							#boardarea {
								display: flex;
							}

							.mypageMainContent3_1_1 {
								width: 70%;
								margin: auto;
								text-align: center;
							}

							.pagination {
								margin-top: 20px;
							}

							.pagination button {
								padding: 8px 12px;
								margin: 2px;
								border: none;
								background-color: #ea916e;
								color: white;
								cursor: pointer;
							}

							.pagination button:disabled {
								background-color: #ccc;
							}

							#listTopmenu {
								display: flex;
								border: 1px solid;
							}

							.list {
								border-top: 1px solid #ccc;
							}

							.list-item {
								display: flex;
								justify-content: space-between;
								padding: 10px;
								border-bottom: 1px solid #ccc;
							}

							.pagination {
								margin-top: 20px;
								display: flex;
								justify-content: center;
								gap: 10px;
							}

							.pagination button {
								padding: 5px 10px;
								border: none;
								cursor: pointer;
							}

							.pagination .active {
								font-weight: bold;
								color: white;
								background: blue;
								border-radius: 3px;
							}

							.pagination .disabled {
								color: #ccc;
								cursor: not-allowed;
							}

							/* ===================================readGoal */
							#mypageMainContent4 {
								align-items: center;
								width: 100%;
								border: 2px solid #ddd;
								border-radius: 10px;
								box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
								height: 200px;
								margin-bottom: 40px;
								box-sizing: border-box;
								display: flex;
							}

							#readGoal1 {
								width: 20%;
								height: 100%;
							}

							#readGoal2 {
								width: 50%;
								height: 100%;
							}

							#redGaol1_1,
							#redGaol1_2,
							#redGaol1_3 {
								height: 33%;
								width: 100%;
								text-align: right;
								line-height: 50px;
								box-sizing: border-box;
							}

							#redGaol2_1,
							#redGaol2_2,
							#redGaol2_3 {
								height: 33%;
								width: 100%;
								line-height: 50px;
								padding-left: 20px;
								box-sizing: border-box;
							}

							/* ================================================마이페이지 개인정보 수정 버튼 모달 css */
							.modal {
								position: absolute;
								display: none;

								justify-content: center;
								top: 0;
								left: 0;

								width: 100%;
								height: 1800px;
								background-color: rgba(0, 0, 0, 0.4);
								z-index: 1;
							}

							.modal_body {
								position: fixed;
								top: 50%;
								width: 400px;
								padding: 40px;
								text-align: center;
								background-color: rgb(255, 255, 255);
								border-radius: 10px;
								box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
								transform: translateY(-50%);
							}

							.close-btn {
								position: absolute;
								top: 10px;
								right: 15px;
								font-size: 20px;
								font-weight: bold;
								cursor: pointer;
							}

							/* ================================================코멘터리(감상문) 목록보기 버튼 모달 css */
							.modalC {
								position: absolute;
								display: none;

								justify-content: center;
								top: 0;
								left: 0;

								width: 100%;
								height: 1800px;
								background-color: rgba(0, 0, 0, 0.4);
								z-index: 1;
							}

							.modal_bodyC {
								position: fixed;
								top: 50%;
								width: 1000px;
								height: 600px;
								padding: 40px;
								text-align: center;
								background-color: rgb(255, 255, 255);
								border-radius: 10px;
								box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
								transform: translateY(-50%);
							}

							.close-btnC {
								position: absolute;
								top: 10px;
								right: 15px;
								font-size: 20px;
								font-weight: bold;
								cursor: pointer;
							}

							/* ================================================읽기목표설정하기 목록보기 버튼 모달 css */
							.modalR {
								position: absolute;
								display: none;

								justify-content: center;
								top: 0;
								left: 0;

								width: 100%;
								height: 1800px;
								background-color: rgba(0, 0, 0, 0.4);
							}

							.modal_bodyR {
								position: fixed;
								top: 50%;
								width: 400px;
								height: 600px;
								padding: 40px;
								text-align: center;
								background-color: rgb(255, 255, 255);
								border-radius: 10px;
								box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
								transform: translateY(-50%);
							}

							.close-btnR {
								position: absolute;
								top: 10px;
								right: 15px;
								font-size: 20px;
								font-weight: bold;
								cursor: pointer;
							}

							table {
								width: 100%;
								border-collapse: collapse;
								margin-top: 10px;
							}

							th,
							td {
								border: 1px solid #ddd;
								padding: 10px;
								text-align: center;
							}

							th {
								background-color: #f4f4f4;
							}

							.user-info {
								border: 1px solid #ddd;
								padding: 15px;
								margin-bottom: 10px;
								border-radius: 5px;
								text-align: center;
							}

							.profile-img {
								width: 200px;
								height: 200px;
								border-radius: 50%;
								object-fit: cover;
								background-color: #f0f0f0;
							}

							.user-info input {
								width: 100%;
								padding: 8px;
								border: 1px solid #ccc;
								border-radius: 5px;
								margin-top: 5px;

							}



							div>input {
								box-sizing: border-box;
							}



							/* =========================================== jjim */
							#mypageMainContent5 {
								width: 100%;
								min-height: 400px;
								border: 2px solid #ddd;
								border-radius: 10px;
								box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
								margin-bottom: 40px;
								box-sizing: border-box;
								padding: 20px;
								overflow: auto;
								/* 이미지 많을 경우 스크롤 */
							}

							.jjim {
								display: grid;
								grid-template-columns: repeat(2, 1fr);
								/* 2열 구성 */
								gap: 20px;
							}

							.jjim img {
								width: 100%;
								aspect-ratio: 1/1;
								/* 정사각형 유지 */
								object-fit: contain;
								border: 1px solid #ccc;
								border-radius: 8px;
								cursor: pointer;
								transition: transform 0.2s ease-in-out;
							}

							.jjim img:hover {
								transform: scale(1.05);
							}

							#jjima {
								line-height: 50px;
							}

							#jjimCount {
								margin-left: 10px;
							}
						</style>
					</head>
					<meta charset="UTF-8">
					<!-- ------------------------------------------------------------------ -->

					<body>
						<%@ include file="../common/menubar.jsp" %>
							<!-- -------------------------------------------------------------------- -->
							<div class="wrap2">
								<div class="container">
									<div class="container1">

									</div>
									<div class="container2">
										<!-- --------------------------------mypage -->
										<div id="mypageMainContent1">
											<span>My Page</span>
										</div>
										<div id="mypageMainContent2">
											<div id="mypageMainContent2ProfilPhoto">
												<div id="userPhoto"><img src="<%=contextPath %>/resources/assets/chill.png" alt=""></div>
											</div>
											<div id="mypagePInfo">
												<div id="mypageName">
													<div><span>
															<%= loginMember.getMemName() %>
														</span></div>
													<div id="mypageNameEdit">
														<div id="saveBtn">
															<button class="btn-open-modal">수정하기</button>
															<div class="modal">


																<form action="<%=request.getContextPath()%>/update.me" method="post">
																	<div class="modal_body">
																		<span class="close-btn">&times;</span>
																		<h2>사용자 정보 변경</h2>

																		<!-- 프로필 사진 등 생략 가능 -->

																		<div class="user-info">
																			<div>비밀번호</div>
																			<input type="password" name="userPwd" placeholder="새 비밀번호 입력" required>
																		</div>

																		<div class="user-info">
																			<div>닉네임</div>
																			<input type="text" name="userNick" placeholder="새 닉네임 입력" required>
																		</div>

																		<div class="user-info">
																			<div>이메일</div>
																			<input type="email" name="userEmail" placeholder="새 이메일 입력" required>
																		</div>

																		<div class="user-info">
																			<div>전화번호</div>
																			<input type="text" name="userPhone" placeholder="새 전화번호 입력" required>
																		</div>

																		<input type="hidden" name="memNo" value="<%= loginMember.getMemNo() %>">

																		<button type="submit" class="btn">저장하기</button>
																	</div>
																</form>
															</div>
														</div>



														<button id="mypageBtn" onclick="onDelete()">탈퇴</button>

													</div>
												</div>
												<div id="mypageEmpty"></div>
												<div id="mypageJjim">
													<div id="jjima">찜 목록</div>
													<div id="jjimCount">
														<pre><%=jjimCount %>개 </pre>
													</div>

												</div>
											</div>
										</div>


										<%int memNo=loginMember !=null ? loginMember.getMemNo() : 0; %>
											<form action="<%= contextPath %>/Save.me" method="post" onsubmit="return onSave(event);">
												<div id="commantary">
													<div><span id="commantaryTitle">Commantary</span></div>

													<div id="divWrap">
														<div id="commantaryContentTitle1">
															<input type="hidden" name="memNo" value="<%= memNo %>">
															<span>- 저자 : </span>
															<input type="text" name="author" placeholder="저자를 입력해주세요. " required>
															<span>- 제목 : </span>
															<input type="text" name="title" placeholder="제목을 입력해주세요.  " required>
														</div>

														<div id="saveBtn">
															<button type="button" class="btn-open-modalC">목록보기</button>
															<button type="submit">저장하기</button>
														</div>
													</div>

													<div id="boardarea">
														<textarea name="commantary" id="texta" placeholder="감상문을 작성해주세요." oninput="autoResize(this)"
															required></textarea>
													</div>
												</div>
											</form>

											<!-- 모달 창 -->
											<div class="modalC" id="modalC">
												<div class="modal_bodyC">
													<span class="close-btnC">&times;</span>
													<h2>게시판 리스트</h2>
													<table>
														<thead>
															<tr>
																<th>글 번호</th>
																<th>제목</th>
																<th>저자</th>
																<th>작성 날짜</th>
															</tr>
														</thead>
														<tbody id="commentaryListBody">
															<!-- 감상문 리스트가 여기에 Ajax로 삽입됨 -->


														</tbody>
													</table>
												</div>
											</div>







											<!-- ----------------------------찜목록 -->
											<div>
												<div><span id="JjimTitle">찜 목록</span></div>

												<div id="mypageMainContent5">
													<div class="jjim" id="jjimContainer">
														<% if (jjimList !=null && !jjimList.isEmpty()) { for (String url : jjimList) { %>
															<img src="<%= url %>" alt="찜 도서 이미지" />
															<% } } else { %>
																<p>찜한 도서가 없습니다.</p>
																<% } %>
													</div>
												</div>

											</div>
									</div>
								</div>
							</div>




							<script>
								// ============================================== 유저 탈퇴 기능 함수(유효성 검사 추가됨 ㅎㅎㅎㅎ)
								function onDelete() {
									if (confirm("정말 탈퇴하시겠습니까?")) {
										const memNo = "<%= session.getAttribute("loginMember") != null ? ((Member)session.getAttribute("loginMember")).getMemNo() : 0 %>";

										location.href = "<%=contextPath%>/delete.me?no=" + memNo;
									}

								}

								// ============================================== 

								function onSave() {
									if (confirm("저장 하시겠습니까?")) {
										const memNo = "<%= session.getAttribute("loginMember") != null ? ((Member)session.getAttribute("loginMember")).getMemNo() : 0 %>";
										if (memNo === 0) {
											alert("로그인 정보가 유효하지않습니다.");
											return;
										}
										location.href = "<%= request.getContextPath()%>/Save.me?no=" + memNo;
									}
								}





								// ============================================== 마이페이지 유저정보 '수정하기'버튼 모달 스크립트
								const modal = document.querySelector('.modal');
								const btnOpenModal = document.querySelector('.btn-open-modal');
								const btnCloseModal = document.querySelector('.close-btn');

								btnOpenModal.addEventListener("click", () => {
									modal.style.display = "flex";
								});

								btnCloseModal.addEventListener("click", () => {
									modal.style.display = "none";
								});

								modal.addEventListener("click", (event) => {
									if (event.target === modal) {
										modal.style.display = "none";
									}
								});



								// ============================================== 마이페이지 감상문 '목록보기'버튼 모달 스크립트
								document.addEventListener("DOMContentLoaded", function () {
									const contextPath = "<%= contextPath %>";
									const modalC = document.querySelector(".modalC");
									const btnOpenModalC = document.querySelector(".btn-open-modalC");
									const btnCloseModalC = document.querySelector(".close-btnC");

									// [1] 목록보기 버튼 클릭 시 → Ajax로 감상문 목록 조회 + 모달 열기
									if (btnOpenModalC) {
										const memNo = <%= (loginMember != null) ? loginMember.getMemNo() : 0 %>;

										btnOpenModalC.addEventListener("click", function () {
											console.log("[클릭됨] 목록보기 버튼");

											fetch(contextPath + "/coList.my?memNo=" + memNo)
												.then(response => {
													if (!response.ok) throw new Error("HTTP 에러");
													return response.json();
												})
												.then(data => {
													console.log("[서버 응답]", data);

													const tbody = document.getElementById("commentaryListBody");
													tbody.innerHTML = "";

													if (data.length === 0) {
														tbody.innerHTML = '<tr><td colspan="4">감상문이 없습니다.</td></tr>';
													} else {
														data.forEach(item => {
															const row = `
                                <tr>
                                    <td>\${item.writeNo}</td>
                                    <td>\${item.title}</td>
                                    <td>\${item.author}</td>
                                    <td>\${item.writeDate}</td>
                                </tr>`;
															tbody.innerHTML += row;
														});
													}

													modalC.style.display = "flex"; // ✅ 데이터 불러온 뒤 모달 열기
												})
												.catch(error => {
													alert("감상문 목록을 불러오지 못했습니다.");
												});
										});
									}

									// [2] 모달 닫기 버튼 클릭
									if (btnCloseModalC) {
										btnCloseModalC.addEventListener("click", function () {
											modalC.style.display = "none";
										});
									}

									// [3] 모달 바깥쪽 클릭 시 닫기
									modalC.addEventListener("click", function (event) {
										if (event.target === modalC) {
											modalC.style.display = "none";
										}
									});
								});


								// ============================================== 마이페이지 유저정보 '수정하기'버튼 모달 스크립트
								const modalR = document.querySelector('.modalR');
								const btnOpenModalR = document.querySelector('.btn-open-modalR');
								const btnCloseModalR = document.querySelector('.close-btnR');

								btnOpenModalR.addEventListener("click", () => {
									modalR.style.display = "flex";
								});

								btnCloseModalR.addEventListener("click", () => {
									modalR.style.display = "none";
								});

								modalR.addEventListener("click", (event) => {
									if (event.target === modalR) {
										modalR.style.display = "none";
									}
								});


								//인기도서 리스트에서 찜한 책 myPage 로 넘어오게 하는 구문
								window.addEventListener('DOMContentLoaded', () => {
									const jjimList = JSON.parse(localStorage.getItem('jjimList')) || [];
									const container = document.getElementById('jjimContainer');
									const countBox = document.getElementById('jjimCount');

									if (jjimList.length === 0) {
										container.innerHTML = "<p>찜한 책이 없습니다.</p>";
										countBox.textContent = "0개";
										return;
									}

									jjimList.forEach(url => {
										const img = document.createElement('img');
										img.src = url;
										img.alt = "찜한 도서";
										img.style.width = "120px";
										img.style.margin = "10px";
										container.appendChild(img);
									});
								});
								// 찜 개수 표시
								const count = container.querySelectorAll('img').length;
								countBox.textContent = count + '개';



								function autoResize(textarea) {
									textarea.style.height = 'auto';
									textarea.style.height = textarea.scrollHeight + 'px';
								}

								// 저장 전 처리
								function onSave(event) {
									event.preventDefault(); // 폼 기본 제출 막기
									if (confirm("저장 하시겠습니까?")) {
										const memNo = "<%= session.getAttribute("loginMember") != null ? ((Member)session.getAttribute("loginMember")).getMemNo() : 0 %>";
										if (memNo === "0") {
											alert("로그인 정보가 유효하지 않습니다.");
											return false;
										}
										// 폼 직접 제출
										event.target.closest('form').submit();
									}
									return false;
								}
							</script>



							<%@ include file="../common/footerbar.jsp" %>
					</body>

					</html>