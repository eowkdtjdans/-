<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 값으로 DB 데이타 조회하고 화면에 표시 --%>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세</title>
<style>
	#container {
		width: 700px;
		margin: 0 auto;
	}
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; 
	width : 300px; height : 500px;}
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
	<h1>쪽지 상세</h1>
	<hr>
	<form action="updateBoard.do" method="post">
		<input type="hidden" name="seq" value="${message.receive_idx }">
	<table>
		<tr>
			<th width="70">제목</th>
			<td>
				${message.receive_title }
			</td>
		</tr>
		<tr>
			<th>보낸사람</th>
			<td>${message.receive_sender}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td style="height : 300px;">
				${message.receive_content}
			</td>
		</tr>
		<tr>
			<th>보낸 날짜</th>
			<td>${message.receive_regdate }</td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<a href="deleteReceiveMessage.do?receive_idx=${message.receive_idx }">쪽지삭제</a>
			</td>
		</tr>
	</table>
	</form>
	
</div>

</body>
</html>