 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"> 
  <title>BizPage Bootstrap Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
 

  <!-- Favicons -->
  <link href="views/img/favicon.png" rel="icon">
  <link href="views/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="views/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="views/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="views/lib/animate/animate.min.css" rel="stylesheet">
  <link href="views/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="views/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="views/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="views/css/style.css" rel="stylesheet">

  <!-- =======================================================
    Theme Name: BizPage
    Theme URL: https://bootstrapmade.com/bizpage-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
  
<style>
	body{
		padding-top: 70px;
	}
	a{
		color:#5e7e9b;
	}
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
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&callback=initAutocomplete&key=AIzaSyAfB2qQnvAuU2YFFqi8hrPWfjJNyxl5kWc" async defer></script>
 
</head>

<body>

  <!--==========================
    Header
  ============================-->
  <header id="header">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="views/sub.jsp" class="scrollto">Couch Surfing</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="#intro"><img src="img/logo.png" alt="" title="" /></a>-->
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
        <li class="menu-has-children"><a href="">Drop Down</a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
              <li><a href="#">Drop Down 5</a></li>
            </ul>
          </li>
          <li><a href="#about">쪽지</a></li>
          <li><a href="#portfolio">마이 프로필</a></li>         
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->

 
    

<!-- 키워드로 검색 -->
<form action="../sub.do" method="post">
	<table class="border-none">
		<tr>
			<td>
				<select name="searchCondition">			
					<%-- <c:forEach var="option" items="${conditionMap }">
						<option value="${option.value }">${option.key }
					</c:forEach> --%>
					<option value="find_travler">여행자검색
					<option value="find_host">호스트검색
					<option value="find_event">이벤트검색
					<option value="find_advice">현지정보검색
				</select>
				<input id="autocomplete" placeholder="Enter your address" type="text" name="searchKeyword">
				
				<input class="field" id="lat" type="hidden" name="lat"/>
				<input class="field" id="lng" type="hidden" name="lng"/>
				
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
</form>


   <!--==========================
      About Us Section
    ============================-->    
<section id="about">
      <div class="container">
      	<h2><strong>Find Travelers</strong></h2>
      	<h5>요청하신 키워드에 관한 게시글 수 : ${countTravelers }</h5>
      	<div class="text-right"><a href="../writeLocalAdvice.do" class="btn btn-outline-secondary">게시글 작성</a></div>
      	<br>
      	<form method="post" name="frm">
      	<table class="table">
      	<c:choose>
	      	<c:when test="${empty travelersList}">
	      			<tr>
	      				<td>요청하신 도시의 정보가 존재하지 않습니다.</td>
	      			</tr>
	      	</c:when>                    
	      	<c:otherwise>
      		<c:forEach var="list" items="${travelersList}">
	      		<tr>
	      			<td rowspan="3">${list.p_route}</td>
	      			<td>${list.m_id}</td>
	      			<td>${t_dateofvisit}</td>
	      			<td>${list.t_country}</td>
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
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-info">
            <h3>Couch Surfing</h3>
            <p>카우치 서핑(Couch Surfing)은 잠을 잘수 있는 쇼파를 의미하는 카우치(Couch)와 파도를 타다는 서핑(Surfing)의 합성어로 숙박 혹은 가이드까지 받을 수 있는, 여행자들을 위한 비영리 커뮤니티 이다.</p>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Home</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">About us</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Services</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-contact">
            <h4>Contact Us</h4>
            <p>
             	 비트캠프 신촌센터 <br>
              Seoul, NY 535022<br>
              Korea <br>
              <strong>Phone:</strong> 010-5575-4786<br>
              <strong>Email:</strong> test@test.com<br>
            </p>

            <div class="social-links">
              <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
              <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
              <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
              <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
              <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
            </div>

          </div>

          <div class="col-lg-3 col-md-6 footer-newsletter">
            <h4>Couch Surfing tip</h4>
            <p>만나는 사람들과 대화를 많이 하려고 시도하세요.
				그 의사소통보다 더 중요한 건 안전이다. 인증이 된 멤버인지, 타인들이 남긴 레퍼런스(리뷰)는 긍정적인지, 올려둔 사진은 괜찮은지... 감각을 키워가자.
				호스트든 게스트든 집에서는 위생을 유지하도록 하자.</p>
          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong>Couch Surfing</strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!--
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=BizPage
        -->
        Best <a href="https://bootstrapmade.com/">Bootstrap Templates</a> by BootstrapMade
      </div>
    </div> 
  </footer><!-- #footer -->

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

</body>
</html>
