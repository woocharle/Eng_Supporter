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
			case "main": comm = new Main_cmd(); break;
			case "login0": comm = new Login0_cmd(); break;
			case "unit": comm = new UnitCvt_cmd(); break;
			
		}
		
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
				
		
	}

}
