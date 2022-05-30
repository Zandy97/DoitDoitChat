package com.min.edu;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.min.edu.chat.vo.ChatJoinVo;
import com.min.edu.chat.vo.ChatVo;
import com.min.edu.chat.vo.MemberVo;
import com.min.edu.model.service.IChatService;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("mem")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private IChatService service;
	
    //채팅방 진입시 채팅 내역 조회
    @RequestMapping(value = "/chatRoom.do", method = RequestMethod.GET)
    public String getRoom(String room_Id, HttpSession session, Model model) {
    	logger.info("ChatController getRoom {}",room_Id);
    	MemberVo mVo = (MemberVo) session.getAttribute("mem");
		String emp_id = mVo.getId();
    	
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("room_id", room_Id);
    	map.put("emp_id", emp_id);
    	
    	List<ChatVo> chatList = service.selChat(map);
    	
    	model.addAttribute("room_id",room_Id);
    	model.addAttribute("emp_id", emp_id);
    	model.addAttribute("chatList", chatList);
    	return "chatRoom";
    }
    
  //채팅방 목록 출력(메인화면)
  	@RequestMapping(value = "/roomList.do", method = RequestMethod.GET)
  	public String chat(Model model, HttpSession session, MemberVo mVo) {
  		mVo = (MemberVo) session.getAttribute("mem");
  		String userId = mVo.getId();
  		logger.info("@ChatController, GET Chat / Username : " + userId);
  		
  		List<ChatJoinVo> rooms = service.selRoom(userId);
  		model.addAttribute("userId", userId);
  		model.addAttribute("rooms", rooms);
  		
  		return "roomList";
  	}
}
