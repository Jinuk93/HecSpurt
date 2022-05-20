package com.bit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/dispatcher1")
public class DispatcherServle1 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/*
		 * response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
		 * response.getWriter(); out.print("<h3>Dispatcher Test1 수행결과<h3>");
		 * RequestDispatcher rd =
		 * getServletContext().getRequestDispatcher("/dispatcher2"); 
		 * rd.forward(request,response); forward로 dispatcher2만 출력된다 
		 * out.close();
		  */
		response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
		response.getWriter(); out.print("<h3>Dispatcher Test1 수행결과<h3>");
		RequestDispatcher rd =
		getServletContext().getRequestDispatcher("/dispatcher2"); 
		rd.include(request,response); //include는 둘 다 출력된다
		out.close();
	}
}
