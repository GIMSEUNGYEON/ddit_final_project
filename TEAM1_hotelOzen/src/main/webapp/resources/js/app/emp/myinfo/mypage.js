/**
 * 
 */
const contextPath = document.body.dataset.contextPath;

document.addEventListener("DOMContentLoaded",()=>{
	empTel.addEventListener("keyup", function(e){
		convertPhoneNumber(e.target);
	});
	empHomeTel.addEventListener("keyup", function(e){
		convertPhoneNumber(e.target);
	});
});

let myInfoUpdateInfoForm = document.getElementById("myInfoUpdateInfoForm");

myInfoUpdateInfoForm.addEventListener("submit", ()=>{
	event.preventDefault();
	
	let url = myInfoUpdateInfoForm.action;
	let method = myInfoUpdateInfoForm.method;
	
	let formData = new FormData(myInfoUpdateInfoForm)
	
	fetch(url, {
		method:method,
		headers:{
			"Accept":"application/json"
		},
		body:formData
	}).then(resp=>{
		if(resp.ok){
			return resp.json();
		}else{
			throw Error("오류 발생", {cause:resp});
		}
	}).then(jsonObj=>{
		console.log(jsonObj);
		if(jsonObj['message'].includes('error')){
			Swal.fire({
				title:"정보 변경에 실패했습니다. 다시 시도해주세요!"
				, icon:"error"
			})
		}else{
			Swal.fire({
				title:"정보 변경이 완료되었습니다."
				, icon:"success"
				, confirmButtonText:"확인"
			}).then(result=>{
				if(result.isConfirmed){
					window.location.reload();
				}
			})
		}
	})
	
	return false;
});


myinfoChangePwdForm.addEventListener("submit", ()=>{
	event.preventDefault();
	if(newPwd.value != newPwdChk.value){
		dismatch.style.display = "block";
	}else {
		
		let url = myinfoChangePwdForm.action;
		let method = myinfoChangePwdForm.method;
		
		let formData = new FormData(myinfoChangePwdForm);
		let jsonData = {};
		
		formData.forEach((value, key)=>{
			jsonData[key] = value;
		})
		console.log(jsonData);
		
		fetch(url,{
			method:method,
			headers:{
				"Content-Type":"application/json",
				"Accept":"application/json"
			},
			body:JSON.stringify(jsonData)
		}).then(resp=>{
			if(resp.ok){
				return resp.json();
			}else{
				throw new Error("오류 발생", {cause:resp})
			}
		}).then(jsonObj=>{
			console.log(jsonObj);
			if(jsonObj['message'].includes("error")){
				let errorMessage = jsonObj['errorMessage']
				errorMessageField.innerHTML = errorMessage;
				
			} else if(jsonObj['message'].includes("ok")){
				Swal.fire({
					title:"비밀번호 변경이 완료되었습니다",
					icon:"success"
				})
				empPw.value = "";
				newPwd.value = "";
				newPwdChk.value = "";
			}
		})
	}
	
	return false;
});


function proflDelete(){
	console.log(empNo.value)
	console.log(contextPath+"/emp/myInfo/deleteProfl.do")
	let url = contextPath+"/emp/myInfo/deleteProfl.do";
	let jsonData = {
		'empNo':empNo.value
	}
	fetch(url, {
		method:"post",
		headers:{
			"Content-Type":"application/json",
			"Accept":"application/json"
		},
		body:JSON.stringify(jsonData)
	}).then(resp=>{
		if(resp.ok){
			return resp.json();
		}else{
			throw new Error("오류 발생", {cause:resp})
		}
	}).then(jsonObj=>{
		if(jsonObj['message'].includes("ok")){
			currentProfl.src = contextPath+'/resources/empProf/basic.png'
		}
	})
	
}