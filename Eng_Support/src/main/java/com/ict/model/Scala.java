package com.ict.model;

import java.util.ArrayList;
import java.util.Arrays;

public class Scala {
	static ArrayList<String> list1 = new ArrayList<String>(
			Arrays.asList("mm", "cm", "m", "km", "in", "ft"));
	static ArrayList<String> list2 = new ArrayList<String>(
			Arrays.asList("m/s", "km/h", "ft/s", "ft/min", "mph"));
	static ArrayList<String> list3 = new ArrayList<String>(
			Arrays.asList("C˚(Celsius)", "F(Fahrenheit)", "K(Kelvin)", "R(Rankine)"));
	static ArrayList<String> list4 = new ArrayList<String>(
			Arrays.asList("Pa", "kPa", "bar", "atm"));
	static ArrayList<String> list5 = new ArrayList<String>(
			Arrays.asList("g","kg", "t", "mg", "lb"));

	
	public static ArrayList<String> getList(String unit){
		ArrayList<String> list = null;
		
		switch (unit) {
			case "1": list = list1; break; //길이
			case "2": list = list2; break; //속도
			case "3": list = list3; break; //온도
			case "4": list = list4; break; //압력
			case "5": list = list5; break; //질량
		
			default: list = list1; break;
		}
		
		return list;
		
	}
	
	
	
	
}
