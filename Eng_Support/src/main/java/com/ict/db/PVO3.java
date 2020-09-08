package com.ict.db;

import java.util.List;

public class PVO3 {
	//General
	private String idx_d, lineno_d, pin_d, pout_d, temp_d, den_d, vis_d, flow_d, per_d, cfactor_d, dout_d, schd_d, din_d, plen_d, wall_d, elchange_d, eqvlen_d;
	private String elbow90_1_d, elbow90_2_d, elbow90_3_d, elbow90_4_d, elbow90_5_d, elbow90_6_d, elbow90_7_d, elbow90_8_d, elbow90_9_d;
	private String elbow45_1_d, elbow45_2_d, bend_1_d, bend_2_d, bend_3_d;
	private String tee_1_d, tee_2_d, tee_3_d, tee_4_d, tee_5_d, tee_6_d, tee_7_d, tee_8_d;
	private String gtvalve_d, gbvalve_d, bvalve_d, cvalve_1_d, cvalve_2_d, avalve_1_d, avalve_2_d, pvalve_1_d, pvalve_2_d, pvalve_3_d;
	private String dvalve_d, redd_d, redth_d, expd_d, expth_d;
	
	private List<String> size, schedule;
	
	public PVO3() {}

	public PVO3(String idx_d, String lineno_d, String pin_d, String pout_d, String temp_d, String den_d, String vis_d,
			String flow_d, String per_d, String cfactor_d, String dout_d, String schd_d, String din_d, String plen_d,
			String wall_d, String elchange_d, String eqvlen_d, String elbow90_1_d, String elbow90_2_d,
			String elbow90_3_d, String elbow90_4_d, String elbow90_5_d, String elbow90_6_d, String elbow90_7_d,
			String elbow90_8_d, String elbow90_9_d, String elbow45_1_d, String elbow45_2_d, String bend_1_d,
			String bend_2_d, String bend_3_d, String tee_1_d, String tee_2_d, String tee_3_d, String tee_4_d,
			String tee_5_d, String tee_6_d, String tee_7_d, String tee_8_d, String gtvalve_d, String gbvalve_d,
			String bvalve_d, String cvalve_1_d, String cvalve_2_d, String avalve_1_d, String avalve_2_d,
			String pvalve_1_d, String pvalve_2_d, String pvalve_3_d, String dvalve_d, String redd_d, String redth_d,
			String expd_d, String expth_d, List<String> size, List<String> schedule) {
			
			super();
			this.idx_d = idx_d;
			this.lineno_d = lineno_d;
			this.pin_d = pin_d;
			this.pout_d = pout_d;
			this.temp_d = temp_d;
			this.den_d = den_d;
			this.vis_d = vis_d;
			this.flow_d = flow_d;
			this.per_d = per_d;
			this.cfactor_d = cfactor_d;
			this.dout_d = dout_d;
			this.schd_d = schd_d;
			this.din_d = din_d;
			this.plen_d = plen_d;
			this.wall_d = wall_d;
			this.elchange_d = elchange_d;
			this.eqvlen_d = eqvlen_d;
			this.elbow90_1_d = elbow90_1_d;
			this.elbow90_2_d = elbow90_2_d;
			this.elbow90_3_d = elbow90_3_d;
			this.elbow90_4_d = elbow90_4_d;
			this.elbow90_5_d = elbow90_5_d;
			this.elbow90_6_d = elbow90_6_d;
			this.elbow90_7_d = elbow90_7_d;
			this.elbow90_8_d = elbow90_8_d;
			this.elbow90_9_d = elbow90_9_d;
			this.elbow45_1_d = elbow45_1_d;
			this.elbow45_2_d = elbow45_2_d;
			this.bend_1_d = bend_1_d;
			this.bend_2_d = bend_2_d;
			this.bend_3_d = bend_3_d;
			this.tee_1_d = tee_1_d;
			this.tee_2_d = tee_2_d;
			this.tee_3_d = tee_3_d;
			this.tee_4_d = tee_4_d;
			this.tee_5_d = tee_5_d;
			this.tee_6_d = tee_6_d;
			this.tee_7_d = tee_7_d;
			this.tee_8_d = tee_8_d;
			this.gtvalve_d = gtvalve_d;
			this.gbvalve_d = gbvalve_d;
			this.bvalve_d = bvalve_d;
			this.cvalve_1_d = cvalve_1_d;
			this.cvalve_2_d = cvalve_2_d;
			this.avalve_1_d = avalve_1_d;
			this.avalve_2_d = avalve_2_d;
			this.pvalve_1_d = pvalve_1_d;
			this.pvalve_2_d = pvalve_2_d;
			this.pvalve_3_d = pvalve_3_d;
			this.dvalve_d = dvalve_d;
			this.redd_d = redd_d;
			this.redth_d = redth_d;
			this.expd_d = expd_d;
			this.expth_d = expth_d;
			this.size = size;
			this.schedule = schedule;
			
			
	}

	public String getIdx_d() {
		return idx_d;
	}

	public void setIdx_d(String idx_d) {
		this.idx_d = idx_d;
	}

	public String getLineno_d() {
		return lineno_d;
	}

	public void setLineno_d(String lineno_d) {
		this.lineno_d = lineno_d;
	}

	public String getPin_d() {
		return pin_d;
	}

	public void setPin_d(String pin_d) {
		this.pin_d = pin_d;
	}

	public String getPout_d() {
		return pout_d;
	}

	public void setPout_d(String pout_d) {
		this.pout_d = pout_d;
	}

	public String getTemp_d() {
		return temp_d;
	}

	public void setTemp_d(String temp_d) {
		this.temp_d = temp_d;
	}

	public String getDen_d() {
		return den_d;
	}

	public void setDen_d(String den_d) {
		this.den_d = den_d;
	}

	public String getVis_d() {
		return vis_d;
	}

	public void setVis_d(String vis_d) {
		this.vis_d = vis_d;
	}

	public String getFlow_d() {
		return flow_d;
	}

	public void setFlow_d(String flow_d) {
		this.flow_d = flow_d;
	}

	public String getPer_d() {
		return per_d;
	}

	public void setPer_d(String per_d) {
		this.per_d = per_d;
	}

	public String getCfactor_d() {
		return cfactor_d;
	}

	public void setCfactor_d(String cfactor_d) {
		this.cfactor_d = cfactor_d;
	}

	public String getDout_d() {
		return dout_d;
	}

	public void setDout_d(String dout_d) {
		this.dout_d = dout_d;
	}

	public String getSchd_d() {
		return schd_d;
	}

	public void setSchd_d(String schd_d) {
		this.schd_d = schd_d;
	}

	public String getDin_d() {
		return din_d;
	}

	public void setDin_d(String din_d) {
		this.din_d = din_d;
	}

	public String getPlen_d() {
		return plen_d;
	}

	public void setPlen_d(String plen_d) {
		this.plen_d = plen_d;
	}

	public String getWall_d() {
		return wall_d;
	}

	public void setWall_d(String wall_d) {
		this.wall_d = wall_d;
	}

	public String getElchange_d() {
		return elchange_d;
	}

	public void setElchange_d(String elchange_d) {
		this.elchange_d = elchange_d;
	}

	public String getEqvlen_d() {
		return eqvlen_d;
	}

	public void setEqvlen_d(String eqvlen_d) {
		this.eqvlen_d = eqvlen_d;
	}

	public String getElbow90_1_d() {
		return elbow90_1_d;
	}

	public void setElbow90_1_d(String elbow90_1_d) {
		this.elbow90_1_d = elbow90_1_d;
	}

	public String getElbow90_2_d() {
		return elbow90_2_d;
	}

	public void setElbow90_2_d(String elbow90_2_d) {
		this.elbow90_2_d = elbow90_2_d;
	}

	public String getElbow90_3_d() {
		return elbow90_3_d;
	}

	public void setElbow90_3_d(String elbow90_3_d) {
		this.elbow90_3_d = elbow90_3_d;
	}

	public String getElbow90_4_d() {
		return elbow90_4_d;
	}

	public void setElbow90_4_d(String elbow90_4_d) {
		this.elbow90_4_d = elbow90_4_d;
	}

	public String getElbow90_5_d() {
		return elbow90_5_d;
	}

	public void setElbow90_5_d(String elbow90_5_d) {
		this.elbow90_5_d = elbow90_5_d;
	}

	public String getElbow90_6_d() {
		return elbow90_6_d;
	}

	public void setElbow90_6_d(String elbow90_6_d) {
		this.elbow90_6_d = elbow90_6_d;
	}

	public String getElbow90_7_d() {
		return elbow90_7_d;
	}

	public void setElbow90_7_d(String elbow90_7_d) {
		this.elbow90_7_d = elbow90_7_d;
	}

	public String getElbow90_8_d() {
		return elbow90_8_d;
	}

	public void setElbow90_8_d(String elbow90_8_d) {
		this.elbow90_8_d = elbow90_8_d;
	}

	public String getElbow90_9_d() {
		return elbow90_9_d;
	}

	public void setElbow90_9_d(String elbow90_9_d) {
		this.elbow90_9_d = elbow90_9_d;
	}

	public String getElbow45_1_d() {
		return elbow45_1_d;
	}

	public void setElbow45_1_d(String elbow45_1_d) {
		this.elbow45_1_d = elbow45_1_d;
	}

	public String getElbow45_2_d() {
		return elbow45_2_d;
	}

	public void setElbow45_2_d(String elbow45_2_d) {
		this.elbow45_2_d = elbow45_2_d;
	}

	public String getBend_1_d() {
		return bend_1_d;
	}

	public void setBend_1_d(String bend_1_d) {
		this.bend_1_d = bend_1_d;
	}

	public String getBend_2_d() {
		return bend_2_d;
	}

	public void setBend_2_d(String bend_2_d) {
		this.bend_2_d = bend_2_d;
	}

	public String getBend_3_d() {
		return bend_3_d;
	}

	public void setBend_3_d(String bend_3_d) {
		this.bend_3_d = bend_3_d;
	}

	public String getTee_1_d() {
		return tee_1_d;
	}

	public void setTee_1_d(String tee_1_d) {
		this.tee_1_d = tee_1_d;
	}

	public String getTee_2_d() {
		return tee_2_d;
	}

	public void setTee_2_d(String tee_2_d) {
		this.tee_2_d = tee_2_d;
	}

	public String getTee_3_d() {
		return tee_3_d;
	}

	public void setTee_3_d(String tee_3_d) {
		this.tee_3_d = tee_3_d;
	}

	public String getTee_4_d() {
		return tee_4_d;
	}

	public void setTee_4_d(String tee_4_d) {
		this.tee_4_d = tee_4_d;
	}

	public String getTee_5_d() {
		return tee_5_d;
	}

	public void setTee_5_d(String tee_5_d) {
		this.tee_5_d = tee_5_d;
	}

	public String getTee_6_d() {
		return tee_6_d;
	}

	public void setTee_6_d(String tee_6_d) {
		this.tee_6_d = tee_6_d;
	}

	public String getTee_7_d() {
		return tee_7_d;
	}

	public void setTee_7_d(String tee_7_d) {
		this.tee_7_d = tee_7_d;
	}

	public String getTee_8_d() {
		return tee_8_d;
	}

	public void setTee_8_d(String tee_8_d) {
		this.tee_8_d = tee_8_d;
	}

	public String getGtvalve_d() {
		return gtvalve_d;
	}

	public void setGtvalve_d(String gtvalve_d) {
		this.gtvalve_d = gtvalve_d;
	}

	public String getGbvalve_d() {
		return gbvalve_d;
	}

	public void setGbvalve_d(String gbvalve_d) {
		this.gbvalve_d = gbvalve_d;
	}

	public String getBvalve_d() {
		return bvalve_d;
	}

	public void setBvalve_d(String bvalve_d) {
		this.bvalve_d = bvalve_d;
	}

	public String getCvalve_1_d() {
		return cvalve_1_d;
	}

	public void setCvalve_1_d(String cvalve_1_d) {
		this.cvalve_1_d = cvalve_1_d;
	}

	public String getCvalve_2_d() {
		return cvalve_2_d;
	}

	public void setCvalve_2_d(String cvalve_2_d) {
		this.cvalve_2_d = cvalve_2_d;
	}

	public String getAvalve_1_d() {
		return avalve_1_d;
	}

	public void setAvalve_1_d(String avalve_1_d) {
		this.avalve_1_d = avalve_1_d;
	}

	public String getAvalve_2_d() {
		return avalve_2_d;
	}

	public void setAvalve_2_d(String avalve_2_d) {
		this.avalve_2_d = avalve_2_d;
	}

	public String getPvalve_1_d() {
		return pvalve_1_d;
	}

	public void setPvalve_1_d(String pvalve_1_d) {
		this.pvalve_1_d = pvalve_1_d;
	}

	public String getPvalve_2_d() {
		return pvalve_2_d;
	}

	public void setPvalve_2_d(String pvalve_2_d) {
		this.pvalve_2_d = pvalve_2_d;
	}

	public String getPvalve_3_d() {
		return pvalve_3_d;
	}

	public void setPvalve_3_d(String pvalve_3_d) {
		this.pvalve_3_d = pvalve_3_d;
	}

	public String getDvalve_d() {
		return dvalve_d;
	}

	public void setDvalve_d(String dvalve_d) {
		this.dvalve_d = dvalve_d;
	}

	public String getRedd_d() {
		return redd_d;
	}

	public void setRedd_d(String redd_d) {
		this.redd_d = redd_d;
	}

	public String getRedth_d() {
		return redth_d;
	}

	public void setRedth_d(String redth_d) {
		this.redth_d = redth_d;
	}

	public String getExpd_d() {
		return expd_d;
	}

	public void setExpd_d(String expd_d) {
		this.expd_d = expd_d;
	}

	public String getExpth_d() {
		return expth_d;
	}

	public void setExpth_d(String expth_d) {
		this.expth_d = expth_d;
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