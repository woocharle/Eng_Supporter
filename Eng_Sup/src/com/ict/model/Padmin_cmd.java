package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO2;

public class Padmin_cmd implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<VO2> plist = DAO.getPlist();
		request.getSession().setAttribute("plist", plist);
		
		return "view/admin_petro.jsp";
	}

}
