 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"> 
  <title>Gukbong WorlD</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description"> 
 

  <!-- Favicons -->
  <!-- Favicons -->
  <link href="views/img/happy.png" rel="icon">
  <link href="views/img/happy.png" rel="apple-touch-icon">
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

/* .hr{
   height: 20px;
   color: red;
} */
	a{
		color: #4B89DC;  
	} 
</style>
<style>

	.paging { list-style: none; }
	.paging li {
		float: left;
		margin-right: 30px;
	}
	.paging li a {
		text-decoration: none;
		 display: block;
		padding: 3px 3px; 
		color: black;
	}

	.paging .disable {
		padding: 3px 3px;
		color: silver;
	}
	.paging .now {
		padding: 3px 3px;
		font-weight: bold;
	}

</style>

<script>
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
         $("<input type='text' id='advice' name='searchKeyword'>").insertBefore("#search");
         
      } else {
         $("#advice").remove();
         $("#autocomplete").show();
         $("#autocomplete").attr("name", "searchKeyword");
      }
   })
   
})
</script>
<script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&callback=initAutocomplete&key=AIzaSyAfB2qQnvAuU2YFFqi8hrPWfjJNyxl5kWc" async defer></script>
 
 
<script type="text/javascript">
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
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!------ Include the above in your HEAD tag ---------->




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
  </header><!-- #header -->


<br>  
<div class="container">
   <div class="row">
      <div class="col-md-3 ">
           <div class="list-group ">
           <a href="../../myProfile.do" class="list-group-item list-group-item-action "><strong>My Profile 메인</strong></a>
              <a href="../../insertProfile.do" class="list-group-item list-group-item-action "><strong>프로필 수정</strong></a>
              <a href="../../ModifyPhoneMember.do" class="list-group-item list-group-item-action "><strong>핸드폰 변경</strong></a>
              <a href="../../ModifyPwdMember.do" class="list-group-item list-group-item-action "><strong>비밀번호 변경</strong></a>
              <a href="../../ModifyAddressMember.do" class="list-group-item list-group-item-action "><strong>주소 변경</strong></a>
              <a href="../../profileImageInsert.do" class="list-group-item list-group-item-action"><strong>이미지 업로드</strong></a>
              <a href="../../profileImageList.do?m_id=${member.m_id }" class="list-group-item list-group-item-action"><strong>프로필 이미지 관리</strong></a>
              <a href="../../HostImageList.do?m_id=${member.m_id }" class="list-group-item list-group-item-action"><strong>호스트 이미지 관리</strong></a>
              <a href="../../getReceiveMessageList.do" class="list-group-item list-group-item-action"><strong>받은 쪽지함</strong></a>
              <a href="../../getSendMessageList.do" class="list-group-item list-group-item-action"><strong>보낸 쪽지함</strong></a>
              <a href="../../myPost.do?m_id=${member.m_id }&cPage=1" class="list-group-item list-group-item-action active"><strong>내 글</strong></a>
              <a href="../../myPost2.do?m_id=${member.m_id }&cPage=1" class="list-group-item list-group-item-action"><strong>내 댓글</strong></a>
              <a href="../../loginRecordList.do?ll_id=${member.m_id }&cPage=1" class="list-group-item list-group-item-action"><strong>로그인 기록</strong></a>
              <a href="../../DeleteMember.do?m_id=${member.m_id }" class="list-group-item list-group-item-action"><strong>회원탈퇴</strong></a>
            </div>             
      </div>

		
		<div class="col-md-9">
		    <div class="card">
     
                	<!-- 데이타 표시 -->
					<form>
					<table class="table">
						<tr>
							<td colspan="3" style="font-size: 1.2em;"><img src="views/img/post.png" style="width: 60px; height: 60px;"> <strong>내가 쓴 게시글</strong></td>
						</tr>
						<c:forEach var="myPostList" items="${myPostList }">
						<%-- <tr>
							<td style="text-align :center;">
							<a href="../getLocalAdvice.do?l_idx=${myPostList.l_idx }&m_id=${myPostList.m_id }&cPage=1">${myPostList.l_subject }</a>
							
							</td>
							<td style="text-align :center;">${myPostList.l_content }${profile.p_route }</td>
							<td><fmt:formatDate value="${myPostList.l_date }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
						</tr> --%>
						<tr>
							<td style="width: 33%"><img src="${profile.p_route }" style="width: 50px; height: 50px;" class="rounded-circle"><a href="../getLocalAdvice.do?l_idx=${myPostList.l_idx }&m_id=${myPostList.m_id }&cPage=1"> &nbsp;${member.m_id }</a></td>
							<td style="width: 44%; padding-top: 21px;">
								<a href="../getLocalAdvice.do?l_idx=${myPostList.l_idx }&m_id=${myPostList.m_id }&cPage=1">${myPostList.l_subject }</a>
							</td>
							<td style="width: 23%; padding-top: 21px;" class="text-muted"><fmt:formatDate value="${myPostList.l_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
						</c:forEach>
						
				  	<!-- ---------------------------------------------------------------- -->
				      	<tr>
							<td colspan="3">
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
											<a href="../../myPost.do?m_id=${member.m_id }&cPage=${pvo.endPage + 1 }">◀</a>
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
											<a href="../../myPost.do?m_id=${member.m_id }&cPage=${k }">${k }</a>
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
											<a href="../../myPost.do?m_id=${member.m_id }&cPage=${pvo.endPage + 1 }">▶</a>
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
		</div>
	</div> 
</div><%@include file="/views/footer.jsp"%>
</body>
</html>