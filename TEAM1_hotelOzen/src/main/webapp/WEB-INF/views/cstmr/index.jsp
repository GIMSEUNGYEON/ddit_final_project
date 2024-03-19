<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.s0 {
	background-size: cover;
	background-image:
		url('${pageContext.request.contextPath}/resources/assets/img/cstmr/bg_main01.jpg');
	background-color: black;
}
</style>
<link
	href="${pageContext.request.contextPath}/resources/css/common/btn.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cstmr/index.css">
<script defer
	src="<c:url value='/resources/js/app/cstmr/layout/index.js'/>"></script>
<div id="fullpage">

	<div class="section s0">
		<div class="inner">
			<form:form id="submitForm" method="post"
				action="${pageContext.request.contextPath}/cstmr/rsvt/rsvtStep01">
				<div class="first mx-5">
					<div id="roomBox" style="display: none;">
						<button type="button" onclick="home()">
							<img
								src="${pageContext.request.contextPath}/resources/assets/img/generic/button_x.png"
								alt="x">
						</button>
						<div class="d-flex">
							<div class="room mt-4">
								<div id="room1 " class="d-flex mb-4">
									<div class="room-num">
										<h2>객실1</h2>
									</div>
									<div class="room-btn">
										<button type="button" id="btnAdultDown1"
											onclick="minus('adultCnt1')">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/generic/button_minus.png"
												alt="-">
										</button>
										<span class="adl-span">성인 <em>2</em></span>
										<button type="button" id="btnAdultUp1"
											onclick="plus('adultCnt1')">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/generic/button_plus.png"
												alt="+">
										</button>
										<input type="hidden" id="adultCnt1" name="rsvtDetails[0].rsvtDtlAdultCnt"
											value="2">
									</div>
									<div class="room-btn">
										<button type="button" id="btnChildDown1"
											onclick="minus('childCnt1')">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/generic/button_minus.png"
												alt="-">
										</button>
										<span>어린이 <em>0</em></span>
										<button type="button" id="btnChildUp1"
											onclick="plus('childCnt1')">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/generic/button_plus.png"
												alt="+">
										</button>
										<input type="hidden" id="childCnt1" name="rsvtDetails[0].rsvtDtlChildCnt"
											value="0">
									</div>
								</div>
								<div id="room2" class="d-flex mb-4">
									<div class="room-num">
										<h2>객실2</h2>
									</div>
									<div class="room-btn">
										<button type="button" id="btnAdultDown2"
											onclick="minus('adultCnt2')">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/generic/button_minus.png"
												alt="-">
										</button>
										<span>성인 <em>0</em></span>
										<button type="button" id="btnAdultUp2"
											onclick="plus('adultCnt2')">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/generic/button_plus.png"
												alt="+">
										</button>
										<input type="hidden" id="adultCnt2"
											name="rsvtDetails[1].rsvtDtlAdultCnt"
											oninput="roomCnt('adultCnt2')" value="0">
									</div>
									<div class="room-btn">
										<button type="button" id="btnChildDown2"
											onclick="minus('childCnt2')">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/generic/button_minus.png"
												alt="-">
										</button>
										<span>어린이 <em>0</em></span>
										<button type="button" id="btnChildUp2"
											onclick="plus('childCnt2')">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/generic/button_plus.png"
												alt="+">
										</button>
										<input type="hidden" id="childCnt2"
											name="rsvtDetails[1].rsvtDtlChildCnt" value="0">
									</div>
								</div>
								<div id="room3" class="d-flex mb-3">
									<div class="room-num">
										<h2>객실3</h2>
									</div>
									<div class="room-btn">
										<button type="button" id="btnAdultDown3"
											onclick="minus('adultCnt3')">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/generic/button_minus.png"
												alt="-">
										</button>
										<span>성인 <em>0</em></span>
										<button type="button" id="btnAdultUp3"
											onclick="plus('adultCnt3')">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/generic/button_plus.png"
												alt="+">
										</button>
										<input type="hidden" id="adultCnt3"
											name="rsvtDetails[2].rsvtDtlAdultCnt"
											oninput="roomCnt('adultCnt3')" value="0">
									</div>
									<div class="room-btn">
										<button type="button" id="btnChildDown3"
											onclick="minus('childCnt3')">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/generic/button_minus.png"
												alt="-">
										</button>
										<span>어린이 <em>0</em></span>
										<button type="button" id="btnChildUp3"
											onclick="plus('childCnt3')">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/generic/button_plus.png"
												alt="+">
										</button>
										<input type="hidden" id="childCnt3"
											name="rsvtDetails[2].rsvtDtlChildCnt" value="0">
									</div>
								</div>
							</div>
							<div>
								<button class="custom-btn btn-7 mt-4">확인</button>
							</div>
						</div>
					</div>



					<div id="title">
						<h1>"오젠허난 폭삭 속았수다"</h1>
					</div>
					<div class="d-flex tit">
						<div class="hotel">
							<h5>HOTEL</h5>
						</div>
						<div class="dateBox">
							<h5>CHECK IN/OUT</h5>
						</div>
						<div class="roomCnt">
							<h5>ROOM</h5>
						</div>
						<div class="adultCnt">
							<h5>ADULT</h5>
						</div>
						<div class="childCnt">
							<h5>CHILD</h5>
						</div>
					</div>
					<div class="d-flex inputBox">

						<div class="hotel">
							<h3>호텔 오젠</h3>
						</div>
						<div>

							<div class="d-flex">
								<div>
									<input type="date" name="rsvtCheckinYmd" id="rsvtCheckinYmd" />
								</div>
								<div class="dash">-</div>
								<div>
									<input type="date" name="rsvtCheckoutYmd" id="rsvtCheckoutYmd" />
								</div>
							</div>
						</div>
						<div class="d-flex" id="input-box">
							<div class="d-flex" onclick="room()">
								<div>

									<h3 id="roomCnt">1</h3>
									<input type="hidden" name="rsvtRoomCnt" id="rsvtRoomCnt"
										value="1" />
								</div>
								<div>

									<h3 id="adultCnt">2</h3>
									<input type="hidden" id="rsvtAdultCnt" name="rsvtAdultCnt" value="2" />
								</div>
								<div>

									<h3 id="childCnt">0</h3>
									<input type="hidden" id="rsvtChildCnt" name="rsvtChildCnt" value="0" />
								</div>
							</div>
							<div>
								<div class="btnBox">
									<button class="custom-btn btn-7" type="submit" id="submitBtn">조회하기</button>
								</div>
							</div>
						</div>
					</div>

				</div>
			</form:form>
		</div>
	</div>

	<div class="section">
		<h1>section 2</h1>
	</div>
	<div class="section">
		<h1>section 3</h1>
	</div>
	<footer class="section h0 fp-auto-height">
		<div class="footer-video">
			<video muted autoplay loop>
				<source
					src="${pageContext.request.contextPath}/resources/assets/img/ozen.mp4">
			</video>
			<h1 class="footer_text"></h1>
			<div class="text-overlay">
				<h1>FOOTER</h1>
				<p>Additional text goes here</p>
				<hr>
			</div>
		</div>
	</footer>
</div>


<script>
	$(function() {
		$('#fullpage').fullpage({
			//options here
			autoScrolling : true,
			scrollHorizontally : true,
			navigation : true,
			navigationPosition : 'right',
			scrollingSpeed : 1000

		});
	});

	new fullpage('#fullpage', {
		  // fullpage.js 설정
		  afterLoad: function(origin, destination, direction) {
		    // 페이지 전환 후 실행할 코드 작성
		    console.log("다음 페이지로 이동했습니다.");
		    console.log("현재 페이지 인덱스:", destination.index);
		  }
		});

</script>