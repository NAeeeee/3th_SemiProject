<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>			
<jsp:include page="/template/header.jsp"></jsp:include>
	<div class="align-column">
		<h3 style="margin-bottom: 40px;font-size:40px;">JOIN US</h3>
	<form class="container-500 align-column singup-form">
		<div><span>아이디</span><input type="text" placeholder="4-20자:영문 소문자,숫자조합"></div>
		<div><span>비밀번호</span><input type="text" placeholder="6-20자:영문,숫자,특수문자조합"></div>
		<div><span>비밀번호 확인</span><input type="text" placeholder="6-20자:영문,숫자,특수문자조합"></div>
		<div><span>이름</span><input type="text"></div>
		<div><span>휴대전화</span><input type="text"></div>
		<div><span>생일</span><input type="date"></div>
		<div><span>이메일</span><input type="email"></div>
		<div><span>주소</span><input type="text"></div>
		<div><span>성별</span>
		<select style="margin-right: 220px">
			<option>남자</option>
			<option>여자</option>
		</select>
		</div>
		<div style="width: 100% ;border-bottom:1px solid rgba(0,0,0,0.4);margin-bottom:40px"></div>
		
		<div class="signup-button-area">
			<button type="submit" class="form-btn form-btn-positive">가입</button>
			<button type="reset" class=" form-btn form-btn-normal">취소</button>
		</div>
	</form>
	</div>
<jsp:include page="/template/footer.jsp"></jsp:include>