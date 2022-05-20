package Member.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;


/*@WebFilter("/FilterOne")*/
public class FilterOne extends HttpFilter implements Filter {

	public void destroy() {
	System.out.println("destroy() 호출...One");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("desFilter() 호출 전...One");
		chain.doFilter(request, response);
		System.out.println("deFilter() 호출 후...One");
	}

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("init() 호출...One");
	}
}
