package com.ict.model;

import java.util.Map;

public class Pipespec {
	private String[] size, schedule;
	private double[] size1, size2 ,size3, size4, size5, size6, size7, size8, size9, size10,
					 size11, size12, size13, size14, size15, size16, size17, size18, size19, size20,
					 size21, size22, size23, size24, size25, size26, size27, size28, size29, size30;
			
	private Map<String, Integer> sch;		
	
	private double[] elbow90_1, elbow90_2, elbow90_3, elbow90_4, elbow90_5, elbow90_6, elbow90_7, elbow90_8, elbow90_9;
	private double[] elbow45_1, elbow45_2, elbow45_3, elbow45_4, bend_1, bend_2, bend_3;
	private double[] tee_1, tee_2, tee_3, tee_4, tee_5, tee_6, tee_7;
	private double[] gtvalve, gbvalve, bvalve, cvalve_1, cvalve_2, avalve_1, avalve_2, pvalve_1, pvalve_2, pvalve_3, dvalve;
			
		
	// Reynold no. 구하는 식 추가.
	
	

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

	public double[] getSize1() {
		return size1;
	}

	public void setSize1(double[] size1) {
		this.size1 = size1;
	}

	public double[] getSize2() {
		return size2;
	}

	public void setSize2(double[] size2) {
		this.size2 = size2;
	}

	public double[] getSize3() {
		return size3;
	}

	public void setSize3(double[] size3) {
		this.size3 = size3;
	}

	public double[] getSize4() {
		return size4;
	}

	public void setSize4(double[] size4) {
		this.size4 = size4;
	}

	public double[] getSize5() {
		return size5;
	}

	public void setSize5(double[] size5) {
		this.size5 = size5;
	}

	public double[] getSize6() {
		return size6;
	}

	public void setSize6(double[] size6) {
		this.size6 = size6;
	}

	public double[] getSize7() {
		return size7;
	}

	public void setSize7(double[] size7) {
		this.size7 = size7;
	}

	public double[] getSize8() {
		return size8;
	}

	public void setSize8(double[] size8) {
		this.size8 = size8;
	}

	public double[] getSize9() {
		return size9;
	}

	public void setSize9(double[] size9) {
		this.size9 = size9;
	}

	public double[] getSize10() {
		return size10;
	}

	public void setSize10(double[] size10) {
		this.size10 = size10;
	}

	public double[] getSize11() {
		return size11;
	}

	public void setSize11(double[] size11) {
		this.size11 = size11;
	}

	public double[] getSize12() {
		return size12;
	}

	public void setSize12(double[] size12) {
		this.size12 = size12;
	}

	public double[] getSize13() {
		return size13;
	}

	public void setSize13(double[] size13) {
		this.size13 = size13;
	}

	public double[] getSize14() {
		return size14;
	}

	public void setSize14(double[] size14) {
		this.size14 = size14;
	}

	public double[] getSize15() {
		return size15;
	}

	public void setSize15(double[] size15) {
		this.size15 = size15;
	}

	public double[] getSize16() {
		return size16;
	}

	public void setSize16(double[] size16) {
		this.size16 = size16;
	}

	public double[] getSize17() {
		return size17;
	}

	public void setSize17(double[] size17) {
		this.size17 = size17;
	}

	public double[] getSize18() {
		return size18;
	}

	public void setSize18(double[] size18) {
		this.size18 = size18;
	}

	public double[] getSize19() {
		return size19;
	}

	public void setSize19(double[] size19) {
		this.size19 = size19;
	}

	public double[] getSize20() {
		return size20;
	}

	public void setSize20(double[] size20) {
		this.size20 = size20;
	}

	public double[] getSize21() {
		return size21;
	}

	public void setSize21(double[] size21) {
		this.size21 = size21;
	}

	public double[] getSize22() {
		return size22;
	}

	public void setSize22(double[] size22) {
		this.size22 = size22;
	}

	public double[] getSize23() {
		return size23;
	}

	public void setSize23(double[] size23) {
		this.size23 = size23;
	}

	public double[] getSize24() {
		return size24;
	}

	public void setSize24(double[] size24) {
		this.size24 = size24;
	}

	public double[] getSize25() {
		return size25;
	}

	public void setSize25(double[] size25) {
		this.size25 = size25;
	}

	public double[] getSize26() {
		return size26;
	}

	public void setSize26(double[] size26) {
		this.size26 = size26;
	}

	public double[] getSize27() {
		return size27;
	}

	public void setSize27(double[] size27) {
		this.size27 = size27;
	}

	public double[] getSize28() {
		return size28;
	}

	public void setSize28(double[] size28) {
		this.size28 = size28;
	}

	public double[] getSize29() {
		return size29;
	}

	public void setSize29(double[] size29) {
		this.size29 = size29;
	}

	public double[] getSize30() {
		return size30;
	}

	public void setSize30(double[] size30) {
		this.size30 = size30;
	}

	public Map<String, Integer> getSch() {
		return sch;
	}

	public void setSch(Map<String, Integer> sch) {
		this.sch = sch;
	}

	
	// fitting getter, setter
	
	public double[] getElbow90_1() {
		return elbow90_1;
	}

	public void setElbow90_1(double[] elbow90_1) {
		this.elbow90_1 = elbow90_1;
	}

	public double[] getElbow90_2() {
		return elbow90_2;
	}

	public void setElbow90_2(double[] elbow90_2) {
		this.elbow90_2 = elbow90_2;
	}

	public double[] getElbow90_3() {
		return elbow90_3;
	}

	public void setElbow90_3(double[] elbow90_3) {
		this.elbow90_3 = elbow90_3;
	}

	public double[] getElbow90_4() {
		return elbow90_4;
	}

	public void setElbow90_4(double[] elbow90_4) {
		this.elbow90_4 = elbow90_4;
	}

	public double[] getElbow90_5() {
		return elbow90_5;
	}

	public void setElbow90_5(double[] elbow90_5) {
		this.elbow90_5 = elbow90_5;
	}

	public double[] getElbow90_6() {
		return elbow90_6;
	}

	public void setElbow90_6(double[] elbow90_6) {
		this.elbow90_6 = elbow90_6;
	}

	public double[] getElbow90_7() {
		return elbow90_7;
	}

	public void setElbow90_7(double[] elbow90_7) {
		this.elbow90_7 = elbow90_7;
	}

	public double[] getElbow90_8() {
		return elbow90_8;
	}

	public void setElbow90_8(double[] elbow90_8) {
		this.elbow90_8 = elbow90_8;
	}

	public double[] getElbow90_9() {
		return elbow90_9;
	}

	public void setElbow90_9(double[] elbow90_9) {
		this.elbow90_9 = elbow90_9;
	}

	public double[] getElbow45_1() {
		return elbow45_1;
	}

	public void setElbow45_1(double[] elbow45_1) {
		this.elbow45_1 = elbow45_1;
	}

	public double[] getElbow45_2() {
		return elbow45_2;
	}

	public void setElbow45_2(double[] elbow45_2) {
		this.elbow45_2 = elbow45_2;
	}

	public double[] getElbow45_3() {
		return elbow45_3;
	}

	public void setElbow45_3(double[] elbow45_3) {
		this.elbow45_3 = elbow45_3;
	}

	public double[] getElbow45_4() {
		return elbow45_4;
	}

	public void setElbow45_4(double[] elbow45_4) {
		this.elbow45_4 = elbow45_4;
	}

	public double[] getBend_1() {
		return bend_1;
	}

	public void setBend_1(double[] bend_1) {
		this.bend_1 = bend_1;
	}

	public double[] getBend_2() {
		return bend_2;
	}

	public void setBend_2(double[] bend_2) {
		this.bend_2 = bend_2;
	}

	public double[] getBend_3() {
		return bend_3;
	}

	public void setBend_3(double[] bend_3) {
		this.bend_3 = bend_3;
	}

	public double[] getTee_1() {
		return tee_1;
	}

	public void setTee_1(double[] tee_1) {
		this.tee_1 = tee_1;
	}

	public double[] getTee_2() {
		return tee_2;
	}

	public void setTee_2(double[] tee_2) {
		this.tee_2 = tee_2;
	}

	public double[] getTee_3() {
		return tee_3;
	}

	public void setTee_3(double[] tee_3) {
		this.tee_3 = tee_3;
	}

	public double[] getTee_4() {
		return tee_4;
	}

	public void setTee_4(double[] tee_4) {
		this.tee_4 = tee_4;
	}

	public double[] getTee_5() {
		return tee_5;
	}

	public void setTee_5(double[] tee_5) {
		this.tee_5 = tee_5;
	}

	public double[] getTee_6() {
		return tee_6;
	}

	public void setTee_6(double[] tee_6) {
		this.tee_6 = tee_6;
	}

	public double[] getTee_7() {
		return tee_7;
	}

	public void setTee_7(double[] tee_7) {
		this.tee_7 = tee_7;
	}

	public double[] getGtvalve() {
		return gtvalve;
	}

	public void setGtvalve(double[] gtvalve) {
		this.gtvalve = gtvalve;
	}

	public double[] getGbvalve() {
		return gbvalve;
	}

	public void setGbvalve(double[] gbvalve) {
		this.gbvalve = gbvalve;
	}

	public double[] getBvalve() {
		return bvalve;
	}

	public void setBvalve(double[] bvalve) {
		this.bvalve = bvalve;
	}

	public double[] getCvalve_1() {
		return cvalve_1;
	}

	public void setCvalve_1(double[] cvalve_1) {
		this.cvalve_1 = cvalve_1;
	}

	public double[] getCvalve_2() {
		return cvalve_2;
	}

	public void setCvalve_2(double[] cvalve_2) {
		this.cvalve_2 = cvalve_2;
	}

	public double[] getAvalve_1() {
		return avalve_1;
	}

	public void setAvalve_1(double[] avalve_1) {
		this.avalve_1 = avalve_1;
	}

	public double[] getAvalve_2() {
		return avalve_2;
	}

	public void setAvalve_2(double[] avalve_2) {
		this.avalve_2 = avalve_2;
	}

	public double[] getPvalve_1() {
		return pvalve_1;
	}

	public void setPvalve_1(double[] pvalve_1) {
		this.pvalve_1 = pvalve_1;
	}

	public double[] getPvalve_2() {
		return pvalve_2;
	}

	public void setPvalve_2(double[] pvalve_2) {
		this.pvalve_2 = pvalve_2;
	}

	public double[] getPvalve_3() {
		return pvalve_3;
	}

	public void setPvalve_3(double[] pvalve_3) {
		this.pvalve_3 = pvalve_3;
	}

	public double[] getDvalve() {
		return dvalve;
	}

	public void setDvalve(double[] dvalve) {
		this.dvalve = dvalve;
	} 

	
	
}
