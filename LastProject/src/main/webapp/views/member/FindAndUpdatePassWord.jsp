<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">

	<!-- Font Awesome CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <meta charset="utf-8">
   <meta content="" name="keywords">
	<meta content="" name="description">
   <meta name="viewport" content="width=device-width,initial-scale=1">
   <title>이메일 인증</title>
   <!-- <link rel="stylesheet" type="text/css" href="views/bootstrapModal/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="views/cssModal/my-login.css"> -->
   
 <%@include file="/views/header.jsp"%>

<script>

	function findPwdAndUpdate(frm) {
		var certifyCode = frm.certifyCode.value;
		var findPwdEmailCheck = "${findPwdEmailCheck}";
		var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
		var m_id = frm.m_id.value;
		var m_pwd = frm.m_pwd.value;
		var m_pwd2 = frm.m_pwd2.value;
		 if(frm.m_pwd.value == "" || frm.m_pwd.value == null){
			   alert("변경할 비밀번호를 기입하세요.");
				frm.m_pwd.value="";
				frm.m_pwd2.value="";
				frm.m_pwd.focus();
				return false; 
	   } else if (frm.m_pwd.value.length<8 ) {
			alert("비밀번호를 8~16자리로 설정해주세요.");
        	frm.m_pwd.value = ""; 
        	frm.m_pwd2.value = ""; 
			frm.m_pwd.focus();
			return false;
	   }
		else if (findPwdEmailCheck == certifyCode && m_pwd == m_pwd2) {
			alert("비밀번호가 변경되었습니다.");
		frm.action = "../../PwdUpdate.do";
		frm.submit();
		} else {
			alert("인증번호 또는 비밀번호가 일치하지않습니다.");
			frm.certifyCode.value = "";
			frm.m_pwd.value = "";
			frm.m_pwd2.value = "";
			frm.certifyCode.focus();
			return false;
		}
	};
	function enterkey(event) {
		if(event.keyCode == 13) {
			$("#findBtn").click();
		}
	}
	
	
	
	
	$(function(){
		   $("#condition").change(function(){
		      var condition = $("#condition").val();
		      
		      if(condition == "find_advice") {
		         $("#autocomplete").removeAttr("name");
		         $("#autocomplete").hide();
		         $("<input type='text' id='advice' name='searchKeyword'>&nbsp;&nbsp;").insertBefore("#search");
		      } else {
		         $("#advice").remove();
		         $("#autocomplete").show();
		         $("#autocomplete").attr("name", "searchKeyword");
		      }
		   })
		   
		})

	function noticeMessage() {
	      var noticeMessage = $("#noticeMessage").serialize();
	      var receive_receiver =$("#receive_receiver").val();
	       
	         $.ajax({
	         async : true,
	         type : "POST",
	         dataType : "json",
	         data : noticeMessage,
	         url : "../../noticeMessageJson.do",
	         success : function(data) {
	            if (data.cnt > 0) {
	               $("#noticeMessageCount").append(data.cnt);
	               $("#noticeMessageCount2").append(data.cnt);
	               setInteval(function() {
	                  noticeMessage()
	               }, 3000);
	       
	            }
	         }
	         
	         
	      });    
	   }
</script>
   
   
</head>
<body onload="noticeMessage()">


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
  </header>



<br><br>
      <div class="container">
         <div class="row">
         	<div class="col-md-4"></div>   
  
            <div class="col-md-4">                 
                 <h4 style="text-align: center;">이메일 인증을 완료해주세요</h4>
                 <br>
                 <form method="POST" onsubmit="return false;" class="my-login-validation" id="findId">
                
				<input id="m_id"  value="${findPwdId.m_id }" type="hidden" class="form-control" name="m_id">
           	         
                    <div class="form-group" >
                       <label for="certifyCode">인증번호</label>
                       <input id="certifyCode" onkeypress="enterkey()"type="text" class="form-control" name="certifyCode" placeholder="인증번호를 입력하세요." required autofocus>
                    </div>
                    
                      <div class="form-group" >
                       <label for="m_pwd">변경할 비밀번호</label>
                       <input id="m_pwd" onkeypress="enterkey()"type="password" class="form-control" name="m_pwd" placeholder="비밀번호를 입력하세요." required autofocus>
                    </div>
                    
                    
                      <div class="form-group" >
                       <label for="m_pwd2">비밀번호 확인</label>
                       <input id="m_pwd2" onkeypress="enterkey()"type="password" class="form-control" name="m_pwd2" placeholder="비밀번호 확인" required autofocus>
                    </div>
                    
                    

                    <div class="form-group m-0">
                       <button type="submit" id="findBtn" class="btn btn-outline-secondary btn-block" onclick="findPwdAndUpdate(this.form)">
                         확인
                       </button>
                    </div>
                 </form>               
            </div>

         	<div class="col-md-4"></div>  
         </div>
      </div>
<br><br>

	<%@include file="/views/footer.jsp"%>
	
  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

</body>
</html>