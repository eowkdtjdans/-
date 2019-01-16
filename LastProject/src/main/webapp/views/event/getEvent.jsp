<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
 
<meta charset="utf-8"> 
  <title>이벤트 게시판 상세보기</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
 
  <!-- Favicons -->
  <link href="/views/img/favicon.png" rel="icon">
  <link href="/views/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Kalam" rel="stylesheet">
  
  <!-- Bootstrap CSS File -->
  <link href="/views/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="/views/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="/views/lib/animate/animate.min.css" rel="stylesheet">
  <link href="/views/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="/views/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="/views/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">	
  <!-- Main Stylesheet File -->
  <link href="/views/css/style.css" rel="stylesheet">
  
  <!-- 데이트 피커 -->
  <link rel="stylesheet" href="/views/datepicker/public/theme/css/t-datepicker.min.css">
  <link rel="stylesheet" href="/views/datepicker/public/theme/css/themes/t-datepicker-teal.css">
  
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&callback=initAutocomplete&key=AIzaSyAfB2qQnvAuU2YFFqi8hrPWfjJNyxl5kWc" async defer></script>




<style>
body {
   padding-top: 75px;
}

a {
   color: #5e7e9b;
}

#profileImage {
   width: 80px;
   height: 80px;
}

#profileImage2 {
   width: 60px;
   height: 60px; 
}

td {
   padding-right: 30px;
}

#tableDiv {
   width: 1100px;
} 

#bentarrow {
   width: 20px;
   height: 20px;
}

.textareaComment {
   width: 1000px;
}

#profileImage3 {
   width: 45px;
   height: 45px;
}

table .noline {
   border: 0px;
}
#e_content{
	font-size: 1em;
}
#smalltable{
	font-size: 0.95em;
}
.rounded-circle { width: 80px; height: 70px;} 
   .card {float : left;}
   
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

/* #slideimg{
	width: 600px;
	height: 450px;
} */






</style>

<script>
   function login_chk(frm) {
	   alert("댓글입력시 검증");
      if ("${member.m_id}" == "") {
         alert("로그인이 필요한 서비스입니다.");
         location.href = ""; /* 로그인을 안하고 댓글 쓰려고할 때 로그인페이지로 이동 */
      } else {
         if (frm.ec_content.value == "") {
            alert("댓글을 입력해주세요");
            frm.ec_content.focus();
            return false;
         } else {
        	alert("입력값 : " + frm.ec_content.value);
            var ec_content = frm.ec_content.value;  
            alert("게시글번호 : " + frm.e_idx.value);
            var e_idx = frm.e_idx.value;
            
	     	   $.ajax({
	               async : true,
	               type : "POST",
	               dataType : "json",
	               data : ec_content,
	               contentType : "application/json; charset=UTF-8",
	               url : "/insertEventComment.do?e_idx="+e_idx,
	
	               success : function(data) {
	                  alert("댓글 입력 성공부분");
	                  // alert("e_idx : " + data.e_idx);
	                  //alert("ec_content : " + data.ec_content);
	                  //alert("m_id : " + data.m_id);
	                  alert(data.getEventComment.ec_date);
	                  //alert(data.getEventComment.ec_date.format('YYYYMMDD'));
	                  //alert(data.getEventComment.p_route);
	               
	                  alert(data.getEventComment.ec_idx);
						$("#table").last().append(
							"<tr id='tr"+data.getEventComment.ec_idx+"' class='trclass"+data.getEventComment.ec_idx+"'><td class='update' id='td"+data.getEventComment.ec_idx+"'><img src='"+data.getEventComment.p_route+"' class='rounded-circle' id='profileImage2' onerror='this.src=\"/views/img/people/fuckyou.jpg\"'>&nbsp;&nbsp; "+data.m_id+"&emsp;&emsp;"+data.getEventComment.ec_date+"<span id='focusing'>&emsp;</span><button type='button' class='btn btn-outline-secondary' id='btn1"+data.getEventComment.ec_idx+"' onclick='update_button(\""+data.getEventComment.ec_idx+"\", \""+data.ec_content+"\")'>수정</button> <button type='button' class='btn btn-outline-secondary' id='btn2"+data.getEventComment.ec_idx+"' onclick='delete_button(\""+data.getEventComment.ec_idx+"\", \""+data.e_idx+"\")'>삭제</button><div id='"+data.getEventComment.ec_idx+"'><br>"+data.ec_content+"<br><br></div></td></tr>");
							document.getElementById("textareadet").value='';
							
	               	}
	           	 })
						
            
            
         }
      }
   }


	
   $(document).ready(function() {

      if ('${focus_idx}' == "") {

      } else {
         console.log($("#" + "${focus_idx}"));
         console.log('#');
         console.log('${focus_idx}');

         $("#" + "${focus_idx}").attr("tabindex", -1).focus();

   }
      
     $(".main1").parent().addClass("carousel-item active");
      
   });



	function good(){
	   alert("좋아요 ajax");
	   var good = parseInt("${getEvent.e_upvote}");
	   var e_idx = "${getEvent.e_idx}";
	   alert(good);
	   alert(e_idx);
	   
	   $.ajax({
           async : true,
           type : "POST",
           dataType : "json",
           data : e_idx,
           contentType : "application/json; charset=UTF-8",
           url : "/goodEventJson.do",

           success : function(data) {
              alert(data.count);
              $("#good").remove();
              $("#span").empty();
              $("#span").text(good + data.count + " 명이 좋아합니다.");
              $("#span").append("&emsp;<a id='bad' href='#' onclick='bad()'><img src='views/img/good.png' style='width: 20px; height: 20px;'> 좋아요취소</a>");
           	}
       	 })
    };
    
    
    function bad() {
        alert("싫어요 ajax");
        var good = parseInt("${getEvent.e_upvote}")+1;
        alert("good : " + good);
        var e_idx = "${getEvent.e_idx}";
        alert("e_idx : " + e_idx);

        $.ajax({
             async : true,
             type : "POST",
             dataType : "json",
             data : e_idx,
             contentType : "application/json; charset=UTF-8",
             url : "/badEventJson.do",

             success : function(data) {
                alert(data.count);
                $("#good").remove();
                $("#span").empty();
                $("#span").text(good - data.count + " 명이 좋아합니다.");
                $("#span").append("&emsp;<a id='good' href='#' onclick='good()'><img src='views/img/good.png' style='width: 20px; height: 20px;'> 좋아요!</a>");
             }
          })

     }

   
    function update_button(ec_idx, ec_content) {
        alert("update_button()함수로옴");
        alert("ec_idx : " + ec_idx + ", ec_content : " + ec_content);
        var textareaTag = "<br><textarea id='textarea" + ec_idx + "'  rows='3' cols='134' name='lc_content'>"+ec_content+"</textarea><button type='button' class='btn btn-outline-secondary' onclick='json_update("+ ec_idx + ")' id='focus'>수정완료</button>"
              + "<input type='hidden' id='lc_idx' value="+ec_idx+">"
              + "<input type='hidden' name='focus_idx' id='focus_idx' value="+ec_idx+">";
        var ec_content = $("#" + ec_idx).text();

        $("#" + ec_idx).empty();
        $("#" + ec_idx).append(textareaTag);
       // $("#textarea" + lc_idx).text(lc_content);

        var btn = document.getElementById('btn1'+ec_idx);
        btn.disabled = 'disabled';
     }
    
    
    function json_update(ec_idx){
    	alert("실질적인 update");
    	var ec_content = $("#textarea"+ec_idx).val();
    	alert("바뀐 ec_content : " + ec_content);
    	var ec_idx = JSON.stringify(ec_idx);
    	
		$.ajax({
	           async : true,
	           type : "POST",
	           dataType : "json",
	           data : ec_idx,
	           contentType : "application/json; charset=UTF-8",
	           url : "/updateEventComment.do?ec_content="+ec_content,

	           success : function(data) {
	        	   alert("성공부분");
	        	   alert(data.ec_idx);
	        	   alert(data.ec_content);
				   
	        	   $("#" + data.ec_idx).empty();
	        	   $("#" + data.ec_idx).html("<br>"+data.ec_content+"<br> <br>");
	        	   
	        	   var btn = document.getElementById('btn1'+data.ec_idx);
	               btn.disabled = false;
	           }
	        }) 
    }
    
    
    function delete_button(ec_idx, e_idx){
    	alert("delete ajax");
    	alert("ec_idx : " + ec_idx);
    	//var ec_idx1 = JSON.stringify(ec_idx);
    	
	   	 var con_test = confirm("정말 삭제하시겠습니까?");
	        if (con_test == true) {
	           alert("댓글삭제누를시 나오는 alert");
	           alert("ec_idx : " + ec_idx);
	           
	           $.ajax({
	              async : true,
	              type : "POST",
	              dataType : "json",
	              data : ec_idx,
	              contentType : "application/json; charset=UTF-8",
	              url : "/deleteEventComment.do?e_idx="+e_idx,
	
	              success : function(data) {
	            	  alert("ajax 성공부분");
	                  $("#td" + data.ec_idx).remove();
	                  $(".trclass" + data.ec_idx).remove();
	              }
	           })
	        } else {
	           return false;
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

   <!--==========================
    Header
  ============================-->
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
  
   <!--==========================
      About Us Section
    ============================-->
<section id="about">
      <div class="container">
         <div class="row from-group">


            <div id="tableDiv">
               <table class="table">
                  <tr>                     
                     <td><strong>${getEvent.e_name }</strong></td>                     
                  </tr>
                  <%-- <fmt:formatDate value="${getEvent.e_startdate}" pattern="yyyy-MM-dd" var="startdate"/>
                  <fmt:formatDate value="${getEvent.e_enddate}" pattern="yyyy-MM-dd" var="enddate"/> --%>
                  <fmt:formatDate value="${getEvent.e_startdate }" pattern="yyyy-MM-dd" var="date"/>
                  <tr>
                     <%-- <td>관리자&emsp;&emsp;${startdate} ~ ${enddate}</td> --%>
                     <td>관리자 &emsp;&emsp; ${date}</td>
                  </tr>
                  <tr>
                  	 <td>
                  	 	<c:choose>
			               <c:when test="${not empty member.m_id}">
			                  <span id="span">${getEvent.e_upvote } 명이 좋아합니다..</span>
			                  &emsp;
			                  <a id="good" href="#" onclick="good()"><img src="views/img/good.png" style="width: 20px; height: 20px;"> 좋아요!</a>
			               </c:when>
			               <c:otherwise>
			                  <span id="span">${getEvent.e_upvote } 명이 좋아합니다..</span>
			                  &emsp;
			                  <a id="good" href="#"><img src="views/img/good.png" style="width: 20px; height: 20px;"> 좋아요!</a>
			               </c:otherwise>
			            </c:choose>
                  	 </td>	
                  </tr>
               </table>
            </div>
            
            
            <div class="container show-grid">			    
			    <div class="row">
			      <div class="col-md-6" style="text-align: center">
				      <c:forEach var="list" items="${getEventImageList }">
					  	  		<span><img src="${list.e_img }" style="width: 420px; height: 300px;" class="img-thumbnail"></span>
					  	  		<br>
					  </c:forEach>
					  <!-- <button type="button" class="btn btn-outline-secondary" onclick="imagemodal()">사진 더보기</button> -->
					  <button type="button" data-toggle="modal" data-target="#myModal">사진 더보기</button>
					
			      </div>
			      
			      
			      <div class="col-md-6" id="e_content">
			      ${getEvent.e_content } <br><br>
			      <table class="table" id="smalltable">
			      	<tr>
			      		<td>시작일</td>
			      		<td>${getEvent.e_startdate }</td>
			      	</tr>
			      	<tr>
			      		<td>종료일</td>
			      		<td>${getEvent.e_enddate }</td>
			      	</tr>
			      	<tr>
			      		<td>태그</td>
			      		<td>${getEvent.e_tag }</td>
			      	</tr>
			      	<tr>
			      		<td>주소</td>
			      		<td>${getEvent.e_address }</td>
			      	</tr>			      	
			      </table>
			      </div>			      
			    </div>		    			    
			</div>
			<br><br>
			

 
<!-- 모달부분 -->

<!-- <div class="modal fade" id="myModal">
<div class="modal-dialog modal-lg">
<div class="modal-content"> --> 	



	  <div id="demo" class="carousel slide" data-ride="carousel">
	
	  <!-- The slideshow -->
	  <div class="carousel-inner">
	    <c:forEach var="list" items="${getEventImageList}">
		    <div class="carousel-item">
		      <img src="${list.e_img}" class="main${list.e_main }" id="slideimage">
		    </div>
	    </c:forEach>
	
	  </div>
	  
	  <!-- Left and right controls -->
	  <a class="carousel-control-prev" href="#demo" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#demo" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a>
	  </div>
	  	  

<!-- </div>
</div>
</div>  -->




 
	<!-- 댓글 폼 -->
 		<br>
		<form method="post" id="frm">
              <table id="table" class="table" style="width: 1100px;">
                 <c:forEach var="list" items="${getEventCommentList}">
                 <%-- <fmt:formatDate value="${list.ec_date}" pattern="yyyy-MM-dd" var="ec_date"/> --%>
                          <tr id="tr${list.ec_idx}" class="trclass${list.ec_idx}">
                             <td class="update" id="td${list.ec_idx}"><img src="${list.p_route }" class="rounded-circle" id="profileImage2" onerror='this.src="../views/img/people/fuckyou.jpg"'>
                                &nbsp;&nbsp;${list.m_id }&emsp;&emsp;${list.ec_date }<span id="focusing">&emsp;</span> 
                                
                                <c:if test="${list.m_id eq member.m_id}">
                                   <!-- 조건에 로그인한아이디와 프로필의 m_id가 같으면 -->
                                   <button type="button" class="btn btn-outline-secondary" id="btn1${list.ec_idx}"  
                                      onclick="update_button('${list.ec_idx}','${list.ec_content }')">수정</button>
                                   <button type="button" class="btn btn-outline-secondary" id="btn2${list.ec_idx}"   
                                      onclick="delete_button('${list.ec_idx}','${getEvent.e_idx }')">삭제</button>                                                
                                </c:if>
                                
                                <div id="${list.ec_idx}">
                                   <br>${list.ec_content }<br> <br>
                                </div>
                                
                              </td>
                           </tr>

                 </c:forEach>
              </table>
           </form>

            <!-- 댓글 입력 폼 -->
            <form method="post" name="frm">
               <p>
                  <textarea name="ec_content" rows="3" cols="134" id="textareadet"></textarea>
                  <input type="hidden" id="e_idx" name="e_idx" value="${getEvent.e_idx }">
                  <input class="btn btn-outline-secondary" type="button"
                     value="댓글등록" onclick="login_chk(this.form)">
               </p>
            </form>		
         </div>
      </div>
   </section>
   <!-- #about -->
   
   
   
   


 
   
   
   
   
   
   
   
   
   
   
   
   
   
   <!--==========================
    Footer
  ============================-->
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
      
      <!-- JavaScript Libraries -->
  <script src="/views/lib/jquery/jquery.min.js"></script>
  <script src="/views/lib/jquery/jquery-migrate.min.js"></script>
  <script src="/views/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/views/lib/easing/easing.min.js"></script>
  <script src="/views/lib/superfish/hoverIntent.js"></script>
  <script src="/views/lib/superfish/superfish.min.js"></script>
  <script src="/views/lib/wow/wow.min.js"></script>
  <script src="/views/lib/waypoints/waypoints.min.js"></script>
  <script src="/views/lib/counterup/counterup.min.js"></script>
  <script src="/views/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="/views/lib/isotope/isotope.pkgd.min.js"></script>
  <script src="/views/lib/lightbox/js/lightbox.min.js"></script>
  <script src="/views/lib/touchSwipe/jquery.touchSwipe.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="/views/contactform/contactform.js"></script>
  <script src="/views/datepicker/public/theme/js/t-datepicker.min.js"></script>
  
  <!-- Template Main Javascript File -->
  <script src="/views/js/main.js"></script>
  
   

   </body>
</html>