<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@include file="/views/header.jsp"%>

<script>
	function profileModify() {
		location.href = "../../insertProfile.do";
	}
</script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


</head>
<body>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!------ Include the above in your HEAD tag ---------->




<header id="header">
  <form id="noticeMessage" method="GET">
    <div class="container-fluid">
      <input type="hidden" id="receive_receiver" name="receive_receiver" value="${member.m_id }" />
      <div id="log" class="pull-left">
        <img src="views/img/happy.png" id="happy"><a href="../sub2.do" class="scrollto" id="mainLogo">&nbsp;Gukbong WorlD</a>        
      </div>
    </div>
  </form>
      
      <form action="../sub.do" method="post">
      <table class="border-none">
         <tr>
            <td id="td1">             
               <select id="condition" name="searchCondition">         
                  <option value="find_travler">여행자검색
                  <option value="find_host">호스트검색
                  <option value="find_event">이벤트검색
                  <option value="find_advice">현지정보검색
               </select>
               
               <input id="autocomplete" placeholder="" type="text" name="searchKeyword">
               
               <input class="field" id="lat" type="hidden" name="lat"/>
               <input class="field" id="lng" type="hidden" name="lng"/>              
               <!-- <input type="submit" id="search"> -->
               
               <input  style="width: 30px; height: 30px;"  TYPE="IMAGE" src="views/img/search.png" name="Submit" value="Submit" align="absmiddle" id="search">

            </td>
         </tr>
      </table>
   </form>

    

         
<nav id="nav-menu-container">
	<ul class="nav-menu">
	
	<c:if test="${empty member.m_id}">
		<li><a href="../../loginMember.do" >로그인</a></li>
		<li><a  href="../../insertMember.do" >회원가입</a></li>
		<li><a href="../../findIdMember.do">아이디찾기</a></li >
	    <li><a href="../../findPwdMember.do">비밀번호찾기</a></li>
	</c:if>	
	
	<c:if test="${!empty member.m_id}">
		<li>
			<div>
			<strong>
			<span style="color: red;">W</span>
			<span style="color: blue;">e</span>
			<span style="color: darkviolet;">l</span>
			<span style="color: #FFC100;">c</span>
			<span style="color: green;">o</span>
			<span style="color: orange;">m</span>
			<span style="color: navy;">e</span>			
			&nbsp;&nbsp;			
			${member.m_id } 님 
			</strong>
			</div>
		</li>
	
		<li class="menu-has-children"><img src="${getProfileImageRoute.p_route }" style="width: 45px; height: 45px;" class="rounded-circle" id="navProfileImg"></a>
          <ul>                                      
            <li><a  href="../../myProfile.do" >마이 프로필</a></li> 
            <li><a href="../../logoutMember.do">로그아웃</a></li>            
          </ul> 
        </li>
               
   		<li>    
          <span class="fa-layers fa-fw">
           <a href="../../getReceiveMessageList.do">
          <i class="far fa-envelope fa-2x"></i>
          <span class="fa-layers-counter" style="color:red;" id="noticeMessageCount"></span>
          </a>
         </span>
     	 </li>         
	</c:if>
	</ul> 
</nav>               
<hr>
  </header><!-- #header -->


<br>  
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