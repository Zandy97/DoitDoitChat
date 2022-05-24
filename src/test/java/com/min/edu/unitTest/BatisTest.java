package com.min.edu.unitTest;

import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.junit.Test;
import org.junit.internal.runners.JUnit4ClassRunner;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.min.edu.chat.vo.ChatJoinVo;
import com.min.edu.chat.vo.ChatVo;
import com.min.edu.model.service.IChatService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/*.xml" })
public class BatisTest {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IChatService service;
	
//	@Test
	public void selRoom() {
		String emp_id = "5";
		List<ChatJoinVo> list = service.selRoom(emp_id);
		logger.info("{}",list);
	}
	
//	@Test
	public void selChat() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("emp_id", "5");
		map.put("room_id", "4");
		
		List<ChatVo> list = service.selChat(map);
		logger.info("{}",list);
	}
	
//	@Test
	public void selRoomMem() {
		List<String> list = service.selRoomMem("4");
		logger.info("{}",list);
	}
	
//	@Test
	public void insChat() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("room_id", "4");
		map.put("emp_id", "5");
		map.put("chat_con", "<div>반가워요</div>");
		map.put("chat_type", "t");
		
		int n = service.insChat(map);
		System.out.println(n);
	}
	
//	@Test
	public void insChatFile() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("room_id", "4");
		map.put("emp_id", "5");
		map.put("chat_con", "<img src=\"./storage/chatFile/05/23/image0005.png\">");
		map.put("chat_type", "F");
		
		UUID uid = UUID.randomUUID();
		
		map.put("file_chat_uuid", uid.toString());
		map.put("file_chat_originnm", "image0005");
		map.put("file_chat_type", "png");
		map.put("file_uploadpath", "C:\\goodee\\spring_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Chatting\\storage\\chatFile\\05\\23");
		
		int n = service.insFile(map);
		System.out.println(n);
	}
	
//	@Test
	@SuppressWarnings("unchecked")
	public void insChatRoom() {
		Map<String, String> map = new HashMap<String, String>();
		
		String [] mem = {"6","7","8"};
		Date dt = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMddHHmmss");
		
		JSONObject room = new JSONObject();
		JSONArray jArr = new JSONArray();
		for (int i = 0; i < mem.length; i++) {
			JSONObject jMem = new JSONObject();
			jMem.put("id", mem[i]);
			jMem.put("join", date.format(dt));
			
			jArr.add(jMem);
		}
		room.put("ROOM", jArr);
		
		map.put("room_name", "rooms");
		map.put("room_mem", room.toString());
		
		int n = service.insChatRoom(map);
		System.out.println(n);
	}
	
	@Test
	public void selFileNM() {
		String name = service.selFileNM("1");
		System.out.println(name);
	}
}
