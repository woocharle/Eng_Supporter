package com.ict.model;


public class Pipespec {
	private String[] size, schedule;
	private int[] elbow90_1, elbow90_2, elbow90_3, elbow90_4, elbow90_5, elbow90_6, elbow90_7, elbow90_8, elbow90_9;
	private int[] elbow45_1, elbow45_2, elbow45_3, elbow45_4, bend_1, bend_2, bend_3;
	private int[] tee_1, tee_2, tee_3, tee_4, tee_5, tee_6, tee_7;
	private int[] gtvalve, gbvalve, bvalve, cvalve_1, cvalve_2, avalve_1, avalve_2, pvalve_1, pvalve_2, pvalve_3;
	private int[] dvalve, redd, redth, expd, expth;
			
			

	public String[] getSize() {
		return size;
	}

	public void setSize(String[] size) {
		this.size = size;
	}

	public String[] getSchedule() {
		return schedule;
	}

	public void setSchedule(String[] schedule) {
		this.schedule = schedule;
	} 

	
	
}
