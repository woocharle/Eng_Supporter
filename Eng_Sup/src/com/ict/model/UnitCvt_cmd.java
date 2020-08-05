package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UnitCvt_cmd implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int table = 2;
		request.getSession().setAttribute("table", table);
		
		return "view/2.unitconverter.jsp";
	}
}
