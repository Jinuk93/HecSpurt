package com.bio11.mapper;

import java.util.List;

//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import com.bio11.config.RootConfig;
//import com.bio11.domain.BoardVO;
//
//import lombok.Setter;
//import lombok.extern.log4j.Log4j;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(classes= {RootConfig.class})
//@Log4j
//
//public class BoardMapperTest {
//	@Setter(onMethod_ = {@Autowired})
//	private BoardMapper mapper;
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(board -> log.info(board));
//	}
//	public void testInsert() {
//		BoardVO board = new BoardVO();
//		board.setTitle("새로작성");
//		board.setContent("New Content :)");
//		board.setWriter("New writer");
//		mapper.insert(board);
//		log.info(board);
//	}
//}

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bio11.config.RootConfig;
import com.bio11.domain.BoardVO;
import com.bio11.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes= {RootConfig.class})
@Log4j
public class BoardMapperTest {
	//@Setter(onMethod = @__({@Autowired}))
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper mapper;
	
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(board-> log.info(board));//람다식
	}
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		mapper.insert(board);
		log.info(board);
	}
	
	@Test
	public void testInsertket() {
		BoardVO board = new BoardVO();
		board.setTitle("새글 selectKey");
		board.setContent("새글 selectKey");
		board.setWriter("new writer");
		mapper.insertSelectKey(board);
		log.info(board);
	}
	
	@Test
	public void testRead() {
		BoardVO board = mapper.read(7L);
		log.info(board);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT:" + mapper.delete(7L));
	}
	
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setBno(8L);
		board.setTitle("수정한 제목");
		board.setContent("Update content");
		board.setWriter("Update wr");
		int count = mapper.update(board);
		log.info("UPDATE COUNT: " + count);	
	}
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("명탐정");
		cri.setType("TC");
		List<BoardVO> list = mapper.getListWithSearch(cri);
		list.forEach(board -> log.info(board));
	}
}








