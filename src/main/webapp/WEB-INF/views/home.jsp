<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script type="text/javascript" src="./js/commons.js"></script>
</head>
<body>
	<form action="./home.do" method="post">
		<input type="text" placeholder="id를 입력해 주세요" name="id">
		<input type="submit" value="로그인 하기">
	</form>
</body>
</html>
