<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<header class="d-flex align-items-center justify-content-between">
			<h1 class="ml-3">GRAM</h1>
			<c:if test="${not empty userId }" >
				<div class="d-flex">
					<a href="/post/create_view" class="w-btn w-btn-skin mr-3">게시물 추가</a>
					<div>
						<div class="mr-3 mt-2">${userName }님 <a href="/user/signout" class="w-btn w-btn-skin">로그아웃</a></div>
					</div>
				</div>
			</c:if>
			
		</header>