package semi.beans;

import java.sql.Date;

public class BookDto {

private int bookNo;
private String bookTitle;
private String bookImage;
private String bookAutor;
private int bookPrice;
private int bookDiscount;
private String bookPublisher;
private String bookDescription;
private String bookPubdate;
private int bookGenre;
public int getBookNo() {
	return bookNo;
}
public void setBookPubdate(String bookPubdate) {
	this.bookPubdate = bookPubdate;
}
public void setBookNo(int bookNo) {
	this.bookNo = bookNo;
}
public String getBookTitle() {
	return bookTitle;
}
public void setBookTitle(String bookTitle) {
	this.bookTitle = bookTitle;
}
public String getBookImage() {
	return bookImage;
}
public void setBookImage(String bookImage) {
	this.bookImage = bookImage;
}
public String getBookAutor() {
	return bookAutor;
}
public void setBookAutor(String bookAutor) {
	this.bookAutor = bookAutor;
}
public int getBookPrice() {
	return bookPrice;
}
public void setBookPrice(int bookPrice) {
	this.bookPrice = bookPrice;
}
public int getBookDiscount() {
	return bookDiscount;
}
public void setBookDiscount(int bookDiscount) {
	this.bookDiscount = bookDiscount;
}
public String getBookPublisher() {
	return bookPublisher;
}
public void setBookPublisher(String bookPublisher) {
	this.bookPublisher = bookPublisher;
}
public String getBookDescription() {
	return bookDescription;
}
public void setBookDescription(String bookDescription) {
	this.bookDescription = bookDescription;
}


public int getBookGenre() {
	return bookGenre;
}
public void setBookGenre(int bookGenre) {
	this.bookGenre = bookGenre;
}
public BookDto() {
	super();
}
public String getBookPubdate() {
	return bookPubdate;
}


}