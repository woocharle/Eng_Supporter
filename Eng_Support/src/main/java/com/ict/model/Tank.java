package com.ict.model;

import java.util.Map;

public class Tank {
	private Map<String, String> em_map;
	private double pi = Math.PI;
	
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
	
	public double[] calResult_1(double tlen, double wtlen, double coeff_body, double coeff_sinsul, double coeff_d, double coeff_w,
							 double temp_vap, double vis_vap, double den_vap, double exp_vap, double spheat_vap, double thm_vap,
							 double temp_air, double vis_air, double den_air, double exp_air, double spheat_air, double thm_air,
							 double temp_liq, double vis_liq, double den_liq, double exp_liq, double spheat_liq, double thm_liq,
							 double em, double vel_wind) {
		
		double[] res = new double[4];
		double[] res2;  

		
 		double temp_dry = (temp_vap / temp_air) / 2;
 		double temp_wet = (temp_liq / temp_air) / 2 ;
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
		
		double coeff_dry = calCoeff_vap(gr_1, pr_1, tlen - wtlen, thm_vap);
		double coeff_wet = calCoeff_liq(gr_2, pr_2, wtlen, thm_liq);
		double coeff_wall1 = calCoeff_vap(gr_3, pr_3, tlen, thm_air) * wind_f1;
		double coeff_wall2 = calCoeff_vap(gr_3, pr_3, tlen, thm_air) * wind_f2;
		double coeff_rad1 = calCoeff_rad(temp_rad1, temp_air, em);
		double coeff_rad2 = calCoeff_rad(temp_rad2, temp_air, em);
		
		double u0_dry = calCoeff_over(coeff_dry, coeff_wall1, coeff_rad1, coeff_body, coeff_sinsul, coeff_d);
		double u0_wet = calCoeff_over(coeff_wet, coeff_wall2, coeff_rad2, coeff_body, coeff_sinsul, coeff_w);
		
		double u1_dry = u0_dry;
		double u1_wet = u0_wet;
		double c1_dry = coeff_dry;
		double c1_wet = coeff_wet;
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
			
			res2 = calRepeat_u1(tlen, wtlen, coeff_body, coeff_sinsul, coeff_d, coeff_w, 
								temp_vap, vis_vap, den_vap, exp_vap, thm_vap, pr_1, 
								temp_air, vis_air, den_air, exp_air, thm_air, pr_2, 
								temp_liq, vis_liq, den_liq, exp_liq, thm_liq, pr_3, 
								em, vel_wind, t1_dry, t1_wet, t1_rad1, t1_rad2, t1_wall);
	
			u2_dry = res2[0];
			u2_wet = res2[1];
			c2_dry = res2[2];
			c2_wet = res2[3];
			cr2_dry = res2[4];
			cr2_wet = res2[5];
			cw2_dry = res2[6];
			cw2_wet = res2[7];
			
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
		
		res[0] = (t1_dry - 32) * 5 / 9 ;
		res[1] = (t1_wet - 32) * 5 / 9;
		res[2] = u2_dry * 4.882431;
		res[3] = u2_wet * 4.882431;
		
		return res;
	}
	

	public double[] calRepeat_u1(double tlen, double wtlen, double coeff_body, double coeff_sinsul, double coeff_d, double coeff_w,
							 double temp_vap, double vis_vap, double den_vap, double exp_vap, double thm_vap, double pr_1,
							 double temp_air, double vis_air, double den_air, double exp_air, double thm_air, double pr_2,
							 double temp_liq, double vis_liq, double den_liq, double exp_liq, double thm_liq, double pr_3,
							 double em, double vel_wind, double t1_dry, double t1_wet, double t1_rad1, double t1_rad2, double t1_wall) {
		
		double[] res = new double[8];
		
		
		double gr_1 = calGr(temp_vap, vis_vap, den_vap, exp_vap, t1_dry, tlen - wtlen);
		double gr_2 = calGr(temp_liq, vis_liq, den_liq, exp_liq, t1_wet, wtlen);
		double gr_3 = calGr(temp_air, vis_air, den_air, exp_air, t1_wall, tlen);
		
		double wind_f1 = 0.868 * Math.pow(Math.abs(temp_vap - temp_air) / 1.8, -0.246) * vel_wind * 0.44704 + 1;
		double wind_f2 = 0.868 * Math.pow(Math.abs(temp_liq - temp_air) / 1.8, -0.246) * vel_wind * 0.44704 + 1;
		
		double coeff_dry = calCoeff_vap(gr_1, pr_1, tlen - wtlen, thm_vap);
		double coeff_wet = calCoeff_liq(gr_2, pr_2, wtlen, thm_liq);
		double coeff_wall1 = calCoeff_vap(gr_3, pr_3, tlen, thm_air) * wind_f1;
		double coeff_wall2 = calCoeff_vap(gr_3, pr_3, tlen, thm_air) * wind_f2;
		double coeff_rad1 = calCoeff_rad(t1_rad1, temp_air, em);
		double coeff_rad2 = calCoeff_rad(t1_rad2, temp_air, em);
		
		double u0_dry = calCoeff_over(coeff_dry, coeff_wall1, coeff_rad1, coeff_body, coeff_sinsul, coeff_d);
		double u0_wet = calCoeff_over(coeff_wet, coeff_wall2, coeff_rad2, coeff_body, coeff_sinsul, coeff_w);
		
		res[0] = u0_dry;
		res[1] = u0_wet;
		res[2] = coeff_dry;
		res[3] = coeff_wet;
		res[4] = coeff_rad1;
		res[5] = coeff_rad2;
		res[6] = coeff_wall1;
		res[7] = coeff_wall2;
		
		return res;
	}
	
	public double[] calResult_2(double tdia, double coeff_body, double coeff_rinsul, double coeff_r,
			 double temp_vap, double vis_vap, double den_vap, double exp_vap, double spheat_vap, double thm_vap,
			 double temp_air, double vis_air, double den_air, double exp_air, double spheat_air, double thm_air,
			 double temp_liq, double vis_liq, double den_liq, double exp_liq, double spheat_liq, double thm_liq,
			 double em, double vel_wind) {

		double[] res = new double[2];
		double[] res2;  
		
		
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
		double u0_roof = calCoeff_over(coeff_roof1, coeff_roof2, coeff_rad, coeff_body, coeff_rinsul, coeff_r);
		
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
			
			res2 = calRepeat_u2(tdia, coeff_body, coeff_rinsul, coeff_r,
							temp_vap, vis_vap, den_vap, exp_vap, thm_vap, 
							temp_air, vis_air, den_air, exp_air, thm_air, 
							temp_liq, pr_1, pr_2, em, vel_wind, t1_roof1, t1_roof2, t1_rad);
			
			u2_roof = res2[0];
			c2_roof1 = res2[1];
			c2_roof2 = res2[2];
			cr2_roof = res2[3];

			error = Math.abs(u1_roof - u2_roof) / u2_roof; 
			
			u1_roof = u2_roof;
			c1_roof1 = c2_roof1;
			c1_roof2 = c2_roof2;
			cr1_roof = cr2_roof;
			
		
		}while(error > 0.00001);
			
		res[0] = (t1_roof1 - 32) * 5 / 9 ;
		res[1] = u2_roof * 4.882431;
		
		return res;
	}
	
	public double[] calRepeat_u2(double tdia, double coeff_body, double coeff_rinsul, double coeff_r,
			 double temp_vap, double vis_vap, double den_vap, double exp_vap, double thm_vap, 
			 double temp_air, double vis_air, double den_air, double exp_air, double thm_air, 
			 double temp_liq, double pr_1, double pr_2, double em, double vel_wind, double t1_roof1, double t1_roof2, double t1_rad) {

		double[] res = new double[4];
		
		double gr_1 = calGr(temp_vap, vis_vap, den_vap, exp_vap, t1_roof1, tdia);
		double gr_2 = calGr(temp_air, vis_air, den_air, exp_air, t1_roof2, tdia);
		
		double wind_f = 0.868 * Math.pow(Math.abs(temp_vap - temp_air) / 1.8, -0.246) * vel_wind * 0.44704 + 1;
		
		double coeff_roof1 = calCoeff_roof1(gr_1, pr_1, tdia, thm_vap);
		double coeff_roof2 = calCoeff_roof2(gr_2, pr_2, tdia, thm_air) * wind_f;
		double coeff_rad = calCoeff_rad(t1_rad, temp_air, em);
		double u0_roof = calCoeff_over(coeff_roof1, coeff_roof2, coeff_rad, coeff_body, coeff_rinsul, coeff_r);
		
		res[0] = u0_roof;
		res[1] = coeff_roof1;
		res[2] = coeff_roof2;
		res[3] = coeff_rad;

		return res;
	}

	public double[] calResult_3(double tdia, double coeff_body, double coeff_binsul, double coeff_r, double temp_air,
								double temp_liq, double vis_liq, double den_liq, double exp_liq, double spheat_liq, double thm_liq,
								double temp_gr, double thcon_gr) {

		double[] res = new double[2];
		double[] res2;  
		
		
		double temp_btn = (temp_liq + temp_gr) / 2;
		double gr = calGr(temp_liq, vis_liq, den_liq, exp_liq, temp_btn, tdia);
		double pr = calPr(spheat_liq, vis_liq, thm_liq);
		
		double coeff_btn1 = calCoeff_roof2(gr, pr, tdia, thm_liq);
		double coeff_btn2 = calCoeff_gr(thcon_gr, tdia);
		
		double u0_btn = calCoeff_over(coeff_btn1, coeff_btn2, 0, coeff_body, coeff_binsul, coeff_r);
		
		double u1_btn = u0_btn;
		double c1_btn1 = coeff_btn1;
		
		double t1_btn1, u2_btn, c2_btn1;
		double error;
		
		
		do {
			t1_btn1 = temp_liq - u1_btn / c1_btn1 * (temp_liq - temp_air);
		
			res2 = calRepeat_u3(tdia, coeff_body, coeff_binsul, coeff_r, temp_air, 
								temp_liq, vis_liq, den_liq, exp_liq, spheat_liq, thm_liq, coeff_btn2, t1_btn1);
			
			u2_btn = res2[0];
			c2_btn1 = res2[1];

			error = Math.abs(u1_btn - u2_btn) / u2_btn; 
			
			u1_btn = u2_btn;
			c1_btn1 = c2_btn1;
		
		}while(error > 0.00001);
			
		res[0] = (t1_btn1 - 32) * 5 / 9 ;
		res[1] = u2_btn * 4.882431;
		System.out.println(c1_btn1);
		
		return res;
	}
	
	
	public double[] calRepeat_u3(double tdia, double coeff_body, double coeff_rinsul, double coeff_r, double temp_air,
			double temp_liq, double vis_liq, double den_liq, double exp_liq, double spheat_liq, double thm_liq,
			double coeff_btn2, double t1_btn) {

		double[] res = new double[2];
		
		double gr = calGr(temp_liq, vis_liq, den_liq, exp_liq, t1_btn, tdia);
		double pr = calPr(spheat_liq, vis_liq, thm_liq);
		
		double coeff_btn1 = calCoeff_roof2(gr, pr, tdia, thm_liq);
		
		double u0_btn = calCoeff_over(coeff_btn1, coeff_btn2, 0, coeff_body, coeff_rinsul, coeff_r);
		
		res[0] = u0_btn;
		res[1] = coeff_btn1;

		return res;
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
