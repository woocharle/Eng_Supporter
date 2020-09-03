package com.ict.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ict.db.DAO;
import com.ict.db.HVO;
import com.ict.db.PVO1;
import com.ict.db.PVO2;
import com.ict.db.VO1;
import com.ict.db.VO2;
import com.ict.model.Pipespec;
import com.ict.model.Scala;

@Controller
public class Main_Controller {
	@Autowired
	private DAO dao;

	public void setDao(DAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="home.do", method=RequestMethod.GET)
	public ModelAndView home_Cmd() {
		return new ModelAndView("view_user/1.main");
		
	}
	
	@RequestMapping(value="unit.do", method = RequestMethod.GET)
	public ModelAndView unit_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int table = 2;
		request.getSession().setAttribute("table", table);
		
		List<VO1> slist = new ArrayList<VO1>();
		
		for (int i = 0; i < table; i++) {
			VO1 vo1 = new VO1();
			vo1.setIdx(i+1);
			vo1.setScala(String.valueOf(1));
			vo1.setList(Scala.getList(vo1.getScala()));
			slist.add(vo1);
		}
		
		mv.setViewName("view_user/2.unitconverter");
		
		request.getSession().setAttribute("slist", slist);		
		
		
		return mv;
	}
	
	@RequestMapping(value="petro.do", method = RequestMethod.GET)
	public ModelAndView petro_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		VO2 pvo = new VO2();
		String unit = request.getParameter("unit");
		
		List<VO2> plist = dao.getlist();
		
		if(!unit.equals("Intro")) {
			pvo = dao.getOnelist(unit);
			request.setAttribute("pvo", pvo);
		} 
		
		request.setAttribute("unit", unit);
		request.getSession().setAttribute("plist", plist);
		mv.setViewName("view_user/3.priceofpetro");
		
		return mv;
		
	}
	
	@RequestMapping(value="cal.do", method = RequestMethod.GET)
	public ModelAndView cal_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String cal = request.getParameter("cal");
		int num = 0;
		
		request.setAttribute("cal", cal);
		
		switch (cal) {
			case "linehyd":
				num = 1;
				List<HVO> list = new ArrayList<HVO>();
				
				for (int i = 0; i < num; i++) {
					HVO hvo = new HVO();
					Pipespec pipespec = new Pipespec();
					
					hvo.setIdx(String.valueOf(i+1));
					hvo.setPhase("liquid");
					hvo.setPress("Inlet");
					hvo.setCfactor("fitting");
					hvo.setDout("6");
					hvo.setDlist(pipespec.getSize());
					hvo.setSch("STD");
					hvo.setSlist(pipespec.getSch());
					
					list.add(hvo);
					
				}
				
				request.getSession().setAttribute("list", list);
						
			break;
			
			case "pumphyd":
				int pnum = 4;
				PVO1 pvo1 = new PVO1();

				List<PVO2> pslist = new ArrayList<PVO2>();
				List<PVO2> pdlist = new ArrayList<PVO2>();

				for (int i = 0; i < pnum; i++) {
					PVO2 pvo2 = new PVO2();
					Pipespec pipespec = new Pipespec();
					
					pvo2.setIdx(String.valueOf(i+1));
					
					pvo2.setDout("6");
					pvo2.setSize(pipespec.getSize());
					pvo2.setSchedule(pipespec.getSch());
					
					pslist.add(pvo2);
					pdlist.add(pvo2);
				}
				
				
				request.getSession().setAttribute("pvo1", pvo1);
				request.getSession().setAttribute("pslist", pslist);
				request.getSession().setAttribute("pnum", pnum);				
			break;
		} 
		
		mv.setViewName("view_user/4.calculator");
		
		return mv;
	}
	
	
}
