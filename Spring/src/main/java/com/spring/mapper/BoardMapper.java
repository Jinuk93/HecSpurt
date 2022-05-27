package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

public interface BoardMapper {
//	@Select("SELECT * FROM tbl_board where bno > 0")
	public List<BoardVO>getListWithSearch(Criteria cir);
	
	public List<BoardVO>getList();
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);

	public BoardVO read(long bno);
	
	public int update(BoardVO board);
	
	public int delete(long bno);
	
	public int getTotalCount(Criteria cir);
}
