package semi.servlet.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BookDao;
import semi.beans.BookDto;
@WebServlet(urlPatterns = "/book/detail.kh")
public class BookDetailServlet extends HttpServlet {
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		int no = Integer.parseInt(req.getParameter("no"));
		
		
		BookDao bookDao = new BookDao();
		BookDto bookDto = bookDao.get(no);
		
		//출력
		
		if(bookDto==null) {
			resp.getWriter().println("해당번호의 상품이 없습니다");
		}
		else {
			resp.getWriter().println(bookDto);
		}
		
	}
	catch(Exception e){
		e.printStackTrace();
		resp.sendError(500);
		
	}
}
}
