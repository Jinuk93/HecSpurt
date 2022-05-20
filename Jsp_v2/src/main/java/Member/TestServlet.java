package Member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public TestServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO2 dao2 = MemberDAO2.getInstance();
		ArrayList<MemberDTO2> list = dao2.selectMemberAll();
		
		for(MemberDTO2 test : list) {
				System.out.println(test);
		}//toString() 오버라이딩
		
		request.setAttribute("list", list);
	      
	    RequestDispatcher rd = request.getRequestDispatcher("memberSelectAll.jsp");
	    rd.forward(request, response);
	}
}
