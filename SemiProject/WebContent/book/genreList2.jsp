<%@page import="java.util.List"%>
<%@page import="semi.beans.GenreDao"%>
<%@page import="semi.beans.GenreDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
int genreParents=Integer.parseInt(request.getParameter("genreParents"));
	GenreDao genreDao=new GenreDao();

	List<GenreDto> genreList=genreDao.search(genreParents);

%> --%>



<form action="#" method="get">
	
	<select name="genreParents">
		<option value="">선택하세요</option>
		<option value="">소설</option>
		<option value="">시/에세이</option>
		<option value="">예술/대중문화</option>
		<option value="">잡지</option>
	</select>
	<select action="#" method="get">
		<option>선택하세요</option>
	</select>
	
</form>