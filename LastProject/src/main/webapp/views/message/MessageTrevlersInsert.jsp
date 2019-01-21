<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="/views/admin/plugins/iCheck/all.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <meta charset="utf-8">
   <meta name="author" content="Kodinger">
   <meta name="viewport" content="width=device-width,initial-scale=1">
   <title>쪽지</title>
   <link rel="stylesheet" type="text/css" href="views/bootstrapModal/css/bootstrap.min.css">
   
   <meta content="width=device-width, initial-scale=1.0" name="viewport">
   <meta content="" name="keywords">
   <meta content="" name="description">
   
      <%@include file="/views/header.jsp"%>
      <script><%@include file="/views/headerScript.jsp"%></script>
   
   
  
<link rel="stylesheet" href="/views/datepicker/public/theme/css/t-datepicker.min.css">
<link rel="stylesheet" href="/views/datepicker/public/theme/css/themes/t-datepicker-teal.css">
<script src="/views/datepicker/public/theme/js/t-datepicker.min.js"></script>
   <!-- iCheck for checkboxes and radio inputs -->
   <link rel="stylesheet" href="/views/admin/plugins/iCheck/all.css">
   
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script src="views/datepicker/public/theme/js/t-datepicker.min.js"></script>

  
<script>   
var placeSearch, autocomplete;
var placeSearchReg, autocompleteReg;
function initAutocomplete() {
  autocompleteReg = new google.maps.places.Autocomplete((document.getElementById('autocompleteReg')),{types: ['geocode']});
  autocompleteReg.addListener('place_changed', fillInAddress);
  autocomplete = new google.maps.places.Autocomplete((document.getElementById('autocomplete')),{types: ['geocode']});
  autocomplete.addListener('place_changed', fillInAddress);
}
function fillInAddress() { //lat 와 lng 값을 넘겨줄 input 태그에 값 넣어주기
   var placeReg = autocompleteReg.getPlace();
   document.getElementById("latReg").value=placeReg.geometry.location.lat();
   document.getElementById("lngReg").value=placeReg.geometry.location.lng();
   document.getElementById("lat").value=place.geometry.location.lat();
   document.getElementById("lng").value=place.geometry.location.lng();
}


 $(document).ready(function(){
	   $('.t-datepicker').tDatePicker({
	     autoClose:true,
	     durationArrowTop:200,
	     limitDateRanges:61,
	     numCalendar:2,
	     titleCheckIn:'입실날짜',
	     titleCheckOut:'퇴실날짜',
	     titleDateRange:'일',
	     titleDateRanges:'일',
	     titleToday:'오늘',
	     titleDays:['월','화','수','목','금','토','일'],
	     titleMonths:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	     toDayShowTitle:true,
	     dateRangesShowTitle:true,
	     dateRangesHover:true,
	     toDayHighlighted:true,
	     dateDisabled:[false]
	   }).on('eventClickDay',function(e, dataDate){
	     var getDateInput = $('.t-datepicker').tDatePicker('getDateInputs');
	      document.getElementById("h_startdate").value = getDateInput[0];
	      document.getElementById("h_enddate").value = getDateInput[1];
	   });
	   
	});




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

<script>
   
   function insertMessage(frm) {
      frm.action = "../../insertTrevelersMessage.do";
      frm.submit();
   }
</script>

<script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&callback=initAutocomplete&key=AIzaSyAfB2qQnvAuU2YFFqi8hrPWfjJNyxl5kWc" async defer></script>

<script>
$(function(){
	$('input[type="radio"].minimal').iCheck({
		radioClass : 'iradio_minimal-blue'
	});
	
})
</script>

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
   
   function insertMessage(frm) {
      frm.action = "../../insertMessage.do";
      frm.submit();
   }

<script>
   
   function insertMessage(frm) {
      frm.action = "../../insertTrevelersMessage.do";
      frm.submit();
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

 


<br>
<div class="container">
   <div class="row">
   <div class="col-md-3"></div> 
   <div class="col-md-6">
      <img src="views/img/messageImg.png" style="width: 60px; height: 60px;"> <strong style="font-size: 1.2em;"> 쪽지 보내기</strong>   
      <form method="POST" class="my-login-validation" id="form">
                        <input id="m_id" type="hidden" class="form-control" name="m_id" value="${member.m_id }">   
                        <input id="message_sender" name="message_sender" type="hidden" class="form-control" value="${member.m_id }">   
                        <input id="message_receiver" name="message_receiver" type="hidden" class="form-control" value="${message_receiver }">   
                        
                         <div class="form-group">
                                <label for="h_startdate" class="col-4 col-form-label">입실/퇴실 날짜</label> 
                              <div class="col-8">
                              	 <div class="t-datepicker">
			                          <div class="t-check-in"></div>
			                          <div class="t-check-out"></div>
	                        	</div>
                       		</div>
                                <input id="h_startdate" type="hidden" class="form-control" name="h_startdate" required data-eye> 
                                <input id="h_enddate" type="hidden" class="form-control" name="h_enddate" required data-eye> 
                            </div>
                        
                        <div class="form-group">
                           <label for="message_title" style="text-align : center;">제목</label>
                           <textarea rows="1" cols="10" id="message_title" name="message_title" class="form-control"></textarea>
                        </div>
                        
                        <div class="form-group">
                           <label for="message_content" style="text-align : center">내용</label>
                           <textarea rows="5" cols="10" id="message_content" name="message_content"  class="form-control"></textarea>
                        </div>
                        
                        
                        <div class="form-group m-0">
                           <button type="button" class="btn btn-secondary btn-block" onclick="insertMessage(this.form)">
                              쪽지 보내기
                           </button>
                        </div>
                        
                     </form>
   </div>
   <div class="col-md-3"></div> 
   </div>
</div> 
<br><br>
 <%@include file="/views/footer.jsp"%>
 <!-- iCheck 1.0.1 -->
<script src="/views/admin/plugins/iCheck/icheck.min.js"></script>
</body>
</html>