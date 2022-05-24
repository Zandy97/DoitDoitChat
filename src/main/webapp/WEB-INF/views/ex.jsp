<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>home</title>
    <link rel="stylesheet" href="./css/ex.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
</head>
<body>
   <div>
	   	<div class="chatList" id="textChat">
	   		<div class="showChat">
	   			<div class="chatArea">
	   				<img alt="" src="./images/file.png" class="propile">
	   			</div>
	   		</div>
	   		<div class="insChat">
   				<div class="textArea">
	   				<textarea rows="4" cols="40" style="resize: none;"></textarea>
	   				<input type="submit" value="전송" id="btnSubmit">   				
   				</div>
   				<div class="iconArea">
	   				<label class="fileButton" for="input-file">
	   					<img src="./images/file.png" id="fileIcon">
	   				</label>
					<input type="file" id="input-file" style="display:none;"/>
   				</div>
	   		</div>
	   	</div>
	   	<div class="chatPerList">
	   	
	   	</div>
	   	<div class="chatList">
	   	
	   	</div>
   </div>
    <!-- 
        <security>
        1. 같은 로그인 화면에서 id 에 따라서 defalut-target-url 을 다르게 줄수 있는지?
        2. 만약 안된다면 방법은?
           - 로그인 페이지 내에서 관리 모드 버튼을 따로 줘서 관리자용 로그인 페이지를 하나 더만든다
           - 그러면 인사/게시판용 버튼이 또 따로 다 필요한건지?
             - 관리자용 페이지(회원조회/연차조회/게시판관리) 세개 다 그냥 합치고 ROLE_AUTH 에서 ACCESS-DENIED 를 걸까

        <nav 바>
        1. overflow : hidden 을 주고 화면 영역 밖에 뒀다가 버튼 클릭 시 끌어온다.
        2. jquery 에서 css 효과로 animate 와 width 크기를 조절한다
        3. 
    -->
    <script>
        $("#profile>button").click(function(){
            $("#chat").toggle("slide",{direction:"up"},500);
        })
        $("#nav>button").click(function(){
            $("#nav").toggle("slide",{direction:"left"},500)
        })
    </script>
</body>
</html>