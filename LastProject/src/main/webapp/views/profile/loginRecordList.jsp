<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>로그인 기록</title>

	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>로그인 기록</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
		      <a href="../../sub2.do" class="list-group-item list-group-item-action">메인페이지</a>
              <a href="../../myProfile.do" class="list-group-item list-group-item-action">마이 프로필</a>
              <a href="../../getReceiveMessageList.do" class="list-group-item list-group-item-action active">받은 쪽지함</a>
              <a href="../../getSendMessageList.do" class="list-group-item list-group-item-action">보낸 쪽지함</a>
              <a href="../../insertProfile.do" class="list-group-item list-group-item-action">프로필 수정</a>
              <a href="../../ModifyPwdMember.do" class="list-group-item list-group-item-action">비밀번호 변경</a>
              <a href="../../ModifyPhoneMember.do" class="list-group-item list-group-item-action">핸드폰 변경</a>
              <a href="../../ModifyAddressMember.do" class="list-group-item list-group-item-action">주소 변경</a>
              <a href="../../profileImageInsert.do" class="list-group-item list-group-item-action">이미지 업로드</a>
     		  <a href="../../profileImageList.do?m_id=${member.m_id }" class="list-group-item list-group-item-action">프로필 이미지 관리</a>
              <a href="../../HostImageList.do?m_id=${member.m_id }" class="list-group-item list-group-item-action">호스트 이미지 관리</a>
              <a href="#" class="list-group-item list-group-item-action">내 글</a>
              <a href="#" class="list-group-item list-group-item-action">내 댓글</a>
              
              
            </div> 
		</div>

		<div class="col-md-9">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <h4>받은 쪽지목록</h4>
		                    <hr>
		                </div>
		            </div>
	             </div>
<div id="container">
	
	<!-- 데이타 표시 -->
	<form>
	<table class="table">
		<thead class="thead-light">
		<tr>
			<th width="50"style="text-align :center;">결과</th>
			<th width="80"style="text-align :center;">아이피</th>
			<th width="250" style="text-align :center;">기기정보</th>
			<th width="100"style="text-align :center;">날짜</th>
			<th width="100"style="text-align :center;">접속 국가</th>
		</tr>
		</thead>
		<c:forEach var="logList" items="${logList }">
		<tr>
			<td style="text-align :center;">${logList.ll_result }</td>
			<td style="text-align :center;">${logList.ll_ip }</td>
			<td style="text-align :center;">${logList.ll_device }</td>
			<td style="text-align :center;"><fmt:formatDate value="${logList.ll_date }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
			<td style="text-align :center;">${logList.ll_country }</td>
		</tr>
		</c:forEach>
	</table>
	</form>
				</div>
			</div> 
		</div>
	</div> 
</div>
</body>
</html>