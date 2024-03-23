package kr.or.ddit.mybatis.mappers;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.global.vo.AnnualVO;
import kr.or.ddit.global.vo.HrmAnnualVO;
@Mapper
public interface HrmYrycMapper extends AbstractCommonMapper<HrmAnnualVO, String>{
	
	public String selectAnlLeaUseNo();
	public String selectAnlReciverEmpNo(String empNo);
	public int updateOfSender(AnnualVO annual);
	public int updateOfReceiver(AnnualVO annual);
	public int insert(AnnualVO annual);
	
}
