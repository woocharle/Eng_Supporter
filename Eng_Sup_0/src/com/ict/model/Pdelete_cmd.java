package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO2;

public class Pdelete_cmd implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		VO2 pvo = new VO2();
		String idx = request.getParameter("idx");
		pvo.setIdx(idx);
		
		int result = DAO.getIDU(pvo, "Delete");
		
		if(result > 0) {
			return "/Controller?cmd=petro_list";
		}else {
			return "/Controller?cmd=onepick&idx="+idx;
		}
		
		
		
	}
}
