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
import com.ict.db.VO1;
import com.ict.model.Scala;

@Controller
public class Unit_Controller {
	@Autowired
	private DAO dao;

	public void setDao(DAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="unit1.do", method=RequestMethod.POST)
	public ModelAndView unit1_cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		int num = Integer.parseInt(request.getParameter("num"));
		int table = Integer.parseInt(request.getParameter("table"));
		List<VO1> slist0 = (ArrayList<VO1>)request.getSession().getAttribute("slist");
		VO1[] b_slist = slist0.toArray(new VO1[slist0.size()]);
			
		List<VO1> slist = new ArrayList<VO1>();
				
		for (int i = 0; i < table; i++) {
			VO1 vo1 = new VO1();
			vo1.setIdx(i + 1);
			if(i == num - 1) {
				vo1.setScala(request.getParameter("c_scala"));
			} else {
				vo1.setScala(b_slist[i].getScala());
			}
			
			vo1.setList(Scala.getList(vo1.getScala()));
			slist.add(vo1);
		}
	
		request.getSession().setAttribute("slist", slist);
		
		mv.setViewName("view_user/2.unitconverter");
		
		return mv;
	}
	
	
	@RequestMapping(value="unit2.do", method=RequestMethod.POST)
	public ModelAndView unit2_cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		int table = Integer.parseInt(request.getParameter("table_1"));
		List<VO1> slist0 = (List<VO1>)request.getSession().getAttribute("slist");
		VO1[] b_slist = slist0.toArray(new VO1[slist0.size()]);
		
		List<VO1> slist = new ArrayList<VO1>();
		
		for (int i = 0; i < table + 1; i++) {
			VO1 vo1 = new VO1();
			vo1.setIdx(i + 1);
			if(i == table) {
				vo1.setScala("1");
			} else {
				vo1.setScala(b_slist[i].getScala());
			}
			
			vo1.setList(Scala.getList(vo1.getScala()));
			slist.add(vo1);
		}
		
		request.getSession().setAttribute("slist", slist);
		
		mv.setViewName("view_user/2.unitconverter");
		
		return mv;
	}
	
	@RequestMapping(value="unit3.do", method=RequestMethod.POST)
	public ModelAndView unit3_cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		int table = Integer.parseInt(request.getParameter("table_1"));
		List<VO1> slist0 = (ArrayList<VO1>)request.getSession().getAttribute("slist");
		VO1[] b_slist = slist0.toArray(new VO1[slist0.size()]);
		
		List<VO1> slist = new ArrayList<VO1>();
		
		table = table - 1;
		
		if(table < 2) {
			table = 2;
		}
		
		for (int i = 0; i < table; i++) {
			VO1 vo1 = new VO1();
			vo1.setIdx(i + 1);
			vo1.setScala(b_slist[i].getScala());
			vo1.setList(Scala.getList(vo1.getScala()));
			slist.add(vo1);
		}
				
		request.getSession().setAttribute("table", table);
		request.getSession().setAttribute("slist", slist);
		
		mv.setViewName("view_user/2.unitconverter");
		
		return mv;
	}
	
	

	
}















