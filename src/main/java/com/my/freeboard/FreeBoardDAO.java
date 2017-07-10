package com.my.freeboard;

import java.util.List;
import java.util.Map;
 
import org.springframework.stereotype.Repository; 
 
@Repository("freeBoardDAO")
public class FreeBoardDAO extends AbstractDAO{

    @SuppressWarnings("unchecked")
    public List<BoardBeanF> selectBoardList(BoardBeanF boardBean) throws Exception{
        return (List<BoardBeanF>)selectList("freeboard.selectBoardList", boardBean);
    }
    
    public void insertBoard(BoardBeanF boardbean) throws Exception{
        insert("freeboard.insertBoard", boardbean);
    } 
    
    public void updateHitCnt(int bid) throws Exception{
        update("freeboard.updateHitCnt", bid);
    }
     
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectBoardDetail(int bid) throws Exception{
        return (Map<String, Object>) selectOne("freeboard.selectBoardDetail", bid);
    }
    
    public void updateBoard(BoardBeanF boardBean) throws Exception{
        update("freeboard.updateBoard", boardBean);
    }
    
    public void deleteBoard(int bid) throws Exception{
    	delete("freeboard.deleteBoard", bid);
    } 
}