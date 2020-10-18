package com.ict.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ict.db.DAO;
import com.ict.db.VO1;
import com.ict.db.VO3;
import com.ict.db.VO4;
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
	public ModelAndView fwrite_Cmd(HttpServletRequest request, VO1 vo1) {
		ModelAndView mv = new ModelAndView();
		String cPage = request.getParameter("cPage");
		request.getSession().getAttribute("vo1");
		String page = "fwrite";
		
		
		mv.addObject("cPage", cPage);
		mv.setViewName("redirect: mypage.do?page="+page);
		return mv;
	}
	
	@RequestMapping(value="fsave_go.do", method=RequestMethod.POST)
	public ModelAndView fsave_Cmd(HttpServletRequest request, VO3 vo3) {
		ModelAndView mv = new ModelAndView();
		int result = dao.getfIDU1(vo3, "Insert");
		
		mv.setViewName("redirect: mypage.do?page=faq");
		
		return mv;
		
	}
	
	@RequestMapping(value="fonelist.do", method=RequestMethod.GET)
	public ModelAndView fonelist_Cmd(HttpServletRequest request, VO3 vo3, VO4 vo4) {
		ModelAndView mv = new ModelAndView();
		String b_idx = request.getParameter("b_idx");
		String cPage = request.getParameter("cPage");
		VO1 vo1 = (VO1)request.getSession().getAttribute("vo1");
		String page = "fonelist";
		request.getSession().setAttribute("page", page);
		request.getSession().getAttribute("vo1");
		List<VO4> alist = dao.getalist(b_idx);
		
		vo3 = dao.getFonelist(b_idx);
		
		if(vo3.getOpen_close().equals("close")) {
			if(vo1.getM_id().equals("admin") || vo1.getIdx().equals(vo3.getM_idx())) {
				request.getSession().setAttribute("alist", alist);
				request.getSession().setAttribute("vo3", vo3);
				request.getSession().setAttribute("cPage", cPage);
				mv.setViewName("redirect: mypage.do?page="+page);
				
			}else {
				String finish = "ok";
				String msg = "비공개 입니다.";
				mv.addObject("finish", finish);
				mv.addObject("msg", msg);
				mv.setViewName("redirect: mypage.do?page=faq&cPage="+cPage);
				
			}
		}else {
			request.getSession().setAttribute("alist", alist);
			request.getSession().setAttribute("vo3", vo3);
			request.getSession().setAttribute("cPage", cPage);
			mv.setViewName("redirect: mypage.do?page="+page);
			
		}

		return mv;
		
	}
	
	@RequestMapping(value="fupdate1.do", method = RequestMethod.POST)
	public ModelAndView fupdate_Cmd(VO3 vo3, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String b_idx = vo3.getB_idx();
		String cPage = (String)request.getSession().getAttribute("cPage");
		
		int result = dao.getfIDU1(vo3, "Update");
		
		mv.setViewName("redirect: fonelist.do?b_idx="+b_idx+"&cPage="+cPage);
		
		return mv;
	}
	
	@RequestMapping(value="fdelete1.do", method = RequestMethod.POST)
	public ModelAndView fdelete_Cmd(VO3 vo3, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		try {
			int result = dao.getfIDU1(vo3, "Delete");
			mv.setViewName("redirect: mypage.do?page=faq");
			
		} catch (Exception e) {
			mv.setViewName("view_admin/alarm2");
		}
		
		return mv;
	}
	
	
	@RequestMapping(value="finsert2.do", method = RequestMethod.POST)
	public ModelAndView finsert2_Cmd(VO4 vo4, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String b_idx = vo4.getB_idx();
		String cPage = (String)request.getSession().getAttribute("cPage");
		
		int result = dao.getfIDU2(vo4, "Insert");
		
		mv.setViewName("redirect: fonelist.do?b_idx="+b_idx+"&cPage="+cPage);
		
		return mv;
	}
	
	@RequestMapping(value="fupdate2.do", method = RequestMethod.POST)
	public ModelAndView fupdate2_Cmd(VO4 vo4, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String b_idx = vo4.getB_idx();
		String cPage = (String)request.getSession().getAttribute("cPage");

		int result = dao.getfIDU2(vo4, "Update");
		mv.setViewName("redirect: fonelist.do?b_idx="+b_idx+"&cPage="+cPage);

		return mv;
	}
	
	@RequestMapping(value="fdelete2.do", method = RequestMethod.POST)
	public ModelAndView fdelete2_Cmd(VO4 vo4, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String b_idx = vo4.getB_idx();
		String cPage = (String)request.getSession().getAttribute("cPage");
		
		int result = dao.getfIDU2(vo4, "Delete");
		
		mv.setViewName("redirect: fonelist.do?b_idx="+b_idx+"&cPage="+cPage);		
		

		return mv;
	}
	

	
}
