package semi.servlet.book;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BookDao;
import semi.beans.BookDto;
@WebServlet(urlPatterns = "/book/list.kh")
public class BookListServlet extends HttpServlet{
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		BookDao bookDao = new BookDao();
		List<BookDto> bookList = bookDao.list();
		
		//출력
		resp.setCharacterEncoding("MS949");
		
		for(BookDto bookDto : bookList) {
			resp.getWriter().println(bookDto);
		}
	}
	catch(Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
}
}