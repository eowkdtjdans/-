<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>LoginTest</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <style type="text/css">
  html, div, body,h3{
    margin: 0;
    padding: 0;
  }
  h3{
    display: inline-block;
    padding: 0.6em;
  }
  </style>
  
  <script>
     function naverLogin() {
       location.href="${url}";
     }
  </script>
  
</head>
<body onload="naverLogin()">
</body>
</html>