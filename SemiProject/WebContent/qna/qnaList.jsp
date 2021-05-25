<%@page import="semi.beans.QnaBoardDto"%>
<%@page import="semi.beans.QnaBoardDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	
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
		pageSize = 10;//기본값 10개
	}
	
	//(2) rownum의 시작번호(startRow)와 종료번호(endRow)를 계산
	int startRow = pageNo * pageSize - (pageSize-1);
	int endRow = pageNo * pageSize;
	
	QnaBoardDao qnaBoardDao = new QnaBoardDao();
	List<QnaBoardDto> list = qnaBoardDao.list(startRow, endRow);
	
	int count = qnaBoardDao.getCount();
	int blockSize = 10;
	int lastBlock = (count + pageSize - 1) / pageSize;
	//	int lastBlock = (count - 1) / pageSize + 1;
	int startBlock = (pageNo - 1) / blockSize * blockSize + 1;
	int endBlock = startBlock + blockSize - 1;
	
	if(endBlock > lastBlock){//범위를 벗어나면
		endBlock = lastBlock;//범위를 수정
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

.qna>.qna-type {
	margin: 20px auto;
	width: 1000px;
 	overflow: hidden;
 	box-sizing: border-box;
    font-size: 16px;
    color: #676767;
    text-align: center;
    line-height: 68px;
    background: #f9f9f9;
    box-sizing: border-box;
}

.qna-type > a {
	float: left;
	width: 20%;
	height: 65px;
	font: inherit;
	background-color: white;
	font-size: 20px;
	text-align: center;
	color: #bebebe;
	line-height: 67px;
	border: 1px solid #d2d2d2;
	border-bottom: 1px solid #ff7d9e;
}

.qna-type > .on{
	position: relative;
    height: 65px;
    color: #ff7d9e;
    border-color: #ff7d9e;
    background: #fff;
    border-bottom: 0;
}

.qna> .qna-list{
	margin: 20px auto;
	width: 1000px;
    box-sizing: border-box;
}

.qna-table{
	width: 100%;
	margin: 40px 0px;
	border-collapse: collapse;
}

.qna-table>thead>tr, 
.qna-table>tbody>tr,
.qna-table>tfoot>tr {
	border-bottom: 1px solid #b4b4b4;
	border-top: 1px solid #b4b4b4;
}

.qna-table>thead>tr>th, 
.qna-table>thead>tr>td, 
.qna-table>tbody>tr>th,
.qna-table>tbody>tr>td, 
.qna-table>tfoot>tr>th,
.qna-table>tfoot>tr>td {
	padding: 10px 0px;
	text-align: center;
}

.qna-table>thead>tr>td, 
.qna-table>tbody>tr>td, 
.qna-table>tfoot>tr>td {
	font-size: 12px;
}

.qna-table>thead>tr>th:nth-child(1), 
.qna-table>thead>tr>td:nth-child(1), 
.qna-table>tbody>tr>th:nth-child(1),
.qna-table>tbody>tr>td:nth-child(1), 
.qna-table>tfoot>tr>th:nth-child(1),
.qna-table>tfoot>tr>td:nth-child(1) {
	width: 100px;
}

.qna-table>thead>tr>th:nth-child(3), 
.qna-table>thead>tr>td:nth-child(3), 
.qna-table>tbody>tr>th:nth-child(3),
.qna-table>tbody>tr>td:nth-child(3), 
.qna-table>tfoot>tr>th:nth-child(3),
.qna-table>tfoot>tr>td:nth-child(3) {
	width: 600px;
}

.q1-a1{
	padding: 10px 0;
	background-color: #F5F5F5;
}

.pagination{
	margin: 0 auto;
	text-align: center;
}


</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	


	function viewContent(){
		var q1 = document.querySelector("#q1");
		var a1 = document.querySelector("#a1");
			
		if(q1 != null){
			q1.style.display = "table-row";
			a1.style.display = "table-row";
		}
	}
	
	
</script>

<script>
	//페이지 네이션 
	$(function(){
		$(".pagination > a").click(function(){
			//주인공 == a태그
			var pageNo = $(this).text();
			if(pageNo == "이전"){//이전 링크 : 현재 링크 중 첫 번째 항목 값 - 1
				pageNo = parseInt($(".pagination > a:not(.move-link)").first().text()) - 1;
				$("input[name=pageNo]").val(pageNo);
				$(".page-form").submit();//강제 submit 발생
			}	
			else if(pageNo == "다음"){//다음 링크 : 현재 링크 중 마지막 항목 값 + 1
				pageNo = parseInt($(".pagination > a:not(.move-link)").last().text()) + 1;
				$("input[name=pageNo]").val(pageNo);
				$(".page-form").submit();//강제 submit 발생
			}
			else{//숫자 링크
				$("input[name=pageNo]").val(pageNo);
				$(".page-form").submit();//강제 submit 발생
			}
		});
	});
</script>



<div class="qna">

	<h2 class="title">고객센터</h2>
	
	<div class="tabmenu-black">
		<a class="on" href="qnaList.jsp"> 
			<span>고객의 소리</span>
		</a> 
		<a href="qnaInsert.jsp">
			<span>1:1 문의 등록</span>
		</a> 
		<a href="qnaMyList.jsp"> 
			<span>1:1 문의 확인</span>
		</a> 
		<a href="qnaNotice.jsp"> 
			<span>공지사항</span>
		</a>
	</div>

	<h2 class="subtitle">문의목록</h2>
	
	<div class="qna-type">
		<a class="on" href="qnaList.jsp"> 
			<span>전체</span>
		</a> 
		<a href="#"> 
			<span>주문/결제</span>
		</a> 
		<a href="#"> 
			<span>배송</span>
		</a> 
		<a href="#"> 
			<span>환불/교환</span>
		</a> 
		<a href="#"> 
			<span>기타</span>
		</a>
	</div>
	
	<div class="qna-list">
		<table class="qna-table">
			<thead>
				<tr>
					<th>번호</th>
					<th>구분</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일자</th>
					<th>답변여부</th>
				</tr>
			</thead>
			
			<%for(QnaBoardDto boardDto : list){ %>
			<tbody>
				<tr>
					<td ><%=boardDto.getQnaBoardNo() %></td>
					<td ><%=boardDto.getQnaBoardHeader() %></td>
					<td ><a id="view-qa" onclick="viewContent(this); return false" href="javascript:"><%=boardDto.getQnaBoardTitle() %></a></td>
					<td ><%=boardDto.getQnaBoardWriter() %></td>
					<td ><%=boardDto.getQnaBoardTime() %></td>
					<td ><span class="contents-info" oninput="contentsInfo();">답변대기</span></td>
				<tr>
				<tr id="q1" style="display:none;">
					<td class="q1-a1" colspan="1" ><div >문의내용</div></td>
					<td class="q1-a1" colspan="5" style="text-align: left;"><%=boardDto.getQnaBoardContent() %></td>
				</tr>
				<tr id="a1" style="display:none;">
					<td class="q1-a1" colspan="1" ><div >답변</div></td>
					<td class="q1-a1" colspan="5" style="text-align: left;">몰라</td>
				</tr>
			</tbody>
			<%} %>	
		</table>
	</div>
	
	<!-- 페이지 네비게이션 자리 -->
	<div class="pagination">
	
		<%if(startBlock > 1){ %>
		<a class="move-link">이전</a>
		<%} %>
		
		<%for(int i = startBlock; i <= endBlock; i++){ %>
			<%if(i == pageNo){ %>
				<a class="on"><%=i%></a>
			<%}else{ %>
				<a><%=i%></a>
			<%} %>
		<%} %>
		
		<%if(endBlock < lastBlock){ %>
		<a class="move-link">다음</a>
		<%} %>
		
	</div>
	
	<form class="page-form" action="qnaList.jsp" method="post">
		<input type="hidden" name="pageNo">
	</form>

		
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
