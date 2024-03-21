package kr.or.ddit.mybatis.mappers;

import static org.junit.jupiter.api.Assertions.*;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class MbrshSetleMapperTest extends AbstractRootContextTest {

	@Inject
	MbrshSetleMapper dao;
	
	@Test
	void test() {
		String mbsNo =  dao.selectMbsNo();
		String mbsSetleNo = dao.selectMbsSetleNo();
		log.info("{}", mbsNo);
		log.info("{}", mbsSetleNo);
		
	}
}
