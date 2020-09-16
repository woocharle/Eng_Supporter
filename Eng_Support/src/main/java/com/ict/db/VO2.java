package com.ict.db;

import org.springframework.web.multipart.MultipartFile;

public class VO2 {
	private String idx, unit, content, img, content_s;
	private MultipartFile file;
	
	public VO2() {}

	public VO2(String idx, String unit, String content, String img, String content_s, MultipartFile file) {
		super();
		this.idx = idx;
		this.unit = unit;
		this.content = content;
		this.img = img;
		this.content_s = content_s;
		this.file = file;
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

	public String getContent_s() {
		return content_s;
	}

	public void setContent_s(String content_s) {
		this.content_s = content_s;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
}
