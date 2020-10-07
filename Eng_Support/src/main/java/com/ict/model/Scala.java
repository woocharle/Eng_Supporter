package com.ict.model;

import java.util.HashMap;
import java.util.Map;

public class Scala {
	private String[] list1, list2, list3, list4, list5;
	private double[] length1, length2, length3, length4, length5, length6;
	private Map<String, Integer> l_map;
 	
	public String[] getList(String unit){
		String[] list = null;
		
		switch (unit) {
			case "1": list = list1; break; //길이
			case "2": list = list2; break; //속도
			case "3": list = list3; break; //온도
			case "4": list = list4; break; //압력
			case "5": list = list5; break; //질량
		
		}
		
		return list;
	}

	public double[] getConversion1(String unit) {
		double[] list = null;
		
		switch (unit) {
			//길이
			case "mm": list = length1; break; 
			case "cm": list = length2; break; 
			case "m": list = length3; break; 
			case "km": list = length4; break; 
			case "in": list = length5; break; 
			case "ft": list = length6; break; 
			
			//속도
		
		}
		
		return list;		
	}
	
	public int getConversion2(String scala, String scala2) {
		int num = 0;
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		
		switch (scala) {
			case "1": map = l_map; break; //길이
			case "2": map = l_map; break; //속도
			case "3": map = l_map; break; //온도
			case "4": map = l_map; break; //압력
			case "5": map = l_map; break; //질량
		}
	
		num = map.get(scala2);
		
		return num;
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

	public double[] getLength1() {
		return length1;
	}

	public void setLength1(double[] length1) {
		this.length1 = length1;
	}

	public double[] getLength2() {
		return length2;
	}

	public void setLength2(double[] length2) {
		this.length2 = length2;
	}

	public double[] getLength3() {
		return length3;
	}

	public void setLength3(double[] length3) {
		this.length3 = length3;
	}

	public double[] getLength4() {
		return length4;
	}

	public void setLength4(double[] length4) {
		this.length4 = length4;
	}

	public double[] getLength5() {
		return length5;
	}

	public void setLength5(double[] length5) {
		this.length5 = length5;
	}

	public double[] getLength6() {
		return length6;
	}

	public void setLength6(double[] length6) {
		this.length6 = length6;
	}

	public Map<String, Integer> getL_map() {
		return l_map;
	}

	public void setL_map(Map<String, Integer> l_map) {
		this.l_map = l_map;
	}
	
	
	
}
