package com.my.shop;

import java.util.List;
import java.util.Map;
 
import org.springframework.stereotype.Repository; 
 
@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO{
 
    @SuppressWarnings("unchecked")
    public List<BoardBean> selectBoardList(BoardBean boardBean) throws Exception{
        return (List<BoardBean>)selectList("sample.selectBoardList", boardBean);
    }
    
    public void insertBoard(BoardBean boardbean) throws Exception{
        insert("sample.insertBoard", boardbean);
    } 
    
    public void updateHitCnt(BoardBean boardbean) throws Exception{
        update("sample.updateHitCnt", boardbean);
    }
     
    @SuppressWarnings("unchecked")
    public BoardBean selectBoardDetail(BoardBean boardbean) throws Exception{
        return (BoardBean) selectOne("sample.selectBoardDetail", boardbean);
    }
}