package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Line_cmd implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String cal =  request.getParameter("cal");
		String obj = request.getParameter("obj");
		
		int num = 0;
		int pnum = 0;
	
		switch (cal) {
			case "linehyd":
				switch (obj) {
					case "add":
						num = Integer.parseInt(request.getParameter("num")); 
					break;

				}
					
				num += 1;
				
				request.setAttribute("num", num);
				
			break;
			
			case "pumphyd":
				pnum = Integer.parseInt(request.getParameter("pnum"));
				request.setAttribute("pnum", pnum);
			break;
		}
		

		request.getSession().setAttribute("cal", cal);
		
		return "view/4.calculator.jsp";
	}
}
