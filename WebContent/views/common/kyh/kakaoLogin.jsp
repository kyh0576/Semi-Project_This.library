<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    <a id="kakao-login-btn" href="">
        <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
          alt="카카오 로그인 버튼" />
      </a>
      <p id="token-result"></p>
    
      <button class="api-btn" onclick="kakaoLogout()">로그아웃</button>
    <script>
        // 카카오 초기화
        Kakao.init('93a0920238e62f6613575ad15d4e692c');
        console.log( Kakao.isInitialized() ); // 초기화 판단여부

          //카카오 로그인 후 토근 값 저장.
          function loginWithKakao() {
            Kakao.Auth.login({
                success: function (authObj) {
                    console.log(authObj); // access토큰 값
                    Kakao.Auth.setAccessToken(authObj.access_token); // access토큰값 저장
                    console.log("이다음인포")
                    getInfo();
                },
                fail: function (err) {
                    console.log(err);
                }
            });
        }

         // 엑세스 토큰을 발급받고, 아래 함수를 호출시켜서 사용자 정보를 받아옴.
         function getInfo() {
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (res) {
                    console.log(res);
                    // 이메일, 성별, 닉네임, 프로필이미지
                    var email = res.kakao_account.email;
                    var gender = res.kakao_account.gender;
                    var profile_nickname = res.kakao_account.profile.nickname;
                    var profile_image = res.kakao_account.profile.thumbnail_image_url;
                    var birthday = res.kakao_account.birthday;

                    console.log(email, gender, profile_nickname, profile_image, birthday);
                    alert(email + ',' +  gender + ',' +  profile_nickname + "," + profile_image + ',' +  birthday);
                },
                fail: function (error) {
                    alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
                }
            });
        }

        // 로그아웃 기능 - 카카오 서버에 접속하는 엑세스 토큰을 만료, 사용자 어플리케이션의 로그아웃은 따로 진행.
        function kakaoLogout() {
            if (!Kakao.Auth.getAccessToken()) {
                alert('Not logged in.');
                return;
            }
            Kakao.Auth.logout(function() {
                alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
            });
        }
    </script>
</body>
</html>