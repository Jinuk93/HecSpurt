package com.spring.per;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

import com.spring.config.RootConfig;
import com.spring.config.ServletConfig;
import com.spring.domain.ReplyVO;
import com.spring.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration 
@ContextConfiguration(classes={RootConfig.class, ServletConfig.class})
@Log4j
public class ReplyMapperTest {
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	//@Setter(onMethod = @__({@Autowired}))
	@Setter(onMethod_ = {@Autowired})
	private ReplyMapper mapper;
	
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	private Long[] bnoArr= {2L, 4L, 5L, 7L, 8L};
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1,10).forEach(i->{
			ReplyVO reply = new ReplyVO();
			reply.setBno(bnoArr[i%5]);
			reply.setReply("댓글 테스트" + i );
			reply.setReplyer("replyer" + i);
			mapper.insert(reply);
		});
	}
	
	@Test
	public void testRead() {
		Long targetRno = 5L;
		ReplyVO reply = mapper.read(targetRno);
		log.info(reply);
	}
	
	@Test
	public void testDelete() {
		Long targetRno = 1L;
		mapper.delete(targetRno);
	}
	
	@Test
	public void testUpdate() {
		Long targetRno = 10L;
		ReplyVO reply = mapper.read(targetRno);
		reply.setReply("UpdateReply");
		int count = mapper.update(reply);
		log.info("Update Count : " + count );
	}
	
	@Test
	public void testList() {
		List<ReplyVO> replies =
				mapper.getListByBno(bnoArr[0]);
				replies.forEach(reply->log.info(reply));
	}
}
