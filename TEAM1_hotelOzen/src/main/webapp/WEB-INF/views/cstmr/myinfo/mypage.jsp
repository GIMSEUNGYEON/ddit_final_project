<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
	
<link href="${pageContext.request.contextPath}/resources/css/cstmr/myinfo/mypage.css" rel="stylesheet">

<section>
	<div>
		<div class="clickwrap-header mx-10 mb-6">
			<h1 class="cstmr-title mx-5">
				<a href="#" onclick="myPageHome()">My Page</a>
			</h1>
		</div>
	</div>
	<div style="width:1500px">
	
	<div class="row flex-center mypage-contain">
		
			<div class="col-md-2 mypage-side"> 
				<div class="myinfo">
					<p class="name">${mberUser.cst.cstNm }님</p>
					<div class="info">
						<a href="#" onclick="mileageList()">
						    <span class="tit">마일리지&nbsp</span>
						    <span class="txt">${user.mberMileage }<abbr title="Point">&nbspPoint</abbr></span>
						</a>
						<a href="#" onclick="couponList()">
						    <span class="tit">쿠폰</span>
					        <span id="couponCntDiv" class="txt">${user.availCoupon }</span>
					    </a>
					</div>
				</div>
				<ul class="lnb">
					<li>개인정보관리
						<ul>
							<li>
								<a href="#" onclick="updateForm()"> 회원 정보 수정 </a>  
							</li>
							<li><a href="#" onclick="mypwchange()">비밀번호 변경</a></li>
							<li><a href="#" onclick="secsn()">회원 탈퇴</a></li>
						</ul>
					</li>
					<li id="mbrshp1">멤버십확인
						<ul>
							<li><a href="#" onclick="mbrshSetle()">멤버십 가입 내역</a></li>
						</ul>
						</li>
						<li>예약확인
						<ul>
						    <li><a href="${pageContext.request.contextPath }/cstmr/rsvt/rsvtList">객실 예약 내역</a></li>
					    </ul>
						</li>
						<li>
							<a href="#" onclick="myscrapList()">관심 리스트</a>
						</li>
				</ul>
			</div>
			
			<div class="col-md-8 mx-4" id="mypage-content"> 
				<div class="myAccountBox">
					<div class="myAccountInfo">
	                  <dl>
	                      <dt>
	                      멤버십
		                      <span class="side">
			                      <button type="button" class="btnLine" onclick="location.href='${pageContext.request.contextPath }/mbrsh'">
			                      멤버십 혜택
			                      </button>
		                      </span>
	                      </dt>
	                      <dd>
	                 	     <span class="accountNum">
			                      <c:if test="${empty user.mbrsh[0].mbsGrdCd }">
			                      	일반 회원
			                      </c:if>
			                      <c:if test="${not empty user.mbrsh[0].mbsGrdCd }">
			                      	${user.mbrsh[0].mbsGrdCd } VIP
			                      </c:if>
	                     	 </span>
	                      </dd>
	                  </dl>
						<dl>
							<dt>
								<a href="#" onclick="mileageList()" class="btnArr">
									
								마일리지&nbsp<span class="fas fa-chevron-right fs-10"></span>
								</a>
							</dt>
							<dd>
								<span class="usablePoint">${user.mberMileage } POINT</span>&nbsp
								<p class="txtGuide"></p>
							</dd>
						</dl>
					</div>
	            </div>
	            <div class="myCouponBox">
                        <dl>
                            <dt>발급 쿠폰</dt>
                            <dd><em>${user.totalCoupon }</em></dd>
                        </dl>
                        <dl>
                            <dt>사용 쿠폰</dt>
                            <dd><a href="#" onclick="" title="사용 쿠폰함 바로가기"><em>${user.usedCoupon }</em></a></dd>
                        </dl>
                        <dl>
                            <dt>잔여 쿠폰</dt>
                            <dd><a href="/mypage/myCouponaForm.do" title="잔여 쿠폰함 바로가기"><em class="pointTxt">${user.availCoupon }</em></a>
                        </dl>
				</div>
				
				<h3 class="mt-4 mx-4">예약 내역</h3>
				<c:choose>
					<c:when test="${not empty mberRsvtList }">
						<div class="center mt-4">
							<div class="accordion container mb-5" id="accordionExample">
								<c:forEach var="i" begin="0" end="${mberRsvtList.size()-1}">
									<div class="accordion-item mb-4">
										<h2 class="accordion-header" id="heading${i+1}">
											<button class="accordion-button" type="button"
												data-bs-toggle="collapse" data-bs-target="#collapse${i+1}"
												aria-expanded="true" aria-controls="collapse${i+1}">
												예약번호 ${mberRsvtList[i].rsvtNo}&nbsp;&nbsp; 성인
												${mberRsvtList[i].rsvtAdultCnt},&nbsp; 어린이
												${mberRsvtList[i].rsvtChildCnt}</button>
										</h2>
										<c:set var="rsvtRoomCnt"
											value="${mberRsvtList[i].rsvtRoomCnt}" />
										<c:set var="roomCnt" value="${rsvtRoomCnt - 1 }" />
										<c:forEach var="j" begin="0" end="${roomCnt}">
											<div class="accordion-collapse collapse show"
												id="collapse${i+1}" aria-labelledby="heading${i+1}"
												data-bs-parent="#accordionExample">
												<div class="accordion-body">
													<div class="d-flex mt-3 mb-3">
														<div class="mx-3 mt-2">
															<div class="mx-3 mb-3">
																<h5 class="mb-2">
																	${mberRsvtList[i].rsvtDetails[j].roomTypeVO.rmtNm}</h5>
																<h4 class="rsvt-title">
																	${mberRsvtList[i].rsvtDetails[j].roomTypeVO.rmtNmDetails}
																</h4>
															</div>
															<div>
																<table class="rs-table table">
																	<tr>
																		<th>호텔 및 객실</th>
																		<td>오젠호텔,
																			${mberRsvtList[i].rsvtDetails[j].roomTypeVO.rmtNmDetails}
																		</td>
																	</tr>
																	<tr>
																		<th>투숙날짜</th>

																		<td>${mberRsvtList[i].rsvtCheckinYmd}&nbsp;&nbsp;-&nbsp;&nbsp;${mberRsvtList[i].rsvtCheckoutYmd
																						}&nbsp;
																			(${mberRsvtList[i].rsvtDay}박)</td>
																	</tr>
																	<tr>
																		<th>예약인원</th>
																		<td>성인
																			${mberRsvtList[i].rsvtDetails[j].rsvtDtlAdultCnt} ,
																			어린이 ${mberRsvtList[i].rsvtDetails[j].rsvtDtlChildCnt}</td>
																	</tr>

																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:when>
					<c:when test="${empty mberRsvtList }">
						<ul class="membershipCashList">
	                 	 <li class="noData">
	                    	  <p class="txt">
	                        	  예약 내역이 없습니다.<br>오젠 호텔의 다양한 상품을 예약해보세요.
	                    	  </p>
	                	  </li>
	             	  </ul>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
</section>

<script src="<c:url value='/resources/js/app/cstmr/myinfo/mypage.js'/>"></script>
