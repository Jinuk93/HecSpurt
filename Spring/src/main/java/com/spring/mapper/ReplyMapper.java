package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO reply);
	
	public ReplyVO read(Long rno);
	
	public int delete(Long rno);
	
	public int update(ReplyVO reply);

	public List<ReplyVO> getListByBno(@Param("bno") Long bno);
	//넘겨줄 데이터가 여러개일 경우 @Param을 사용해야한다.
	
	public void deleteByBno(Long bno);
}
