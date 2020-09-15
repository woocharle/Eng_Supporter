package com.ict.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ict.db.DAO;
import com.ict.db.MVO;
import com.ict.db.VO2;

@Controller
public class Admin_Controller {
	@Autowired
	private DAO dao; 
	
	public void setDao(DAO dao) {
		this.dao = dao;
	}

	@RequestMapping(value="admin_main.do", method=RequestMethod.GET)
	public ModelAndView main_Cmd() {
		return new ModelAndView("view_admin/admin_main");
	}
	
	@RequestMapping(value="logout_admin.do", method=RequestMethod.GET)
	public ModelAndView logout_Cmd() {
		return new ModelAndView("view_user/1.main");
	}
	
	//멤버 관리
	@RequestMapping(value="mlist_go.do", method=RequestMethod.GET)
	public ModelAndView mlist_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		List<MVO> mlist = dao.getmlist();
		request.setAttribute("mlist", mlist);
		
		mv.setViewName("view_admin/admin_member");
		
		return mv;
	}
	
	@RequestMapping(value="monelist.do", method=RequestMethod.GET)
	public ModelAndView monelist_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String idx = request.getParameter("idx");
		MVO mvo = dao.getMonelist(idx);
		
		request.getSession().setAttribute("mvo", mvo);
		
		mv.setViewName("view_admin/admin_monelist");
		
		return mv;
	}
		
	
	
	//석유화학 제품
	
	@RequestMapping(value="plist_go.do", method=RequestMethod.GET)
	public ModelAndView plist_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		List<VO2> plist = dao.getlist();
		
		request.setAttribute("plist", plist);
		
		mv.setViewName("view_admin/admin_petro");
		
		return mv;
	}
	
	@RequestMapping(value="ponelist.do", method=RequestMethod.GET)
	public ModelAndView ponelist_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String idx = request.getParameter("idx");
		
		VO2 pvo = dao.getOnelist2(idx);
		
		request.getSession().setAttribute("pvo", pvo);
		
		mv.setViewName("view_admin/admin_ponelist");
		
		return mv;
		
	}
	
	@RequestMapping(value="pwrite.do", method=RequestMethod.GET)
	public ModelAndView pwrite_Cmd(HttpServletRequest request) {
		return new ModelAndView("view_admin/admin_pwrite");
	}
	
	//write와 update는 Mybatis로 파일 보내는 코드를 익힌 뒤 수정.
	
	
	
	
	
	
}
