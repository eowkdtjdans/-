<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"> 
  <title>호스트 찾기</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
 
 <%@include file="/views/header.jsp"%>
 

 <!-- 데이트 피커 -->
  <link rel="stylesheet" href="/views/datepicker/public/theme/css/t-datepicker.min.css">
  <link rel="stylesheet" href="/views/datepicker/public/theme/css/themes/t-datepicker-teal.css">
  
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&callback=initAutocomplete&key=AIzaSyAfB2qQnvAuU2YFFqi8hrPWfjJNyxl5kWc" async defer></script>


<script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&callback=initAutocomplete&key=AIzaSyAfB2qQnvAuU2YFFqi8hrPWfjJNyxl5kWc" async defer></script>
<SCRIPT LANGUAGE="JavaScript">

var contentArray = [];
var contentArray2 = [];
var iConArray = [];
var markers = [];
var iterator = 0;
var markerArray = [];
var map;

var startLat = 37.566535;
var startLng = 126.97796919999996;
var endLat = null;
var endLng = null;

//시작할때 실행되는 맵 세팅
function initialize() {
    var mapOptions = {
        zoom: 11, //지도 줌
        mapTypeId: google.maps.MapTypeId.ROADMAP, //지도 타입(변경 x)
        center: new google.maps.LatLng("${firstLat}", "${firstLng}") //맵이 로딩됬을때 시작지점
    };
    
    var addCircle = new google.maps.Circle({ //원형 그리기
    	center: new google.maps.LatLng("${firstLat}", "${firstLng}"), //원형의 중앙점
    	radius: 11000,			//원형 범위
    	strokeColor: "GREEN",	//테두리 색
    	strokeOpacity: 0.8, 	//테두리 투명도
    	strokeWeight: 2,		//테두리 굵기
    	fillColor: "GREEN", 	//원형 속 색
    	fillOpacity: 0.3		//원형 속 투명도
    });
 
    map = new google.maps.Map(document.getElementById('map'),mapOptions); //맵 생성
    
    //동적 마크생성을 위한 좌표체크
	google.maps.event.addListener(map, 'idle', function(){ //시작지점의 좌표 체크
		startLat = map.getBounds().getSouthWest().lat();
		startLng = map.getBounds().getSouthWest().lng();
		endLat = map.getBounds().getNorthEast().lat();
		endLng = map.getBounds().getNorthEast().lng();
		viewMarker();
	});
 	
	google.maps.event.addListener(map, 'zoom_changed', function() { //줌이 바뀔때 좌표 체크
		startLat = map.getBounds().getSouthWest().lat();
		startLng = map.getBounds().getSouthWest().lng();
		endLat = map.getBounds().getNorthEast().lat();
		endLng = map.getBounds().getNorthEast().lng();

		viewMarker();
	});

	google.maps.event.addListener(map, 'dragend', function(){ //드래그해서 바뀔때 좌표 체크
		startLat = map.getBounds().getSouthWest().lat();
		startLng = map.getBounds().getSouthWest().lng();
		endLat = map.getBounds().getNorthEast().lat();
		endLng = map.getBounds().getNorthEast().lng();

		viewMarker();
	});
	
    addCircle.setMap(map); //원형 생성
 
}

//마커생성 함수
function viewMarker() {
	if(startLat)
	{
		$.ajax({
			type: "GET",
			url: "../getHostGoogle.do",
			 beforeSend: function() {			
				fnRemoveMarker();
			 },
			success: function (json) {
				var markerList = json;
				var listLen = markerList.length;
				for(var i=0; i<listLen; i++){
					if (parseFloat(startLat) <= parseFloat(markerList[i].lat) && parseFloat(startLng) <= parseFloat(markerList[i].lng) && parseFloat(endLat) >= parseFloat(markerList[i].lat) && parseFloat(endLng) >= parseFloat(markerList[i].lng))
					{
						var marker = new google.maps.Marker({
							position: new google.maps.LatLng(markerList[i].lat,markerList[i].lng),
							map: map,
							draggable: false,
							html: markerList[i].cont,
							label: {
					            text: markerList[i].m_name, // $100,000
					            color: 'black',
					            fontWeight: 'bold'
					        },
					        icon: {
					    		url: markerList[i].icon
					    	},
					    	zIndex: i,
					    	id: 'marker' + markerList[i].m_id
						});
						markers.push(marker);
						
						var infowindow = new google.maps.InfoWindow() //정보창 생성

						google.maps.event.addListener(marker, "click", function () { //마커 클릭했을때 정보창 출력
							infowindow.setContent(this.html);
							infowindow.open(map, this);
						});
						
					}
				}
			}
		});
		
	}
}

function fnRemoveMarker() //마커 지우기
{
	for (var i = 1; i < markers.length; i++) {
		markers[i].setMap(null);
	}
}

$( window ).load(function() { //jsp가 실행되면 아래 함수 시작
	initialize();
});

//주소를 좌표로 변환
var placeSearch, autocomplete;

function initAutocomplete() {
  autocomplete = new google.maps.places.Autocomplete((document.getElementById('autocomplete')),{types: ['geocode']});
  autocomplete.addListener('place_changed', fillInAddress);
}

function fillInAddress() { //lat 와 lng 값을 넘겨줄 input 태그에 값 넣어주기
  var place = autocomplete.getPlace();
    document.getElementById("lat").value=place.geometry.location.lat();
    document.getElementById("lng").value=place.geometry.location.lng();
}

//좌표로 이동
function move() {
  var moveTo = new google.maps.LatLng(document.getElementById("lat").value, document.getElementById("lng").value);
  map.panTo(moveTo);
}

function sendMessage(m_id){
	location.href="/insertHostMessage.do?message_receiver="+m_id;
}

function insertHost(frm) {
    
    var str = $("#form").serialize();
    alert(str);
     $.ajax({
      async : true,
      type : "POST",
      dataType : "json",
      data : str,
      url : "../../checkHostJson.do",
      success : function(data) {
         if (data.cnt == 0) {
      		frm.action = "../../insertHost.do";
            frm.submit(); 
          } else {
        	  frm.action = "../../updateHost.do";
              frm.submit(); 
         }
      } 
   });  
};

function deleteHost(m_id) {
	 var con_test = confirm("정말 삭제하시겠습니까?");
	   	if(con_test == true) {
	   		location.href="../deleteHost.do?m_id=" + m_id;
	   	} else{
	   		return false;
	   	}
	
}

function cardOver(m_id) {
	
	
	
	
	
	
	
}

</SCRIPT>
<script>
$(document).ready(function(){
   $('.t-datepicker').tDatePicker({
     autoClose:true,
     durationArrowTop:200,
     limitDateRanges:16,
     numCalendar:2,
     limitNextMonth:2,
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
     dateDisabled:[false]
   }).on('eventClickDay',function(e, dataDate){
     var getDateInput = $('.t-datepicker').tDatePicker('getDateInputs');
      document.getElementById("h_startdate").value = getDateInput[0];
      document.getElementById("h_enddate").value = getDateInput[1];
   });
   
   var str = $("#form").serialize();
   $.ajax({
       async : true,
       type : "POST",
       dataType : "json",
       data : str,
       url : "/checkHostJson.do",
       success : function(data) {
          if (data.cnt != 0) {
        	  $("#insertHostBtn").text('호스트 수정');
           } else {
        	   $("#insertHostBtn").text('호스트 등록');
           }
       } 
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


<style>
	.rounded-circle { width: 80px; height: 70px;} 
	.card {float : left;}
</style>


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
                  <option value="find_host" selected="selected">호스트검색
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
      	<h2><strong>Find Host</strong></h2>
		
      	<h5>요청하신 키워드에 관한 게시글 수 : ${countHost }</h5>
      	
      	<div id="map" style="width:760px;height:400px;margin-top:20px; margin:auto;"></div>
      	
      	<br>
      	<form method="post" name="frm">
      	<table class="table">
      	<c:choose>
	      	<c:when test="${empty hostList}">
	      			<tr>
	      				<td>요청하신 도시의 정보가 존재하지 않습니다.</td>
	      			</tr>
	      	</c:when>                    
	      	<c:otherwise>
      		<c:forEach var="list" items="${hostList}">
      		<input type="hidden" name="m_id" value="${list.m_id }" id="m_id" />
	      		<span class="card" style="width:200px; height: 500px; margin : auto; text-align: center;" onmouseover="cardOver('${list.m_id}')">
				    <img class="card-img-top" src="${list.p_route}" alt="Card image" style="width:200px; height: 200px;">
				    <span class="card-body">
				      <h6 class="card-title">${list.m_id}</h6>
				      <hr />
				      <p class="card-text">${list.m_address}</p>
				      <hr />
				      <button type="button" class="btn btn-light" data-toggle="modal" data-target="#myModal${list.m_id }">Open modal</button>
				    </span>
			    </span>
      		</c:forEach>
      		</c:otherwise>     		
      	</c:choose>	
      	<!-- ---------------------------------------------------------------- -->
      	<tr>
			<td colspan="4">
				<ol class="paging">
				
				<%--[이전으로]에 대한 사용여부 처리 --%>
				<c:choose>
				<%-- 사용불가(disable) : 첫번째 블록인 경우 --%>
					<c:when test="${pvo.beginPage == 1 }">
						<li class="disable">◀</li>
					</c:when>
				<%--사용가능(enable) : 두번째 이상(첫번째 아닌경우) --%>
					<c:otherwise>
						<li>
							<a href="../getHostList.do?cPage=${pvo.beginPage - 1 }">◀</a>
						</li>
					</c:otherwise>	
				</c:choose>
				
				<%-- 블록내에 표시할 페이지 반복처리(시작페이지~끝페이지)--%>
				<c:forEach var="k" 
						begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:choose>
					<c:when test="${k == pvo.nowPage }">
						<li class="now">${k }</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="../getHostList.do?cPage=${k }">${k }</a>
						</li>
					</c:otherwise>
				</c:choose>
				</c:forEach>
				
				<%--[다음으로]에 대한 사용여부 처리 --%>
				<c:choose>	
					<%--사용불가(disable) : endPage가 전체페이지수 보다 크거나 같으면 --%>
					<c:when test="${pvo.endPage >= pvo.totalPage }">
						<li class="disable">▶</li>
					</c:when>
					<%--사용가능(enable) --%>
					<c:otherwise>
						<li>
							<a href="../getHostList.do?cPage=${pvo.endPage + 1 }">▶</a>
						</li>
					</c:otherwise>
				</c:choose>
					<li style="text-align:right;">
						<button type="button" id="insertHostBtn" class="btn btn-outline-secondary" data-toggle="modal" data-target="#insertHost" onclick="login_chk()">호스트 등록</button>
					</li>
				</ol>
			</td>
		</tr>
      	
      	<!-- ---------------------------------------------------------------- -->
      	</table>
      	</form>
      	
      </div>
    </section><!-- #about -->
		
 

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  
  <!-- The Modal -->
	<c:forEach var="list" items="${hostList}">
	  <div class="modal fade" id="myModal${list.m_id}">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">&nbsp;&nbsp;${list.m_id } 님의 Host profile</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	          <table class="table">
	          	<tr class="text-center">
	          		<td><img class="rounded" style="width: 300px; height: 300px; margin: auto;" src="${list.p_route }"></td>
	          		<td>최대 방문인원<br><br>선호성별<br><br>흡연여부<br><br>반려동물<br><br>자녀여부<br><br>입실날짜<br><br>퇴실날짜</td>
	          		<td>${list.h_maximumguest} 명<br><br>${list.h_gender}<br><br>${list.h_smoke}<br><br>${list.h_haspet}<br><br>${list.h_haschild}<br><br>${list.h_startdate}<br><br>${list.h_enddate}</td>
	          	</tr>
	          	<tr class="text-center">
	          		<td>숙소 형태</td>
	          		<td colspan="2">${list.h_roomtype}</td>
	          	</tr>
	          	<tr class="text-center">
	          		<td>위치</td>
	          		<td colspan="2">${list.m_address}</td>
	          	</tr>
	          	<tr class="text-center">
	          		<td>지켜야할 규칙</td>
	          		<td colspan="2">${list.h_rule}</td>
	          	</tr>
	          	
	          </table>
	        </div>
	
	        <!-- Modal footer -->
	        <div class="modal-footer">
	        <form name="frm">                                                           <!-- onclick="../insertMessage.do?message_receiver=${list.m_id}" -->
	          <button type="button" class="btn btn-outline-secondary" data-dismiss="modal" onclick='sendMessage("${list.m_id}")'>Send Message</button>
	        </form>   
	          <c:if test="${list.m_id eq member.m_id}">
	            <button type="button" class="btn btn-outline-secondary" data-dismiss="modal" onclick='deleteHost("${list.m_id}")'>등록해제</button>
	          </c:if>
	        </div>
	        
	      </div>
	    </div>
	  </div>
	</c:forEach>
	
	
	<!-- The Modal -->
  <div class="modal fade" id="insertHost">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">호스트 등록</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div class="row">
            <div class="col-md-12">
              <form method="POST" id="form">
                    <input id="m_id" type="hidden" class="form-control" name="m_id" value="${member.m_id }">
                    
                    <div class="form-group row">
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
                    
                      <div class="form-group row">
                       <label for="h_maximumguest" class="col-4 col-form-label">최대 투숙객</label> 
                       <div class="col-8">
                         <select class="form-control" id="h_maximumguest" name="h_maximumguest">
	                         <option selected="selected">1</option>
	                         <option>2</option>
	                         <option>3</option>
	                         <option>4</option>
                    	 </select>
                                                          
                       </div>
                      </div>
                              
                      <div class="form-group row">
                        <label for="h_gender" class="col-4 col-form-label">선호 성별</label> 
                          <div class="col-8">
                           <select class="form-control" id="h_gender" name="h_gender">
                          	 <option selected="selected">남자</option>
                       		 <option>여자</option>
                           </select>
                          </div>
                      </div>
                           
                      <div class="form-group row">
                        <label for="h_smoke" class="col-4 col-form-label">흡연 가능 여부</label> 
                        <div class="col-8">
                            <select class="form-control" id="h_smoke" name="h_smoke">
                       		  <option selected="selected">X</option>
                         	  <option>O</option>
                            </select>
                        </div>
                       </div>
                       
                       <div class="form-group row">
                         <label for="h_haspet" class="col-4 col-form-label">펫 유무</label> 
                         <div class="col-8">
                         <select class="form-control" id="h_haspet" name="h_haspet">
                       		<option selected="selected">X</option>
                          	<option>O</option>
                         </select>
                         </div>
                       </div>
                        
                       <div class="form-group row">
                         <label for="h_haschild" class="col-4 col-form-label">자녀 유무</label> 
                         <div class="col-8">
                           <select class="form-control" id="h_haschild" name="h_haschild">
                     	     <option selected="selected">X</option>
                             <option>O</option>
                           </select>
                         </div>
                       </div>
                           
                       <div class="form-group row">
                         <label for="h_roomtype" class="col-4 col-form-label">방 종류</label> 
                         <div class="col-8">
                           <select class="form-control" id="h_roomtype" name="h_roomtype">
	                          <option selected="selected">싱글 베드</option>
	                          <option>더블 베드</option>
	                          <option>퀸 베드</option>
                              <option>소파</option>
                           </select>
                         </div>
                       </div>
                        
                       <div class="form-group row">
                         <label for="h_rule" class="col-4 col-form-label">숙소 이용시 주의사항</label> 
                         <div class="col-8">
                            <textarea rows="5" cols="10" id="h_rule" name="h_rule" class="form-control"></textarea>
                         </div>
                       </div>
                        
                              
                       <div class="modal-footer">
                       	 <div class="form-group m-0">
			               <button type="button" class="btn btn-outline-secondary" data-dismiss="modal" onclick="insertHost(this.form)">완료</button>
			               <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
			             </div>
			           </div>
                     </form>
               </div>
           </div>
        </div>

        <!-- Modal footer -->
        
      </div>
    </div>
  </div>


<!--Modal: Login with Avatar Form-->
<div class="modal fade" id="modalLoginAvatar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog cascading-modal modal-avatar modal-sm" role="document">
    <!--Content-->
    <div class="modal-content">

      <!--Header-->
      <div class="modal-header">
        <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20%281%29.jpg" alt="avatar" class="rounded-circle img-responsive">
      </div>
      <!--Body-->
      <div class="modal-body text-center mb-1">

        <h5 class="mt-1 mb-2">Maria Doe</h5>

        <div class="md-form ml-0 mr-0">
          <input type="password" type="text" id="form29" class="form-control form-control-sm validate ml-0">
          <label data-error="wrong" data-success="right" for="form29" class="ml-0">Enter password</label>
        </div>

        <div class="text-center mt-4">
          <button class="btn btn-cyan mt-1">Login <i class="fas fa-sign-in ml-1"></i></button>
        </div>
      </div>

    </div>
    <!--/.Content-->
  </div>
</div>
<!--Modal: Login with Avatar Form-->

<div class="text-center">
  <a href="" class="btn btn-default btn-rounded" data-toggle="modal" data-target="#modalLoginAvatar">Launch
    Modal Login with Avatar</a>
</div>

<%@include file="/views/footer.jsp"%>
<%@include file="/views/footerScript.jsp"%>


</body>
</html> 