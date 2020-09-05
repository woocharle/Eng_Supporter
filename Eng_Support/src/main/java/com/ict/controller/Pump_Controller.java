package com.ict.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ict.db.PVO1;
import com.ict.db.PVO2;
import com.ict.db.PVO3;
import com.ict.model.Pipespec;

@Controller
public class Pump_Controller {
	
	@RequestMapping(value="plineadd1.do", method=RequestMethod.POST)
	public ModelAndView pumpadd1_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		PVO1 pvo1 = new PVO1();

		List<PVO2> pslist = (List<PVO2>)request.getSession().getAttribute("pslist");
		
		//input
		//suction
		pvo1.setItem1(request.getParameter("item1"));
		pvo1.setPtype(request.getParameter("ptype"));
		pvo1.setOp1(request.getParameter("op1"));
		pvo1.setMinh(request.getParameter("minh"));
		pvo1.setDp1(request.getParameter("dp1"));
		pvo1.setMaxh(request.getParameter("maxh"));		
		pvo1.setComp(request.getParameter("comp"));
		pvo1.setStrainer(request.getParameter("strainer"));
		pvo1.setCdtn(request.getParameter("cdtn"));
		
		//discharge
		pvo1.setItem2(request.getParameter("item2"));
		pvo1.setItem3(request.getParameter("item3"));
		pvo1.setCitem(request.getParameter("citem"));				
		
		
		//suction line
		PVO2[] b_pslist = pslist.toArray(new PVO2[pslist.size()]);
		pslist.clear();
		
		for (int i = 0; i < b_pslist.length + 1; i++) {
			 PVO2 pvo2 = new PVO2();
			 Pipespec pipespec = new Pipespec();
			
			 if (i == b_pslist.length) {
				pvo2.setIdx(String.valueOf(i+1));
				pvo2.setSize(pipespec.getSize());
				pvo2.setSchedule(pipespec.getSch());
				 
			 }else {
				pvo2.setIdx(String.valueOf(i+1));
				pvo2.setLineno(request.getParameter("lineno".concat(String.valueOf(i+1))));
				pvo2.setPin(request.getParameter("pin".concat(String.valueOf(i+1))));
				pvo2.setTemp(request.getParameter("temp".concat(String.valueOf(i+1))));
				pvo2.setDen(request.getParameter("den".concat(String.valueOf(i+1))));
				pvo2.setVis(request.getParameter("vis".concat(String.valueOf(i+1))));
				pvo2.setFlow(request.getParameter("flow".concat(String.valueOf(i+1))));
				pvo2.setPer(request.getParameter("per".concat(String.valueOf(i+1))));
				pvo2.setCfactor(request.getParameter("cfactor".concat(String.valueOf(i+1))));
				pvo2.setDout(request.getParameter("dout".concat(String.valueOf(i+1))));
				pvo2.setSize(pipespec.getSize());
				pvo2.setSchd(request.getParameter("schd".concat(String.valueOf(i+1))));
				pvo2.setSchedule(pipespec.getSch());
				pvo2.setDin(request.getParameter("din".concat(String.valueOf(i+1))));
				pvo2.setPlen(request.getParameter("plen".concat(String.valueOf(i+1))));
				pvo2.setWall(request.getParameter("wall".concat(String.valueOf(i+1))));
				pvo2.setElchange(request.getParameter("elchange".concat(String.valueOf(i+1))));
				
				
				//fitting
				pvo2.setElbow90_1(request.getParameter("elbow90_1".concat(String.valueOf(i+1))));
				pvo2.setElbow90_2(request.getParameter("elbow90_2".concat(String.valueOf(i+1))));
				pvo2.setElbow90_3(request.getParameter("elbow90_3".concat(String.valueOf(i+1))));
				pvo2.setElbow90_4(request.getParameter("elbow90_4".concat(String.valueOf(i+1))));
				pvo2.setElbow90_5(request.getParameter("elbow90_5".concat(String.valueOf(i+1))));
				pvo2.setElbow90_6(request.getParameter("elbow90_6".concat(String.valueOf(i+1))));
				pvo2.setElbow90_7(request.getParameter("elbow90_7".concat(String.valueOf(i+1))));
				pvo2.setElbow90_8(request.getParameter("elbow90_8".concat(String.valueOf(i+1))));
				pvo2.setElbow90_9(request.getParameter("elbow90_9".concat(String.valueOf(i+1))));
				
				pvo2.setElbow45_1(request.getParameter("elbow45_1".concat(String.valueOf(i+1))));
				pvo2.setElbow45_2(request.getParameter("elbow45_2".concat(String.valueOf(i+1))));
				
				pvo2.setBend_1(request.getParameter("bend_1".concat(String.valueOf(i+1))));
				pvo2.setBend_2(request.getParameter("bend_2".concat(String.valueOf(i+1))));
				pvo2.setBend_3(request.getParameter("bend_3".concat(String.valueOf(i+1))));
				
				pvo2.setTee_1(request.getParameter("tee_1".concat(String.valueOf(i+1))));
				pvo2.setTee_2(request.getParameter("tee_2".concat(String.valueOf(i+1))));
				pvo2.setTee_3(request.getParameter("tee_3".concat(String.valueOf(i+1))));
				pvo2.setTee_4(request.getParameter("tee_4".concat(String.valueOf(i+1))));
				pvo2.setTee_5(request.getParameter("tee_5".concat(String.valueOf(i+1))));
				pvo2.setTee_6(request.getParameter("tee_6".concat(String.valueOf(i+1))));
				pvo2.setTee_7(request.getParameter("tee_7".concat(String.valueOf(i+1))));
				pvo2.setTee_8(request.getParameter("tee_8".concat(String.valueOf(i+1))));
				
				pvo2.setGtvalve(request.getParameter("gtvalve".concat(String.valueOf(i+1))));
				pvo2.setBvalve(request.getParameter("bvalve".concat(String.valueOf(i+1))));
				pvo2.setGbvalve(request.getParameter("gbvalve".concat(String.valueOf(i+1))));
				pvo2.setDvalve(request.getParameter("dvalve".concat(String.valueOf(i+1))));
				pvo2.setAvalve_1(request.getParameter("avalve_1".concat(String.valueOf(i+1))));
				pvo2.setAvalve_2(request.getParameter("avalve_2".concat(String.valueOf(i+1))));
				pvo2.setCvalve_1(request.getParameter("cvalve_1".concat(String.valueOf(i+1))));
				pvo2.setCvalve_2(request.getParameter("cvalve_2".concat(String.valueOf(i+1))));
				pvo2.setPvalve_1(request.getParameter("pvalve_1".concat(String.valueOf(i+1))));
				pvo2.setPvalve_2(request.getParameter("pvalve_2".concat(String.valueOf(i+1))));
				pvo2.setPvalve_3(request.getParameter("pvalve_3".concat(String.valueOf(i+1))));
				
				pvo2.setRedd(request.getParameter("redd".concat(String.valueOf(i+1))));
				pvo2.setRedth(request.getParameter("redth".concat(String.valueOf(i+1))));
				
				pvo2.setExpd(request.getParameter("expd".concat(String.valueOf(i+1))));
				pvo2.setExpth(request.getParameter("expth".concat(String.valueOf(i+1))));	
			
				//output
				pvo2.setPout(request.getParameter("pout".concat(String.valueOf(i+1))));
				pvo2.setEqvlen(request.getParameter("eqvlen".concat(String.valueOf(i+1))));
			 }
			 
			 pslist.add(pvo2);
		}
		
		request.getSession().setAttribute("pvo1", pvo1);
		request.getSession().setAttribute("pslist", pslist);
		
		mv.setViewName("view_user/4.calculator");
		
		return mv;
	}
	
	@RequestMapping(value="plinedel1.do")
	public ModelAndView plinedel1_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		PVO1 pvo1 = new PVO1();

		List<PVO2> pslist = (List<PVO2>)request.getSession().getAttribute("pslist");
		List<PVO3> pdlist = (List<PVO3>)request.getSession().getAttribute("pdlist");
		
		
		//input
		//suction
		pvo1.setItem1(request.getParameter("item1"));
		pvo1.setPtype(request.getParameter("ptype"));
		pvo1.setOp1(request.getParameter("op1"));
		pvo1.setMinh(request.getParameter("minh"));
		pvo1.setDp1(request.getParameter("dp1"));
		pvo1.setMaxh(request.getParameter("maxh"));		
		pvo1.setComp(request.getParameter("comp"));
		pvo1.setStrainer(request.getParameter("strainer"));
		pvo1.setCdtn(request.getParameter("cdtn"));
		
		//discharge
		pvo1.setItem2(request.getParameter("item2"));
		pvo1.setItem3(request.getParameter("item3"));
		pvo1.setCitem(request.getParameter("citem"));		
		

		int idx = Integer.parseInt(request.getParameter("idx"));

		PVO2[] b_pslist = pslist.toArray(new PVO2[pslist.size()]);
		int n = 1;
		pslist.clear();
		
		for (int i = 0; i < b_pslist.length; i++) {
			PVO2 pvo2 = new PVO2();
			Pipespec pipespec = new Pipespec();
			if (i + 1 == idx) {
				continue;
			} else {
				pvo2.setIdx(String.valueOf(n));
				pvo2.setLineno(b_pslist[i].getLineno());
				pvo2.setPin(b_pslist[i].getPin());
				pvo2.setTemp(b_pslist[i].getTemp());
				pvo2.setDen(b_pslist[i].getDen());
				pvo2.setVis(b_pslist[i].getVis());
				pvo2.setFlow(b_pslist[i].getFlow());
				pvo2.setPer(b_pslist[i].getPer());
				pvo2.setCfactor(b_pslist[i].getCfactor());
				pvo2.setDout(b_pslist[i].getDout());
				pvo2.setSize(pipespec.getSize());
				pvo2.setSchd(b_pslist[i].getSchd());
				pvo2.setSchedule(pipespec.getSch());
				pvo2.setDin(b_pslist[i].getDin());
				pvo2.setPlen(b_pslist[i].getPlen());
				pvo2.setWall(b_pslist[i].getWall());
				pvo2.setElchange(b_pslist[i].getElchange());
				
				
				//fitting
				pvo2.setElbow90_1(b_pslist[i].getElbow90_1());
				pvo2.setElbow90_2(b_pslist[i].getElbow90_2());
				pvo2.setElbow90_3(b_pslist[i].getElbow90_3());
				pvo2.setElbow90_4(b_pslist[i].getElbow90_4());
				pvo2.setElbow90_5(b_pslist[i].getElbow90_5());
				pvo2.setElbow90_6(b_pslist[i].getElbow90_6());
				pvo2.setElbow90_7(b_pslist[i].getElbow90_7());
				pvo2.setElbow90_8(b_pslist[i].getElbow90_8());
				pvo2.setElbow90_9(b_pslist[i].getElbow90_9());
				
				pvo2.setElbow45_1(b_pslist[i].getElbow45_1());
				pvo2.setElbow45_2(b_pslist[i].getElbow45_2());
				
				pvo2.setBend_1(b_pslist[i].getBend_1());
				pvo2.setBend_2(b_pslist[i].getBend_2());
				pvo2.setBend_3(b_pslist[i].getBend_3());
				
				pvo2.setTee_1(b_pslist[i].getTee_1());
				pvo2.setTee_2(b_pslist[i].getTee_2());
				pvo2.setTee_3(b_pslist[i].getTee_3());
				pvo2.setTee_4(b_pslist[i].getTee_4());
				pvo2.setTee_5(b_pslist[i].getTee_5());
				pvo2.setTee_6(b_pslist[i].getTee_6());
				pvo2.setTee_7(b_pslist[i].getTee_7());
				pvo2.setTee_8(b_pslist[i].getTee_8());
				
				pvo2.setGtvalve(b_pslist[i].getGtvalve());
				pvo2.setBvalve(b_pslist[i].getBvalve());
				pvo2.setGbvalve(b_pslist[i].getGbvalve());
				pvo2.setDvalve(b_pslist[i].getDvalve());
				pvo2.setAvalve_1(b_pslist[i].getAvalve_1());
				pvo2.setAvalve_2(b_pslist[i].getAvalve_2());
				pvo2.setCvalve_1(b_pslist[i].getCvalve_1());
				pvo2.setCvalve_2(b_pslist[i].getCvalve_2());
				pvo2.setPvalve_1(b_pslist[i].getPvalve_1());
				pvo2.setPvalve_2(b_pslist[i].getPvalve_2());
				pvo2.setPvalve_3(b_pslist[i].getPvalve_3());
				
				pvo2.setRedd(b_pslist[i].getRedd());
				pvo2.setRedth(b_pslist[i].getRedth());
				
				pvo2.setExpd(b_pslist[i].getExpd());
				pvo2.setExpth(b_pslist[i].getExpth());	
			
				//output
				pvo2.setPout(b_pslist[i].getPout());
				pvo2.setEqvlen(b_pslist[i].getEqvlen());		
				
				n += 1;
			}
			
			pslist.add(pvo2);
			
		}
			
		for (PVO3 k : pdlist) {
			Pipespec pipespec = new Pipespec();
			
			k.setLineno_2(request.getParameter("lineno_2".concat(k.getIdx_2())));
			k.setPout_2(request.getParameter("pout_2".concat(k.getIdx_2())));
			
			k.setTemp_2(request.getParameter("temp_2".concat(k.getIdx_2())));
			k.setDen_2(request.getParameter("den_2".concat(k.getIdx_2())));
			k.setVis_2(request.getParameter("vis_2".concat(k.getIdx_2())));
			k.setFlow_2(request.getParameter("flow_2".concat(k.getIdx_2())));
			k.setPer_2(request.getParameter("per_2".concat(k.getIdx_2())));
			k.setCfactor_2(request.getParameter("cfactor_2".concat(k.getIdx_2())));
			k.setDout_2(request.getParameter("dout_2".concat(k.getIdx_2())));
			k.setSize(pipespec.getSize());
			k.setSchd_2(request.getParameter("schd_2".concat(k.getIdx_2())));
			k.setSchedule(pipespec.getSch());
			k.setDin_2(request.getParameter("din_2".concat(k.getIdx_2())));
			k.setPlen_2(request.getParameter("plen_2".concat(k.getIdx_2())));
			k.setWall_2(request.getParameter("wall_2".concat(k.getIdx_2())));
			k.setElchange_2(request.getParameter("elchange_2".concat(k.getIdx_2())));
			
			
			//fitting
			k.setElbow90_1_2(request.getParameter("elbow90_1_2".concat(k.getIdx_2())));
			k.setElbow90_2_2(request.getParameter("elbow90_2_2".concat(k.getIdx_2())));
			k.setElbow90_3_2(request.getParameter("elbow90_3_2".concat(k.getIdx_2())));
			k.setElbow90_4_2(request.getParameter("elbow90_4_2".concat(k.getIdx_2())));
			k.setElbow90_5_2(request.getParameter("elbow90_5_2".concat(k.getIdx_2())));
			k.setElbow90_6_2(request.getParameter("elbow90_6_2".concat(k.getIdx_2())));
			k.setElbow90_7_2(request.getParameter("elbow90_7_2".concat(k.getIdx_2())));
			k.setElbow90_8_2(request.getParameter("elbow90_8_2".concat(k.getIdx_2())));
			k.setElbow90_9_2(request.getParameter("elbow90_9_2".concat(k.getIdx_2())));
			
			k.setElbow45_1_2(request.getParameter("elbow45_1_2".concat(k.getIdx_2())));
			k.setElbow45_2_2(request.getParameter("elbow45_2_2".concat(k.getIdx_2())));
			
			k.setBend_1_2(request.getParameter("bend_1_2".concat(k.getIdx_2())));
			k.setBend_2_2(request.getParameter("bend_2_2".concat(k.getIdx_2())));
			k.setBend_3_2(request.getParameter("bend_3_2".concat(k.getIdx_2())));
			
			k.setTee_1_2(request.getParameter("tee_1_2".concat(k.getIdx_2())));
			k.setTee_2_2(request.getParameter("tee_2_2".concat(k.getIdx_2())));
			k.setTee_3_2(request.getParameter("tee_3_2".concat(k.getIdx_2())));
			k.setTee_4_2(request.getParameter("tee_4_2".concat(k.getIdx_2())));
			k.setTee_5_2(request.getParameter("tee_5_2".concat(k.getIdx_2())));
			k.setTee_6_2(request.getParameter("tee_6_2".concat(k.getIdx_2())));
			k.setTee_7_2(request.getParameter("tee_7_2".concat(k.getIdx_2())));
			k.setTee_8_2(request.getParameter("tee_8_2".concat(k.getIdx_2())));
			
			k.setGtvalve_2(request.getParameter("gtvalve_2".concat(k.getIdx_2())));
			k.setBvalve_2(request.getParameter("bvalve_2".concat(k.getIdx_2())));
			k.setGbvalve_2(request.getParameter("gbvalve_2".concat(k.getIdx_2())));
			k.setDvalve_2(request.getParameter("dvalve_2".concat(k.getIdx_2())));
			k.setAvalve_1_2(request.getParameter("avalve_1_2".concat(k.getIdx_2())));
			k.setAvalve_2_2(request.getParameter("avalve_2_2".concat(k.getIdx_2())));
			k.setCvalve_1_2(request.getParameter("cvalve_1_2".concat(k.getIdx_2())));
			k.setCvalve_2_2(request.getParameter("cvalve_2_2".concat(k.getIdx_2())));
			k.setPvalve_1_2(request.getParameter("pvalve_1_2".concat(k.getIdx_2())));
			k.setPvalve_2_2(request.getParameter("pvalve_2_2".concat(k.getIdx_2())));
			k.setPvalve_3_2(request.getParameter("pvalve_3_2".concat(k.getIdx_2())));
			
			k.setRedd_2(request.getParameter("redd_2".concat(k.getIdx_2())));
			k.setRedth_2(request.getParameter("redth_2".concat(k.getIdx_2())));
			
			k.setExpd_2(request.getParameter("expd_2".concat(k.getIdx_2())));
			k.setExpth_2(request.getParameter("expth_2".concat(k.getIdx_2())));		
			
			
			//output
			k.setPin_2(request.getParameter("pin_2".concat(k.getIdx_2())));
			k.setEqvlen_2(request.getParameter("eqvlen_2".concat(k.getIdx_2())));
				
		}
		
		//suction

		pvo1.setPsuc(request.getParameter("psuc"));
		
		pvo1.setNpsh(request.getParameter("npsh"));
		pvo1.setPdis(request.getParameter("pdis"));
		pvo1.setPtype(request.getParameter("ptype"));
		pvo1.setPdiff(request.getParameter("pdiff"));
		pvo1.setHdiff(request.getParameter("hdiff"));
		pvo1.setHp(request.getParameter("hp"));
		
		//Basis1

		pvo1.setPlevel(request.getParameter("plevel"));
		pvo1.setVppress(request.getParameter("vppress"));
		pvo1.setElsuc(request.getParameter("elsuc"));
		
		//Basis2
	
		pvo1.setElmax(request.getParameter("elmax"));
		pvo1.setCvalve(request.getParameter("cvalve"));
		pvo1.setCvdp(request.getParameter("cvdp"));
		
		
		request.getSession().setAttribute("pvo1", pvo1);
		request.getSession().setAttribute("pslist", pslist);
		request.getSession().setAttribute("pdlist", pdlist);
		
		mv.setViewName("view_user/4.calculator");		
		
		return mv;
	}
	

	
	@RequestMapping(value="plineadd2.do", method=RequestMethod.POST)
	public ModelAndView pumpadd2_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		PVO1 pvo1 = new PVO1();
	
		
		List<PVO2> pslist = (List<PVO2>)request.getSession().getAttribute("pslist");
		List<PVO3> pdlist = (List<PVO3>)request.getSession().getAttribute("pdlist");
		
		//input
		//suction
		pvo1.setItem1(request.getParameter("item1"));
		pvo1.setPtype(request.getParameter("ptype"));
		pvo1.setOp1(request.getParameter("op1"));
		pvo1.setMinh(request.getParameter("minh"));
		pvo1.setDp1(request.getParameter("dp1"));
		pvo1.setMaxh(request.getParameter("maxh"));		
		pvo1.setComp(request.getParameter("comp"));
		pvo1.setStrainer(request.getParameter("strainer"));
		pvo1.setCdtn(request.getParameter("cdtn"));
		
		//discharge
		pvo1.setItem2(request.getParameter("item2"));
		pvo1.setItem3(request.getParameter("item3"));
		pvo1.setCitem(request.getParameter("citem"));				
		

		for (PVO2 k : pslist) {
			Pipespec pipespec = new Pipespec();
			
			k.setLineno(request.getParameter("lineno".concat(k.getIdx())));
			k.setPin(request.getParameter("pin".concat(k.getIdx())));
			k.setTemp(request.getParameter("temp".concat(k.getIdx())));
			k.setDen(request.getParameter("den".concat(k.getIdx())));
			k.setVis(request.getParameter("vis".concat(k.getIdx())));
			k.setFlow(request.getParameter("flow".concat(k.getIdx())));
			k.setPer(request.getParameter("per".concat(k.getIdx())));
			k.setCfactor(request.getParameter("cfactor".concat(k.getIdx())));
			k.setDout(request.getParameter("dout".concat(k.getIdx())));
			k.setSize(pipespec.getSize());
			k.setSchd(request.getParameter("schd".concat(k.getIdx())));
			k.setSchedule(pipespec.getSch());
			k.setDin(request.getParameter("din".concat(k.getIdx())));
			k.setPlen(request.getParameter("plen".concat(k.getIdx())));
			k.setWall(request.getParameter("wall".concat(k.getIdx())));
			k.setElchange(request.getParameter("elchange".concat(k.getIdx())));
			
			
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
			k.setTee_8(request.getParameter("tee_8".concat(k.getIdx())));
			
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
		
			//output
			k.setPout(request.getParameter("pout".concat(k.getIdx())));
			k.setEqvlen(request.getParameter("eqvlen".concat(k.getIdx())));
			
		}

	
		//discharge line
		PVO3[] b_pdlist = pdlist.toArray(new PVO3[pdlist.size()]);
		pdlist.clear();
		
		for (int i = 0; i < b_pdlist.length + 1; i++) {
			 PVO3 pvo3 = new PVO3();
			 Pipespec pipespec = new Pipespec();
			
			 if (i == b_pdlist.length) {
				pvo3.setIdx_2(String.valueOf(i+1));
				pvo3.setSize(pipespec.getSize());
				pvo3.setSchedule(pipespec.getSch());
				 
			 }else {
				pvo3.setIdx_2(String.valueOf(i+1));
				pvo3.setLineno_2(request.getParameter("lineno_2".concat(String.valueOf(i+1))));
				pvo3.setPout_2(request.getParameter("pout_2".concat(String.valueOf(i+1))));
				
				pvo3.setTemp_2(request.getParameter("temp_2".concat(String.valueOf(i+1))));
				pvo3.setDen_2(request.getParameter("den_2".concat(String.valueOf(i+1))));
				pvo3.setVis_2(request.getParameter("vis_2".concat(String.valueOf(i+1))));
				pvo3.setFlow_2(request.getParameter("flow_2".concat(String.valueOf(i+1))));
				pvo3.setPer_2(request.getParameter("per_2".concat(String.valueOf(i+1))));
				pvo3.setCfactor_2(request.getParameter("cfactor_2".concat(String.valueOf(i+1))));
				pvo3.setDout_2(request.getParameter("dout_2".concat(String.valueOf(i+1))));
				pvo3.setSize(pipespec.getSize());
				pvo3.setSchd_2(request.getParameter("schd_2".concat(String.valueOf(i+1))));
				pvo3.setSchedule(pipespec.getSch());
				pvo3.setDin_2(request.getParameter("din_2".concat(String.valueOf(i+1))));
				pvo3.setPlen_2(request.getParameter("plen_2".concat(String.valueOf(i+1))));
				pvo3.setWall_2(request.getParameter("wall_2".concat(String.valueOf(i+1))));
				pvo3.setElchange_2(request.getParameter("elchange_2".concat(String.valueOf(i+1))));
				
				
				//fitting
				pvo3.setElbow90_1_2(request.getParameter("elbow90_1_2".concat(String.valueOf(i+1))));
				pvo3.setElbow90_2_2(request.getParameter("elbow90_2_2".concat(String.valueOf(i+1))));
				pvo3.setElbow90_3_2(request.getParameter("elbow90_3_2".concat(String.valueOf(i+1))));
				pvo3.setElbow90_4_2(request.getParameter("elbow90_4_2".concat(String.valueOf(i+1))));
				pvo3.setElbow90_5_2(request.getParameter("elbow90_5_2".concat(String.valueOf(i+1))));
				pvo3.setElbow90_6_2(request.getParameter("elbow90_6_2".concat(String.valueOf(i+1))));
				pvo3.setElbow90_7_2(request.getParameter("elbow90_7_2".concat(String.valueOf(i+1))));
				pvo3.setElbow90_8_2(request.getParameter("elbow90_8_2".concat(String.valueOf(i+1))));
				pvo3.setElbow90_9_2(request.getParameter("elbow90_9_2".concat(String.valueOf(i+1))));
				
				pvo3.setElbow45_1_2(request.getParameter("elbow45_1_2".concat(String.valueOf(i+1))));
				pvo3.setElbow45_2_2(request.getParameter("elbow45_2_2".concat(String.valueOf(i+1))));
				
				pvo3.setBend_1_2(request.getParameter("bend_1_2".concat(String.valueOf(i+1))));
				pvo3.setBend_2_2(request.getParameter("bend_2_2".concat(String.valueOf(i+1))));
				pvo3.setBend_3_2(request.getParameter("bend_3_2".concat(String.valueOf(i+1))));
				
				pvo3.setTee_1_2(request.getParameter("tee_1_2".concat(String.valueOf(i+1))));
				pvo3.setTee_2_2(request.getParameter("tee_2_2".concat(String.valueOf(i+1))));
				pvo3.setTee_3_2(request.getParameter("tee_3_2".concat(String.valueOf(i+1))));
				pvo3.setTee_4_2(request.getParameter("tee_4_2".concat(String.valueOf(i+1))));
				pvo3.setTee_5_2(request.getParameter("tee_5_2".concat(String.valueOf(i+1))));
				pvo3.setTee_6_2(request.getParameter("tee_6_2".concat(String.valueOf(i+1))));
				pvo3.setTee_7_2(request.getParameter("tee_7_2".concat(String.valueOf(i+1))));
				pvo3.setTee_8_2(request.getParameter("tee_8_2".concat(String.valueOf(i+1))));
				
				pvo3.setGtvalve_2(request.getParameter("gtvalve_2".concat(String.valueOf(i+1))));
				pvo3.setBvalve_2(request.getParameter("bvalve_2".concat(String.valueOf(i+1))));
				pvo3.setGbvalve_2(request.getParameter("gbvalve_2".concat(String.valueOf(i+1))));
				pvo3.setDvalve_2(request.getParameter("dvalve_2".concat(String.valueOf(i+1))));
				pvo3.setAvalve_1_2(request.getParameter("avalve_1_2".concat(String.valueOf(i+1))));
				pvo3.setAvalve_2_2(request.getParameter("avalve_2_2".concat(String.valueOf(i+1))));
				pvo3.setCvalve_1_2(request.getParameter("cvalve_1_2".concat(String.valueOf(i+1))));
				pvo3.setCvalve_2_2(request.getParameter("cvalve_2_2".concat(String.valueOf(i+1))));
				pvo3.setPvalve_1_2(request.getParameter("pvalve_1_2".concat(String.valueOf(i+1))));
				pvo3.setPvalve_2_2(request.getParameter("pvalve_2_2".concat(String.valueOf(i+1))));
				pvo3.setPvalve_3_2(request.getParameter("pvalve_3_2".concat(String.valueOf(i+1))));
				
				pvo3.setRedd_2(request.getParameter("redd_2".concat(String.valueOf(i+1))));
				pvo3.setRedth_2(request.getParameter("redth_2".concat(String.valueOf(i+1))));
				
				pvo3.setExpd_2(request.getParameter("expd_2".concat(String.valueOf(i+1))));
				pvo3.setExpth_2(request.getParameter("expth_2".concat(String.valueOf(i+1))));		
				
				
				//output
				pvo3.setPin_2(request.getParameter("pin_2".concat(String.valueOf(i+1))));
				pvo3.setEqvlen_2(request.getParameter("eqvlen_2".concat(String.valueOf(i+1))));
			 }
			 
			 pdlist.add(pvo3);
		}
		
		request.getSession().setAttribute("pvo1", pvo1);
		request.getSession().setAttribute("pslist", pslist);
		request.getSession().setAttribute("pdlist", pdlist);
		
		mv.setViewName("view_user/4.calculator");
		
		return mv;
	}
	

	@RequestMapping(value="plinedel2.do")
	public ModelAndView plinedel2_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		PVO1 pvo1 = new PVO1();
		
		List<PVO2> pslist = (List<PVO2>)request.getSession().getAttribute("pslist");
		List<PVO3> pdlist = (List<PVO3>)request.getSession().getAttribute("pdlist");
		
		
		//input
		//suction
		pvo1.setItem1(request.getParameter("item1"));
		pvo1.setPtype(request.getParameter("ptype"));
		pvo1.setOp1(request.getParameter("op1"));
		pvo1.setMinh(request.getParameter("minh"));
		pvo1.setDp1(request.getParameter("dp1"));
		pvo1.setMaxh(request.getParameter("maxh"));		
		pvo1.setComp(request.getParameter("comp"));
		pvo1.setStrainer(request.getParameter("strainer"));
		pvo1.setCdtn(request.getParameter("cdtn"));
		
		//discharge
		pvo1.setItem2(request.getParameter("item2"));
		pvo1.setItem3(request.getParameter("item3"));
		pvo1.setCitem(request.getParameter("citem"));		
		
		String num = request.getParameter("num");
		int idx_2 = Integer.parseInt(request.getParameter("idx_2_".concat(num)));
		
		PVO3[] b_pdlist = pdlist.toArray(new PVO3[pdlist.size()]);
		int n = 1;
		pdlist.clear();
		
		for (int i = 0; i < b_pdlist.length; i++) {
			PVO3 pvo3 = new PVO3();
			Pipespec pipespec = new Pipespec();
			if (i + 1 == idx_2) {
				continue;
			} else {
				pvo3.setIdx_2(String.valueOf(n));
				pvo3.setLineno_2(b_pdlist[i].getLineno_2());
				pvo3.setPin_2(b_pdlist[i].getPin_2());
				pvo3.setTemp_2(b_pdlist[i].getTemp_2());
				pvo3.setDen_2(b_pdlist[i].getDen_2());
				pvo3.setVis_2(b_pdlist[i].getVis_2());
				pvo3.setFlow_2(b_pdlist[i].getFlow_2());
				pvo3.setPer_2(b_pdlist[i].getPer_2());
				pvo3.setCfactor_2(b_pdlist[i].getCfactor_2());
				pvo3.setDout_2(b_pdlist[i].getDout_2());
				pvo3.setSize(pipespec.getSize());
				pvo3.setSchd_2(b_pdlist[i].getSchd_2());
				pvo3.setSchedule(pipespec.getSch());
				pvo3.setDin_2(b_pdlist[i].getDin_2());
				pvo3.setPlen_2(b_pdlist[i].getPlen_2());
				pvo3.setWall_2(b_pdlist[i].getWall_2());
				pvo3.setElchange_2(b_pdlist[i].getElchange_2());
				
				
				//fitting
				pvo3.setElbow90_1_2(b_pdlist[i].getElbow90_1_2());
				pvo3.setElbow90_2_2(b_pdlist[i].getElbow90_2_2());
				pvo3.setElbow90_3_2(b_pdlist[i].getElbow90_3_2());
				pvo3.setElbow90_4_2(b_pdlist[i].getElbow90_4_2());
				pvo3.setElbow90_5_2(b_pdlist[i].getElbow90_5_2());
				pvo3.setElbow90_6_2(b_pdlist[i].getElbow90_6_2());
				pvo3.setElbow90_7_2(b_pdlist[i].getElbow90_7_2());
				pvo3.setElbow90_8_2(b_pdlist[i].getElbow90_8_2());
				pvo3.setElbow90_9_2(b_pdlist[i].getElbow90_9_2());
				
				pvo3.setElbow45_1_2(b_pdlist[i].getElbow45_1_2());
				pvo3.setElbow45_2_2(b_pdlist[i].getElbow45_2_2());
				
				pvo3.setBend_1_2(b_pdlist[i].getBend_1_2());
				pvo3.setBend_2_2(b_pdlist[i].getBend_2_2());
				pvo3.setBend_3_2(b_pdlist[i].getBend_3_2());
				
				pvo3.setTee_1_2(b_pdlist[i].getTee_1_2());
				pvo3.setTee_2_2(b_pdlist[i].getTee_2_2());
				pvo3.setTee_3_2(b_pdlist[i].getTee_3_2());
				pvo3.setTee_4_2(b_pdlist[i].getTee_4_2());
				pvo3.setTee_5_2(b_pdlist[i].getTee_5_2());
				pvo3.setTee_6_2(b_pdlist[i].getTee_6_2());
				pvo3.setTee_7_2(b_pdlist[i].getTee_7_2());
				pvo3.setTee_8_2(b_pdlist[i].getTee_8_2());
				
				pvo3.setGtvalve_2(b_pdlist[i].getGtvalve_2());
				pvo3.setBvalve_2(b_pdlist[i].getBvalve_2());
				pvo3.setGbvalve_2(b_pdlist[i].getGbvalve_2());
				pvo3.setDvalve_2(b_pdlist[i].getDvalve_2());
				pvo3.setAvalve_1_2(b_pdlist[i].getAvalve_1_2());
				pvo3.setAvalve_2_2(b_pdlist[i].getAvalve_2_2());
				pvo3.setCvalve_1_2(b_pdlist[i].getCvalve_1_2());
				pvo3.setCvalve_2_2(b_pdlist[i].getCvalve_2_2());
				pvo3.setPvalve_1_2(b_pdlist[i].getPvalve_1_2());
				pvo3.setPvalve_2_2(b_pdlist[i].getPvalve_2_2());
				pvo3.setPvalve_3_2(b_pdlist[i].getPvalve_3_2());
				
				pvo3.setRedd_2(b_pdlist[i].getRedd_2());
				pvo3.setRedth_2(b_pdlist[i].getRedth_2());
				
				pvo3.setExpd_2(b_pdlist[i].getExpd_2());
				pvo3.setExpth_2(b_pdlist[i].getExpth_2());	
			
				//output
				pvo3.setPout_2(b_pdlist[i].getPout_2());
				pvo3.setEqvlen_2(b_pdlist[i].getEqvlen_2());		
				
				n += 1;
			}
			
			pdlist.add(pvo3);
			
		}
			
		for (PVO2 k : pslist) {
			Pipespec pipespec = new Pipespec();

			k.setLineno(request.getParameter("lineno".concat(k.getIdx())));
			k.setPin(request.getParameter("pin".concat(k.getIdx())));
			k.setTemp(request.getParameter("temp".concat(k.getIdx())));
			k.setDen(request.getParameter("den".concat(k.getIdx())));
			k.setVis(request.getParameter("vis".concat(k.getIdx())));
			k.setFlow(request.getParameter("flow".concat(k.getIdx())));
			k.setPer(request.getParameter("per".concat(k.getIdx())));
			k.setCfactor(request.getParameter("cfactor".concat(k.getIdx())));
			k.setDout(request.getParameter("dout".concat(k.getIdx())));
			k.setSize(pipespec.getSize());
			k.setSchd(request.getParameter("schd".concat(k.getIdx())));
			k.setSchedule(pipespec.getSch());
			k.setDin(request.getParameter("din".concat(k.getIdx())));
			k.setPlen(request.getParameter("plen".concat(k.getIdx())));
			k.setWall(request.getParameter("wall".concat(k.getIdx())));
			k.setElchange(request.getParameter("elchange".concat(k.getIdx())));
			
			
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
			k.setTee_8(request.getParameter("tee_8".concat(k.getIdx())));
			
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
		
			//output
			k.setPout(request.getParameter("pout".concat(k.getIdx())));
			k.setEqvlen(request.getParameter("eqvlen".concat(k.getIdx())));

		}
		
		//output
		//suction

		pvo1.setPsuc(request.getParameter("psuc"));
		
		pvo1.setNpsh(request.getParameter("npsh"));
		pvo1.setPdis(request.getParameter("pdis"));
		pvo1.setPtype(request.getParameter("ptype"));
		pvo1.setPdiff(request.getParameter("pdiff"));
		pvo1.setHdiff(request.getParameter("hdiff"));
		pvo1.setHp(request.getParameter("hp"));
		
		//Basis1

		pvo1.setPlevel(request.getParameter("plevel"));
		pvo1.setVppress(request.getParameter("vppress"));
		pvo1.setElsuc(request.getParameter("elsuc"));
		
		//Basis2
	
		pvo1.setElmax(request.getParameter("elmax"));
		pvo1.setCvalve(request.getParameter("cvalve"));
		pvo1.setCvdp(request.getParameter("cvdp"));
		
		
		request.getSession().setAttribute("pvo1", pvo1);
		request.getSession().setAttribute("pslist", pslist);
		request.getSession().setAttribute("pdlist", pdlist);
		
		mv.setViewName("view_user/4.calculator");		
		
		return mv;
	}
	
	
	
	@RequestMapping(value="pumprev.do", method=RequestMethod.POST)
	public ModelAndView pumprev1_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		PVO1 pvo1 = new PVO1();
		
		List<PVO2> pslist = (List<PVO2>)request.getSession().getAttribute("pslist");
		List<PVO3> pdlist = (List<PVO3>)request.getSession().getAttribute("pdlist");
		
		//input
		//suction
		pvo1.setItem1(request.getParameter("item1"));
		pvo1.setRev(request.getParameter("rev"));
		pvo1.setOp1(request.getParameter("op1"));
		pvo1.setMinh(request.getParameter("minh"));
		pvo1.setDp1(request.getParameter("dp1"));
		pvo1.setMaxh(request.getParameter("maxh"));		
		pvo1.setComp(request.getParameter("comp"));
		pvo1.setStrainer(request.getParameter("strainer"));
		pvo1.setCdtn(request.getParameter("cdtn"));
		
		
		//discharge
		pvo1.setItem2(request.getParameter("item2"));
		pvo1.setItem3(request.getParameter("item3"));
		pvo1.setCitem(request.getParameter("citem"));
		
		//suction line
		for (PVO2 k : pslist) {
			Pipespec pipespec = new Pipespec();
			
			k.setLineno(request.getParameter("lineno".concat(k.getIdx())));
			k.setPin(request.getParameter("pin".concat(k.getIdx())));
			k.setTemp(request.getParameter("temp".concat(k.getIdx())));
			k.setDen(request.getParameter("den".concat(k.getIdx())));
			k.setVis(request.getParameter("vis".concat(k.getIdx())));
			k.setFlow(request.getParameter("flow".concat(k.getIdx())));
			k.setPer(request.getParameter("per".concat(k.getIdx())));
			k.setCfactor(request.getParameter("cfactor".concat(k.getIdx())));
			k.setDout(request.getParameter("dout".concat(k.getIdx())));
			k.setSize(pipespec.getSize());
			k.setSchd(request.getParameter("schd".concat(k.getIdx())));
			k.setSchedule(pipespec.getSch());
			k.setDin(request.getParameter("din".concat(k.getIdx())));
			k.setPlen(request.getParameter("plen".concat(k.getIdx())));
			k.setWall(request.getParameter("wall".concat(k.getIdx())));
			k.setElchange(request.getParameter("elchange".concat(k.getIdx())));
			
			
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
			k.setTee_8(request.getParameter("tee_8".concat(k.getIdx())));
			
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
		
			//output
			k.setPout(request.getParameter("pout".concat(k.getIdx())));
			k.setEqvlen(request.getParameter("eqvlen".concat(k.getIdx())));
			
		}

		
		for (PVO3 k : pdlist) {
			Pipespec pipespec = new Pipespec();
			
			k.setLineno_2(request.getParameter("lineno_2".concat(k.getIdx_2())));
			k.setPout_2(request.getParameter("pout_2".concat(k.getIdx_2())));
			
			k.setTemp_2(request.getParameter("temp_2".concat(k.getIdx_2())));
			k.setDen_2(request.getParameter("den_2".concat(k.getIdx_2())));
			k.setVis_2(request.getParameter("vis_2".concat(k.getIdx_2())));
			k.setFlow_2(request.getParameter("flow_2".concat(k.getIdx_2())));
			k.setPer_2(request.getParameter("per_2".concat(k.getIdx_2())));
			k.setCfactor_2(request.getParameter("cfactor_2".concat(k.getIdx_2())));
			k.setDout_2(request.getParameter("dout_2".concat(k.getIdx_2())));
			k.setSize(pipespec.getSize());
			k.setSchd_2(request.getParameter("schd_2".concat(k.getIdx_2())));
			k.setSchedule(pipespec.getSch());
			k.setDin_2(request.getParameter("din_2".concat(k.getIdx_2())));
			k.setPlen_2(request.getParameter("plen_2".concat(k.getIdx_2())));
			k.setWall_2(request.getParameter("wall_2".concat(k.getIdx_2())));
			k.setElchange_2(request.getParameter("elchange_2".concat(k.getIdx_2())));
			
			
			//fitting
			k.setElbow90_1_2(request.getParameter("elbow90_1_2".concat(k.getIdx_2())));
			k.setElbow90_2_2(request.getParameter("elbow90_2_2".concat(k.getIdx_2())));
			k.setElbow90_3_2(request.getParameter("elbow90_3_2".concat(k.getIdx_2())));
			k.setElbow90_4_2(request.getParameter("elbow90_4_2".concat(k.getIdx_2())));
			k.setElbow90_5_2(request.getParameter("elbow90_5_2".concat(k.getIdx_2())));
			k.setElbow90_6_2(request.getParameter("elbow90_6_2".concat(k.getIdx_2())));
			k.setElbow90_7_2(request.getParameter("elbow90_7_2".concat(k.getIdx_2())));
			k.setElbow90_8_2(request.getParameter("elbow90_8_2".concat(k.getIdx_2())));
			k.setElbow90_9_2(request.getParameter("elbow90_9_2".concat(k.getIdx_2())));
			
			k.setElbow45_1_2(request.getParameter("elbow45_1_2".concat(k.getIdx_2())));
			k.setElbow45_2_2(request.getParameter("elbow45_2_2".concat(k.getIdx_2())));
			
			k.setBend_1_2(request.getParameter("bend_1_2".concat(k.getIdx_2())));
			k.setBend_2_2(request.getParameter("bend_2_2".concat(k.getIdx_2())));
			k.setBend_3_2(request.getParameter("bend_3_2".concat(k.getIdx_2())));
			
			k.setTee_1_2(request.getParameter("tee_1_2".concat(k.getIdx_2())));
			k.setTee_2_2(request.getParameter("tee_2_2".concat(k.getIdx_2())));
			k.setTee_3_2(request.getParameter("tee_3_2".concat(k.getIdx_2())));
			k.setTee_4_2(request.getParameter("tee_4_2".concat(k.getIdx_2())));
			k.setTee_5_2(request.getParameter("tee_5_2".concat(k.getIdx_2())));
			k.setTee_6_2(request.getParameter("tee_6_2".concat(k.getIdx_2())));
			k.setTee_7_2(request.getParameter("tee_7_2".concat(k.getIdx_2())));
			k.setTee_8_2(request.getParameter("tee_8_2".concat(k.getIdx_2())));
			
			k.setGtvalve_2(request.getParameter("gtvalve_2".concat(k.getIdx_2())));
			k.setBvalve_2(request.getParameter("bvalve_2".concat(k.getIdx_2())));
			k.setGbvalve_2(request.getParameter("gbvalve_2".concat(k.getIdx_2())));
			k.setDvalve_2(request.getParameter("dvalve_2".concat(k.getIdx_2())));
			k.setAvalve_1_2(request.getParameter("avalve_1_2".concat(k.getIdx_2())));
			k.setAvalve_2_2(request.getParameter("avalve_2_2".concat(k.getIdx_2())));
			k.setCvalve_1_2(request.getParameter("cvalve_1_2".concat(k.getIdx_2())));
			k.setCvalve_2_2(request.getParameter("cvalve_2_2".concat(k.getIdx_2())));
			k.setPvalve_1_2(request.getParameter("pvalve_1_2".concat(k.getIdx_2())));
			k.setPvalve_2_2(request.getParameter("pvalve_2_2".concat(k.getIdx_2())));
			k.setPvalve_3_2(request.getParameter("pvalve_3_2".concat(k.getIdx_2())));
			
			k.setRedd_2(request.getParameter("redd_2".concat(k.getIdx_2())));
			k.setRedth_2(request.getParameter("redth_2".concat(k.getIdx_2())));
			
			k.setExpd_2(request.getParameter("expd_2".concat(k.getIdx_2())));
			k.setExpth_2(request.getParameter("expth_2".concat(k.getIdx_2())));		
			
			
			//output
			k.setPin_2(request.getParameter("pin_2".concat(k.getIdx_2())));
			k.setEqvlen_2(request.getParameter("eqvlen_2".concat(k.getIdx_2())));
				
		}
		
		//suction

		pvo1.setPsuc(request.getParameter("psuc"));
		
		pvo1.setNpsh(request.getParameter("npsh"));
		pvo1.setPdis(request.getParameter("pdis"));
		pvo1.setPtype(request.getParameter("ptype"));
		pvo1.setPdiff(request.getParameter("pdiff"));
		pvo1.setHdiff(request.getParameter("hdiff"));
		pvo1.setHp(request.getParameter("hp"));
		
		//Basis1

		pvo1.setPlevel(request.getParameter("plevel"));
		pvo1.setVppress(request.getParameter("vppress"));
		pvo1.setElsuc(request.getParameter("elsuc"));
		
		//Basis2
	
		pvo1.setElmax(request.getParameter("elmax"));
		pvo1.setCvalve(request.getParameter("cvalve"));
		pvo1.setCvdp(request.getParameter("cvdp"));
		
		
		request.getSession().setAttribute("pvo1", pvo1);
		request.getSession().setAttribute("pslist", pslist);
		request.getSession().setAttribute("pdlist", pdlist);
		
		mv.setViewName("view_user/4.calculator");
		
		return mv;
	}
	
	
}
