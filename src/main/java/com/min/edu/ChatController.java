package com.min.edu;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.min.edu.vo.MemberVo;

@Controller
public class ChatController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat(Model model, HttpSession session, MemberVo mVo) {
		
		mVo = (MemberVo) session.getAttribute("mem");
				
		String userId = mVo.getId();

		logger.info("@ChatController, GET Chat / Username : " + userId);
		
		model.addAttribute("userid", userId);
		
		return "chat";
	}
}
