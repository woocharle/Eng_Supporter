package com.ict.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ict.db.HVO2;
import com.ict.model.Pipespec;

@Controller
public class Pipeheat_Controller {
	@Autowired
	private Pipespec pipespec;

	public void setPipespec(Pipespec pipespec) {
		this.pipespec = pipespec;
	}
	
	@RequestMapping(value="pipeheat_add.do", method=RequestMethod.POST)
	public ModelAndView lineadd_Cmd(HVO2 hvo2, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String cal = request.getParameter("cal");

		List<HVO2> list0 = (List<HVO2>)request.getSession().getAttribute("list");
		HVO2[] b_list = list0.toArray(new HVO2[list0.size()]);
		List<HVO2> list = new ArrayList<HVO2>();
		
		for (int i = 0; i < b_list.length + 1; i++) {
			hvo2 = new HVO2();
	
			if(i == b_list.length) {
				hvo2.setIdx(String.valueOf(i+1));
				hvo2.setPhase("liquid");
				hvo2.setCfactor("fitting");
				hvo2.setDout("6");
				hvo2.setDlist(pipespec.getSize());
				hvo2.setSch("STD");
				hvo2.setSlist(pipespec.getSchedule());
				
			} else {
				hvo2.setIdx(String.valueOf(i + 1));
				System.out.println(hvo2.getIdx());
				hvo2.setLineno(b_list[i].getLineno());
				hvo2.setPhase(b_list[i].getPhase());
				hvo2.setEv(b_list[i].getEv());
				hvo2.setOver(b_list[i].getOver());
				hvo2.setStype(b_list[i].getStype());
				hvo2.setTemp_air(b_list[i].getTemp_air());
				hvo2.setTemp_liq(b_list[i].getTemp_liq());
				hvo2.setTemp_vapor(b_list[i].getTemp_vapor());
				hvo2.setFlow(b_list[i].getFlow());
				hvo2.setEm(b_list[i].getEm());
				hvo2.setWind_vel(b_list[i].getWind_vel());
				
				hvo2.setDen_liq(b_list[i].getDen_liq());
				hvo2.setDen_vapor(b_list[i].getDen_vapor());
				hvo2.setVapor_fr(b_list[i].getVapor_fr());
				hvo2.setSeason(b_list[i].getSeason());
				
				hvo2.setVis_liq(b_list[i].getVis_liq());
				hvo2.setVis_vapor(b_list[i].getVis_vapor());
				hvo2.setFlow_liq(b_list[i].getFlow_liq());
				hvo2.setCondition(b_list[i].getCondition());
				hvo2.setDepth(b_list[i].getDepth());
				
				hvo2.setHeat_liq(b_list[i].getHeat_liq());
				hvo2.setHeat_vapor(b_list[i].getHeat_vapor());
				hvo2.setFlow_vapor(b_list[i].getFlow());
				hvo2.setConvection(b_list[i].getConvection());
				hvo2.setSoil(b_list[i].getSoil());
				
				hvo2.setThcon_liq(b_list[i].getThcon_liq());
				hvo2.setThcon_vapor(b_list[i].getThcon_vapor());
				hvo2.setHeat_dia(b_list[i].getHeat_dia());
				
				hvo2.setCfactor(b_list[i].getCfactor());
				hvo2.setRe(b_list[i].getRe());
				hvo2.setWall(b_list[i].getWall());
				hvo2.setDin(b_list[i].getDin());
				hvo2.setDlist(pipespec.getSize());
				hvo2.setDia(b_list[i].getDia());
				hvo2.setDout(b_list[i].getDout());
				hvo2.setInsul_thick(b_list[i].getInsul_thick());
				
				hvo2.setSch(b_list[i].getSch());
				hvo2.setSlist(pipespec.getSchedule());
				hvo2.setPipelen(b_list[i].getPipelen());
				hvo2.setInsul_con(b_list[i].getInsul_con());
				
				//fitting
				hvo2.setElbow90_1(b_list[i].getElbow90_1());
				hvo2.setElbow90_2(b_list[i].getElbow90_2());
				hvo2.setElbow90_3(b_list[i].getElbow90_3());
				hvo2.setElbow90_4(b_list[i].getElbow90_4());
				hvo2.setElbow90_5(b_list[i].getElbow90_5());
				hvo2.setElbow90_6(b_list[i].getElbow90_6());
				hvo2.setElbow90_7(b_list[i].getElbow90_7());
				hvo2.setElbow90_8(b_list[i].getElbow90_8());
				hvo2.setElbow90_9(b_list[i].getElbow90_9());
				
				hvo2.setElbow45_1(b_list[i].getElbow45_1());
				hvo2.setElbow45_2(b_list[i].getElbow45_2());
				hvo2.setElbow45_3(b_list[i].getElbow45_3());
				hvo2.setElbow45_4(b_list[i].getElbow45_4());
				
				hvo2.setBend_1(b_list[i].getBend_1());
				hvo2.setBend_2(b_list[i].getBend_2());
				hvo2.setBend_3(b_list[i].getBend_3());
				
				hvo2.setTee_1(b_list[i].getTee_1());
				hvo2.setTee_2(b_list[i].getTee_2());
				hvo2.setTee_3(b_list[i].getTee_3());
				hvo2.setTee_4(b_list[i].getTee_4());
				hvo2.setTee_5(b_list[i].getTee_5());
				hvo2.setTee_6(b_list[i].getTee_6());
				hvo2.setTee_7(b_list[i].getTee_7());
				
				hvo2.setGtvalve(b_list[i].getGtvalve());
				hvo2.setBvalve(b_list[i].getBvalve());
				hvo2.setGbvalve(b_list[i].getGbvalve());
				hvo2.setDvalve(b_list[i].getDvalve());
				hvo2.setAvalve_1(b_list[i].getAvalve_1());
				hvo2.setAvalve_2(b_list[i].getAvalve_2());
				hvo2.setCvalve_1(b_list[i].getCvalve_1());
				hvo2.setCvalve_2(b_list[i].getCvalve_2());
				hvo2.setPvalve_1(b_list[i].getPvalve_1());
				hvo2.setPvalve_2(b_list[i].getPvalve_2());
				hvo2.setPvalve_3(b_list[i].getPvalve_3());
				
				hvo2.setRedd(b_list[i].getRedd());
				hvo2.setRedth(b_list[i].getRedth());
				
				hvo2.setExpd(b_list[i].getExpd());
				hvo2.setExpth(b_list[i].getExpth());
				
				hvo2.setEql_len(b_list[i].getEql_len());
				hvo2.setSoil_temp(b_list[i].getSoil_temp());
				hvo2.setIn_coeff(b_list[i].getIn_coeff());
				hvo2.setG_temp(b_list[i].getG_temp());
				hvo2.setOut_coeff(b_list[i].getOut_coeff());
				hvo2.setOut_temp(b_list[i].getOut_temp());
				hvo2.setIn_coeff_1(b_list[i].getIn_coeff_1());
				hvo2.setSur_temp(b_list[i].getSur_temp());
				hvo2.setIn_coeff_2(b_list[i].getIn_coeff_2());
				hvo2.setDiff_temp(b_list[i].getDiff_temp());
				
			}
	
			list.add(hvo2);
			
		}
	
		request.setAttribute("cal", cal);
		request.getSession().setAttribute("list", list);
		
		mv.setViewName("view_user/4.calculator");
		
		return mv;
	}
	
	@RequestMapping(value="pipeheat_del.do", method=RequestMethod.POST)
	public ModelAndView linedel_Cmd(HVO2 hvo2, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String cal = request.getParameter("cal");
		
		List<HVO2> list = new ArrayList<HVO2>();
		
		for (HVO2 k : list) {
			k.setLineno(request.getParameter("lineno".concat(k.getIdx())));
			k.setPhase(request.getParameter("phase".concat(k.getIdx())));
			k.setEv(request.getParameter("ev".concat(k.getIdx())));
			k.setOver(request.getParameter("over".concat(k.getIdx())));
			k.setStype(request.getParameter("stype".concat(k.getIdx())));
			k.setTemp_air(request.getParameter("temp_air".concat(k.getIdx())));
			k.setTemp_liq(request.getParameter("temp_liq".concat(k.getIdx())));
			k.setTemp_vapor(request.getParameter("temp_vapor".concat(k.getIdx())));
			k.setFlow(request.getParameter("flow".concat(k.getIdx())));
			k.setEm(request.getParameter("em".concat(k.getIdx())));
			k.setWind_vel(request.getParameter("wind_vel".concat(k.getIdx())));
			
			k.setDen_liq(request.getParameter("den_liq".concat(k.getIdx())));
			k.setDen_vapor(request.getParameter("den_vapor".concat(k.getIdx())));
			k.setVapor_fr(request.getParameter("vapor_fr".concat(k.getIdx())));
			k.setSeason(request.getParameter("season".concat(k.getIdx())));
			
			k.setVis_liq(request.getParameter("vis_liq".concat(k.getIdx())));
			k.setVis_vapor(request.getParameter("vis_vapor".concat(k.getIdx())));
			k.setFlow_liq(request.getParameter("flow_liq".concat(k.getIdx())));
			k.setCondition(request.getParameter("condition".concat(k.getIdx())));
			k.setDepth(request.getParameter("depth".concat(k.getIdx())));
			
			k.setHeat_liq(request.getParameter("heat_liq".concat(k.getIdx())));
			k.setHeat_vapor(request.getParameter("heat_vapor".concat(k.getIdx())));
			k.setFlow_vapor(request.getParameter("flow_vapor".concat(k.getIdx())));
			k.setConvection(request.getParameter("convection".concat(k.getIdx())));
			k.setSoil(request.getParameter("soil".concat(k.getIdx())));
			
			k.setThcon_liq(request.getParameter("thcon_liq".concat(k.getIdx())));
			k.setThcon_vapor(request.getParameter("thcon_vapor".concat(k.getIdx())));
			k.setHeat_dia(request.getParameter("heat_dia".concat(k.getIdx())));
			
			k.setCfactor(request.getParameter("cfactor".concat(k.getIdx())));
			k.setRe(request.getParameter("re".concat(k.getIdx())));
			k.setWall(request.getParameter("wall".concat(k.getIdx())));
			k.setDin(request.getParameter("din".concat(k.getIdx())));
			k.setDlist(pipespec.getSize());
			k.setDia(request.getParameter("dia".concat(k.getIdx())));
			k.setDout(request.getParameter("dout".concat(k.getIdx())));
			k.setInsul_thick(request.getParameter("insul_thick".concat(k.getIdx())));
			
			k.setSch(request.getParameter("sch".concat(k.getIdx())));
			k.setSlist(pipespec.getSchedule());
			k.setPipelen(request.getParameter("pipelen".concat(k.getIdx())));
			k.setInsul_con(request.getParameter("insul_con".concat(k.getIdx())));
			
			//fitting
			k.setElbow90_1(request.getParameter("elbow90_1".concat(k.getIdx())));
			k.setElbow90_2(request.getParameter("elbow90_2".concat(k.getIdx())));
			k.setElbow90_3(request.getParameter("elbow90_3".concat(k.getIdx())));
			k.setElbow90_4(request.getParameter("elbow90_4".concat(k.getIdx())));
			k.setElbow90_5(request.getParameter("elbow90_5".concat(k.getIdx())));
			k.setElbow90_6(request.getParameter("elbow90_6".concat(k.getIdx())));
			k.setElbow90_7(request.getParameter("elbow90_7".concat(k.getIdx())));
			k.setElbow90_8(request.getParameter("elbow90_8".concat(k.getIdx())));
			k.setElbow90_9(request.getParameter("elbow90_9".concat(k.getIdx())));
			
			k.setElbow45_1(request.getParameter("elbow45_1".concat(k.getIdx())));
			k.setElbow45_2(request.getParameter("elbow45_2".concat(k.getIdx())));
			k.setElbow45_3(request.getParameter("elbow45_3".concat(k.getIdx())));
			k.setElbow45_4(request.getParameter("elbow45_4".concat(k.getIdx())));
			
			k.setBend_1(request.getParameter("bend_1".concat(k.getIdx())));
			k.setBend_2(request.getParameter("bend_2".concat(k.getIdx())));
			k.setBend_3(request.getParameter("bend_3".concat(k.getIdx())));
			
			k.setTee_1(request.getParameter("tee_1".concat(k.getIdx())));
			k.setTee_2(request.getParameter("tee_2".concat(k.getIdx())));
			k.setTee_3(request.getParameter("tee_3".concat(k.getIdx())));
			k.setTee_4(request.getParameter("tee_4".concat(k.getIdx())));
			k.setTee_5(request.getParameter("tee_5".concat(k.getIdx())));
			k.setTee_6(request.getParameter("tee_6".concat(k.getIdx())));
			k.setTee_7(request.getParameter("tee_7".concat(k.getIdx())));
			
			k.setGtvalve(request.getParameter("gtvalve".concat(k.getIdx())));
			k.setBvalve(request.getParameter("bvalve".concat(k.getIdx())));
			k.setGbvalve(request.getParameter("gbvalve".concat(k.getIdx())));
			k.setDvalve(request.getParameter("dvalve".concat(k.getIdx())));
			k.setAvalve_1(request.getParameter("avalve_1".concat(k.getIdx())));
			k.setAvalve_2(request.getParameter("avalve_2".concat(k.getIdx())));
			k.setCvalve_1(request.getParameter("cvalve_1".concat(k.getIdx())));
			k.setCvalve_2(request.getParameter("cvalve_2".concat(k.getIdx())));
			k.setPvalve_1(request.getParameter("pvalve_1".concat(k.getIdx())));
			k.setPvalve_2(request.getParameter("pvalve_2".concat(k.getIdx())));
			k.setPvalve_3(request.getParameter("pvalve_3".concat(k.getIdx())));
			
			k.setRedd(request.getParameter("redd".concat(k.getIdx())));
			k.setRedth(request.getParameter("redth".concat(k.getIdx())));
			
			k.setExpd(request.getParameter("expd".concat(k.getIdx())));
			k.setExpth(request.getParameter("expth".concat(k.getIdx())));		
			
			k.setEql_len(request.getParameter("eql_len".concat(k.getIdx())));
			k.setSoil_temp(request.getParameter("soil_temp".concat(k.getIdx())));
			k.setIn_coeff(request.getParameter("in_coeff".concat(k.getIdx())));
			k.setG_temp(request.getParameter("g_temp".concat(k.getIdx())));
			k.setOut_coeff(request.getParameter("out_coeff".concat(k.getIdx())));
			k.setOut_temp(request.getParameter("out_temp".concat(k.getIdx())));
			k.setIn_coeff_1(request.getParameter("out_coeff_1".concat(k.getIdx())));
			k.setSur_temp(request.getParameter("sur_temp".concat(k.getIdx())));
			k.setIn_coeff_2(request.getParameter("out_coeff_2".concat(k.getIdx())));
			k.setDiff_temp(request.getParameter("diff_temp".concat(k.getIdx())));			
				
		}		

		List<HVO2> list0 = (List<HVO2>)request.getSession().getAttribute("list");
		int idx = Integer.parseInt(request.getParameter("idx"));
		HVO2[] b_list = list0.toArray(new HVO2[list0.size()]);
		int n = 1;
		list.clear();
		
		for (int i = 0; i < b_list.length; i++) {
			hvo2 = new HVO2();
			
			if (i + 1 == idx) {
				continue;
			} else {
				hvo2.setIdx(String.valueOf(n));
				hvo2.setLineno(b_list[i].getLineno());
				System.out.println(hvo2.getIdx());
				hvo2.setPhase(b_list[i].getPhase());
				hvo2.setEv(b_list[i].getEv());
				hvo2.setOver(b_list[i].getOver());
				hvo2.setStype(b_list[i].getStype());
				hvo2.setTemp_air(b_list[i].getTemp_air());
				hvo2.setTemp_liq(b_list[i].getTemp_liq());
				hvo2.setTemp_vapor(b_list[i].getTemp_vapor());
				hvo2.setFlow(b_list[i].getFlow());
				hvo2.setEm(b_list[i].getEm());
				hvo2.setWind_vel(b_list[i].getWind_vel());
				
				hvo2.setDen_liq(b_list[i].getDen_liq());
				hvo2.setDen_vapor(b_list[i].getDen_vapor());
				hvo2.setVapor_fr(b_list[i].getVapor_fr());
				hvo2.setSeason(b_list[i].getSeason());
				
				hvo2.setVis_liq(b_list[i].getVis_liq());
				hvo2.setVis_vapor(b_list[i].getVis_vapor());
				hvo2.setFlow_liq(b_list[i].getFlow_liq());
				hvo2.setCondition(b_list[i].getCondition());
				hvo2.setDepth(b_list[i].getDepth());
				
				hvo2.setHeat_liq(b_list[i].getHeat_liq());
				hvo2.setHeat_vapor(b_list[i].getHeat_vapor());
				hvo2.setFlow_vapor(b_list[i].getFlow());
				hvo2.setConvection(b_list[i].getConvection());
				hvo2.setSoil(b_list[i].getSoil());
				
				hvo2.setThcon_liq(b_list[i].getThcon_liq());
				hvo2.setThcon_vapor(b_list[i].getThcon_vapor());
				hvo2.setHeat_dia(b_list[i].getHeat_dia());
				
				hvo2.setCfactor(b_list[i].getCfactor());
				hvo2.setRe(b_list[i].getRe());
				hvo2.setWall(b_list[i].getWall());
				hvo2.setDin(b_list[i].getDin());
				hvo2.setDlist(pipespec.getSize());
				hvo2.setDia(b_list[i].getDia());
				hvo2.setDout(b_list[i].getDout());
				hvo2.setInsul_thick(b_list[i].getInsul_thick());
				
				hvo2.setSch(b_list[i].getSch());
				hvo2.setSlist(pipespec.getSchedule());
				hvo2.setPipelen(b_list[i].getPipelen());
				hvo2.setInsul_con(b_list[i].getInsul_con());
				
				//fitting
				hvo2.setElbow90_1(b_list[i].getElbow90_1());
				hvo2.setElbow90_2(b_list[i].getElbow90_2());
				hvo2.setElbow90_3(b_list[i].getElbow90_3());
				hvo2.setElbow90_4(b_list[i].getElbow90_4());
				hvo2.setElbow90_5(b_list[i].getElbow90_5());
				hvo2.setElbow90_6(b_list[i].getElbow90_6());
				hvo2.setElbow90_7(b_list[i].getElbow90_7());
				hvo2.setElbow90_8(b_list[i].getElbow90_8());
				hvo2.setElbow90_9(b_list[i].getElbow90_9());
				
				hvo2.setElbow45_1(b_list[i].getElbow45_1());
				hvo2.setElbow45_2(b_list[i].getElbow45_2());
				hvo2.setElbow45_3(b_list[i].getElbow45_3());
				hvo2.setElbow45_4(b_list[i].getElbow45_4());
				
				hvo2.setBend_1(b_list[i].getBend_1());
				hvo2.setBend_2(b_list[i].getBend_2());
				hvo2.setBend_3(b_list[i].getBend_3());
				
				hvo2.setTee_1(b_list[i].getTee_1());
				hvo2.setTee_2(b_list[i].getTee_2());
				hvo2.setTee_3(b_list[i].getTee_3());
				hvo2.setTee_4(b_list[i].getTee_4());
				hvo2.setTee_5(b_list[i].getTee_5());
				hvo2.setTee_6(b_list[i].getTee_6());
				hvo2.setTee_7(b_list[i].getTee_7());
				
				hvo2.setGtvalve(b_list[i].getGtvalve());
				hvo2.setBvalve(b_list[i].getBvalve());
				hvo2.setGbvalve(b_list[i].getGbvalve());
				hvo2.setDvalve(b_list[i].getDvalve());
				hvo2.setAvalve_1(b_list[i].getAvalve_1());
				hvo2.setAvalve_2(b_list[i].getAvalve_2());
				hvo2.setCvalve_1(b_list[i].getCvalve_1());
				hvo2.setCvalve_2(b_list[i].getCvalve_2());
				hvo2.setPvalve_1(b_list[i].getPvalve_1());
				hvo2.setPvalve_2(b_list[i].getPvalve_2());
				hvo2.setPvalve_3(b_list[i].getPvalve_3());
				
				hvo2.setRedd(b_list[i].getRedd());
				hvo2.setRedth(b_list[i].getRedth());
				
				hvo2.setExpd(b_list[i].getExpd());
				hvo2.setExpth(b_list[i].getExpth());
				
				hvo2.setEql_len(b_list[i].getEql_len());
				hvo2.setSoil_temp(b_list[i].getSoil_temp());
				hvo2.setIn_coeff(b_list[i].getIn_coeff());
				hvo2.setG_temp(b_list[i].getG_temp());
				hvo2.setOut_coeff(b_list[i].getOut_coeff());
				hvo2.setOut_temp(b_list[i].getOut_temp());
				hvo2.setIn_coeff_1(b_list[i].getIn_coeff_1());
				hvo2.setSur_temp(b_list[i].getSur_temp());
				hvo2.setIn_coeff_2(b_list[i].getIn_coeff_2());
				hvo2.setDiff_temp(b_list[i].getDiff_temp());
				
				n += 1;
			 
			}
			
			list.add(hvo2);
		}
		
		request.setAttribute("cal", cal);
		request.getSession().setAttribute("list", list);
		
		mv.setViewName("view_user/4.calculator");
		
		return mv;
		
	}
	
	@RequestMapping(value="pipeheat_rev.do", method=RequestMethod.POST)
	public ModelAndView linerev_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String cal = request.getParameter("cal");
		String idx = request.getParameter("idx");
	
		List<HVO2> list = (List<HVO2>)request.getSession().getAttribute("list");
		
		for (HVO2 k : list) {
			if(k.getIdx().equals(idx)) {
				k.setLineno(request.getParameter("lineno".concat(idx)));
				k.setPhase(request.getParameter("phase".concat(idx)));
				k.setEv(request.getParameter("ev".concat(idx)));
				k.setOver(request.getParameter("over".concat(idx)));
				k.setStype(request.getParameter("stype".concat(idx)));
				k.setTemp_air(request.getParameter("temp_air".concat(idx)));
				k.setTemp_liq(request.getParameter("temp_liq".concat(idx)));
				k.setTemp_vapor(request.getParameter("temp_vapor".concat(idx)));
				k.setFlow(request.getParameter("flow".concat(idx)));
				k.setEm(request.getParameter("em".concat(idx)));
				k.setWind_vel(request.getParameter("wind_vel".concat(idx)));
				
				k.setDen_liq(request.getParameter("den_liq".concat(idx)));
				k.setDen_vapor(request.getParameter("den_vapor".concat(idx)));
				k.setVapor_fr(request.getParameter("vapor_fr".concat(idx)));
				k.setSeason(request.getParameter("season".concat(idx)));
				
				k.setVis_liq(request.getParameter("vis_liq".concat(idx)));
				k.setVis_vapor(request.getParameter("vis_vapor".concat(idx)));
				k.setFlow_liq(request.getParameter("flow_liq".concat(idx)));
				k.setCondition(request.getParameter("condition".concat(idx)));
				k.setDepth(request.getParameter("depth".concat(idx)));
				
				k.setHeat_liq(request.getParameter("heat_liq".concat(idx)));
				k.setHeat_vapor(request.getParameter("heat_vapor".concat(idx)));
				k.setFlow_vapor(request.getParameter("flow_vapor".concat(idx)));
				k.setConvection(request.getParameter("convection".concat(idx)));
				k.setSoil(request.getParameter("soil".concat(idx)));
				
				k.setThcon_liq(request.getParameter("thcon_liq".concat(idx)));
				k.setThcon_vapor(request.getParameter("thcon_vapor".concat(idx)));
				k.setHeat_dia(request.getParameter("heat_dia".concat(idx)));
				
				k.setCfactor(request.getParameter("cfactor".concat(idx)));
				k.setRe(request.getParameter("re".concat(idx)));
				k.setWall(request.getParameter("wall".concat(idx)));
				k.setDin(request.getParameter("din".concat(idx)));
				k.setDlist(pipespec.getSize());
				k.setDia(request.getParameter("dia".concat(idx)));
				k.setDout(request.getParameter("dout".concat(idx)));
				k.setInsul_thick(request.getParameter("insul_thick".concat(idx)));
				
				k.setSch(request.getParameter("sch".concat(idx)));
				k.setSlist(pipespec.getSchedule());
				k.setPipelen(request.getParameter("pipelen".concat(idx)));
				k.setInsul_con(request.getParameter("insul_con".concat(idx)));
				
				//fitting
				k.setElbow90_1(request.getParameter("elbow90_1".concat(idx)));
				k.setElbow90_2(request.getParameter("elbow90_2".concat(idx)));
				k.setElbow90_3(request.getParameter("elbow90_3".concat(idx)));
				k.setElbow90_4(request.getParameter("elbow90_4".concat(idx)));
				k.setElbow90_5(request.getParameter("elbow90_5".concat(idx)));
				k.setElbow90_6(request.getParameter("elbow90_6".concat(idx)));
				k.setElbow90_7(request.getParameter("elbow90_7".concat(idx)));
				k.setElbow90_8(request.getParameter("elbow90_8".concat(idx)));
				k.setElbow90_9(request.getParameter("elbow90_9".concat(idx)));
				
				k.setElbow45_1(request.getParameter("elbow45_1".concat(idx)));
				k.setElbow45_2(request.getParameter("elbow45_2".concat(idx)));
				k.setElbow45_3(request.getParameter("elbow45_3".concat(idx)));
				k.setElbow45_4(request.getParameter("elbow45_4".concat(idx)));
				
				k.setBend_1(request.getParameter("bend_1".concat(idx)));
				k.setBend_2(request.getParameter("bend_2".concat(idx)));
				k.setBend_3(request.getParameter("bend_3".concat(idx)));
				
				k.setTee_1(request.getParameter("tee_1".concat(idx)));
				k.setTee_2(request.getParameter("tee_2".concat(idx)));
				k.setTee_3(request.getParameter("tee_3".concat(idx)));
				k.setTee_4(request.getParameter("tee_4".concat(idx)));
				k.setTee_5(request.getParameter("tee_5".concat(idx)));
				k.setTee_6(request.getParameter("tee_6".concat(idx)));
				k.setTee_7(request.getParameter("tee_7".concat(idx)));
				
				k.setGtvalve(request.getParameter("gtvalve".concat(idx)));
				k.setBvalve(request.getParameter("bvalve".concat(idx)));
				k.setGbvalve(request.getParameter("gbvalve".concat(idx)));
				k.setDvalve(request.getParameter("dvalve".concat(idx)));
				k.setAvalve_1(request.getParameter("avalve_1".concat(idx)));
				k.setAvalve_2(request.getParameter("avalve_2".concat(idx)));
				k.setCvalve_1(request.getParameter("cvalve_1".concat(idx)));
				k.setCvalve_2(request.getParameter("cvalve_2".concat(idx)));
				k.setPvalve_1(request.getParameter("pvalve_1".concat(idx)));
				k.setPvalve_2(request.getParameter("pvalve_2".concat(idx)));
				k.setPvalve_3(request.getParameter("pvalve_3".concat(idx)));
				
				k.setRedd(request.getParameter("redd".concat(idx)));
				k.setRedth(request.getParameter("redth".concat(idx)));
				
				k.setExpd(request.getParameter("expd".concat(idx)));
				k.setExpth(request.getParameter("expth".concat(idx)));		
				
				k.setEql_len(request.getParameter("eql_len".concat(idx)));
				k.setSoil_temp(request.getParameter("soil_temp".concat(idx)));
				k.setIn_coeff(request.getParameter("in_coeff".concat(idx)));
				k.setG_temp(request.getParameter("g_temp".concat(idx)));
				k.setOut_coeff(request.getParameter("out_coeff".concat(idx)));
				k.setOut_temp(request.getParameter("out_temp".concat(idx)));
				k.setIn_coeff_1(request.getParameter("out_coeff_1".concat(idx)));
				k.setSur_temp(request.getParameter("sur_temp".concat(idx)));
				k.setIn_coeff_2(request.getParameter("out_coeff_2".concat(idx)));
				k.setDiff_temp(request.getParameter("diff_temp".concat(idx)));			
				
			}
			
		}
		
		request.setAttribute("cal", cal);
		request.getSession().setAttribute("list", list);
		
		mv.setViewName("view_user/4.calculator");
		return mv;
	}
	
}
