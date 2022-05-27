package com.spring.per;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.config.RootConfig;
import com.spring.service.SampleTxService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes= {RootConfig.class})
@Log4j
public class SampleServiceTxTest {
	@Setter(onMethod_ = @Autowired)
	private SampleTxService service;
	@Test
	public void testLong() {
		String str = "afdsfasdfjaldfjlajfdjaslkjdfalkjfllsajdfsajflajsdlfjaslfjdlasjfldksajflkja;fdjsal";
		log.info(str.getBytes().length);
		service.addData(str);
	}
}
