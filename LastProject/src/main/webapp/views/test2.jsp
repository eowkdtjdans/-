 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>bootstrap4</title>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
  </head>
  <body>
  <div class="container">  
   <div class="row">  
         <div class="col-md-4"></div> 
         <div class="col-md-4">
            <h4 style="text-align : center;">로그인</h4>
            <form onsubmit="return false"method="POST" id="form"  >
               <div class="form-group">
                  <label for="localAdvice_title">제목</label>
                  <input type="text" class="form-control" id="l_subject"name="l_subject">
               </div>
               
               <div class="form-group">
                  <label for="password"></label>
                <input type="text" class="form-control" id="l_content"name="l_content">
               </div>
               
           
               	
               <div class="form-group">
                       <input type="button" value="저장" class="btn btn-outline-secondary"
                     onclick="sendData(this.form)">               
                  <input type="reset" value="다시작성" class="btn btn-outline-secondary">
                  
                  <input type="hidden" name="m_id" value="${member.m_id }">
                  <input type="hidden" name="searchCondition" value="${searchCondition }">
                  <input type="hidden" name="searchKeyword" value="${key }" >
                  <input type="hidden" name="m_address" value="${member.m_address}">
                  <input type="hidden" name="lat" value="${firstLat}">
                  <input type="hidden" name="lng" value="${firstLng}">
               </div>
            </form>
    </div></div></div>
 
        <script>
               	function sendData(frm) {
               		frm.action = "../insertLocalAdvice.do";
               		frm.submit();
               	}
               </script>
    
    <script>
      $('#l_content').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 100
      });
    </script>
  </body>
  </html>