package kr.or.ddit.mybatis.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.global.vo.MbrshGrdVO;

@Mapper
public interface MbrshMapper {
	public List<MbrshGrdVO> selectDetail(String grd);

	public List<MbrshGrdVO> selectList();

	public List<MbrshGrdVO> selectBenefit(String grd);
	
	
}
