package kr.or.ddit.cstmr.auth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CstmrAuthLoginController {
	@GetMapping("/auth/Login.do")
	public String loginPage() {
		return "cstmr/auth/login";
	}

}