<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>

<body>

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />

		<section class="d-flex align-items-center justify-content-center">
			<div class="input-box border">
				<div class="d-flex align-items-center justify-content-center">
					<div id="image_container" class="input-image-box bg-warning my-2">
		
					</div>
				</div>
				<input id="fileInput" type="file" class="d-none" />
				<a href="#" id="imageIcon" class="form-control btn w-btn-red"><i class="big-icon bi bi-image text-dark"> 파일 업로드</i></a>
				<textarea id="textInput" class="form-control my-3" rows="6"></textarea>
				<button id="inputBtn" type="button" class="w-btn-red btn btn-block">게시</button>
			</div>
		</section>	

		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>

	<script>
		$(document).ready(function() {

			$("#inputBtn").on("click", function() {
				let text = $("#textInput").val().trim();
				
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 선택해주세요");
					return ;
				}
				
				if(text == "") {
					alert("내용을 입력해주세요");
					return ;
				}
				
				let formData = new FormData();
				
				formData.append("content", text);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					type:"post",
					url:"/post/create",
					data:formData,
					enctype:"multipart/form-data",
					processData:false,
					contentType:false,
					success:function(data) {
						if(data.result == "success") {
							location.href="/post/main_view";							
						} else {
							alert("게시 실패");
						}
					},
					error:function() {
						alert("게시 오류");
					}
					
				});
			});
			
			
			$("#imageIcon").on("click", function() {
				// fileInput 클릭된 효과
				$("#fileInput").click();
			});
			
			
		});
	
	</script>
	
</body>
</html>