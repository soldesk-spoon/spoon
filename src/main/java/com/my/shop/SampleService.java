package com.my.shop;

import java.util.List;
import java.util.Map;

public interface SampleService {
	List<BoardBean> selectBoardList(BoardBean boardBean) throws Exception;
	
	void insertBoard(BoardBean boardBean) throws Exception;
	
	BoardBean selectBoardDetail(BoardBean boardBean) throws Exception;

}
