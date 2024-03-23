<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<link href="${pageContext.request.contextPath}/resources/css/emp/pbl/oprtnstts/oprtnstts.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/emp/pagingCss.css" rel="stylesheet">

<div class="col mb-3">
	<div class="card h-100">
		<div class="card-header">
			<div class="row flex-between-end">
				<nav style="--falcon-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23748194'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/emp">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">업무현황</li>
					</ol>
				</nav>
					
				<div class="tabcontent">
				    <input type="radio" name="tab" checked id="tabmenu01">
				    <label for="tabmenu01">연차</label>
				    <input type="radio" name="tab" id="tabmenu02">
				    <label for="tabmenu02">비품</label>
				  
				  <!-- 연차탭 -->
				    <div class="content-box content01">
						
						<div id="tableExample3">
						
						
							<div class="row justify-content-end g-0">
								<div class="col-auto col-sm-5 mb-3">
									<form id="annualSearchForm" action="<c:url value='/emp/pbl/oprtnstts/oprtnsttsList.do'/>">
										<input type="hidden" name="page" />
										<input type="hidden" name="annualSearchWord" value="${simpleCondition.annualSearchWord }" />
										<input type="hidden" name="annualOneSearchWord" value="${simpleCondition.annualOneSearchWord }" />
									</form>
									<div class="row justify-content-end g-0" data-pg-role="searchUI" data-pg-target="#annualSearchForm">
										<div class="col-auto px-3">
											<div class="input-group" >
										        <select class="form-select form-select-sm mb-3"
										        		name="annualOneSearchWord" data-pg-init-value="${simpleCondition.annualOneSearchWord }">
													<option selected="" value="">업무현황</option>
													<option value="승인">승인</option>
													<option value="대기">대기</option>
													<option value="반려">반려</option>
										        </select>
										      </div>
										</div>
										<div class="col-auto col-sm-5 mb-3">
									        <div class="input-group">
									          <input class="form-control form-control-sm shadow-none search" 
									          		type="search" placeholder="Search..." aria-label="search" 
									          		name ="annualSearchWord" value="${simpleCondition.annualSearchWord }"/>
									          <div class="input-group-text bg-transparent">
									          	<span class="fa fa-search fs-10 text-600" data-pg-role="searchBtn"></span>
									          </div>
									        </div>
										</div>
									</div>
								</div>
							</div>
							
							
							<div class="card shadow-none">
								<div class="card-body p-0 pb-3">
								
									<div class="table-responsive scrollbar">
										<table class="table mb-0">
											<thead class="bg-oran">
												<tr  style="color: #FAFAFA">
													<th class="align-middle " data-sort="anlRnum">번호</th>
													<th class="align-middle " data-sort="anlLeaUseNo">요청번호</th>
													<th class="align-middle " data-sort="empNm">요청자</th>
													<th class="align-middle " data-sort="anlLeaYmd">요청일</th>
													<th class="align-middle " data-sort="anlStartEnd">시작/종료일</th>
													<th class="align-middle " data-sort="rqstPurchsYmd">승인일</th>
													<th class="align-middle " data-sort="rqstSe">결재상태</th>
													<th class="align-middle " data-sort="empRqNm">결재자</th>
												</tr>
											</thead>
											<tbody class="annList" id="annListBody">
											
											</tbody>
										</table>
									</div>
									
									<div class="card-footer d-flex justify-content-center paging-div-height" id="annPagingArea">
									
									</div>
									
								</div>
							</div>
						</div>
				    </div>
				    
				  <!-- 비품탭 -->
				    <div class="content-box content02">
				    
				    	<div id="tableExample3">
							
							
							<div class="row justify-content-end g-0">
								<div class="col-auto col-sm-5 mb-3">
									<form id="fxtrsSearchForm" action="<c:url value='/emp/pbl/oprtnstts/oprtnsttsList.do'/>">
										<input type="hidden" name="page" />
										<input type="hidden" name="fxtrsSearchWord" value="${simpleCondition.fxtrsSearchWord }" />
										<input type="hidden" name="fxtrsOneSearchWord" value="${simpleCondition.fxtrsOneSearchWord }" />
									</form>
									<div class="row justify-content-end g-0" data-pg-role="searchUI" data-pg-target="#fxtrsSearchForm">
										<div class="col-auto px-3">
											<div class="input-group" >
										        <select class="form-select form-select-sm mb-3"
										        		name="fxtrsOneSearchWord" data-pg-init-value="${simpleCondition.fxtrsOneSearchWord }">
													<option selected="" value="">업무현황</option>
													<option value="승인">승인</option>
													<option value="대기">대기</option>
													<option value="반려">반려</option>
													<option value="구매대기">구매대기</option>
													<option value="구매승인">구매승인</option>
										        </select>
										      </div>
										</div>
										<div class="col-auto col-sm-5 mb-3">
									        <div class="input-group">
									          <input class="form-control form-control-sm shadow-none search" 
									          		type="search" placeholder="Search..." aria-label="search" 
									          		name ="fxtrsSearchWord" value="${simpleCondition.fxtrsSearchWord }"/>
									          <div class="input-group-text bg-transparent">
									          	<span class="fa fa-search fs-10 text-600" data-pg-role="searchBtn"></span>
									          </div>
									        </div>
										</div>
									</div>
								</div>
							</div>
							
							
							<div class="card shadow-none">
								
								<div class="table-responsive scrollbar">
									<table class="table mb-0">
										<thead class="bg-oran">
											<tr style="color: #FAFAFA">
												<th class="align-middle " data-sort="rnum">번호</th>
												<th class="align-middle " data-sort="rqstNo">요청번호</th>
												<th class="align-middle " data-sort="rqstNm">요청자</th>
												<th class="align-middle " data-sort="rqstYmd">요청일</th>
												<th class="align-middle " data-sort="rqstAmnt">총가격</th>
												<th class="align-middle " data-sort="rqstPurchsYmd">최종승인일</th>
												<th class="align-middle " data-sort="rqstSe">결재상태</th>
												<th class="align-middle " data-sort="empRqNm">요청결재자</th>
												<th class="align-middle " data-sort="empPurchsNm">구매승인결재자</th>
											</tr>
										</thead>
										<tbody class="fxtrsList" id="fxtrsListBody">
											
										</tbody>
									</table>
								</div>
								
								<!-- 페이징 -->
								<div class="card-footer d-flex justify-content-center paging-div-height" id="fxtrsPagingArea">
								
								</div>
								
							</div>
						</div>
				    
					</div>
			    </div>
			</div>
		</div>
	</div>
</div>

<script src="<c:url value='/resources/js/app/emp/pbl/oprtnstts/oprtnstts.js'/>"></script>
<script src="<c:url value='/resources/js/app/common/paging.js'/>"></script>