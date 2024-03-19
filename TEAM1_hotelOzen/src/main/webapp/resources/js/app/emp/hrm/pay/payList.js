/**
 * 
 */

const cPath = document.body.dataset.contextPath;

// //목록조회, 페이지 처리
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
			
			let dataList = jsonObj.salaryGiveAutoList;
			console.log("dataList", dataList);
			let pagingHTML = jsonObj.pagingHTML;
	
			
			let trTags = null;
			
			if(dataList.length > 0){
			
				$.each(dataList, function(index, salary){
//					var att = `<span class="text-900 fs-6 bi-files"></span>`;
//					if(salary.atchList)
//						att = `<span class="files"></span>`;

//					var aa = `<fmt:parseDate value="${salary.empJncmpYmd}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>`;
//					console.log("aa",aa);
//					
//					  var empJncmpYmd =`<fmt:formatDate value="${aa}" pattern="yyyy-MM-dd"/>`
//					console.log("empJncmpYmd", empJncmpYmd);
					
//					<td><fmt:formatNumber value="${salary.empPaymentAmnt}" pattern="###,###,###,###"/></td>

					var detail = cPath+'/emp/hrm/pay/paysilp/detail';
					console.log(detail);
					console.log(cPath);
				
					trTags += `
						<tr>
							<td>${salary['empNo'] }</td>
							<td>${salary.empNm }</td>
							<td>${salary.empJncmpYmd}</td>
							<td>${salary.empJncmpYmd }</td>
							<td>${salary.empDept }</td>
							<td>${salary.empPaymentAmnt }</td>
							<td>${salary.empDeductionAmnt }</td>
							<td>${salary.empThePay }</td>
							<td><button class="btn btn-info" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">급여</button></td>
							<td><button onclick='showPayslip()'>new</button></td>
						</tr>
					`;
				});
			}else{
				trTags = `
					<tr>
						<td colspan="7">조건에 맞는 급여 목록이 없음.</td>
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

function showPayslip(){
	window.open(cPath+"/emp/hrm/pay/payslip/detail", "member", "width=640, height=400")
}



//급여 자동계산: 해당 월의 근무기록을 확인 후 이를 바탕으로 급여를 계산
var salaryBtn= document.querySelector('#salaryBtn');
$(document).on('click', '#salaryBtn', function(e) {
	e.preventDefault();
	var $salaryBtn = $(this);
	console.log("여기", $salaryBtn);
	
	var url = $salaryBtn.data('payUrl');
	var method = $salaryBtn.data('payMethod');
	
	//location.replace(url); //동기, get방식 이동, 단순 자원요청
	//$.ajax()
});

// 급여 확정: 급여 내역이 DB에 저장
$(document).on('click', '#confirmedSalaryBtn', function(e){
	console.log('여기2',this);
	var $confirmedSalaryBtn = $(this)
	e.preventDefault();
	
	var url = $confirmedSalaryBtn.data('payUrl');
	var method = $confirmedSalaryBtn.data('payMethod');
});


$(document).on('click', '#newPay', function(e){
	e.preventDefault();
	console.log("안녕");
	location.replace(cPath+"/emp/hrm/pay/payslip/detail");
});



//document.addEventListener("DOMContentLoaded", () => {
//	
//	
//	let options ={"valueNames":["name","email","age"], "filter":{"key":"name"}, "filter2":{"key2":"age"},  "filter3":{"key3":"dept"} ,"page":5,"pagination":true}
//
//	empList3 = new List('tableExample3', options)
//	
//	let keyTarget = '';
//	let key2Target = '';
//	
////	var listFilter = document.querySelector('[data-list-filter]');
//	var listFilter = document.querySelector('#myname');
//	var key = options.filter.key;
//	listFilter.addEventListener("change", function(e){
//
//		empList3.filter(function(item){
//			keyTarget = e.target.value;
//			if(!(item.values()[key2].toLowerCase().includes(key2Target.toLowerCase()))) return false;
//              if (e.target.value === '') {
//                return true;
//              }
//
//
//              return item.values()[key].toLowerCase().includes(e.target.value.toLowerCase());
//            });			
//		})
//		
//	
//	
//	var listFilter2 = document.querySelector('#myage');
//	var key2 = options.filter2.key2;
//	listFilter2.addEventListener("change", function(e){
//
//		var filterValue2 = listFilter2.value;
//		
//		empList3.filter(function(item){
////			console.log("item",item);
////			console.log("item",item.values()[key]);
////			console.log("item",item.values()[key2]);
////			console.log("item",item.values());
//			key2Target = e.target.value;
//			if(!(item.values()[key].toLowerCase().includes(keyTarget.toLowerCase()))) return false;
//			
//              if (e.target.value === '') {  //n월이 아니라 ''이면 전체 달을 의미하므로 전부 true처리
//                return true;
//              }
//              return item.values()[key2].toLowerCase().includes(e.target.value.toLowerCase());
//            });			
//		})	
//		
////	$("#submitForm").submit();
//});
