package com.bit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletContext")
public class ServletContext extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletContext() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");
		String userId = getServletContext().getInitParameter("userId");
		String userPwd = getServletContext().getInitParameter("userPwd");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html></html><body>");
		out.println("아이디 : " + userId );
		out.println("비밀번호 : " + userPwd );
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
