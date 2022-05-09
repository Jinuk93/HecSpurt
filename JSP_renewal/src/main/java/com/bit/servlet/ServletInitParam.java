package com.bit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns={"/initP"}
,initParams = {@WebInitParam(name="userId", value="myId")
,@WebInitParam(name="userPwd", value="myPwd")})

public class ServletInitParam extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");
		String userId = getInitParameter("userId");
		String userPwd = getInitParameter("userPwd");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html><head></head><body>");
		out.println("아 이 디 : " + userId + "<br/>");
		out.println("비밀 번호 : " + userPwd + "<br/>");
		out.close();
	}


}
