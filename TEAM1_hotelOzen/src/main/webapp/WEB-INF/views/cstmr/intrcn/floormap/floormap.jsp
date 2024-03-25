<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<link
	href="${pageContext.request.contextPath}/resources/css/cstmr/intrcn/floormap/floormap.css"
	rel="stylesheet">

<section>
	<div>
		<div class="faq-header mx-10">
			<h1 class="cstmr-title mx-5">층별안내도</h1>
			<p class="cstmr-content mx-5 mb-5">호텔 오젠의 층별안내도</p>
		</div>
	</div>
	<div class="d-flex" style="justify-content: center; margin-left: 100px;">
		<div class="d-flex" style="width: 1200px; justify-content: center;">
			<div class="floor-title" id="floor-title">
				<ul id="floorList">
					<li value="15">15층</li>
					<li value="614">6~14층</li>
					<li value="5">5층</li>
					<li value="4">4층</li>
					<li value="3">3층</li>
					<li value="2">2층</li>
					<li value="1">1층</li>
					<li value="0">B1층</li>
				</ul>
			</div>
			<div class="floor-box" id="for-15">
				<div class="d-flex">
					<h2 class="floor">15층</h2>
					<h4 class="floor-ex">LoopTop</h4>
				</div>
				<div>
					<div>
						<h5>휴게시설</h5>
					</div>
					<div>
						<table class="floor-table">
							<tr class="d-flex">
								<td class="table-td">루프탑</td>
								<td class="table-td table-sec">하늘정원</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="floor-box display-no" id="for-614">
				<div class="d-flex">
					<h2 class="floor">6 ~ 14층</h2>
					<h4 class="floor-ex">Room</h4>
				</div>
				<div>
					<div>
						<h5>객실</h5>
					</div>
					<div>
						<table class="floor-table">
							<tr class="d-flex">
								<td class="table-td">객실</td>
								<td class="table-td table-sec"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="floor-box display-no" id="for-5">
				<div class="d-flex">
					<h2 class="floor">5층</h2>
					<h4 class="floor-ex">Room</h4>
				</div>
				<div>
					<div>
						<h5>객실</h5>
					</div>
					<div>
						<table class="floor-table">
							<tr class="d-flex">
								<td class="table-td">객실</td>
								<td class="table-td table-sec"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="floor-box display-no" id="for-4">
				<div class="d-flex">
					<h2 class="floor">4층</h2>
					<h4 class="floor-ex">Room</h4>
				</div>
				<div>
					<div>
						<h5>객실</h5>
					</div>
					<div>
						<table class="floor-table">
							<tr class="d-flex">
								<td class="table-td">객실</td>
								<td class="table-td table-sec"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="floor-box display-no" id="for-3">
				<div class="d-flex">
					<h2 class="floor">3층</h2>
					<h4 class="floor-ex">Room</h4>
				</div>
				<div>
					<div>
						<h5>객실</h5>
					</div>
					<div>
						<table class="floor-table">
							<tr class="d-flex">
								<td class="table-td">객실</td>
								<td class="table-td table-sec"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="floor-box display-no" id="for-2">
				<div class="d-flex">
					<h2 class="floor">2층</h2>
					<h4 class="floor-ex">Room</h4>
				</div>
				<div>
					<div>
						<h5>객실</h5>
					</div>
					<div>
						<table class="floor-table">
							<tr class="d-flex">
								<td class="table-td">객실</td>
								<td class="table-td table-sec"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="floor-box display-no" id="for-1">
				<div class="d-flex">
					<h2 class="floor">1층</h2>
					<h4 class="floor-ex">Lobby</h4>
				</div>
				<div>
					<div>
						<h5>객실</h5>
					</div>
					<div>
						<table class="floor-table">
							<tr class="d-flex">
								<td class="table-td">로비</td>
								<td class="table-td table-sec">레스토랑</td>
							</tr>
							<tr class="d-flex">
								<td class="table-td">카페</td>
								<td class="table-td table-sec">숍</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="floor-box display-no" id="for-0">
				<div class="d-flex">
					<h2 class="floor">B1층</h2>
					<h4 class="floor-ex">Parking</h4>
				</div>
				<div>
					<div>
						<h5>주차장</h5>
					</div>
					<div>
						<table class="floor-table">
							<tr class="d-flex">
								<td class="table-td">주차장</td>
								<td class="table-td table-sec"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>
<script defer src="<c:url value="/resources/js/app/cstmr/intrcn/floormap/floormap.js"/>"></script>