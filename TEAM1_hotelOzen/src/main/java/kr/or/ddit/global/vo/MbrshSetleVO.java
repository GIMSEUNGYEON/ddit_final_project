package kr.or.ddit.global.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class MbrshSetleVO {
	
	private String mbsNo;
	private String cstNo;
	private String mbsGrdCd;
	private LocalDate mbsSbscrbYmd;
	private LocalDate mbsExprtYmd;
	
	private MberVO mber;
}
