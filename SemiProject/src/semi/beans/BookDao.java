package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import semi.beans.BookDto;

public class BookDao {

	
	//등록 기능
	public void registBook(BookDto bookDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql="insert into book values(book_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate)";
		 PreparedStatement ps = con.prepareStatement(sql);
	      
         ps.setString(1, bookDto.getBookName());
         ps.setString(2, bookDto.getBookWriter());
         ps.setString(3, bookDto.getBookPublisher());
         ps.setString(4, bookDto.getBookGenre());
         ps.setString(5,bookDto.getBookNation());
         ps.setInt(6,bookDto.getBookPrice());
         ps.setString(7, bookDto.getBookInfo());
         ps.setString(8, bookDto.getBookImg());
         ps.setString(9, bookDto.getBookTable());
        
         ps.execute();
         
         con.close();
	}
	//목록 기능
	public List<BookDto> list() throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql="select * from book order by book_no asc";
		
		PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        List<BookDto> bookList = new ArrayList<>();
        while(rs.next()) {
           BookDto bookDto = new BookDto();
           bookDto.setBookNo(rs.getInt("book_no"));
           bookDto.setBookName(rs.getString("book_name"));
           bookDto.setBookWriter(rs.getString("book_writer"));
           bookDto.setBookPublisher(rs.getString("book_publisher"));
           bookDto.setBookGenre(rs.getString("book_genre"));
           bookDto.setBookNation(rs.getString("book_nation"));
           bookDto.setBookPrice(rs.getInt("book_price"));
           bookDto.setBookInfo(rs.getString("book_info"));
           bookDto.setBookImg(rs.getString("book_img"));
           bookDto.setBookTable(rs.getString("book_table"));
           bookDto.setBookStart(rs.getDate("book_start"));
           
           
           bookList.add(bookDto);
        }
        
        con.close();
        
        return bookList;
	}

}

