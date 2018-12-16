<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body onload="openSocket()">
    <div>
        <input type="text" id="sender" value="${member.m_name }" style="display: none;">
        <input type="text" id="messageinput">
    </div>
    <div>
        <button type="button" onclick="send();">메세지 보내기</button>
        <button type="button" onclick="closeSocket();">그만 하기</button>
    </div>
    <!-- Server responses get written here -->
    <div id="messages"></div>
    
    
    
    <script type="text/javascript">
        var ws;
        var messages=document.getElementById("messages");
        
        function openSocket(){
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
                writeResponse("웹소켓은 이미 '오픈'상태 입니다");
                return;
            }
            //웹소켓 객체 만드는 코드
            ws=new WebSocket("ws://localhost:8090/echo.do");
            
            ws.onopen=function(event){
               
            	if(event.data===undefined) return;
                
                writeResponse(event.data);
            };
            
            ws.onmessage=function(event){
                writeResponse(event.data);
            };
            ws.onclose=function(event){
                writeResponse("커넥션 연결 종료");
            }
        }
        
        function send(){
            var text = document.getElementById("sender").value+" : "+document.getElementById("messageinput").value;
          
           
            ws.send(text);
        }
        
        function closeSocket(){
            ws.close();
        }
        function writeResponse(text){
            messages.innerHTML+="<br/>"+text;
        }
  </script>
</body>
</html>
