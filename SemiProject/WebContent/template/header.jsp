<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String root = request.getContextPath();
	Integer memberNo = (Integer) session.getAttribute("member");
	MemberDao memberDao = new MemberDao();
	boolean isLogin = false;
	MemberDto memberDto = null;
	if(memberNo!=null){
		isLogin=true;
		memberDto = memberDao.getMember(memberNo);
	}
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>알라딘</title>
    <link rel="stylesheet" type="text/css" href="<%= root%>/css/common.css">
    <link rel="stylesheet" type="text/css" href="<%= root%>/css/template.css">
    <link rel="stylesheet" type="text/css" href="<%= root%>/css/signup.css">
    <link rel="stylesheet" type="text/css" href="<%= root%>/css/list.css">
   <style>
		
   </style>
</head>
<body class="align-column">
<div class="member-area container-1200">

	<% if(isLogin){ %>
	<ul class="ul-row member-menu ">
		<li><a class="change-a" href="#"><%=memberDto.getMemberId()%></a></li>
		<li><a class="change-a" href="#">QnA</a></li>
		<li><a class="change-a" href="<%=root%>/member/logout.kh">로그아웃</a></li>
	</ul>
	<%}else{ %>
	<ul class="ul-row member-menu ">
		<li><a class="change-a" href="<%=root%>/member/signup.jsp">회원가입</a></li>
		<li><a class="change-a" href="#">QnA</a></li>
		<li><a class="change-a" href="<%=root%>/member/login.jsp">로그인</a></li>
	</ul>
	<%} %>	
	
</div>
<div class="line"></div>
<header class="container-1200 align-column ">
<div class="container-1200 align-row space-around">
	<div class="logo-area ">
		<div><a href="<%=root%>"><span>BOOKin</span></a></div>
	</div>
	<div class="search-form-area">
		<form class="search-form">
			<input type="search" class="search-input">
			<button type="submit" class="search-btn"></button>
		</form>
	</div>
	<div class="icon-area align-row">
		<a class="icon-item align-column" href="#">
			<img class ="icon" src="<%=root%>/image/like.svg">
			<span>좋아요</span>
		</a>
		<a class="icon-item align-column" href="#">
			<img class ="icon" src="<%=root%>/image/bag.svg">
			<span>장바구니</span>
		</a>
		<a class="icon-item align-column" href="#">
			<img class ="icon" src="<%=root%>/image/writing.svg">
			<span>리뷰</span>
		</a>
		<a  class="icon-item align-column" href="#">
			<img class ="icon" src="<%=root%>/image/gift.svg">
			<span>이벤트</span>
		</a>
	</div>
	<div class="searchrank-area">
		<div class="searchrank-item border-bottom">
			<div>
				<span class="site-color">1.</span>
				<a href="#"><span class="searchrank-item-text">명탐정코난</span></a>
			</div>
			<span class="site-color">▼</span>
		</div>
		<div class="searchrank-list">
			<div class="line text-center keyword"><span>인기검색어</span></div>
			<% for(int i =1;i<11;i++){ %>
			<div class="searchrank-item">
				<div>
					<span class="site-color"><%=i %>.</span>
					<a href="#"><span class="searchrank-item-text">명탐정코난asdasdasdasdasd</span></a>
				</div>
				<span class="site-color">NEW</span>
			</div>
			<%} %>
		</div>
	</div>
</div>
<div class="container-1200 align-row space-between">
	<ul class="font-weight-900 ul-row main-menu">
		<li><a class="site-color change-a" href="#">베스트</a></li>
		<li><a class="site-color-red change-a"  href="#" >NEW</a></li>
		<li>
   			<a href="#" class="change-a">국내도서</a>
   			<ul class="sub-menu change-a">
   				<li><a href="#">어린이</a></li>
   				<li><a href="#">소설/시/희곡</a></li>
   				<li><a href="#">에세이</a></li>
   				<li><a href="#">인문학</a></li>
   				<li><a href="#">사회과학</a></li>
   				<li><a href="#">경제경영</a></li>
   			</ul>
   		</li>
   		<li>
   			<a href="#" class="change-a">외국도서</a>
   			<ul class="sub-menu change-a">
   				<li><a href="#">어린이</a></li>
   				<li><a href="#">소설/시/희곡</a></li>
   				<li><a href="#">대학교재</a></li>
   				<li><a href="#">인문학</a></li>
   				<li><a href="#">사회과학</a></li>
   				<li><a href="#">경제경영</a></li>
   			</ul>
   		</li>
   		<li><a href="#" class="change-a">eBook</a></li>
   		<li><a href="#" class="change-a">알라딘굿즈</a></li>
   		<li><a href="#" class="change-a">온라인 중고샵</a></li>
   		<li><a href="#" class="change-a">음반</a></li>
   		<li><a href="#" class="change-a">BD/DVD</a></li>
	</ul>
</div>
</header>

<section style="min-height: 800px" class="container-1200">
