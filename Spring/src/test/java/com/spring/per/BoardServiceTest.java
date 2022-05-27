package com.spring.per;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.config.RootConfig;
import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.service.BoardServiceImpl;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes= {RootConfig.class})
@Log4j
//@AllArgsConstructor -->  실행안됨 : test에서는 setter 어노테이션 사용해야 함.
public class BoardServiceTest {
	@Setter(onMethod_= {@Autowired})
	private BoardServiceImpl service;
	
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
		board.setTitle("새글새글from Service");
		board.setContent("새 내용 새 내용 from Service");
		board.setWriter("newbie");
		service.register(board);
		log.info("생성된 게시물의 번호 : " + board.getBno());
	}
	
	@Test
	public void testGet() {
		log.info(service.get(6l).getTitle());
	}
	
	@Test
	public void testDelete() {
		log.info("Remove Result: " + service.remove(6L));
	}
	
	@Test
	public void testUpdate() {
		BoardVO board = service.get(6L);
		if(board == null) {return;}
			board.setTitle("제목수정 from Service");
			log.info("Modify Result : " + service.modify(board));
	}
}
