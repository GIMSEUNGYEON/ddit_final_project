<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags"  prefix="spring"%>

<link href="${pageContext.request.contextPath}/resources/css/emp/pagingCss.css" rel="stylesheet">

<div class="col mb-3">
	<div class="card h-100">
		<div class="card-header">
			<div class="row flex-between-end">
				<nav style="--falcon-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23748194'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/emp">Home</a></li>
				    <li class="breadcrumb-item">인사관리</li>
				    <li class="breadcrumb-item active" aria-current="page">연차관리</li>
				  </ol>
				</nav>
				
				<!-- 테이블 -->
				<div id="yrycListTable">
					<div>
						<form id="searchForm" action="<c:url value='/emp/hrm/dclz/yryc'/>">
							<input type="" name="page" />
							<input type="" name="searchWord" value="${simpleCondition.searchWord }"/>
							<input type="" name="selectOneSearchWord" value="${simpleCondition.selectOneSearchWord }"/>
						</form>
						<div class="row justify-content-end g-0" data-pg-role="searchUI" data-pg-target="#searchForm">
							<div class="col-auto px-3">
								<div class="input-group">
									<select class="form-select form-select-sm mb-3"
										name="selectOneSearchWord"
										data-pg-init-value="${simpleCondition.selectOneSearchWord }">
										<option value>==부서==</option>
										<option value="FTO">프론트오피스부</option>
										<option value="HKP">하우스키핑부</option>
										<option value="FMT">시설관리부</option>
										<option value="CRM">고객관리부</option>
										<option value="POS">재무부</option>
										<option value="HRM">인사부</option>
									</select>
								</div>
							<div class="col-auto col-sm-5 mb-3">
						        <div class="input-group">
						          <input class="form-control form-control-sm shadow-none search" 
						          		type="search" placeholder="Search..." aria-label="search" 
						          		name ="searchWord" value="${simpleCondition.searchWord }"/>
						          <div class="input-group-text bg-transparent">
						          	<span class="fa fa-search fs-10 text-600" data-pg-role="searchBtn"></span> <!-- 스타일 변경 -->
						          </div>
						        </div>
							</div>
						</div>
					</div>
							<div class="table-responsive scrollbar">
								<table class="table mb-0">
									<thead class="bg-oran">
										<tr  style="color: #FAFAFA">
											<th class="align-middle white-space-nowrap">
												<div class="form-check mb-0">
													<input class="form-check-input" type="checkbox"
														data-bulk-select='{"body":"bulk-select-body","actions":"bulk-select-actions","replacedElement":"bulk-select-replace-element"}' />
												</div>
											</th>
											<th class="align-middle wdf " data-sort="runm">번호</th>
											<th class="align-middle" data-sort="runm">요청일</th>
											<th class="align-middle" data-sort="runm">승인일</th>
											<th class="align-middle" data-sort="runm">성명</th>
											<th class="align-middle" data-sort="runm">잔여연차(남은 연차 수/전체)</th>
											<th class="align-middle" data-sort="runm">연차 사용일(n일)</th>
											<th class="align-middle" data-sort="runm">요청자 부서명</th>
											<th class="align-middle white-space-nowrap pe-7" data-sort="runm">결재자</th>
										</tr>
									</thead>
									<tbody class="list" id="listBody">
									${yrycList }
										
<!-- 											<tr> -->
<!-- 												<td class="align-middle white-space-nowrap"> -->
<!-- 													<div class="form-check mb-0"> -->
<!-- 														<input class="form-check-input" type="checkbox" -->
<%-- 															id="checkbox-${index}" --%>
<!-- 															data-bulk-select-row="data-bulk-select-row" /> -->
<!-- 													</div> -->
<!-- 												</td> -->
<%-- 												<th class="align-middle wdf">${index}</th> --%>
<!-- 												<td class="align-middle">2024.02.14</td> -->
<!-- 												<td class="align-middle">2024.02.26</td> -->
<!-- 												<td class="align-middle">장재찬</td> -->
<!-- 												<td class="align-middle">2</td> -->
<!-- 												<td class="align-middle">2024.03.11~2024.03.12</td> -->
<!-- 												<td class="align-middle "><span -->
<!-- 													class="badge badge rounded-pill badge-subtle-success">인사부 -->
<!-- 														<span class="ms-1 fas fa-stream" -->
<!-- 														data-fa-transform="shrink-2"></span> -->
<!-- 												</span></td> -->
<!-- 												<td class="align-middle white-space-nowrap text-end pe-7">홍길동</td> -->
<!-- 											</tr> -->
										
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!-- 페이징 -->
					<div class="card-footer d-flex justify-content-center paging-div-height" id="pagingArea"></div>
				</div>
			</div>
<!-- 			연차내용 상세조회 -->
		</div>
	</div>
</div>



<script src="<c:url value='/resources/js/app/emp/hrm/dclz/yrycList.js'/>"></script>
<script src="<c:url value='/resources/js/app/common/paging.js'/>"></script>
