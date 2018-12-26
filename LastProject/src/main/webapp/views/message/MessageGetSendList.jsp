<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸메세지 목록</title>

<style>
	#container {
		width: 700px;
		margin: 0 auto;
	}
	h1, h3 { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: powderblue; }
	.center { text-align: center; }
	.border-none, .border-none td { border: none; }
</style>
</head>
<body>

<div id="container">
	<h1>보낸 쪽지 목록</h1>
	
	<!-- 데이타 표시 -->
	<form>
	<table>
	
		<tr>
			<th width="200">제목</th>
			<th width="150">보낸이</th>
			<th width="150">받는이</th>
			<th width="150">날짜</th>
			<th width="150">읽었냐?</th>
		</tr>
		
		<c:forEach var="messageList" items="${messageList }">
		<tr>
			<td>
				<a href="../../getSendMessage.do?send_idx=${messageList.send_idx }">
					${messageList.send_title }
				</a>
			</td>
			<td>${messageList.send_sender }</td>
		    <td>${messageList.send_receiver }</td> 
			<td>${messageList.send_regdate }</td>
			<td>${messageList.send_read }</td>
		
		</tr>
		</c:forEach>
	</table>
	</form>
	
</div>

</body>
</html>