package com.ict.model;

import java.util.ArrayList;
import java.util.Arrays;

public class Scala {
	private String[] list1;
	private String[] list2;
	private String[] list3;
	private String[] list4;
	private String[] list5;

	public String[] getList(String unit){
		String[] list = null;
		
		switch (unit) {
			case "1": list = list1; break; //길이
			case "2": list = list2; break; //속도
			case "3": list = list3; break; //온도
			case "4": list = list4; break; //압력
			case "5": list = list5; break; //질량
		
			//default: list = list1; break;
		}
		
		return list;
	}

	
	public String[] getList1() {
		return list1;
	}

	public void setList1(String[] list1) {
		this.list1 = list1;
	}


	public String[] getList2() {
		return list2;
	}


	public void setList2(String[] list2) {
		this.list2 = list2;
	}


	public String[] getList3() {
		return list3;
	}


	public void setList3(String[] list3) {
		this.list3 = list3;
	}


	public String[] getList4() {
		return list4;
	}


	public void setList4(String[] list4) {
		this.list4 = list4;
	}


	public String[] getList5() {
		return list5;
	}


	public void setList5(String[] list5) {
		this.list5 = list5;
	}
	
}
