package com.ict.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UnitCvt_cmd implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int table = 2;
		request.getSession().setAttribute("table", table);
		String name = "1";
		
		ArrayList<String> list = Scala.getList(name);
		
		request.setAttribute("list", list);
		request.setAttribute("name", name);
		
		return "view/2.unitconverter.jsp";
	}
}
