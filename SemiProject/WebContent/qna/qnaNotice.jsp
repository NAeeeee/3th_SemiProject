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

.qna-table>thead>tr>th:nth-child(2), 
.qna-table>thead>tr>td:nth-child(2), 
.qna-table>tbody>tr>th:nth-child(2),
.qna-table>tbody>tr>td:nth-child(2), 
.qna-table>tfoot>tr>th:nth-child(2),
.qna-table>tfoot>tr>td:nth-child(2) {
	width: 600px;
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
	
	<div class="qna-list">
		<table class="qna-table">
			<thead>
				<tr>
					<th>구분</th>
					<th>제목</th>
					<th>등록일자</th>
					<th>조회</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>공지</td>
					<td><a href="qnaNoticeDetail.jsp">제목</a></td>
					<td>2020-05-19</td>
					<td>1</td>
				<tr>
			</tbody>
		</table>
	</div>
	
	<div class="pagination text-center">
			<a href="#">&lt;이전</a> 
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
			<a href="#">&gt;다음</a>
	</div>
</div>


<jsp:include page="/template/footer.jsp"></jsp:include>
