package cookie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/BookReg")
public class BookReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BookReg() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Book book = new Book (
				Integer.parseInt(request.getParameter("bookId")),
				request.getParameter("bookName"),
				request.getParameter("publisher"),
				Integer.parseInt(request.getParameter("price"))
				);
		
		//요청 파라미터 추출 -> Book 객체 생성하여 book에 참조
		request.setAttribute("book", book); //요청정보에 속성으로 추가
		RequestDispatcher rd = request.getRequestDispatcher("bookResult.jsp");
		rd.forward(request, response);
		
	}

}
