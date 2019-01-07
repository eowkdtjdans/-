<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
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
					alert("data.cnt : " + data.cnt); 
					alert("적은 글 없음");
					 frm.action = "../../insertHost.do";
					frm.submit();
			 	} else {
					alert("data.cnt : " + data.cnt);
					alert("적은 글 있음");
					/* frm.action = "../../modifyProfile.do";
					frm.submit();  */
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
		                    <h4>호스트 등록</h4>
		                    <hr>
		                </div>
		            </div>
		            
		            
		            <div class="row">
		                <div class="col-md-12">
		                 <form method="POST" id="form">
		                    	<input id="m_id" type="hidden" class="form-control" name="m_id" value="${member.m_id }">
		                    	<input id="m_address" type="hidden" class="form-control" name="m_address" value="${member.m_address }">
		                    	<input id="p_route" type="hidden" class="form-control" name="p_route" value="${profile.p_route}">
                             
                               <div class="form-group row">
                                <label for="h_maximumguest" class="col-4 col-form-label">최대 투숙객</label> 
                                <div class="col-8">
                                	<select class="form-control" id="h_maximumguest" name="h_maximumguest">
										    <option selected="selected">choose</option>
										    <option>1</option>
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
								   	 	<option selected="selected">choose</option>
								   	 	<option>남자</option>
								    	<option>여자</option>
								  </select>
                                </div>
                              </div>
                           
                              <div class="form-group row">
                                <label for="h_smoke" class="col-4 col-form-label">흡연 가능 여부</label> 
                                <div class="col-8">
                                	 <select class="form-control" id="h_smoke" name="h_smoke">
								   	 	<option selected="selected">choose</option>
								   	 	<option>O</option>
								    	<option>X</option>
								 	 </select>
                                </div>
                              </div>
                           
                              <div class="form-group row">
                                <label for="h_roomtype" class="col-4 col-form-label">방 종류</label> 
                                <div class="col-8">
                                	 <select class="form-control" id="h_roomtype" name="h_roomtype">
								    	<option selected="selected">choose</option>
								    	<option>싱글 베드</option>
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
                        
                              <div class="form-group row">
                                <label for="h_startdate" class="col-4 col-form-label">입실 날짜</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="h_startdate" name="h_startdate" class="form-control"></textarea>
                                </div>
                              </div>
                        
                              <div class="form-group row">
                                <label for="h_haspet" class="col-4 col-form-label">펫 유무</label> 
                                <div class="col-8">
                                	 <select class="form-control" id="h_haspet" name="h_haspet">
                                	 	
								   	 	<option selected="selected">choose</option>
								   	 	<option>O</option>
								    	<option>X</option>
								 	 </select>
                                </div>
                              </div>
                        
                              <div class="form-group row">
                                <label for="h_haschild" class="col-4 col-form-label">자녀 유무</label> 
                                <div class="col-8">
                                	 <select class="form-control" id="h_haschild" name="h_haschild">
								   	 	<option selected="selected">choose</option>
								   	 	<option>O</option>
								    	<option>X</option>
								 	 </select>
                                </div>
                              </div>
                        	
                              <div class="form-group row">
                                <label for="h_enddate" class="col-4 col-form-label">퇴실 날짜</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="h_enddate" name="h_enddate" class="form-control"></textarea>
                                </div>
                              </div>
                        
                              
                               <div class="form-group m-0">
		                          	<button type="button" class="btn btn-primary btn-block" onclick="insertHost(this.form)" >
										호스트등록
									</button>
                      		  </div>
                            
                          
                            </form>
		                </div>
		            </div>
		            
		        </div>
		    </div>
		</div>
<script src="js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>