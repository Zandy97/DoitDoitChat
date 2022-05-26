$(document).ready(function() {
	console.log("js실행");
	var sock = new SockJS("/DoitDoitChat/stomp/chat");
	console.log(sock);
	
	var roomName;
	var roomId;
	var username;
	
	var stomp = Stomp.over(sock);
	stomp.connect({}, function(e){
		console.log("connect",stomp);
		
		stomp.subcribe("/sub/chat/room/" + room_id, function (chat) {
           var content = JSON.parse(chat.body);

           var writer = content.writer;
           var str = '';
           
           if(writer === username){
               str = "<div class='col-6'>";
               str += "<div class='alert alert-secondary'>";
               str += "<b>" + writer + " : " + message + "</b>";
               str += "</div></div>";
               $("html").append(str);
           }else{
               str = "<div class='col-6'>";
               str += "<div class='alert alert-warning'>";
               str += "<b>" + writer + " : " + message + "</b>";
               str += "</div></div>";
               $("html").append(str);
           }
           $("html").append(str);
           
            stomp.send('/pub/chat/enter', {}, JSON.stringify({room_id: roomId, writer: username}))
        });
	});
});