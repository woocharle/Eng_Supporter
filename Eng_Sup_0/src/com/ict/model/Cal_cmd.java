package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cal_cmd implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String cal = request.getParameter("cal");
		int num = 0;
		
		
		if(cal == null || cal.equals("Intro")) {
			cal = "Intro";
		} else {
			num = 1;
			//추후에 list로 변경
			request.getSession().setAttribute("num", 1);
			
		}
		
		request.getSession().setAttribute("cal", cal);
		
		// TODO Auto-generated method stub
		return "view/4.calculator.jsp";
	}
	
}
