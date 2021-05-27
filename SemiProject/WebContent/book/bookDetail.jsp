
<%@page import="semi.beans.BookDto"%>
<%@page import="semi.beans.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 	int no = Integer.parseInt(request.getParameter("no"));
	int no = 1500;
	BookDao bookDao = new BookDao();
	BookDto bookDto = bookDao.get(no);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container-700">
	<div class="row">
		
		
		
		<hr>
	</div>
	
	<div class="topWrap">
		<div class="topLeft">
			<div class="detailImgArea">
				<div class="detailImg">
			<img src="https://bookthumb-phinf.pstatic.net/cover/081/995/08199582.jpg?type=m1&udate=20200305">
			</div>
			</div>
		</div>
	</div>
	<div class="topright">
		<div class="infotop">
		<div class="titleare">
			<h2><%=bookDto.getBookTitle()%></h2>
		</div>
		<span class="infoarea">
				<span class="auth"><%=bookDto.getBookAuthor()%></span>
		</span>
		<em class="divi">|</em>
			<span class="pub"><%=bookDto.getBookPublisher()%></span>
		<em class="divi">|</em>
			<span class="date"><%=bookDto.getBookPubDate()%></span>
		</div>
	<div class="infobot">
		<div class="gd_infoTb">
			<table>
			<colgroup>
            <col width="110">
            <col width="*">
        	</colgroup>
			<caption>상품 가격정보</caption>
			<tbody></tbody>
			
			</table>
	
	
	
	
	
	</div>
	
	
	
	
	
	</div>
<!-- 		<h1>책 상세정보</h1> -->
<%-- 		<%=bookDto.getBookTitle()%> --%>
<!-- 	<div class="row"> -->
<!-- 		<table class="table table-border table-hover"> -->
<!-- 			<tr> -->
<!-- 				<th width="25%">책번호</th> -->
<%-- 				<td><%=bookDto.getBookNo()%></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>상품명</th> -->
<%-- 				<td><%=bookDto.getBookTitle()%></td> --%>
<!-- 			</tr> -->
		
<!-- 			<tr> -->
<!-- 				<th>책이미지</th> -->
<%-- 				<td><%=bookDto.getBookImage()%></td> --%>
<!-- 			</tr> -->
<!-- 		    	<tr> -->
<!-- 				<th>저자</th> -->
<%-- 				<td><%=bookDto.getBookAuthor()%></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>가격</th> -->
<%-- 				<td><%=bookDto.getBookPrice()%></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>할인가격</th> -->
<%-- 				<td><%=bookDto.getBookDiscount()%></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>출판사</th> -->
<%-- 				<td><%=bookDto.getBookPublisher()%></td> --%>
<!-- 			</tr> -->
				
<!-- 			<tr> -->
<!-- 				<th>책소개</th> -->
<%-- 				<td><%=bookDto.getBookDescription()%></td> --%>
<!-- 			</tr>		 -->
<!-- 			<tr> -->
<!-- 				<th>출간일</th> -->
<%-- 				<td><%=bookDto.getBookPubDate()%></td> --%>
<!-- 			</tr> -->
				
				
<!-- 			<tr> -->
<!-- 				<th>장르</th> -->
<%-- 				<td><%=bookDto.getBookGenreNo()%></td> --%>
<!-- 			</tr> -->
		    	
		</table>
	</div>
	
	<div class="row text-right">
		<a href="bookEdit.jsp?no=<%=no%>" class="link-btn">수정</a>
		<a href="bookDelete.kh?no=<%=no%>" class="link-btn">삭제</a>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>