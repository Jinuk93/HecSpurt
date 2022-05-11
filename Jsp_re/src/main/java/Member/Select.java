package Member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Select")
public class Select extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");

        MemberDAO2 dao2 = MemberDAO2.getInstance();
        MemberDTO2 member = dao2.selectMember(userId);

        request.setAttribute("member", member);

        RequestDispatcher rd = request.getRequestDispatcher("searchResult.jsp");
        rd.forward(request, response);
    }
}
