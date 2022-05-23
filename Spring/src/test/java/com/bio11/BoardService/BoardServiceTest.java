package com.bio11.BoardService;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bio11.config.RootConfig;
import com.bio11.domain.BoardVO;
import com.bio11.domain.Criteria;
import com.bio11.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes= {RootConfig.class})
@Log4j
public class BoardServiceTest {
	@Setter(onMethod_= {@Autowired})
	private BoardService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test public void testGetList() {
		service.getList().forEach(board->log.info(board));
	}
	@Test
	public void testRegister() {
		BoardVO board = new BoardVO();
		board.setTitle("NEW TITLE FROM Service");
		board.setContent("NEW CONTENT FROM Service");
		board.setWriter("NEW WRITER");
		service.register(board);
		log.info("생성된 게시물의 번호 : " + board.getBno());
	}
	@Test
	public void testGet() {
		log.info(service.get(12L).getTitle());
	}
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT" + service.remove(12L));
	}
	@Test
	public void testUpdate() {
		BoardVO board = service.get(12L);
		if(board==null) {return;} 
		board.setTitle("UpdateTITLE FROM Service");
		log.info("Update " + board);
	}
	
}
