<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>

<link
	href="${pageContext.request.contextPath}/resources/css/emp/pbl/schdl/schdl.css"
	rel="stylesheet"> 
<link
	href="${pageContext.request.contextPath}/resources/css/emp/index.css"
	rel="stylesheet">
<!-- 근태 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/emp/hrm/dclz/dclzTime.css"
	rel="stylesheet">
<!-- 근태 -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>




<div class="modal fade schdlModal" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModal">일정 추가하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<input type="text" id="schdlTitle" placeholder="내용"
					class="dateInput">
				<!-- 				<label>내용</label> -->
				<span></span> <br /> <input type="date" id="schdlStart"
					placeholder="날짜 선택" required aria-required="true"
					class="dateInput my-2" /><br /> <input type="date" id="schdlEnd"
					placeholder="날짜 선택" required aria-required="true"
					class="dateInput mb-2" /><br /> <select id="color"
					class="schdlColor">
					<option>색상선택</option>
					<option value="#f6714f" style="background-color: #f6714f"></option>
					<option value="#f9cb71" style="background-color: #f9cb71"></option>
					<option value="#d8fe66" style="background-color: #d8fe66"></option>
					<option value="#a9fa83" style="background-color: #a9fa83"></option>
					<option value="#77c4f7" style="background-color: #77c4f7"></option>
					<option value="#fa75c7" style="background-color: #fa75c7"></option>
					<option value="#cca7fa" style="background-color: #cca7fa"></option>
				</select>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-light" data-bs-dismiss="modal">
					취소</button>
				<button type="button" class="btn btn-warning" id="saveChanges">
					추가</button>
			</div>
		</div>
	</div>
</div>


<!-- 근태div -->
<c:set var="current" value="<%=new java.util.Date()%>" />
<div>
	<div class="dclz_main d-flex">
		<!-- 얼굴인식 출퇴근 -->
		<div class="card_main short-main">
			<div class="card h-75">
				<div class="card-header text-center">
					<h5 class="mb-0 go-btn text-center">${authEmp.empNm }&nbsp;님,&nbsp;&nbsp;반갑습니다.</h5>
				</div>
				<div class="card-body bg-light pb-0">
					<div class="time mb-4">
						<div id="time-box" class="text-center">
							<h6>${today}</h6>
							<h4 class="go-btn text-center mt-0" id="now"></h4>
						</div>
					</div>
					<form>
						<div class="d-flex work-box">
							<div class="mx-2">
								<input class="form-control empNoInput" id="event-name"
									type="hidden" value="${authEmp.empNo }" readOnly />
								<div class="mb-3 d-flex">
									<label class="form-label time-label" for="start-time">출근
										시각</label>
									<h5 style="width: 60px;">--:--</h5>
									<input id="start-time" type="hidden" value="${dclz.inTime}"
										readOnly />
								</div>
								<div class="mb-3 d-flex">
									<label class="form-label time-label" for="end-time">퇴근
										시각</label>
									<h5>--:--</h5>
									<input id="end-time" type="hidden" value="${dclz.outTime}"
										readOnly />
								</div>
							</div>

						</div>
						<div class="card-body "
							style="padding: 0px; margin-top: 5px; margin-bottom: 10px;">
							<div class="row justify-content-center">
								<div class="col-lg-8 text-center">
									<button class="btn btn-falcon-primary btn-sm px-3"
										type="button" data-bs-toggle="modal"
										data-bs-target="#scrollinglongcontent"
										style="margin-bottom: 10px;">얼굴인식 출퇴근</button>

									<div class="modal fade" id="scrollinglongcontent"
										data-keyboard="false" tabindex="-1"
										aria-labelledby="scrollinglongcontentLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header bg-primary">
													<h5 class="modal-title" id="scrollinglongcontentLabel">얼굴인식
														출퇴근</h5>
													<button class="btn-close" type="button"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<!--       <div class="modal-body p-0"> -->
												<div class="p-4 pb-0">
													<form>
														<div class="mb-3">
															<label class="form-label" for="recipient-name">사원번호</label>
															<input class="form-control" id="recipient-name"
																type="text" placeholder="E230001"
																value="${authEmp.empNo }" readonly />
														</div>
														<div class="mb-3">
															<!--<button id="capture" class="btn btn-info" onclick="captureAndSend()">사진촬영</button> -->
															<br> <a class="btn btn-link btn-sm btn p-0"
																href="javascript:captureAndSend()">얼굴 캡처 하기</a>
														</div>
														<div class="mb-3 go-btn">
															<!-- <label class="form-label" for="img">얼굴 등록</label> -->
															<label class="form-label" for="img">결과 : </label>
															<div class="go-btn" id="dclzResult"></div>
														</div>
														<!--<div><button class="btn btn-primary" id="liveToastBtn" type="button">hidden toast</button></div> -->
														<div class="mb-3">
															<video id="video" autoplay width="400" height="300"></video>
														</div>
													</form>
												</div>
												<!--       </div> -->
												<div class="modal-footer">
													<button class="btn btn-secondary" type="button"
														data-bs-dismiss="modal">닫기</button>
													<button class="btn btn-primary" type="button"
														onclick="checkDclz()">출퇴근등록</button>
												</div>
											</div>
										</div>
									</div>

									<!-- 								<button class="btn btn-falcon-default btn-sm px-3 ms-2" type="button">출퇴근확정</button> -->
								</div>
							</div>
							<a class="btn btn-link btn-sm btn p-0 mb-3"
								href="<c:url value='/emp/pbl/dclz/yryc'/>">연차 신청 <span
								class="fas fa-chevron-right ms-1 fs--2"></span>
							</a>
						</div>
						<!-- 					<button class="btn btn-link btn-sm btn p-0 go-btn" type="button" data-bs-toggle="modal" data-bs-target="#commute-inquiry-modal">출퇴근문의 -->
						<!-- 						<span class="fas fa-chevron-right ms-1 fs--2"></span> -->
						<!-- 					</button> -->
					</form>
				</div>
			</div>
		</div>
		<div class="card_main short-main" style="margin-left: 20px;">
			<div class="card h-75">
				<div class="card-header text-center">업무현황</div>
				<div class="card-body bg-light pb-0"></div>
			</div>
		</div>
		<div class="card_main" style="margin-left: 20px; width: 50%">
			<div class="card h-75">
				<div class="card-header text-center">게시판</div>
				<div class="card-body bg-light pb-0">
					<div>
						<table class="table mb-0 center">
							<thead class="bg-oran">
								<tr>
									<th>번호</th>
									<th>공지분류</th>
									<th>게시글명</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${empNoticeList}" begin="0" end="4"
									step="1">
									<tr>
										<td>${item.rnum}</td>
										<td>${item.empNtClassification}</td>
										<td>${item.empNtNm}</td>
										<td>${item.empNtYmd}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<!-- 			출퇴근 문의 모달 -->
		<div class="modal fade" id="commute-inquiry-modal" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document"
				style="max-width: 500px">
				<div class="modal-content position-relative">
					<div class="position-absolute top-0 end-0 mt-2 me-2 z-index-1">
						<button
							class="btn-close btn btn-sm btn-circle d-flex flex-center transition-base"
							data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body p-0">
						<div class="rounded-top-lg py-3 ps-4 pe-6 bg-light">
							<h4 class="mb-1" id="modalExampleDemoLabel">출퇴근관련 문의 사항
								보내기(미구현)</h4>
						</div>
						<div class="p-4 pb-0">
							<form>
								<div class="mb-3">
									<label class="col-form-label" for="recipient-name">발신자:</label>
									<input class="form-control" id="sender" type="text" />
								</div>
								<div class="mb-3">
									<label class="col-form-label" for="recipient-name">수신자(인사부직원이어야
										함.):</label> <input class="form-control" id="receiver" type="text" />
								</div>
								<div class="mb-3">
									<label class="col-form-label" for="message-text">내용:</label>
									<textarea class="form-control" id="message-text"></textarea>
								</div>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-bs-dismiss="modal">닫기</button>
						<button class="btn btn-primary" type="button">문의요청하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- calendar 태그 -->
	<div id='calendar-container' class="calen-body mt-4 mb-3"
		style="width: 100%; height: 100%; float: right; margin-left: 20px;">
		<div id='calendar' style="height: 400px !important;"></div>
	</div>
</div>
<!-- 근태div -->

<script>

$(function () {
	// calendar element 취득
	var calendarEl = $('#calendar')[0];
	// full-calendar 생성하기
	var calendar = new FullCalendar.Calendar(calendarEl, {
	height: '600px', // calendar 높이 설정
	expandRows: true, // 화면에 맞게 높이 재설정
	slotMinTime: '08:00', // Day 캘린더에서 시작 시간
	slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
    
    
    events :[
		<c:forEach items="${empSchdlList }" var="schdl" varStatus="vs">
		<c:if test="${vs.index>0 }">,</c:if>
		{
			title : "${schdl.schdlTitle }",
			start : "${schdl.schdlStart }",
			end : "${schdl.schdlEnd }",
			backgroundColor : "${schdl.bgColor }"
		}
		</c:forEach>
    ],
    
    // 해더에 표시할 툴바
    headerToolbar: {
		left: 'prevYear,prev,today,next,nextYear',
		center: 'title',
		right: 'dayGridMonth,dayGridWeek,dayGridDay'
    },
	initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
    navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
    editable: true, // 수정 가능?
    selectable: true, // 달력 일자 드래그 설정가능
    nowIndicator: true, // 현재 시간 마크
    dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
    locale: 'ko', // 한국어 설정
    eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
		console.log(obj);
    },
    eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
		console.log(obj);
    },
    eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트

    },
    select: function(arg) {
		// 기본 프롬프트 대신 모달 열기
		$("#schdlStart").val(arg.startStr);
 		$("#schdlEnd").val(arg.endStr);
  
		$("#exampleModal").modal("show");
		
	    },
	    
	    // 일정 삭제시
	    eventClick : function(arg) {
	    	var schdlTitle = arg.event.title;
	    	console.log(schdlTitle);
	    	
	    	Swal.fire({
				title:'일정을 삭제하겠습니까?'
				, icon:"info"
				, cancelButtonText:"취소"
				, confirmButtonText:"확인"
				, showCancelButton: true
				, allowOutsideClick : false
			}).then((result)=>{
				if(result.isConfirmed){
	    		$.ajax({
	    			url : "${pageContext.request.contextPath}/emp/deleteSchdl"
	    			, method : "POST"
	    			, contentType : "application/json"
	    			, data : JSON.stringify(schdlTitle)
	    			, success : function(jsonObj) {
	    				Swal.fire({
							title:'일정이 삭제되었습니다.',
							icon:"success",
							confirmButtonText:"확인",
							allowOutsideClick : false
						}).then((result)=>{
							if(result.isConfirmed){
	                            window.location.reload();
							}
						});		
	    				
	    			},
	    			error: function(jqXHR, txt, status){
						console.log("Error Text: ", txt);
						console.log("HTTP Status: ", status);	
						console.log("XHR Object: ", jqXHR);
						console.log("title: ", schdlTitle);
					}
	    		});
	    	} 
		});		
	    }
	});
  // 캘린더 랜더링
  calendar.render();
  
  // --------------------- 이벤트 설정
  $("#saveChanges").on("click", function () {
		var eventData = {
			title: $("#schdlTitle").val(),
			start: $("#schdlStart").val(),
			end: $("#schdlEnd").val(),
			color: $("#color").val(),
		};
		console.log("eventData", eventData);
		//빈값입력시 오류
		if ( eventData.title == "" || eventData.start == "" ) {
			Swal.fire({
				title:'입력하지 않은 값이 있습니다.',
				icon:"error",
				confirmButtonText:"확인",
				allowOutsideClick : false
			}).then((result)=>{
				if(result.isConfirmed){
				}
			});		
			
		//끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
		} else if ($("#schdlStart").val() > $("#schdlEnd").val()) {
			Swal.fire({
				title:'기간을 제대로 입력해주세요.',
				icon:"error",
				confirmButtonText:"확인",
				allowOutsideClick : false
			}).then((result)=>{
				if(result.isConfirmed){
				}
			});		
		} else {
			// 이벤트 추가
			var empSchdlData = {
				schdlTitle: $("#schdlTitle").val(),
				schdlStart: $("#schdlStart").val(),
				schdlEnd: $("#schdlEnd").val(),
				bgColor: $("#color").val(),
			};
			$.ajax({
				url : "${pageContext.request.contextPath}/emp/insertSchdl"
				, method : "POST"
				, contentType : "application/json"
				, data : JSON.stringify(empSchdlData)
				, success : function(jsonObj){
					Swal.fire({
						title:'일정이 저장되었습니다.',
						icon:"success",
						confirmButtonText:"확인",
						allowOutsideClick : false
					}).then((result)=>{
						if(result.isConfirmed){
						}
					});		
					calendar.addEvent(eventData);
					
					
					
			 	},
				error: function(jqXHR, txt, status){
					console.log("Error Text: ", txt);
					console.log("HTTP Status: ", status);	
					console.log("XHR Object: ", jqXHR);
				}
			});


				$("#exampleModal").modal("hide");
				$("#schdlTitle").val("");
				$("#schdlStart").val("");
				$("#schdlEnd").val("");
				$("#color").val("");
			}
		});
});
</script>

<!-- 근태스크립트 -->
<script type="text/javascript">

const clock = document.querySelector("#now");


//실시간 시계
function getClock(){
	const d = new Date();
	const h = String(d.getHours()).padStart(2,"0");
	const m = String(d.getMinutes()).padStart(2,"0");
	const s = String(d.getSeconds()).padStart(2,"0");
// 	console.log(h,m,s);
// 	console.log(clock)
	clock.innerText = `\${h}:\${m}:\${s}`;
	
}

getClock(); //맨처음에 한번 실행
setInterval(getClock, 1000); //1초 주기로 새로실행




//얼굴인식 출퇴근을 위한 코드
var video = document.getElementById('video');
var canvas = document.createElement('canvas');
var context = canvas.getContext('2d');
var formData = new FormData();
var resultDiv = document.querySelector('#dclzResult');


var toastBtn = document.getElementById('liveToastBtn');



//화면에 웹캠을 보여주는 코드
navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {
	video.srcObject = stream;
	video.play();
	
})
.catch(function(error) {
	console.error(error);
});


//얼굴 등록
function captureAndSend() {
	return new Promise(function(resolve, reject){
		var cnt = 0;
		var wantCnt = 50; //원하는 캡처 횟수
		
		function captureWantCnt() {
			canvas.width = video.videoWidth;
		    canvas.height = video.videoHeight;
		    context.drawImage(video, 0, 0, canvas.width, canvas.height);
		    canvas.toBlob(function(blob) {
				formData.append('file[]', blob, cnt+'.jpg');
				formData.append("wantCnt", wantCnt);
				cnt++;
				if(cnt<wantCnt) {
					setTimeout(captureWantCnt);
				} else {
					formData.append('empNo', "${authEmp.empNo}");	
					 
				}
				
				jQuery.ajax({
					url: "http://localhost:5000/cam_capture_upload.ajax",
// 		        	url: "http://192.168.141.5:5000/cam_capture_upload.ajax",
					processData: false,
					contentType: false,
					data: formData,
					type: "POST",
					success: function(response) {
			        	console.log("파이썬 ", response);
			        	resultDiv.innerHTML = `<span>\${response.result}</span>`;
			        	console.log("결과.....", response.result);
			        	if (response.result == "등록 완료"){
			        		//alert(response.result);
			        		setTimeout(() => location.replace("${pageContext.request.contextPath}/emp"), 3000);
			        		 Swal.fire({
									title:"등록 성공하였습니다!",
									icon:"success"
								})
			        	}else{
			        		
			        	}
			    	},
			    	error:function(xhr, status, error) {
			    		console.log(xhr,status, error);
			    	}
				});//파이썬 ajax 끝
			}, 'image/jpeg', 0.9);
		}
		captureWantCnt();
	}); //프로미스 종료, captureAndSend의 리턴값 반환 끝
	  
}



function checkDclz() {
    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;
    context.drawImage(video, 0, 0, canvas.width, canvas.height);
    canvas.toBlob(function(blob) {
		formData.append('file', blob, 'dclz.jpg');
		formData.append('empNo', "${authEmp.empNo}");
		formData.append('inTime', "${dclz.inTime}");
		formData.append('outTime', "${dclz.outTime}");
		jQuery.ajax({
        	url: "http://localhost:5000/dclz.ajax",
//         	url: "http://192.168.141.5:5000/dclz.ajax",
			processData: false,
			contentType: false,
			data: formData,
			type: "POST",
			success: function(response) {
				if(response.result == "성공") {
					resultDiv.innerHTML = `<span style="color : #1FDA11;">\${response.result}</span>`;
					var icon = "success";
					//location.replace("${pageContext.request.contextPath}/emp/hrm/dclz/dclzTime");
					setTimeout(() => location.replace("${pageContext.request.contextPath}/emp"), 3000);
	        		 
				}else{
					resultDiv.innerHTML = `<span style="color : #FF0000;">\${response.result}</span>`;
					icon = "error";
				}
	        	console.log("파이썬 ", response);
	        	formData.delete("file")
	        	//toastBtn.click();
	        	Swal.fire({
					title:`등록 \${response.result}하였습니다!`,
					icon:icon
				})
	        	
	        	
	        	
	    	}
		});
	}, 'image/jpeg', 0.9); 
}
</script>


<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/app/index.js"></script> --%>

