<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <meta charset="utf-8">
   <meta name="author" content="Kodinger">
   <meta name="viewport" content="width=device-width,initial-scale=1">
   <title>회원가입</title>
   <link rel="stylesheet" type="text/css" href="views/bootstrapModal/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="views/cssModal/my-login.css">
   
   <link rel="stylesheet" href="views/datepicker/public/theme/css/t-datepicker.min.css">
   <link rel="stylesheet" href="views/datepicker/public/theme/css/themes/t-datepicker-bluegrey.css">
   <!-- blue, bluegrey, cyan, green, lime, main, orange, purple, teal, yellow -->
   
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script src="views/datepicker/public/theme/js/t-datepicker.min.js"></script>

<script>
function getIpCountry() {
	$.get("http://ipinfo.io", function(response){
		var lv_ip = response.ip;
		var lv_country = response.country;
		
		var userAgent = navigator.userAgent.toLowerCase();
		var lv_browser = "";
		
		if(userAgent.match('chrome')){
			lv_browser = "크롬"
		} else if(navigator.appName == 'Netscape' && userAgent.search('trident') != -1) {
			lv_browser = "IE"
		} else if(userAgent.match('Firefox')) {
			lv_browser = "파이어폭스"
		} else if(userAgent.match('safari')) {
			lv_browser = "사파리"
		} else if(userAgent.match('opera')) {
			lv_browser = "오페라"
		} else {
			lv_browser = "기타"
		}
		
		var newHref = "../logVisit.do?lv_ip=" + lv_ip + "&lv_country=" + lv_country + "&lv_browser=" + lv_browser;
		
		$("#main").attr("href", newHref);
		
	}, "jsonp");
}
</script>
</head>
<body onload="getIpCountry()">
	<h2>ㅎㅇ</h2>
	
	<a href="#" id="main">Main테스트</a>
	
	<a href="../getTravelersList.do">travelers</a>
	<a href="../insertMember.do">Register</a> 
	<a href="../loginMember.do">Login</a> 
	<a href="../logoutMember.do">logout</a> 
	<a href="../sub2.do">sub페이지</a>  
	<a href="../findIdMember.do">아이디 찾기페이지</a>  
	<a href="../findPwdMember.do">비밀번호 찾기페이지</a>  
	<a href="../google.do">구글</a>
	<a href="/views/google/googleLast.jsp">구글</a>
	<a href="../ModifyPwdMember.do">비밀번호 수정</a>
	<a href="admin/testAdmin.jsp">관리자 페이지</a>
	<a href="../testImage.do">테스트이미지</a>
	<a href="../naverLogin.do">네이버 로그인</a>
	<a href="../googleLogin.do">구글 로그인</a>
	<a href="../facebookLogin.do">페이스북 로그인</a>
	<a href="../kakaoLogin.do">페이스북 로그인</a>
	<a href="../NaverRegister.do">네이버회원가입</a>
	<p>세션 : [${m_id}] 앙기무리</p>
	
</body>
</html>