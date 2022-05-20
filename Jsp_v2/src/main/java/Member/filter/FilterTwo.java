package Member.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*@WebServlet("/FilterTwo")*/
public class FilterTwo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void destroy() {
	System.out.println("destroy() 호출...Two");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("desFilter() 호출 전...Two");
		chain.doFilter(request, response);
		System.out.println("deFilter() 호출 후...Two");
	}

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("init() 호출...Two");
	}
}