package kr.or.ddit.global.vo;

import java.time.LocalDate;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="chkinNo")
public class ChkinVO {

	private String chkinNo;
	private String rmNo;
	private String cstNo;
	private String ciDt;
	private String ciCarNo;
	private LocalDate ciCowillYmd;
	private Integer ciTotalNmpr;
	private Integer ciAdultCnt;
	private Integer ciChildCnt;
	private String ciSetleYn;
	private String ciSetleNo;
	private String ciSeCd;
	private String ciCarKind;
	
	private CstmrVO cstmr;
	
}
