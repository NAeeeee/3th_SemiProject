
<%@page import="semi.beans.BookDto"%>
<%@page import="semi.beans.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	BookDao bookDao = new BookDao();
	BookDto bookDto = bookDao.get(no);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container-700">
	<div class="row">
		<h1>채 상세정보</h1>
	</div>
	
	<div class="row">
		<table class="table table-border table-hover">
			<tr>
				<th width="25%">책번호</th>
				<td><%=bookDto.getBookNo()%></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><%=bookDto.getBookTitle()%></td>
			</tr>
		
			<tr>
				<th>책이미지</th>
				<td><%=bookDto.getBookImage()%></td>
			</tr>
		    	<tr>
				<th>저자</th>
				<td><%=bookDto.getBookAutor()%></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><%=bookDto.getBookPrice()%></td>
			</tr>
			<tr>
				<th>할인가격</th>
				<td><%=bookDto.getBookDiscount()%></td>
			</tr>
			<tr>
				<th>출판사</th>
				<td><%=bookDto.getBookPublisher()%></td>
			</tr>
				
			<tr>
				<th>???</th>
				<td><%=bookDto.getBookDescription()%></td>
			</tr>		
			<tr>
				<th>출간일</th>
				<td><%=bookDto.getBookPubdate()%></td>
			</tr>
				
				
			<tr>
				<th>장르</th>
				<td><%=bookDto.getBookGenre()%></td>
			</tr>
		    	
		</table>
	</div>
	
	<div class="row text-right">
		<a href="bookEdit.jsp?no=<%=no%>" class="link-btn">수정</a>
		<a href="bookDelete.kh?no=<%=no%>" class="link-btn">삭제</a>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
    