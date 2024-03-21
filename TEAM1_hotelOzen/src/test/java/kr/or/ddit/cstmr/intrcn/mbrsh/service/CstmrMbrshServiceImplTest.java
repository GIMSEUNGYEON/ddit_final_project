package kr.or.ddit.cstmr.intrcn.mbrsh.service;

import static org.junit.jupiter.api.Assertions.*;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;
import kr.or.ddit.global.vo.MberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class CstmrMbrshServiceImplTest extends AbstractRootContextTest {

	@Inject
	CstmrMbrshService service;
	
	@Test
	void test() {
		MberVO user =  service.retrieveSubscriber("M1800001");
		log.info("{}", user);
	}

}
