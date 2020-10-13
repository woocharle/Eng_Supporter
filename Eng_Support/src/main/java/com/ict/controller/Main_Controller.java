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
import com.ict.db.HVO2;
import com.ict.db.PVO1;
import com.ict.db.PVO2;
import com.ict.db.PVO3;
import com.ict.db.UVO;
import com.ict.db.VO2;
import com.ict.db.VO3;
import com.ict.model.Paging;
import com.ict.model.Pipespec;
import com.ict.model.Scala;

@Controller
public class Main_Controller {
	private DAO dao;
	private Scala scala;
	private Pipespec pipespec;
	private Paging paging; 
	
	@Autowired
	public void setDao(DAO dao) {
		this.dao = dao;
	}
	
	@Autowired
	public void setScala(Scala scala) {
		this.scala = scala;
	}

	@Autowired
	public void setPipespec(Pipespec pipespec) {
		this.pipespec = pipespec;
	}
	
	@Autowired
	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	

	// jsp의 *.do 
	
	@RequestMapping(value="home.do", method=RequestMethod.GET)
	public ModelAndView home_Cmd() {
		return new ModelAndView("view_user/1.main");
		
	}
	
	@RequestMapping(value="unit.do", method = RequestMethod.GET)
	public ModelAndView unit_Cmd(UVO uvo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int table = 2;
		request.getSession().setAttribute("table", table);
		
		List<UVO> slist = new ArrayList<UVO>();
		
		for (int i = 0; i < table; i++) {
			uvo = new UVO();
			uvo.setIdx(i+1);
			uvo.setScala(String.valueOf(1));
			uvo.setList(scala.getList(uvo.getScala()));

			String[] list = uvo.getList();
			
			uvo.setScala1(list[0]);
			uvo.setScala2(list[0]);
			
			slist.add(uvo);
		}
		
		mv.setViewName("view_user/2.unitconverter");
		
		request.getSession().setAttribute("slist", slist);		
		
		return mv;
	}
	
	@RequestMapping(value="petro.do", method = RequestMethod.GET)
	public ModelAndView petro_Cmd(VO2 vo2, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		String unit = request.getParameter("unit");
		
		List<VO2> plist = dao.getPlist();
		
		if(!unit.equals("Intro")) {
			vo2 = dao.getPonelist(unit);
			request.setAttribute("vo2", vo2);
		} 
		
		request.setAttribute("unit", unit);
		request.getSession().setAttribute("plist", plist);
		mv.setViewName("view_user/3.priceofpetro");
		
		return mv;
		
	}
	
	@RequestMapping(value="cal.do", method = RequestMethod.GET)
	public ModelAndView cal_Cmd(HVO hvo, HVO2 hvo2, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String cal = request.getParameter("cal");
		request.getSession().setAttribute("cal", cal);
		
		int num = 0;
		int pnum = 0;
		int pnum2 = 0;
		List<HVO> list = null;
		List<HVO2> hlist = null;
		
		List<PVO2> pslist;
		List<PVO3> pdlist;
		
		switch (cal) {
			case "linehyd":
				num = 1;
				list = new ArrayList<HVO>();
				
				for (int i = 0; i < num; i++) {
					hvo = new HVO();
						
					hvo.setIdx(String.valueOf(i+1));
					hvo.setPhase("liquid");
					hvo.setPress("Inlet");
					hvo.setCfactor("fitting");
					hvo.setDout("6");
					hvo.setDlist(pipespec.getSize());
					hvo.setSch("STD");
					hvo.setSlist(pipespec.getSchedule());
					
					list.add(hvo);
					
				}
				
				request.getSession().setAttribute("list", list);
						
			break;
			
			case "pumphyd":
				pnum = 4;
				pnum2 = 4;
				
				PVO1 pvo1 = new PVO1();

				pslist = new ArrayList<PVO2>();
				pdlist = new ArrayList<PVO3>();

				pvo1.setCdtn("Exist");
				pvo1.setCvalve("Exist");
				
				for (int i = 0; i < pnum; i++) {
					PVO2 pvo2 = new PVO2();
					PVO3 pvo3 = new PVO3();
					
					pvo2.setIdx(String.valueOf(i+1));
					pvo3.setIdx_d(String.valueOf(i+1));
					
					pvo2.setSize(pipespec.getSize());
					pvo2.setSchedule(pipespec.getSchedule());
					
					pvo3.setSize(pipespec.getSize());
					pvo3.setSchedule(pipespec.getSchedule());
					
					pslist.add(pvo2);
					pdlist.add(pvo3);
				}
				
				request.getSession().setAttribute("pvo1", pvo1);
				request.getSession().setAttribute("pslist", pslist);
				request.getSession().setAttribute("pdlist", pdlist);	
			
			break;
			
			case "psvhyd":
				pnum = 4;
				pnum2 = 4;			
				
				PVO1 psv = new PVO1();
				pslist = new ArrayList<PVO2>();
				pdlist = new ArrayList<PVO3>();
				
				for (int i = 0; i < pnum; i++) {
					PVO2 pvo2 = new PVO2();
					PVO3 pvo3 = new PVO3();
					
					pvo2.setIdx(String.valueOf(i+1));
					pvo3.setIdx_d(String.valueOf(i+1));
					
					pvo2.setSize(pipespec.getSize());
					pvo2.setSchedule(pipespec.getSchedule());
					
					pvo3.setSize(pipespec.getSize());
					pvo3.setSchedule(pipespec.getSchedule());
					
					pslist.add(pvo2);
					pdlist.add(pvo3);
				}
				
				request.getSession().setAttribute("psv", psv);
				request.getSession().setAttribute("pslist", pslist);
				request.getSession().setAttribute("pdlist", pdlist);			
				
			break;
			
			case "phtrans": 
				hlist = new ArrayList<HVO2>();
				
				hvo2 = new HVO2();
					
				hvo2.setIdx(String.valueOf(1));
				hvo2.setPhase("liquid");
				hvo2.setCfactor("fitting");
				hvo2.setDout("6");
				hvo2.setDlist(pipespec.getSize());
				hvo2.setSch("STD");
				hvo2.setSlist(pipespec.getSchedule());
				
				hlist.add(hvo2);
		
				request.getSession().setAttribute("list", hlist);				
				
			break;
			
		} 
		
		mv.setViewName("view_user/4.calculator");
		
		return mv;
	}
	
	
	
	
	@RequestMapping(value="mypage.do", method=RequestMethod.GET)
	public ModelAndView mypage_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String page = request.getParameter("page");
		request.getSession().setAttribute("page", page);
			
		if(page.equals("faq")) {
			int su = dao.getFcount();
			paging.setTotalRecord(su);
			
			// tuple의 개수를 구한 뒤 한 페이지당 보여줄 tuple 개수를 나누어 전체 페이지수 구하기 
			if(paging.getTotalRecord() <= paging.getNumPerpage()) {
				paging.setTotalPage(1);
			} else {
				paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerpage());
				// 나머지가 있으면 한 페이지 추가.
				if(paging.getTotalRecord() % paging.getNumPerpage() != 0) {
					paging.setTotalPage(paging.getTotalPage()+1);
				}
				
			}			
			
			String cPage = request.getParameter("cPage");

			if(cPage == null) {
				cPage = "1";
				paging.setNowPage(1);
			}else {
				paging.setNowPage(Integer.parseInt(cPage));
			}
			
			paging.setBegin((paging.getNowPage() - 1) * paging.getNumPerpage() + 1);
			paging.setEnd((paging.getBegin() - 1) + paging.getNumPerpage());
			
			paging.setBeginBlock((int)((paging.getNowPage() - 1)/paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
			paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);
			
			if(paging.getEndBlock() > paging.getTotalPage()){
				paging.setEndBlock(paging.getTotalPage());
			}		

			List<VO3> list = dao.getflist(paging);
				
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.setViewName("list");
			
			request.getSession().setAttribute("cPage", cPage);
			
		}
		
		mv.setViewName("view_member/0.mypage");
		
		return mv;
	}
	
	
	
	
}
