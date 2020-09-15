package com.ict.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.PVO1;
import com.ict.db.PVO2;

public class Line_cmd implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String cal =  request.getParameter("cal");
		
		System.out.println(cal);
		String obj = request.getParameter("obj");
		
		System.out.println(cal);
		
		int num = 0;
		int pnum = 0;
	
		switch (cal) {
			case "linehyd":
				System.out.println("test1");
				switch (obj) {
					case "add":
						num = Integer.parseInt(request.getParameter("num")); 
					break;

				}
					
				num += 1;
				System.out.println("test2");
				request.setAttribute("num", num);
				
			break;
			
			case "pumphyd":
				System.out.println("test3");
				PVO1 pvo1 = new PVO1();
				
				System.out.println(pvo1.getItem1());
				
				List<PVO2> pslist = new ArrayList<PVO2>();
				List<PVO2> pdlist = new ArrayList<PVO2>();
				
				pnum = 4;
				for (int i = 0; i < pnum; i++) {
					PVO2 pvo2 = new PVO2();
					Pipespec pipespec = new Pipespec();
					pvo2.setIdx(String.valueOf(i+1));
					
					pvo2.setDout("6");
					//pvo2.setSize(pipespec.getSize());
					//pvo2.setSchedule(pipespec.getSize());
					
					pslist.add(pvo2);
				}
				
				
				request.getSession().setAttribute("pvo1", pvo1);
				request.getSession().setAttribute("pslist", pslist);
				request.getSession().setAttribute("pnum", pnum);				
				
			break;
		}
		

		request.getSession().setAttribute("cal", cal);
		
		return "view/4.calculator.jsp";
	}
}
