<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function insertProfile(frm) {
		
		 var str = $("#form").serialize();
	 	
		 $.ajax({
			async : true,
			type : "POST",
			dataType : "json",
			data : str,
			url : "../../insetProfileJson.do",
			success : function(data) {
				if (data.cnt == 0) {
					alert("data.cnt : " + data.cnt); 
					 frm.action = "../../insertProfile.do";
					frm.submit();
			 	} else {
					alert("data.cnt : " + data.cnt);
					frm.action = "../../modifyProfile.do";
					frm.submit(); 
					return false;
				}
			}
		
		
		
		
		});  
		
		
	};
	
</script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

</head>
<body>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

		<div class="col-md-9">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <h4>호스트 게시판 글쓰기</h4>
		                    <hr>
		                </div>
		            </div>
		            
		            
		            <div class="row">
		                <div class="col-md-12">
		                 <form method="POST" class="my-login-validation" id="form">
		                    	<input id="m_id" type="hidden" class="form-control" name="m_id" value="${member.m_id }">
		                    	<input id="p_route" type="hidden" class="form-control" name="p_route" value="${profile.p_route}">
                             
                               <div class="form-group row">
                                <label for="p_hobby" class="col-4 col-form-label">최대 투숙객</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="p_hobby" name="p_hobby" class="form-control">${profile.p_hobby }</textarea>
                                </div>
                              </div>
                        	   
                              <div class="form-group row">
                                <label for="p_language" class="col-4 col-form-label">사용가능한 언어</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="p_language" name="p_language" class="form-control">${profile.p_language }</textarea>
                                </div>
                              </div>
                           
                              <div class="form-group row">
                                <label for="p_job" class="col-4 col-form-label">직업</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="p_job" name="p_job" class="form-control">${profile.p_job }</textarea>
                                </div>
                              </div>
                           
                              <div class="form-group row">
                                <label for="p_aboutme" class="col-4 col-form-label">자기소개</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="aboutme" name="p_aboutme" class="form-control">${profile.p_aboutme }</textarea>
                                </div>
                              </div>
                        
                              <div class="form-group row">
                                <label for="p_purpose" class="col-4 col-form-label">목적</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="p_purpose" name="p_purpose" class="form-control">${profile.p_purpose }</textarea>
                                </div>
                              </div>
                        
                              <div class="form-group row">
                                <label for="p_visitcountry" class="col-4 col-form-label">방문했던 국가</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="p_visitcountry" name="p_visitcountry" class="form-control">${profile.p_visitcountry }</textarea>
                                </div>
                              </div>
                        
                              
                               <div class="form-group m-0">
		                          	<button type="button" class="btn btn-primary btn-block" onclick="insertProfile(this.form)">
										프로필 등록
									</button>
                      		  </div>
                            
                          
                            </form>
		                </div>
		            </div>
		            
		        </div>
		    </div>
		</div>
	</div>
</div>
<script src="js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>