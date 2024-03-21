package kr.or.ddit.mybatis.mappers;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;
import kr.or.ddit.global.vo.MbrshGrdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class MbrshMapperTest extends AbstractRootContextTest {

	@Inject
	MbrshMapper dao;
	
	@Test
	void test() {
		 List<MbrshGrdVO> mbrshList	= dao.selectList();
		 log.info("{}", mbrshList);
		 	
		 List<MbrshGrdVO> mbrshList2= dao.selectBenefit("GREEN");
		 
		 log.info("{}", mbrshList2);
	}
}
