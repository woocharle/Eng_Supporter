package com.ict.db;

import java.util.ArrayList;

//2.unitconverter
public class VO1 {
	private ArrayList<String> list;
	private String scala;
	private int idx;
	
	public VO1() {}

	public VO1(int idx, String scala, ArrayList<String> list) {
		this.scala = scala;
		this.idx = idx;
		this.list = list;
	}

	
	public String getScala() {
		return scala;
	}

	public void setScala(String scala) {
		this.scala = scala;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public ArrayList<String> getList() {
		return list;
	}

	public void setList(ArrayList<String> list) {
		this.list = list;
	}

}
