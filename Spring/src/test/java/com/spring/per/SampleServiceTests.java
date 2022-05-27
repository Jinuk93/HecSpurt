package com.spring.per;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.config.RootConfig;
import com.spring.service.SampleService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes= {RootConfig.class})
@Log4j
public class SampleServiceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private SampleService service;
	
	
	@Test
	public void testAdd() throws Exception {
		log.info(service.doAdd("123","456"));
	}
	
	@Test
	public void testAddError() throws Exception {
		log.info(service.doAdd("123", "ABC"));
	}
	
}
