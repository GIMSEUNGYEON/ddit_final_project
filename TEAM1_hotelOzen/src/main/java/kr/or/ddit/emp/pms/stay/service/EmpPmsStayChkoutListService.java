package kr.or.ddit.emp.pms.stay.service;

import java.util.List;

import kr.or.ddit.global.common.paging.PaginationInfo;
import kr.or.ddit.global.vo.ChkoutVO;

public interface EmpPmsStayChkoutListService {

	public List<ChkoutVO> retreieveChkoutList(PaginationInfo paging);
}
