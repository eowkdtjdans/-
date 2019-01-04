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
                                <label for="h_maximumguest" class="col-4 col-form-label">최대 투숙객</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="h_maximumguest" name="h_maximumguest" class="form-control"></textarea>
                                </div>
                              </div>
                               <div class="form-group row">
							    <label for="h_maximumguest">최대 투숙객</label>
							    <select class="form-control" id="h_maximumguest">
							      <option>1</option>
							      <option>2</option>
							      <option>3</option>
							      <option>4</option>
							      <option>5</option>
							    </select>
							  </div>
							                              
                        	   
                              <div class="form-group row">
                                <label for="h_gender" class="col-4 col-form-label">선호 성별</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="h_gender" name="h_gender" class="form-control"></textarea>
                                </div>
                              </div>
                           
                              <div class="form-group row">
                                <label for="h_smoke" class="col-4 col-form-label">흡연 가능 여부</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="h_smoke" name="h_smoke" class="form-control"></textarea>
                                </div>
                              </div>
                           
                              <div class="form-group row">
                                <label for="h_roomtype" class="col-4 col-form-label">방 종류</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="h_roomtype" name="h_roomtype" class="form-control"></textarea>
                                </div>
                              </div>
                        
                              <div class="form-group row">
                                <label for="h_rule" class="col-4 col-form-label">숙소 이용시 주의사항</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="h_rule" name="h_rule" class="form-control"></textarea>
                                </div>
                              </div>
                        
                              <div class="form-group row">
                                <label for="h_startdate" class="col-4 col-form-label">입실 날짜</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="h_startdate" name="h_startdate" class="form-control"></textarea>
                                </div>
                              </div>
                        
                              <div class="form-group row">
                                <label for="h_haspet" class="col-4 col-form-label">펫 유무</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="h_haspet" name="h_haspet" class="form-control"></textarea>
                                </div>
                              </div>
                        
                              <div class="form-group row">
                                <label for="h_haschild" class="col-4 col-form-label">자녀 유무</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="h_haschild" name="h_haschild" class="form-control"></textarea>
                                </div>
                              </div>
                        	
                              <div class="form-group row">
                                <label for="h_enddate" class="col-4 col-form-label">퇴실 날짜</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="h_enddate" name="h_enddate" class="form-control"></textarea>
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