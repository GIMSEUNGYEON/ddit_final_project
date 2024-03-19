$(searchForm).on("submit", function(event){
	event.preventDefault();
	let form = this;
	let url = form.action;
	let method = form.method;
	let data = $(form).serialize();
	let $listBody = $(listBody);
	let $pagingArea = $(pagingArea);
	
	$.ajax({
		url : url
		, method : method
		, data : data
		, dataType : "json"
		, success: function(jsonObj) {
            $listBody.empty();
			$pagingArea.empty();

		let dataList = jsonObj.fxtrsrqstList;
		let pagingHTML = jsonObj.pagingHTML;
		
		let trTags = null;
		let statusBadge = '';
		
		if(dataList.length > 0){
			$.each(dataList, function(index, fxtrsRqst){
				
				if (fxtrsRqst.rqstSe  == '승인'){
					statusBadge= `
						<span class="badge badge rounded-pill badge-subtle-primary">승인
			 				<span class="ms-1 fas fa-won-sign" data-fa-transform="shrink-2"></span>
						</span>
					`;
				}else if (fxtrsRqst.rqstSe  == '반려'){
					statusBadge = `
						<span class="badge badge rounded-pill badge-subtle-danger">반려
							<span class="ms-1 fas fa-times" data-fa-transform="shrink-2"></span>
						</span>
					`;
				}else if (fxtrsRqst.rqstSe == '구매승인'){
					statusBadge = `
						<span class="badge badge rounded-pill badge-subtle-success">구매승인
							<span class="ms-1 fas fa-check" data-fa-transform="shrink-2"></span>
						</span>
					`;
				}else if (fxtrsRqst.rqstSe == '구매대기'){
					statusBadge = `
						<span class="badge badge rounded-pill badge-subtle-warning">구매대기
							<span class="ms-1 fas fa-hourglass-half" data-fa-transform="shrink-2"></span>
						</span>
					`;
				}else if (fxtrsRqst.rqstSe == '대기'){
					statusBadge = `
						<span class="badge badge rounded-pill badge-subtle-warning">대기
							<span class="ms-1 fas fa-hourglass-half" data-fa-transform="shrink-2"></span>
						</span>
					`;
				}
				
				if (fxtrsRqst.rqstRqYmd == null) fxtrsRqst.rqstRqYmd = "-";
				if (fxtrsRqst.empPurchsNm == null) fxtrsRqst.empPurchsNm = "-";
				if (fxtrsRqst.rqstPurchsYmd == null) fxtrsRqst.rqstPurchsYmd = "-";
				
		
				trTags += `
					<tr>
						<td class="rnum align-middle wdf">${fxtrsRqst.rnum }</td>
						<td class="fxCd align-middle"><a href="./rqstView">${fxtrsRqst.rqstNo }</td>
						<td class="fxNm align-middle">${fxtrsRqst.empNm }</td>
						<td class="fxPresCnt align-middle">${fxtrsRqst.rqstYmd }</td>
						<td class="fxTtrtnCnt align-middle">${fxtrsRqst.rqstAmnt }</td>
						<td class="fxPrfrn align-middle">${statusBadge}</td>
						<td class="fxTtrtnCnt align-middle">${fxtrsRqst.empRqNm }</td>
						<td class="fxTtrtnCnt align-middle">${fxtrsRqst.rqstRqYmd }</td>
						<td class="fxTtrtnCnt align-middle">${fxtrsRqst.empPurchsNm }</td>
						<td class="fxTtrtnCnt align-middle">${fxtrsRqst.rqstPurchsYmd }</td>
					</tr>		
				`;
			});
		}else{
			trTags = `
				<tr>
					<td colspan="10">조건에 맞는 예약내역이 없음.</td>
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
}).submit();
