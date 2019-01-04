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

<script type="text/javascript"
  src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
  charset="utf-8"></script>
<script type="text/javascript"
  src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
html, div, body, h3 {
  margin: 0;
  padding: 0;
}

h3 {
  display: inline-block;
  padding: 0.6em;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    var name = ${result}.response.name;
    var email = ${result}.response.email;
    var gender = ${result}.response.gender;
    $("#m_name").html("환영합니다. "+name+"님");
    $("#m_id").html(email);
    $("#m_gender").html(gender);
  	
    });
  //location.href = "${pageContext.request.contextPath}/";
</script>

<script>
function naverRegister(frm) {
	var str = $("#form").serialize();
	alert(str);
	var m_name = frm.m_name.value;
	alert(m_name);
}
</script>
</head>
<body>
  <div
    style="background-color: #15a181; width: 100%; height: 50px; text-align: center; color: white;">
    <h3>Naver_Login Success</h3>
  </div>
  <br>
  <div id="div">
  
  </div>
  <form method="POST" class="my-login-validation" id="form">
	<div>
	  <h2 style="text-align: center" id="m_name"></h2>
	  <h4 style="text-align: center" id="m_id"></h4>
	  <h4 style="text-align: center" id="m_gender"></h4>
	  <input name="m_pwd" type="password">
	  <input name="m_name" value="${result}.name" type="hidden">
	  <input name="m_email" value="${result}.email" type="hidden">
	  <input name="m_gender" value="${result}.gender" type="hidden">
	   <div class="form-group m-0">
         <button type="button" class="btn btn-primary btn-block" onclick="naverRegister(this.form)">
          			  회원가입
         </button>
       </div>
	  
	</div>
  </form>
</body>
</html>