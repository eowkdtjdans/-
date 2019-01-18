 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"> 
  <title>Gukbong WorlD</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description"> 
 

  <!-- Favicons -->
  <link href="views/img/upload/2018112745738975.jpg" rel="icon">
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

/* .hr{
	height: 20px;
	color: red;
} */
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
  
  
  
<%--       <nav id="nav-menu-container">
        <ul class="nav-menu">
        <li class="menu-has-children"><a href="#">내 정보</a>
            <ul>            
              <li><a href="../../ModifyPwdMember.do">비밀번호 변경</a></li> <!-- Ajax  -->
              <li><a href="../../ModifyPhoneMember.do">핸드폰 변경</a></li> <!-- Ajax -->
              <li><a href="../../ModifyAddressMember.do">주소 변경</a></li> <!-- 그냥 처리 -->
              <li><a href="../../DeleteMember.do">회원 탈퇴</a></li> <!-- 그냥 처리 -->
              <li><a  href="../../insertMessage.do" >쪽지 작성</a></li>  
              <li><a  href="../../chat.do" >웹소켓 채팅</a></li> 
              <li><a href="../../loginMember.do" >로그인</a></li>
            <li><a  href="../../insertMember.do" >회원가입</a></li> 
            <li><a  href="../../insertProfile.do" >프로필 관리</a></li> 
            <li><a  href="../../myProfile.do" >마이 프로필</a></li> 
            <li><a  href="../../profileImageInsert.do" >프로필 이미지 관리</a></li> 
            <li><a  href="../../getSendMessageList.do" >보낸 쪽지 리스트</a></li> 
            <li><a  href="../../getReceiveMessageList.do" >받은 쪽지 리스트</a></li> 
            <li><a  href="../../checkMessage.do" >쪽지 체크</a></li> 
            <li><a  href="../../noticeMessage.do" >쪽지 알림</a></li> 
            <li><a href="../testImage.do?m_id=${member.m_id }">테스트이미지</a></li>            
            </ul> 
          </li>
                  
        <li>
       	 <a href="../../getReceiveMessageList.do">
       	 <i class="far fa-envelope fa-2x" id="noticeMessageCount2"></i></a>
        </li>
          
          <li><a href="#portfolio">포트폴리오</a></li>      
          <li><a href="../../findIdMember.do">아이디</a></li >
          <li><a href="../../findPwdMember.do">비밀번호</a></li>
          <li><a href="../../logoutMember.do">로그아웃</a></li>
                    
        </ul>
        </nav> --%>  
  
  
  
  
  
  

   <!--==========================
      About Us Section
    ============================-->    
<section id="about">
      <div class="container">
        <header class="section-header">        
          <h3>Couch Surfing</h3>
          <p>카우치 서핑(Couch Surfing)은 잠을 잘수 있는 쇼파를 의미하는 카우치(Couch)와 파도를 타다는 서핑(Surfing)의 합성어로 숙박 혹은 가이드까지 받을 수 있는, 여행자들을 위한 비영리 커뮤니티 입니다.</p>
        </header>
       
        <div class="row about-cols">

          <div class="col-md-4 wow fadeInUp">
            <div class="about-col">
              <div class="img">
                <img src="views/img/gukbong1.jpg" alt="" class="img-fluid">
                <div class="icon"><i class="ion-ios-speedometer-outline"></i></div>
              </div>
              <h2 class="title"><a href="#">Find a Host</a></h2>
              <p>
                	호스트와 연계하고 CouchSurfing 플랫폼을 통해 숙박 여부를 확인하세요. 호스트와의 숙박은 무료입니다.
              </p>
            </div>
          </div>
 
          <div class="col-md-4 wow fadeInUp" data-wow-delay="0.1s">
            <div class="about-col">
              <div class="img">
                <img src="views/img/gukbong2.jpg" alt="" class="img-fluid">
                <div class="icon"><i class="ion-ios-list-outline"></i></div>
              </div>
              <h2 class="title"><a href="#">Join Events</a></h2>
              <p>
               	 다른 도시 또는 귀하의 도시에서 여행자를 만나세요! 항상 새로움을 느낄 수 있습니다.
              </p>
            </div>
          </div>

          <div class="col-md-4 wow fadeInUp" data-wow-delay="0.2s">
            <div class="about-col">
              <div class="img">
                <img src="views/img/gukbong3.jpg" alt="" class="img-fluid">
                <div class="icon"><i class="ion-ios-eye-outline"></i></div>
              </div>
              <h2 class="title"><a href="#">Discover Amazing People</a></h2>
              <p>
              	호스트들은 그들의 집을 열고 그들의 삶을 공유합니다. 호스트와 함께하여 새로운 문화를 느껴보세요.
              </p>
            </div>
          </div>
   </div>
      </div>
    </section><!-- #about -->


    <!--==========================
      Portfolio Section
    ============================-->
    <section id="portfolio"  class="section-bg" >
      <div class="container">

        <header class="section-header">
          <h3 class="section-title">Event Picture</h3>
        </header>

        <div class="row">
          <div class="col-lg-12">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">All</li>
              <li data-filter=".filter-asia" onclick="asia()">아시아</li>
              <li data-filter=".filter-europe">유럽</li>
              <li data-filter=".filter-oceania">오세아니아</li>
              <li data-filter=".filter-northAmerica">북아메리카</li>
              <li data-filter=".filter-southAmerica">남아메리카</li>
            </ul>
          </div>
        </div>

    <div class="row portfolio-container">

	<c:forEach var="list" items="${selectRegionAsia }">
          <div class="col-lg-4 col-md-6 portfolio-item filter-asia wow fadeInUp">
            <div class="portfolio-wrap">             
                <a href="../getEvent.do?e_idx=${list.e_idx }"><img src="${list.e_img }" class="img-fluid" alt=""></a>
              
              <div class="portfolio-info">
                <h4><a href="../getEvent.do?e_idx=${list.e_idx }">${list.e_name }</a></h4>
                <p>${list.e_tag }</p>
              </div>
            </div>
          </div>          
   </c:forEach>
      
          
	<c:forEach var="list" items="${selectRegionEurope }">
          <div class="col-lg-4 col-md-6 portfolio-item filter-europe wow fadeInUp" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
                <a href="../getEvent.do?e_idx=${list.e_idx }"><img src="${list.e_img }" class="img-fluid" alt=""></a>

              <div class="portfolio-info">
                <h4><a href="../getEvent.do?e_idx=${list.e_idx }">${list.e_name }</a></h4>
                <p>${list.e_tag }</p>
              </div>
            </div>
          </div>
	</c:forEach>


	<c:forEach var="list" items="${selectRegionOceania }">
          <div class="col-lg-4 col-md-6 portfolio-item filter-oceania wow fadeInUp" data-wow-delay="0.2s">
            <div class="portfolio-wrap">
                <a href="../getEvent.do?e_idx=${list.e_idx }"><img src="${list.e_img }" class="img-fluid" alt=""></a>

              <div class="portfolio-info">
                <h4><a href="../getEvent.do?e_idx=${list.e_idx }">${list.e_name }</a></h4>
                <p>${list.e_tag }</p>
              </div>
            </div>
          </div>
	</c:forEach>



	<c:forEach var="list" items="${selectRegionNorthAmerica }">
          <div class="col-lg-4 col-md-6 portfolio-item filter-northAmerica wow fadeInUp">
            <div class="portfolio-wrap">
                <a href="../getEvent.do?e_idx=${list.e_idx }"><img src="${list.e_img }" class="img-fluid" alt=""></a>

              <div class="portfolio-info">
                <h4><a href="../getEvent.do?e_idx=${list.e_idx }">${list.e_name }</a></h4>
                <p>${list.e_tag }</p>
              </div>
            </div>
          </div>
    </c:forEach>    
          
                    
	<c:forEach var="list" items="${selectRegionSouthAmerica }">
          <div class="col-lg-4 col-md-6 portfolio-item filter-southAmerica wow fadeInUp" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
                <a href="../getEvent.do?e_idx=${list.e_idx }"><img src="${list.e_img }" class="img-fluid" alt=""></a>

              <div class="portfolio-info">
                <h4><a href="../getEvent.do?e_idx=${list.e_idx }">${list.e_name }</a></h4>
                <p>${list.e_tag }</p>
              </div>
            </div>
          </div>
	 </c:forEach>    



     </div>

     </div>
    </section><!-- #portfolio -->


<!-- service -->
<section id="services">
      <div class="container">

        <header class="section-header wow fadeInUp">
          <h3><img src="/views/img/saysomething.png" style="width: 60px; height: 60px;">&nbsp;Say something</h3>
          <p>카우치 서핑에 대한 안좋은 뉴스를 본 분들도 있을 것입니다.
			하지만 정말 극소수의 일이고 너무 걱정이 되는 사람은 하지 않는 편이 좋다고 생각합니다.
			혹시 모를 상황에 대비해 미리 내가 어떻게 처신할지 
			생각해 놓는 것도 좋은 방법입니다. 단편적인 일들로 
			카우치 서핑에 대해 안좋은 인식을 갖지 않았으면 좋겠습니다.</p>
        </header>

        <div class="row">

          <div class="col-md-12 box wow bounceInUp" data-wow-duration="1.4s">
            <div class="icon"><img src="/views/img/why.png" style="width: 70px; height: 70px;"></div>
            <h4 class="title"><a href="">Why do Couch Surfing</a></h4>
            <p class="description">개인적인 이유들이 있을테지만 가장 큰 장점은
			여행자와 호스트가 서로의 생활에 깊숙히 관여하게 됨으로써			
			여행지에 대한 이해도를 넓히고 서로의 문화를 느낄 수			
			있게 되는 점입니다.</p>
          </div>
          <div class="col-md-12 box wow bounceInUp" data-wow-duration="1.4s">
            <div class="icon">&emsp;<img src="/views/img/problem.png" style="width: 40px; height: 40px;">&nbsp;&nbsp;&nbsp;</div>
            <h4 class="title"><a href="">Couch Surfing Notice</a></h4>
            <p class="description">&nbsp;많은 사람들이 단순히 호스트를 구하는데에만 너무 집중하는 것 같습니다.
			가장 중요한 것은 카우치 서핑에 대한 서로의 이해도가 높아야한다는 점입니다.
			카우치 서핑을 구하는 사람의 입장에서 얘기 하자면 카우치 서핑은 무료 호텔이 아닙니다.
			혼자있고 싶다면, 그리고 단순히 잠자리만을 위한다면 절대로 하지 않아야 합니다.
			여행을 즐기며 문화나 그들의 이야기를 나누는 소통의 자세가 필요합니다.</p>
          </div>
          <div class="col-md-12 box wow bounceInUp" data-wow-duration="1.4s"> 
            <div class="icon">&nbsp;&nbsp;  <img src="/views/img/tip.png" style="width: 45px; height: 45px;"></i></div>
            <h4 class="title"><a href="">&nbsp;Couch Surfing Tip</a></h4>
            <p class="description">&nbsp;카우치 서핑을 하면서 호스트가 무언가 불편한 요구를 할 수 있습니다.
			강제로 청소를 시킨다던지 심하면 성적인 발언까지 하는 경우입니다.
			그런 상황에 직면했을 때 가장 중요한 것은 자신이 생각했을때 불편한 생각이
			든다면 정확하게 싫다는 표현을 하는 것입니다.
            </p>
          </div>
      
    

        </div>

      </div>
    </section><!-- #services -->





	 <!--==========================
      Contact Section
    ============================-->
    <section id="contact" class="section-bg wow fadeInUp">
      <div class="container">

        <div class="section-header">
          <h3>관리자에게 문의</h3>
          <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque</p>
        </div>

        <div class="row contact-info">

          <div class="col-md-4">
            <div class="contact-address">
              <i class="ion-ios-location-outline"></i>
              <h3>주소</h3>
              <address>서강대 비트캠프</address>
            </div>
          </div>

          <div class="col-md-4">
            <div class="contact-phone">
              <i class="ion-ios-telephone-outline"></i>
              <h3>연락처</h3>
              <p>+82 1039222459</p>
            </div>
          </div>

          <div class="col-md-4">
            <div class="contact-email">
              <i class="ion-ios-email-outline"></i>
              <h3>이메일</h3>
              <p>gukbongworld@gmail.com</p>
            </div>
          </div>

        </div>

        <div class="form">
          <div id="sendmessage">Your message has been sent. Thank you!</div>
          <div id="errormessage"></div>
       <!--    <form action="" method="post" role="form" class="contactForm">
               <div class="form-group">
                <input type="email" class="form-control" name="m_id" id="m_id" placeholder="연락 받으실 이메일을 입력하세요."/>
                <div class="validation"></div>
              </div>
			
			
            <div class="form-group">
              <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
              <div class="validation"></div>
            </div>
            <div class="form-group">
              <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
              <div class="validation"></div>
            </div>
            <div class="text-center"><button type="submit">Send Message</button></div>
          </form>
        </div>

      </div> -->
      <form method="POST" class="my-login-validation" id="form">
			<input id="m_id" type="hidden" class="form-control" name="m_id">	
			<input id="message_receiver" name="message_receiver" type="hidden" class="form-control" value="admin">	
			<div class="form-group">
				 <input type="email" class="form-control" name="message_sender" id=message_sender placeholder="연락 받으실 이메일을 입력하세요."/>
			</div>
			
			<div class="form-group">
				<textarea rows="1" cols="10" id="message_title" name="message_title" class="form-control" placeholder="제목을 입력하세요."></textarea>
			</div>
			
			<div class="form-group">
				<textarea rows="5" cols="10" id="message_content" name="message_content" placeholder="문의내용을 입력하세요." class="form-control"></textarea>
			</div>
			
			
			<div class="form-group m-0">
				<button type="button" class="btn btn-default" onclick="sendMessage(this.form)">
					쪽지 보내기
				</button>
			</div>
			
		</form>
	</div>
</div>
    </section><!-- #contact -->
    
    <script>
    function sendMessage(frm) {
    	 var email = frm.message_sender.value;
    	 alert(email);
    	 var emailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

    	 if(emailCheck.test(email)==false || email == ""){
				alert("이 메일형식이 올바르지 않습니다.");
				frm.m_id.value="";
				frm.m_id.focus();
				return false;
		   } else {
    	alert("관리자에게 문의사항이 전달 되었습니다. 최대한 빠르게 이메일로 문의사항을 보내겠습니다.");
		frm.action = "../../MessageToAdmin.do";
		frm.submit();
			   
		   }
    	
    }
    </script>







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