<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function profileModify() {
		location.href = "../../insertProfile.do";
	}
</script>
 <%@include file="/views/header.jsp"%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


</head>
<body>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!------ Include the above in your HEAD tag ---------->
<%@include file="/views/navHeader.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
		      <a href="../../myProfile.do" class="list-group-item list-group-item-action active">My Profile 메인</a>
              <a href="../../insertProfile.do" class="list-group-item list-group-item-action">프로필 수정</a>
              <a href="../../ModifyPhoneMember.do" class="list-group-item list-group-item-action">핸드폰 변경</a>
              <a href="../../ModifyPwdMember.do" class="list-group-item list-group-item-action">비밀번호 변경</a>
              <a href="../../ModifyAddressMember.do" class="list-group-item list-group-item-action">주소 변경</a>
              <a href="../../profileImageInsert.do" class="list-group-item list-group-item-action">이미지 업로드</a>
              <a href="../../profileImageList.do?m_id=${member.m_id }" class="list-group-item list-group-item-action">프로필 이미지 관리</a>
              <a href="../../HostImageList.do?m_id=${member.m_id }" class="list-group-item list-group-item-action">호스트 이미지 관리</a>
              <a href="../../getReceiveMessageList.do" class="list-group-item list-group-item-action">받은 쪽지함</a>
              <a href="../../getSendMessageList.do" class="list-group-item list-group-item-action">보낸 쪽지함</a>
              <a href="../../myPost.do?m_id=${member.m_id }&cPage=1" class="list-group-item list-group-item-action">내 글</a>
              <a href="../../myPost2.do?m_id=${member.m_id }&cPage=1" class="list-group-item list-group-item-action">내 댓글</a>
              <a href="../../loginRecordList.do?ll_id=${member.m_id }&cPage=1" class="list-group-item list-group-item-action">로그인 기록</a>
              <a href="../../DeleteMember.do?m_id=${member.m_id }" class="list-group-item list-group-item-action">회원탈퇴</a>
              

              
            </div> 
            
		</div>
		
		<div class="col-md-9">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <h4><img src="/views/img/profileIcon.png" style="width: 50px; height: 50px;"> my Profile</h4>
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-12">
		                    <form>
                              <table class="table">
                              	<tr>
                              		<td colspan="2" style="text-align: center;"><h5 class="text-muted">Profile Image</h5><br><img src="${profile.p_route }" style="width:250px; height: 250px;" class="rounded"/></td>
                              		<td colspan="2" style="text-align: center;"><h5 class="text-muted">Host Image</h5><br><img src="${hostImg.h_route }" style="width:250px; height: 250px;" class="rounded"/></td>
                              	</tr>
                              	<tr>
                              		<th style="width: 22%; text-align: center;" >이름 </th>
                              		<td style="width: 28%">${member.m_name }</td>
                              		<th style="width: 18%; text-align: center;">취미 </th>
                              		<td style="width: 32%">${profile.p_hobby }</td>
                              	</tr>
                              	<tr>
                              		<th style="width: 22%; text-align: center;" >사용가능 언어 </th>
                              		<td style="width: 28%">${profile.p_language }</td>
                              		<th style="width: 18%; text-align: center;">직업 </th>
                              		<td style="width: 32%">${profile.p_job }</td>
                              	</tr>
                              	<tr>
                            		<th style="width: 22%; text-align: center;">방문해본 국가</th>
                            		<td colspan="3">${profile.p_visitcountry }</td>
                            	</tr>
                            	<tr>
                            		<th style="width: 22%; text-align: center;">사이트방문 목적</th>
                            		<td colspan="3">${profile.p_purpose }</td>
                            	</tr>
                              	<tr>
                              		<th style="width: 22%; text-align: center;" >나에 대해서 </th>
                              		<td colspan="3">${profile.p_aboutme }</td>  		
                              	</tr>  	
                              </table>
                              
                              
                              
                              
                            </form>
		                </div>
		            </div>
		            
		        </div>
		    </div>
		</div>
	</div>
</div>
<%@include file="/views/footer.jsp"%>
</body>
</html>