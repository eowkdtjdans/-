<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="utf-8">
<title>현지정보문의 게시판 상세</title>
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
<script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&callback=initAutocomplete&key=AIzaSyAfB2qQnvAuU2YFFqi8hrPWfjJNyxl5kWc" async defer></script>

<!-- =======================================================
    Theme Name: BizPage
    Theme URL: https://bootstrapmade.com/bizpage-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->

<style>
body {
   padding-top: 75px;
}

a {
   color: #5e7e9b;
}

#profileImage {
   width: 60px;
   height: 60px;
}

#profileImage2 {
   width: 50px;
   height: 50px;
}
#profileImage3 {
   width: 40px;
   height: 40px;
}

td {
   padding-right: 30px;
}

#tableDiv {
   width: 1100px;
   min-height: 400px;
}

#bentarrow {
   width: 20px;
   height: 20px;
}

.textareaComment {
   width: 1000px;
}



table .noline {
   border: 0px;
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
        background-color:    white;
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
   function login_chk(frm) {
      if ("${m_id}" == "") {
         alert("로그인이 필요한 서비스입니다.");
         location.href = ""; /* 로그인을 안하고 댓글 쓰려고할 때 로그인페이지로 이동 */
      } else {
         if (frm.lc_content2.value == "") {
            alert("댓글을 입력해주세요");
            frm.lc_content2.focus();
            return false;
         } else {
            frm.action = "../insertLocalAdviceComment.do?l_idx=${getLocalAdvice.l_idx }&lc_content="+frm.lc_content2.value+"";
            frm.submit();
         }
      }
   }
   
   function deleteLocalAdvice(l_idx){
      var con_test = confirm("정말 삭제하시겠습니까?");
         if(con_test == true) {
            location.href="../deleteLocalAdvice.do?l_idx="+l_idx
         } else{
            return false;
         }
      
      
   } 
   

   function update_button(lc_idx, lc_content) {
      var textareaTag = "<br><textarea id='textarea" + lc_idx + "'  rows='3' cols='134' name='lc_content'>"+lc_content+"</textarea><button type='button' class='btn btn-outline-secondary' onclick='json_update("+ lc_idx + ")' id='focus'>수정완료</button>"
            + "<input type='hidden' id='lc_idx' value="+lc_idx+">"
            + "<input type='hidden' name='focus_idx' id='focus_idx' value="+lc_idx+">";
      var lc_content = $("#" + lc_idx).text();

      $("#" + lc_idx).empty();
      $("#" + lc_idx).append(textareaTag);

      var btn = document.getElementById('btn');
      btn.disabled = 'disabled';
   }

   function json_update(lc_idx) {
      var lc_idx = $('#lc_idx').val();
      alert("lc_idx : " + lc_idx);
      $.ajax({
         async : true,
         type : "POST",
         dataType : "json",
         data : lc_idx,
         contentType : "application/json; charset=UTF-8",
         url : "/updateLocalAdviceCommentJson.do",

         success : function(data) {
            if (data.cnt == 0) {
               //제이슨 조회시 데이터 갯수 0일때
            } else {
               //alert("데이터가 있숨");
               location.href = "/updateLocalAdviceComment.do?lc_idx="
                     + $('#lc_idx').val() + "&lc_content="
                     + $('#textarea' + lc_idx).val() + "&m_id="
                     + "${member.m_id}" + "&l_idx="
                     + "${getLocalAdvice.l_idx }" + "&focus_idx="
                     + lc_idx;
            }
         }

      })

   }

   $(document).ready(function() {

      if ('${focus_idx}' == "") {

      } else {
         $("#" + "${focus_idx}").attr("tabindex", -1).focus();
      <%session.removeAttribute("focus_idx");%>
   }

   });


   function delete_button(lc_idx, l_idx) {
      var con_test = confirm("정말 삭제하시겠습니까?");
      if (con_test == true) {

         $.ajax({
            async : true,
            type : "POST",
            dataType : "json",
            data : lc_idx,
            contentType : "application/json; charset=UTF-8",
            url : "/deleteLocalAdviceCommentJson.do?l_idx=" + l_idx,

            success : function(data) {
               $("#td" + lc_idx).remove();
               $(".trclass"+lc_idx).remove();
            }
         })
      } else {
         return false;
      }

   }

   
   function good() {
      var good = ${getLocalAdvice.l_upvote};
      var l_idx = "${getLocalAdvice.l_idx}";
     
         $.ajax({
               async : true,
               type : "POST",
               dataType : "json",
               data : l_idx,
               contentType : "application/json; charset=UTF-8",
               url : "/goodJson.do",

               success : function(data) {
                  $("#good").remove();
                  $("#span").empty();
                  $("#span").text(good + data.count + " 명이 좋아합니다.");
                  $("#span").append("&emsp;<a id='bad' href='#' onclick='bad()'><img src='views/img/good.png' style='width: 20px; height: 20px;'> 좋아요취소</a>");
                  }
               })
   };

   
   function bad() {
      var good = ${getLocalAdvice.l_upvote}+1;
      var l_idx = "${getLocalAdvice.l_idx}";

      $.ajax({
           async : true,
           type : "POST",
           dataType : "json",
           data : l_idx,
           contentType : "application/json; charset=UTF-8",
           url : "/badJson.do",

           success : function(data) {
              $("#good").remove();
              $("#span").empty();
              $("#span").text(good - data.count + " 명이 좋아합니다.");
              $("#span").append("&emsp;<a id='good' href='#' onclick='good(${getLocalAdvice.l_idx})'><img src='views/img/good.png' style='width: 20px; height: 20px;'> 좋아요!</a>");
           }
        })

   }

   function detdetgo(lc_idx, p_route, lc_date) {
      var p_route = String(p_route);
            
      var textareaTag = "&emsp;&emsp;<div id='div"+lc_idx+"'><img id='bentarrow' src='views/img/bentarrow.png'><textarea class='textareaComment' id='textareaComment" + lc_idx + "' rows='3' cols='134' name='lc_content'></textarea>"+ "&emsp;&emsp;<button type='button' class='btn btn-outline-secondary' id='detdetgo2' onclick='json_insertComment("+ lc_idx +",\""+lc_date+"\")'>댓글입력</div>";
      $("#" + lc_idx).append(textareaTag);

      var btn1 = document.getElementById("btn1"+lc_idx+"");
      var btn2 = document.getElementById("btn2"+lc_idx+"");
      
      btn1.disabled = 'disabled'; 
      btn2.disabled = 'disabled';  
      
      $("#detdetgobtn"+lc_idx).hide();
     

   }

   
   function json_insertComment(lc_idx, lc_date) {    
      var lc_content = $("#textareaComment" + lc_idx).val();   
      var lc_idx = JSON.stringify(lc_idx);
      var l_idx = ${getLocalAdvice.l_idx };
    
      if(lc_content== ""){
         alert("내용을 입력해주세요");
      }else {
      
      
      $.ajax({
               async : true,
               type : "POST",
               dataType : "json",
               data : lc_idx,
               contentType : "application/json; charset=UTF-8",
               url : "/json_insertComment.do?lc_content=" + lc_content+ "&l_idx=" + l_idx,

               success : function(data) {                 
                  var values = data.selectdetdetComment; 
                           
              $("#detdetgobtn"+lc_idx).show();             
               $("#btn1"+lc_idx+"").attr('disabled',false);
               $("#btn2"+lc_idx+"").attr('disabled',false);              
                  $("#div"+lc_idx).remove();                                                                              // onerror="this.src="../views img people fuckyou.jpg'' 크롬에 나온거
                                                                                                                          // onerror='this.src="../views/img/people/fuckyou.jpg"' 정상         
                  //var detdetDiv = "<tr><td>&emsp;&emsp;<img src='${list.p_route }' class='rounded-circle' id='profileImage3' onerror='this.src='../views/img/people/fuckyou.jpg''>${list.m_id}${list.p_route}<br>&emsp;&emsp;"+value.lc_content+"</td></tr>"; '${list.m_id eq member.m_id}'
                  var detdetDiv = "<tr class='trclass"+lc_idx+"'><td class='tdclass"+data.detdetlc_idx+"'>&emsp;&emsp;<img src="+data.p_route+" class='rounded-circle' id='profileImage3' onerror='this.src='../views/img/people/fuckyou.jpg'>&nbsp;&nbsp;"+data.m_id+"&emsp;"+lc_date+"&emsp;<button type='button' class='btn btn-outline-secondary btn-sm' onclick='updatedetdet("+data.detdetlc_idx+", "+lc_idx+")'>수정</button>&nbsp;<button type='button' class='btn btn-outline-secondary btn-sm'onclick='deletedetdet("+data.detdetlc_idx+")'>삭제</button><br>&emsp;&emsp;"+lc_content+"</td></tr>";
                                                  
                        $(".trclass"+lc_idx).last().after(detdetDiv);
               
               
               }
            })
   }
   }
   
   
   function updatedetdet(detdetlc_idx, detdet){
      var detdetlc_idx = JSON.stringify(detdetlc_idx);
                  
        $.ajax({
              async : true,
              type : "POST",
              dataType : "json",
              data : detdetlc_idx,  //618
              contentType : "application/json; charset=UTF-8",
              url : "/updatedetdet.do",

              success : function(detdetList) {

               $(".tdclass"+detdetlc_idx).empty();  //"&emsp;&emsp;<img src="+detdetList.p_route+" class='rounded-circle' id='profileImage3' onerror='this.src='../views/img/people/fuckyou.jpg'>"+detdetList.m_id+"<button type='button' class='btn btn-outline-secondary' onclick='updatedetdetgo("+data.detdetlc_idx+", "+lc_idx+")'>수정완료</button><button type='button' class='btn btn-outline-secondary'onclick='deletedetdet("+data.detdetlc_idx+")'>삭제</button><br>&emsp;&emsp;"+detdetList.lc_content+"
               $(".tdclass"+detdetlc_idx).append("&emsp;&emsp;<img src="+detdetList.p_route+" class='rounded-circle' id='profileImage3' onerror='this.src=\"../views/img/people/fuckyou.jpg\"'>&nbsp;"+detdetList.m_id+"&emsp;<button type='button' class='btn btn-outline-secondary btn-sm' onclick='updatedetdetgo("+detdetList.lc_idx+")'>수정완료</button>&nbsp;<button type='button' class='btn btn-outline-secondary btn-sm'onclick='deletedetdet("+detdetList.lc_idx+")'>삭제</button><br>&emsp;&emsp;<textarea id='textarea" + detdetList.lc_idx + "'  rows='3' cols='134' name='lc_content'>"+detdetList.lc_content+"</textarea></td>");
              // $(".tdclass"+detdetlc_idx).append("&emsp;&emsp;<img src="+detdetList.p_route+" class='rounded-circle' id='profileImage3' onerror='this.src=\"../views/img/people/fuckyou.jpg\"'>"+detdetList.m_id+"<button type='button' class='btn btn-outline-secondary' onclick='updatedetdetgo("+detdetList.lc_idx+")'>수정완료</button>");
             
              }
           })              
   }
   
   
   
   function updatedetdetgo(detdetlc_idx){
      var lc_content = $("#textarea"+detdetlc_idx).val();      
      var detdetlc_idx = JSON.stringify(detdetlc_idx);
      
      $.ajax({
              async : true,
              type : "POST",
              dataType : "json",
              data : detdetlc_idx,
              contentType : "application/json; charset=UTF-8",
              url : "/updatedetdetgo.do?lc_content="+lc_content,

              success : function(data) {
                             
               $(".tdclass"+detdetlc_idx).empty();                                                                                
               $(".tdclass"+detdetlc_idx).append("&emsp;&emsp;<img src="+data.p_route+" class='rounded-circle' id='profileImage3' onerror='this.src=\"/views/img/people/fuckyou.jpg\"'>&nbsp;"+data.m_id+"&emsp;"+data.lc_date+"&emsp;<button type='button' class='btn btn-outline-secondary btn-sm' onclick='updatedetdet("+data.lc_idx+","+data.detdet+")'>수정</button>&nbsp;<button type='button' class='btn btn-outline-secondary btn-sm' onclick='deletedetdet("+data.lc_idx+")'>삭제</button><br>&emsp;&emsp;"+data.lc_content+"      ");
              }
           })           
      
   }
   
   
   function deletedetdet(detdetlc_idx){
      var detdetlc_idx = JSON.stringify(detdetlc_idx);
      
      $.ajax({
              async : true,
              type : "POST",
              dataType : "json",
              data : detdetlc_idx,
              contentType : "application/json; charset=UTF-8",
              url : "/deletedetdetgo.do",

              success : function(data) {
                 $(".tdclass"+data.detdetlc_idx).remove();
             
              }
           })           
      
   }

   
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
  </header><!-- #header -->
 


   <!--==========================
      About Us Section
    ============================-->
<br>
      <div class="container">
         <img src="views/img/star.jpg" style="width: 40px; height: 40px;"><span style="font-size: 1.2em; font-weight: bold;">현지정보 문의 게시판</span>     
         <hr>
         <div class="row from-group">

         
            <div id="tableDiv">
               <table>
                  <tr>
                     <td rowspan="3" style="text-align: right;"><img src="${getLocalAdvice.getP_route() }"
                        class="rounded-circle" id="profileImage" 
                        onerror='this.src="../views/img/people/fuckyou.jpg"'>
                     </td>
                     <td><strong>${getLocalAdvice.l_subject }</strong></td>                                         
                  </tr>
                  <tr>
                     <td>${getLocalAdvice.m_id}&emsp;&emsp; ${getLocalAdvice.l_date }</td>
                      <td>
                        <c:if test="${getLocalAdvice.m_id eq member.m_id }">
                           <a id="atag-size" href="../updateLocalAdvice.do?l_idx=${getLocalAdvice.l_idx }">&nbsp;수정&nbsp;</a>|                           
                           <a id="atag-size" href="#" onclick="deleteLocalAdvice('${getLocalAdvice.l_idx }')">삭제</a>          
                        </c:if> 
                     </td>
                  </tr>
               </table>
               
               
               <div>
                  <p>
                     <br>${getLocalAdvice.l_content }</p>
               </div>
            </div>
         


           <c:choose>
               <c:when test="${not empty member.m_id}">
                  <span id="span">${getLocalAdvice.l_upvote } 명이 좋아합니다..</span>
                  &emsp;
                  <a id="good" href="#" onclick="good('${getLocalAdvice.l_idx}')"><img
                     src="views/img/good.png" style="width: 20px; height: 20px;">
                     좋아요!</a>
               </c:when>
               <c:otherwise>
                  <span id="span">${getLocalAdvice.l_upvote } 명이 좋아합니다..</span>
                  &emsp;
                  <a id="good" href="#"><img src="views/img/good.png"
                     style="width: 20px; height: 20px;"> 좋아요!</a>
               </c:otherwise>
            </c:choose>


            <!-- 여기서부터 댓글폼 -->
            <form method="post" id="frm">
               <input type="hidden" name="m_id" value="${member.m_id }">

               <table class="table" style="width: 1100px;">
                  <c:forEach var="list" items="${getLocalAdviceCommentList}">
                     <c:choose>
                        <c:when test="${list.detdet eq 0 }">
                           <tr id="tr${list.lc_idx}" class="trclass${list.lc_idx}">
                              <td class="update" id="td${list.lc_idx}"><img src="${list.p_route }" class="rounded-circle" id="profileImage2" onerror='this.src="../views/img/people/fuckyou.jpg"'>
                                 &nbsp;&nbsp;${list.m_id }&emsp;&emsp;${list.lc_date }<span id="focusing">&emsp;</span> 
                                 <c:if test="${!empty member.m_id }">
                                    <button type="button" id="detdetgobtn${list.lc_idx }" class="btn btn-outline-secondary" onclick="detdetgo('${list.lc_idx}', '${list.p_route }', '${list.lc_date }')">댓글달기</button>
                                 </c:if> 
                                 <c:if test="${list.m_id eq member.m_id or list.m_id eq admin}">
                                    <!-- 조건에 로그인한아이디와 프로필의 m_id가 같으면 -->
                                    <button type="button" class="btn btn-outline-secondary" id="btn1${list.lc_idx}"  
                                       onclick="update_button('${list.lc_idx}','${list.lc_content }')">수정</button>
                                    <button type="button" class="btn btn-outline-secondary" id="btn2${list.lc_idx}"   
                                       onclick="delete_button('${list.lc_idx}','${getLocalAdvice.l_idx }')">삭제</button>
                                    <input type="hidden" name="lc_idx" value="${list.lc_idx }">
                                 
                                 </c:if>
                                 <div id="${list.lc_idx}">
                                    <br>${list.lc_content }<br>
                                 </div>
                                 </td>
                           </tr>
                        </c:when>
                        <c:otherwise>
                                        
                           <script>
                           function abc(detdet) {
                              $(document).ready(function(){                                                                                                                                                 //onerror='this.src="../views/img/people/fuckyou.jpg"'
                                 $(".trclass"+detdet).last().after("<tr class='trclass"+detdet+"'><td class='tdclass"+${list.lc_idx}+"'>&emsp;&emsp;<img src='${list.p_route }' class='rounded-circle' id='profileImage3' onerror='this.src=\"/views/img/people/fuckyou.jpg\"'>&nbsp;&nbsp;${list.m_id}&emsp;${list.lc_date}<c:if test='${list.m_id eq member.m_id}'>&emsp;<button type='button' class='btn btn-outline-secondary btn-sm' onclick='updatedetdet(${list.lc_idx}, "+detdet+")'>수정</button>&nbsp;<button type='button' id='btn4' class='btn btn-outline-secondary btn-sm'onclick='deletedetdet(${list.lc_idx})'>삭제</button></c:if><br>&emsp;&emsp;${list.lc_content}</td></tr>");
                              })
                           }

                              abc("${list.detdet}");
                           </script>
                           
                        </c:otherwise>
                     </c:choose>
                  </c:forEach>
               </table>
            </form>

            <!-- 댓글 입력 폼 -->
            <form method="post" name="frm">
               <p>
                  <textarea name="lc_content2" rows="3" cols="134" id="abc"></textarea>
                  <input class="btn btn-outline-secondary" type="button"
                     value="댓글등록" onclick="login_chk(this.form)">
               </p>
            </form>      
         </div>
      </div>
   
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
   <!-- #footer -->
   <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

  <!-- JavaScript Libraries -->
  <script src="views/lib/jquery/jquery.min.js"></script>
  <script src="views/lib/jquery/jquery-migrate.min.js"></script>
  <script src="views/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="views/lib/easing/easing.min.js"></script>
  <script src="views/lib/superfish/hoverIntent.js"></script>
  <script src="views/lib/superfish/superfish.min.js"></script>
  <script src="views/lib/wow/wow.min.js"></script>
  <script src="views/lib/waypoints/waypoints.min.js"></script>
  <script src="views/lib/counterup/counterup.min.js"></script>
  <script src="views/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="views/lib/isotope/isotope.pkgd.min.js"></script>
  <script src="views/lib/lightbox/js/lightbox.min.js"></script>
  <script src="views/lib/touchSwipe/jquery.touchSwipe.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="views/contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="views/js/main.js"></script>

  <script src="jsModal/placeholders.min.js"></script> <!-- polyfill for the HTML5 placeholder attribute -->
  <script src="jsModal/main.js"></script> <!-- Resource JavaScript -->
</body>
</html>