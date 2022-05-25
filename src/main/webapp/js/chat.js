$(document).ready(function() {
	console.log("js실행");
	var sock = new SockJS("/DoitDoitChat/endpoint");
	console.log(sock);
	
	var roomName;
	var roomId;
	var username;
	
	var stomp = Stomp.over(sock);
	stomp.connect({}, function(e){
		console.log(e);
		console.log(stomp);
	});
});