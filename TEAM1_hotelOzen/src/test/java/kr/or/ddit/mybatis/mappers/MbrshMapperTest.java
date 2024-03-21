package kr.or.ddit.mybatis.mappers;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;
import kr.or.ddit.global.vo.CouponVO;
import kr.or.ddit.global.vo.MbrshGrdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class MbrshMapperTest extends AbstractRootContextTest {

	@Inject
	MbrshMapper dao;
	
	@Inject
	MbrshSetleMapper setleDao;
	
	@Test
	void test() {
		 List<MbrshGrdVO> mbrshList	= dao.selectList();
		 log.info("{}", mbrshList);
		 	
		 List<MbrshGrdVO> mbrshList2= dao.selectBenefit("GREEN");
		 
		 log.info("{}", mbrshList2);
	}
	
	@Test
	void test2() {
		List<CouponVO> couponList = new ArrayList<>();
		for(int i = 0; i <=1; i++) {
			CouponVO coupon = new CouponVO();
			coupon.setCpnNo("000"+i);
			coupon.setCpnkNo("CPN001");
			coupon.setCstNo("M1111111");
			coupon.setCpnIssuYmd(LocalDate.now());
			coupon.setCpnExprtYmd(LocalDate.now());		
			couponList.add(coupon);
		}
		setleDao.insertCoupon(couponList);
	}
	
	@Test
	void test3() {
		setleDao.insertMileage("M1111111", 0);
	}
}
