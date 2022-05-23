package com.bio11.mapper;

import java.util.List;

import com.bio11.domain.BoardVO;
import com.bio11.domain.Criteria;

public interface BoardMapper {
	//@Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList();
	
	public void insert(BoardVO board);

	public void insertSelectKey(BoardVO board);

	public BoardVO read(long l);

	public int delete(long l);

	public int update(BoardVO board);
	
	public int getTotalCount(Criteria cri);
	
	public List<BoardVO> getListWithSearch(Criteria cri);
}
