package com.ict.db;

import java.util.List;

public class PVO3 {
	//General
	private String idx_2, lineno_2, pin_2, pout_2, temp_2, den_2, vis_2, flow_2, per_2, cfactor_2, dout_2, schd_2, din_2, plen_2, wall_2, elchange_2, eqvlen_2;
	private String elbow90_1_2, elbow90_2_2, elbow90_3_2, elbow90_4_2, elbow90_5_2, elbow90_6_2, elbow90_7_2, elbow90_8_2, elbow90_9_2;
	private String elbow45_1_2, elbow45_2_2, bend_1_2, bend_2_2, bend_3_2;
	private String tee_1_2, tee_2_2, tee_3_2, tee_4_2, tee_5_2, tee_6_2, tee_7_2, tee_8_2;
	private String gtvalve_2, gbvalve_2, bvalve_2, cvalve_1_2, cvalve_2_2, avalve_1_2, avalve_2_2, pvalve_1_2, pvalve_2_2, pvalve_3_2;
	private String dvalve_2, redd_2, redth_2, expd_2, expth_2;
	
	private List<String> size, schedule;
	
	public PVO3() {}

	public PVO3(String idx_2, String lineno_2, String pin_2, String pout_2, String temp_2, String den_2, String vis_2,
			String flow_2, String per_2, String cfactor_2, String dout_2, String schd_2, String din_2, String plen_2,
			String wall_2, String elchange_2, String eqvlen_2, String elbow90_1_2, String elbow90_2_2,
			String elbow90_3_2, String elbow90_4_2, String elbow90_5_2, String elbow90_6_2, String elbow90_7_2,
			String elbow90_8_2, String elbow90_9_2, String elbow45_1_2, String elbow45_2_2, String bend_1_2,
			String bend_2_2, String bend_3_2, String tee_1_2, String tee_2_2, String tee_3_2, String tee_4_2,
			String tee_5_2, String tee_6_2, String tee_7_2, String tee_8_2, String gtvalve_2, String gbvalve_2,
			String bvalve_2, String cvalve_1_2, String cvalve_2_2, String avalve_1_2, String avalve_2_2,
			String pvalve_1_2, String pvalve_2_2, String pvalve_3_2, String dvalve_2, String redd_2, String redth_2,
			String expd_2, String expth_2, List<String> size, List<String> schedule) {
			
			super();
			this.idx_2 = idx_2;
			this.lineno_2 = lineno_2;
			this.pin_2 = pin_2;
			this.pout_2 = pout_2;
			this.temp_2 = temp_2;
			this.den_2 = den_2;
			this.vis_2 = vis_2;
			this.flow_2 = flow_2;
			this.per_2 = per_2;
			this.cfactor_2 = cfactor_2;
			this.dout_2 = dout_2;
			this.schd_2 = schd_2;
			this.din_2 = din_2;
			this.plen_2 = plen_2;
			this.wall_2 = wall_2;
			this.elchange_2 = elchange_2;
			this.eqvlen_2 = eqvlen_2;
			this.elbow90_1_2 = elbow90_1_2;
			this.elbow90_2_2 = elbow90_2_2;
			this.elbow90_3_2 = elbow90_3_2;
			this.elbow90_4_2 = elbow90_4_2;
			this.elbow90_5_2 = elbow90_5_2;
			this.elbow90_6_2 = elbow90_6_2;
			this.elbow90_7_2 = elbow90_7_2;
			this.elbow90_8_2 = elbow90_8_2;
			this.elbow90_9_2 = elbow90_9_2;
			this.elbow45_1_2 = elbow45_1_2;
			this.elbow45_2_2 = elbow45_2_2;
			this.bend_1_2 = bend_1_2;
			this.bend_2_2 = bend_2_2;
			this.bend_3_2 = bend_3_2;
			this.tee_1_2 = tee_1_2;
			this.tee_2_2 = tee_2_2;
			this.tee_3_2 = tee_3_2;
			this.tee_4_2 = tee_4_2;
			this.tee_5_2 = tee_5_2;
			this.tee_6_2 = tee_6_2;
			this.tee_7_2 = tee_7_2;
			this.tee_8_2 = tee_8_2;
			this.gtvalve_2 = gtvalve_2;
			this.gbvalve_2 = gbvalve_2;
			this.bvalve_2 = bvalve_2;
			this.cvalve_1_2 = cvalve_1_2;
			this.cvalve_2_2 = cvalve_2_2;
			this.avalve_1_2 = avalve_1_2;
			this.avalve_2_2 = avalve_2_2;
			this.pvalve_1_2 = pvalve_1_2;
			this.pvalve_2_2 = pvalve_2_2;
			this.pvalve_3_2 = pvalve_3_2;
			this.dvalve_2 = dvalve_2;
			this.redd_2 = redd_2;
			this.redth_2 = redth_2;
			this.expd_2 = expd_2;
			this.expth_2 = expth_2;
			this.size = size;
			this.schedule = schedule;
			
			
	}

	public String getIdx_2() {
		return idx_2;
	}

	public void setIdx_2(String idx_2) {
		this.idx_2 = idx_2;
	}

	public String getLineno_2() {
		return lineno_2;
	}

	public void setLineno_2(String lineno_2) {
		this.lineno_2 = lineno_2;
	}

	public String getPin_2() {
		return pin_2;
	}

	public void setPin_2(String pin_2) {
		this.pin_2 = pin_2;
	}

	public String getPout_2() {
		return pout_2;
	}

	public void setPout_2(String pout_2) {
		this.pout_2 = pout_2;
	}

	public String getTemp_2() {
		return temp_2;
	}

	public void setTemp_2(String temp_2) {
		this.temp_2 = temp_2;
	}

	public String getDen_2() {
		return den_2;
	}

	public void setDen_2(String den_2) {
		this.den_2 = den_2;
	}

	public String getVis_2() {
		return vis_2;
	}

	public void setVis_2(String vis_2) {
		this.vis_2 = vis_2;
	}

	public String getFlow_2() {
		return flow_2;
	}

	public void setFlow_2(String flow_2) {
		this.flow_2 = flow_2;
	}

	public String getPer_2() {
		return per_2;
	}

	public void setPer_2(String per_2) {
		this.per_2 = per_2;
	}

	public String getCfactor_2() {
		return cfactor_2;
	}

	public void setCfactor_2(String cfactor_2) {
		this.cfactor_2 = cfactor_2;
	}

	public String getDout_2() {
		return dout_2;
	}

	public void setDout_2(String dout_2) {
		this.dout_2 = dout_2;
	}

	public String getSchd_2() {
		return schd_2;
	}

	public void setSchd_2(String schd_2) {
		this.schd_2 = schd_2;
	}

	public String getDin_2() {
		return din_2;
	}

	public void setDin_2(String din_2) {
		this.din_2 = din_2;
	}

	public String getPlen_2() {
		return plen_2;
	}

	public void setPlen_2(String plen_2) {
		this.plen_2 = plen_2;
	}

	public String getWall_2() {
		return wall_2;
	}

	public void setWall_2(String wall_2) {
		this.wall_2 = wall_2;
	}

	public String getElchange_2() {
		return elchange_2;
	}

	public void setElchange_2(String elchange_2) {
		this.elchange_2 = elchange_2;
	}

	public String getEqvlen_2() {
		return eqvlen_2;
	}

	public void setEqvlen_2(String eqvlen_2) {
		this.eqvlen_2 = eqvlen_2;
	}

	public String getElbow90_1_2() {
		return elbow90_1_2;
	}

	public void setElbow90_1_2(String elbow90_1_2) {
		this.elbow90_1_2 = elbow90_1_2;
	}

	public String getElbow90_2_2() {
		return elbow90_2_2;
	}

	public void setElbow90_2_2(String elbow90_2_2) {
		this.elbow90_2_2 = elbow90_2_2;
	}

	public String getElbow90_3_2() {
		return elbow90_3_2;
	}

	public void setElbow90_3_2(String elbow90_3_2) {
		this.elbow90_3_2 = elbow90_3_2;
	}

	public String getElbow90_4_2() {
		return elbow90_4_2;
	}

	public void setElbow90_4_2(String elbow90_4_2) {
		this.elbow90_4_2 = elbow90_4_2;
	}

	public String getElbow90_5_2() {
		return elbow90_5_2;
	}

	public void setElbow90_5_2(String elbow90_5_2) {
		this.elbow90_5_2 = elbow90_5_2;
	}

	public String getElbow90_6_2() {
		return elbow90_6_2;
	}

	public void setElbow90_6_2(String elbow90_6_2) {
		this.elbow90_6_2 = elbow90_6_2;
	}

	public String getElbow90_7_2() {
		return elbow90_7_2;
	}

	public void setElbow90_7_2(String elbow90_7_2) {
		this.elbow90_7_2 = elbow90_7_2;
	}

	public String getElbow90_8_2() {
		return elbow90_8_2;
	}

	public void setElbow90_8_2(String elbow90_8_2) {
		this.elbow90_8_2 = elbow90_8_2;
	}

	public String getElbow90_9_2() {
		return elbow90_9_2;
	}

	public void setElbow90_9_2(String elbow90_9_2) {
		this.elbow90_9_2 = elbow90_9_2;
	}

	public String getElbow45_1_2() {
		return elbow45_1_2;
	}

	public void setElbow45_1_2(String elbow45_1_2) {
		this.elbow45_1_2 = elbow45_1_2;
	}

	public String getElbow45_2_2() {
		return elbow45_2_2;
	}

	public void setElbow45_2_2(String elbow45_2_2) {
		this.elbow45_2_2 = elbow45_2_2;
	}

	public String getBend_1_2() {
		return bend_1_2;
	}

	public void setBend_1_2(String bend_1_2) {
		this.bend_1_2 = bend_1_2;
	}

	public String getBend_2_2() {
		return bend_2_2;
	}

	public void setBend_2_2(String bend_2_2) {
		this.bend_2_2 = bend_2_2;
	}

	public String getBend_3_2() {
		return bend_3_2;
	}

	public void setBend_3_2(String bend_3_2) {
		this.bend_3_2 = bend_3_2;
	}

	public String getTee_1_2() {
		return tee_1_2;
	}

	public void setTee_1_2(String tee_1_2) {
		this.tee_1_2 = tee_1_2;
	}

	public String getTee_2_2() {
		return tee_2_2;
	}

	public void setTee_2_2(String tee_2_2) {
		this.tee_2_2 = tee_2_2;
	}

	public String getTee_3_2() {
		return tee_3_2;
	}

	public void setTee_3_2(String tee_3_2) {
		this.tee_3_2 = tee_3_2;
	}

	public String getTee_4_2() {
		return tee_4_2;
	}

	public void setTee_4_2(String tee_4_2) {
		this.tee_4_2 = tee_4_2;
	}

	public String getTee_5_2() {
		return tee_5_2;
	}

	public void setTee_5_2(String tee_5_2) {
		this.tee_5_2 = tee_5_2;
	}

	public String getTee_6_2() {
		return tee_6_2;
	}

	public void setTee_6_2(String tee_6_2) {
		this.tee_6_2 = tee_6_2;
	}

	public String getTee_7_2() {
		return tee_7_2;
	}

	public void setTee_7_2(String tee_7_2) {
		this.tee_7_2 = tee_7_2;
	}

	public String getTee_8_2() {
		return tee_8_2;
	}

	public void setTee_8_2(String tee_8_2) {
		this.tee_8_2 = tee_8_2;
	}

	public String getGtvalve_2() {
		return gtvalve_2;
	}

	public void setGtvalve_2(String gtvalve_2) {
		this.gtvalve_2 = gtvalve_2;
	}

	public String getGbvalve_2() {
		return gbvalve_2;
	}

	public void setGbvalve_2(String gbvalve_2) {
		this.gbvalve_2 = gbvalve_2;
	}

	public String getBvalve_2() {
		return bvalve_2;
	}

	public void setBvalve_2(String bvalve_2) {
		this.bvalve_2 = bvalve_2;
	}

	public String getCvalve_1_2() {
		return cvalve_1_2;
	}

	public void setCvalve_1_2(String cvalve_1_2) {
		this.cvalve_1_2 = cvalve_1_2;
	}

	public String getCvalve_2_2() {
		return cvalve_2_2;
	}

	public void setCvalve_2_2(String cvalve_2_2) {
		this.cvalve_2_2 = cvalve_2_2;
	}

	public String getAvalve_1_2() {
		return avalve_1_2;
	}

	public void setAvalve_1_2(String avalve_1_2) {
		this.avalve_1_2 = avalve_1_2;
	}

	public String getAvalve_2_2() {
		return avalve_2_2;
	}

	public void setAvalve_2_2(String avalve_2_2) {
		this.avalve_2_2 = avalve_2_2;
	}

	public String getPvalve_1_2() {
		return pvalve_1_2;
	}

	public void setPvalve_1_2(String pvalve_1_2) {
		this.pvalve_1_2 = pvalve_1_2;
	}

	public String getPvalve_2_2() {
		return pvalve_2_2;
	}

	public void setPvalve_2_2(String pvalve_2_2) {
		this.pvalve_2_2 = pvalve_2_2;
	}

	public String getPvalve_3_2() {
		return pvalve_3_2;
	}

	public void setPvalve_3_2(String pvalve_3_2) {
		this.pvalve_3_2 = pvalve_3_2;
	}

	public String getDvalve_2() {
		return dvalve_2;
	}

	public void setDvalve_2(String dvalve_2) {
		this.dvalve_2 = dvalve_2;
	}

	public String getRedd_2() {
		return redd_2;
	}

	public void setRedd_2(String redd_2) {
		this.redd_2 = redd_2;
	}

	public String getRedth_2() {
		return redth_2;
	}

	public void setRedth_2(String redth_2) {
		this.redth_2 = redth_2;
	}

	public String getExpd_2() {
		return expd_2;
	}

	public void setExpd_2(String expd_2) {
		this.expd_2 = expd_2;
	}

	public String getExpth_2() {
		return expth_2;
	}

	public void setExpth_2(String expth_2) {
		this.expth_2 = expth_2;
	}

	public List<String> getSize() {
		return size;
	}

	public void setSize(List<String> size) {
		this.size = size;
	}

	public List<String> getSchedule() {
		return schedule;
	}

	public void setSchedule(List<String> schedule) {
		this.schedule = schedule;
	}
	
}