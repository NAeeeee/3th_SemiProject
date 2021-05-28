<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>			
<jsp:include page="/template/header.jsp"></jsp:include>

<style>
.signup-button-area > .form-btn{
	width: 120px;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#gotoSignup").click(function(){
			console.log("sign");
			location.href = "signup.jsp";
		});
		
		$("#gotoMain").click(function(){
			console.log("main");
			location.href = "<%=request.getContextPath()%>";
		});
	});
</script>

	<div class="align-column">
		<h3 style="margin-bottom: 40px;font-size:40px;" class="site-color">Log In</h3>
	<form class="container-500 align-column singup-form" action="login.kh" method="post">
		<div style="padding-bottom:20px "><span>아이디</span><input type="text"  name="memberId"  required></div>
		<div style="padding-bottom:40px "><span>비밀번호</span><input type="password"  name="memberPw"  required></div>
		<div style="width: 100% ;border-bottom:1px solid rgba(0,0,0,0.4);margin-bottom:40px"></div>
		
		<div class="signup-button-area">
			<button type="submit" class="form-btn form-btn-positive btn">로그인</button>
			<button type="button" id="gotoSignup" class="form-btn form-btn-normal btn js_cancel_signup" style="margin:0 20px 0 20px;">회원가입</button>
			<button type="button" id="gotoMain" class="form-btn form-btn-normal btn js_cancel_signup">메인페이지</button>
		</div>
	</form>
	</div>
<jsp:include page="/template/footer.jsp"></jsp:include>