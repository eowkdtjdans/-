<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
function getKakaotalkUserProfile(){
        Kakao.API.request({
		url: '/v1/user/me',
		success: function(res) {
	                var sPerson = JSON.stringify(res);
			var oPerson = JSON.parse(sPerson);
			
                          // 사용자 정보
                          console.log(oPerson.kaccount_email);
                          Kakao.Auth.logout(function () {  alert("카카오로그아웃");});
                   },
		fail: function(error) {
			// console.log(error);
		
		}
	});
}
</script>
</body>
</html>