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
         
//         ps.setString(1, bookDto.getBookName());
//         ps.setString(2, bookDto.getBookWriter());
//         ps.setString(3, bookDto.getBookPublisher());
//         ps.setString(4, bookDto.getBookGenre());
//         ps.setString(5,bookDto.getBookNation());
//         ps.setInt(6,bookDto.getBookPrice());
//         ps.setString(7, bookDto.getBookInfo());
//         ps.setString(8, bookDto.getBookImg());
//         ps.setString(9, bookDto.getBookTable());
        
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
			bookDto.setBookAuthor(rs.getString("book_author"));
			bookDto.setBookPrice(rs.getInt("book_price"));
			bookDto.setBookDiscount(rs.getInt("book_discount"));
			bookDto.setBookPublisher(rs.getString("book_publisher"));
			bookDto.setBookDescription(rs.getString("book_description"));
			bookDto.setBookPubDate(rs.getDate("book_pubdate"));
			bookDto.setBookGenreNo(rs.getLong("book_genre"));

		} else {
			bookDto = null;
		}

		con.close();

		return bookDto;
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
           bookDto.setBookTitle(rs.getString("book_title"));
           bookDto.setBookImage(rs.getString("book_image"));
           bookDto.setBookAuthor(rs.getString("book_author"));
           bookDto.setBookPublisher(rs.getString("book_publisher"));
           bookDto.setBookDescription(rs.getString("book_description"));
           bookDto.setBookPrice(rs.getInt("book_price"));
           bookDto.setBookDiscount(rs.getInt("book_discount"));
           bookDto.setBookPubDate(rs.getDate("book_pubdate"));
           bookDto.setBookGenreNo(rs.getLong("book_genre"));
           bookList.add(bookDto);
        }
        
        con.close();
        
        return bookList;
	}
	
	
	
	public List<BookDto> genreList(Long genreNo,int num) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql="select * from (  "
				+ "    select tmp.*,rownum rn from "
				+ "        (select * from book where book_genre like '"+genreNo+"%' order by book_no desc"
				+ "    )tmp"
				+ ") where rn between ? and ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, num*20-19);
		ps.setInt(2, num*20);
        ResultSet rs = ps.executeQuery();
        List<BookDto> bookList = new ArrayList<>();
        while(rs.next()) {
           BookDto bookDto = new BookDto();
           bookDto.setBookNo(rs.getInt("book_no"));
           bookDto.setBookTitle(rs.getString("book_title"));
           bookDto.setBookImage(rs.getString("book_image"));
           bookDto.setBookAuthor(rs.getString("book_author"));
           bookDto.setBookPublisher(rs.getString("book_publisher"));
           bookDto.setBookDescription(rs.getString("book_description"));
           bookDto.setBookPrice(rs.getInt("book_price"));
           bookDto.setBookDiscount(rs.getInt("book_discount"));
           bookDto.setBookPubDate(rs.getDate("book_pubdate"));
           bookDto.setBookGenreNo(rs.getLong("book_genre"));
           bookList.add(bookDto);
        }
        
        con.close();
        
        return bookList;
	}
   
   public List<BookDto> list(int num) throws Exception{
      Connection con = JdbcUtils.getConnection();
      String sql="select * from (  "
            + "    select tmp.*,rownum rn from "
            + "        (select * from book order by book_no desc"
            + "    )tmp"
            + ") where rn between ? and ?";
      
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setInt(1, num*20-19);
      ps.setInt(2, num*20);
        ResultSet rs = ps.executeQuery();
        List<BookDto> bookList = new ArrayList<>();
        while(rs.next()) {
           BookDto bookDto = new BookDto();
           bookDto.setBookNo(rs.getInt("book_no"));
           bookDto.setBookTitle(rs.getString("book_title"));
           bookDto.setBookImage(rs.getString("book_image"));
           bookDto.setBookAuthor(rs.getString("book_author"));
           bookDto.setBookPublisher(rs.getString("book_publisher"));
           bookDto.setBookDescription(rs.getString("book_description"));
           bookDto.setBookPrice(rs.getInt("book_price"));
           bookDto.setBookDiscount(rs.getInt("book_discount"));
           bookDto.setBookPubDate(rs.getDate("book_pubdate"));
           bookDto.setBookGenreNo(rs.getLong("book_genre"));
           bookList.add(bookDto);
        }
        
        con.close();
        
        return bookList;
   }
   public List<BookDto> authorsearch(String keyword) throws Exception {
       Connection con = JdbcUtils.getConnection();;
       
       String sql = "select * from book where instr(book_author,?)>0 ";
       
       PreparedStatement ps = con.prepareStatement(sql);
       ps.setString(1, keyword);
       ResultSet rs = ps.executeQuery();
       
       
       List<BookDto> bookList = new ArrayList<>();
       while(rs.next()) {
          BookDto bookDto = new BookDto();
          bookDto.setBookNo(rs.getInt("book_no"));
          bookDto.setBookTitle(rs.getString("book_title"));
          bookDto.setBookAuthor(rs.getString("book_author"));
          bookDto.setBookImage(rs.getString("book_image"));
          bookDto.setBookPrice(rs.getInt("book_price"));
          bookDto.setBookDiscount(rs.getInt("book_discount"));
          bookDto.setBookPublisher(rs.getString("book_publisher"));
          bookDto.setBookDescription(rs.getString("book_description"));
          bookDto.setBookPubDate(rs.getDate("book_pubdate"));
          bookDto.setBookGenreNo(rs.getLong("book_genre"));
          
          bookList.add(bookDto);
       }
       
       con.close();
       
       return bookList;
    }
    
 //출판사 검색
 public List<BookDto> publishersearch(String keyword) throws Exception {
    Connection con = JdbcUtils.getConnection();;
    
    String sql = "select * from book where instr(book_publisher,?)>0 ";
    
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, keyword);
    ResultSet rs = ps.executeQuery();
    
    
    List<BookDto> bookList = new ArrayList<>();
    while(rs.next()) {
       BookDto bookDto = new BookDto();
       bookDto.setBookNo(rs.getInt("book_no"));
       bookDto.setBookTitle(rs.getString("book_title"));
       bookDto.setBookAuthor(rs.getString("book_author"));
       bookDto.setBookImage(rs.getString("book_image"));
       bookDto.setBookPrice(rs.getInt("book_price"));
       bookDto.setBookDiscount(rs.getInt("book_discount"));
       bookDto.setBookPublisher(rs.getString("book_publisher"));
       bookDto.setBookDescription(rs.getString("book_description"));
       bookDto.setBookPubDate(rs.getDate("book_pubdate"));
       bookDto.setBookGenreNo(rs.getLong("book_genre"));
       
       bookList.add(bookDto);
    }
    
    con.close();
    
    return bookList;
 }

public List<BookDto> genreSearch(long no) throws Exception{
	Connection con = JdbcUtils.getConnection();
	String sql="select * from book where book_genre=?";
	PreparedStatement ps = con.prepareStatement(sql);
    ps.setLong(1, no);
    ResultSet rs = ps.executeQuery();
    
    
    List<BookDto> bookList = new ArrayList<>();
    while(rs.next()) {
       BookDto bookDto = new BookDto();
       bookDto.setBookNo(rs.getInt("book_no"));
       bookDto.setBookTitle(rs.getString("book_title"));
       bookDto.setBookAuthor(rs.getString("book_author"));
       bookDto.setBookImage(rs.getString("book_image"));
       bookDto.setBookPrice(rs.getInt("book_price"));
       bookDto.setBookDiscount(rs.getInt("book_discount"));
       bookDto.setBookPublisher(rs.getString("book_publisher"));
       bookDto.setBookDescription(rs.getString("book_description"));
       bookDto.setBookPubDate(rs.getDate("book_pubdate"));
       bookDto.setBookGenreNo(rs.getLong("book_genre"));
       
       bookList.add(bookDto);
    }
    
    con.close();
    
    return bookList;
}
   
}
