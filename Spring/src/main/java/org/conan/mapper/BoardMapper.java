package org.conan.mapper;

import java.util.List;
//import org.apache.ibatis.annotations.Select;
import org.conan.domain.BoardVO;

public interface BoardMapper {
   //@Select("select * from tbl_board where bno > 0")
   public List<BoardVO> getList();
   
   public void insert(BoardVO board);
   
   public void insertSelectkey(BoardVO board);

   public BoardVO read(long l);

   public int delete(long l);

   public int update(BoardVO board);


}