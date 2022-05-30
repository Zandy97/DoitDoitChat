package com.min.edu;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.BinaryMessage;

import com.min.edu.chat.vo.ChatFileVo;
import com.min.edu.chat.vo.ChatVo;

@Controller
public class ChatController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SimpMessagingTemplate template;
		
	private List<String> listMem;
	private List<ChatVo> listChat;
	
	private Map<String, List<String>> mapMem;
	private Map<String, List<ChatVo>> mapChat;
	
	public ChatController() {
		listChat = new ArrayList<ChatVo>();
		listMem = new ArrayList<String>();
		
		mapMem = new HashMap<String,List<String>>();
		mapChat = new HashMap<String,List<ChatVo>>();
	}
		
	//채팅방에 들어왔을때
	@MessageMapping(value = "/chat/enter")
    public void enter(ChatVo cVo){
		logger.info("@ChatController enter() : {}", cVo);
		logger.info("enterMem {}", mapMem.get(cVo.getRoom_id()));
		
		logger.info("^^^^ 해당 방 멤버 {} ^^^^",mapMem.get(cVo.getRoom_id()));
		if(mapMem.get(cVo.getRoom_id()) != null) {
			listMem = mapMem.get(cVo.getRoom_id());
			logger.info("멤버 있음 {}",listMem);
		}else {
			listMem = new ArrayList<String>();
		}
		
		if (!listMem.contains(cVo.getEmp_id())) {
			listMem.add(cVo.getEmp_id());
			mapMem.put(cVo.getRoom_id(), listMem);
		}
	
		logger.info("^^^^^^ 멤버 확인 {} ^^^^^^",mapMem);
        template.convertAndSend("/sub/chatMem/room/" + cVo.getRoom_id(), mapMem.get(cVo.getRoom_id()));
    }

	//채팅방 나갔을 때
	@MessageMapping(value = "/chat/out")
	public void out(ChatVo cVo) {
		logger.info("@ChatController out() : {}", cVo);
		
		listMem = mapMem.get(cVo.getRoom_id());
		listMem.remove(cVo.getEmp_id());
		
		mapMem.remove(cVo.getRoom_id());
		mapMem.put(cVo.getRoom_id(), listMem);
		
		logger.info("^^^^^ 남아 있는 멤버는 {} ^^^^^",listMem);
		template.convertAndSend("/sub/chatMem/room/" + cVo.getRoom_id(), mapMem.get(cVo.getRoom_id()));
	}
	
	//채팅 메시지
    @MessageMapping(value = "/chat/message")
    public void chatMessage(ChatVo cVo){
    	logger.info("@ChatController message() : {}", cVo);
        template.convertAndSend("/sub/chat/room/" + cVo.getRoom_id(), cVo);
    }
    
    //파일 메시지
    @MessageMapping(value = "/chat/file")
    public void fileMessage(ChatFileVo cFVo) {
    	ByteBuffer byteBuffer = cFVo.getFile().getPayload();
    	
    	Date date = new Date();
    	
    	String path = "C:\\goodee\\spring_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Chatting\\storage\\chatFile\\"+date.getMonth()+"\\"+date.getDay();
    	
    	File dir = new File(path);
    	if(!dir.exists()) {
    		dir.mkdirs();
    	}
    	
    	File file = new File(path,"????");
    	FileOutputStream out = null;
    	FileChannel outChannel = null;
    	try {
			byteBuffer.flip(); //byteBuffer를 읽기 위해 세팅
			out = new FileOutputStream(file, true); //생성을 위해 OutputStream을 연다.
			outChannel = out.getChannel(); //채널을 열고
			byteBuffer.compact(); //파일을 복사한다.
			outChannel.write(byteBuffer); //파일을 쓴다.
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(out != null) {
					out.close();
				}
				if(outChannel != null) {
					outChannel.close();
				}
			}catch (IOException e) {
				e.printStackTrace();
			}
		}	
    }
}
