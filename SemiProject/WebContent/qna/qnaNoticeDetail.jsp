<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="semi.beans.NoticeBoardDto"%>
<%@page import="semi.beans.NoticeBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int noticeBoardNo = Integer.parseInt(request.getParameter("noticeBoardNo"));

	NoticeBoardDao noticeBoardDao = new NoticeBoardDao();
	NoticeBoardDto noticeBoardDto= noticeBoardDao.get(noticeBoardNo);
	
	//이전글 정보 불러오기
	NoticeBoardDto prevBoardDto = noticeBoardDao.getPrevious(noticeBoardNo);
	
	//다음글 정보 불러오기
	NoticeBoardDto nextBoardDto = noticeBoardDao.getNext(noticeBoardNo);
	
	//조회수 증가
	int member = (int)session.getAttribute("member");
	Set<Integer> noticeBoardNoSet;
	if(session.getAttribute("noticeBoardNoSet") != null){//세션에 boardNoSet이라는 이름의 저장소가 있다면 --> 저장소 추출
		noticeBoardNoSet = (Set<Integer>)session.getAttribute("noticeBoardNoSet");
	}
	else{//세션에 boardNoSet이라는 이름의 저장소가 없다면
		noticeBoardNoSet = new HashSet<>();
	}
	
	if(noticeBoardNoSet.add(noticeBoardNo)){//boardNoSet에 현재 글번호(boardNo)가 추가되었다면 --> 처음 읽는 글
		noticeBoardDao.read(noticeBoardNo, member);//조회수 증가
	}
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
	padding: 10px 0;
	position: relative;
	min-height: 200px;
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
			<strong><%=noticeBoardDto.getNoticeBoardTitle() %></strong>
			<span><%=noticeBoardDto.getNoticeBoardTime() %></span>
		</div>
		
		<div class="notice-content">
			<pre><%=noticeBoardDto.getNoticeBoardContent() %></pre>
		</div>
		
		<%if(member == noticeBoardDto.getNoticeBoardWriter()){ %>
    	<div class="notice-bottom">
	        <a class="form-btn form-btn-normal delete-btn" href="qnaNoticeEdit.jsp?noticeBoardNo=<%=noticeBoardNo%>">수정</a>
	        <a class="form-btn form-btn-normal delete-btn" href="qnaNoticeDelete.kh?noticeBoardNo=<%=noticeBoardNo%>" >삭제</a>
     	</div>
     	<%} %>
		
		<div class="qna-notice-prev">
			<a href="#">이전글	|</a> 
			<%if(nextBoardDto == null){%>
				<span style="font-size: 13px; color: #c8c8c8">이전글이 없습니다.</span>
			<%}else{ %>
			<a href="qnaNoticeDetail.jsp?noticeBoardNo=<%=nextBoardDto.getNoticeBoardNo()%>">
				<%=nextBoardDto.getNoticeBoardTitle()%>
			</a>
			<%} %>
		</div>
		<div class="qna-notice-next">
			<a href="#">다음글	|</a> 
			<%if(prevBoardDto == null){%>
				<span style="font-size: 13px; color: #c8c8c8">다음글이 없습니다.</span>
			<%}else{ %>
			<a href="qnaNoticeDetail.jsp?noticeBoardNo=<%=prevBoardDto.getNoticeBoardNo()%>">
				<%=prevBoardDto.getNoticeBoardTitle()%>
			</a>
			<%} %>
		</div>
		
		<div class="notice-bottom">
			<a class="notice-list" href="qnaNotice.jsp">목록</a>
		</div>
		
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
