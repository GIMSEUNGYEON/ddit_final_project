/**
 * 
 */

const cPath = document.body.dataset.contextPath;

//필터 검색
$("select[name=selectOneSearchWord]").on("change", function(event){
	event.preventDefault();
	console.log(event);
	var selected = $("select[name=selectOneSearchWord]").val();
	console.log(selected);
	$("#selectBtn").click();
	return false;
	
})

//목록조회, 페이지 처리
$("#searchForm").on("submit", function(event){
	event.preventDefault();
	let form = this;
	let url = form.action;
	let method = form.method;
	let data = $(form).serialize();
	let $listBody = $('#listBody');
	let $pagingArea = $(pagingArea);
	$.ajax({
		url:url
		, method:method
		, data : data
		, dataType : "json"
		, success:function(jsonObj){
			$listBody.empty();
			$pagingArea.empty();
			
			console.log(jsonObj);
			let dataList = jsonObj.yrycList;
			let pagingHTML = jsonObj.pagingHTML;
			
			let trTags = null;
			
			if(dataList.length > 0){
				$.each(dataList, function(index, yryc){
					
//					trTags += `
//						<tr>
//							<td>${empNt.rnum }</td>
//							<td>${empNt.empNtClassification }</td>
//							<td><a href="${cPath}/emp/hrm/empnotice/${empNt.empNtNo}" onclick='fnShowOne()'>${empNt.empNtNm }</a></td>
//							<td><a href="${cPath}/emp/pbl/emply/view" onclick='fnShowOne()'>${empNt.hrmEmp.empNm }</a></td>
//							<td>${empNt.empNtYmd }</td>
//							<td>${att}</td>
//							<td>${empNt.empNtCnt }</td>
//						</tr>
//					`;
					var formatDept = yryc.empDept;
					if( formatDept==="FTO")  formatDept='프론트오피스';
					if( formatDept==="HKP")  formatDept='하우스키핑';
					if( formatDept==="FMT")  formatDept='시설관리';
					if( formatDept==="CRM")  formatDept='고객관리';
					if( formatDept==="POS")  formatDept='재무부';
					if( formatDept==="HRM")  formatDept='인사부';


					trTags += `
						<tr class="${yryc.anlLeaUseNo }">
							<td>${yryc.rnum }</td>
							<td>${yryc.empNm }</td>
							<td>${formatDept }</td>
							<td>${yryc.anlLeaBgnYmd }</td>
							<td>${yryc.anlLeaEndYmd }</td>
							<td>${yryc.useDate }일</td>
							<td>${yryc.anlLeaRm }</td>
							<td><button class="detailBtn" type="button" data-bs-toggle="modal" data-bs-target="#detail-modal" data-annual-no="${yryc.anlLeaUseNo}">상세보기</button></td>
						</tr>
					`;
					
//					console.log("이게 나오나요??",$('#empNo').html());
//					console.log("이게 나오나요??",$('#empNo').html(yryc.empNo));
//					
//					$('#empNo').html(yryc.empNo);
//					$('#empNm').html(yryc.empNm);
//					$('#empTel').html(yryc.empTel);
//					$('#empDept').html(formatDept);
//					$('#anlLeaBgnYmd').html(yryc.anlLeaBgnYmd);
//					$('#anlLeaEndYmd').html(yryc.anlLeaEndYmd);
//					$('#useDate').html(yryc.useDate);
//					$('#empAnnualLeave').html(yryc.empAnnualLeave);
//					$('#empRqNm').html(yryc.empRqNm);


					
//<td><a href="${cPath}">${yryc.rqstSe }</a></td>
//							<td><a href="${cPath}/emp/pbl/emply/view">${yryc.rqstPurchsYmd}</a></td>
//							<td>${yryc.anlLeaUseNo }</td>
//							<td>${yryc.empNo}</td>
//							<td>${yryc.anlLeaInfo }</td>
//							<td>${yryc.anlLeaYmd }</td>
//							<td>${yryc.empRqNm }</td>
//							<td>${yryc.empRqNo }</td>
//							<td>${yryc.anlLeaGiveYmd }</td>
//							<td>${yryc.anlLeaGiveAmnt }</td>
//							<td>${yryc.empAnnualLeave }</td>


				});
			}else{
				trTags = `
					<tr>
						<td colspan="7">조건에 맞는 공지가 없음.</td>
					</tr>
				`;
			}
			
			$listBody.append(trTags);
			$pagingArea.append(pagingHTML);
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	}).done(()=>{
		form.page.value="";
	});
	return false;
}).submit(); //이벤트를 한번 강제로 발생시켜 1페이지 요청


//$('#detail-modal').on('show.bs.modal', function(event){
//	event.preventDefault();
//	console.log(event.target);
//	$('.d')
////	var $btn = $('detailBtn');
////	
////	console.log("dfdfd", $btn.val());
//});

$(document).on('click', $('.detailBtn'), function(event) {
	event.preventDefault();
	var anlLeaUseNo = $(event.target).data('annualNo');
	if(anlLeaUseNo == null ) return false;
	if(anlLeaUseNo == undefined ) return false;
	
	
	$.ajax({
		url: cPath+'/emp/hrm/dclz/yryc/'+anlLeaUseNo
		, type : 'GET'
		, dataType : 'json'
		, success: function(result) {
			console.log(result);
					$('#empNo').html(result.hrmAnnualVO.empNo);
					$('#empNm').html(result.hrmAnnualVO.empNm);
					$('#empTel').html(result.hrmAnnualVO.empTel);
					$('#empDept').html(result.hrmAnnualVO.empDept);
					$('#anlLeaBgnYmd').html(result.hrmAnnualVO.anlLeaBgnYmd);
					$('#anlLeaEndYmd').html(result.hrmAnnualVO.anlLeaEndYmd);
					$('#useDate').html(result.hrmAnnualVO.useDate);
					$('#empAnnualLeave').html(result.hrmAnnualVO.empAnnualLeave);
					$('#empRqNm').html(result.hrmAnnualVO.empRqNm);
		}
		, error: function() {
			
		}
	})
});




