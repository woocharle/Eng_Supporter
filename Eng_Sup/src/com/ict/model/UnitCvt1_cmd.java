package com.ict.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UnitCvt1_cmd implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String unit = request.getParameter("scala");
		
		ArrayList<String> list = Scala.getList(unit);
		
		request.setAttribute("list", list);
		request.setAttribute("name", unit);
		
		return "view/2.unitconverter.jsp";
		
		//지정한 단위 모두 VO로 받아서 처리.
		
	}
}

