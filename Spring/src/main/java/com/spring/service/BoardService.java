package com.spring.service;

import java.util.List;

import com.spring.domain.BoardAttachVO;
import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

public interface BoardService {
	public void register(BoardVO boadrd);
	public BoardVO get(Long bno);
	public boolean modify(BoardVO board);
	public boolean remove(Long bno);
	public List<BoardVO> getListWithSearch(Criteria cri);
	public List<BoardVO> getList();
	public int getTotal(Criteria cri);
	public List<BoardAttachVO> getAttachList(Long bno);
	
}
