package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cal_cmd implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String cal = request.getParameter("cal");
		
		if(cal == null || cal.equals("Intro")) {
			cal = "Intro";
		} else {
			
		}
		
		request.setAttribute("cal", cal);
		
		// TODO Auto-generated method stub
		return "view/4.calculator.jsp";
	}
	
}
