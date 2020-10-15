package com.ict.model;

import java.util.Map;

public class Tank {
	private Map<String, String> em_map;
	
	
	// cal Area1는 Drywall의 면적
	public double calArea1(String body, String head, double tdia, double tlen, double wtlen, double troof) {
		double res = 0;
		double dlen = 0;
		double el = 0;   //ellips의 비율  
		double hi = 0;   //ellpis의 높이
		double radius = 0; 
		double elarea = 0;// ellpis의 반지름. 	
		

		if(head.equals("ellips1")) {
			el = 2;
		} else if(head.equals("ellips2")) {
			el = 3;
		} 
		
		if (el != 0) {
			elarea = 2 * Math.PI * (tdia * (el + 1) / el / 4) * (tdia / 2 / el);
		}
		
		if (body.equals("vertical1")) {
			res = Math.PI * tdia * (tlen - wtlen);
			
			if(head.equals("plate")) {
				res = res + Math.pow(tdia, 2) / 4; 
			} 
			
		} else if(body.equals("vertical2") ) {
			res = Math.PI * tdia * (tlen - wtlen);
			
			if(head.equals("plate")) {
				res = res + Math.pow(tdia, 2) / 4; 
			} else if (head.equals("ellips1") || head.equals("ellips2")) {
				res = res + elarea;
			} 		
			
			
		} else if(body.equals("horizontal") ) {
			double s_total = Math.PI * Math.pow(tdia, 2) / 4;
			double theta = 2 * Math.acos((tdia/2 - (tdia - wtlen))/ (tdia/2)) * 180 / Math.PI;
			double s_dry = s_total * theta / 360 - Math.pow(tdia / 2, 2) * 0.5 * Math.sin(Math.PI * theta / 180) ;
		
			res = (Math.PI * tdia * tlen + 2 * elarea) * s_dry / s_total;	
			
		} else if(body.equals("sphere") ) {
			if(wtlen == tdia) {
				res = 0;
			}else if(wtlen > tdia / 2){
				dlen = tlen - tdia / 2;
				res = 2 * Math.PI * Math.pow(tdia/2, 2) - 2 * Math.PI * tdia / 2 * dlen;
				
			}else if(wtlen == tdia / 2) {
				res = 2 * Math.PI * Math.pow(tdia/2, 2);
						
			}else if(wtlen < tdia / 2) {
				dlen = tdia / 2 - tlen;
				res = 2 * Math.PI * Math.pow(tdia/2, 2) + 2 * Math.PI * tdia / 2 * dlen;
			}
		}
		
		return res;
	}	
	
	
	
	public double calGr(double tv, double vis, double den, double exp, double tw, double hi) {
		return Math.abs(tv - tw) * Math.pow(hi, 3) * Math.pow(den, 2) * 4.17 * 100000000 * exp 
				/ Math.pow(2.42 * vis, 2) ; 
	}
	
	public double calPr(double cp, double vis, double th) {
		return 2.42 * vis * cp / th;
	}

	
	// k는 thermal conductivity를 의미한다. 
	
	public double calCoeff1(double gr, double pr, double len, double k) {
		double res = 0;
		
		if (pr > 0.1 && pr < 40 && gr > Math.pow(10,9)) {
			res = 0.138 * Math.pow(gr, 0.36) * (Math.pow(pr, 0.175) - 0.55) * k / len;
		}else {
			res = 0;
		}
		
		return res;
	}
	
	public double calCoeff2(double gr, double pr, double len, double k) {
		double res = 0;
		
		if (pr > 4.5 && pr < 5.5 && pr * gr > Math.pow(10,9)) {
			res = 0.0295 * Math.pow(gr, 0.4) * Math.pow(pr, 0.47) * Math.pow((1 + 0.5 * Math.pow(pr, 0.67)), -0.4) * k / len;
		
		}else {
			res = 0;
		}
		
		return res;
	}
	
	public double calCoeff3(double gr, double pr, double len, double k) {
		return 0.495 * Math.pow((gr * pr), 0.25) * k / len;
	}
	
	public double calCoeff4(double gr, double pr, double len, double k) {
		return 0.45 * k * Math.pow(len, -0.75) * Math.pow((gr * pr), 0.25);
	}
	
	public double calCoeff5(double gr, double pr, double len, double k) {
		return 0.27 * k * Math.pow((gr * pr), 0.25) / len;
	}
	
	public double calCoeff6(double gr, double pr, double len, double k) {
		return 0.14 * k * Math.pow((gr * pr), 0.33) / len;
	}
	
	public double calCoeff7(double tw, double ta, double e) {
		return 0.1713 * e * Math.pow(10, -8) * (Math.pow((tw + 460), 4) - Math.pow((ta + 460), 4))/ (tw - ta); 
	}
	

	
	
	
	public Map<String, String> getEm_map() {
		return em_map;
	}

	public void setEm_map(Map<String, String> em_map) {
		this.em_map = em_map;
	}
	
}
