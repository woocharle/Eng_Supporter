package com.ict.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.VO1;

public class UnitCvt_cmd implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int table = 2;
		request.getSession().setAttribute("table", table);
		
		
		ArrayList<VO1> slist = new ArrayList<VO1>();
		
		for (int i = 0; i < table; i++) {
			VO1 vo1 = new VO1();
			vo1.setIdx(i+1);
			vo1.setScala(String.valueOf(1));
			vo1.setList(Scala.getList(vo1.getScala()));
			slist.add(vo1);
		}
		
		request.getSession().setAttribute("slist", slist);
		
		return "view/2.unitconverter.jsp";
	}
}
