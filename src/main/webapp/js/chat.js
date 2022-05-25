$(document).ready(function() {
	console.log("js실행");
	var sock = new SockJS("http://localhost:8077/Chatting/endpoint");
	var stomp = Stomp.over(sock);
	
	stomp.connect({},function(){
		console.log("STOMP CONN");
	});
});
