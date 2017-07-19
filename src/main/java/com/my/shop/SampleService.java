package com.my.shop;

import java.util.List;
import java.util.Map;

public interface SampleService {
	List<BoardBean> selectBoardList(BoardBean boardBean) throws Exception;
	
	void insertBoard(BoardBean boardBean) throws Exception;
	
	Map<String, Object> selectBoardDetail(int bid) throws Exception;

	void updateBoard(BoardBean boardBean) throws Exception;
	
	void deleteBoard(int bid) throws Exception;	

	List<BoardBean> selectSubway(String string) throws Exception;

	void uploadFile(uploadFileVo uploadfilevo) throws Exception;
	
	List<CommentBean> selectComment(int bid) throws Exception;
	
	void insertComment(CommentBean commentBean) throws Exception;

	int selectBID() throws Exception;
	int selectCID() throws Exception;

	List<uploadFileVo> selectImage(int bid) throws Exception;

	List<BoardBean> selectBoardListByHit(BoardBean boardBean);

	List<BoardBean> selectBoardListByLike(BoardBean boardBean);

	void insertLike(LikeHateBean likehateBean)throws Exception;

	void deleteLike(LikeHateBean likehateBean) throws Exception;

	void insertHate(LikeHateBean likehateBean) throws Exception;

	void deleteHate(LikeHateBean likehateBean) throws Exception;

	Map<String, Object> selectLikeHate(LikeHateBean likehateBean) throws Exception;
	
}
