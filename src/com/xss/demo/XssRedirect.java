package com.xss.demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tungmr.dao.JDBCConnection;

@WebServlet(urlPatterns = {"/tungmr"})
public class XssRedirect extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		resp.setContentType("text/html");
		PrintWriter printWriter = resp.getWriter();
		
		
		printWriter.println("<h1>HACKED BY TUNGMR</h1>");
		
		StringBuffer url = req.getRequestURL();
		
		String param = req.getQueryString();
		
		System.out.println("url: "+ url +"/?"+ param);
		
		printWriter.close();
	}
}
