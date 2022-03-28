<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign in page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="d-flex justify-content-center">
			<div class="signup-box mt-4">
				<h1 class="text-center my-4">GRAM</h1>
				<div class="d-flex justify-content-center">
					<div class="col-11">
						<form id="loginForm">
							<input type="text" id="loginIdInput" class="form-control mb-3" placeholder="아이디">
							<input type="password" id="passwordInput" class="form-control mb-5" placeholder="비밀번호">
							
							<button type="submit" id="loginBtn" class="btn btn-info btn-block">로그인</button>
							<div class="text-center my-3">or</div>
							<a href="/user/signup_view" class="text-white btn btn-info btn-block">회원가입</a>
						</form>
					</div>
				</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			$("#loginForm").on("submit", function(e) {
				e.preventDefault();
				
				let loginId = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력하세요");
					return ;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"post",
					url:"/user/login",
					data:{"loginId":loginId, "password":password},
					success:function(data) {
						if(data.result == "success") {
							location.href="/post/main_view";
						} else {
							alert("아이디/비밀번호를 확인해 주세요");
						}
					},
					error:function() {
						alert("로그인 에러");
					}
				});
				
			});
			
			
		});
	
	</script>

</body>
</html>