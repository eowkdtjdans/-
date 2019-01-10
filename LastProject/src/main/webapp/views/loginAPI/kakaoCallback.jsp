 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>로그인</title>



<!-- <script>
$(document).ready(function() { 
	
	var kakaoEmail = res.kaccount_email;
	alert("kakaoEmail : " + kakaoEmail);
	
	$.ajax({
  		async : true,
  		type : "POST",
  		dataType : "json",
  		data : kakaoEmail,
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
  	});
}); 

</script>  -->

<!--  <script>
function ApiRegisterCheck() {
	
	var kakaoEmail = res.kaccount_email;
	alert("kakaoEmail : " + kakaoEmail);
	$("#kakaoEmail").val(kakaoEmail);
	$("#kakaoEmail").html(kakaoEmail);
	$.ajax({
  		async : true,
  		type : "POST",
  		dataType : "json",
  		data : kakaoEmail,
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
  	});
	
}
</script>  -->

<script>

function alert() {
	alert("alert"); //클릭도안댐
}

function console() {
	console.log("console"); //클릭도안댐
}
</script>


</head>

<body>
<p>앙기모띠</p>

	<a href="" onclick="alert()">alert클릭</a>
	<a href="" onclick="console()">console클릭</a>
	
	<input type="text" id="kakaoEmail" name="m_id"/>

</body >
</html>