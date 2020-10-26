package com.ict.model;

import java.util.Map;

public class Pipespec {
	private String[] size, schedule;
	private double[] size1, size2 ,size3, size4, size5, size6, size7, size8, size9, size10,
					 size11, size12, size13, size14, size15, size16, size17, size18, size19, size20,
					 size21, size22, size23, size24, size25, size26, size27, size28, size29, size30;
			
	private Map<String, Integer> sch;	

	// pipe heat 
	private Map<String, String> pipe_em;	
	private Map<String, String> pipe_shp;	
	
	//Fitting
	private double[] elbow90_1, elbow90_2, elbow90_3, elbow90_4, elbow90_5, elbow90_6, elbow90_7, elbow90_8, elbow90_9;
	private double[] elbow45_1, elbow45_2, elbow45_3, elbow45_4, bend_1, bend_2, bend_3;
	private double[] tee_1, tee_2, tee_3, tee_4, tee_5, tee_6, tee_7;
	private double[] gtvalve, gbvalve, bvalve, cvalve_1, cvalve_2, avalve_1, avalve_2, pvalve_1, pvalve_2, pvalve_3, dvalve;
			
	//Common
	private double pi = Math.PI;
	

	// 메소드 

	// (1) Reynold no.
	public double calRe(String phase, double den_liq, double vis_liq , double flow_liq,
				 		double den_vap, double vis_vap, double flow_vap, double dia) {
		double re = 0;
		double den_avg, vel_avg, vis_avg; 
		double vel;
		
		switch (phase) {
			case "liquid": 
				vel = flow_liq / (pi * Math.pow(dia, 2) / 4) / den_liq / 3600;
				re = den_liq * vel * dia  / (vis_liq / 1000) ;
				
			break;
			
			case "vapor": 
				vel = flow_vap / (pi * Math.pow(dia, 2) / 4) / den_vap / 3600;
				re = den_vap * vel * dia / (vis_vap / 1000) ;
			
			break;
			/*
			case "2phase": 
				den_avg = (flow_liq + flow_vap)/(flow_liq /den_liq + flow_vap / den_vap);
				vel_avg = (flow_liq + flow_vap)/(den_avg * pi * Math.pow(dia, 2) / 4);
				vis_avg = (flow_liq + flow_vap)/(flow_liq /vis_liq * 1000 + flow_vap / vis_vap * 1000);
				re = 4 * (flow_liq + flow_vap)/(pi * dia * vis_avg);
			
			break;
			*/
		}
	
		return re;
	}
	
	// (2) friction factor 계산 (2phase 보강 필요.)
	
	public double calFfactor_liq(double re, double dia, double wall) {
		double ffactor = 0;
		
		if(re >= 2100) {
		
			double a1 = -2 * Math.log10(wall / 1000 / 3.7 + 12 / re);
			double b1 = -2 * Math.log10(wall / 1000 / 3.7 + 2.51 * a1 / re);
			double c1 = -2 * Math.log10(wall / 1000 / 3.7 + 2.51 * b1 / re);
			
			ffactor = a1 - Math.pow(b1 - a1, 2) / (c1 - 2 * b1 + a1);
			ffactor = Math.pow(ffactor , -2);
			
			double f1 = ffactor;
			double f2 = 0;
			
			do {
				
				f2 = 1 / (-2 * Math.log10(wall /1000 / 3.7 / dia + 2.51 / re / Math.pow(f1, 0.5))) ;
				f2 = Math.pow(f2 ,2);
				f1 = f2; 
							
			}while (Math.abs(f1 - f2) / f2 > 0.00001);
			
			ffactor = f2;
		
		}else {
			ffactor = 64 / re;
		}
		return ffactor;
	}

	public double calFfactor_vap(double re, double dia, double wall) {
		double ffactor = 0;
		
		if(re >= 2100) {
			
			ffactor = 1 / (2 * Math.log10(3.7 * dia / wall * 1000));
			ffactor = Math.pow(ffactor , 2);
			
			double f1 = ffactor;
			double f2 = 0;
			
			do {
				
				f2 = 1 / 0.99 / (2 * Math.log10(re * Math.pow(f1, 0.5) / 2.825)) ;
				f2 = Math.pow(f2 ,2);
				f1 = f2; 
				
			}while (Math.abs(f1 - f2) / f2 > 0.00001);
			
			ffactor = f2;
			
		}else {
			if (dia > 20) {
				ffactor = 0.032 / Math.pow(dia, 0.333);
			} else {
				ffactor = 64 / re;
			}
			
		}
		return ffactor;
	}
	
	// (3) Expander & Reducer 
	
	public double calExpander(double dia_pipe, double dia, double theta) {
	
		double beta = Math.pow(dia_pipe, 2) / Math.pow(dia, 2); 
		double res = 0;
		
		if (theta <= 45) {
			res = 2.6 * Math.sin(theta * pi / 4  /180) * (1 - Math.pow(dia_pipe, 2) / Math.pow(dia, 2));
			res = res / Math.pow(beta, 2);
		}else {
			res = (1 - Math.pow(dia_pipe, 2) / Math.pow(dia, 2)) / Math.pow(beta, 2);
			res = res / Math.pow(beta, 2);
		}
		
		return res;
	}
	
	public double calReducer(double dia_pipe, double dia, double theta) {
		double beta = Math.pow(dia, 2) / Math.pow(dia_pipe, 2); 
		double res = 0;
		
		if (theta <= 45) {
			res = 0.8 * Math.sin(theta * pi / 4  /180) * (1 - Math.pow(dia, 2) / Math.pow(dia_pipe, 2));
			res = res / Math.pow(beta, 2);
		}else {
			res = 0.5 * Math.pow(Math.sin(theta * pi / 4  /180), 0.5) * (1 - Math.pow(dia, 2) / Math.pow(dia_pipe, 2));
			res = res / Math.pow(beta, 2);
		}
		
		return res;		
		
	}

	// Getter & Setter
	
	//(0) 메소드 이용
	
	public double[] getDialist(String dia) {
		double[] list = new double[18];
		switch (dia) {
			case "1/8": list = size1; break; 	case "1/4": list = size2; break; 	case "3/8": list = size3; break;
			case "1/2": list = size4; break; 	case "3/4": list = size5; break; 	case "1": list = size6; break;
			case "1 1/4": list = size7; break; 	case "1 1/2": list = size8; break; 	case "2": list = size9; break;
			case "2 1/2": list = size10; break; case "3": list = size11; break; 	case "3 1/2": list = size12; break;
			case "4": list = size13; break; 	case "5": list = size14; break; 	case "6": list = size15; break;
			case "8": list = size16; break; 	case "10": list = size17; break; 	case "12": list = size18; break;
			case "14": list = size19; break; 	case "16": list = size20; break; 	case "18": list = size21; break;
			case "20": list = size22; break; 	case "22": list = size23; break; 	case "24": list = size24; break;
			case "26": list = size25; break; 	case "28": list = size26; break; 	case "30": list = size27; break;
			case "32": list = size28; break; 	case "34": list = size29; break; 	case "36": list = size30; break;

		}
		
		return list;
	}

	
	// (1) pipe schedule
	
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
	
	// (2) pipe heat
	
	public Map<String, String> getPipe_em() {
		return pipe_em;
	}

	public void setPipe_em(Map<String, String> pipe_em) {
		this.pipe_em = pipe_em;
	}
	
	public Map<String, String> getPipe_shp() {
		return pipe_shp;
	}

	public void setPipe_shp(Map<String, String> pipe_shp) {
		this.pipe_shp = pipe_shp;
	}

	// (3) fitting getter, setter
	

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
