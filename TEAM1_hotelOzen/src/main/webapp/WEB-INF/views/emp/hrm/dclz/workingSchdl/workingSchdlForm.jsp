<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags"  prefix="spring"%>

<link href="${pageContext.request.contextPath }/resources/vendors/dropzone/dropzone.min.css" rel="stylesheet" />
<script src="vendors/dropzone/dropzone.min.js"></script>
<style>
#schdl{
  width:22px;
  height:22px;
  font-size:20px;
}


/* .input-file-button{ */
/*   padding: 6px 25px; */
/*   background-color:#FF6600; */
/*   border-radius: 4px; */
/*   color: white; */
/*   cursor: pointer; */
/* } */

#workingSchdl { 
 	display:none; 
 } 


</style>

<script>

document.getElementById('workingSchdl').addEventListener('change', function(){
	var filename = document.getElementById('fileName');
	if(this.files[0] == undefined){
		filename.innerText = '선택된 파일없음';
		return;
	}
	filename.innerText = this.files[0].name;
});

</script>

<div class="card mb-3">
<div class="raw">
<div class="card-header">
<h4>근무일정입력페이지</h4>

<button class="btn btn-primary">수정</button>
<button class="btn btn-primary">저장</button>
<button class="btn btn-primary">취소</button>

<input type="file" name="file" id="workingSchdl">
<label for="workingSchdl" class="btn fileBtn">근무일정표(엑셀)</label>
<span id="fileName">선택된 파일없음</span>

<div class="mb-3 col-lg-3">
  <label class="form-label" for="customFile">File input example</label>
  <input class="form-control" id="customFile" type="file" />
</div>


</div>
</div>


<div class="table-responsive scrollbar">
  <table class="table table-hover table-striped overflow-hidden">
    <thead class="bg-light">
      <tr>
        <th class="align-middle text-nowrap" scope="col" rowspan="2" >번호</th>
        <th class="align-middle text-nowrap" scope="col-auto" rowspan="2">성명</th>
        <th class="align-middle text-nowrap" scope="col-auto" rowspan="2">부서</th>
        <th class="align-middle text-nowrap" scope="col-auto" rowspan="2">전화번호</th>
        	<th class="align-middle text-center" scope="col-auto" colspan="31">1월</th>
        
        <th class="align-middle text-nowrap" class="align-middle" scope="col-auto" rowspan="2">상태</th>
        <th class="align-middle text-nowrap" class="align-middle" scope="col-auto" colspan="4">상태</th>
        <th class="align-middle text-nowrap" scope="col-auto" rowspan="2">Amount</th>
      </tr>
      <tr>
      <c:forEach var="i" begin="1" end="31">
      	<th scope="col-auto">${i}</th>
      </c:forEach>
      	<th scope="col-auto">D</th>
      	<th scope="col-auto">E</th>
      	<th scope="col-auto">N</th>
      	<th scope="col-auto">O</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="i" begin="1" end="10">
      <tr class="align-middle">
      <td class="text-nowrap">${i}</td>
        <td class="text-nowrap">김은대</td>
        <td class="text-nowrap">프론트오피스부</td>
        <td class="text-nowrap">010-0000-0000</td>
        <c:forEach var="i" begin="1" end="31">
        <td class="text-nowrap"><input id="schdl" value="D"/></td>
        </c:forEach>
        <td><span class="badge badge rounded-pill d-block p-2 badge-soft-success">Completed<span class="ms-1 fas fa-check" data-fa-transform="shrink-2"></span></span>
        </td>
        <td class="text-end">$99</td>
      </tr>
     </c:forEach>
     
    </tbody>
  </table>
</div>

</div>