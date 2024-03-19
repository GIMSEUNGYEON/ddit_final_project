<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="${pageContext.request.contextPath}/resources/css/error/error.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/common/btn.css" rel="stylesheet">

<style>
	section {
	background-size: cover;
	background-image:
		url('${pageContext.request.contextPath}/resources/assets/img/404_error.png');
	background-color: black;
}
</style>
<section>

	<div class="error-body justify-content-center text-center">
		<div class="mx-5">
			<h1 class="error-title">500 INTERNAL SERVER ERROR</h1>
			<h3 class="error-message">에러가 발생했습니다.
			</h3>
		</div>
		<button class="custom-btn btn-1 home-btn" onclick="location.href='${pageContext.request.contextPath}/'">HOME</button>
	</div>
</section>