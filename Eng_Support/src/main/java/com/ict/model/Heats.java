package com.ict.model;

import java.util.Map;

public class Heats {
	private Map<String, String> em_map;
	private double pi = Math.PI;
	private double temp_dry, temp_wet, temp_roof, temp_btm;
	private double ocf_dry, ocf_wet, ocf_roof, ocf_btm;
	
	// cal Area1는 Drywall의 면적
	public double calArea1(String body, String head, String part, double tdia, double tlen, double wtlen) {
		double res = 0;
		double dlen = 0;
		double el = 0;   //ellips의 비율  
		double elarea = 0;// ellpis의 넓이

		if(head.equals("ellips1")) {
			el = 2;
		} else if(head.equals("ellips2")) {
			el = 3;
		} 
		
		elarea = (el == 2 || el == 3) ? 2 * pi * (tdia * (el + 1) / el / 4) * (tdia / 2 / el) : 0;
		
		if (body.equals("vertical1") || body.equals("vertical2")) {
			res = part.equals("dry") ? pi * tdia * (tlen - wtlen) : pi * tdia * (wtlen);
					
			if(head.equals("plate")) {
				res = res + Math.pow(tdia, 2) / 4; 
			} else if (head.equals("ellips1") || head.equals("ellips2")) {
				res = res + elarea;
			}
		
		} else if(body.equals("horizontal") ) {
			double s_total = pi * Math.pow(tdia, 2) / 4;
			double theta = 0;
			double s_dry = 0;
			
			if(wtlen == tdia) {
				s_dry = 0;
				
			} else if(wtlen > tdia / 2){
				theta = 2 * Math.acos((tdia/2 - (wtlen - tdia/2))/ (tdia/2)) * 180 / pi;
				s_dry = s_total * (360 - theta) / 360 + Math.pow(tdia / 2, 2) * 0.5 * Math.sin(pi * theta / 180);
			
			} else if(wtlen == tdia/2) {
				s_dry = s_total / 2;
			}
			else {
				theta = 2 * Math.acos((tdia/2 - (tdia/2 - wtlen))/ (tdia/2)) * 180 / pi;
				s_dry = s_total - (s_total * theta / 360 - Math.pow(tdia / 2, 2) * 0.5 * Math.sin(pi * theta / 180));
			}
			
			res = part.equals("dry") ? (pi * tdia * tlen + 2 * elarea) * s_dry / s_total :
						   (pi * tdia * tlen + 2 * elarea) * (s_total - s_dry) / s_total ;	
			
		} else if(body.equals("sphere") ) {
			if(wtlen == tdia) {
				res = part.equals("dry") ? 0 : 4 * pi * Math.pow(wtlen/2, 2);
				
			}else if(wtlen > tdia / 2){
				dlen = tlen - tdia / 2;
				res = part.equals("dry") ? 2 * pi * Math.pow(tdia/2, 2) - 2 * pi * tdia / 2 * dlen :
										   2 * pi * Math.pow(tdia/2, 2) + 2 * pi * tdia / 2 * dlen ;
				
			}else if(wtlen == tdia / 2) {
				res = 2 * pi * Math.pow(tdia/2, 2);
						
			}else if(wtlen < tdia / 2 && wtlen > 0) {
				dlen = tdia / 2 - tlen;
				res = part.equals("dry") ? 2 * pi * Math.pow(tdia/2, 2) + 2 * pi * tdia / 2 * dlen : 
					 					   2 * pi * Math.pow(tdia/2, 2) - 2 * pi * tdia / 2 * dlen ;
				
				
			}else {
				res = part.equals("dry") ? 4 * pi * Math.pow(wtlen/2, 2) : 0;
			}
		}
		
		res =  ((int)(res * 100 * Math.pow(0.3048, 2))) / 100.0;
		
		return res;
	}	
	
	public double calArea2 (double tdia ,double troof) {
		return ((int)(100* Math.pow(0.3048, 2) * pi * tdia / 2 * Math.pow((Math.pow(tdia, 2) / 4 + Math.pow(troof, 2)), 0.5))) / 100.0;  
	}
	
	public double calArea3 (double tdia) {
		return ((int)(100 * Math.pow(0.3048, 2)* pi * Math.pow(tdia, 2) / 4)) / 100.0;
	}
	
	
	
	// Temp와 U값은 고정점 반복법 사용 [ abs(이전값 - 현재값) / 현재값 구하고 싶은 값을 변수로 넣어서 result 변화.]
	
	public void calResult_1(double tlen, double wtlen, double coeff_body, double coeff_sinsul, double coeff_d, double coeff_w,
							 double temp_vap, double vis_vap, double den_vap, double exp_vap, double spheat_vap, double thm_vap,
							 double temp_air, double vis_air, double den_air, double exp_air, double spheat_air, double thm_air,
							 double temp_liq, double vis_liq, double den_liq, double exp_liq, double spheat_liq, double thm_liq,
							 double em, double vel_wind) {
		
 		double temp_dry0 = (temp_vap / temp_air) / 2;
 		double temp_wet0 = (temp_liq / temp_air) / 2 ;
		double temp_wall = coeff_sinsul == 0 ? (temp_liq + temp_air) / 2: temp_air + 0.25 * (temp_liq  - temp_air);
		double temp_rad1 = coeff_sinsul == 0 ? (temp_vap + temp_air) / 2: temp_air + 0.25 * (temp_vap  - temp_air);
		double temp_rad2 = coeff_sinsul == 0 ? (temp_liq + temp_air) / 2: temp_air + 0.25 * (temp_liq  - temp_air);
		
		double gr_1 = calGr(temp_vap, vis_vap, den_vap, exp_vap, temp_dry, tlen - wtlen);
		double gr_2 = calGr(temp_liq, vis_liq, den_liq, exp_liq, temp_wet, wtlen);
		double gr_3 = calGr(temp_air, vis_air, den_air, exp_air, temp_wall, tlen);
		
		double pr_1 = calPr(spheat_vap, vis_vap, thm_vap);
		double pr_2 = calPr(spheat_liq, vis_liq, thm_liq);
		double pr_3 = calPr(spheat_air, vis_air, thm_air);
		
		double wind_f1 = 0.868 * Math.pow(Math.abs(temp_vap - temp_air) / 1.8, -0.246) * vel_wind * 0.44704 + 1;
		double wind_f2 = 0.868 * Math.pow(Math.abs(temp_liq - temp_air) / 1.8, -0.246) * vel_wind * 0.44704 + 1;
		
		double coeff_dry0 = calCoeff_vap(gr_1, pr_1, tlen - wtlen, thm_vap);
		double coeff_wet0 = calCoeff_liq(gr_2, pr_2, wtlen, thm_liq);
		double coeff_wall1 = calCoeff_vap(gr_3, pr_3, tlen, thm_air) * wind_f1;
		double coeff_wall2 = calCoeff_vap(gr_3, pr_3, tlen, thm_air) * wind_f2;
		double coeff_rad1 = calCoeff_rad(temp_rad1, temp_air, em);
		double coeff_rad2 = calCoeff_rad(temp_rad2, temp_air, em);
		
		double u0_dry = calCoeff_over(coeff_dry0, coeff_wall1, coeff_rad1, coeff_body, coeff_sinsul, coeff_d);
		double u0_wet = calCoeff_over(coeff_wet0, coeff_wall2, coeff_rad2, coeff_body, coeff_sinsul, coeff_w);
		
		double u1_dry = u0_dry;
		double u1_wet = u0_wet;
		double c1_dry = coeff_dry0;
		double c1_wet = coeff_wet0;
		double cr1_dry = coeff_rad1;
		double cr1_wet = coeff_rad2;
		double cw1_dry = coeff_wall1;
		double cw1_wet = coeff_wall2;
		
		
 		double t1_dry, t1_wet, t1_wall, t1_rad1, t1_rad2;
 		double u2_dry, u2_wet, c2_dry, c2_wet, cr2_dry, cr2_wet, cw2_dry, cw2_wet;
		double error1, error2;
		

		do {
			
			t1_dry = temp_vap - u1_dry / c1_dry * (temp_vap - temp_air);
			t1_wet = temp_liq - u1_wet / c1_wet * (temp_liq - temp_air);
			t1_rad1 = u1_dry / (cr1_dry + cw1_dry) * (temp_vap - temp_air) + temp_air;
			t1_rad2 = u1_wet / (cr1_wet + cw1_wet) * (temp_liq - temp_air) + temp_air;
			t1_wall = Math.max(t1_rad1, t1_rad2);
			
			gr_1 = calGr(temp_vap, vis_vap, den_vap, exp_vap, t1_dry, tlen - wtlen);
			gr_2 = calGr(temp_liq, vis_liq, den_liq, exp_liq, t1_wet, wtlen);
			gr_3 = calGr(temp_air, vis_air, den_air, exp_air, t1_wall, tlen);
			
			wind_f1 = 0.868 * Math.pow(Math.abs(temp_vap - temp_air) / 1.8, -0.246) * vel_wind * 0.44704 + 1;
			wind_f2 = 0.868 * Math.pow(Math.abs(temp_liq - temp_air) / 1.8, -0.246) * vel_wind * 0.44704 + 1;
			
			c2_dry = calCoeff_vap(gr_1, pr_1, tlen - wtlen, thm_vap);
			c2_wet =  calCoeff_liq(gr_2, pr_2, wtlen, thm_liq);
			cw2_dry =  calCoeff_vap(gr_3, pr_3, tlen, thm_air) * wind_f1;
			cw2_wet = calCoeff_vap(gr_3, pr_3, tlen, thm_air) * wind_f2;
			cr2_dry = calCoeff_rad(t1_rad1, temp_air, em);
			cr2_wet =  calCoeff_rad(t1_rad2, temp_air, em);
			
			u2_dry = calCoeff_over(c2_dry, cw2_dry, cr2_dry, coeff_body, coeff_sinsul, coeff_d);
			u2_wet  = calCoeff_over(c2_wet, cw2_wet, cr2_wet, coeff_body, coeff_sinsul, coeff_w);
			
			error1 = Math.abs(u1_dry - u2_dry) / u2_dry; 
			error2 = Math.abs(u1_wet - u2_wet) / u2_wet; 
			
			u1_dry = u2_dry;
			u1_wet = u2_wet;
			c1_dry = c2_dry;
			c1_wet = c2_wet;
			cr1_dry = cr2_dry;
			cr1_wet = cr2_wet;
			cw1_dry = cw2_dry;
			cw1_wet = cw2_wet;			
			
		}while(error1 > 0.00001 || error2 > 0.00001);
		
		temp_dry = (t1_dry - 32) * 5 / 9 ;
		temp_wet = (t1_wet - 32) * 5 / 9;
		ocf_dry = u2_dry * 4.882431;
		ocf_wet = u2_wet * 4.882431;
		
	}
	

	public double getTemp_dry() {
		return temp_dry;
	}

	public void setTemp_dry(double temp_dry) {
		this.temp_dry = temp_dry;
	}

	public double getTemp_wet() {
		return temp_wet;
	}

	public void setTemp_wet(double temp_wet) {
		this.temp_wet = temp_wet;
	}

	public double getOcf_dry() {
		return ocf_dry;
	}

	public void setOcf_dry(double ocf_dry) {
		this.ocf_dry = ocf_dry;
	}

	public double getOcf_wet() {
		return ocf_wet;
	}

	public void setOcf_wet(double ocf_wet) {
		this.ocf_wet = ocf_wet;
	}

	
	public void calResult_2(double tdia, double coeff_body, double coeff_rinsul, double coeff_f,
			 double temp_vap, double vis_vap, double den_vap, double exp_vap, double spheat_vap, double thm_vap,
			 double temp_air, double vis_air, double den_air, double exp_air, double spheat_air, double thm_air,
			 double temp_liq, double vis_liq, double den_liq, double exp_liq, double spheat_liq, double thm_liq,
			 double em, double vel_wind) {

		double temp_roof1 = (temp_vap / temp_air) / 2;
		double temp_roof2 = coeff_rinsul == 0 ? (temp_liq + temp_air) / 2: temp_air + 0.25 * (temp_vap  - temp_air);
		double temp_rad = coeff_rinsul == 0 ? temp_air + 0.5 * (temp_vap  - temp_air) / 2: temp_air + 0.25 * (temp_vap  - temp_air);
		
		double gr_1 = calGr(temp_vap, vis_vap, den_vap, exp_vap, temp_roof1, tdia);
		double gr_2 = calGr(temp_air, vis_air, den_air, exp_air, temp_roof2, tdia);
		
		double pr_1 = calPr(spheat_vap, vis_vap, thm_vap);
		double pr_2 = calPr(spheat_air, vis_air, thm_air);
		
		double wind_f = 0.868 * Math.pow(Math.abs(temp_vap - temp_air) / 1.8, -0.246) * vel_wind * 0.44704 + 1;
		
		double coeff_roof1 = calCoeff_roof1(gr_1, pr_1, tdia, thm_vap);
		double coeff_roof2 = calCoeff_roof2(gr_2, pr_2, tdia, thm_air) * wind_f;
		double coeff_rad = calCoeff_rad(temp_rad, temp_air, em);
		double u0_roof = calCoeff_over(coeff_roof1, coeff_roof2, coeff_rad, coeff_body, coeff_rinsul, coeff_f);
		
		double u1_roof = u0_roof;
		double c1_roof1 = coeff_roof1;
		double c1_roof2 = coeff_roof2;
		double cr1_roof = coeff_rad;
		
		double t1_roof1, t1_roof2, t1_rad;
		double u2_roof, c2_roof1, c2_roof2, cr2_roof;
		double error;
		
		
		do {
			t1_roof1 = temp_vap - u1_roof / c1_roof1 * (temp_vap - temp_air);
			t1_roof2 = temp_air + u1_roof / (c1_roof2 + cr1_roof) * (temp_vap - temp_air);
			t1_rad = temp_air + u1_roof / (c1_roof2 + cr1_roof) * (temp_vap - temp_air);
			
			gr_1 = calGr(temp_vap, vis_vap, den_vap, exp_vap, t1_roof1, tdia);
			gr_2 = calGr(temp_air, vis_air, den_air, exp_air, t1_roof2, tdia);
			
			wind_f = 0.868 * Math.pow(Math.abs(temp_vap - temp_air) / 1.8, -0.246) * vel_wind * 0.44704 + 1;
			
			c2_roof1 = calCoeff_roof1(gr_1, pr_1, tdia, thm_vap);
			c2_roof2 = calCoeff_roof2(gr_2, pr_2, tdia, thm_air) * wind_f;
			cr2_roof = calCoeff_rad(t1_rad, temp_air, em);
			u2_roof = calCoeff_over(c2_roof1, c2_roof2, cr2_roof, coeff_body, coeff_rinsul, coeff_f);		

			error = Math.abs(u1_roof - u2_roof) / u2_roof; 
			
			u1_roof = u2_roof;
			c1_roof1 = c2_roof1;
			c1_roof2 = c2_roof2;
			cr1_roof = cr2_roof;
			
		
		}while(error > 0.00001);
			
		temp_roof = (t1_roof1 - 32) * 5 / 9 ;
		ocf_roof = u2_roof * 4.882431;

	}
	
	public double getTemp_roof() {
		return temp_roof;
	}

	public void setTemp_roof(double temp_roof) {
		this.temp_roof = temp_roof;
	}

	public double getOcf_roof() {
		return ocf_roof;
	}

	public void setOcf_roof(double ocf_roof) {
		this.ocf_roof = ocf_roof;
	}

	
	public void calResult_3(double tdia, double coeff_body, double coeff_binsul, double coeff_f, double temp_air,
								double temp_liq, double vis_liq, double den_liq, double exp_liq, double spheat_liq, double thm_liq,
								double temp_gr, double thcon_gr) {

		double temp_btn = (temp_liq + temp_gr) / 2;
		double gr = calGr(temp_liq, vis_liq, den_liq, exp_liq, temp_btn, tdia);
		double pr = calPr(spheat_liq, vis_liq, thm_liq);
		
		double coeff_btn1 = calCoeff_roof2(gr, pr, tdia, thm_liq);
		double coeff_btn2 = calCoeff_gr(thcon_gr, tdia);
		
		double u0_btn = calCoeff_over(coeff_btn1, coeff_btn2, 0, coeff_body, coeff_binsul, coeff_f);
		
		double u1_btn = u0_btn;
		double c1_btn1 = coeff_btn1;
		
		double t1_btn1, u2_btn, c2_btn1;
		double error;
		
		
		do {
			t1_btn1 = temp_liq - u1_btn / c1_btn1 * (temp_liq - temp_air);
		
			gr = calGr(temp_liq, vis_liq, den_liq, exp_liq, t1_btn1, tdia);
			pr = calPr(spheat_liq, vis_liq, thm_liq);		
			
			c2_btn1 = calCoeff_roof2(gr, pr, tdia, thm_liq);
			u2_btn = calCoeff_over(c2_btn1, coeff_btn2, 0, coeff_body, coeff_binsul, coeff_f);

			error = Math.abs(u1_btn - u2_btn) / u2_btn; 
			
			u1_btn = u2_btn;
			c1_btn1 = c2_btn1;
		
		}while(error > 0.00001);
			
		temp_btm = (t1_btn1 - 32) * 5 / 9 ;
		ocf_btm = u2_btn * 4.882431;
		
	}

	// 부분 계산 

	public double getTemp_btm() {
		return temp_btm;
	}

	public void setTemp_btm(double temp_btm) {
		this.temp_btm = temp_btm;
	}

	public double getOcf_btm() {
		return ocf_btm;
	}

	public void setOcf_btm(double ocf_btm) {
		this.ocf_btm = ocf_btm;
	}

	public double calGr(double t, double vis, double den, double exp, double tw, double hi) {
		return Math.abs(t - tw) * Math.pow(hi, 3) * Math.pow(den, 2) * 4.17 * 100000000 * exp 
				/ Math.pow(2.42 * vis, 2) ; 
	}
	
	public double calPr(double cp, double vis, double th) {
		return 2.42 * vis * cp / th;
	}

	
	// k는 thermal conductivity를 의미한다. 
	
	public double calCoeff_vap(double gr, double pr, double len, double th) {
		double res = 0;
		double case1 = 0;   // Coeff1
		double case2 = 0;   // Coeff2
		double case3 = 0;   // Coeff4
		
		if (pr > 0.1 && pr < 40 && gr > Math.pow(10,9)) {
			case1 = 0.138 * Math.pow(gr, 0.36) * (Math.pow(pr, 0.175) - 0.55) * th / len;
		}else {
			case1 = 0;
		}		
		
		if (pr > 4.5 && pr < 5.5 && pr * gr > Math.pow(10,9)) {
			case2 = 0.0295 * Math.pow(gr, 0.4) * Math.pow(pr, 0.47) * Math.pow((1 + 0.5 * Math.pow(pr, 0.67)), -0.4) * th / len;
		
		}else {
			case2 = 0;
		}		
		
		case3 = 0.45 * th * Math.pow(len, -0.75) * Math.pow((gr * pr), 0.25);
		
		res = Math.max(Math.max(case1, case2), case3);
		
		return res;
	}
	
	public double calCoeff_liq(double gr, double pr, double len, double th) {
		double res = 0;
		double case1 = 0;   // Coeff1
		double case2 = 0;   // Coeff2
		double case3 = 0;   // Coeff4
		
		if (pr > 0.1 && pr < 40 && gr > Math.pow(10,9)) {
			case1 = 0.138 * Math.pow(gr, 0.36) * (Math.pow(pr, 0.175) - 0.55) * th / len;
		}else {
			case1 = 0;
		}		
		
		case2 = 0.495 * Math.pow((gr * pr), 0.25) * th / len;
		case3 = 0.45 * th * Math.pow(len, -0.75) * Math.pow((gr * pr), 0.25);
		
		res = Math.max(Math.max(case1, case2), case3);
		
		return res;
	}
	
	public double calCoeff_gr(double thcon_gr, double tdia) {
		return 8 * thcon_gr / pi  / tdia;
	}
	
	
	public double calCoeff_roof1(double gr, double pr, double len, double th) {
		return 0.27 * th * Math.pow((gr * pr), 0.25) / len;
	}
	
	public double calCoeff_roof2(double gr, double pr, double len, double th) {
		return 0.14 * th * Math.pow((gr * pr), 0.33) / len;
	}
	
	public double calCoeff_rad(double tw, double ta, double em) {
		return 0.1713 * em * Math.pow(10, -8) * (Math.pow((tw + 460), 4) - Math.pow((ta + 460), 4))/ (tw - ta); 
	}
	
	public double calCoeff_over(double coeff, double coeff_wall, double coeff_rad, 
							double coeff_body, double coeff_insul, double coeff_f) {
		double res = 0;
		if(coeff_insul == 0) {
			res = 1 / (1 / coeff + 1 / (coeff_wall + coeff_rad) + 1 / coeff_body + coeff_f);
		}else {
			res = 1 / (1 / coeff + 1 / (coeff_wall + coeff_rad) + 1 / coeff_body + 1 / coeff_insul + coeff_f);
		}
		
		return res; 
	}
	
	public double calCoeff_tank(double thcon_tank, double thick_tank) {
		double res = 0;
		
		if(thick_tank == 0) {
			res = 0;
		}else {
			res = thcon_tank / thick_tank * 12;
		}
		
		return res;
	}
	
	
	
	public Map<String, String> getEm_map() {
		return em_map;
	}

	public void setEm_map(Map<String, String> em_map) {
		this.em_map = em_map;
	}

	
}
