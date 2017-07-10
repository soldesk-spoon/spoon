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
    public Map<String, Object> selectBoardDetail(int bid) throws Exception {
       // boardTwoDAO.updateHitCnt(boardBean);
    	boardTwoDAO.updateHitCnt(bid);
        Map<String, Object> resultMap = (Map<String, Object>) boardTwoDAO.selectBoardDetail(bid);
        return resultMap;
    }
    
    @Override
    public void updateBoard(BoardBean2 boardBean) throws Exception{
    	boardTwoDAO.updateBoard(boardBean);
    }
    
    @Override
    public void deleteBoard(int bid) throws Exception{
    	boardTwoDAO.deleteBoard(bid);
    }
}