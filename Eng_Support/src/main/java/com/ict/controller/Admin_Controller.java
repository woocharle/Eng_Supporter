package com.ict.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.db.DAO;
import com.ict.db.VO1;
import com.ict.db.VO2;
import com.ict.model.Paging;

@Controller
public class Admin_Controller {
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


	// 메인 화면
	
	@RequestMapping(value="admin_main.do", method=RequestMethod.GET)
	public ModelAndView main_Cmd() {
		return new ModelAndView("view_admin/admin_main");
	}
	
	@RequestMapping(value="logout_admin.do", method=RequestMethod.GET)
	public ModelAndView logout_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		VO1 vo1 = (VO1)request.getSession().getAttribute("vo1");
		
		vo1.setIdx(null);
		vo1.setM_com(null);
		vo1.setM_name(null);
		vo1.setM_phone(null);
		vo1.setM_email(null);
		vo1.setM_name(null);
		vo1.setM_pw(null);
		vo1.setM_content(null);
		vo1.setReq_del(null);
		vo1.setReq_find(null);
		
		request.setAttribute("vo1", vo1);
		mv.setViewName("view_user/1.main");		
		
		return  mv;
	}
	
	
	//관리자 페이지
	
	@RequestMapping(value="admin_page.do", method = RequestMethod.GET)
	public ModelAndView adminpage_Cmd() {
		return new ModelAndView("view_admin/admin_page");
				
	}
	
	@RequestMapping(value="admin_page2.do", method = RequestMethod.POST)
	public ModelAndView adminpage2_Cmd() {
		return new ModelAndView("view_admin/admin_main");
		
	}
	
	@RequestMapping(value="admin_update.do", method = RequestMethod.POST)
	public ModelAndView adminrevise_Cmd(VO1 vo1, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String page = request.getParameter("page");
		String finish = "ok";
		String msg = "개인정보가 변경되었습니다.";
		String pass = request.getParameter("m_pw0");
		
		System.out.println(pass);
		
		if (vo1.getM_pw() == null || vo1.getM_pw().equals(null)) {
			vo1.setM_pw(pass);
		}
		
		int result = dao.getmIDU(vo1, "Update3");
		
		vo1 = dao.getMonelist(vo1.getIdx());
		request.getSession().setAttribute("vo1", vo1);
		
		mv.addObject("msg", msg);
		mv.addObject("finish", finish);
		mv.addObject("page", page);
		mv.setViewName("view_admin/admin_page");
		
		return mv;
		
	}
	
	//멤버 관리
	@RequestMapping(value="mlist_go.do", method=RequestMethod.GET)
	public ModelAndView mlist_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		int su = dao.getMcount();
		paging.setTotalRecord(su);
		
		
		if(paging.getTotalRecord() <= paging.getNumPerpage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerpage());
			if (paging.getTotalRecord() % paging.getNumPerpage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		String cPage = request.getParameter("cPage");
		if(cPage == null) {
			cPage = "1";
			paging.setNowPage(Integer.parseInt(cPage));
		}else {
			paging.setNowPage(Integer.parseInt(cPage));
		}
		
		paging.setBegin((paging.getNowPage() - 1) * paging.getNumPerpage() + 1);
		paging.setEnd((paging.getBegin() - 1) + paging.getNumPerpage());
		
		paging.setBeginBlock((int)((paging.getNowPage() - 1)/paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);
		
		if(paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		
		List<VO1> mlist = dao.getmlist(paging);
		request.setAttribute("mlist", mlist);
		request.setAttribute("paging", paging);
		
		mv.setViewName("view_admin/admin_member");
		
		return mv;
	}
	
	@RequestMapping(value="monelist.do", method=RequestMethod.GET)
	public ModelAndView monelist_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String idx = request.getParameter("idx");
		String cPage = request.getParameter("cPage");
		VO1 vo1 = dao.getMonelist(idx);
		
		request.getSession().setAttribute("vo1", vo1);
		request.getSession().setAttribute("cPage", cPage);
		mv.setViewName("view_admin/admin_monelist");
		
		return mv;
	}
		
	
	
	//석유화학 제품
	
	@RequestMapping(value="plist_go.do", method=RequestMethod.GET)
	public ModelAndView plist_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		//Paging 적용.
		
		int su = dao.getPcount();
		paging.setTotalRecord(su);
		
		if(paging.getTotalRecord() <= paging.getNumPerpage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerpage());
			if (paging.getTotalRecord() % paging.getNumPerpage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		
		String cPage = request.getParameter("cPage");
		if(cPage == null) {
			cPage = "1";
			paging.setNowPage(Integer.parseInt(cPage));
		}else {
			paging.setNowPage(Integer.parseInt(cPage));
		}
		
		paging.setBegin((paging.getNowPage() - 1) * paging.getNumPerpage() + 1);
		paging.setEnd((paging.getBegin() - 1) + paging.getNumPerpage());
		
		paging.setBeginBlock((int)((paging.getNowPage() - 1)/paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);
		
		if(paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		
		List<VO2> plist = dao.getPlist(paging);
		
		request.setAttribute("plist", plist);
		request.setAttribute("paging", paging);
		
		mv.setViewName("view_admin/admin_petro");
		
		return mv;
	}
	
	@RequestMapping(value="ponelist.do", method=RequestMethod.GET)
	public ModelAndView ponelist_Cmd(VO2 vo2, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String idx = request.getParameter("idx");
		String cPage = request.getParameter("cPage");
		
		vo2 = dao.getPonelist2(idx);
		
		request.getSession().setAttribute("vo2", vo2);
		request.getSession().setAttribute("cPage", cPage);
		mv.setViewName("view_admin/admin_ponelist");
		
		return mv;
		
	}
	
	@RequestMapping(value="pwrite.do", method=RequestMethod.GET)
	public ModelAndView pwrite_Cmd(@Param("cPage")String cPage) {
		ModelAndView mv = new ModelAndView("view_admin/admin_pwrite");
		mv.addObject("cPage", cPage);
		return mv;
	}
	
	@RequestMapping(value="pwrite_ok.do", method=RequestMethod.POST)
	public ModelAndView pwriteok_Cmd(VO2 vo2, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		MultipartFile file = null;
		String path = null;
		
		try {
			path = request.getSession().getServletContext().getRealPath("/resources/upload");
			file = vo2.getFile();
			
			if(file.isEmpty()) {
				vo2.setImg("");
			} else {
				vo2.setImg(vo2.getFile().getOriginalFilename());
			}
			
			result = dao.getpIDU(vo2, "Insert");
			file.transferTo(new File(path+File.separator +vo2.getImg()));
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		int su = dao.getPcount();
		paging.setTotalPage(su);
		
		if(paging.getTotalRecord() <= paging.getNumPerpage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerpage());
			if (paging.getTotalRecord() % paging.getNumPerpage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		
		String cPage = String.valueOf(paging.getTotalPage());
		
		if(result > 0) {
			mv.setViewName("redirect: plist_go.do?cPage="+cPage);
		} else {
			mv.setViewName("redirect: pwrite.do");
		}
		
		return mv;
	}
	
	@RequestMapping(value="pupdate.do", method = RequestMethod.POST)
	public ModelAndView pupdate_Cmd(VO2 vo2, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		MultipartFile file = null;
		String path = null;
		

		try {
			path = request.getSession().getServletContext().getRealPath("/resources/upload");
			file = vo2.getFile();
			
			if(file.isEmpty()) {
				vo2.setImg(vo2.getImg());
			} else {
				vo2.setImg(vo2.getFile().getOriginalFilename());
				file.transferTo(new File(path+File.separator +vo2.getImg()));
			}
			
			result = dao.getpIDU(vo2, "Update");
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		String cPage = request.getParameter("cPage");
		mv.setViewName("redirect: ponelist.do?b_idx="+vo2.getIdx()+"&cPage="+cPage);

		return mv;		
	}
	
	@RequestMapping(value="pdelete.do" , method = RequestMethod.POST)
	public ModelAndView pdelete_Cmd(VO2 vo2, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		String filename = request.getParameter("img");
		String path = null;
		
		// 아파치를 이용해서 받는 방식은 강의를 들어서.
		
		try {
			path = request.getSession().getServletContext().getRealPath("/resources/upload");

				if(filename != "") {
					String filepath = path + File.separator + filename;
					File file = new File(filepath);
					file.delete();
				}

			result = dao.getpIDU(vo2, "Delete");
			
			
		} catch (Exception e) {
			// TODO: handle exception
		} 	
		
		int su = dao.getPcount();
		paging.setTotalPage(su);
		
		if(paging.getTotalRecord() <= paging.getNumPerpage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerpage());
			if (paging.getTotalRecord() % paging.getNumPerpage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		
		String cPage = String.valueOf(paging.getTotalPage());
		
		mv.setViewName("redirect: plist_go.do?cPage="+cPage);

		return mv;		

	}
	
	
}
