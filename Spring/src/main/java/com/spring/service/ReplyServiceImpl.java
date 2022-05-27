package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.ReplyVO;
import com.spring.mapper.BoardMapper;
import com.spring.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor //생성자에 의한 주입
public class ReplyServiceImpl implements ReplyService{
	
	private ReplyMapper mapper;

	@Override
	public int register(ReplyVO reply) {
		log.info("register..." + reply);
		return mapper.insert(reply);
	}

	@Override
	public ReplyVO get(Long rno) {
		log.info("get..." + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO reply) {
		log.info("modify..." + reply);
		return mapper.update(reply);
	}

	@Override
	public int remove(Long rno) {
		log.info("remove..." + rno);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getListByBno(Long bno) {
		log.info("get Reply List of a Board..." + bno);
		return mapper.getListByBno(bno);
	}

}
