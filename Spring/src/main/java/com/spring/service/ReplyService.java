package com.spring.service;

import java.util.List;

import com.spring.domain.ReplyVO;

public interface ReplyService {
	public int register(ReplyVO reply);
	public ReplyVO get(Long rno);
	public int modify(ReplyVO reply);
	public int remove(Long rno);
	public List<ReplyVO> getListByBno(Long bno);
}
