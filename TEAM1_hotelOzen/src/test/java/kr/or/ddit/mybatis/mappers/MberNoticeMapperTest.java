package kr.or.ddit.mybatis.mappers;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;
import kr.or.ddit.global.common.paging.PaginationInfo;
import kr.or.ddit.global.vo.MberNoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class MberNoticeMapperTest extends AbstractRootContextTest{

	@Inject
	private MberNoticeMapper dao; 

	@Test
	void test() {
		PaginationInfo paging = new PaginationInfo();
		int record =  dao.selectTotalRecord(paging);
		paging.setCurrentPage(1);
		
		List<MberNoticeVO> memNotice = dao.selectList(paging);
		log.info("notice {}", memNotice);
		
		dao.select("MNT0011");
	}
	
	@Test
	void testView() {
		MberNoticeVO notice = new MberNoticeVO();
		notice.setEmpNo("E240002");
		notice.setMberNtCn("asdfgsfds");
		notice.setMberNtNm("awtf");;
		notice.setMberNtCtgry("asdfgsfds");
		int cnt = dao.insert(notice);
	}
}
