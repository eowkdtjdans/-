<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 3 | User Profile</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<!-- Ionicons -->
<link rel="stylesheet"
   href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../../dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
   .fas.fa-search {
      font-size: 14px;
   }
   .fas.fa-heart {
      font-size: 14px;
   }
   #content {
      display: block;
      overflow: hidden;
      text-overflow: ellipsis;
      
      line-height: 1.2;
      height: 3.6em;
      text-align: left;
      word-wrap: break-word;
      display: -webkit-box;
      -webkit-line-clamp: 3;
      -webkit-box-orient: vertical;
   }
   .subject {
      display: block;
      text-overflow:ellipsis;
      white-space:nowrap;
      word-wrap:normal;
      width:800px;
      overflow:hidden;
   }
   
   
   body {font-family: Arial, Helvetica, sans-serif;}

.myImg {
  border-radius: 5px;
  cursor: pointer;
  transition: 0.3s;
}

.myImg:hover {opacity: 0.7;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0);  
  background-color: rgba(0,0,0,0.9);  
 
}

/* Modal Content (image) */
.modal-content {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
}

/* Caption of Modal Image */
#caption {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
  text-align: center;
  color: #ccc;
  padding: 10px 0;
  height: 150px;
}

/* Add Animation */
.modal-content, #caption {  
  -webkit-animation-name: zoom;
  -webkit-animation-duration: 0.6s;
  animation-name: zoom;
  animation-duration: 0.6s;
}

@-webkit-keyframes zoom {
  from {-webkit-transform:scale(0)} 
  to {-webkit-transform:scale(1)}
}

@keyframes zoom {
  from {transform:scale(0)} 
  to {transform:scale(1)}
}

/* The Close Button */
.close {
  position: absolute;
  top: 15px;
  right: 35px;
  color: #f1f1f1;
  font-size: 40px;
  font-weight: bold;
  transition: 0.3s;
}

.close:hover,
.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
  .modal-content {
    width: 100%;
  }
}

.card-body {
	max-height: 610px;
	overflow: hidden;
}
.post {
	min-height: 150px;
}
.post2 {
	min-height: 50px;
}

#btnCenter {
	text-align: center;
}
</style>

<script>
	function imgModalOpen(p_route, m_id) {
	   	var modal = document.getElementById('myModal');
	   
	   	var img = document.getElementById(p_route);
	   	var modalImg = document.getElementById("img01");
	   	var captionText = document.getElementById("caption");
	   
	   	modal.style.display = "block";
	   	modalImg.src = img.src;
	   	captionText.innerHTML = img.alt;
	   	
	   	localStorage.p_route = p_route;
	   	localStorage.m_id = m_id;
	}
	function modalClose() { 
	   	var modal = document.getElementById('myModal');
	   	modal.style.display = "none";
	}
	
	function deleteImage() {
		var m_id = localStorage.m_id;
		var p_route = localStorage.p_route;
		
		location.href="/adminDeleteProfileImage.do?m_id="+m_id+"&p_route="+p_route;
	}

</script>
<script>
$(function(){
	var page = 610;
	$("#readBtn").click(function(){
		console.log(page += 610);
		$(".card-body").css("max-height", page);
	});
	
	$(".nav-link").click(function(){
		$(".card-body").css("max-height", 610);
	});
});
</script>
<script>
	function adminExit(m_id, m_pwd, m_phone) {
		if(confirm("정말 "+m_id+"님을 탈퇴시키시겠습니까?")){
			location.href="/DeleteMemberAdmin.do?m_id="+m_id+"&m_pwd="+m_pwd+"&m_phone="+m_phone;
		} else {
			return false;
		}
	}
</script>
</head>
<body class="hold-transition sidebar-mini">
   <div class="wrapper">
      <!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="/sub2.do" class="brand-link">
			<img src="/views/img/happy.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">Gukbong World</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="/views/img/administrator.png" class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="#" class="d-block">Admin</a>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<li class="nav-item has-treeview">
							<a href="/Admin.do?m_id=admin&m_pwd=admin" class="nav-link"><i class="fas fa-home"></i>
								<p>메인화면</p>
							</a>
						</li>
						<li class="nav-item has-treeview">
							<a href="/userAdmin.do" class="nav-link active"><i class="fas fa-users"></i>
								<p>클라이언트 관리</p>
							</a>
						</li>
						<li class="nav-item has-treeview">
							<a href="/eventAdmin.do" class="nav-link"><i class="fas fa-calendar-check"></i>
								<p>이벤트 관리</p>
							</a>
						</li>
						<li class="nav-item has-treeview">
							<a href="/adminGetReceiveMessageList.do" class="nav-link"><i class="fas fa-headset"></i>
								<p>문의 관리</p>
							</a>
						</li>
						<li class="nav-item has-treeview">
							<a href="/localAdviceAdminList.do" class="nav-link"><i class="fas fa-edit"></i>
								<p>게시글 관리</p>
							</a>
						</li>
						<li class="nav-item has-treeview">
							<a href="#" class="nav-link"><i class="fas fa-chart-pie"></i>
								<p>차트 통계 <i class="right fa fa-angle-left"></i></p>
							</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="/chartVisit.do"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p><i class="fab fa-internet-explorer"></i> 사이트 접속 기록</p>
								</a></li>
								<li class="nav-item"><a href="/views/admin/pages/charts/chartjs.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p><i class="fas fa-chart-bar"></i> 기타 통계</p>
								</a></li>
						</ul></li>
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
         <!-- Content Header (Page header) -->
         <section class="content-header">
            <div class="container-fluid">
               <div class="row mb-2">
                  <div class="col-sm-6">
                     <h1>Profile</h1>
                  </div>
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="/Admin.do?m_id=admin&m_pwd=admin">Home</a></li>
                        <li class="breadcrumb-item active">사용자 상세보기</li>
                     </ol>
                  </div>
               </div>
            </div>
            <!-- /.container-fluid -->
         </section>

         <!-- Main content -->
         <section class="content">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-md-3">

                     <!-- Profile Image -->
                     <div class="card card-primary card-outline">
                        <div class="card-body box-profile">
                           <div class="text-center">
                              <img class="profile-user-img img-fluid img-circle"
                                 src="${userAdminViewVO.p_route}"
                                 alt="User profile picture"
                                 onerror='this.src="/views/img/people/fuckyou.jpg"' style="width:300px; height: 200px;">
                           </div>

                           <h3 class="profile-username text-center">${userAdminViewVO.m_id}</h3>

                           <p class="text-muted text-center">${userAdminViewVO.p_job}</p>

                           <fmt:formatDate var="reg" value="${userAdminViewVO.m_regdate}" pattern="yyyy-MM-dd"/>
                           
                           <ul class="list-group list-group-unbordered mb-3">
                              <li class="list-group-item"><b>이름</b> <a
                                 class="float-right">${userAdminViewVO.m_name}</a></li>
                              <li class="list-group-item"><b>번호</b> <a
                                 class="float-right">${userAdminViewVO.m_phone}</a></li>
                              <li class="list-group-item"><b>가입일자</b> <a
                                 class="float-right">${reg}</a></li>
                           </ul>
                           <div id="btnCenter">
                              <button type="button" class="btn btn-outline-secondary" onclick="adminExit('${userAdminViewVO.m_id}', '${userAdminViewVO.m_pwd}', '${userAdminViewVO.m_phone}')">회원탈퇴</button>
						   </div>

                        </div>
                        <!-- /.card-body -->
                     </div>
                     <!-- /.card -->

                     <!-- About Me Box -->
                     <div class="card card-primary">
                        <div class="card-header">
                           <h3 class="card-title">유저 프로필 정보</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                           <strong><i class="fas fa-user-alt"></i> 회원소개</strong>

                           <p class="text-muted">${userAdminViewVO.p_aboutme}</p>

                           <hr>

                           <strong><i class="fas fa-home"></i> 주소</strong>

                           <p class="text-muted">${userAdminViewVO.m_address}</p>

                           <hr>

                           <strong><i class="fas fa-pencil-alt"></i> 취미 및 사용언어</strong>

                           <p class="text-muted">
                              <span class="tag tag-danger">${userAdminViewVO.p_hobby}</span>
                              <span class="tag tag-danger">${userAdminViewVO.p_language}</span>
                           </p>

                           <hr>
                           
                           <strong><i class="far fa-bookmark"></i> 사이트 방문목적</strong>

                           <p class="text-muted">${userAdminViewVO.p_purpose}</p>
                        </div>
                        <!-- /.card-body -->
                     </div>
                     <!-- /.card -->
                  </div>
                  <!-- /.col -->
                  <div class="col-md-9">
                     <div class="card">
                        <div class="card-header p-2">
                           <ul class="nav nav-pills">
                              <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">게시글 내역</a></li>
                              <li class="nav-item"><a class="nav-link" href="#timeline" data-toggle="tab">댓글 내역</a></li>
                              <li class="nav-item"><a class="nav-link" href="#settings" data-toggle="tab">프로필 목록</a></li>
                           </ul>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                           <div class="tab-content">
                              <div class="active tab-pane" id="activity">
                              
                              <c:forEach var="list" items="${userAdminPostList}">
                                 <!-- Post -->
                                 <div class="post">
                                    <div class="user-block">
                                       <img class="img-circle img-bordered-sm" src="${list.p_route}" alt="user image" onerror='this.src="/views/img/people/fuckyou.jpg"'>
                                       <span class="username">
                                          <a href="/getLocalAdvice.do?l_idx=${list.l_idx }&m_id=${list.m_id}" class="subject">${list.l_subject}</a>
                                       </span>
                                       <fmt:formatDate var="l_date" value="${list.l_date}" pattern="yyyy-MM-dd a hh:mm:ss"/>
                                       <span class="description">
                                          ${l_date}
                                       </span>
                                    </div>
                                    <!-- /.user-block -->
                                    <p id="content">${list.l_content}</p>

                                    <p>
                                       <i class="fas fa-search"> 조회수(${list.l_reviewcount})</i>
                                       &nbsp;&nbsp;
                                       <i class="fas fa-heart"> 좋아요(${list.l_upvote})</i>
                                       <span class="float-right">
                                          <a href="#" class="link-black text-sm">
                                             <i class="fa fa-comments-o mr-1">댓글 (${list.lc_cnt})</i>
                                          </a>
                                       </span>
                                    </p>

                                 </div>
                                 <!-- /.post -->
                                 </c:forEach>
                              </div>
                              
                              <div class="tab-pane" id="timeline">
                              <c:forEach var="list" items="${userAdminCommentList}">
                                 <div class="post2">
                                    <div class="user-block">
                                       <img class="img-circle img-bordered-sm" src="${list.p_route}" alt="user image" onerror='this.src="/views/img/people/fuckyou.jpg"'>
                                       <span class="username">
                                       <c:if test="${list.c_type eq 'LC'}">
                                          <a href="/getLocalAdvice.do?l_idx=${list.idx}&m_id=${list.m_id}" class="subject">${list.c_content}</a>
                                       </c:if>
                                       <c:if test="${list.c_type eq 'EC'}">
                                          <a href="/getEvent.do?e_idx=${list.idx}&m_id=${list.m_id}" class="subject">${list.c_content}</a>
                                       </c:if>
                                       </span>
                                       <fmt:formatDate var="c_date" value="${list.c_date}" pattern="yyyy-MM-dd a hh:mm:ss"/>
                                       <span class="description">
                                          ${c_date}
                                       </span>
                                    </div>

                                 </div>
                                 <hr>
                                 <!-- /.post -->
                                 </c:forEach>
                              </div>
                              
                              
                              <div class="tab-pane" id="settings">
                                 <div class="post2">
                                    <div class="user-block">
                                    <c:forEach var="list" items="${userAdminImageSelect}">
									    <span style="width:250px; height:300px;" onclick="imgModalOpen('${list.p_route}', '${list.m_id}')">
									       <img id="${list.p_route}" class="myImg" src="${list.p_route}" style="width:250px; height:250px;" onerror='this.src="/views/img/people/fuckyou.jpg"'>
									      </span>
									</c:forEach>
                                    </div>
                                 </div>
                                 <!-- /.post -->
                              </div>
                              
                              </div>
                              
                           </div>
                           <!-- /.tab-content -->
                           <button type="button" id="readBtn" class="btn btn-default">더 읽기...</button>
                        </div>
                        <!-- /.card-body -->
                     </div>
                     <!-- /.nav-tabs-custom -->
                  </div>
                  <!-- /.col -->
               </div>
               <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
         </section>
         <!-- /.content -->
      </div>
   </div>
   <!-- ./wrapper -->
   
   	<!-- The Modal -->
	<div id="myModal" class="modal">
	  <div style="text-align : right;">
        <button onclick="deleteImage()" class="btn btn-default">이미지 삭제</button>
        <button onclick="modalClose()" class="btn btn-default">닫기</button>
	  </div>
	  <img class="modal-content" id="img01">
	  <div id="caption"></div>
	</div>
   
   <!-- jQuery -->
   <script src="../../plugins/jquery/jquery.min.js"></script>
   <!-- Bootstrap 4 -->
   <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!-- FastClick -->
   <script src="../../plugins/fastclick/fastclick.js"></script>
   <!-- AdminLTE App -->
   <script src="../../dist/js/adminlte.min.js"></script>
   <!-- AdminLTE for demo purposes -->
   <script src="../../dist/js/demo.js"></script>
</body>
</html>