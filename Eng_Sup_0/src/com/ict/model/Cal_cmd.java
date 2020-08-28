package com.ict.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.PVO1;
import com.ict.db.PVO2;

public class Cal_cmd implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String cal = request.getParameter("cal");
		int num = 0;
				
		if(cal == null || cal.equals("Intro")) {
			cal = "Intro";
			
		} else if(cal.equals("linehyd")){
			num = 1;
			//추후에 list로 변경
			request.getSession().setAttribute("num", num);
			
		} else if(cal.equals("pumphyd")) {
			int pnum = 0;
			PVO1 pvo1 = new PVO1();

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
				pdlist.add(pvo2);
			}
			
			
			request.getSession().setAttribute("pvo1", pvo1);
			request.getSession().setAttribute("pslist", pslist);
			request.getSession().setAttribute("pnum", pnum);
			
		} else {

			
		}
		
		request.getSession().setAttribute("cal", cal);
		
		// TODO Auto-generated method stub
		return "view/4.calculator.jsp";
	}
	
}
