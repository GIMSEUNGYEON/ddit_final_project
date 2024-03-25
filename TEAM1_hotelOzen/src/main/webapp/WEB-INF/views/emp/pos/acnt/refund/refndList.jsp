<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="${pageContext.request.contextPath}/resources/css/emp/pagingCss.css" rel="stylesheet">

<div class="card mb-3">
	<div class="card h-100">
		<div class="card-header">
			<div class="row flex-between-end">
				<nav style="--falcon-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23748194'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/emp">Home</a></li>
				    <li class="breadcrumb-item">자산관리</li>
				    <li class="breadcrumb-item">회계</li>
				    <li class="breadcrumb-item active" aria-current="page">환불내역</li>
				  </ol>
				</nav>				
				<div id="refunListTable">
					<div>
						<form id="searchForm" action="<c:url value='/emp/pos/acnt/refnd/refndList'/>">
							<input type="hidden" name="page" /> 
							<input type="hidden" name="searchWord" value="${simpleCondition.searchWord }" /> 
							<input type="hidden" name="selectOneSearchWord" value="${simpleCondition.selectOneSearchWord }" />
						</form>
						<div class="row justify-content-end g-0" data-pg-role="searchUI" data-pg-target="#searchForm">
							<div class="col-auto col-sm-5 mb-3 d-flex" style=" justify-content: right;">
								<div class="input-group" style="width:280px; ">
									<input class="form-control form-control-sm shadow-none search "
										type="search" placeholder="Search..." aria-label="search"
										name="searchWord" value="${simpleCondition.searchWord }" />
									<div class="input-group-text bg-transparent">
										<span class="fa fa-search fs-10 text-600" id="selectBtn"
											data-pg-role="searchBtn"></span>
										<!-- 스타일 변경 -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="table-responsive scrollbar">
						<table class="table mb-0 center">
							<thead class="bg-oran">
								<tr>
									<th class="align-middle" data-sort="rnum">번호</th>
									<th class="align-middle" data-sort="setleNo">결제번호</th>
									<th class="align-middle" data-sort="cstName">고객명</th>
									<th class="align-middle" data-sort="setleYmd">결제일</th>
									<th class="align-middle" data-sort="refndYmd">환불일</th>
									<th class="align-middle" data-sort="setleAmnt">결제금액</th>
									<th class="align-middle" data-sort="refndAmnt">환불금액</th>
									<th class="align-middle" data-sort="refndRatio">환불비율</th>
								</tr>
							</thead>
							<tbody class="list" id="listBody">
					
							</tbody>
						</table>
					</div>
					<div class="card-footer d-flex justify-content-center paging-div-height"
							id="pagingArea">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="staticBackdrop" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document"
		style="max-width: 1000px">
		<div class="modal-content position-relative">
			<div class="position-absolute top-0 end-0 mt-2 me-2 z-index-1">
				<button
					class="btn-close btn btn-sm btn-circle d-flex flex-center transition-base"
					data-bs-dismiss="modal" aria-label="Close"></button>
			</div>

			<div class="modal-body p-0">
				<div class="rounded-top-lg py-3 ps-4 pe-6 bg-light">
					<h4 class="mb-1" id="modalExampleDemoLabel"></h4>
				</div>
				<div class="p-4 pb-3">
					<form:form>
						<h5 class="mb-2">결제정보</h5>
						<table class="table table-bordered table-striped fs--1 mb-4">
							<thead class="bg-200 text-900">
								<tr>
									<th>결제번호</th>
									<th>결제일</th>
									<th>결제금액</th>
									<th>결제방식</th>
									<th>결제취소일</th>
								</tr>
							</thead>
							<tbody class="list" id="setleTable">

							</tbody>
						</table>
						<h5 class="mb-2">환불정보</h5>
						<table class="table table-bordered table-striped fs--1 mb-3">
							<thead class="bg-200 text-900">
								<tr>
									<th>회원명</th>
									<th>환불계좌</th>
									<th>환불은행</th>
									<th>환불금액</th>
									<th>환불일</th>
								</tr>
							</thead>
							<tbody class="list" id="refndTable">

							</tbody>
						</table>
					</form:form>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button"
					data-bs-dismiss="modal">Close</button>

			</div>
		</div>
	</div>
</div>
<script defer src="<c:url value='/resources/js/app/common/paging.js'/>"></script>
<script defer src="<c:url value='/resources/js/app/emp/pos/acnt/refund/refndList.js'/>"></script>