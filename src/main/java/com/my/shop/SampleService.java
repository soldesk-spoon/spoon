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
<<<<<<< HEAD

	void uploadFile(uploadFileVo uploadfilevo) throws Exception;
=======
	
	List<CommentBean> selectComment(int bid) throws Exception;
>>>>>>> da037f5dc34389ec2347fea5b31fa6ba71dd5c99
}
