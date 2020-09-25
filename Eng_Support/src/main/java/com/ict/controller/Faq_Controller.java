package com.ict.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ict.db.DAO;
import com.ict.db.MVO;
import com.ict.model.Paging;

@Controller
public class Faq_Controller {
	private DAO dao;
	private Paging paging; 
	
	@Autowired
	public void setDao(DAO dao) {
		this.dao = dao;
	}
	
	@Autowired
	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	
	
	@RequestMapping(value="fwrite.do", method = RequestMethod.GET)
	public ModelAndView fwrite_Cmd(HttpServletRequest request, MVO mvo) {
		ModelAndView mv = new ModelAndView();
		String cPage = request.getParameter("cPage");
		request.getSession().getAttribute("mvo");
		String page = "fwrite";
		
		
		mv.addObject("cPage", cPage);
		mv.setViewName("redirect: mypage.do?page="+page);
		return mv;
	}
	
	

}
