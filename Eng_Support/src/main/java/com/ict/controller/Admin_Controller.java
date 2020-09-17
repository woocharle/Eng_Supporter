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
import com.ict.db.MVO;
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
	public ModelAndView logout_Cmd() {
		return new ModelAndView("view_user/1.main");
	}
	
	//멤버 관리
	@RequestMapping(value="mlist_go.do", method=RequestMethod.GET)
	public ModelAndView mlist_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

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

		String cPage = request.getParameter("cPage");
		if(cPage == null) {
			paging.setNowPage(1);
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
		
		List<MVO> mlist = dao.getmlist(paging);
		request.setAttribute("mlist", mlist);
		request.setAttribute("paging", paging);
		
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
		//Paging 적용.
		
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
		
		String cPage = request.getParameter("cPage");
		if(cPage == null) {
			paging.setNowPage(1);
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
		
		vo2 = dao.getPonelist2(idx);
		
		request.getSession().setAttribute("vo2", vo2);
		request.getSession().setAttribute("cPage", request.getParameter("cPage"));
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
		
		String cPage = (String) request.getSession().getAttribute("cPage");
		mv.setViewName("redirect: onelist.do?b_idx="+vo2.getIdx()+"&cPage="+cPage);

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
