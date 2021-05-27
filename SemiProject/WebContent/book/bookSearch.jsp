 <%@page import="semi.beans.GenreDao"%>
<%@page import="semi.beans.BookDto"%> 
 <%@page import="semi.beans.BookDao"%> 
 <%@page import="java.util.List"%> 
 <%@ page language="java" contentType="text/html; charset=UTF-8" 
     pageEncoding="UTF-8"%> 

<% 
 
 	String keyword = request.getParameter("keyword");
	
 	BookDao bookDao = new BookDao();
 	GenreDao genreDao = new GenreDao();
 	
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
		if(pageSize < 5){
			throw new Exception();
		}
	}
	catch(Exception e){
		pageSize = 5;//기본값 5개
	}
	
	//(2) rownum의 시작번호(startRow)와 종료번호(endRow)를 계산
	int startRow = pageNo * pageSize - (pageSize-1);
	int endRow = pageNo * pageSize;
 	
 	
	List<BookDto> bookList;
	List<BookDto> bookList2=null;
	List<BookDto> bookList3=null;
 	if(bookDao.titlesearch(keyword,startRow,endRow) == null){
		bookList = bookDao.list();
		
 	}
	else{
 		bookList = bookDao.titlesearch(keyword,startRow,endRow);
 		bookList2= bookDao.authorsearch(keyword,startRow,endRow);
 		bookList3= bookDao.publishersearch(keyword,startRow,endRow);
	
	}
 	String root = request.getContextPath();

 	
 	boolean isSearch =keyword != null && !keyword.trim().equals("");
	
	/////////////////////////////////////////////////////////////////////////////
	//	페이지 번호를 이용한 계산 과정
	/////////////////////////////////////////////////////////////////////////////
	//(1) 페이지 번호는 있을 수도, 없을 수도 있다.
	//	- 있으면 해당 페이지 번호에 맞게 조회, 없으면 1페이지를 조회
	
	
	

	
	/////////////////////////////////////////////////////////////////////
	// 페이지 네비게이션 영역 계산
	/////////////////////////////////////////////////////////////////////
	// = 하단에 표시되는 숫자 링크의 범위를 페이지번호를 기준으로 계산하여 설정
	// = 하단 네비게이션 숫자는 startBlock 부터 endBlock 까지 출력
	// = (주의사항) 게시글 개수를 구해서 마지막 블록 번호를 넘어가지 않도록 처리
	
// 	int count;
// 	if(isSearch){
// 		count = boardDao.getCount(type, keyword); 
// 	}
// 	else{
// 		count = boardDao.getCount();
// 	}
// 	int blockSize = 10;
// 	int lastBlock = (count + pageSize - 1) / pageSize;
// // 	int lastBlock = (count - 1) / pageSize + 1;
// 	int startBlock = (pageNo - 1) / blockSize * blockSize + 1;
// 	int endBlock = startBlock + blockSize - 1;
	
// 	if(endBlock > lastBlock){//범위를 벗어나면
// 		endBlock = lastBlock;//범위를 수정
// 	}

 	
 	
%>
  <link rel="stylesheet" type="text/css" href="<%= root%>/css/search.css">
   <link rel="stylesheet" type="text/css" href="<%= root%>/css/common.css">



<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container-1200">

	
	<div class="row text-right">
		
	</div>
	
	<div class="row text-right">
		<a href="bookInsert.jsp" class="link-btn">상품 등록</a>
	</div>
	
	
	
	<div class="goodsList">
		<table width="100%" class="table table-border table-hover">
			<thead>
			
			</thead>
			
			<tbody>
			<%if(bookList !=null) { %>
				<%for(BookDto bookDto : bookList){ %>
			<tr class="searchTable">
			<td class="goods_image">
			<a href="bookDetail.jsp?no=<%=bookDto.getBookNo()%>">
					<img src="<%=bookDto.getBookImage()%>">
						</a>
			</td>
			<td><span class="searchTitle"><a href="bookDetail.jsp?no=<%=bookDto.getBookNo()%>">
			<%=bookDto.getBookTitle()%></span>
			<br>
			<span class="searchAuthor"><a href="bookSearch.jsp?keyword=<%=bookDto.getBookAuthor()%>">
			<%=bookDto.getBookAuthor()%></span>
			<br>
			<span class="searchPrice"><%=bookDto.getBookPrice()%>원</span> 
			<br>
			<span class="searcDiscount"><%=bookDto.getBookDiscount()%>원</span>
			<br>
			<span class="searchPublisher"><a href="bookSearch.jsp?keyword=<%=bookDto.getBookPublisher()%>">
			<%=bookDto.getBookPublisher()%></span>
			<br>
			<span class="searchPubdate" ><%=bookDto.getBookPubDate()%></span>
			<br>
			<span  class="searchGenre"><%=genreDao.get(bookDto.getBookGenreNo()).getGenreName()%></span>
			</td>
			<td>
			<button><a href="바로구매로가는 주소">바로구매</a></button>
			<button><a href="장바구니로가는 주소">장바구니</a></button>
			
			</td>
			</tr>	

			<%} %>

	</div>
<div class="row">
<button><a href="bookTitleSearch.jsp?keyword=<%=keyword%>">더보기</a></button>
</div>			
	<%} %>
			</tbody>
		</table>



<div class="row">
		<table class="table table-border table-hover">
			
			
			<tbody>
			<%if(bookList2 !=null) { %>
				<%for(BookDto bookDto : bookList2){ %>
						<tr class="searchTable">
			<td class="goods_image">
			<a href="bookDetail.jsp?no=<%=bookDto.getBookNo()%>">
					<img src="<%=bookDto.getBookImage()%>">
						</a>
			</td>
			<td><span class="searchTitle"><a href="bookDetail.jsp?no=<%=bookDto.getBookNo()%>">
			<%=bookDto.getBookTitle()%></span>
			<br>
			<span class="searchAuthor"><a href="bookSearch.jsp?keyword=<%=bookDto.getBookAuthor()%>">
			<%=bookDto.getBookAuthor()%></span>
			<br>
			<span class="searchPrice"><%=bookDto.getBookPrice()%>원</span> 
			<br>
			<span class="searcDiscount"><%=bookDto.getBookDiscount()%>원</span>
			<br>
			<span class="searchPublisher"><a href="bookSearch.jsp?keyword=<%=bookDto.getBookPublisher()%>">
			<%=bookDto.getBookPublisher()%></span>
			<br>
			<span class="searchPubdate" ><%=bookDto.getBookPubDate()%></span>
			<br>
			<span  class="searchGenre"><%=genreDao.get(bookDto.getBookGenreNo()).getGenreName()%></span>
			</td>
			<td>
			<button><a href="바로구매로가는 주소">바로구매</a></button>
			<button><a href="장바구니로가는 주소">장바구니</a></button>
			</td>
			</tr>	
			<%} %>
			
			</tbody>
		</table>
	</div>
	<div class="row">
<button><a href="bookAuthorSearch.jsp?keyword=<%=keyword%>">더보기</a></button>
</div>
		<%} %>
<div class="row">
		<table class="table table-border table-hover">
			
			
			<tbody>
			<%if(bookList3 !=null) { %>
				<%for(BookDto bookDto : bookList3){ %>
			<tr class="searchTable">
			<td class="goods_image">
			<a href="bookDetail.jsp?no=<%=bookDto.getBookNo()%>">
					<img src="<%=bookDto.getBookImage()%>">
						</a>
			</td>
			<td><span class="searchTitle"><a href="bookDetail.jsp?no=<%=bookDto.getBookNo()%>">
			<%=bookDto.getBookTitle()%></span>
			<br>
			<span class="searchAuthor"><a href="bookSearch.jsp?keyword=<%=bookDto.getBookAuthor()%>">
			<%=bookDto.getBookAuthor()%></span>
			<br>
			<span class="searchPrice"><%=bookDto.getBookPrice()%>원</span> 
			<br>
			<span class="searcDiscount"><%=bookDto.getBookDiscount()%>원</span>
			<br>
			<span class="searchPublisher"><a href="bookSearch.jsp?keyword=<%=bookDto.getBookPublisher()%>">
			<%=bookDto.getBookPublisher()%></span>
			<br>
			<span class="searchPubdate" ><%=bookDto.getBookPubDate()%></span>
			<br>
			<span  class="searchGenre"><%=genreDao.get(bookDto.getBookGenreNo()).getGenreName()%></span>
			</td>
			<td>
			<button><a href="바로구매로가는 주소">바로구매</a></button>
			<button><a href="장바구니로가는 주소">장바구니</a></button>
			</td>
			</tr>	
			<%} %>
				
			</tbody>
		</table>
	</div>
	<div class="row">
<button><a href="bookPublisherSearch.jsp?keyword=<%=keyword%>">더보기</a></button>
</div>
		<%} %>
	
	<div class="row text-right">
		<a href="bookInsert.jsp" class="link-btn">책 등록</a>
	</div>
	
	<div class="row">
	
	
	
</div>
		
<jsp:include page="/template/footer.jsp"></jsp:include>