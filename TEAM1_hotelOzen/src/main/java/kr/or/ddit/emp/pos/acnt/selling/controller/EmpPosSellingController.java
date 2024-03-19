package kr.or.ddit.emp.pos.acnt.selling.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/emp/pos/acnt/selling")
public class EmpPosSellingController {

	@GetMapping
	public String sellingList() {
		return "emp/pos/acnt/selling/sellingList";
	}
	
	@GetMapping("{cd}") //view로 사용하면 데이터 가져올 키는?
	public String sellingView(
		@PathVariable String cd
		) {
		return "emp/pos/acnt/selling/sellingView";
	}
}
