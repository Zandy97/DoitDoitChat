package com.min.edu;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
    
    @RequestMapping(value = "/saveFile.do", method = RequestMethod.POST)
    @ResponseBody
    public String fileMessage(MultipartHttpServletRequest multipartRequest){
    	logger.info("aveFile 파일저장하기 {}",multipartRequest);
    	Date date = new Date();
    	
    	String path = "C:\\new\\";
		List<MultipartFile> file = multipartRequest.getFiles("file");
		logger.info("{}",file);
//		while(itr.hasNext()) { // 받은파일을 모두
//			MultipartFile mpFile=multipartRequest.getFile(itr.next());
//			String originFileName=mpFile.getOriginalFilename(); // 파일명
//			String fileFullPath = path+originFileName; 
//			
//			System.out.println("파일 이름 : "+originFileName);
//			System.out.println("파일 전체 경로 : "+fileFullPath);
//
//			try {
//				mpFile.transferTo(new File(fileFullPath));//파일 저장. 실제로는 Service에서 처리
//			} catch (Exception e) {
//				e.printStackTrace();
//			}	
//		}
		return "업로드 성공";
	}
}
