package com.min.edu.chat.vo;

public class MemberVo {
	
	private String id;

	public MemberVo(String id) {
		super();
		this.id = id;
	}

	public MemberVo() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "MemberVo [id=" + id + "]";
	}
	
}
