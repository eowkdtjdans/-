 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"> 
  <title>현지정보 문의 게시판</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
 

   
 <%@include file="/views/listHeader.jsp"%>
<script>
	
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
                  <option value="find_advice" selected="selected">현지정보검색
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
      	<h2><strong>Find Local Advice</strong></h2>
      	<h5>요청하신 키워드에 관한 게시글 수 : ${countLocalAdvice }</h5>
      	<div class="text-right"><a href="../writeLocalAdvice.do" class="btn btn-outline-secondary">게시글 작성</a></div>
      	<br>
      	<form method="post" name="frm">
      	<table class="table">
      	<c:choose>
	      	<c:when test="${empty localAdviceList}">
	      			<tr>
	      				<td>요청하신 도시의 정보가 존재하지 않습니다.</td>
	      			</tr>
	      	</c:when>                    
	      	<c:otherwise>
      		<c:forEach var="list" items="${localAdviceList}">
	      		<tr>
	      			<td style="width: 7%"><img src="${list.p_route }"
                        class="rounded-circle" id="profileImage"
                        onerror='this.src="../views/img/people/fuckyou.jpg"'></td>
	      			<th style="width: 63%">
	      				<a href="../getLocalAdvice.do?l_idx=${list.l_idx }&m_id=${list.m_id}&cPage=1">${list.l_subject }</a>&nbsp;&nbsp;<span id="detcnt">[${list.lc_cnt}]</span> &emsp;<span id="date">${list.l_date }</span>
	      				<br>${list.m_id }
	      			</th>
	      			<td style="width:15%"> &nbsp;&nbsp;&nbsp;&nbsp; <a id="good" href="#" ><img src="views/img/good.png" style="width: 20px; height: 20px;">  좋아요 ${list.l_upvote }</a> &nbsp;&nbsp;&nbsp;&nbsp; </td>
	      			<td style="width:15%"><img src="views/img/lookup.PNG" style="width: 20px; height: 20px;"> ${list.l_reviewcount }</td>
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
							<a href="../getLocalAdviceList2.do?cPage=${pvo.beginPage - 1 }">◀</a>
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
							<a href="../getLocalAdviceList2.do?cPage=${k }">${k }</a>
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
							<a href="../getLocalAdviceList2.do?cPage=${pvo.endPage + 1 }">▶</a>
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


  
   
  <!--==========================
    Footer
  ============================-->
  <hr class="hr">

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
 
 
<%@include file="/views/footer.jsp"%>
<%@include file="/views/footerScript.jsp"%>

</body> 
</html>
