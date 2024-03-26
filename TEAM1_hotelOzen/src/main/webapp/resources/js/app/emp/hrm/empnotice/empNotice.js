/**
 * 
 */


const cPath = document.body.dataset.contextPath;


$("select[name=selectOneSearchWord]").on("change", function(event){
	event.preventDefault();
	console.log(event);
	var selected = $("select[name=selectOneSearchWord]").val();
	console.log(selected);
//	$("#selectOneSearchWord").val(selected);
	$("#selectBtn").click();
//	$("#selectOneSearchWord").val();
	return false;
	
})


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
			
			let dataList = jsonObj.empNoticeList;
			let pagingHTML = jsonObj.pagingHTML;
			
			let trTags = null;
			
			if(dataList.length > 0){
				$.each(dataList, function(index, empNt){
					var att = '<span class="text-700 fs-8 bi-files"></span>';
					console.log("첨부파일이...??",empNt.atchList[0].atcEmpFileNm);
					if(empNt.atchList[0].atcEmpFileNm==null)
						att = '-';
						
					
					console.log("이름",empNt.hrmEmp.empNm);
					trTags += `
						<tr>
							<td>${empNt.rnum }</td>
							<td>${empNt.empNtClassification }</td>
							<td><a href="${cPath}/emp/hrm/empnotice/${empNt.empNtNo}" onclick='fnShowOne()'>${empNt.empNtNm }</a></td>
							<td><a href="${cPath}/emp/pbl/emply/view" onclick='fnShowOne()'>${empNt.hrmEmp.empNm }</a></td>
							<td>${empNt.empNtYmd }</td>
							<td>${att}</td>
							<td>${empNt.empNtCnt }</td>
						</tr>
					`;
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


let delUrl = null;

//새 공지 등록 비동기 이동
function fnMakeEmpNotice() {

	console.log("여기입니다.", `\${cPath}`); //jsp스크립트에서 바로 jquery를 사용하고 있다면  \사용해야 할 수 있다.
	console.log("여기입니다.", cPath); 
//	var url = `\${cPath}/emp/hrm/empnotice/insert`
	var url = `${cPath}/emp/hrm/empnotice/insert`
// 	console.log(url);
	fetch(url, {method:"get", headers:{ "accept": "text/html"}})
	.then(resp=>{
		if(resp.ok){
			console.log("fetch로부터 온 응답: ",resp)
			//console.log("resp.text()",resp.text());
			return resp.text();
		}else{
			throw new Error(`상태코드 ${resp.status} 수신`, {cause:resp});
		}
	}).then(html=>{
		
		
		fragment = document.createRange().createContextualFragment(html);
        var partialHtml = fragment.querySelector('#getThis');
        var target = document.getElementById('target');

        
        target.innerHTML = ""; 
        target.appendChild(partialHtml.cloneNode(true)); 
        
        tinymce.init({
			selector: '.tinymce',
			setup: function (editor) {
		        editor.on('change', function () {
		            tinymce.triggerSave();
		        })
		    }
				
// 			width: 600,
			, height: 300,
			plugins: [
			  'advlist autolink link image lists charmap print preview hr anchor pagebreak',
			  'searchreplace wordcount visualblocks code fullscreen insertdatetime media nonbreaking',
			  'table emoticons template paste help'
			],
			toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | ' +
			  'bullist numlist outdent indent | link image | print preview media fullscreen | ' +
			  'forecolor backcolor emoticons | help',
			menu: {
			  favs: {title: 'My Favorites', items: 'code visualaid | searchreplace | emoticons'}
			},
			menubar: 'favs file edit view insert format tools table help',
 	  		content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
           	
          });
		
        var optional_config = {
        		dateFormat: "Y/m/d",
        }
        
        $(".datetimepicker").flatpickr(optional_config);


		var tiny = document.querySelector(".tinymce");
		console.log("tiny", tiny);

		if(!insertBtn) {	
			insertBtn = document.getElementById("insertBtn");
			console.log("insertBtn", insertBtn);
			
		}
		fnInsert(insertBtn);
        
	}).catch(err=>console.error(err));	
	
}



//새 공지 등록
//var insertBtn = null;
//
function fnInsert(insertBtn){
	
	$('#insertBtn').on("click", function(){
	console.log("등록하기 버튼을 눌렀을 때",event);
	event.preventDefault();
	
	let form = document.getElementById("insertForm");
	console.log(form.action);
	
	//	console.log("form");
	let url = form.action;
	console.log(url);
	url = `${cPath}/emp/hrm/empnotice`
	console.log("url",  "변경한 url");
	let method = form.method;
	console.log(method);
	
	//tinyMCE.triggerSave();
	//let data = $(form).serialize(); //직렬화하면 파일은 그냥 이름만 가게 되는..??  formData를 써야 한다.
	//form.submit();
	
	
	
//	let data = formToObject(form);
//	
//	console.log("data", data);
//	
//	let body = JSON.stringify(data); 
//	console.log("body", body);
//	
	let formData = new FormData(form);
	console.log(formData);
	
//	console.log(data);
//
	$.ajax({
		url:url
		, method:method
		, data : formData
		, dataType : "json"
		, contentType: false
		, processData: false
		, success:function(jsonObj){
			console.log("jsonObj---------",jsonObj);
			location.replace(cPath+"/emp/hrm/empnotice");
			//location.href = cPath+"/emp/hrm/empnotice/"+jsonObj.empNt.empNtNo;
		}, error : function(jqXHR, txt, status){
			console.log("에러.")
			console.log(txt, status, jqXHR);
		}
	}).done(()=>{
		form.page.value="";
	});
	return false;
	
});
	
}
	

	
//}







//공지 또는 직원 단건 조회 비동기
function fnShowOne() {
	console.log("a.", `\${cPath}`); //jsp에서 스크립트를 쓰고, 제이쿼리를 동시에 사용하면 \사용해야 한다
	
// 	console.log(event);
	event.preventDefault();
	var aTag = event.target;
	var url = aTag.href;
	delUrl = aTag.href;
	console.log("url:",url);
	fetch(url, {method:"get", headers:{ "accept": "text/html"}})
	.then(resp=>{
		if(resp.ok){
			return resp.text();
		}else{
			throw new Error(`상태코드 ${resp.status} 수신`, {cause:resp});
		}
	}).then(html=>{
		fragment = document.createRange().createContextualFragment(html);
		console.log("fragment",fragment );
        var partialHtml = fragment.querySelector('#getThis');
		console.log("단건 조회",partialHtml );
        var target = document.getElementById('target');
       
        var originalgetThis = document.getElementById('getThis');
        
        target.innerHTML = ""; 
        target.appendChild(partialHtml.cloneNode(true)); 

	}).catch(err=>console.error(err));	
	
	
//	function fnDelete() {
//		console.log("여fgfgfg기",this)
//
//		var url = window.location.href;
//		console.log(url);
//		fetch(url, {method:"delete"})
//		.then(resp=>{
//			if(resp.ok){
//				return resp.text();
//			}else{
//				throw new Error(`상태코드 ${resp.status} 수신`, {cause:resp});
//			}
//		}).then(html=>{
//			
//
//		}).catch(err=>console.error(err));	
//	}
	
}


function fnDelete(){
	var empNtNo = $(delBtn).data('empNtNo');
	console.log(empNtNo);
	//$("#delCheck").show();
//	var deleteYn = confirm("정말로 삭제하시겠습니까?");
//	if(!deleteYn) return false;

	Swal.fire({
	   title: '정말로 그렇게 하시겠습니까?',
	   text: '다시 되돌릴 수 없습니다. 신중하세요.',
	   icon: 'warning',
	   
	   showCancelButton: true, 
	   confirmButtonColor: '#3085d6', 
	   cancelButtonColor: '#d33', 
	   confirmButtonText: '승인', 
	   cancelButtonText: '취소', 
	   
	   reverseButtons: true, 
	   
	}).then(result => {
	   
	   if (result.isConfirmed) { 
	     
			var url = delUrl;
			console.log(url);

		fetch(url, {method:"delete"})
		.then(resp=>{
			Swal.fire({
				  title :'공지 삭제가 완료 되었습니다.',         
				  icon:'success',                         
				}).then(result=> {
	 				location.replace(cPath+`/emp/hrm/empnotice/`);
				});
			if(resp.ok){
				
				console.log("여기2");
				return resp.text();
			}else{
				throw new Error(`상태코드 ${resp.status} 수신`, {cause:resp});
			}
		}).then(html=>{
			
	
		}).catch(err=>console.error(err));	

	   }
	});

}


function fnGoList(){
	var url = cPath+`/emp/hrm/empnotice`
	fetch(url, {method: "get"})
	.then(resp=>{
		if(resp.ok){
			console.log("여기2");
			return resp.text();
		}else{
			throw new Error(`상태코드 ${resp.status} 수신`, {cause:resp});
		}
	}).then(html=>{
		console.log(html);
		location.replace(url);
	
	}).catch(err=>console.error(err));	
	
} 

const formToObject = (form)=>{
	let data = {};
	
	let formData = new FormData(form);
	
	for(let n of formData.keys()){
		data[n] = formData.get(n);
	}
	
	return data;
};


//수정 폼 보여주기
function fnUpdate() {
	var url=cPath+'/emp/hrm/empnotice/update';
	
	//location.replace(url);
	fetch(url, {method:"get", headers:{ "accept": "text/html"}})
	.then(resp=>{
		if(resp.ok){
			return resp.text();
		}else{
			throw new Error(`상태코드 ${resp.status} 수신`, {cause:resp});
		}
	}).then(html=>{
		fragment = document.createRange().createContextualFragment(html);
		console.log("fragment",fragment );
        var partialHtml = fragment.querySelector('#getThis');
		console.log("edit",partialHtml );
        var target = document.getElementById('target');
       
        var originalgetThis = document.getElementById('getThis');
        
        target.innerHTML = ""; 
        target.appendChild(partialHtml.cloneNode(true)); 

		 tinymce.init({
			selector: '.tinymce',
			setup: function (editor) {
		        editor.on('change', function () {
		            tinymce.triggerSave();
		        })
		    }
				
// 			width: 600,
			, height: 300,
			plugins: [
			  'advlist autolink link image lists charmap print preview hr anchor pagebreak',
			  'searchreplace wordcount visualblocks code fullscreen insertdatetime media nonbreaking',
			  'table emoticons template paste help'
			],
			toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | ' +
			  'bullist numlist outdent indent | link image | print preview media fullscreen | ' +
			  'forecolor backcolor emoticons | help',
			menu: {
			  favs: {title: 'My Favorites', items: 'code visualaid | searchreplace | emoticons'}
			},
			menubar: 'favs file edit view insert format tools table help',
 	  		content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
           	
          });
		
		var tiny = document.querySelector(".tinymce");
		console.log("tiny", tiny);

		if(!updateBtn) {	
			updateBtn = document.getElementById("updateBtn");
			console.log("updateBtn", updateBtn);
			
		}
		fnEdit(updateBtn);

	}).catch(err=>console.error(err));
}

function fnEdit() {
 	var updateBtn =  document.querySelector("#updateBtn");
	if(updateBtn!=event.target) return false;
	
	
}




// function fnCommFetch(url, options, fnResolve){
// 	fetch(url, options)
// 		.then(resp=>{
// 			if(resp.ok){
// 				return resp.json();
// 			}else{
// 				throw new Error(`상태코드 ${resp.status} 수신`, {cause:resp});
// 			}
// 		}).then(fnResolve)
// 		  .catch(err=>console.error(err));	
// }