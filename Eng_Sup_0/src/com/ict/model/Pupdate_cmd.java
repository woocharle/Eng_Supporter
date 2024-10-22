package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO2;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Pupdate_cmd implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		VO2 pvo = new VO2();
		
		try {
			String path = request.getServletContext().getRealPath("/upload");
			MultipartRequest mr = new MultipartRequest(
										request, 
										path,
										100*1024*1024,
										"utf-8",
										new DefaultFileRenamePolicy());
			
			pvo.setIdx(mr.getParameter("idx"));
			pvo.setUnit(mr.getParameter("unit"));
			pvo.setContent_s(mr.getParameter("content_s"));
			pvo.setContent(mr.getParameter("content"));
			
			if(mr.getFile("img") != null){	
				pvo.setImg(mr.getFilesystemName("img"));
			} else{
				pvo.setImg("img0");
			}
			
			result = DAO.getIDU(pvo, "Update");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		if(result > 0) {
			return "/Controller?cmd=onepick&idx="+pvo.getIdx();
		} else {
			
			return "view/update.jsp";
		}
		

	}
}
