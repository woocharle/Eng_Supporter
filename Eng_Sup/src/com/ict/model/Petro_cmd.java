package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO2;

public class Petro_cmd implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		List<VO2> plist = DAO.getList();
		String unit = "Intro";
		
		request.getSession().setAttribute("plist", plist);
		request.setAttribute("unit", unit);
		
		
		return "view/3.priceofpetro.jsp";
	}
}
