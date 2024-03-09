package kr.or.ddit;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Date;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base32;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class TestController {
	//OTP
	@RequestMapping(value = "/auth/otp.do")
	public String otp(
	        ModelMap model) throws Exception {
	 
	    byte[] buffer = new byte[5 + 5 * 5];
	    new Random().nextBytes(buffer);
	    Base32 codec = new Base32();
	    byte[] secretKey = Arrays.copyOf(buffer, 10);  //16자 이상이여하므로 10으로 설정 필요
	    byte[] bEncodedKey = codec.encode(secretKey);
	     
	    //인증키 생성
	    String encodedKey = new String(bEncodedKey); 
	     
	    model.addAttribute("encodedKey", encodedKey);
	 
	    return "cstmr/auth/otp";
	}
	 
	 
	//OTP 확인 컨트롤러
	@RequestMapping(value ="/adms/stat/status/list.do")
	public String statList(HttpServletRequest request, ModelMap model) throws InvalidKeyException, NoSuchAlgorithmException  {
	 
		String code = request.getParameter("code");
		long codeCheck = Integer.parseInt(code);
		String encodedKey = request.getParameter("encodedKey");
		long l = new Date().getTime();
		long ll =  l / 30000;
		 
		boolean check_code = false;
		check_code = check_code(encodedKey, codeCheck, ll);
		 
		if(!check_code) {
		    model.addAttribute("errorMsg", "코드가 일치하지 않습니다.");
		    
		    byte[] buffer = new byte[5 + 5 * 5];
		    new Random().nextBytes(buffer);
		    Base32 codec = new Base32();
		    byte[] secretKey = Arrays.copyOf(buffer, 10);
		    byte[] bEncodedKey = codec.encode(secretKey);
		     
		    //인증키 생성
		    String encodedKey2 = new String(bEncodedKey); 
		     
		    model.addAttribute("encodedKey", encodedKey2);
		    
		    return "tiles:bsite/account/login/otp";
		}
		return "tiles:adms/stat/status/list";
	}

	 
	//코드 체크 함수
	public boolean check_code(String secret, long code, long t) throws InvalidKeyException, NoSuchAlgorithmException {
	  Base32 codec = new Base32();
	  byte[] decodedKey = codec.decode(secret);
	 
	  int window = 3;
	  for (int i = -window; i <= window; ++i) {
	      long hash = verify_code(decodedKey, t + i);
	 
	      if (hash == code) {
	          return true;
	      }
	  }
	 
	  return false;
	}
	 
	//코드 확인 함수
	public int verify_code(byte[] key, long t) throws NoSuchAlgorithmException, InvalidKeyException{
	  byte[] data = new byte[8];
	  long value = t;
	  for (int i = 8; i-- > 0; value >>>= 8) {
	      data[i] = (byte) value;
	  }
	 
	  SecretKeySpec signKey = new SecretKeySpec(key, "HmacSHA1");
	  Mac mac = Mac.getInstance("HmacSHA1");
	  mac.init(signKey);
	  byte[] hash = mac.doFinal(data);
	 
	  int offset = hash[20 - 1] & 0xF;
	 
	  long truncatedHash = 0;
	  for (int i = 0; i < 4; ++i) {
	      truncatedHash <<= 8;
	      truncatedHash |= (hash[offset + i] & 0xFF);
	  }
	 
	  truncatedHash &= 0x7FFFFFFF;
	  truncatedHash %= 1000000;
	 
	  return (int) truncatedHash;
	}
}
