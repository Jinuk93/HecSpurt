package com.spring.per;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.stream.IntStream;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.Gson;
import com.spring.config.RootConfig;
import com.spring.config.ServletConfig;
import com.spring.domain.ReplyVO;
import com.spring.domain.Ticket;
import com.spring.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration 
@ContextConfiguration(classes={RootConfig.class, ServletConfig.class})
@Log4j
public class ReplyControllerTest {
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	private MockMvc mockMvc;
	
	//@Setter(onMethod = @__({@Autowired}))
	@Setter(onMethod_ = {@Autowired})
	private ReplyMapper mapper;
	
	@Before  //모든 테스트 전에 매번 실행
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testConvert() throws Exception {
		Ticket ticket = new Ticket();
		ticket.setTno(123);
		ticket.setOwner("admin");
		ticket.setGrade("SSS");
		String jsonStr = new  Gson().toJson(ticket);
		log.info("JSON: " + jsonStr);
		mockMvc.perform(post("/rsample/ticket")
				.contentType(MediaType.APPLICATION_JSON)
				.content(jsonStr)).andExpect(status().is(200));
	}

}
