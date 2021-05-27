
<%@page import="semi.beans.GenreDao"%>
<%@page import="semi.beans.BookDto"%>
<%@page import="semi.beans.BookDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
BookDao bookDao = new BookDao();
GenreDao genreDao = new GenreDao();

String keyword = request.getParameter("keyword");
int pageNo;//현재 페이지 번호
try{
	pageNo = Integer.parseInt(request.getParameter("pageNo"));
	if(pageNo < 1) {
		throw new Exception();
	}
}
catch(Exception e){
	pageNo = 1;//기본값 1페이지
}

int pageSize;
try{
	pageSize = Integer.parseInt(request.getParameter("pageSize"));
	if(pageSize < 10){
		throw new Exception();
	}
}
catch(Exception e){
	pageSize = 10;//기본값 5개
}

//(2) rownum의 시작번호(startRow)와 종료번호(endRow)를 계산
int startRow = pageNo * pageSize - (pageSize-1);
int endRow = pageNo * pageSize;
List<BookDto> bookList=null;
if(bookDao.publishersearch(keyword,startRow,endRow) == null){
bookList = bookDao.list();

}
else{
	bookList = bookDao.publishersearch(keyword,startRow,endRow);
}
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-1200">


		<div class="row text-right"></div>

		<div class="row text-right">
			<a href="bookInsert.jsp" class="link-btn">상품 등록</a>
		</div>



		<div class="goodsList">
			<table width="100%" class="table table-border table-hover">
				<thead>

				</thead>

				<tbody>
					
					<%
					for (BookDto bookDto : bookList) {
					%>
					<tr class="searchTable">
						<td class="goods_image"><a>
							href="bookDetail.jsp?no=<%=bookDto.getBookNo()%>"> <img
								src="<%=bookDto.getBookImage()%>">
						</a></td>
						<td><span class="searchTitle"><a>
								href="bookDetail.jsp?no=<%=bookDto.getBookNo()%>"> <%=bookDto.getBookTitle()%></span>
							<br> <span class="searchAuthor"></a>
								href="bookSearch.jsp?keyword=<%=bookDto.getBookAuthor()%>">
									<%=bookDto.getBookAuthor()%></span> <br> <span>
							class="searchPrice"><%=bookDto.getBookPrice()%>원</span> <br>
							<span class="searcDiscount"><%=bookDto.getBookDiscount()%>원</span>
							<br> <span class="searchPublisher"><a>
								href="bookSearch.jsp?keyword=<%=bookDto.getBookPublisher()%>">
									<%=bookDto.getBookPublisher()%></a></span> <br>
									 <span class="searchPubdate"><%=bookDto.getBookPubDate()%></span> 
									 <br>
							<span class="searchGenre"><%=genreDao.get(bookDto.getBookGenreNo()).getGenreName()%></span>
						</td>
						<td>
							<button>
								<a href="바로구매로가는 주소">바로구매</a>
							</button>
							<button>
								<a href="장바구니로가는 주소">장바구니</a>
							</button>
						</td>
					</tr>
					
										<%}%>
				
				</tbody>
			</table>
		</div>
</body>
</html>