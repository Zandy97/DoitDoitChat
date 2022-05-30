var stomp;
var room_id;
var username;
var chatCon;
window.onload = function() {
	console.log("js실행");
	var sock = new SockJS("/DoitDoitChat/stompSocket");
	console.log(sock);
	
	room_id = document.getElementById("roomId").value;
	console.log("roomId", room_id);
	username = document.getElementById("empId").value;
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
		chatCon = document.getElementById("chatCon");
		console.log("send",chatCon.value);
		
		chatSend(room_id,chatCon,username);
	});
	
	//파일 입력
	var chatFile = document.getElementById("chatFile");
	console.log(chatFile);
	chatFile.addEventListener("change", function(){
		console.log("change");
		var file = chatFile.files[0];
		
		var reader = new FileReader();
		reader.onload = function(e){
			console.log(e.target.result);
		};
		
		chatFileSend(room_id,reader.readAsBinaryString(file));
	});
	
	window.addEventListener("beforeunload",function(event){
		roomOut(room_id, username);
	});
};

function enterkey(){
	if(window.event.keyCode == 13){
		chatCon = document.getElementById("chatCon");
		chatSend(room_id,chatCon,username);
	}
}

function chatSend(room_id,chatCon,username){
	if(chatCon.val != ""){
		stomp.send('/pub/chat/message', {}, JSON.stringify({ room_id: room_id, chat_con: chatCon.value, emp_id: username }));
		chatCon.value = '';
	}else{
		alert('채팅을 입력해 주세요');
	}
}

function chatFileSend(room_id, binary){
	console.log("파일", JSON.stringify({ room_id: room_id, file: binary}));
	stomp.send('/pub/chat/file', {}, JSON.stringify({ room_id: room_id, file: binary}));
}

//채팅방 입장 시 
function roomEnter(room_id,username){
	stomp.send('/pub/chat/enter', {}, JSON.stringify({ room_id: room_id, emp_id: username }));
}

function roomOut(room_id, username){
	stomp.send('/pub/chat/out', {}, JSON.stringify({ room_id: room_id, emp_id: username }));
}