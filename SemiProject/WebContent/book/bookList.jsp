
<%@page import="semi.beans.GenreDto"%>
<%@page import="semi.beans.GenreDao"%>
<%@page import="semi.beans.BookDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   String root = request.getContextPath();
   BookDao bookdao = new BookDao();
   List<BookDto> bookList =bookdao.list(1);
%>
    <link rel="stylesheet" type="text/css" href="<%= root%>/css/list.css">
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container-1200 book-list">
   <%for(BookDto bookDto : bookList){ %>
   <div class="book-item align-column">
<!--    <a href="/bookDetail.jsp?"> -->
		<a href="#">
      <img class="book-img" src="<%=bookDto.getBookImage()%>">
      <span><%=bookDto.getBookTitle() %></span>
   </a>
   </div>   
   <%} %>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>