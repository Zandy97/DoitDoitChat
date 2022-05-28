var stomp;
window.onload = function() {
	console.log("js실행");
	var sock = new SockJS("/DoitDoitChat/stompSocket");
	console.log(sock);
	
	var room_id = document.getElementById("roomId").value;
	console.log("roomId", room_id);
	var username = document.getElementById("empId").value;
	console.log("empId", username);

	stomp = Stomp.over(sock);
	stomp.connect({}, function() {
		console.log("STOMP Connection")

		//4. subscribe(path, callback)으로 메세지를 받을 수 있음
		// 태팅방
		stomp.subscribe("/sub/chat/room/" + room_id, function(chat) {
			console.log(chat);
			var content = JSON.parse(chat.body);
			
			var message = content.chat_con;
			var writer = content.emp_id;
			var html = '';
			
			html += "<tr>";
			html += "<td>"+writer+"</td><td>"+message+"</td><td>220528</td>";
			html += "</tr>"
			
			$("table>tbody").append(html);
		});
		
		roomEnter(room_id,username);
		
		stomp.subscribe("/sub/chatMem/room/" + room_id, function(member){
			var mems = member.body;
			mems = mems.replaceAll('"', '');
			mems = mems.replace('[', '');
			mems = mems.replace(']', '');
			mems = mems.split(",");
			console.log(mems);
			console.log(mems.length);
			
			html = '';
			
			for(var i = 0; i < mems.length; i++){
				html += "<div>";
				html += mems[i];
				html += "</div>";
			}
			
			var divMemList = document.getElementById("chat_memList");
			console.log(divMemList);
			divMemList.innerHTML = html;
		});
		
		
	});
	// 채팅입력
	var btnSend = document.getElementById("chatSend");
	btnSend.addEventListener("click",function(){
		var chatCon = document.getElementById("chatCon");
		console.log("send",chatCon.value);

		stomp.send('/pub/chat/message', {}, JSON.stringify({ room_id: room_id, chat_con: chatCon.value, emp_id: username }));
		chatCon.value = '';
	});
	
};

//채팅방 입장 시 
function roomEnter(room_id,username){
	stomp.send('/pub/chat/enter', {}, JSON.stringify({ room_id: room_id, emp_id: username }));
}