package com.ict.db;

import java.util.List;

public class PVO2 {
	//General
	private String idx, lineno, pin, pout, temp, den, vis, flow, per, cfactor, dout, schd, din, plen, wall, elchange, eqvlen;
	private String elbow90_1, elbow90_2, elbow90_3, elbow90_4, elbow90_5, elbow90_6, elbow90_7, elbow90_8, elbow90_9;
	private String elbow45_1, elbow45_2, elbow45_3, elbow45_4, bend_1, bend_2, bend_3;
	private String tee_1, tee_2, tee_3, tee_4, tee_5, tee_6, tee_7;
	private String gtvalve, gbvalve, bvalve, cvalve_1, cvalve_2, avalve_1, avalve_2, pvalve_1, pvalve_2, pvalve_3;
	private String dvalve, redd, redth, expd, expth;
	
	private String[] size, schedule;
	//추가
	private String reynold, mol, cmpz, cpcv;
	
	
	public PVO2() {}


	public String getIdx() {
		return idx;
	}


	public void setIdx(String idx) {
		this.idx = idx;
	}


	public String getLineno() {
		return lineno;
	}


	public void setLineno(String lineno) {
		this.lineno = lineno;
	}


	public String getPin() {
		return pin;
	}


	public void setPin(String pin) {
		this.pin = pin;
	}


	public String getPout() {
		return pout;
	}


	public void setPout(String pout) {
		this.pout = pout;
	}


	public String getTemp() {
		return temp;
	}


	public void setTemp(String temp) {
		this.temp = temp;
	}


	public String getDen() {
		return den;
	}


	public void setDen(String den) {
		this.den = den;
	}


	public String getVis() {
		return vis;
	}


	public void setVis(String vis) {
		this.vis = vis;
	}


	public String getFlow() {
		return flow;
	}


	public void setFlow(String flow) {
		this.flow = flow;
	}


	public String getPer() {
		return per;
	}


	public void setPer(String per) {
		this.per = per;
	}


	public String getCfactor() {
		return cfactor;
	}


	public void setCfactor(String cfactor) {
		this.cfactor = cfactor;
	}


	public String getDout() {
		return dout;
	}


	public void setDout(String dout) {
		this.dout = dout;
	}


	public String getSchd() {
		return schd;
	}


	public void setSchd(String schd) {
		this.schd = schd;
	}


	public String getDin() {
		return din;
	}


	public void setDin(String din) {
		this.din = din;
	}


	public String getPlen() {
		return plen;
	}


	public void setPlen(String plen) {
		this.plen = plen;
	}


	public String getWall() {
		return wall;
	}


	public void setWall(String wall) {
		this.wall = wall;
	}


	public String getElchange() {
		return elchange;
	}


	public void setElchange(String elchange) {
		this.elchange = elchange;
	}


	public String getEqvlen() {
		return eqvlen;
	}


	public void setEqvlen(String eqvlen) {
		this.eqvlen = eqvlen;
	}


	public String getElbow90_1() {
		return elbow90_1;
	}


	public void setElbow90_1(String elbow90_1) {
		this.elbow90_1 = elbow90_1;
	}


	public String getElbow90_2() {
		return elbow90_2;
	}


	public void setElbow90_2(String elbow90_2) {
		this.elbow90_2 = elbow90_2;
	}


	public String getElbow90_3() {
		return elbow90_3;
	}


	public void setElbow90_3(String elbow90_3) {
		this.elbow90_3 = elbow90_3;
	}


	public String getElbow90_4() {
		return elbow90_4;
	}


	public void setElbow90_4(String elbow90_4) {
		this.elbow90_4 = elbow90_4;
	}


	public String getElbow90_5() {
		return elbow90_5;
	}


	public void setElbow90_5(String elbow90_5) {
		this.elbow90_5 = elbow90_5;
	}


	public String getElbow90_6() {
		return elbow90_6;
	}


	public void setElbow90_6(String elbow90_6) {
		this.elbow90_6 = elbow90_6;
	}


	public String getElbow90_7() {
		return elbow90_7;
	}


	public void setElbow90_7(String elbow90_7) {
		this.elbow90_7 = elbow90_7;
	}


	public String getElbow90_8() {
		return elbow90_8;
	}


	public void setElbow90_8(String elbow90_8) {
		this.elbow90_8 = elbow90_8;
	}


	public String getElbow90_9() {
		return elbow90_9;
	}


	public void setElbow90_9(String elbow90_9) {
		this.elbow90_9 = elbow90_9;
	}


	public String getElbow45_1() {
		return elbow45_1;
	}


	public void setElbow45_1(String elbow45_1) {
		this.elbow45_1 = elbow45_1;
	}


	public String getElbow45_2() {
		return elbow45_2;
	}


	public void setElbow45_2(String elbow45_2) {
		this.elbow45_2 = elbow45_2;
	}


	public String getElbow45_3() {
		return elbow45_3;
	}


	public void setElbow45_3(String elbow45_3) {
		this.elbow45_3 = elbow45_3;
	}


	public String getElbow45_4() {
		return elbow45_4;
	}


	public void setElbow45_4(String elbow45_4) {
		this.elbow45_4 = elbow45_4;
	}


	public String getBend_1() {
		return bend_1;
	}


	public void setBend_1(String bend_1) {
		this.bend_1 = bend_1;
	}


	public String getBend_2() {
		return bend_2;
	}


	public void setBend_2(String bend_2) {
		this.bend_2 = bend_2;
	}


	public String getBend_3() {
		return bend_3;
	}


	public void setBend_3(String bend_3) {
		this.bend_3 = bend_3;
	}


	public String getTee_1() {
		return tee_1;
	}


	public void setTee_1(String tee_1) {
		this.tee_1 = tee_1;
	}


	public String getTee_2() {
		return tee_2;
	}


	public void setTee_2(String tee_2) {
		this.tee_2 = tee_2;
	}


	public String getTee_3() {
		return tee_3;
	}


	public void setTee_3(String tee_3) {
		this.tee_3 = tee_3;
	}


	public String getTee_4() {
		return tee_4;
	}


	public void setTee_4(String tee_4) {
		this.tee_4 = tee_4;
	}


	public String getTee_5() {
		return tee_5;
	}


	public void setTee_5(String tee_5) {
		this.tee_5 = tee_5;
	}


	public String getTee_6() {
		return tee_6;
	}


	public void setTee_6(String tee_6) {
		this.tee_6 = tee_6;
	}


	public String getTee_7() {
		return tee_7;
	}


	public void setTee_7(String tee_7) {
		this.tee_7 = tee_7;
	}


	public String getGtvalve() {
		return gtvalve;
	}


	public void setGtvalve(String gtvalve) {
		this.gtvalve = gtvalve;
	}


	public String getGbvalve() {
		return gbvalve;
	}


	public void setGbvalve(String gbvalve) {
		this.gbvalve = gbvalve;
	}


	public String getBvalve() {
		return bvalve;
	}


	public void setBvalve(String bvalve) {
		this.bvalve = bvalve;
	}


	public String getCvalve_1() {
		return cvalve_1;
	}


	public void setCvalve_1(String cvalve_1) {
		this.cvalve_1 = cvalve_1;
	}


	public String getCvalve_2() {
		return cvalve_2;
	}


	public void setCvalve_2(String cvalve_2) {
		this.cvalve_2 = cvalve_2;
	}


	public String getAvalve_1() {
		return avalve_1;
	}


	public void setAvalve_1(String avalve_1) {
		this.avalve_1 = avalve_1;
	}


	public String getAvalve_2() {
		return avalve_2;
	}


	public void setAvalve_2(String avalve_2) {
		this.avalve_2 = avalve_2;
	}


	public String getPvalve_1() {
		return pvalve_1;
	}


	public void setPvalve_1(String pvalve_1) {
		this.pvalve_1 = pvalve_1;
	}


	public String getPvalve_2() {
		return pvalve_2;
	}


	public void setPvalve_2(String pvalve_2) {
		this.pvalve_2 = pvalve_2;
	}


	public String getPvalve_3() {
		return pvalve_3;
	}


	public void setPvalve_3(String pvalve_3) {
		this.pvalve_3 = pvalve_3;
	}


	public String getDvalve() {
		return dvalve;
	}


	public void setDvalve(String dvalve) {
		this.dvalve = dvalve;
	}


	public String getRedd() {
		return redd;
	}


	public void setRedd(String redd) {
		this.redd = redd;
	}


	public String getRedth() {
		return redth;
	}


	public void setRedth(String redth) {
		this.redth = redth;
	}


	public String getExpd() {
		return expd;
	}


	public void setExpd(String expd) {
		this.expd = expd;
	}


	public String getExpth() {
		return expth;
	}


	public void setExpth(String expth) {
		this.expth = expth;
	}


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


	public String getReynold() {
		return reynold;
	}


	public void setReynold(String reynold) {
		this.reynold = reynold;
	}


	public String getMol() {
		return mol;
	}


	public void setMol(String mol) {
		this.mol = mol;
	}


	public String getCmpz() {
		return cmpz;
	}


	public void setCmpz(String cmpz) {
		this.cmpz = cmpz;
	}


	public String getCpcv() {
		return cpcv;
	}


	public void setCpcv(String cpcv) {
		this.cpcv = cpcv;
	}

	
}
	