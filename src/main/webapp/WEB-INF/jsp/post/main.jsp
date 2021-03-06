<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section>
			
			<%-- 피드 --%>
			<c:forEach var="postDetail" items="${postList }" >
			<div class="d-flex align-items-center justify-content-center">
				<div class="post-box border rounded my-5">
				
					<!-- 아이디 게시물 삭제/수정 -->
					<div class="post-box-top d-flex justify-content-between">
						<div class="userId mt-3 ml-5 font-weight-bold">${postDetail.post.userName }</div>
						<div class="more-icon" >
							<a class="moreBtn text-dark" href="#" data-toggle="modal" data-target="#moreModal" data-post-id="${postDetail.post.id }"> 
								<i class="bi bi-three-dots-vertical"></i> 
							</a>
						</div>
					</div>
					
					<!-- 게시물 이미지 -->
					<div class="d-flex justify-content-center">
						<img class="post-image" src="${postDetail.post.imagePath }" alt="게시물 사진">
					</div>
					
					<!-- 좋아요 -->
					<div class="d-flex">
						<c:choose>
							<c:when test="${postDetail.like }" >
							<%-- 좋아요 빨갛고 가득찬 하트 --%>
								<a href="#" class="unlikeBtn ml-4 mt-2 mb-2" data-post-id="${postDetail.post.id }"><i class="bi bi-heart-fill heart-icon text-danger"></i></a>
							</c:when>
							<c:otherwise>
							<%-- 비어있는 상태 --%>
								<a href="#" data-post-id="${postDetail.post.id }" class="likeBtn like-box ml-4 mt-3 mb-2"><i class="bi bi-heart"></i></a>
							</c:otherwise>
						</c:choose>
						<div class="ml-2 mt-3">좋아요 ${postDetail.likeCount } 개</div>
					</div>
					
					<!-- 게시물 내용 -->
					<div class="d-flex ml-3">
						<div class="font-weight-bold ml-2">${postDetail.post.userName }</div>
						<div class="ml-2">${postDetail.post.content }</div>
					</div>
					
					<!-- 게시물 댓글 -->
					<div class="reply-box border rounded mt-3 ml-1 mr-1">
						<c:forEach var="comment" items="${postDetail.commentList }" >
							<div class="d-flex">
								<div class="font-weight-bold ml-2 mt-2">${comment.userName }</div>
								<div class="ml-2 mt-2">${comment.comment }</div>
							</div>
						</c:forEach>
					</div>
					
					<!-- 게시물 댓글 달기 -->
					<div class="add-reply-box d-flex">
						<input id="commentInput${postDetail.post.id }" type="text" class="form-control col-10 ml-1 mt-1">
						<button type="button" class="commentBtn btn w-btn-red ml-1 mt-1" data-post-id="${postDetail.post.id }">댓글달기</button>
					</div>
				</div>
			</div>
			</c:forEach>

		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="moreModal">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	     
	      <div class="modal-body text-center">
	       	<a href="#" id="deleteBtn">삭제하기 </a>
	      </div>
	    
	    </div>
	  </div>
	</div>

	<script>
		$(document).ready(function() {
			
			$(".moreBtn").on("click", function() {
				let postId = $(this).data("post-id");

				$("#deleteBtn").data("post-id", postId);
				// <a href="" data-post-id="3">
			});
			
			$("#deleteBtn").on("click", function(e) {
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/delete",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("게시물 삭제 실패");
						}
					},
					error:function() {
						alert("게시물 삭제 에러");
					}
				});
			});
				

				
			$(".likeBtn").on("click", function(e) {
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/like",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 실패");
						}
					},
					error:function() {
						alert("좋아요 에러");
					}
				});
			});
			
			$(".unlikeBtn").on("click", function(e) {
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/unlike",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success") {
							location.reload();							
						} else {
							alert("좋아요 취소 실패");
						}
					},
					error:function() {
						alert("좋아요 취소 에러");
					}
					
				});
			});			
			
			$(".commentBtn").on("click", function() {
				
				let postId = $(this).data("post-id");
				
				// $("#commentInput1,2,3,4")
				let comment = $("#commentInput" + postId).val();

				if(comment == "") {
					alert("내용을 입력하세요");
					return ;
				}
				
				// input 값 가져오기
				
				$.ajax({
					type:"post",
					url:"/post/comment/create",
					data:{"postId":postId, "comment":comment},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("댓글 입력 실패");
						}
					},
					error:function() {
						alert("댓글 에러");
					}
				});
			});

			
		});
	
	</script>
	
</body>
</html>