package com.bit.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/portal")
public class SendRedirectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SendRedirectServlet() {
        super();

    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("site");
		if(param.equals("naver"))
			response.sendRedirect("http://www.naver.com");
		else if(param.equals("google"))
			response.sendRedirect("http://www.google.com");
	}
}
