<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
   <title>아이디 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

  <!-- Favicons -->
  <link href="views/img/favicon.png" rel="icon">
  <link href="views/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Kalam" rel="stylesheet">
  
  <!-- Bootstrap CSS File -->
  <link href="views/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="views/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="views/lib/animate/animate.min.css" rel="stylesheet">
  <link href="views/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="views/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="views/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
  <!-- Main Stylesheet File -->
  <link href="views/css/style.css" rel="stylesheet">
  
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
 body{
      padding-top: 75px; 
   }
   a {
	   color: #5e7e9b;
	}
   
   .scrollto {    
     font-family: 'Kalam', cursive;
     padding-top: 8px;
   }
   .border-none {
        margin-left: 490px;
   }
   
   #nav-menu-container {
        margin-top: -30px;
   }
   #header {
        background-color: 	white;
   }
   #header.header-scrolled {
        background-color: white;
   }
   
   .nav-menu li a{
   	color: black;
   }	
   #mainLogo{
   	color: black;
   	position: absolute;
   	margin-left: 80px;
   	margin-top: -10px;
   	font-size: 2.15em;
   }
   #happy{
   	position: absolute;
   	margin-left: 20px;
   	margin-top: -20px;
   }
   #navProfileImg{
   	position: relative;
   	margin-top: -10px;
   }
   

select {
    width: 128px; /* 원하는 너비설정 */
    padding: .3em .3em; /* 여백으로 높이 설정 */
    font-family: inherit;  /* 폰트 상속 */
    border:  1px solid #999; 
    border-radius: 30px; /* iOS 둥근모서리 제거 */
    -moz-appearance: none;
    appearance: none;
}

#autocomplete {
	width: 50%; 
	border: 1px solid #999; 
	border-radius: 30px; 
	padding: .3em .3em;
	
}
#advice{
	width: 50%; 
	border: 1px solid #999; 
	border-radius: 30px; 
	padding: .3em .3em;
}


</style>   
   
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
					alert("회원정보가 없습니다. 다시 입력하세요.");
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
                     <h4 style="text-align : center;">아이디 찾기</h4>
	                     <form method="POST" onsubmit="return false;" class="my-login-validation" id="findId">
	                    
		                    <div class="form-group">
								<label for="m_email">임시 이메일</label>
								<input id="m_id" onkeypress="enterkey()"type="email" class="form-control" name="m_id" placeholder="임시이메일을 입력하세요." required autofocus>
							</div>
	                        
	                        <div class="form-group" >
	                           <label for="m_name">성함</label>
	                           <input id="m_name" onkeypress="enterkey()"type="text" class="form-control" name="m_name" placeholder="이름을 입력하세요." required autofocus>
	                        </div>
	                        
	                        <div class="form-group" >
	                           <label for="m_phone">전화번호</label>
	                           <input id="m_phone"onkeypress="enterkey()" type="text" class="form-control" name="m_phone" placeholder="전화번호를 입력하세요." required autofocus>
	                        </div>
	
	                        <div class="form-group m-0">
	                           <button type="submit" id="findBtn" class="btn btn-outline-secondary btn-block" onclick="findId(this.form)">
	                            	  아이디 찾기
	                           </button>
	                        </div>
	                     </form>             
               </div>
            <div class="col-md-4"></div> 
         </div>
      </div>
 

	<hr class="hr">
	<footer>
    	<br>   
        <div class="row">
        	<div class="col-lg-8 col-md-10 mx-auto">
        		<p class="text-primary text-center">© GUKBONG WORLD COMPANY. ALL RIGHTS RESERVED.</p>
        		<p class="copyright text-muted text-center">상호:국봉월드 &nbsp;| &nbsp; 사업자등록번호:123-456-78910[사업자정보확인]  &nbsp;| &nbsp; 대표:방국봉  &nbsp;| &nbsp; TEL:1544-1444 
             <br>FAX:031-123-1234  &nbsp;| &nbsp; 주소:비트캠프 신촌센터  &nbsp; |  &nbsp; E-mail:kz1234@naver.com </p>
		    <p style="font-size: 0.8em;" class="text-muted text-right">© 1999 - 2019 Couchsurfing International, Inc</p>
        	</div>	
        </div>
    <br> 
    </footer>	
  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>


</body>
</html>