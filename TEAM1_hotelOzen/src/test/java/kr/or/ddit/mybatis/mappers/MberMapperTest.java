package kr.or.ddit.mybatis.mappers;

import static org.junit.jupiter.api.Assertions.*;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;
import kr.or.ddit.global.vo.MberVO;
import kr.or.ddit.global.vo.RegistVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class MberMapperTest extends AbstractRootContextTest {

	@Inject
	private MberMapper dao;
	
	@Test
	public void selectTest() {
		log.info("{}", dao);
		MberVO vo = dao.select("M1800005");
		assertNotNull(vo);
		log.info("{}", vo);
	}

	@Test
	public void selectTotalRecordTest() {
		log.info("{}", dao.selectList());
		
	}
	
	@Test
	public void selectusernameTest() {
		MberVO mber = dao.selectMberByUserName("sujin06@hanmail.net");
		log.info("{}", mber);
	}
	
	@Test
	public void insertTest() {
		String newCstNo = dao.selectNewCstNo();
		log.info("{}", newCstNo);
		
		RegistVO newMber = new RegistVO();
		
		newMber.setCstNo(newCstNo);
		newMber.setCstNm(newCstNo);
		newMber.setCstHp(newCstNo);
		newMber.setMberId(newCstNo);
		newMber.setMberPw(newCstNo);
		newMber.setMberAddr(newCstNo);
		
		dao.insertMber(newMber);
	}
	
	@Test
	public void selectByNameAndHp() {
		RegistVO newMber = new RegistVO();
		newMber.setCstNm("김춘자");
		newMber.setCstHp("010-4377-3580");
		
		dao.findMberUser(newMber);
	}
	
	@Test
	void test3() {
		MberVO mber = dao.selectMypage("M1800026");
		log.info("{}", mber);
	}

	@Test
	void test4() {
		MberVO mber = dao.selectCouponCnt("M2400039");
		log.info("{}", mber);
	}
	
	@Test
	void test5() {
		dao.deletePrivacy();
	}
}
