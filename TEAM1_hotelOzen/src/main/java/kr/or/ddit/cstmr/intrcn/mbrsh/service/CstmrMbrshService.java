package kr.or.ddit.cstmr.intrcn.mbrsh.service;

import java.util.List;

import kr.or.ddit.global.vo.MbrshGrdVO;

public interface CstmrMbrshService {

	public List<MbrshGrdVO> retrieveMbrsh(String mbrshCd);

	public List<MbrshGrdVO> retrieveMbrshList();
	
	

}
