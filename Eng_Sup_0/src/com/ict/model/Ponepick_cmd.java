package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO2;

public class Ponepick_cmd implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String idx = request.getParameter("idx");
		
		if (idx.equals("1")) {
			return "/Controller?cmd=petro_a";
			
		} else {
			VO2 pvo = DAO.getOnepick(idx);
			request.getSession().setAttribute("pvo", pvo);
		
			return "view/admin_ponepick.jsp";
		}
	
	}
}
