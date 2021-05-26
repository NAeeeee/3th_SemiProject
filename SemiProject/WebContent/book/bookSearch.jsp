<%@page import="semi.beans.BookDto"%>
<%@page import="semi.beans.BookDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	BookDao bookDao = new BookDao();
	//List<ProductDto> productList = 목록 또는 검색결과;
	List<BookDto> bookList;
	if(type == null || keyword == null){//목록
		bookList = bookDao.list();
	}
	else{
		bookList = bookDao.search(type, keyword);
	}
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container-900">

	<div class="row">
		<h1>상품 검색</h1>
	</div>
	
	<div class="row text-right">
		<form action="productSearch.jsp">
		
			<fieldset>
				<legend>검색 설정</legend>
				
				<select name="type" class="form-input form-input-inline">
					<option value="name">상품명</option>
					<option value="type">상품분류</option>
				</select>
				<input type="text" name="keyword" class="form-input form-input-inline">
				<input type="submit" value="검색" class="form-btn form-btn-inline form-btn-positive">
			</fieldset>
		
		</form>
	</div>
	
	<div class="row text-right">
		<a href="productInsert.jsp" class="link-btn">상품 등록</a>
	</div>
	
	<div class="row">
		<a class="form-btn form-btn-inline form-btn-normal" href="productSearch.jsp?type=type&keyword=아이스크림">아이스크림</a>
		<a class="form-btn form-btn-inline form-btn-normal" href="productSearch.jsp?type=type&keyword=주류">주류</a>
		<a class="form-btn form-btn-inline form-btn-normal" href="productSearch.jsp?type=type&keyword=사탕">사탕</a>
		<a class="form-btn form-btn-inline form-btn-normal" href="productSearch.jsp?type=type&keyword=과자">과자</a>
	</div>
	
	<div class="row">
		<table class="table table-border table-hover">
			<thead>
				<tr>
					<th>상품번호</th>
					<th>상품명</th>
					<th>상품분류</th>
					<th>판매가</th>
					<th>제조일</th>
					<th>유통기한</th>
					<th>관리</th>
				</tr>
			</thead>
			
			<tbody>
				<%for(ProductDto productDto : productList){ %>
				<tr>
					<!-- 표현식(Expression) : 화면에 자바값을 출력하기 위한 구문 -->
					<td><%=productDto.getNo()%></td>
					<td>
						<a href="productDetail.jsp?no=<%=productDto.getNo()%>">
							<%=productDto.getName()%>
						</a>
					</td>
					<td><%=productDto.getType()%></td>
					<td><%=productDto.getPrice()%></td>
					<td><%=productDto.getMade().substring(0, 10)%></td>
					<td><%=productDto.getExpire().substring(0, 10)%></td>
					<td>
						<a href="productEdit.jsp?no=<%=productDto.getNo()%>" class="form-btn form-btn-inline form-btn-positive">수정</a>
						<a href="productDelete.kh?no=<%=productDto.getNo()%>" class="form-btn form-btn-inline form-btn-negative">삭제</a>
					</td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	
	<div class="row text-right">
		<a href="productInsert.jsp" class="link-btn">상품 등록</a>
	</div>
	
	<div class="row">
		<div class="pagination">
			<a href="#">&lt;</a>
			<a href="#">1</a>
			<a href="#">2</a>
			<a href="#">3</a>
			<a href="#">4</a>
			<a href="#">5</a>
			<a href="#">6</a>
			<a href="#">7</a>
			<a href="#">8</a>
			<a href="#">9</a>
			<a href="#">10</a>
			<a href="#">&gt;</a>
		</div>
	</div>
	
</div>
		
<jsp:include page="/template/footer.jsp"></jsp:include>