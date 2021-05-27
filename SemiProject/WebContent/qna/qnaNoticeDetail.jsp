<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<style>
.qna {
	margin: 0px;
	width: 1200px;
}

.qna>.title {
	margin: 50px 0px;
	font-family: 'Noto-B';
	font-size: 40px;
	color: #FF8E99;
	text-align: center;
}

.qna>.subtitle {
	margin: 30px 0px;
	font-family: 'Noto-B';
	font-size: 30px;
	color: black;
	text-align: center;
}

.qna>.tabmenu-black {
	margin: 20px auto;
	width: 1000px;
 	overflow: hidden; 
}

.tabmenu-black :hover, .tabmenu-black .on {
	position: relative;
	color: #fff;
	border-color: #ff7d9e;
	background: #FF8E99;
}

.tabmenu-black>a {
	float: left;
	width: 25%;
	height: 67px;
	font: inherit;
	background-color: #39373a;
	font-size: 20px;
	text-align: center;
	box-sizing: border-box;
	color: #fff;
	line-height: 67px;
}

.qna-notice-row{
	width: 1000px;
	min-height: 500px;
	margin: 10px auto;
}

.notice-title{
	width: 1000px;
	height: 50px;
	line-height: 50px;
	border-bottom: solid 2px #000;
	padding: 0 90px 15px 0;
	position: relative;
}

.notice-title> span{
	right: 0;
	position: absolute;
}

.notice-content{
	width: 1000px;
	padding: 10px 0;
	position: relative;
}

.qna-notice-prev{
	width: 1000px;
	padding: 10px 0;
	border-bottom: solid 2px #d2d2d2;
	border-top: solid 2px #d2d2d2;
}
.qna-notice-next{
	width: 1000px;
	padding: 10px 0;
	border-bottom: solid 2px #d2d2d2;
}

.notice-bottom{
	width: 1000px;
	height: 50px;
	margin: 20px 0;
	text-align: right;
}

.notice-list{
	width: 120px;
	height: 30px;
	background-color: black;
	color: white;
	line-height: 30px;
	border-style: none;
	display: inline-block;
	font-size: 20px;
	text-align: center;
}

.notice-list:hover{
	background-color: #646464;
}

</style>
<div class="qna">

	<h2 class="title">고객센터</h2>
	
	<div class="tabmenu-black">
		<a href="qnaList.jsp"> 
			<span>고객의 소리</span>
		</a> 
		<a href="qnaInsert.jsp"> 
			<span>1:1 문의 등록</span>
		</a> 
		<a href="qnaMyList.jsp"> 
			<span>1:1 문의 확인</span>
		</a> 
		<a class="on" href="qnaNotice.jsp"> 
			<span>공지사항</span>
		</a>
	</div>
	
	<h2 class="subtitle">NOTICE</h2>
	
	<div class="qna-notice-row">
		<div class="notice-title">
			<strong>제목</strong>
			<span>작성시간</span>
		</div>
		
		<div class="notice-content">
			<pre>안녕하세요!

기존보다 더 많은 혜택으로
쇼핑을 즐겨보세요~♥

아래 링크로 확인 부탁드립니다 :)
▶ https://bit.ly/3561wsF

지금 바로 다양한 회원 혜택 누리세요!

감사합니다.</pre>
		</div>
		
		<div class="qna-notice-prev">
			<a href="#">이전글	|</a> 
<%-- 			<%if(nextBoardDto == null){%> --%>
<!-- 			다음글이 없습니다. -->
<%-- 			<%}else{ %> --%>
<%-- 			<a href="boardDetail.jsp?boardNo=<%=nextBoardDto.getBoardNo()%>"> --%>
<%-- 				<%=nextBoardDto.getBoardTitle()%> --%>
<!-- 			</a> -->
<%-- 			<%} %> --%>
		</div>
		<div class="qna-notice-next">
			<a href="#">다음글	|</a> 
<%-- 			<%if(prevBoardDto == null){%> --%>
<!-- 			이전글이 없습니다. -->
<%-- 			<%}else{ %> --%>
<%-- 			<a href="boardDetail.jsp?boardNo=<%=prevBoardDto.getBoardNo()%>"> --%>
<%-- 				<%=prevBoardDto.getBoardTitle()%> --%>
<!-- 			</a> -->
<%-- 			<%} %> --%>
		</div>
		
		<div class="notice-bottom">
			<a class="notice-list" href="qnaNotice.jsp">목록</a>
		</div>
		
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
