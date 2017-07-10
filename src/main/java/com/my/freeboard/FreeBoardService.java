package com.my.freeboard;

import java.util.List;
import java.util.Map;

public interface FreeBoardService {
	List<BoardBeanF> selectBoardList(BoardBeanF boardBean) throws Exception;
	
	void insertBoard(BoardBeanF boardBean) throws Exception;
	
	Map<String, Object> selectBoardDetail(int bid) throws Exception;

	void updateBoard(BoardBeanF boardBean) throws Exception;
	
	void deleteBoard(int bid) throws Exception;
}
