<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
   <title>Gukbong WorlD</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

  
 <%@include file="/views/header.jsp"%>
<script>

	function findId(frm) {
		 var str = $("#findId").serialize();
		 $.ajax({
			async : true,
			type : "POST",
			dataType : "json",
			data : str,
			url : "../../findIdMemberJson.do",
			
			
			
			success : function(data) {
				if (data.cnt > 0) {
					alert("임시 이메일을 확인하세요!");
					frm.action="../../findIdMember.do";
					frm.submit(); 
					return false;
				} else {
					alert("회원정보를 찾을 수 없습니다.. 다시 입력하세요.");
					frm.m_id.value = "";
					frm.m_phone.value = "";
					frm.m_name.value = "";
					frm.m_id.focus();
				}
				
			}
		}); 
		
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
	
		<li class="menu-has-children"><img src="${profile.p_route }" style="width: 45px; height: 45px;" class="rounded-circle" id="navProfileImg"></a>
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
                     <h4 style="text-align : center;"><strong>아이디 찾기</strong></h4>
	                     <form method="POST" onsubmit="return false;" class="my-login-validation" id="findId">
	                    
		                    <div class="form-group">
								<label for="m_email"><strong>임시 이메일</strong></label>
								<input id="m_id" onkeypress="enterkey()"type="email" class="form-control" name="m_id" placeholder="임시이메일을 입력하세요." required autofocus>
							</div>
	                        
	                        <div class="form-group" >
	                           <label for="m_name"><strong>성함</strong></label>
	                           <input id="m_name" onkeypress="enterkey()"type="text" class="form-control" name="m_name" placeholder="이름을 입력하세요." required autofocus>
	                        </div>
	                        
	                        <div class="form-group" >
	                           <label for="m_phone"><strong>전화번호</strong></label>
	                           <input id="m_phone"onkeypress="enterkey()" type="text" class="form-control" name="m_phone" placeholder="전화번호를 입력하세요." required autofocus>
	                        </div>
	
	                        <div class="form-group m-0">
	                           <button type="submit" id="findBtn" class="btn btn-outline-secondary btn-block" onclick="findId(this.form)">
	                            	  <strong>아이디 찾기</strong>
	                           </button>
	                        </div>
	                     </form>             
               </div>
            <div class="col-md-4"></div> 
         </div>
      </div>
 
<%@include file="/views/footer.jsp"%>

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>


</body>
</html>