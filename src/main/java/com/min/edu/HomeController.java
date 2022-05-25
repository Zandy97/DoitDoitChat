package com.min.edu;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.min.edu.chat.vo.MemberVo;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("mem")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("Welcome home! The client locale is {}.");
		
		return "home";
	}
	
	@RequestMapping(value = "/home.do", method = RequestMethod.POST)
	public String home(HttpSession session, Model model,MemberVo mVo) {		
		logger.info("home login {}",mVo);
		model.addAttribute("mem", mVo);
		return "redirect:/roomList.do";
	}
}
