package com.ict.model;

import java.util.HashMap;
import java.util.Map;

public class Scala {
	private String[] list1, list2, list3, list4, list5;
	private double[] length1, length2, length3, length4, length5, length6,
					 vel1, vel2, vel3, vel4, vel5, press1, press2, press3, press4,
					 mass1, mass2, mass3, mass4, mass5;
	private Map<String, Integer> l_map, v_map, t_map, p_map, m_map;
 	
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
			case "m/s": list = vel1; break; 
			case "km/h": list = vel2; break; 
			case "ft/s": list = vel3; break; 
			case "ft/min": list = vel4; break; 
			case "mph": list = vel5; break; 	
						
			//압력
			case "Pa": list = press1; break; 
			case "kPa": list = press2; break; 
			case "bar": list = press3; break; 
			case "atm": list = press4; break; 	
			
			//질량
			case "g": list = mass1; break; 
			case "kg": list = mass2; break; 
			case "lb": list = mass3; break; 
			case "t": list = mass4; break; 
			case "mg": list = mass5; break; 				
			
		}

		return list;		
	}
	
	public int getConversion2(String scala, String scala2) {
		int num = 0;
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		
		switch (scala) {
			case "1": map = l_map; break; //길이
			case "2": map = v_map; break; //속도
			case "3": map = t_map; break; //온도
			case "4": map = p_map; break; //압력
			case "5": map = m_map; break; //질량
		}
	
		num = map.get(scala2);
		
		return num;
	}		

	public double getConversion3(String scala1, int scala2, double unit0) {
		double unit = 0;
		
		switch (scala1) {
			case "C˚(Celsius)":
				switch (scala2) {
					case 0 : unit = unit0; break;
					case 1 : unit = unit0 * 9 / 5 + 32; break;
					case 2 : unit = unit0 + 273.15; break;
					case 3 : unit = (unit0 * 9/5 + 32) + 459.67; break;
				}
				
			break;
			
			case "F˚(Fahrenheit)":
				switch (scala2) {
					case 0 : unit = (unit0 - 32)*5/9; break;
					case 1 : unit = unit0; break;
					case 2 : unit = (unit0 - 32)*5/9 + 273.15; break;
					case 3 : unit = unit0 + 459.67; break;
				}				
			break;
			
			case "K(Kelvin)":
				switch (scala2) {
					case 0 : unit = unit0 - 273.15; break;
					case 1 : unit = (unit0 - 273.15) * 9/5 + 32; break;
					case 2 : unit = unit0; break;
					case 3 : unit = (unit0 - 273.15) * 9/5 + 32 + 459.67; break;
				}				
			break;
				
			case "R(Rankine)":
				switch (scala2) {
					case 0 : unit = (unit0 - 459.67 - 32) * 5/9; break;
					case 1 : unit = unit0 - 459.67; break;
					case 2 : unit = (unit0 - 459.67 - 32) * 5/9 + 273.15 ; break;
					case 3 : unit = unit0; break;
				}				
			break;

		}
		
		return unit;
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

	public double[] getVel1() {
		return vel1;
	}

	public void setVel1(double[] vel1) {
		this.vel1 = vel1;
	}

	public double[] getVel2() {
		return vel2;
	}

	public void setVel2(double[] vel2) {
		this.vel2 = vel2;
	}

	public double[] getVel3() {
		return vel3;
	}

	public void setVel3(double[] vel3) {
		this.vel3 = vel3;
	}

	public double[] getVel4() {
		return vel4;
	}

	public void setVel4(double[] vel4) {
		this.vel4 = vel4;
	}

	public double[] getVel5() {
		return vel5;
	}

	public void setVel5(double[] vel5) {
		this.vel5 = vel5;
	}

	public double[] getPress1() {
		return press1;
	}

	public void setPress1(double[] press1) {
		this.press1 = press1;
	}

	public double[] getPress2() {
		return press2;
	}

	public void setPress2(double[] press2) {
		this.press2 = press2;
	}

	public double[] getPress3() {
		return press3;
	}

	public void setPress3(double[] press3) {
		this.press3 = press3;
	}

	public double[] getPress4() {
		return press4;
	}

	public void setPress4(double[] press4) {
		this.press4 = press4;
	}

	public double[] getMass1() {
		return mass1;
	}

	public void setMass1(double[] mass1) {
		this.mass1 = mass1;
	}

	public double[] getMass2() {
		return mass2;
	}

	public void setMass2(double[] mass2) {
		this.mass2 = mass2;
	}

	public double[] getMass3() {
		return mass3;
	}

	public void setMass3(double[] mass3) {
		this.mass3 = mass3;
	}

	public double[] getMass4() {
		return mass4;
	}

	public void setMass4(double[] mass4) {
		this.mass4 = mass4;
	}

	public double[] getMass5() {
		return mass5;
	}

	public void setMass5(double[] mass5) {
		this.mass5 = mass5;
	}

	public Map<String, Integer> getL_map() {
		return l_map;
	}

	public void setL_map(Map<String, Integer> l_map) {
		this.l_map = l_map;
	}

	public Map<String, Integer> getV_map() {
		return v_map;
	}

	public void setV_map(Map<String, Integer> v_map) {
		this.v_map = v_map;
	}

	public Map<String, Integer> getT_map() {
		return t_map;
	}

	public void setT_map(Map<String, Integer> t_map) {
		this.t_map = t_map;
	}

	public Map<String, Integer> getP_map() {
		return p_map;
	}

	public void setP_map(Map<String, Integer> p_map) {
		this.p_map = p_map;
	}

	public Map<String, Integer> getM_map() {
		return m_map;
	}

	public void setM_map(Map<String, Integer> m_map) {
		this.m_map = m_map;
	}
	
	
	
}
