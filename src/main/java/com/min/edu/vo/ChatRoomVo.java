package com.min.edu.vo;

import java.io.Serializable;

public class ChatRoomVo implements Serializable{
	
	private static final long serialVersionUID = -352723946584215118L;
	
	private String room_id;
	private String room_mem;
	
	public ChatRoomVo() {
		super();
	}
	
	public ChatRoomVo(String room_id, String room_mem) {
		super();
		this.room_id = room_id;
		this.room_mem = room_mem;
	}
	
	public String getRoom_id() {
		return room_id;
	}
	
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	
	public String getRoom_mem() {
		return room_mem;
	}
	
	public void setRoom_mem(String room_mem) {
		this.room_mem = room_mem;
	}

	@Override
	public String toString() {
		return "ChatRoomVo [room_id=" + room_id + ", room_mem=" + room_mem + "]";
	}
}
