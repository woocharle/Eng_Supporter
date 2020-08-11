package com.ict.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.VO1;

public class UnitCvt3_cmd implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		int table = Integer.parseInt(request.getParameter("table_1"));
		ArrayList<VO1> slist0 = (ArrayList<VO1>)request.getSession().getAttribute("slist");
		VO1[] b_slist = slist0.toArray(new VO1[slist0.size()]);
		
		ArrayList<VO1> slist = new ArrayList<VO1>();
		
		table = table - 1;
		
		if(table < 2) {
			table = 2;
		}
		
		for (int i = 0; i < table; i++) {
			VO1 vo1 = new VO1();
			vo1.setIdx(i + 1);
			vo1.setScala(b_slist[i].getScala());
			vo1.setList(Scala.getList(vo1.getScala()));
			slist.add(vo1);
		}
				
		request.getSession().setAttribute("table", table);
		request.getSession().setAttribute("slist", slist);
		
		return "view/2.unitconverter.jsp";
		
		
	}
	
	
}

