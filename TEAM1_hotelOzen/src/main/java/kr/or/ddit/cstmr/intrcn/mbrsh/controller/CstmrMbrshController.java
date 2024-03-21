package kr.or.ddit.cstmr.intrcn.mbrsh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.cstmr.intrcn.mbrsh.service.CstmrMbrshService;
import kr.or.ddit.global.vo.MbrshGrdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mbrsh")
public class CstmrMbrshController {
	
	@Inject
	CstmrMbrshService service;
	
	@GetMapping
	public String mbrshList(
		Model model
	) {
		
	    List<MbrshGrdVO> mbrshList = service.retrieveMbrshList();
		
	    model.addAttribute("mbrshList", mbrshList);
	    
		return "cstmr/intrcn/mbrsh/mbrshList";
	}
	
	
	@GetMapping("{mbsGrdCd}")
	public String mbrshView(
		@PathVariable String mbsGrdCd
		, Model model
	) {
		
		log.info("=========>>>>>>>>>>>>>> {}", mbsGrdCd);
		
		List<MbrshGrdVO> mbsGrdList = service.retrieveMbrsh(mbsGrdCd);
		
		model.addAttribute("mbsGrdCd", mbsGrdCd);
		model.addAttribute("mbsGrdList", mbsGrdList);
		
		return "cstmr/intrcn/mbrsh/mbrshView";
	}
	
	@GetMapping("subscribe/{mbsGrdCd}")
	public String mbrshsubscribe(
		@PathVariable String mbsGrdCd
		, Model model
	) {
		log.info("=========>>>>>>>>>>>>>> {}", mbsGrdCd);
		
		
		
		return "cstmr/intrcn/mbrsh/subscribe";
	}
}
