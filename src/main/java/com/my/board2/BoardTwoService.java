package com.my.board2;

import java.util.List;
import java.util.Map;

public interface BoardTwoService {
	List<BoardBean2> selectBoardList(BoardBean2 boardBean) throws Exception;
	
	void insertBoard(BoardBean2 boardBean) throws Exception;
	
	Map<String, Object> selectBoardDetail(int qid) throws Exception;

	void updateBoard(BoardBean2 boardBean) throws Exception;
	
	void deleteBoard(int qid) throws Exception;

	String selectAdmin(int mid) throws Exception;

	List<BoardBean2> selectBoardListForAdmin(BoardBean2 boardBean) throws Exception;

	Map<String, Object> selectAnswerBoard(int qid) throws Exception;

	void insertAnswer(AnswerBean answerBean) throws Exception;
}
