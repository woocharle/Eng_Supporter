package com.ict.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ict.db.HVO;
import com.ict.model.Pipespec;

@Controller
public class Line_Controller {	
	@RequestMapping(value="lineadd.do", method=RequestMethod.POST)
	public ModelAndView lineadd_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String cal = request.getParameter("cal");
		List<HVO> list0 = (List<HVO>)request.getSession().getAttribute("list");
		HVO[] b_list = list0.toArray(new HVO[list0.size()]);
		
		List<HVO> list = new ArrayList<HVO>();
		
		for (int i = 0; i < b_list.length + 1; i++) {
			HVO hvo = new HVO();
			Pipespec pipespec = new Pipespec();
			
			
			if(i == b_list.length) {
				hvo.setIdx(String.valueOf(i+1));
				hvo.setPhase("liquid");
				hvo.setPress("Inlet");
				hvo.setCfactor("fitting");
				hvo.setDout("6");
				hvo.setDlist(pipespec.getSize());
				hvo.setSch("STD");
				hvo.setSlist(pipespec.getSch());
				
			} else {
				hvo.setIdx(b_list[i].getIdx());
				hvo.setLineno(b_list[i].getLineno());
				hvo.setPhase(b_list[i].getPhase());
				hvo.setPress(b_list[i].getPress());
				hvo.setFlow(b_list[i].getFlow());
				hvo.setPin(b_list[i].getPin());
				hvo.setTemp(b_list[i].getTemp());
				hvo.setVis(b_list[i].getVis());
				hvo.setCompress(b_list[i].getCompress());
				hvo.setOver(b_list[i].getOver());
				hvo.setPout(b_list[i].getPout());
				hvo.setDen(b_list[i].getDen());
				hvo.setMol(b_list[i].getMol());
				hvo.setCpcv(b_list[i].getCpcv());
				hvo.setTdp(b_list[i].getTdp());
				hvo.setFdp(b_list[i].getFdp());
				hvo.setGdp(b_list[i].getGdp());
				hvo.setDplen(b_list[i].getDplen());
				hvo.setCfactor(b_list[i].getCfactor());
				hvo.setEqvlen(b_list[i].getEqvlen());
				hvo.setDout(b_list[i].getDout());
				hvo.setDlist(pipespec.getSize());
				hvo.setDin(b_list[i].getDin());
				hvo.setWall(b_list[i].getWall());
				hvo.setSch(b_list[i].getSch());
				hvo.setSlist(pipespec.getSch());
				hvo.setPipelen(b_list[i].getPipelen());
				hvo.setEllen(b_list[i].getEllen());
				//fitting
				hvo.setElbow90_1(b_list[i].getElbow90_1());
				hvo.setElbow90_2(b_list[i].getElbow90_2());
				hvo.setElbow90_3(b_list[i].getElbow90_3());
				hvo.setElbow90_4(b_list[i].getElbow90_4());
				hvo.setElbow90_5(b_list[i].getElbow90_5());
				hvo.setElbow90_6(b_list[i].getElbow90_6());
				hvo.setElbow90_7(b_list[i].getElbow90_7());
				hvo.setElbow90_8(b_list[i].getElbow90_8());
				hvo.setElbow90_9(b_list[i].getElbow90_9());
				
				hvo.setElbow45_1(b_list[i].getElbow45_1());
				hvo.setElbow45_2(b_list[i].getElbow45_2());
				
				hvo.setBend_1(b_list[i].getBend_1());
				hvo.setBend_2(b_list[i].getBend_2());
				hvo.setBend_3(b_list[i].getBend_3());
				
				hvo.setTee_1(b_list[i].getTee_1());
				hvo.setTee_2(b_list[i].getTee_2());
				hvo.setTee_3(b_list[i].getTee_3());
				hvo.setTee_4(b_list[i].getTee_4());
				hvo.setTee_5(b_list[i].getTee_5());
				hvo.setTee_6(b_list[i].getTee_6());
				hvo.setTee_7(b_list[i].getTee_7());
				
				hvo.setGtvalve(b_list[i].getGtvalve());
				hvo.setBvalve(b_list[i].getBvalve());
				hvo.setGbvalve(b_list[i].getGbvalve());
				hvo.setDvalve(b_list[i].getDvalve());
				hvo.setAvalve_1(b_list[i].getAvalve_1());
				hvo.setAvalve_2(b_list[i].getAvalve_2());
				hvo.setCvalve_1(b_list[i].getCvalve_1());
				hvo.setCvalve_2(b_list[i].getCvalve_2());
				hvo.setPvalve_1(b_list[i].getPvalve_1());
				hvo.setPvalve_2(b_list[i].getPvalve_2());
				hvo.setPvalve_3(b_list[i].getPvalve_3());
				
				hvo.setRedd(b_list[i].getRedd());
				hvo.setRedth(b_list[i].getRedth());
				
				hvo.setExpd(b_list[i].getExpd());
				hvo.setExpth(b_list[i].getExpth());		
			
			}
		
			
			list.add(hvo);
			
		}
	
		request.setAttribute("cal", cal);
		request.getSession().setAttribute("list", list);
		
		mv.setViewName("view_user/4.calculator");
		
		return mv;
	}
	
	@RequestMapping(value="linedel.do", method=RequestMethod.POST)
	public ModelAndView linedel_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String cal = request.getParameter("cal");
		int idx = Integer.parseInt(request.getParameter("idx"));
		List<HVO> list0 = (List<HVO>)request.getSession().getAttribute("list");
		HVO[] b_list = list0.toArray(new HVO[list0.size()]);
		List<HVO> list = new ArrayList<HVO>();
		
		System.out.println(idx);
		int n = 1;
		
		for (int i = 0; i < b_list.length; i++) {
			HVO hvo = new HVO();
			Pipespec pipespec = new Pipespec();
			
			if (i + 1 == idx) {
				continue;
			} else {
				hvo.setIdx(String.valueOf(n));
				hvo.setLineno(b_list[i].getLineno());
				hvo.setPhase(b_list[i].getPhase());
				hvo.setPress(b_list[i].getPress());
				hvo.setFlow(b_list[i].getFlow());
				hvo.setPin(b_list[i].getPin());
				hvo.setTemp(b_list[i].getTemp());
				hvo.setVis(b_list[i].getVis());
				hvo.setCompress(b_list[i].getCompress());
				hvo.setOver(b_list[i].getOver());
				hvo.setPout(b_list[i].getPout());
				hvo.setDen(b_list[i].getDen());
				hvo.setMol(b_list[i].getMol());
				hvo.setCpcv(b_list[i].getCpcv());
				hvo.setTdp(b_list[i].getTdp());
				hvo.setFdp(b_list[i].getFdp());
				hvo.setGdp(b_list[i].getGdp());
				hvo.setDplen(b_list[i].getDplen());
				hvo.setCfactor(b_list[i].getCfactor());
				hvo.setEqvlen(b_list[i].getEqvlen());
				hvo.setDout(b_list[i].getDout());
				hvo.setDlist(pipespec.getSize());
				hvo.setDin(b_list[i].getDin());
				hvo.setWall(b_list[i].getWall());
				hvo.setSch(b_list[i].getSch());
				hvo.setSlist(pipespec.getSch());
				hvo.setPipelen(b_list[i].getPipelen());
				hvo.setEllen(b_list[i].getEllen());
				//fitting
				hvo.setElbow90_1(b_list[i].getElbow90_1());
				hvo.setElbow90_2(b_list[i].getElbow90_2());
				hvo.setElbow90_3(b_list[i].getElbow90_3());
				hvo.setElbow90_4(b_list[i].getElbow90_4());
				hvo.setElbow90_5(b_list[i].getElbow90_5());
				hvo.setElbow90_6(b_list[i].getElbow90_6());
				hvo.setElbow90_7(b_list[i].getElbow90_7());
				hvo.setElbow90_8(b_list[i].getElbow90_8());
				hvo.setElbow90_9(b_list[i].getElbow90_9());
				
				hvo.setElbow45_1(b_list[i].getElbow45_1());
				hvo.setElbow45_2(b_list[i].getElbow45_2());
				
				hvo.setBend_1(b_list[i].getBend_1());
				hvo.setBend_2(b_list[i].getBend_2());
				hvo.setBend_3(b_list[i].getBend_3());
				
				hvo.setTee_1(b_list[i].getTee_1());
				hvo.setTee_2(b_list[i].getTee_2());
				hvo.setTee_3(b_list[i].getTee_3());
				hvo.setTee_4(b_list[i].getTee_4());
				hvo.setTee_5(b_list[i].getTee_5());
				hvo.setTee_6(b_list[i].getTee_6());
				hvo.setTee_7(b_list[i].getTee_7());
				
				hvo.setGtvalve(b_list[i].getGtvalve());
				hvo.setBvalve(b_list[i].getBvalve());
				hvo.setGbvalve(b_list[i].getGbvalve());
				hvo.setDvalve(b_list[i].getDvalve());
				hvo.setAvalve_1(b_list[i].getAvalve_1());
				hvo.setAvalve_2(b_list[i].getAvalve_2());
				hvo.setCvalve_1(b_list[i].getCvalve_1());
				hvo.setCvalve_2(b_list[i].getCvalve_2());
				hvo.setPvalve_1(b_list[i].getPvalve_1());
				hvo.setPvalve_2(b_list[i].getPvalve_2());
				hvo.setPvalve_3(b_list[i].getPvalve_3());
				
				hvo.setRedd(b_list[i].getRedd());
				hvo.setRedth(b_list[i].getRedth());
				
				hvo.setExpd(b_list[i].getExpd());
				hvo.setExpth(b_list[i].getExpth());				
				
				n += 1;
			 
			}
			
			list.add(hvo);
		}
		
		request.setAttribute("cal", cal);
		request.getSession().setAttribute("list", list);
		
		mv.setViewName("view_user/4.calculator");
		
		return mv;
		
	}
	
	@RequestMapping(value="linerev.do", method=RequestMethod.POST)
	public ModelAndView linerev_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String cal = request.getParameter("cal");
		String idx = request.getParameter("idx");
		System.out.println(idx);
		
		List<HVO> list = (List<HVO>)request.getSession().getAttribute("list");
		
		for (HVO k : list) {
			Pipespec pipespec = new Pipespec();
			
			if(k.getIdx().equals(idx)) {
				k.setLineno(request.getParameter("lineno"));
				k.setPhase(request.getParameter("phase"));
				k.setPress(request.getParameter("press"));
				k.setFlow(request.getParameter("flow"));
				k.setPin(request.getParameter("pin"));
				k.setTemp(request.getParameter("temp"));
				k.setVis(request.getParameter("vis"));
				k.setCompress(request.getParameter("compress"));
				k.setOver(request.getParameter("over"));
				k.setPout(request.getParameter("pout"));
				k.setDen(request.getParameter("den"));
				k.setMol(request.getParameter("mol"));
				k.setCpcv(request.getParameter("cpcv"));
				k.setTdp(request.getParameter("tdp"));
				k.setFdp(request.getParameter("fdp"));
				k.setGdp(request.getParameter("gdp"));
				k.setDplen(request.getParameter("dplen"));
				k.setCfactor(request.getParameter("cfactor"));
				k.setEqvlen(request.getParameter("eqvlen"));
				k.setDout(request.getParameter("dout"));
				k.setDlist(pipespec.getSize());
				k.setDin(request.getParameter("din"));
				k.setWall(request.getParameter("wall"));
				k.setSch(request.getParameter("sch"));
				k.setSlist(pipespec.getSch());
				k.setPipelen(request.getParameter("pipelen"));
				k.setEllen(request.getParameter("ellen"));
				//fitting
				k.setElbow90_1(request.getParameter("elbow90_1"));
				k.setElbow90_2(request.getParameter("elbow90_2"));
				k.setElbow90_3(request.getParameter("elbow90_3"));
				k.setElbow90_4(request.getParameter("elbow90_4"));
				k.setElbow90_5(request.getParameter("elbow90_5"));
				k.setElbow90_6(request.getParameter("elbow90_6"));
				k.setElbow90_7(request.getParameter("elbow90_7"));
				k.setElbow90_8(request.getParameter("elbow90_8"));
				k.setElbow90_9(request.getParameter("elbow90_9"));
				
				k.setElbow45_1(request.getParameter("elbow45_1"));
				k.setElbow45_2(request.getParameter("elbow45_1"));
				
				k.setBend_1(request.getParameter("bend_1"));
				k.setBend_2(request.getParameter("bend_2"));
				k.setBend_3(request.getParameter("bend_3"));
				
				k.setTee_1(request.getParameter("tee_1"));
				k.setTee_2(request.getParameter("tee_2"));
				k.setTee_3(request.getParameter("tee_3"));
				k.setTee_4(request.getParameter("tee_4"));
				k.setTee_5(request.getParameter("tee_5"));
				k.setTee_6(request.getParameter("tee_6"));
				k.setTee_7(request.getParameter("tee_7"));
				
				k.setGtvalve(request.getParameter("gtvalve"));
				k.setBvalve(request.getParameter("bvalve"));
				k.setGbvalve(request.getParameter("gbvalve"));
				k.setDvalve(request.getParameter("dvalve"));
				k.setAvalve_1(request.getParameter("avalve_1"));
				k.setAvalve_2(request.getParameter("avalve_2"));
				k.setCvalve_1(request.getParameter("cvalve_1"));
				k.setCvalve_2(request.getParameter("cvalve_2"));
				k.setPvalve_1(request.getParameter("pvalve_1"));
				k.setPvalve_2(request.getParameter("pvalve_2"));
				k.setPvalve_3(request.getParameter("pvalve_3"));
				
				k.setRedd(request.getParameter("redd"));
				k.setRedth(request.getParameter("redth"));
				
				k.setExpd(request.getParameter("expd"));
				k.setExpth(request.getParameter("expth"));				
				
			}
			
		}
		
		request.setAttribute("cal", cal);
		request.getSession().setAttribute("list", list);
		
		mv.setViewName("view_user/4.calculator");
		return mv;
	}
	
}
