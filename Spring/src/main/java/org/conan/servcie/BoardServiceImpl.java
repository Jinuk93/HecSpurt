package org.conan.servcie;

import java.util.List;

import org.conan.domain.BoardVO;
import org.conan.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor //생성자에 의한 주입
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_= @Autowired)
	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) {
		log.info("register..." + board.getBno());
		mapper.insertSelectkey(board);
	}
	@Override
	public BoardVO get(Long bno) {
		log.info("get..." + bno);
		return mapper.read(bno);
	}
	@Override
	public boolean modify(BoardVO board) {
		log.info("modify..." + board);
		return mapper.update(board)==1;
	}
	@Override
	public boolean remove(Long bno) {
		log.info("remove..." + bno);
		return mapper.delete(bno)==1;
	}
	@Override
	public List<BoardVO> getList() {
		return null;
	}
}
