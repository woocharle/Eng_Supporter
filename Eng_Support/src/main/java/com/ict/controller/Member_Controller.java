package com.ict.controller;


import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping(value="login_ok.do", method=RequestMethod.POST)
	public ModelAndView loginok_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String m_id = request.getParameter("m_id");
		String m_pw0 = request.getParameter("m_pw");
		String msg = null;
		
		MVO mvo = dao.getMember(m_id);

		String m_pw = mvo.getM_pw();
		
		if(m_pw.equals(m_pw0)) {
			if (m_id.equals("admin")) {
				request.getSession().setAttribute("admin_pass", mvo.getM_pw());		
				
			}else {
				mvo.setReq_find(null);
				int result = dao.getmIDU(mvo, "Find");
			}
			
			request.getSession().setAttribute("mvo", mvo);
			mv.setViewName("view_user/1.main");
			
		}else {
			String id = m_id;
			String finish ="ok"; 

			mv.addObject("finish", finish);
			msg = "아이디가 없거나 비밀번호를 잘못 입력하셨습니다.";
			
			request.setAttribute("id", id);
			request.setAttribute("msg", msg);
			
			mv.setViewName("view_member/0.login");
			
		}
		
		return mv;		
		
	}

	
	@RequestMapping(value="logout_member.do", method=RequestMethod.GET)
	public ModelAndView logout_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		MVO mvo = (MVO)request.getSession().getAttribute("mvo");
		
		mvo.setIdx(null);
		mvo.setM_com(null);
		mvo.setM_name(null);
		mvo.setM_phone(null);
		mvo.setM_email(null);
		mvo.setM_name(null);
		mvo.setM_pw(null);
		mvo.setM_content(null);
		mvo.setReq_del(null);
		mvo.setReq_find(null);
		
		request.setAttribute("mvo", mvo);
		mv.setViewName("view_user/1.main");
		return mv; 
	}
	
	
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public ModelAndView join_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String id_chk1 = "no";
		String id_chk2 = null;
		
		mv.addObject("id_chk1", id_chk1);
		mv.addObject("id_chk2", id_chk2);
		mv.setViewName("view_member/0.join");
		
		return mv; 
	}	

	@RequestMapping(value="join_ok.do", method=RequestMethod.POST)
	public ModelAndView join_Cmd(MVO mvo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
				
		String check = dao.getSearch1(mvo.getM_email());
		String msg = "";
	
		if(check == null) {
			int result = dao.getmIDU(mvo, "Insert");
			msg="회원가입이 완료되었습니다. \n로그인을 하세요.";
			mv.setViewName("view_member/0.login");
			String join="ok";
			mv.addObject("join", join);		
			
		}else {
			msg="해당 메일로 가입한 아이디가 있습니다.";
			mv.setViewName("view_member/0.join");
			String finish ="ok"; 
			mv.addObject("finish", finish);
		}

		mv.addObject("msg", msg);
		
		
		return mv;
	}
	
	
	@RequestMapping(value="duple_chk.do", method = RequestMethod.POST)
	public ModelAndView duple_Cmd(MVO mvo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String id_chk1 = request.getParameter("id_chk1"); 
		id_chk1 = "yes";
		String id_chk2 = request.getParameter("id_chk2"); 
		
		String check = dao.getCheck(mvo.getM_id());

		if (check != null) {
			id_chk2 = "no";
		} else {
			id_chk2 = "yes";
		}
		
		mv.addObject("id_chk1", id_chk1);
		mv.addObject("id_chk2", id_chk2);	
		mv.addObject("mvo", mvo);
		
		mv.setViewName("view_member/0.join");
		
		return mv;
	}
	
	
	@RequestMapping(value="find_go.do", method=RequestMethod.GET)
	public ModelAndView find_Cmd(HttpServletRequest request) {
		return new ModelAndView("view_member/0.find"); 
	}	
	
	@RequestMapping(value="send_mail.do", method = RequestMethod.POST)
	public ModelAndView send_Cmd(HttpServletRequest request, MVO mvo) {
		ModelAndView mv = new ModelAndView();
		String finish = "ok"; 
		String msg = "";
		String m_id = dao.getSearch1(mvo.getM_email());
		//String m_pw = "";
		
		if(m_id.equals("email 없음")) {
			msg="제출하신 메일주소를 가진 멤버가 없습니다.";
			
		}else {
			/*
			 * String host = "stmp.naver.com"; String user = "admin@naver.com"; String
			 * password = "password";
			 * 
			 * Properties props = new Properties(); props.put("mail.smtp.host", host);
			 * props.put("mail.smtp.port", 587); props.put("mail.smtp.auth", "true");
			 * 
			 * m_pw = dao.getSearch2(mvo.getM_email());
			 * 
			 * Session session = Session.getDefaultInstance(props, new Authenticator() {
			 * protected PasswordAuthentication getPasswordAuthentication() { return new
			 * PasswordAuthentication(user, password); } });
			 * 
			 * try { MimeMessage message = new MimeMessage(session); message.setFrom(new
			 * InternetAddress(user)); message.addRecipient(Message.RecipientType.TO, new
			 * InternetAddress(mvo.getM_email()));
			 * 
			 * message.setSubject("안녕하십니까. 아이디와 비밀번호를 입니다."); message.setText("아이디는" + m_id
			 * + " 비밀번호는 " + m_pw + " 입니다.");
			 * 
			 * Transport.send(message);
			 * 
			 * System.out.println("성공");
			 * 
			 * } catch (Exception e) { e.printStackTrace(); }
			 */
			mvo.setReq_find("request");
			int result = dao.getmIDU(mvo, "Find");
			msg = "제출하신 " + mvo.getM_email().concat("익일 내로 주소에 아이디와 비번을 전송하겠습니다.");
		}		
		
		
		mv.addObject("finish", finish);
		mv.addObject("msg", msg);
		
		mv.setViewName("view_member/0.login");
		return mv; 
	}	
	
	@RequestMapping(value="revise.do", method = RequestMethod.POST)
	public ModelAndView revise_Cmd(MVO mvo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String page = request.getParameter("page");
		String finish = "ok";
		String msg = "개인정보가 변경되었습니다.";
		
		int result = dao.getmIDU(mvo, "Update");
		
		mv.addObject("msg", msg);
		mv.addObject("finish", finish);
		mv.addObject("page", page);
		mv.setViewName("view_member/0.mypage");
		
		return mv;
		
	}
	
	@RequestMapping(value="revise2.do", method = RequestMethod.POST)
	public ModelAndView revise2_Cmd(MVO mvo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String page = request.getParameter("page");
		String finish = "ok";
		String msg = "비밀번호가 변경되었습니다.";
		
		int result = dao.getmIDU(mvo, "Update2");

		mv.addObject("msg", msg);
		mv.addObject("finish", finish);
		mv.addObject("page", page);
		mv.setViewName("view_member/0.mypage");
		
		return mv;
		
	}

	

	

}
