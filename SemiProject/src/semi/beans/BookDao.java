package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import semi.beans.JdbcUtils;
import semi.beans.BookDto;

public class BookDao {

	// 등록 기능
	public void registBook(BookDto bookDto) throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "insert into book values(book_seq.nextval,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, bookDto.getBookTitle());
		ps.setString(2, bookDto.getBookImage());
		ps.setString(3, bookDto.getBookAutor());
		ps.setInt(4, bookDto.getBookPrice());
		ps.setInt(5, bookDto.getBookDiscount());
		ps.setString(6, bookDto.getBookPublisher());
		ps.setString(7, bookDto.getBookDescription());
		ps.setString(8, bookDto.getBookPubdate());
		ps.setInt(9, bookDto.getBookGenre());

		ps.execute();

		con.close();
	}

	public BookDto get(int no) throws Exception {
		Connection con = JdbcUtils.getConnection();
		;

		String sql = "select * from book where book_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		ResultSet rs = ps.executeQuery();

		BookDto bookDto;
		if (rs.next()) {
			bookDto = new BookDto();

			bookDto.setBookNo(rs.getInt("book_no"));
			bookDto.setBookTitle(rs.getString("book_title"));
			bookDto.setBookImage(rs.getString("book_image"));
			bookDto.setBookAutor(rs.getString("book_autor"));
			bookDto.setBookPrice(rs.getInt("book_price"));
			bookDto.setBookDiscount(rs.getInt("book_discount"));
			bookDto.setBookPublisher(rs.getString("book_publisher"));
			bookDto.setBookDescription(rs.getString("book_description"));
			bookDto.setBookPubdate(rs.getString("book_pubdate"));
			bookDto.setBookGenre(rs.getInt("book_genre"));

		} else {
			bookDto = null;
		}

		con.close();

		return bookDto;
	}

	// 목록 기능
	public List<BookDto> list() throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from book order by book_no asc";

		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		List<BookDto> bookList = new ArrayList<>();
		while (rs.next()) {
			BookDto bookDto = new BookDto();
			bookDto.setBookNo(rs.getInt("book_no"));
			bookDto.setBookTitle(rs.getString("book_title"));
			bookDto.setBookImage(rs.getString("book_image"));
			bookDto.setBookAutor(rs.getString("book_autor"));
			bookDto.setBookPrice(rs.getInt("book_price"));
			bookDto.setBookDiscount(rs.getInt("book_discount"));
			bookDto.setBookPublisher(rs.getString("book_publisher"));
			bookDto.setBookDescription(rs.getString("book_description"));
			bookDto.setBookPubdate(rs.getString("book_pubdate"));
			bookDto.setBookGenre(rs.getInt("book_genre"));

			bookList.add(bookDto);
		}

		con.close();

		return bookList;
	}

	public boolean delete(int no) throws Exception {
		Connection con = JdbcUtils.getConnection();
		;

		String sql = "delete book where book_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		int count = ps.executeUpdate();

		con.close();

		return count > 0;
	}

	// 정보 수정 기능
	public boolean edit(BookDto bookDto) throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "update book set book_title=?, book_image=?,book_autor,book_price,"
				+ "book_discount,book_publisher=?,book_description=?,book_pubdate=?,book_genre=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bookDto.getBookTitle());
		ps.setString(2, bookDto.getBookImage());
		ps.setString(3, bookDto.getBookAutor());
		ps.setInt(4, bookDto.getBookPrice());
		ps.setInt(5, bookDto.getBookDiscount());
		ps.setString(6, bookDto.getBookPublisher());
		ps.setString(8, bookDto.getBookDescription());
		ps.setString(9, bookDto.getBookPubdate());
		ps.setInt(10, bookDto.getBookGenre());
		int count = ps.executeUpdate();

		con.close();
		return count > 0;
	}

	public BookDto search(String keyword) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from book where book_title =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,keyword);
		ResultSet rs = ps.executeQuery();
				
		BookDto bookDto;
		if(rs.next()) {
			bookDto = new BookDto();
			ps.setString(1, bookDto.getBookTitle());
			ps.setString(2, bookDto.getBookImage());
			ps.setString(3, bookDto.getBookAutor());
			ps.setInt(4, bookDto.getBookPrice());
			ps.setInt(5, bookDto.getBookDiscount());
			ps.setString(6, bookDto.getBookPublisher());
			ps.setString(8, bookDto.getBookDescription());
			ps.setString(9, bookDto.getBookPubdate());
			ps.setInt(10, bookDto.getBookGenre());
			
		}
		else {
			bookDto=null;
		}
		con.close();
		return bookDto;
 	}
	
}
