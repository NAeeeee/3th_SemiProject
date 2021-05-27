<%@page import="java.util.List"%>
<%@page import="semi.beans.GenreDao"%>
<%@page import="semi.beans.GenreDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Long genreParents=(Long)request.getAttribute("genreParents");
	GenreDao genreDao=new GenreDao();
	List<GenreDto> genreList=genreDao.list();
%>



<table>
	<thead>
		<tr>
			<th>장르번호</th>
			<th>장르이름</th>
			<th>부모장르번호</th>
		</tr>
	</thead>
	<tbody>
		<%for(GenreDto genreDto : genreList){ %>
		<tr>
			<td><%=genreDto.getGenreNo() %></td>
			<td><%=genreDto.getGenreName() %></td>
			<td><%=genreDto.getGenreParents() %></td>
		</tr>
		<%} %>
	</tbody>
</table>

