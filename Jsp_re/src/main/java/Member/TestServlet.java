package Member;

import java.io.IOException;
import java.util.ArrayList;

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
		ArrayList<MemberDTO> list = dao2.selectMemberALL();
		for(MemberDTO2 dto2 : list) 
				System.out.println(dto2); //toString() 오버라이딩
	}
}
