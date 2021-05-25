<%@page import="semi.beans.QnaBoardDto"%>
<%@page import="semi.beans.QnaBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int qnaBoardNo = Integer.parseInt(request.getParameter("qnaBoardNo"));	

	QnaBoardDao qnaBoardDao = new QnaBoardDao();
	QnaBoardDto qnaBoardDto = qnaBoardDao.get(qnaBoardNo);
%>

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
	position: relative;
	border-bottom: 2px solid black;
	min-height: 200px;
}

.notice-bottom{
	width: 1000px;
	height: 50px;
	margin: 20px 0;
	text-align: right;
}

.board-list-link{
	width: 150px;
	height: 30px;
	background-color: black;
	color: white;
	line-height: 30px;
	border-style: none;
	display: inline-block;
	font-size: 20px;
	text-align: center;
}

.board-list-link:hover{
	background-color: #FFC800;
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
		<a class="on" href="qnaMyList.jsp"> 
			<span>1:1 문의 확인</span>
		</a> 
		<a href="qnaNotice.jsp"> 
			<span>공지사항</span>
		</a>
	</div>
	
	<h2 class="subtitle">문의확인</h2>
	
	<div class="qna-notice-row">
		<div class="notice-title">
			<strong><%=qnaBoardDto.getQnaBoardTitle() %></strong>
			<span><%=qnaBoardDto.getQnaBoardTime() %></span>
		</div>
		
		<div class="notice-content">
			<div style="float: left; width: 100%;min-height: 200px; padding: 10px 0;">
				<pre><%=qnaBoardDto.getQnaBoardContent() %></pre>
			</div>
		</div>
		
		<div class="notice-bottom">
			<a class="board-list-link" href="qnaMyList.jsp">나의 1:1 문의목록</a>
		</div>
		
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
