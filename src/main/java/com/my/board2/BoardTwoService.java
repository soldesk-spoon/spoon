package com.my.board2;

import java.util.List;
import java.util.Map;

public interface BoardTwoService {
	List<BoardBean2> selectBoardList(BoardBean2 boardBean) throws Exception;
	
	void insertBoard(BoardBean2 boardBean) throws Exception;
	
	Map<String, Object> selectBoardDetail(int bid) throws Exception;

	void updateBoard(BoardBean2 boardBean) throws Exception;
	
	void deleteBoard(int bid) throws Exception;
}
