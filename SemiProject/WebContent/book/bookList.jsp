<%@page import="semi.beans.BookDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
	BookDao bookDao=new BookDao();
	List<BookDto> bookList=bookDao.list();
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container-1200">

   <div class="row text-title text-center">
      <h1 class="site-color-red">국내 도서</h1>
   </div>
   <div class="container-700 align-row sub-nav">
   	<ul class="ul-row container-center">
   		<li><a href="#" class="change-text">ALL</a></li>
   		<li><a href="#" class="change-text">어린이</a></li>
   		<li><a href="#" class="change-text">소설/시/희곡</a></li>
   		<li><a href="#" class="change-text">에세이</a></li>
   		<li><a href="#" class="change-text">인문학</a></li>
   		<li><a href="#" class="change-text">사회과학</a></li>
   		<li><a href="#" class="change-text">경제경영</a></li>
   	</ul>
   </div>
   <div class="container-1200 container-center">
   
	   <h2 class="sub-nav" style="margin-left:180px ;">실시간 베스트셀러</h2>
	  
	   <div class="row text-center">
	     
	      <ul class="ul-row">
	         <li><a href="#"><img src="<%=root%>/image/left-arrow.png" class="arrow"></a></li>
	         <li>
	         	<a href="#" ><img src="https://image.aladin.co.kr/product/27131/86/cover500/8901250101_1.jpg" class="ranking-img"></a>
		        <div>느릴마을 이야기</div>
		        <div>서지연</div>
		        <div>10800</div>
	         </li>
	         <li>
	         	<a href="#" ><img src="https://image.aladin.co.kr/product/27131/86/cover500/8901250101_1.jpg" class="ranking-img"></a>
		        <div>느릴마을 이야기</div>
		        <div>서지연</div>
		        <div>10800</div>
	         </li>
	         <li>
	         	<a href="#" ><img src="https://image.aladin.co.kr/product/27131/86/cover500/8901250101_1.jpg" class="ranking-img"></a>
		        <div>느릴마을 이야기</div>
		        <div>서지연</div>
		        <div>10800</div>
	         </li>
	         <li>
	         	<a href="#" ><img src="https://image.aladin.co.kr/product/27131/86/cover500/8901250101_1.jpg" class="ranking-img"></a>
		        <div>느릴마을 이야기</div>
		        <div>서지연</div>
		        <div>10800</div>
	         </li>
	         <li>
	         	<a href="#" ><img src="https://image.aladin.co.kr/product/27131/86/cover500/8901250101_1.jpg" class="ranking-img"></a>
		        <div>느릴마을 이야기</div>
		        <div>서지연</div>
		        <div>10800</div>
	         </li>
	         <li><a href="#"><img src="<%=root%>/image/right-arrow.png" class="arrow"></a></li>
		</ul>
	      
	   </div>
    </div>
   
   <div class="product-box ">
   	<div class="box">
	   	<div class="item-wrap">
	      <ul class="item align-row ">
	      	<%for(BookDto bookDto:bookList){ %>
		      	<li class="row">
		      		<div >
		      			<a href="bookDetail.jsp?bookNo=<%=bookDto.getBookNo()%>"><img src="<%=bookDto.getBookImg()%>" class="item-image"></a>
	
		      		</div>
		      		<div class="item-content">
		      			<div><a href="#"><%=bookDto.getBookName() %></a></div>
		      			<div><%=bookDto.getBookWriter() %></div>
		      			<div><%=bookDto.getBookPrice() %></div>
		      		</div>
		      	</li>
		      	 <%} %>
	      </ul>
	   </div>
   </div>
   </div>
   
   
   <div class="row text-right">
      <a href="bookInsert.jsp" class="link-btn">책 등록</a>
   </div>
   
   <div class="row text-center">
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