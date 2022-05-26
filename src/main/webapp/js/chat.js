$(document).ready(function() {
	console.log("js실행");
	var sock = new SockJS("/DoitDoitChat/stompSocket");
	console.log(sock);

	var roomName;
	var room_id = $("#roomId").val();
	console.log("roomId", room_id);
	var username = $("#empId").attr("value");
	console.log("empId", username);

	var stomp = Stomp.over(sock);
	stomp.connect({}, function() {
		console.log("STOMP Connection")

		//4. subscribe(path, callback)으로 메세지를 받을 수 있음
		stomp.subscribe("/sub/chat/room/" + room_id, function(chat) {
			
			var content = JSON.parse(chat.body);
			var message = content.ms;
			var writer = content.emp_id;
			var html = '';
			
			html += "<tr>";
			html += "<td>"+writer+"</td><td>"+message+"</td><td>220528</td>";
			html += "</tr>"
			
			$("table>tbody").append(html);
		});
		
		stomp.send('/pub/chat/enter', {}, JSON.stringify({ room_id: room_id, emp_id: username }));
	});

	$("#button-send").on("click", function(e) {
		var msg = document.getElementById("msg");

		console.log(username + ":" + msg.value);
		stomp.send('/pub/chat/message', {}, JSON.stringify({ roomId: room_id, message: msg.value, writer: username }));
		msg.value = '';
	});
});