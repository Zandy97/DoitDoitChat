package com.min.edu;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.util.WebUtils;

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
    
    @RequestMapping(value = "/saveFile.do", method = RequestMethod.POST)
    @ResponseBody
    public void fileMessage(HttpServletRequest req,MultipartHttpServletRequest multipartRequest) throws FileNotFoundException{
    	logger.info("aveFile 파일저장하기 {}",multipartRequest);
    	
    	Date date = new Date();
    	
		List<MultipartFile> file = multipartRequest.getFiles("file");
		
		String room_id = multipartRequest.getParameter("room_id");
		String username = multipartRequest.getParameter("username");
		
		logger.info("방 번호는 {} / 유저 아이디는 {}",room_id,username);
		
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		for(int i = 0; i < file.size(); i++) {
			ChatFileVo cFv = new ChatFileVo();
			
			String fileName = file.get(i).getOriginalFilename();
			System.out.println("파일 네임 " + fileName);
			
			cFv.setFile_chat_originnm(fileName.substring(0, fileName.lastIndexOf(".")));
			cFv.setFile_chat_type(fileName.substring(fileName.lastIndexOf(".") + 1));
			cFv.setFile_chat_uuid(UUID.randomUUID().toString());
			cFv.setFile_uploadpath(WebUtils.getRealPath(req.getSession().getServletContext(), "/chatFile/"+(date.getMonth()+1)+"/"+date.getDate()));
			
			try {
				inputStream = file.get(i).getInputStream();
				
				File storage = new File(cFv.getFile_uploadpath());
				if(!storage.exists()) {
					storage.mkdirs();
				}
				
				File newFile = new File(cFv.getFile_uploadpath() + "/" + cFv.getFile_chat_uuid() + "." + cFv.getFile_chat_type());
				if(newFile.exists()) {
					newFile.createNewFile();
				}
				
				outputStream = new FileOutputStream(newFile);
				int read = 0;
				byte[] b = new byte[(int)file.get(i).getSize()];
				
				while ((read = inputStream.read(b)) != -1) {
					outputStream.write(b,0,read);
				}
				logger.info("저장한 ChatFileVo는 {}",cFv);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		try {
			inputStream.close();
			outputStream.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
