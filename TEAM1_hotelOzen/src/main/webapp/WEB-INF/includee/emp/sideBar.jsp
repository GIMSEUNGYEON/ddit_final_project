<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<link href="${pageContext.request.contextPath}/resources/css/emp/sideBar.css" rel="stylesheet">

<nav class="navbar navbar-light navbar-vertical navbar-expand-xl navbar-card">
    <script>
        var navbarStyle = localStorage.getItem("navbarStyle");
        if (navbarStyle && navbarStyle !== 'transparent') {
            document.querySelector('.navbar-vertical').classList
                .add(`navbar-${navbarStyle}`);
        }
    </script>
    
    <div class="d-flex align-items-center">
        <a class="navbar-brand" href="${pageContext.request.contextPath }<spring:eval expression="@config.getProperty('empIndex')"/>">
            <div class="d-flex py-3">
                <img src="${pageContext.request.contextPath}/resources/assets/img/generic/hotelozen.png" alt=""
                    width="230" />
            </div>
        </a>
    </div>
    
    <div class="collapse navbar-collapse" id="navbarVerticalCollapse">
    	
        <div class="navbar-vertical-content scrollbar scrollbar-padding">
            <ul class="navbar-nav flex-column mb-3" id="navbarVerticalNav">

                <!-- 프로필사진 -->
                <div class="profile">
                <spring:eval expression="@appInfo.empLogicalPath" var="empProfPath"/>
				<c:choose>
					<c:when test="${not empty empUser.empProflUuid}">
                    <img class="profile-img rounded-circle-profile"
                        src="<c:url value='${empProfPath }${empUser.empProflUuid}'/>">
					</c:when>
					<c:when test="${empty empUser.empProflUuid }">
                    <img class="profile-img rounded-circle-profile"
                        src="<c:url value='${empProfPath }basic.png'/>">
					</c:when>
				</c:choose>
                    <div class="profile-name-span">
						${empUser.empNm }
                    </div>
                    <div class="profile-dept-span profile-dept">${empUser.empDeptName }</div>
                    <a href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('empMypage')"/>" class="profile-button">
                        <i class="fas fa-address-card profile-mypage"></i> 마이페이지
                    </a>
                </div>

                <!-- 카테고리 시작 -->
                <!-- common(직원공통 카테고리) start -->
                <li class="nav-item">
                    <!-- label-->
                    <div class="row navbar-vertical-label-wrapper mt-3 mb-2">
                        <div class="col-auto navbar-vertical-label">common</div>
                        <div class="col ps-0">
                            <hr class="mb-0 navbar-vertical-divider" />
                        </div>
                    </div> 
                    <!-- 직원조회 카테고리 --> 
                    <a class="nav-link" href="${pageContext.request.contextPath}/emp/pbl/emply" role="button">
                        <div class="d-flex align-items-center">
                            <span class="nav-link-icon"> 
                            	<span class="fas fa-user-tie"></span>
                            </span> 
                            <span class="nav-link-text ps-1">직원조회</span>
                        </div>
                    </a> 
                    <!-- 고객조회 카테고리--> 
                    <a class="nav-link" href="${pageContext.request.contextPath }<spring:eval expression="@config.getProperty('cstmrList')"/>" role="button">
                        <div class="d-flex align-items-center">
                            <span class="nav-link-icon"> 
                            	<span class="fas fa-users"></span>
                            </span> 
                            <span class="nav-link-text ps-1">고객조회</span>
                        </div>
                    </a> 
                    <!-- 업무현황 카테고리 --> 
                    <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('oprtnstts')"/>" role="button">
                        <div class="d-flex align-items-center">
                            <span class="nav-link-icon"> 
                            	<span class="fab fa-black-tie"></span>
                            </span> 
                            <span class="nav-link-text ps-1">업무현황</span>
                        </div>
                    </a> 
                    <!-- 근태조회 --> 
                    <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('dclzTime')"/>" role="button">
                        <div class="d-flex align-items-center">
                            <span class="nav-link-icon"> 
                            	<span class="fas fa-calendar-day"></span>
                            </span> 
                            <span class="nav-link-text ps-1">근태조회</span>
                        </div>
                    </a> 
                    <!-- 직원 공지사항 카테고리 --> 
                    <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('empNoticeView')"/>" role="button">
                        <div class="d-flex align-items-center">
                            <span class="nav-link-icon"> 
                            	<span class="fas fa-clipboard-list"></span>
                            </span> 
                            <span class="nav-link-text ps-1">공지사항</span>
                        </div>
                    </a> 
                    <!-- 메신저 카테고리 --> 
                    <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('empMessaner')"/>" role="button">
                        <div class="d-flex align-items-center">
                            <span class="nav-link-icon"> 
                            	<span class="fas fa-comment"></span>
                            </span> 
                            <span class="nav-link-text ps-1">메신저</span>
                        </div>
                    </a> 
                    <!-- 일정표 카테고리 --> 
                    <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('empSchdl')"/>" role="button">
                        <div class="d-flex align-items-center">
                            <span class="nav-link-icon"> 
                            	<span class="fas fa-calendar-alt"></span>
                            </span> 
                            <span class="nav-link-text ps-1">일정표</span>
                        </div>
                    </a> 
                </li>
                <!-- common end --> 
                <!-- 부서별 카테고리 start-->
                <!-- 인사관리 카테고리 start --> 
                <li class="nav-item">
                    <div class="row navbar-vertical-label-wrapper mt-3 mb-2">
                        <div class="col-auto navbar-vertical-label"></div>
                        <div class="col ps-0">
                            <hr class="mb-0 navbar-vertical-divider" />
                        </div>
                    </div> 
                    <a class="nav-link dropdown-indicator" href="#humanManage"
                        role="button" data-bs-toggle="collapse" aria-expanded="false"
                        aria-controls="humanManage">
                        <div class="d-flex align-items-center">
                            <span class="nav-link-icon"> <span class="fas fa-people-arrows"></span>
                            </span> <span class="nav-link-text ps-1">인사관리</span>
                        </div>
                    </a>
                    
                </li>

                <!-- dropdown start -->
                <ul class="nav collapse" id="humanManage">
                    <!-- 신규직원 생성 -->
                    <li class="nav-item">
                        <a class="nav-link " href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('emplyInsert')"/>">
                            <div class="d-flex align-items-center hm-li-marjin">
                                <span class="nav-link-text ps-1">신규직원생성</span>
                            </div>
                        </a>
                    </li>
                    <!-- 직원 공지사항 -->
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('empNoticeView')"/>">
                            <div class="d-flex align-items-center hm-li-marjin">
                                <span class="nav-link-text ps-1">직원 공지사항</span>
                            </div>
                        </a>
                    </li>
                    <!-- 급여관리 -->
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('payslip')"/>">
                            <div class="d-flex align-items-center hm-li-marjin">
                                <span class="nav-link-text ps-1">급여관리</span>
                            </div>
                        </a>
                    </li>
                    <!-- 근태관리 -->
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('dclz')"/>">
                            <div class="d-flex align-items-center hm-li-marjin">
                                <span class="nav-link-text ps-1">근태관리</span>
                            </div>
                        </a>
                    </li>
                    <!-- 근무일정표 -->
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('workingSchdl')"/>">
                            <div class="d-flex align-items-center hm-li-marjin">
                                <span class="nav-link-text ps-1">근무일정표</span>
                            </div>
                        </a>
                    </li>
                    <!-- 연차관리 -->
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('yryc')"/>">
                            <div class="d-flex align-items-center hm-li-marjin">
                                <span class="nav-link-text ps-1">연차관리</span>
                            </div>
                        </a>
                    </li>
                    <!-- 특별휴가관리 -->
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('vacation')"/>">
                            <div class="d-flex align-items-center hm-li-marjin">
                                <span class="nav-link-text ps-1">특별휴가관리</span>
                            </div>
                        </a>  
                    </li>
                    <!-- 얼굴데이터 관리 -->
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('faceList')"/>">
                            <div class="d-flex align-items-center hm-li-marjin">
                                <span class="nav-link-text ps-1">얼굴데이터 관리</span>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- 인사관리 카테고리 end -->

                <!-- 호텔관리 카테고리 start -->
                <li class="nav-item"> 
                    <a class="nav-link dropdown-indicator" href="#hotelManage"
                        role="button" data-bs-toggle="collapse" aria-expanded="false"
                        aria-controls="hotelManage">
                        <div class="d-flex align-items-center">
                            <span class="nav-link-icon"> <span class="fas fa-hotel"></span>
                            </span> <span class="nav-link-text ps-1">호텔관리</span>
                        </div>
                    </a> 
                </li>
                <!-- 객실현황 -->
                <ul class="nav collapse" id="hotelManage">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('roomList')"/>">
                            <div class="d-flex align-items-center">
                                <span class="nav-link-text ps-1">객실현황</span>
                            </div>
                        </a>
                    </li>
                </ul>
				
				<!-- 투숙관리 카테고리 start -->
                <ul class="nav collapse" id="hotelManage">
                    <li class="nav-item">
                        <a class="nav-link dropdown-indicator" href="#staymanage"
                            data-bs-toggle="collapse" aria-expanded="false" aria-controls="forms">
                            <div class="d-flex align-items-center">
                                <span class="nav-link-text ps-1">투숙관리</span>
                            </div>
                        </a> 
                        <!-- 룸서비스 요청 -->
                        <ul class="nav collapse" id="staymanage">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('checkinList')"/>">
                                    <div class="d-flex align-items-center">
                                        <span class="nav-link-text ps-1">체크인 예정자 명단</span>
                                    </div>
                                </a> 
                            </li>
                        </ul>
                        <!-- 룸서비스 결재 -->
                        <ul class="nav collapse" id="staymanage">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('checkoutList')"/>">
                                    <div class="d-flex align-items-center">
                                        <span class="nav-link-text ps-1">체크아웃 예정자 명단</span>
                                    </div>
                                </a> 
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- 투숙관리 카테고리 end -->
				
                <!-- 비품재고관리 카테고리 start -->
                <ul class="nav collapse" id="hotelManage">
                    <li class="nav-item">
                        <a class="nav-link dropdown-indicator" href="#fxtrsManage"
                            data-bs-toggle="collapse" aria-expanded="false" aria-controls="forms">
                            <div class="d-flex align-items-center">
                                <span class="nav-link-text ps-1">비품재고관리</span>
                            </div>
                        </a> 
                        <!-- 현재비품 수량 -->
                        <ul class="nav collapse" id="fxtrsManage">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('presList')"/>">
                                    <div class="d-flex align-items-center">
                                        <span class="nav-link-text ps-1">현재 비품수량</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <!-- 재고 물량신청 게시판 -->
                        <ul class="nav collapse" id="fxtrsManage">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('rqstList')"/>">
                                    <div class="d-flex align-items-center">
                                        <span class="nav-link-text ps-1">비품 요청서 목록</span>
                                    </div>
                                </a> 
                            </li>
                        </ul>
                        <!-- 재고 사용내역 게시판 -->
                        <ul class="nav collapse" id="fxtrsManage">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('userList')"/>">
                                    <div class="d-flex align-items-center">
                                        <span class="nav-link-text ps-1">비품 사용서 목록</span>
                                    </div>
                                </a> 
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- 비품재고관리 카테고리 end -->
                <!-- 룸서비스 카테고리 start -->
                <ul class="nav collapse" id="hotelManage">
                    <li class="nav-item">
                        <a class="nav-link dropdown-indicator" href="#roomManage"
                            data-bs-toggle="collapse" aria-expanded="false" aria-controls="forms">
                            <div class="d-flex align-items-center">
                                <span class="nav-link-text ps-1">룸서비스 관리</span>
                            </div>
                        </a> 
                        <!-- 룸서비스 요청 -->
                        <ul class="nav collapse" id="roomManage">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('roomSvcList')"/>">
                                    <div class="d-flex align-items-center">
                                        <span class="nav-link-text ps-1">룸서비스 주문내역</span>
                                    </div>
                                </a> 
                            </li>
                        </ul>
                        <!-- 룸서비스 결재 -->
                        <ul class="nav collapse" id="roomManage">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('roomSvcRqstList')"/>">
                                    <div class="d-flex align-items-center">
                                        <span class="nav-link-text ps-1">룸서비스 조리내역</span>
                                    </div>
                                </a> 
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- 룸서비스 카테고리 end -->
                <!-- 예약관리 카테고리 start -->
                <ul class="nav collapse" id="hotelManage">
                    <li class="nav-item">
                        <a class="nav-link dropdown-indicator" href="#rsvtManage"
                            data-bs-toggle="collapse" aria-expanded="false" aria-controls="forms">
                            <div class="d-flex align-items-center">
                                <span class="nav-link-text ps-1">예약관리</span>
                            </div>
                        </a> 
                        <!-- 예약리스트 -->
                        <ul class="nav collapse" id="rsvtManage">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('rsvtList')"/>">
                                    <div class="d-flex align-items-center">
                                        <span class="nav-link-text ps-1">예약리스트</span>
                                    </div>
                                </a> 
                            </li>
                        </ul>
                        <!-- 예약등록 -->
                        <ul class="nav collapse" id="rsvtManage">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('rsvtAdd')"/>">
                                    <div class="d-flex align-items-center">
                                        <span class="nav-link-text ps-1">예약등록</span>
                                    </div>
                                </a> 
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- 예약관리 카테고리 end -->
                <!-- 주차장 카테고리 start -->
                <ul class="nav collapse" id="hotelManage">
                    <li class="nav-item">
                        <a class="nav-link dropdown-indicator" href="#carManage"
                            data-bs-toggle="collapse" aria-expanded="false" aria-controls="forms">
                            <div class="d-flex align-items-center">
                                <span class="nav-link-text ps-1">주차관리</span>
                            </div>
                        </a> 
                        <!-- 차량조회 -->
                        <ul class="nav collapse" id="carManage">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('parkingCarList')"/>">
                                    <div class="d-flex align-items-center">
                                        <span class="nav-link-text ps-1">차량조회</span>
                                    </div>
                                </a> 
                            </li>
                        </ul>
                        <!-- 주차장 현황 -->
                        <ul class="nav collapse" id="carManage">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}<spring:eval expression="@config.getProperty('parking')"/>">
                                    <div class="d-flex align-items-center">
                                        <span class="nav-link-text ps-1">주차장</span>
                                    </div>
                                </a> 
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- 주차장 카테고리 end -->
                <!-- 호텔관리 카테고리 end -->

                <!-- 자산관리 카테고리 start -->
                <li class="nav-item"> 
                    <a class="nav-link dropdown-indicator" href="#assetManage"
                        role="button" data-bs-toggle="collapse" aria-expanded="false"
                        aria-controls="assetManage">
                        <div class="d-flex align-items-center">
                            <span class="nav-link-icon"> <span class="fas fa-money-check-alt"></span>
                            </span> <span class="nav-link-text ps-1">자산관리</span>
                        </div>
                    </a> 
                </li>
                <ul class="nav collapse" id="assetManage">
                    <li class="nav-item">
                        <a class="nav-link dropdown-indicator" href="#acntnManage"
                            data-bs-toggle="collapse" aria-expanded="false" aria-controls="forms">
                            <div class="d-flex align-items-center">
                                <span class="nav-link-text ps-1">회계</span>
                            </div>
                        </a>
                        <!-- 매출 -->
                        <ul class="nav collapse" id="acntnManage">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/emp/pos/selling">
                                    <div class="d-flex align-items-center">
                                        <span class="nav-link-text ps-1">매출</span>
                                    </div>
                                </a></li>
                        </ul>
                        <!-- 환불내역 -->
                        <ul class="nav collapse" id="acntnManage">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/emp/pos/refund">
                                    <div class="d-flex align-items-center">
                                        <span class="nav-link-text ps-1">환불내역</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <!-- 지출내역 -->
                        <ul class="nav collapse" id="acntnManage">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/emp/pos/spending">
                                    <div class="d-flex align-items-center">
                                        <span class="nav-link-text ps-1">지출내역</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- 결제 리스트 -->
                <ul class="nav collapse" id="assetManage">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/emp/pos/setle">
                            <div class="d-flex align-items-center">
                                <span class="nav-link-text ps-1">결제 리스트</span>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- 비품 결재 리스트 -->
                <ul class="nav collapse" id="assetManage">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/emp/pos/sanctn">
                            <div class="d-flex align-items-center">
                                <span class="nav-link-text ps-1">비품 결재 리스트</span>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- 자산관리 카테고리 end -->
            </ul>
        </div>
    </div>
</nav>

