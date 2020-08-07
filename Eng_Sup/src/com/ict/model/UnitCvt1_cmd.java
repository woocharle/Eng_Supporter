package com.ict.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.VO1;

public class UnitCvt1_cmd implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		int table = Integer.parseInt(request.getParameter("table"));
		ArrayList<VO1> slist0 = (ArrayList<VO1>)request.getSession().getAttribute("slist");
		
		ArrayList<VO1> slist = new ArrayList<VO1>();
		
		
		System.out.println(num);
		
		for (int i = 0; i < table; i++) {
			VO1 vo1 = new VO1();
			vo1.setIdx(i + 1);
			if(i == num - 1) {
				vo1.setScala(request.getParameter("c_scala"));
			} else {
				vo1.setScala(request.getParameter("scala"));
			}
			
			vo1.setList(Scala.getList(vo1.getScala()));
			slist.add(vo1);
		}
		
		for (VO1 vo1 : slist) {
			System.out.println(vo1.getScala());
		}
		
	
		request.setAttribute("slist", slist);

		
		return "view/2.unitconverter.jsp";
		
		//지정한 단위 모두 VO로 받아서 처리.
		
	}
}

