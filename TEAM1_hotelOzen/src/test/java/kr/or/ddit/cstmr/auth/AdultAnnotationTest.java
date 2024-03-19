package kr.or.ddit.cstmr.auth;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
class AdultAnnotationTest {

	@Test
	void test() {
		LocalDate currentDate = LocalDate.now();
		LocalDate testDate = LocalDate.of(2005, 4, 1);
		
		boolean test = currentDate.minusYears(19).isAfter(testDate);
		log.info("{}", test);
	}

}
