<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>내 글</title>

	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>내 글 </title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

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

</head>
<body>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
		      <a href="../../sub2.do" class="list-group-item list-group-item-action">메인페이지</a>
              <a href="../../myProfile.do" class="list-group-item list-group-item-action">마이 프로필</a>
              <a href="../../getReceiveMessageList.do" class="list-group-item list-group-item-action">받은 쪽지함</a>
              <a href="../../getSendMessageList.do" class="list-group-item list-group-item-action">보낸 쪽지함</a>
              <a href="../../insertProfile.do" class="list-group-item list-group-item-action">프로필 수정</a>
              <a href="../../ModifyPwdMember.do" class="list-group-item list-group-item-action">비밀번호 변경</a>
              <a href="../../ModifyPhoneMember.do" class="list-group-item list-group-item-action">핸드폰 변경</a>
              <a href="../../ModifyAddressMember.do" class="list-group-item list-group-item-action">주소 변경</a>
              <a href="../../profileImageInsert.do" class="list-group-item list-group-item-action">이미지 업로드</a>
     		  <a href="../../profileImageList.do?m_id=${member.m_id }" class="list-group-item list-group-item-action">프로필 이미지 관리</a>
              <a href="../../HostImageList.do?m_id=${member.m_id }" class="list-group-item list-group-item-action">호스트 이미지 관리</a>
               <a href="../../loginRecordList.do?m_id=${member.m_id }" class="list-group-item list-group-item-action active">로그인 기록</a>
              <a href="#" class="list-group-item list-group-item-action">내 글</a>
              <a href="#" class="list-group-item list-group-item-action">내 댓글</a>
              
              
            </div> 
		</div>

		<div class="col-md-9">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <h4></h4>
		                    <hr>
		                </div>
		            </div>
	             </div>
<div id="container">
	
	<!-- 데이타 표시 -->
	<form>
	<table class="table">
		<thead class="thead-light">
		<tr>
			<th width="100"style="text-align :center;">게시판</th>
			<th width="100"style="text-align :center;">댓글</th>
			<th width="100"style="text-align :center;">날짜</th>
		</tr>
		</thead>
		<c:forEach var="myPostList" items="${myPostList2 }">
		<tr>
		<c:if test="${myPostList.c_type eq '이벤트 게시판' }">
			<td style="text-align :center;">
				<a href="getLocalAdviceList2.do?cPage=1&firstLat=&firstLng=&key=&searchCondition=find_advice">${myPostList.c_type }</a>
			</td>
		</c:if>
		
		<c:if test="${myPostList.c_type eq '현지정보 문의 게시판' }">
			<td style="text-align :center;">
				<a href="getLocalAdviceList2.do?cPage=1&searchCondition=find_advice&firstLat=&firstLng=&key=">${myPostList.c_type }</a>
			</td>
		</c:if>
		
			<c:if test="${myPostList.c_type eq '이벤트 게시판' }">
			<td style="text-align :center;">
				<a href="../getEvent.do?e_idx=${myPostList.idx }">${myPostList.c_content }</a>
			</td>
		</c:if>
		
		<c:if test="${myPostList.c_type eq '현지정보 문의 게시판' }">
			<td style="text-align :center;">
				<a href="../getLocalAdvice.do?l_idx=${myPostList.idx }">${myPostList.c_content }</a>
			</td>
		</c:if>
		
			
			<td><fmt:formatDate value="${myPostList.c_date }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
		</tr>
		</c:forEach>
		
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
							<a href="../../myPost2.do?m_id=${member.m_id }&cPage=${pvo.endPage + 1 }">◀</a>
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
							<a href="../../myPost2.do?m_id=${member.m_id }&cPage=${k }">${k }</a>
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
							<a href="../../myPost2.do?m_id=${member.m_id }&cPage=${pvo.endPage + 1 }">▶</a>
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
	</div> 
</div>
</body>
</html>