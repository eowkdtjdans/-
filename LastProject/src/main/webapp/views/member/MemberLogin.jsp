 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

   <%@include file="/views/header.jsp"%>

  <script><%@include file="/views/headerScript.jsp"%></script>




<script>
	function login(frm) {
	var str = $("#form").serialize();
		$.ajax({
			async: true,
			type : "POST",
			dataType : "json",
			data : str,
			url : '../../loginMemberJson.do',
			success : function(data) {
				
				$.get("http://ipinfo.io", function(response){
					localStorage.ll_ip = response.ip;
					localStorage.ll_country = response.country;
					localStorage.ll_device = navigator.userAgent;
					localStorage.ll_result = "로그인 테스트";
				}, "jsonp");
				
				var ll_id = frm.m_id.value;
				var ll_ip = localStorage.ll_ip;
				var ll_country = localStorage.ll_country;
				var ll_device = localStorage.ll_device;
				
				if (data.cnt > 0) {
					$.ajax({
						type : "GET",
						url : "../logLogin.do?ll_id="+ll_id+"&ll_ip="+ll_ip+"&ll_country="+ll_country+"&ll_device="+ll_device+"&ll_result=로그인성공",
						success : function(){
							frm.action = "../../loginMember.do";
							frm.submit();
						}
					});
				} 
				else {
					$.ajax({
						type : "GET",
						url : "../logLogin.do?ll_id="+ll_id+"&ll_ip="+ll_ip+"&ll_country="+ll_country+"&ll_device="+ll_device+"&ll_result=로그인실패",
						success : function(){
							alert("아이디 또는 비밀번호가 일치하지않습니다. 다시 입력해주세요.");
							
							frm.m_id.value = "";
							frm.m_pwd.value = "";
							frm.m_id.focus();
						}
					});
				}
				
			}
		});

	};
	
	function getIpCountry(ll_result, ll_id) {
		$.get("http://ipinfo.io", function(response){
			var ll_ip = response.ip;
			var ll_country = response.country;
			var ll_device = navigator.userAgent;
			
			location.href = "../logLogin.do?ll_id="+ll_id+"&ll_ip="+ll_ip+"&ll_country="+ll_country+"&ll_device="+ll_device+"&ll_result="+ll_result;
			
		}, "jsonp");
	}
	
	
	function enterkey(event) {
		if(event.keyCode == 13) {
			$("#loginBtn").click();
		}
	}

	
</script> 

	<!-- 이거 추가시 네비 이상해짐 -->
	<!-- <link rel="stylesheet" type="text/css" href="views/cssModal/my-login.css"> -->
</head>
<body>




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
	
		<li class="menu-has-children"><a><img src="${getProfileImageRoute.p_route }" style="width: 45px; height: 45px;" class="rounded-circle" id="navProfileImg"></a>
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
  </header>




	
		

<br><br>        
   <div class="container">  
   <div class="row">  
         <div class="col-md-4"></div> 
         <div class="col-md-4">
            <h4 style="text-align : center;">로그인</h4>
            <form onsubmit="return false"method="POST" id="form"  >
               <div class="form-group">
                  <label for="email">아이디</label>
                  <input type="email" class="form-control" name="m_id" onkeypress="enterkey()" required autofocus>
               </div>
               
               <div class="form-group">
                  <label for="password">비밀번호</label>
                  <input type="password" class="form-control" name="m_pwd" onkeypress="enterkey()" required data-eye>
               </div>
               
               
               <div class="form-group">
                   <button type="submit" id="loginBtn" class="btn btn-outline-secondary btn-block" onclick="login(this.form)" >
                     Login
                  </button> 
               </div>
            </form>
            
            <div class="text-muted" style="text-align: center; font-size: 0.95em;">
	            <a href="../../findIdMember.do">아이디 찾기 | </a>
	            <a href="../../findPwdMember.do">비밀번호 찾기 | </a>
	            <a href="../../insertMember.do">회원가입</a>
            </div>
            
         </div> 
         <div class="col-md-4"></div> 
   </div>   
   </div>
<br><br>      

	
 <%@include file="/views/footer.jsp"%>


</body>
</html>