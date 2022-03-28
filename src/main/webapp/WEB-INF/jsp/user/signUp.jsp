<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign up page</title>
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
						<div class="d-flex mb-3">
							<input type="text" id="loginIdInput" class="form-control mr-1" placeholder="사용자 아이디">
							<button type="button" id="duplicateCheckBtn" class="btn btn-info">중복 확인</button>
						</div>
						<input type="password" id="passwordInput" class="form-control mb-3" placeholder="비밀번호">
						<input type="password" id="passwordConfirmInput" class="form-control mb-3" placeholder="비밀번호 확인">
						<input type="text" id="nameInput" class="form-control mb-3" placeholder="사용자 이름">
						<input type="text" id="emailInput" class="form-control mb-4" placeholder="이메일 주소">
						
						<button type="button" id="joinBtn" class="btn btn-info btn-block">가입하기</button>
					</div>
				</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			var isChecked = false;
			var isDuplicate = true;
			
			$("#loginIdInput").on("input", function() {
				isChecked = false;
				isDuplicate = true;
				
			}); 
			
			$("#duplicateCheckBtn").on("click", function() {
				let loginId = $("#loginIdInput").val();
				
				isChecked = true;
				
				if(loginId == "") {
					alert("아이디를 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"get",
					url:"/user/isDuplicate",
					data:{"loginId":loginId},
					success:function(data) {
						
						if(data.is_duplicate) {
							isDuplicate = true;
							alert("이미 사용중인 아이디 입니다");
							return ;
						} else {
							isDuplicate = false;
							alert("사용 가능한 아이디 입니다");
							return ;
						}
					},
					error:function() {
						alert("중복체크 에러");
					}
				});
				
			});
			
			$("#joinBtn").on("click", function() {
				let loginId = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				let passwordCheck = $("#passwordConfirmInput").val();
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력하세요");
					return ;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요");
					return ;
				}
				
				if(passwordCheck == "") {
					alert("비밀번호 확인을 해주세요");
					return ;
				}
				
				if(passwordCheck != password) {
					alert("비밀번호를 확인해 주세요");
					return
				}
				
				if(name == "") {
					alert("이름을 입력하세요");
					return ;
				}
				
				if(email == "") {
					alert("이메일을 입력하세요");
					return ;
				}
				
				if(isChecked == false) {
					alert("아이디 중복체크를 해주세요");
					return ;
				}
				
				if(isDuplicate) {
					alert("아이디가 중복되었습니다");
					return ;
				}
				
				
				$.ajax({
					type:"post",
					url:"/user/signup",
					data:{"loginId":loginId, "password":password, "name":name, "email":email},
					success:function(data) {
						if(data.result == "success") {
							alert("회원가입 성공");
							location.href="/user/signin_view";
						} else {
							alert("회원가입 실패");
						}
					},
					error:function() {
						alert("회원가입 에러");
					}
				});
				
			});
			
		});
	</script>

</body>
</html>