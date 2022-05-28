package com.min.edu;

import java.net.http.WebSocket;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.min.edu.chat.vo.ChatJoinVo;
import com.min.edu.chat.vo.ChatVo;
import com.min.edu.chat.vo.MemberVo;
import com.min.edu.model.service.IChatService;

@Controller
public class ChatController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SimpMessagingTemplate template;
		
	private Map<String, List<String>> listMem;
	private Map<String, List<ChatVo>> listChat;
	
	public ChatController() {
		listMem = new HashMap<String,List<String>>();
		listChat = new HashMap<String,List<ChatVo>>();
	}
		
	//채팅방에 들어왔을때
	@MessageMapping(value = "/chat/enter")
    public void enter(ChatVo cVo){
		logger.info("@ChatController enter() : {}", cVo);
		String emp_id = cVo.getEmp_id();
        String ms = emp_id + "님이 채팅방에 참여하였습니다.";
        logger.info("@ChatController enter() : {}", ms);
        template.convertAndSend("/sub/chat/room/" + cVo.getRoom_id(), "{\"emp_id\":\""+emp_id+"\",\"ms\":\""+ms+"\"}");
    }

	
    @MessageMapping(value = "/chat/message")
    public void message(ChatVo cVo){
        template.convertAndSend("/sub/chat/room/" + cVo.getRoom_id(), cVo);
    }
}
