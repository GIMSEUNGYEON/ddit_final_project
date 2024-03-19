<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link href="${pageContext.request.contextPath}/resources/css/cstmr/intrcn/mbrsh/mbrshView.css" rel="stylesheet">

<section class="${mbsGrdCd }">

	<div class="d-flex justify-content-center">
		<div class="col-md-10">
			<div class="d-flex b-class mt-6">
				<img src='<c:url value="/resources/assets/img/mbrsh/BBLUE.png"/>' class="mbrsh-card" />
				<div class="benetfitPrev">
                    <div class="benetfitPrevList">
                        <span class="tit">객실 숙박권</span>
                        <strong class="tax"><em>1</em><span class="unit type01">night</span></strong>
                        <span class="txt">스탠다드형 1매</span>
		                <button class="custom-btn btn-7 mt-4">
		                	구매
		                </button>
                    </div>
                    <div class="benetfitPrevList">
                        <span class="tit">금액 할인권</span>
                        <strong class="tax"><em>150,000</em></strong>
                        <span class="txt">객실·레스토랑 사용 가능</span>
                    </div>
                    <div class="benetfitPrevList"> 
                        <span class="tit">할인 특전</span>
                        <strong class="tax"><span class="txt">객실·레스토랑</span></strong>
                        <span class="txt">상시 할인 제공</span>
                    </div>
                </div>
			</div>
			<div class="b-class">
				<div class="d-flex second-mbrsh">
				<div class="benetfitPrev">
                    <div class="benetfitPrevList">
                        <span class="tit">객실 숙박권</span>
                        <strong class="tax"><em>1</em><span class="unit type01">night</span></strong>
                        <span class="txt">스탠다드형 1매</span>
                    </div>
                    <div class="benetfitPrevList">
                        <span class="tit">금액 할인권</span>
                        <strong class="tax"><em>150,000</em></strong>
                        <span class="txt">객실·레스토랑 사용 가능</span>
                    </div>
                    <div class="benetfitPrevList"> 
                        <span class="tit">할인 특전</span>
                        <strong class="tax"><span class="txt">객실·레스토랑</span></strong>
                        <span class="txt">상시 할인 제공</span>
		                <button class="custom-btn btn-7 mt-5">
		                	구매
		                </button>
                    </div>
                </div>				
					<img src='<c:url value="/resources/assets/img/mbrsh/LBLUE.png"/>' class="mbrsh-card" />
				</div>
			</div>
			<div class="d-flex b-class">
				<img src='<c:url value="/resources/assets/img/mbrsh/DBLUE.png"/>' class="mbrsh-card" />
				<div class="benetfitPrev">
                    <div class="benetfitPrevList">
                        <span class="tit">객실 숙박권</span>
                        <strong class="tax"><em>1</em><span class="unit type01">night</span></strong>
                        <span class="txt">스탠다드형 1매</span>
		                <button class="custom-btn btn-7 mt-4">
		                	구매
		                </button>
                    </div>
                    <div class="benetfitPrevList">
                        <span class="tit">금액 할인권</span>
                        <strong class="tax"><em>150,000</em></strong>
                        <span class="txt">객실·레스토랑 사용 가능</span>
                    </div>
                    <div class="benetfitPrevList"> 
                        <span class="tit">할인 특전</span>
                        <strong class="tax"><span class="txt">객실·레스토랑</span></strong>
                        <span class="txt">상시 할인 제공</span>
                    </div>
                </div>
			</div>
		</div>
	</div>
</section>

<script>
	
	const cPath = document.body.dataset.contextPath;

	let section = document.querySelector('section')
	
	let sectionClass = section.classList;
	
	if (sectionClass.contains('BLUE')) {
		
		section.style.backgroundColor = "#304f5f";
		
	} else if (sectionClass.contains('GREEN')) {
		
		section.style.backgroundColor = "#304f5f";
		
	} else if (sectionClass.contains('GREEN')) {
		
		section.style.backgroundColor = "#304f5f";
		
	} else if (sectionClass.contains('BLACK')) {
		
		section.style.backgroundColor = "#383840";
		
	}else{
		window.location.href = cPath + "/error/404"
	}
</script>