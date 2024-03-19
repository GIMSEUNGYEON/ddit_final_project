package kr.or.ddit.global.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "sbrsCd")
public class SbrsVO {
	private String sbrsCd;
	private Integer sbrsAdultFee;
	private String sbrsUtlztDt;
	private String sbrsUtlztDate;
	private Integer sbrsFloor;
	private String sbrsNm;
	private String sbrsUuid;
	private String sbrsFileNm;
	private Integer sbrsChildFee;
	private String sbrsDetail;
	
	private String cstNo;
	private Integer chkCnt;
	
	private RecomSbrsVO recomSbrsVO;
	private ScrapVO scrapVO;
}
