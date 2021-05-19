<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>			
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-500">
	<div class="row text-center">
		<h2>로그인</h2>
	</div>
	
	<form action="#" method="post">
		<div class="row text-left" style="margin-top: 20px;">
			<input type="text" name="memberId" placeholder="아이디" required class="form-input form-input-underline">
		</div>
		<div class="row text-left" style="margin-top: 20px;">
			<input type="password" name="memberPw" placeholder="비밀번호" required class="form-input form-input-underline">
		</div>
		<div class="row" >
			<input type="submit" value="로그인" class="form-btn form-btn-positive form-btn-login">
		</div>
	</form>
	
	<!-- 오류인 상황에는 오류 메세지를 추가해준다 -->
	<%if(request.getParameter("error") != null){ %>
	<div class="row">
		<h5 class="error">정보가 일치하지 않습니다</h5>
	</div>
	<%} %>
	
	<div class="row ">
		<ul class="link-box">
			<li>
				<a href="signup.jsp">회원가입</a>
			</li>
			<li>
				<a href="#">아이디찾기</a>
			</li>
			<li>
				<a href="#">비밀번호찾기</a>
			</li>
		</ul>
	</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>