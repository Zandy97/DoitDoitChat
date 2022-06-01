<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.0/sockjs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script type="text/javascript" src="./js/chat.js"></script>
<link rel="stylesheet" type="text/css" href="./css/chatRoom.css">
</head>
<body>
	<input type="hidden" id="roomId" value="${room_id}">
	<input type="hidden" id="empId" value="${emp_id }"> 

	<div style="width: 800px; height: 800px; border: 1px solid black;">
		<!-- 채팅창 -->
		<div id="dragdrop" class="chatGroup">
			<div class="roomInfo">
				채팅방 정보
			</div>
			<div id="chatList"> <!-- chatWrap -->
				<div id="chatLog">
	                <div class="anotherMsg">
	                    <span class="Name">Jo</span>
	                    <span class="msg">Hello, Nice to meet you.</span>
	                </div>
	                <div class="myMsg">
	                	<span class="Name">Kim</span>
	                    <span class="msg">Nice to meet you, too.</span>
	                </div>
	                <div class="myMsg">
	                	<span class="Name">Kim</span>
	                    <span class="msg">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</span>
	                </div>
	                <div class="myMsg">
	                	<span class="Name">Kim</span>
	               		<span class="msg">
		                	<img alt="" src="./images/propile.png" width="200px">
	               		</span>
	                </div>
	                <div class="anotherMsg">
	                    <span class="Name">Jo</span>
	                    <span class="msg">Okay, bye.</span>
	                </div>
            	</div>
			</div>
			<div class="insChat">
				<div class="inputArea">
					<div>					
						<textarea rows="6" cols="25"></textarea>
					</div>
					<div>					
						<button id="btnSend" style="top:200px">전송</button>
					</div>
				</div>
				<div>
					<div>
						<label for="chatFile">
							<img src="./images/file.png" id="fileIcon">
						</label>
						<input type="file" value="파일 전송" name="file" id="chatFile" hidden multiple>
					</div>
				</div>
			</div>
		</div>
		<!-- 멤버 리스트 -->
		<div class="memberList">
			<div class="roomInfo">
				채팅방 참가 멤버
			</div>
			<div id="members" class="members">
			
			</div>
		</div>
		<!-- 사진, 파일 -->
		<div class="chatGroup">
			<div class="roomInfo">
				사진, 파일
			</div>
			<div>
			
			</div>
		</div>	
	</div>
	
</body>
</html>