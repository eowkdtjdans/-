<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>핸드폰번호 변경</title>

<script>
	function ModifyPhone(frm) {
	 	var phone = document.getElementById("m_phone").value;
	 	var phoneModify = document.getElementById("phoneModify").value;
	 	var phoneCheck = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
	
	 	var str = $("#ModifyPhoneForm").serialize();

		$.ajax({
			async : true,
			type : "POST",
			dataType : "json",
			data : str,
			url : "../../MemberModifyPhoneJson.do",
			success : function(data) {
				 if (data.cnt == 0) {
					   alert("등록된 핸드폰번호가 일치하지않습니다. 다시 입력하세요.");
						frm.m_phone.value = "";
						frm.phoneModify.value = "";
						frm.m_phone.focus();
				   } else if(phoneCheck.test(phoneModify)==false || phoneModify == ""){
						alert("변경할 핸드폰번호를 제대로 기입하세요.");
						 $("#phoneModify").focus();
		                 $("#phoneModify").val("");
						return false;
				   } else {
					    alert("변경이 완료되었습니다.");
						frm.action = "../../ModifyPhoneMember.do";
					    frm.submit();    
					    return false;
				   }
			}
				 
		})
		
	};
		
</script>
	<!--			
				기존비밀번호 입력페이지 - > .do -> dao mapper - > 컨트롤러에서 찾고 -> view -> 
				다음페이지(변경할 비밀번호페이지) - > .do ->service dao mapper -> ->컨트롤러에서 데이터 반영 후 views
			
				ajax로 이 정보가 데이터베이스에 있는지 select - > 이게 있다면 -> success로 가는건데 여기에서 다른 컨트롤러가는거에여
				수정을 할 컨트롤러.do를 작성
	
	  -->
	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>비밀번호 변경 페이지</title>
	<link rel="stylesheet" type="text/css" href="views/bootstrapModal/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="views/cssModal/my-login.css">
</head>

<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand">
					</div>
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title" style="text-align : center;">핸드폰 번호 변경</h4>
							<form method="POST" class="my-login-validation" id="ModifyPhoneForm">
								<input id="m_id" type="hidden" class="form-control" name="m_id" value="${member.m_id }" required autofocus>
								
								<div class="form-group">
									<label for="m_phone">기존 핸드폰 번호</label>
									<input id="m_phone" type="text" class="form-control" name="m_phone" required autofocus>
								</div>

								<div class="form-group">
									<label for="phoneModify">변경할 핸드폰 번호</label>
									<input id="phoneModify" type="text" class="form-control" name="phoneModify" required data-eye>
								</div>
								
								<div class="form-group m-0">
									<button type="button" class="btn btn-primary btn-block" onclick="ModifyPhone(this.form)">
										핸드폰 변경
									</button>
								</div>
								
								<div id="div">
									
								</div>
					
							</form>
						</div>
					</div>
					<div class="footer">
						Copyright &copy; 2018 &mdash; 국봉쓰
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/my-login.js"></script>
</body>
</html>