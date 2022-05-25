<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<label>${userId }님 채팅에 오신것을 반갑습니다.</label>
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th>채팅러</th><th>채팅</th><th>채팅 시간</th>
				</tr>
			</thead>	
			<tbody>
				<c:forEach var="i" items="${chatList}">
					<tr>
						<td>${i.emp_id}</td><td>${i.chat_con}</td><td>${i.chat_time}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td>				
						<form>
							<input type="text" id="con"><input type="submit" value="전송">
						</form>
					</td>	
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>