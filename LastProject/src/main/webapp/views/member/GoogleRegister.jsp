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
   <title>회원가입</title>
   <link rel="stylesheet" type="text/css" href="views/bootstrapModal/css/bootstrap.min.css">
   
   <meta content="width=device-width, initial-scale=1.0" name="viewport">
   <meta content="" name="keywords">
   <meta content="" name="description">
   
      <%@include file="/views/header.jsp"%>
      <script><%@include file="/views/headerScript.jsp"%></script>
   
   
   <link rel="stylesheet" href="views/datepicker/public/theme/css/t-datepicker.min.css">
   <link rel="stylesheet" href="views/datepicker/public/theme/css/themes/t-datepicker-teal.css">
   <!-- blue, bluegrey, cyan, green, lime, main, orange, purple, teal, yellow -->
   
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script src="views/datepicker/public/theme/js/t-datepicker.min.js"></script>

<script>
var phoneck= 0;

    function phoneCheck(frm) {
      var phonecheck = 0;
      var m_phone = $('#m_phone').val();
      var phone = document.getElementById("m_phone").value;
      var phoneCheck = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
      $.ajax({
         async: true,
         type : 'POST',
         dataType : "json",
         data : m_phone,
         contentType: "application/json; charset=UTF-8",
         url : '../../checkPhoneJson.do',
         
            success : function(data) {
              console.log("data.cnt : " + data.cnt);
               if(phoneCheck.test(phone)==false || phone == ""){
                  alert("핸드폰번호를 제대로 기입하세요.");
                   $("#m_phone").focus();
                       $("#m_phone").val("");
                  return false;
               } else if (data.cnt >= 1) {
                      alert("핸드폰 번호가 존재합니다.");
                      $("#m_phone").focus();
                      $("#m_phone").val("");
                      phoneck = 0;
                      return false;
                   } else if(data.cnt == 0) {
                     alert("등록가능한 핸드폰 번호입니다.");
                     //아이디가 중복하지 않으면  idck = 1 
                     phoneck = 1;
                    return false;
                }
              },
              error : function(error) {
                 alert("핸드폰 번호를 입력하세요");
               return false;
              }
          });
    };
/* *******************************************************************************
*************************************************************************************/ 
/* *******************************************************************************
*************************************************************************************/  

function register(frm) {
   var nameCheck = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
   var name = frm.m_name.value;

   if(confirm("회원가입을 하시겠습니까?")){
        if(phoneck==0) {
               alert("핸드폰 중복체크를 해주세요");
               return false;
        } else if (frm.m_pwd.value == "" || frm.m_pwd.value == null) {
         alert("비밀번호를 기입하세요.");
         frm.m_pwd.value = ""; 
         frm.m_pwd.focus();
        } else if (frm.m_pwd.value.length<8 || frm.m_pwd.value.length>16) {
           alert("비밀번호를 8~16자리로 설정해주세요.");
           frm.m_pwd.value = ""; 
         frm.m_pwd.focus();
      }  else if (frm.m_name.value == "" || frm.m_name.value == null) {
         alert("성함을 기입하세요.");
         frm.m_name.value = ""; 
         frm.m_name.focus();
      }  else if (frm.m_birthday.value == "" || frm.m_birthday.value == null) {
         alert("생년월일을 선택하세요..");
         frm.m_birthday.value = ""; 
         frm.m_birthday.focus();
      } else if (frm.m_address.value == "" || frm.m_address.value == null) {
         alert("주소를 기입하세요.");
         frm.m_address.value = ""; 
         frm.m_address.focus();
        } else{
        alert("이메일 인증을 완료해야 사이트를 이용하실 수 있습니다. 이메일을 확인해주세요.");
        frm.action = "../../insertMember.do"; //로그인 작업 처리
      frm.submit(); 
        }
    }

};
</script>   
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

/* picker만 생성 */
$(document).ready(function(){
   $('.t-datepicker').tDatePicker({
     autoClose:true,
     durationArrowTop:200,
     formatDate:'yyyy-mm-dd',
     startDate:document.getElementById("year").value + "-01-01",
     limitPrevMonth:0,
     limitNextMonth:12,
     limitDateRanges:60,
     numCalendar:1,
     titleMonthsLimitShow:12,
     dateRangesHover: false
   }).on('eventClickDay',function(e, dataDate){
      var getDateInput = $('.t-datepicker').tDatePicker('getDateInput');
      document.getElementById("m_birthday").value = getDateInput;
   })
});

function yearChange() {
   $('.t-datepicker').tDatePicker({
     autoClose:false,
     durationArrowTop:200,
     formatDate:'yyyy-mm-dd',
     startDate:document.getElementById("year").value + "-01-01",
     limitPrevMonth:0,
     limitNextMonth:12,
     limitDateRanges:60,
     numCalendar:1,
     titleMonthsLimitShow:12,
     dateRangesHover: false
   }).on('eventClickDay',function(e, dataDate){
      var getDateInput = $('.t-datepicker').tDatePicker('getDateInput');
      document.getElementById("m_birthday").value = getDateInput;
   })
}

$('.t-datepicker').tDatePicker({
}).on('clickDateCI',function(e, dateCI) {
   var getDateInput = $('.t-datepicker').tDatePicker('getDateInput');
   document.getElementById("m_birthday").value = getDateInput;
}) 






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

<script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&callback=initAutocomplete&key=AIzaSyAfB2qQnvAuU2YFFqi8hrPWfjJNyxl5kWc" async defer></script>


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

 


<br>
<div class="container">
   <div class="row">
   <div class="col-md-3"></div> 
   <div class="col-md-6">
      <h4 style="text-align : center;">회원가입</h4>      
      <form method="POST" id="form">
         <div class="form-group">
                           <label for="text">아이디</label>
                           <input readonly="readonly" value="${googleProfileEmail }" id="m_id" type="text" class="form-control" name="m_id">
                        </div>

                        <div class="form-group">
                           <label for="password">비밀번호</label>
                           <input id="m_pwd" type="password" class="form-control" name="m_pwd">
                        </div>
                  
                        <div class="form-group">
                           <label for="name">성함</label>
                           <input id="m_name" value="${googleRealName }" type="text" class="form-control" name="m_name">
                        </div>
                  
                        <div class="form-group">
                           <label for="text">핸드폰</label>
                           <input id="m_phone" type="text" class="form-control" name="m_phone" required data-eye>
                        </div>
                        
                        <div class="form-group m-0"> 
                           <button type="button" class="btn btn-default btn-block" onclick="phoneCheck(this.form)" >
                              핸드폰 중복확인
                           </button>
                        </div>
                         <div class="form-group">
                           <label for="text">성별</label>
                  		<c:if test="${googleProfileGender eq null}">
							   <div class="form-group" style="text-algin : center; margin : 0 auto">
                              <div class="btn-group" data-toggle="buttons">
                                 <label class="btn btn-default active"> 
                                    <input type="radio" name="m_gender" autocomplete="off" value="남자" checked/>남자
                                 </label>
                                 
                                 <label class="btn btn-default">
                                    <input type="radio" name="m_gender" autocomplete="off" value="여자"/>여자
                                 </label>
                              </div>
                           </div>	                  			
                  		</c:if>
                           <c:if test="${googleProfileGender ne null }">
                           <input readonly="readonly" value="${googleProfileGender }" id="m_gender" type="text" class="form-control" name="m_gender" required data-eye>
 							</c:if>
                        </div>
         
         <c:set var="yearStart" value="1969"/>
         <label for="birthday">생년월일</label>
         <select id="year" onchange="yearChange()">
         <c:forEach begin="1969" end="1999" step="1">
         <c:set var="yearStart" value="${yearStart + 1}"/>
         <c:if test="${yearStart eq 1990}">
            <option selected="selected">${yearStart}</option>
         </c:if>
         <option>${yearStart}</option>
         </c:forEach>
         </select>
         <input id="m_birthday" type="hidden" class="form-control" name="m_birthday" required data-eye> 
         
         <div class="form-group">
         <div class="t-datepicker">
         <div class="t-check-in t-picker-only"></div>
         </div>
         </div>
         
         <div id="locationField" class="form-group">
            <label for="address">주소</label>
            <input id="autocompleteReg" type="text" class="form-control" name="m_address">
            <input class="field" id="latReg" type="hidden" class="form-control" name="lat"/>
            <input class="field" id="lngReg" type="hidden" class="form-control" name="lng"/>
         </div>
         
   
         
         <div class="form-group m-0">
            <button type="button" class="btn btn-outline-secondary btn-block" onclick="register(this.form)">회원가입</button>
         </div>
         <div class="mt-4 text-center">
            사이트 회원이십니까? <a href="../../loginMember.do">로그인</a>
         </div>
      </form>
   </div>
   <div class="col-md-3"></div> 
   </div>
</div>
<br><br>
 <%@include file="/views/footer.jsp"%>
</body>
</html>