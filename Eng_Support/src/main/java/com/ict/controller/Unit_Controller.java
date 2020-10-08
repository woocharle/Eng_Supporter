package com.ict.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ict.db.VO1;
import com.ict.model.Scala;

@Controller
public class Unit_Controller {
	private Scala scala;
	
	@Autowired
	public void setScala(Scala scala) {
		this.scala = scala;
	}


	@RequestMapping(value="unit1.do", method=RequestMethod.POST)
	public ModelAndView unit1_cmd(VO1 vo1, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
	
		int idx = Integer.parseInt(request.getParameter("idx"));
		request.setAttribute("idx", idx);
		List<VO1> slist = (ArrayList<VO1>)request.getSession().getAttribute("slist");
		VO1[] b_slist = slist.toArray(new VO1[slist.size()]);
		int table = slist.size();
		
		slist.clear();
				
		for (int i = 0; i < table; i++) {
			vo1 = new VO1();
			vo1.setIdx(i + 1);
			if(i == idx - 1) {
				vo1.setScala(request.getParameter("scala"));
				vo1.setList(scala.getList(vo1.getScala()));
				String[] list = vo1.getList();
				vo1.setScala1(list[0]);
				vo1.setScala2(list[0]);		
				vo1.setUnit1("");
				vo1.setUnit2("");				

			} else {
				vo1.setScala(b_slist[i].getScala());
				vo1.setList(scala.getList(vo1.getScala()));
				vo1.setScala1(b_slist[i].getScala1());
				vo1.setScala2(b_slist[i].getScala2());
				vo1.setUnit1(b_slist[i].getUnit1());
				vo1.setUnit2(b_slist[i].getUnit2());
			}
			
			slist.add(vo1);
		}
	
		request.getSession().setAttribute("slist", slist);
		
	     mv.setViewName("view_user/2.unitconverter");
		
		return mv;
		
	}
	
	
	@RequestMapping(value="unit2.do", method=RequestMethod.POST)
	public ModelAndView unit2_cmd(VO1 vo1, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		List<VO1> slist = (List<VO1>)request.getSession().getAttribute("slist");
		VO1[] b_slist = slist.toArray(new VO1[slist.size()]);
		int table = slist.size();
		table = table + 1;
		
		slist.clear();
		
		for (int i = 0; i < table; i++) {
			vo1 = new VO1();
			vo1.setIdx(i + 1);
			
			if(i == table - 1) {
				vo1.setScala("1");
				vo1.setList(scala.getList(vo1.getScala()));
				String[] list = vo1.getList();
				vo1.setScala1(list[0]);
				vo1.setScala2(list[0]);		
				vo1.setUnit1("");
				vo1.setUnit2("");					

			} else {
				vo1.setScala(b_slist[i].getScala());
				vo1.setList(scala.getList(vo1.getScala()));
				vo1.setScala1(b_slist[i].getScala1());
				vo1.setScala2(b_slist[i].getScala2());
				vo1.setUnit1(b_slist[i].getUnit1());
				vo1.setUnit2(b_slist[i].getUnit2());				
			}
			
			slist.add(vo1);
		}
		
		
		request.getSession().setAttribute("slist", slist);
		
		mv.setViewName("view_user/2.unitconverter");
		
		return mv;
	}
	
	@RequestMapping(value="unit3.do", method=RequestMethod.POST)
	public ModelAndView unit3_cmd(VO1 vo1, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		List<VO1> slist = (ArrayList<VO1>)request.getSession().getAttribute("slist");
		VO1[] b_slist = slist.toArray(new VO1[slist.size()]);
		int table = slist.size();
		table = table - 1;
		
		slist.clear();
	
		
		if(table < 2) {
			table = 2;
		}
		
		for (int i = 0; i < table; i++) {
			vo1 = new VO1();
			vo1.setIdx(i + 1);
			vo1.setScala(b_slist[i].getScala());
			vo1.setList(scala.getList(vo1.getScala()));
			vo1.setScala1(b_slist[i].getScala1());
			vo1.setScala2(b_slist[i].getScala2());
			vo1.setUnit1(b_slist[i].getUnit1());
			vo1.setUnit2(b_slist[i].getUnit2());	
			
			slist.add(vo1);
		}
				
		request.getSession().setAttribute("slist", slist);
		
		mv.setViewName("view_user/2.unitconverter");
		
		return mv;
	}
	
	
	@RequestMapping(value="unit4.do", method=RequestMethod.POST)
	public ModelAndView unit4_Cmd(VO1 vo1, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		request.setAttribute("idx", idx);
		List<VO1> slist = (ArrayList<VO1>)request.getSession().getAttribute("slist");
		String scala1 = request.getParameter("scala1"); 
		String scala2 = request.getParameter("scala2"); 
		String unit = request.getParameter("unit1");
		boolean point = false;
		
		
		if(unit.indexOf(".") != -1) {
			point = true;
			unit.replace(".", "");
		}else {
			point = false;
		}
		
		
		try {
			double unit1 = Double.parseDouble(unit);
			double unit2 = 0;			
			
			for (VO1 k : slist) {
				if(k.getIdx() == idx) {
					int num = scala.getConversion2(k.getScala(), scala2);
				
					if(k.getScala().equals("3")) {
						unit2 = scala.getConversion3(scala1, num, unit1);
						
					}else {
						double[] con = scala.getConversion1(scala1);  
						double trans = con[num];
						unit2 = unit1 * trans;
					}
					
					k.setScala1(scala1);
					k.setScala2(scala2);
					int unit0 = (int)unit1; 
						
					if((unit1 - unit0) > 0 ) {
						k.setUnit1(String.valueOf(unit1));
					}else {
						if(point == true) {
							k.setUnit1(String.valueOf(unit0).concat("."));
						}else {
							k.setUnit1(String.valueOf(unit0));
						}
						
						
					}
					
					k.setUnit2(String.valueOf(Math.round(unit2 * 1000000000)/1000000000.0));
					
				}
				
			}

			request.getSession().setAttribute("slist", slist);
			
		} catch (Exception e) {
			System.out.println(e);
			if(unit.equals("") || unit == null || unit.equals("-")) {
				for (VO1 k : slist) {
					if(k.getIdx() == idx) {

						k.setScala1(scala1);
						k.setScala2(scala2);
						k.setUnit1(String.valueOf(unit));
						k.setUnit2(String.valueOf(unit));
						
					}
					
				}				
			}
		}
	
		mv.setViewName("view_user/2.unitconverter");
		
		return mv;
	}

	
}















