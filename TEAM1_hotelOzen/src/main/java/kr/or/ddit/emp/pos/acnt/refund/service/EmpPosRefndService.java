package kr.or.ddit.emp.pos.acnt.refund.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.global.common.exception.PKNotFoundException;
import kr.or.ddit.global.common.paging.PaginationInfo;
import kr.or.ddit.global.vo.RefndVO;

public interface EmpPosRefndService {
	
	/**
	 * 환불내역 상세 조회
	 * @param refndNo 조회할 환불내역의 pk
	 * @return 존재하지 않을 경우, {@link PKNotFoundException} 발생
	 */
	public RefndVO retrieveRefnd(String refndNo);
	
	/**
	 * 환불내역 목록 조회
	 * @param paging
	 * @return
	 */
	public List<RefndVO> retrieveRefndList();
	
	
	/**
	 * 환불내역 상태 수정(환불완료 경우 환불상태 변경에 사용)
	 * @param refnd
	 * @return  OK(성공), FAIL(실패)
	 */
	public ServiceResult ModifyRefnd(RefndVO refnd);
}