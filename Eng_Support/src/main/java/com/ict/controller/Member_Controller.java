package com.ict.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ict.db.DAO;
import com.ict.db.MVO;

@Controller
public class Member_Controller {
	@Autowired
	private DAO dao;
	
	public void setDao(DAO dao) {
		this.dao = dao;
	}

	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public ModelAndView login_Cmd(HttpServletRequest request) {
		return new ModelAndView("view_member/0.login"); 
	}
	
	@RequestMapping(value="join.do", method=RequestMethod.GET)
	public ModelAndView join_Cmd(HttpServletRequest request) {
		return new ModelAndView("view_member/0.join"); 
	}	
	
	@RequestMapping(value="find_go.do", method=RequestMethod.GET)
	public ModelAndView find_Cmd(HttpServletRequest request) {
		return new ModelAndView("view_member/0.find"); 
	}	
	
	
	
	@RequestMapping(value="logout_member.do", method=RequestMethod.GET)
	public ModelAndView logout_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		MVO mvo = (MVO)request.getSession().getAttribute("mvo");
		mvo.setM_name(null);
		
		request.setAttribute("mvo", mvo);
		mv.setViewName("view_user/1.main");
		return mv; 
	}
	
	
	@RequestMapping(value="login_ok.do")
	public ModelAndView loginok_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String m_id = request.getParameter("m_id");
		String m_pw0 = request.getParameter("m_pw");
		
		
		MVO mvo = dao.getMember(m_id);

		
		String m_pw = mvo.getM_pw();
		String alarm;
		
		if(m_pw.equals(m_pw0)) {
			if (m_id.equals("admin")) {
				mv.setViewName("view_admin/admin_main");
				
			}else {
				mvo.setReq_find(null);
				request.getSession().setAttribute("mvo", mvo);
				mv.setViewName("view_user/1.main");
			}
			
		}else {
			String id = m_id;
			alarm = "비밀번호를 잘못 입력하셨습니다.";
			
			request.setAttribute("id", id);
			request.setAttribute("alarm", alarm);
			
			mv.setViewName("view_member/0.login");
			
		}
		
		return mv;
		
	}
	
	
}
