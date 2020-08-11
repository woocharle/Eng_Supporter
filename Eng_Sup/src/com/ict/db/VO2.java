package com.ict.db;

//Unit 
//마리아와 연동
//Admin을 통해서 수정, guestbook 적용. 


public class VO2 {
	private String idx, unit, content, img;
	
	public VO2() {}

	public VO2(String idx, String unit, String content, String img) {
		super();
		this.idx = idx;
		this.unit = unit;
		this.content = content;
		this.img = img;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	
	
	
	
}
