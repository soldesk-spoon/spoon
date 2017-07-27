package com.my.board2;

import java.util.List;
import java.util.Map;
 
import javax.annotation.Resource;
 
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
 
@Service("boardTwoService")
public class BoardTwoServiceImpl implements BoardTwoService{
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="boardTwoDAO")
    private BoardTwoDAO boardTwoDAO;
     
    @Override
    public List<BoardBean2> selectBoardList(BoardBean2 boardBean) throws Exception {
        return boardTwoDAO.selectBoardList(boardBean);
    }
    
    @Override
    public void insertBoard(BoardBean2 boardbean) throws Exception {
    	boardTwoDAO.insertBoard(boardbean);
    }
    
    @Override 
    public Map<String, Object> selectBoardDetail(int qid) throws Exception {
       // boardTwoDAO.updateHitCnt(boardBean);
    	boardTwoDAO.updateHitCnt(qid);
        Map<String, Object> resultMap = (Map<String, Object>) boardTwoDAO.selectBoardDetail(qid);
        return resultMap;
    }
    
    @Override
    public void updateBoard(BoardBean2 boardBean) throws Exception{
    	boardTwoDAO.updateBoard(boardBean);
    }
    
    @Override
    public void deleteBoard(int qid) throws Exception{
    	boardTwoDAO.deleteBoard(qid);
    }

	@Override
	public String selectAdmin(int mid) throws Exception {
		// TODO Auto-generated method stub
		String admin = boardTwoDAO.selectAdmin(mid);
		return admin;
	}

	@Override
	public List<BoardBean2> selectBoardListForAdmin(BoardBean2 boardBean) throws Exception {
		// TODO Auto-generated method stub
		 return boardTwoDAO.selectBoardListForAdmin(boardBean);
	}

	@Override
	public Map<String, Object> selectAnswerBoard(int qid) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = (Map<String, Object>) boardTwoDAO.selectAnswerBoard(qid);
		 return resultMap;
	}

	@Override
	public void insertAnswer(AnswerBean answerBean) throws Exception {
		// TODO Auto-generated method stub
		boardTwoDAO.insertAnswer(answerBean);
	}
}