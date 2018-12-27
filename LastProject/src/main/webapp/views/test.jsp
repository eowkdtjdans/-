<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Commit-Test</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function init() {
	$.get("http://ipinfo.io", function(response){
		var lv_ip = response.ip;
		var lv_country = response.country;
		var newHref = "../LogVisit.do?lv_ip=" + lv_ip + "&lv_country=" + lv_country;
		
		$("#main").attr("href", newHref);
	}, "jsonp");
}
</script>
</head>
<body onload="init()">
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
	<p>세션 : [${m_id}] 앙기무리</p>
</body>
</html>