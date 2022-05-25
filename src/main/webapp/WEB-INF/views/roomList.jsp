<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.0/sockjs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script type="text/javascript" src="./js/chat.js"></script>
</head>
<body>
	<div>
		<label>${userId }님 채팅에 오신것을 반갑습니다.</label>
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th>채팅방 제목</th><th>최근 채팅</th><th>채팅 시간</th>
				</tr>
			</thead>	
			<tbody>
				<c:forEach var="i" items="${rooms}">
					<tr>
						<td>${i.room_name}</td><td><a href="./chatRoom.do?room_Id=${i.room_id }">${i.chat_con}</a></td><td>${i.chat_time }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>