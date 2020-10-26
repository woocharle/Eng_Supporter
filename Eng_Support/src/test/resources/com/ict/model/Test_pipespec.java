package com.ict.model;


import org.junit.Before;
import org.junit.Test;

public class Test_pipespec {
	Pipespec pipespec;
	Heats heats;
	
	@Before
	public void testBefore() {
		pipespec = new Pipespec(); 
		heats = new Heats();
	}
	
	@Test
	public void test_re() {
	
		double result = pipespec.calRe("liquid", 675.6, 0.358, 45.1 * 675.6, 0, 0, 0, 0.128);
		System.out.println(Math.PI);
		System.out.println(45.1 * 675.6 / 3600 / 675.6 / (Math.PI * Math.pow(0.128, 2) /4));
		System.out.println("결과값: " + result + "\n");
	}
	
	@Test
	public void test_ffactor() {
		double result = pipespec.calFfactor_liq(228000, 0.128, 0.046);
		System.out.println("결과값: " + result + "\n");
	}
	
	@Test
	public void test_calPr() {
		double result = heats.calPr(0.5779926, 0.15407435, 0.0671863);
		System.out.println("결과값: " + result + "\n");
	}
	
	@Test
	public void test_calCSC() {
		//double result = heats.calCSC(1.016, , temp_air, temp_sur, wind_vel)
		//System.out.println("결과값: " + result + "\n");
	}
	
	
	
	
	public void testAfter() {
		System.out.println("테스트 완료");
	}

}
