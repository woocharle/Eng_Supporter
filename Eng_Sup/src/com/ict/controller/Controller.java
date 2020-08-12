package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.model.Command;
import com.ict.model.Login0_cmd;
import com.ict.model.Main_cmd;
import com.ict.model.Padmin_cmd;
import com.ict.model.Pdelete_cmd;
import com.ict.model.Petro_cmd;
import com.ict.model.Ponepick_cmd;
import com.ict.model.Pupdate_cmd;
import com.ict.model.Pwrite_cmd;
import com.ict.model.UnitCvt1_cmd;
import com.ict.model.UnitCvt2_cmd;
import com.ict.model.UnitCvt3_cmd;
import com.ict.model.UnitCvt_cmd;


@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		Command comm = null; 
		
		String cmd = request.getParameter("cmd");
		
		switch (cmd) {
			//for user
			case "main": comm = new Main_cmd(); break;
			case "login0": comm = new Login0_cmd(); break;
			case "unit": comm = new UnitCvt_cmd(); break;
			case "unit1": comm = new UnitCvt1_cmd(); break;
			case "unit2": comm = new UnitCvt2_cmd(); break;
			case "unit3": comm = new UnitCvt3_cmd(); break;
			case "petro": comm = new Petro_cmd(); break;
			
			//petro for admin 
			case "petro_list": comm = new Padmin_cmd(); break;
			case "onepick": comm = new Ponepick_cmd(); break;
			case "pwrite": comm = new Pwrite_cmd(); break;
			case "pupdate": comm = new Pupdate_cmd(); break;
			case "pdelete": comm = new Pdelete_cmd(); break;

		}
		
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
				
		
	}

}
