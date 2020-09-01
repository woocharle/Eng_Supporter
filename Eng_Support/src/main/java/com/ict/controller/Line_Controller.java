package com.ict.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ict.db.DAO;

@Controller
public class Line_Controller {	
	@RequestMapping(value="lineadd.do", method=RequestMethod.POST)
	public ModelAndView lineadd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String cal = request.getParameter("cal");
		int num = Integer.parseInt(request.getParameter("num")); 

		num += 1;
		
		request.setAttribute("cal", cal);
		request.setAttribute("num", num);
		
		mv.setViewName("view_user/4.calculator");
		
		return mv;
	}
	
	
}
