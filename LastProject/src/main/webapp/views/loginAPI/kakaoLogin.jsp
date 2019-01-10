 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>로그인</title>


<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>



<body>

<a id="kakao-login-btn"></a>

<a href="http://developers.kakao.com/logout"></a>
 
 
<!-- Kakao Login -->

<script type="text/javascript">
      // 사용할 앱의 JavaScript 키를 설정해 주세요.
      Kakao.init('b1e43adeb3cee961d9cd07fd536a4f4b');
      // 카카오 로그인 버튼을 생성합니다.
      Kakao.Auth.createLoginButton({
        container: '#kakao-login-btn',
        success: function(authObj) {
          // 로그인 성공시, API를 호출합니다.
          Kakao.API.request({
        	  url: '/v1/user/me',
            success: function(res) {
            	var kakaoInfo = JSON.stringify(res.properties);
            	var kakaoEmail = JSON.stringify(res.kaccount_email);
            	var kakaoEmail2 = res.kaccount_email;
            	alert("kakaoEmail2 : " + kakaoEmail2); //이건"" 없음
            	alert("kakaoEmail : " + kakaoEmail); //이건 "" 있음
           	
           	 /* alert("kakaoInfo : " + kakaoInfo);
		 	  alert("이메일 : " + JSON.stringify(res.kaccount_email)); //이메일 나옴
              alert("아이디 : " + JSON.stringify(res.id)); //1234523424
              alert("프로필이미지 : " + JSON.stringify(res.properties.profile_image)); //사진.jpg
              alert("닉네임 : " + JSON.stringify(res.properties.nickname)); //"이준연"
              alert("성별 : " + JSON.stringify(res.properties.gender));  //안나오고
              alert("전체 : " + JSON.stringify(res.properties)); // */
             
              //location.href = "../../kakaoCallback.do";
              location.href = "/views/loginAPI/kakaoCallback.jsp";
             /* 	 $.ajax({
             		async : true,
             		type : "POST",
             		dataType : "json",
             		data : kakaoEmail2,
             		url : '../../checkMemberJson.do',
             		success : function(data) {
             			if (data.cnt >= 1) {
        					alert("사이트 이용 시 로그인을 해야 가능합니다.");
        					location.href = "../../loginMember.do";
        				} else if(data.cnt == 0) {
        					alert("사이트 이용 시 회원가입을 해야 사용 가능합니다.");
        					location.href = "../../kakaoRegister.do";
        				} 
             		}
             	}); */
              
            },
            
          });
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });

</script>

</body>
</html>