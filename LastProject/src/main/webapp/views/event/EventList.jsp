<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"> 
  <title>이벤트 게시판</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
 
 
 <%@include file="/views/listHeader.jsp"%>
 
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
        zoom: 9, //지도 줌
        mapTypeId: google.maps.MapTypeId.ROADMAP, //지도 타입(변경 x)
        center: new google.maps.LatLng("${firstLat}", "${firstLng}") //맵이 로딩됬을때 시작지점
    };
    
    var addCircle = new google.maps.Circle({ //원형 그리기
    	center: new google.maps.LatLng("${firstLat}", "${firstLng}"), //원형의 중앙점
    	radius: 30000,			//원형 범위
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
			url: "../google.do",
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
					    		url: markerList[i].icon,
					    	}
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


</SCRIPT>
<style>
	.rounded-circle { width: 80px; height: 70px;} 
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
                  <option value="find_host">호스트검색
                  <option value="find_event" selected="selected">이벤트검색
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
      	<h2><strong>Find Event</strong></h2>
      	<h5>요청하신 키워드에 관한 게시글 수 : ${countEvent }</h5>
      	
      	<div id="map" style="width:760px;height:400px;margin-top:20px;"></div>
      	<br>
      	<form method="post" name="frm">
      	<table class="table">
      	<c:choose>
	      	<c:when test="${empty eventList}">
	      			<tr>
	      				<td>요청하신 도시의 정보가 존재하지 않습니다.</td>
	      			</tr>
	      	</c:when>                    
	      	<c:otherwise>
      		<c:forEach var="list" items="${eventList}">
	      		<tr>	      			
	      			<th style="width: 70%">
	      				<a href="../getEvent.do?e_idx=${list.e_idx }">${list.e_name }</a>&nbsp;&nbsp;<span id="detcnt">[${list.e_count}]</span> &emsp;<span id="date">${list.e_startdate } ~ ${list.e_enddate }</span>
	      			</th>
	      			<td style="width:15%"> &nbsp;&nbsp;&nbsp;&nbsp; <a id="good" href="#" ><img src="views/img/good.png" style="width: 20px; height: 20px;">  좋아요 ${list.e_upvote }</a> &nbsp;&nbsp;&nbsp;&nbsp; </td>
	      			<td style="width:15%"><img src="views/img/lookup.PNG" style="width: 20px; height: 20px;"> ${list.e_reviewcount }</td>
	      		</tr>
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
							<a href="../getEventList.do?cPage=${pvo.beginPage - 1 }">◀</a>
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
							<a href="../getEventList.do?cPage=${k }">${k }</a>
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
							<a href="../getEventList.do?cPage=${pvo.endPage + 1 }">▶</a>
						</li>
					</c:otherwise>
				</c:choose>
				</ol>
			</td>
		</tr>
      	
      	<!-- ---------------------------------------------------------------- -->
      	</table>
      	</form>
      	
      </div>
    </section><!-- #about -->
  


  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>


<%@include file="/views/footer.jsp"%>
<%@include file="/views/footerScript.jsp"%>

</body> 
</html>
