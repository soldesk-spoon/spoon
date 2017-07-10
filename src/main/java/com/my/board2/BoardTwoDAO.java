package com.my.board2;

import java.util.List;
import java.util.Map;
 
import org.springframework.stereotype.Repository; 
 
@Repository("boardTwoDAO")
public class BoardTwoDAO extends AbstractDAO{

    @SuppressWarnings("unchecked")
    public List<BoardBean2> selectBoardList(BoardBean2 boardBean) throws Exception{
        return (List<BoardBean2>)selectList("boardTwo.selectBoardList", boardBean);
    }
    
    public void insertBoard(BoardBean2 boardbean) throws Exception{
        insert("boardTwo.insertBoard", boardbean);
    } 
    
    public void updateHitCnt(int qid) throws Exception{
        update("boardTwo.updateHitCnt", qid);
    }
     
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectBoardDetail(int qid) throws Exception{
        return (Map<String, Object>) selectOne("boardTwo.selectBoardDetail", qid);
    }
    
    public void updateBoard(BoardBean2 boardBean) throws Exception{
        update("boardTwo.updateBoard", boardBean);
    }
    
    public void deleteBoard(int qid) throws Exception{
    	delete("boardTwo.deleteBoard", qid);
    } 
}