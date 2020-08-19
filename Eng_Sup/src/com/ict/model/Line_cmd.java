package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Line_cmd implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String cal =  request.getParameter("cal");
		int num = Integer.parseInt(request.getParameter("num"));
		
		num += 1;

		request.getSession().setAttribute("num", num);
		
		request.getSession().setAttribute("cal", cal);
		
		return "view/4.calculator.jsp";
	}
}
