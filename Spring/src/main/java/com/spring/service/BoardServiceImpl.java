package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.BoardAttachVO;
import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.mapper.BoardAttachMapper;
import com.spring.mapper.BoardMapper;
import com.spring.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor //생성자에 의한 주입
public class BoardServiceImpl implements BoardService{
	
	private BoardMapper mapper;
	private BoardAttachMapper attachMapper;
	private ReplyMapper replyMapper;
	
	@Transactional //처리가 필요 ->2가지 insert가 묶음으로 이루어지기 위해서 사용, 시스템상 오류로 1개만 insert 되는 경우를 방지 
	@Override
	public void register(BoardVO board) {
		log.info("register..." + board.getBno());
		mapper.insertSelectKey(board);
		if(board.getAttachList()== null || board.getAttachList().size()<=0) {
			return;
		}
		
		log.info("board.getBno()"+board.getBno());
		
		board.getAttachList().forEach(attach->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}

	//조회
	@Override
	public BoardVO get(Long bno) {
		log.info("get..." + bno);
		return mapper.read(bno);
	}
	
	@Transactional
	@Override
	public boolean modify(BoardVO board) {
		log.info("modify..." + board);
	
		//bno 따른 첨부파일 테이블 
		if(board.getAttachList()== null || board.getAttachList().size()<=0) {
			//bno에 따른 첨부파일 테이블을 모두 지운다
			attachMapper.deleteAll(board.getBno());
			return mapper.update(board) == 1;	//bno에 따른 보드 수정
		}else {
			//bno에 따른 첨부파일 테이블을 모두 지운다
			attachMapper.deleteAll(board.getBno());
			//새롭게 등록한다.
			board.getAttachList().forEach(attach->{
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
			return mapper.update(board) == 1;	//bno에 따른 보드 수정
		}


	}
	
	//삭제
	@Transactional
	@Override
	public boolean remove(Long bno) {
		log.info("remove..." + bno);
		attachMapper.deleteAll(bno);
		replyMapper.deleteByBno(bno);
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getListWithSearch(Criteria cri) {
		log.info("getListWithSearch.....");
		return mapper.getListWithSearch(cri);
	}
	
	public List<BoardVO> getList() {
		log.info("getList.....");
		return mapper.getList();
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("get Attach list by bno" + bno);
		return attachMapper.findByBno(bno);
	}
	
}
