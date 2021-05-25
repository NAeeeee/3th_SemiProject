package semi.beans;

import java.sql.Date;

public class BookDto {

	private int bookNo;
	private String bookName;
	private String bookWriter;
	private String bookPublisher;
	private String bookGenre;
	private String bookNation;
	private int bookPrice;
	private String bookInfo;
	private String bookImg;
	private String bookTable;
	private Date bookStart;
	
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookWriter() {
		return bookWriter;
	}
	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}
	public String getBookPublisher() {
		return bookPublisher;
	}
	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}
	public String getBookGenre() {
		return bookGenre;
	}
	public void setBookGenre(String bookGenre) {
		this.bookGenre = bookGenre;
	}
	public String getBookNation() {
		return bookNation;
	}
	public void setBookNation(String bookNation) {
		this.bookNation = bookNation;
	}
	public int getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}
	public String getBookInfo() {
		return bookInfo;
	}
	public void setBookInfo(String bookInfo) {
		this.bookInfo = bookInfo;
	}
	public String getBookImg() {
		return bookImg;
	}
	public void setBookImg(String bookImg) {
		this.bookImg = bookImg;
	}
	public String getBookTable() {
		return bookTable;
	}
	public void setBookTable(String bookTable) {
		this.bookTable = bookTable;
	}
	public Date getBookStart() {
		return bookStart;
	}
	public void setBookStart(Date bookStart) {
		this.bookStart = bookStart;
	}
	public BookDto() {
		super();
	}
	
}