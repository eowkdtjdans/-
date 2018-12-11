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
	<title>아이디 찾기</title>
	<link rel="stylesheet" type="text/css" href="views/bootstrapModal/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="views/cssModal/my-login.css">
	
	
<script>

	function findId(frm) {
		/* var str = $("#form").serialize();
		alert(str); */
		var obj = new Object(); // JSON형식으로 변환 할 오브젝트
		   obj.m_name = frm.m_name.value; // form의 값을 오브젝트에 저장
		   obj.m_phone = frm.m_phone.value;
		   var json_data = JSON.stringify(obj); // form의 값을 넣은 오브젝트를 JSON형식으로 
		$.ajax({
			async : true,
			type : "POST",
			dataType : "json",
			data : json_data,
			url :  "../../findIdMemberJson.do",
			contentType: "application/json; charset=UTF-8",
			success : function(data) {
				consoloe.log(data);
				if (data.cnt > 0)  {
					alert(data);
					frm.action="../../findIdMember.do";
					frm.submit();
					return false;
				} else {
					alert("회원정보가 없습니다. 다시입력하세요.");
					frm.m_tempId.value = "";
					frm.m_name.value = "";
					frm.m_phone.value = "";
					frm.m_tempId.focus();
				}
					
			}
		})
		
	};
</script>	
	
	
</head>
<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center align-items-center h-100">
				<div class="card-wrapper">
					<div class="brand">
						<img src="../imgModal/logo.jpg" alt="bootstrap 4 login page">
					</div>
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">아이디 찾기</h4>m_tempId
							<form method="POST" class="my-login-validation">
								<div class="form-group">
									<label for="m_tempId">임시 이메일</label>
									<input id="m_tempId" type="text" class="form-control" name="m_tempId" placeholder="임시이메일을 입력하세요." required autofocus>
								</div>
								
								<div class="form-group">
									<label for="m_name">성함</label>
									<input id="m_name" type="text" class="form-control" name="m_name" placeholder="이름을 입력하세요." required autofocus>
								</div>
								
								<div class="form-group">
									<label for="m_phone">전화번호</label>
									<input id="m_phone" type="text" class="form-control" name="m_phone" placeholder="전화번호를 입력하세요." required autofocus>
								</div>

								<div class="form-group m-0">
									<button type="submit" class="btn btn-primary btn-block" onclick="findId(this.form)">
										아이디 찾기
									</button>
								</div>
							</form>
						</div>
					</div>
					<div class="footer">
						Copyright &copy; 2018 &mdash; 방국봉
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
	<script src="js/my-login.js"></script>
</body>
</html>