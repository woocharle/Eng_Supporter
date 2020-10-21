package com.ict.db;


public class HVO2 {
	private String idx, lineno, phase, ev, stype, temp_air, temp_liq, temp_vapor, flow, em, wind_vel;
	private String den_liq, den_vapor, over, season, vis_liq, vis_vapor, vapor_fr, condition, depth;
	private String heat_liq, heat_vapor, flow_liq, convection, soil, thcon_liq, thcon_vapor, flow_vapor, heat_dia;
	private String eql_len, pipe_mtl, pipe_thick, pipe_con, insul_mtl, insul_thick, insul_con, cfactor, re, dia, dout, sch, din, pipelen, wall;
	
	//fitting
	private String elbow90_1, elbow90_2, elbow90_3, elbow90_4, elbow90_5, elbow90_6, elbow90_7, elbow90_8, elbow90_9;
	private String elbow45_1, elbow45_2, elbow45_3, elbow45_4, bend_1, bend_2, bend_3;
	private String tee_1, tee_2, tee_3, tee_4, tee_5, tee_6, tee_7;
	private String gtvalve, gbvalve, bvalve, cvalve_1, cvalve_2, avalve_1, avalve_2, pvalve_1, pvalve_2, pvalve_3;
	private String dvalve, redd, redth, expd, expth;
	
	private String g_temp, in_coeff, soil_coeff, out_coeff, out_temp, in_coeff_1, sur_temp, in_coeff_2, diff_temp, over_coeff, heattrans;
	
	
	private String[] dlist, slist;

	public HVO2() {}
	
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


	public String getPhase() {
		return phase;
	}


	public void setPhase(String phase) {
		this.phase = phase;
	}


	public String getEv() {
		return ev;
	}


	public void setEv(String ev) {
		this.ev = ev;
	}


	public String getStype() {
		return stype;
	}


	public void setStype(String stype) {
		this.stype = stype;
	}


	public String getTemp_air() {
		return temp_air;
	}


	public void setTemp_air(String temp_air) {
		this.temp_air = temp_air;
	}


	public String getTemp_liq() {
		return temp_liq;
	}


	public void setTemp_liq(String temp_liq) {
		this.temp_liq = temp_liq;
	}


	public String getTemp_vapor() {
		return temp_vapor;
	}


	public void setTemp_vapor(String temp_vapor) {
		this.temp_vapor = temp_vapor;
	}


	public String getFlow() {
		return flow;
	}


	public void setFlow(String flow) {
		this.flow = flow;
	}


	public String getEm() {
		return em;
	}


	public void setEm(String em) {
		this.em = em;
	}


	public String getWind_vel() {
		return wind_vel;
	}


	public void setWind_vel(String wind_vel) {
		this.wind_vel = wind_vel;
	}


	public String getDen_liq() {
		return den_liq;
	}


	public void setDen_liq(String den_liq) {
		this.den_liq = den_liq;
	}


	public String getDen_vapor() {
		return den_vapor;
	}


	public void setDen_vapor(String den_vapor) {
		this.den_vapor = den_vapor;
	}


	public String getOver() {
		return over;
	}


	public void setOver(String over) {
		this.over = over;
	}


	public String getSeason() {
		return season;
	}


	public void setSeason(String season) {
		this.season = season;
	}


	public String getVis_liq() {
		return vis_liq;
	}


	public void setVis_liq(String vis_liq) {
		this.vis_liq = vis_liq;
	}


	public String getVis_vapor() {
		return vis_vapor;
	}


	public void setVis_vapor(String vis_vapor) {
		this.vis_vapor = vis_vapor;
	}


	public String getVapor_fr() {
		return vapor_fr;
	}


	public void setVapor_fr(String vapor_fr) {
		this.vapor_fr = vapor_fr;
	}


	public String getCondition() {
		return condition;
	}


	public void setCondition(String condition) {
		this.condition = condition;
	}


	public String getDepth() {
		return depth;
	}


	public void setDepth(String depth) {
		this.depth = depth;
	}


	public String getHeat_liq() {
		return heat_liq;
	}


	public void setHeat_liq(String heat_liq) {
		this.heat_liq = heat_liq;
	}


	public String getHeat_vapor() {
		return heat_vapor;
	}


	public void setHeat_vapor(String heat_vapor) {
		this.heat_vapor = heat_vapor;
	}


	public String getFlow_liq() {
		return flow_liq;
	}


	public void setFlow_liq(String flow_liq) {
		this.flow_liq = flow_liq;
	}


	public String getConvection() {
		return convection;
	}


	public void setConvection(String convection) {
		this.convection = convection;
	}


	public String getSoil() {
		return soil;
	}


	public void setSoil(String soil) {
		this.soil = soil;
	}


	public String getThcon_liq() {
		return thcon_liq;
	}


	public void setThcon_liq(String thcon_liq) {
		this.thcon_liq = thcon_liq;
	}


	public String getThcon_vapor() {
		return thcon_vapor;
	}


	public void setThcon_vapor(String thcon_vapor) {
		this.thcon_vapor = thcon_vapor;
	}


	public String getFlow_vapor() {
		return flow_vapor;
	}


	public void setFlow_vapor(String flow_vapor) {
		this.flow_vapor = flow_vapor;
	}


	public String getHeat_dia() {
		return heat_dia;
	}


	public void setHeat_dia(String heat_dia) {
		this.heat_dia = heat_dia;
	}

	public String getPipe_mtl() {
		return pipe_mtl;
	}

	public void setPipe_mtl(String pipe_mtl) {
		this.pipe_mtl = pipe_mtl;
	}

	public String getPipe_thick() {
		return pipe_thick;
	}

	public void setPipe_thick(String pipe_thick) {
		this.pipe_thick = pipe_thick;
	}

	public String getPipe_con() {
		return pipe_con;
	}

	public void setPipe_con(String pipe_con) {
		this.pipe_con = pipe_con;
	}

	public String getInsul_mtl() {
		return insul_mtl;
	}

	public void setInsul_mtl(String insul_mtl) {
		this.insul_mtl = insul_mtl;
	}

	public String getInsul_thick() {
		return insul_thick;
	}


	public void setInsul_thick(String insul_thick) {
		this.insul_thick = insul_thick;
	}


	public String getInsul_con() {
		return insul_con;
	}


	public void setInsul_con(String insul_con) {
		this.insul_con = insul_con;
	}


	public String getCfactor() {
		return cfactor;
	}


	public void setCfactor(String cfactor) {
		this.cfactor = cfactor;
	}


	public String getRe() {
		return re;
	}


	public void setRe(String re) {
		this.re = re;
	}

	
	public String getDia() {
		return dia;
	}

	
	public void setDia(String dia) {
		this.dia = dia;
	}

	public String getDout() {
		return dout;
	}


	public void setDout(String dout) {
		this.dout = dout;
	}


	public String getSch() {
		return sch;
	}


	public void setSch(String sch) {
		this.sch = sch;
	}


	public String getDin() {
		return din;
	}


	public void setDin(String din) {
		this.din = din;
	}


	public String getPipelen() {
		return pipelen;
	}


	public void setPipelen(String pipelen) {
		this.pipelen = pipelen;
	}


	public String getWall() {
		return wall;
	}


	public void setWall(String wall) {
		this.wall = wall;
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


	public String getEql_len() {
		return eql_len;
	}


	public void setEql_len(String eql_len) {
		this.eql_len = eql_len;
	}


	public String getG_temp() {
		return g_temp;
	}


	public void setG_temp(String g_temp) {
		this.g_temp = g_temp;
	}


	public String getIn_coeff() {
		return in_coeff;
	}


	public void setIn_coeff(String in_coeff) {
		this.in_coeff = in_coeff;
	}


	public String getSoil_coeff() {
		return soil_coeff;
	}


	public void setSoil_coeff(String soil_coeff) {
		this.soil_coeff = soil_coeff;
	}


	public String getOut_coeff() {
		return out_coeff;
	}


	public void setOut_coeff(String out_coeff) {
		this.out_coeff = out_coeff;
	}


	public String getOut_temp() {
		return out_temp;
	}


	public void setOut_temp(String out_temp) {
		this.out_temp = out_temp;
	}


	public String getIn_coeff_1() {
		return in_coeff_1;
	}


	public void setIn_coeff_1(String in_coeff_1) {
		this.in_coeff_1 = in_coeff_1;
	}


	public String getSur_temp() {
		return sur_temp;
	}


	public void setSur_temp(String sur_temp) {
		this.sur_temp = sur_temp;
	}


	public String getIn_coeff_2() {
		return in_coeff_2;
	}


	public void setIn_coeff_2(String in_coeff_2) {
		this.in_coeff_2 = in_coeff_2;
	}


	public String getDiff_temp() {
		return diff_temp;
	}


	public void setDiff_temp(String diff_temp) {
		this.diff_temp = diff_temp;
	}


	public String[] getDlist() {
		return dlist;
	}


	public void setDlist(String[] dlist) {
		this.dlist = dlist;
	}


	public String[] getSlist() {
		return slist;
	}


	public void setSlist(String[] slist) {
		this.slist = slist;
	}

	public String getOver_coeff() {
		return over_coeff;
	}

	public void setOver_coeff(String over_coeff) {
		this.over_coeff = over_coeff;
	}

	public String getHeattrans() {
		return heattrans;
	}

	public void setHeattrans(String heattrans) {
		this.heattrans = heattrans;
	}
	
	

}
