package com.ict.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO2;

public class Petro_cmd implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		List<VO2> plist = DAO.getPlist();
		VO2 pvo = new VO2();
		String unit = request.getParameter("unit");
		
		if(unit == null) {
			unit = "Intro";
		} else {
			VO2[] b_plist = plist.toArray(new VO2[plist.size()]);
			
			for (int i = 0; i < b_plist.length; i++) {
				if (unit.equals(b_plist[i].getUnit())) {
					pvo.setImg(b_plist[i].getImg());
					pvo.setContent(b_plist[i].getContent());
					
				}
			}
			
			request.setAttribute("pvo", pvo);
			
		}
		
		
		request.getSession().setAttribute("plist", plist);
		request.setAttribute("unit", unit);
		
		
		return "view/3.priceofpetro.jsp";
	}
}
